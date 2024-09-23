@implementation BKHIDKeyboardSignpostEventProcessor

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v7;
  id v8;
  __IOHIDEvent *v9;
  uint64_t TimeStamp;
  uint64_t IntegerValue;
  uint64_t v12;
  uint64_t v13;
  int v14;
  id v16;
  NSObject *v17;
  uint64_t ConciseDescriptionKeyboard;
  void *v19;
  void *v20;
  int v22;
  void *v23;

  v7 = a4;
  v8 = a5;
  v9 = *a3;
  if (v9)
  {
    TimeStamp = IOHIDEventGetTimeStamp(v9);
    IntegerValue = IOHIDEventGetIntegerValue(v9, 196608);
    v12 = IOHIDEventGetIntegerValue(v9, 196609);
    v13 = IOHIDEventGetIntegerValue(v9, 196610);
  }
  else
  {
    v12 = 0;
    TimeStamp = 0;
    IntegerValue = 0;
    v13 = 0;
  }
  kdebug_trace(730465057, TimeStamp, IntegerValue, v12, v13);
  v14 = (unsigned __int16)IOHIDEventGetIntegerValue(v9, 196608);
  if (v14 != 7 && v14 != 65289)
  {
    v16 = sub_100059844();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      ConciseDescriptionKeyboard = _BKSHIDEventGetConciseDescriptionKeyboard(v9, objc_msgSend(v7, "eventSource"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(ConciseDescriptionKeyboard);
      v22 = 138543362;
      v23 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v22, 0xCu);

    }
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayUUID"));
  _BKHIDNoteUserEventOccurredOnDisplay(v20);

  return 0;
}

@end
