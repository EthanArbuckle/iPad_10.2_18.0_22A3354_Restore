@implementation XPCNotificationObserver

- (void)didChangeEnvironment
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  id v5;

  if (qword_10028ADB0 != -1)
    swift_once(&qword_10028ADB0, sub_100046CC8);
  v0 = type metadata accessor for Logger(0);
  v1 = sub_100005288(v0, (uint64_t)qword_1002A8990);
  v2 = Logger.logObject.getter(v1);
  v3 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "XPC observer: didChangeEnvironment, resetting session cache.", v4, 2u);
    swift_slowDealloc(v4, -1, -1);
  }

  v5 = objc_msgSend((id)objc_opt_self(AAURLSession), "sharedSession");
  objc_msgSend(v5, "resetSessionCache");

}

@end
