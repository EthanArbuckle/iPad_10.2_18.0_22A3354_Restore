@implementation TextViewWrapper.Coordinator

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtCV17WeatherAppSupportP33_60F1DCCF57C539BA000BCF575D4E662015TextViewWrapper11Coordinator *v13;
  char v14;
  uint64_t v16;

  v8 = sub_24A361B2C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A361B20();
  v12 = a3;
  v13 = self;
  v14 = sub_24A2A67D8((uint64_t)v12, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v14 & 1;
}

- (_TtCV17WeatherAppSupportP33_60F1DCCF57C539BA000BCF575D4E662015TextViewWrapper11Coordinator)init
{
  sub_24A2A68F0();
}

- (void).cxx_destruct
{
  swift_release();
}

@end
