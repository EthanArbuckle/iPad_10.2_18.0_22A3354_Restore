@implementation PrivateDataActionProvider

- (void)consumeNonDestructiveActionsSyncWithBlock:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  _TtC16NewsTodayIntentsP33_346BAA50B64DD5C36F8B4573B40F56D325PrivateDataActionProvider *v6;
  Class isa;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
    v6 = self;
    _Block_copy(v5);
    isa = Array._bridgeToObjectiveC()().super.isa;
    v9[4] = TagIntentResponseCode.rawValue.getter;
    v10 = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 1107296256;
    v9[2] = sub_100008850;
    v9[3] = &unk_100018BF0;
    v8 = _Block_copy(v9);
    swift_release(v10);
    ((void (**)(_QWORD, Class, void *))v5)[2](v5, isa, v8);
    _Block_release(v8);

    _Block_release(v5);
    _Block_release(v5);

  }
  else
  {
    __break(1u);
  }
}

- (_TtC16NewsTodayIntentsP33_346BAA50B64DD5C36F8B4573B40F56D325PrivateDataActionProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  return -[PrivateDataActionProvider init](&v3, "init");
}

@end
