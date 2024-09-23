@implementation PMSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  objc_class *v11;
  void *v12;
  _TtC17PasswordManagerUI15PMSceneDelegate *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v13 = self;
  v11 = (objc_class *)objc_msgSend(v10, sel_shortcutItem);
  v12 = *(Class *)((char *)&v13->super.super.isa
                 + OBJC_IVAR____TtC17PasswordManagerUI15PMSceneDelegate_shortcutItemForInitialLaunch);
  *(Class *)((char *)&v13->super.super.isa
           + OBJC_IVAR____TtC17PasswordManagerUI15PMSceneDelegate_shortcutItemForInitialLaunch) = v11;

  sub_24384C190(v8);
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  _TtC17PasswordManagerUI15PMSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_24384CA14();

}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC17PasswordManagerUI15PMSceneDelegate *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  Swift::String v16;
  char v17;

  v8 = _Block_copy(a5);
  v9 = a3;
  v10 = a4;
  v11 = self;
  v12 = objc_msgSend(v10, sel_type);
  v13 = sub_243850264();
  v15 = v14;

  v16._countAndFlagsBits = v13;
  v16._object = v15;
  PMQuickAction.init(rawValue:)(v16);
  if (v17 != 3)
    sub_24384DE4C();
  _Block_release(v8);

}

- (_TtC17PasswordManagerUI15PMSceneDelegate)init
{
  return (_TtC17PasswordManagerUI15PMSceneDelegate *)PMSceneDelegate.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC17PasswordManagerUI15PMSceneDelegate_shortcutItemForInitialLaunch));

  swift_bridgeObjectRelease();
}

@end
