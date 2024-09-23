@implementation PhotosPersonOrSocialGroupTitleModel

- (void)photoLibraryDidChange:(id)a3
{
  id v4;
  _TtC12PhotosUICoreP33_60F3BDD8806A129A7EC22A26012BCF7A35PhotosPersonOrSocialGroupTitleModel *v5;

  v4 = a3;
  v5 = self;
  sub_1A688E884();

}

- (_TtC12PhotosUICoreP33_60F3BDD8806A129A7EC22A26012BCF7A35PhotosPersonOrSocialGroupTitleModel)init
{
  _TtC12PhotosUICoreP33_60F3BDD8806A129A7EC22A26012BCF7A35PhotosPersonOrSocialGroupTitleModel *result;

  result = (_TtC12PhotosUICoreP33_60F3BDD8806A129A7EC22A26012BCF7A35PhotosPersonOrSocialGroupTitleModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_60F3BDD8806A129A7EC22A26012BCF7A35PhotosPersonOrSocialGroupTitleModel_backingObject));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self
     + OBJC_IVAR____TtC12PhotosUICoreP33_60F3BDD8806A129A7EC22A26012BCF7A35PhotosPersonOrSocialGroupTitleModel___observationRegistrar;
  v4 = sub_1A7ADCCE4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
