@implementation SecureCaptureSceneStatusBarHostComponent

- (void)scene:(id)a3 willUpdateSettings:(id)a4
{
  id v6;
  id v7;
  _TtC16SecureCaptureKit40SecureCaptureSceneStatusBarHostComponent *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_245BCC8E4(v7);

}

- (void)scene:(id)a3 didUpdateClientSettings:(id)a4
{
  id v6;
  id v7;
  _TtC16SecureCaptureKit40SecureCaptureSceneStatusBarHostComponent *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_245BCBD94(v6, v7);

}

- (_TtC16SecureCaptureKit40SecureCaptureSceneStatusBarHostComponent)init
{
  return (_TtC16SecureCaptureKit40SecureCaptureSceneStatusBarHostComponent *)sub_245BCC118((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC16SecureCaptureKit40SecureCaptureSceneStatusBarHostComponent_delegate, type metadata accessor for SecureCaptureSceneStatusBarHostComponent);
}

- (_TtC16SecureCaptureKit40SecureCaptureSceneStatusBarHostComponent)initWithScene:(id)a3
{
  return (_TtC16SecureCaptureKit40SecureCaptureSceneStatusBarHostComponent *)sub_245BCC17C((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC16SecureCaptureKit40SecureCaptureSceneStatusBarHostComponent_delegate, type metadata accessor for SecureCaptureSceneStatusBarHostComponent);
}

- (void).cxx_destruct
{
  sub_245BC4F10((uint64_t)self + OBJC_IVAR____TtC16SecureCaptureKit40SecureCaptureSceneStatusBarHostComponent_delegate, &qword_2575130E8);
}

@end
