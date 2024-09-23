@implementation BridgedCallbackRegistration

- (void)whenResolvingClass:(Class)a3 scope:(id)a4 callbackBlock:(id)a5
{
  void *v7;
  id v8;
  _TtC13TeaFoundation27BridgedCallbackRegistration *v9;

  v7 = _Block_copy(a5);
  swift_getObjCClassMetadata();
  *(_QWORD *)(swift_allocObject() + 16) = v7;
  v8 = a4;
  v9 = self;
  sub_190B00AE4();

  swift_release();
}

- (void)whenResolvingProtocol:(id)a3 scope:(id)a4 callbackBlock:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC13TeaFoundation27BridgedCallbackRegistration *v11;

  v8 = _Block_copy(a5);
  *(_QWORD *)(swift_allocObject() + 16) = v8;
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_190B00C2C();

  swift_release();
}

- (void).cxx_destruct
{
  swift_release();
}

- (_TtC13TeaFoundation27BridgedCallbackRegistration)init
{
  sub_190BE17F8();
}

@end
