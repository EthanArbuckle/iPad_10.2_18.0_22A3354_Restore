@implementation TranslateSystemApertureSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC17SequoiaTranslator36TranslateSystemApertureSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator36TranslateSystemApertureSceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17SequoiaTranslator36TranslateSystemApertureSceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC17SequoiaTranslator36TranslateSystemApertureSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10019F8E8(v8);

}

- (void)sceneWillResignActive:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator36TranslateSystemApertureSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10019EA78(v4);

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator36TranslateSystemApertureSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10019EEB0(v4);

}

- (_TtC17SequoiaTranslator36TranslateSystemApertureSceneDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator36TranslateSystemApertureSceneDelegate____lazy_storage___systemApertureElementProvider) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17SequoiaTranslator36TranslateSystemApertureSceneDelegate_window) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator36TranslateSystemApertureSceneDelegate_currentActivity) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TranslateSystemApertureSceneDelegate();
  return -[TranslateSystemApertureSceneDelegate init](&v3, "init");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator36TranslateSystemApertureSceneDelegate____lazy_storage___systemApertureElementProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator36TranslateSystemApertureSceneDelegate_window));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17SequoiaTranslator36TranslateSystemApertureSceneDelegate_currentActivity));
}

@end
