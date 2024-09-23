@implementation RadioPowerCC

- (RadioPowerCC)initWithRunLoopAndParams:(__CFRunLoop *)a3 withMitigationType:(int)a4 withParams:(__CFDictionary *)a5
{
  RadioPowerCC *v6;
  RadioPowerCC *v7;
  const void *Value;
  const void *v9;
  NSObject *v10;
  unint64_t v11;
  objc_super v13;
  uint8_t buf[4];
  const void *v15;
  __int16 v16;
  unint64_t v17;

  v13.receiver = self;
  v13.super_class = (Class)RadioPowerCC;
  v6 = -[RadioCC initWithRunLoopAndParams:withMitigationType:withParams:](&v13, "initWithRunLoopAndParams:withMitigationType:withParams:", a3, *(_QWORD *)&a4);
  v7 = v6;
  if (a5 && v6)
  {
    Value = CFDictionaryGetValue(a5, CFSTR("mitigationDetails"));
    if (Value)
    {
      v9 = Value;
      -[ComponentControl setMitigationDetails:](v7, "setMitigationDetails:", -[RadioPowerCC convertDetailStringToValue:](v7, "convertDetailStringToValue:", Value));
      if (byte_1000A2480)
      {
        v10 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          v11 = -[ComponentControl mitigationDetails](v7, "mitigationDetails");
          *(_DWORD *)buf = 138412546;
          v15 = v9;
          v16 = 2048;
          v17 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> detailString: %@ detailValue: %lld", buf, 0x16u);
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
    {
      sub_100053D78(v7);
    }
  }
  return v7;
}

- (unint64_t)convertDetailStringToValue:(__CFString *)a3
{
  CFIndex Length;
  CFIndex v5;
  unint64_t v6;
  unsigned __int8 CharacterAtIndex;
  uint64_t v8;
  NSObject *v9;

  Length = CFStringGetLength(a3);
  if (Length == 4)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      CharacterAtIndex = CFStringGetCharacterAtIndex(a3, v5);
      if (v5 == 3)
        v6 += CharacterAtIndex;
      else
        v6 = (v6 + CharacterAtIndex) << 8;
      ++v5;
    }
    while (v5 != 4);
  }
  else
  {
    v8 = Length;
    v9 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100053DE8((uint64_t)a3, v8, v9);
    return 0;
  }
  return v6;
}

- (void)defaultAction
{
  if (-[ComponentControl isCPMSControlEnabled](self, "isCPMSControlEnabled"))
  {
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100053E6C(self);
    -[RadioCC setCPMSMitigationState:](self, "setCPMSMitigationState:", 1);
  }
}

@end
