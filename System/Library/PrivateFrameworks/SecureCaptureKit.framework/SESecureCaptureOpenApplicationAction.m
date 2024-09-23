@implementation SESecureCaptureOpenApplicationAction

- (SESecureCaptureOpenApplicationAction)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SESecureCaptureOpenApplicationAction;
  return -[SESecureCaptureOpenApplicationAction initWithInfo:responder:](&v3, sel_initWithInfo_responder_, 0, 0);
}

- (SESecureCaptureOpenApplicationAction)initWithURL:(id)a3 responder:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  SESecureCaptureOpenApplicationAction *v14;
  objc_super v16;

  v6 = sub_245BD8984();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245BD8978();
  v10 = objc_allocWithZone(MEMORY[0x24BE0BE40]);
  v11 = a4;
  v12 = objc_msgSend(v10, sel_init);
  v13 = (void *)sub_245BD8954();
  objc_msgSend(v12, sel_setObject_forSetting_, v13, 0);

  v16.receiver = self;
  v16.super_class = (Class)SESecureCaptureOpenApplicationAction;
  v14 = -[SESecureCaptureOpenApplicationAction initWithInfo:responder:](&v16, sel_initWithInfo_responder_, v12, v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v14;
}

- (SESecureCaptureOpenApplicationAction)initWithUserActivity:(id)a3 responder:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  return (SESecureCaptureOpenApplicationAction *)SESecureCaptureOpenApplicationAction.init(userActivity:responder:)(v5, a4);
}

- (SESecureCaptureOpenApplicationAction)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SESecureCaptureOpenApplicationAction;
  return -[SESecureCaptureOpenApplicationAction initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (SESecureCaptureOpenApplicationAction)initWithXPCDictionary:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SESecureCaptureOpenApplicationAction;
  return -[SESecureCaptureOpenApplicationAction initWithXPCDictionary:](&v4, sel_initWithXPCDictionary_, a3);
}

- (NSSet)launchActions
{
  SESecureCaptureOpenApplicationAction *v2;
  void *v3;

  v2 = self;
  SESecureCaptureOpenApplicationAction.launchActions.getter();

  sub_245BC4B08(0, &qword_2575129F8);
  sub_245BC49B4();
  v3 = (void *)sub_245BD8BF4();
  swift_bridgeObjectRelease();
  return (NSSet *)v3;
}

- (SESecureCaptureOpenApplicationAction)initWithInfo:(id)a3 responder:(id)a4
{
  id v5;
  id v6;
  SESecureCaptureOpenApplicationAction *result;

  v5 = a3;
  v6 = a4;
  result = (SESecureCaptureOpenApplicationAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (SESecureCaptureOpenApplicationAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  id v8;
  id v9;
  SESecureCaptureOpenApplicationAction *result;

  _Block_copy(a6);
  v8 = a3;
  v9 = a5;
  result = (SESecureCaptureOpenApplicationAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
