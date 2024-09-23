@implementation SecureCaptureSceneSessionPathHostComponent

- (void)scene:(id)a3 didUpdateClientSettings:(id)a4
{
  id v6;
  id v7;
  _TtC16SecureCaptureKit42SecureCaptureSceneSessionPathHostComponent *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_245BCCB10(v7);

}

- (_TtC16SecureCaptureKit42SecureCaptureSceneSessionPathHostComponent)init
{
  return (_TtC16SecureCaptureKit42SecureCaptureSceneSessionPathHostComponent *)sub_245BCC118((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC16SecureCaptureKit42SecureCaptureSceneSessionPathHostComponent_delegate, type metadata accessor for SecureCaptureSceneSessionPathHostComponent);
}

- (_TtC16SecureCaptureKit42SecureCaptureSceneSessionPathHostComponent)initWithScene:(id)a3
{
  return (_TtC16SecureCaptureKit42SecureCaptureSceneSessionPathHostComponent *)sub_245BCC17C((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC16SecureCaptureKit42SecureCaptureSceneSessionPathHostComponent_delegate, type metadata accessor for SecureCaptureSceneSessionPathHostComponent);
}

- (void).cxx_destruct
{
  sub_245BC4F10((uint64_t)self + OBJC_IVAR____TtC16SecureCaptureKit42SecureCaptureSceneSessionPathHostComponent_delegate, &qword_257513180);
}

@end
