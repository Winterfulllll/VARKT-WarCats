# ***WarCats Project (MUNA-25)*** 🌑

*Репозиторий* команды ***WarCats*** 😼 (учеников МАИ группы *М8О-107Б-23*) для работы над проектом по предмету "Введение в авиационную и ракетно-космическую технику".

## *Состав команды* 🤝
- **Горячкин Владимир Олегович** *(программист, монтажёр)*
- **Павлюшин Максим Кириллович** *(составитель отчёта)*
- **Прокофьев Илья Алексеевич** *(тимлид, физик, KSP)*
- **Ситников Илья Александрович** *(математик)*

## *Ссылки* 🔗
- [Отчёт](https://docs.google.com/document/d/12dOEXi4F8SiXTueoF_v-hLHL12CH-KlV3Zq20BDjrgE/edit)
- [Видео с полётом](https://youtu.be/bzFwGulmP-w)
- [Видео-отчёт](https://youtu.be/0I85xoLC98g)

![](https://i.ytimg.com/vi/xW97apFQ9V8/maxresdefault.jpg)

## *Стек используемых технологий* 👨‍💻

*Миссия смоделирована в программе [Kerbal Space Program](https://www.kerbalspaceprogram.com)*

- *Полностью автоматизированный полёт на Луну* осуществлён с помощью модификации [*kOS*](https://ksp-kos.github.io/KOS/). Сбор игровых данных выполнен с помощью модификации [*MechJeb2*](https://www.curseforge.com/kerbal/ksp-mods/mechjeb).
- Для *визуализации анализируемых данных* был использован язык программирования [*Python*](https://www.python.org) и библиотека [*matplotlib*](https://matplotlib.org).
- Данные средства программирования позволяют начинающим программистам реализовать свои *графические задачи*, над которыми мы и работали.

## *Процесс установки и настройки ПО* ⚙️
### KSP 🚀

Для начала работы, установите [**KSP**](https://www.kerbalspaceprogram.com) версии 1.12.5.3190

Далее установите *следующие моды*:
- [kOS](https://www.curseforge.com/kerbal/ksp-mods/kos-scriptable-autopilot-system)
- [MechJeb2](https://www.curseforge.com/kerbal/ksp-mods/mechjeb)
- [TweakScale](https://curseforgemods.com/mod_detail.php?m=7072&g=196)
- [Module Manager](https://forum.kerbalspaceprogram.com/topic/50533-18x-112x-module-manager-423-july-03th-2023-fireworks-season/)

Затем найдите корневую папку игры (по умолчанию - `C:\GOG Games\Kerbal Space Program\`) в `Ships\Script` перенесите [файлы автопилота](Files/Autopilot/), а в `Ships\VAB` - [файлы конфигурации нашей ракеты](Files/data/Rocket/).

### Python 🐍

Нужно установить библиотеку [*matplotlib*](https://matplotlib.org). Сделать это можно с помощью команды `pip install matplotlib`, которая прописывается в терминал операционной системы.

***На этом установку можно считать завершённой! 🎉***