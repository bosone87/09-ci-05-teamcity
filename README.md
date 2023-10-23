# Домашнее задание к занятию 11 «Teamcity»

## Подготовка к выполнению

1. В Yandex Cloud создайте новый инстанс (4CPU4RAM) на основе образа `jetbrains/teamcity-server`.
**VM в Yandex Cloud разворачиваются по средствам terraform, создаётся динамический hosts-файл**

2. Дождитесь запуска teamcity, выполните первоначальную настройку.
<p align="center">
    <img width="1200 height="600" src="/i/first_setting.png">
</p>

3. Создайте ещё один инстанс (2CPU4RAM) на основе образа `jetbrains/teamcity-agent`. Пропишите к нему переменную окружения `SERVER_URL: "http://<teamcity_url>:8111"`.
4. Авторизуйте агент.
<p align="center">
    <img width="1200 height="600" src="/i/agent1.png">
</p>
<p align="center">
    <img width="1200 height="600" src="/i/agent2.png">
</p>

5. Сделайте fork [репозитория](https://github.com/aragastmatb/example-teamcity).
6. Создайте VM (2CPU4RAM) и запустите [playbook](./infrastructure).





## Основная часть

1. Создайте новый проект в teamcity на основе fork.
2. Сделайте autodetect конфигурации.
<p align="center">
    <img width="1200 height="600" src="/i/new_p.png">
</p>

3. Сохраните необходимые шаги, запустите первую сборку master.
<p align="center">
    <img width="1200 height="600" src="/i/first_build.png">
</p>

4. Поменяйте условия сборки: если сборка по ветке `master`, то должен происходит `mvn clean deploy`, иначе `mvn clean test`.
<p align="center">
    <img width="1200 height="600" src="/i/build_steps.png">
</p>

5. Для deploy будет необходимо загрузить [settings.xml](./teamcity/settings.xml) в набор конфигураций maven у teamcity, предварительно записав туда креды для подключения к nexus.
<p align="center">
    <img width="1200 height="600" src="/i/settings.png">
</p>

6. В pom.xml необходимо поменять ссылки на репозиторий и nexus.
<p align="center">
    <img width="1200 height="600" src="/i/pom.png">
</p>

7. Запустите сборку по master, убедитесь, что всё прошло успешно и артефакт появился в nexus.
<p align="center">
    <img width="1200 height="600" src="/i/nexus.png">
</p>

8. Мигрируйте `build configuration` в репозиторий.
<p align="center">
    <img width="1200 height="600" src="/i/build_in_repo.png">
</p>

9.  Создайте отдельную ветку `feature/add_reply` в репозитории.
**[feature/add_reply](https://github.com/bosone87/09-ci-05-teamcity/tree/feature/add_reply)**

10.  Напишите новый метод для класса Welcomer: метод должен возвращать произвольную реплику, содержащую слово `hunter`.
**[Welcomer.java](src/main/java/plaindoll/Welcomer.java)**

11.   Дополните тест для нового метода на поиск слова `hunter` в новой реплике.
**[Welcomer.java](src/test/java/plaindoll/WelcomerTest.java)**

12.   Сделайте push всех изменений в новую ветку репозитория.
13.  Убедитесь, что сборка самостоятельно запустилась, тесты прошли успешно.
<p align="center">
    <img width="1200 height="600" src="/i/build_test.png">
</p>

14.   Внесите изменения из произвольной ветки `feature/add_reply` в `master` через `Merge`.
<p align="center">
    <img width="1200 height="600" src="/i/merge.png">
</p>

15.  Убедитесь, что нет собранного артефакта в сборке по ветке `master`.
16.  Настройте конфигурацию так, чтобы она собирала `.jar` в артефакты сборки.
<p align="center">
    <img width="1200 height="600" src="/i/jar.png">
</p>

17.  Проведите повторную сборку мастера, убедитесь, что сбора прошла успешно и артефакты собраны.
<p align="center">
    <img width="1200 height="600" src="/i/artefacts.png">
</p>

18.  Проверьте, что конфигурация в репозитории содержит все настройки конфигурации из teamcity.
<p align="center">
    <img width="1200 height="600" src="/i/conf_tc.png">
</p>

19.  В ответе пришлите ссылку на репозиторий.

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---
