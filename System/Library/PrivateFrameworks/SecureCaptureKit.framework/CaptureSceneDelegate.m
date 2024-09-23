@implementation CaptureSceneDelegate

- (UIWindow)window
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window);
  swift_beginAccess();
  return (UIWindow *)*v2;
}

- (void)setWindow:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.isa + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (_TtC16SecureCaptureKit20CaptureSceneDelegate)init
{
  return (_TtC16SecureCaptureKit20CaptureSceneDelegate *)CaptureSceneDelegate.init()();
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC16SecureCaptureKit20CaptureSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_245BD6DA0(v8, v10);

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC16SecureCaptureKit20CaptureSceneDelegate *v8;

  sub_245BD6D28();
  sub_245BD7818();
  v6 = sub_245BD8C00();
  v7 = a3;
  v8 = self;
  sub_245BD61B4(v6);

  swift_bridgeObjectRelease();
}

- (void)sceneDidDisconnect:(id)a3
{
  void **v3;
  void *v4;

  v3 = (void **)((char *)&self->super.super.isa + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window);
  swift_beginAccess();
  v4 = *v3;
  *v3 = 0;

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_rootViewController));

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_sessionPath));
  v3 = (char *)self + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_urlContexts;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575124C0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_urlContextsProducerContinuation;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257513448);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
