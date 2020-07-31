## Модуль интеграции с CMS OpenCart (v2.3, v3.0)

Данный модуль обеспечивает взаимодействие между интернет-магазином на базе CMS Opencart версии 3.0.x и сервисом платежей [EPOS](https://e-pos.by)

### Требования ###
1. PHP 5.6 и выше 
1. Библиотека Curl 

### Инструкция по установке:
1. Создайте резервную копию вашего магазина и базы данных
1. Установите модуль [cmsgate-opencart-epos.ocmod.zip](https://bitbucket.org/esasby/cmsgate-opencart-epos/src/master/cmsgate-opencart-epos.ocmod.zip) с помощью _Модули_ -> _Установка расширений_
1. Перейдите к спику установленных модулей в категории оплата (меню __Модули  -> Платежи__)
1. Напротив модуля EPOS нажмите «Установить»

## Инструкция по настройке
1. Перейдите к настройке плагина через меню __Модули  -> Платежи__
1. Напротив модуля EPOS нажмите «Изменить».
1. Укажите обязательные параметры
    * EPOS процессинг - выбор организации, выполняющей интеграцию с EPOS
    * Идентификатор клиента – Ваш персональный логи для работы с сервисом EPOS
    * Секрет – Ваш секретный ключ для работы с сервисом EPOS
    * Код ПУ – код поставщика услуги в системе EPOS
    * Код услуги EPOS – код услуги у поставщика услуг в системе EPOS (один ПУ может предоставлять несколько разных услуг)
    * Код торговой точки – код торговой точки ПУ (у одного ПУ может быть несколько торговых точек)
    * Debug mode - запись и отображение дополнительных сообщений при работе модуля
    * Sandbox - перевод модуля в тестовый режим работы. В этом режиме счета выставляются в тестовую систему
    * Срок действия счета - как долго счет, будет доступен в ЕРИП для оплаты    
    * Статус при выставлении счета  - какой статус выставить заказу при успешном выставлении счета в ЕРИП (идентификатор существующего статуса из Магазин > Настройки > Статусы)
    * Статус при успешной оплате счета - какой статус выставить заказу при успешной оплате выставленного счета (идентификатор существующего статуса)
    * Статус при отмене оплаты счета - какой статус выставить заказу при отмене оплаты счета (идентификатор существующего статуса)
    * Статус при ошибке оплаты счета - какой статус выставить заказу при ошибке выставленния счета (идентификатор существующего статуса)
    * Секция "Инструкция" - если включена, то на итоговом экране клиенту будет доступна пошаговая инструкция по оплате счета в ЕРИП
    * Секция QR-code - если включена, то на итоговом экране клиенту будет доступна оплата счета по QR-коду
    * Секция Webpay - если включена, то на итоговом экране клиенту отобразится кнопка для оплаты счета картой (переход на Webpay)
    * Текст успешного выставления счета - текст, отображаемый кленту после успешного выставления счета. Может содержать html. В тексте допустимо ссылаться на переменные @order_id, @order_number, @order_total, @order_currency, @order_fullname, @order_phone, @order_address
    * Название способа оплаты - название, показываемое клиенту при оформлении заказа на этапе выбора способы оплаты заказа
    * Описание способа оплаты - название, показываемое клиенту при оформлении заказа на этапе выбора способы оплаты заказа
1. Сохраните изменения.

### Внимание!
* Для автоматического обновления статуса заказа (после оплаты клиентом выставленного в ЕРИП счета) необходимо сообщить в службу технической поддержки сервиса EPOS адрес обработчика:
    ```
    http://mydomen.my/index.php?route=extension/payment/epos/callback
    ```
### Файлы логов
Модуль ведет лог файл по пути 
`site_root/upload/system/library/esas/cmsgate/epos/vendor/esas/cmsgate-core/logs/cmsgate.log`
Для обеспечения **безопасности** необходимо убедиться, что в настройках http-сервера включена директива _AllowOverride All_ для корневой папки.

### Тестовые данные
Для настрой оплаты в тестовом режиме
 * воспользуйтесь данными для подключения к тестовой системе, полученными при регистрации в EPOS
 * включите в настройках модуля режим "Песочницы" (Sandbox)

_Разработано и протестировано с OpenCart v2.3.0.2, v3.0.0.2_


### История версий
* v1.10.0:
    * Исправление с автоматическим изменением статуса при оплате


