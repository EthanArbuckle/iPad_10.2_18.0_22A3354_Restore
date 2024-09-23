@implementation PMUIApplicationDelegate

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC17PasswordManagerUI23PMUIApplicationDelegate *v11;
  id v12;
  id v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = objc_msgSend(v9, sel_role);
  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD8E8]), sel_initWithName_sessionRole_, 0, v12);

  type metadata accessor for PMSceneDelegate();
  objc_msgSend(v13, sel_setDelegateClass_, swift_getObjCClassFromMetadata());

  return v13;
}

- (_TtC17PasswordManagerUI23PMUIApplicationDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PMUIApplicationDelegate();
  return -[PMUIApplicationDelegate init](&v3, sel_init);
}

@end
