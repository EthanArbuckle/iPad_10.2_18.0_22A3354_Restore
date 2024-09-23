@implementation SocialGroupReorderAction

- (NSString)actionIdentifier
{
  _TtC12PhotosUICore24SocialGroupReorderAction *v2;
  void *v3;

  v2 = self;
  sub_1A6F72F54();
  _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();

  v3 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)localizedActionName
{
  return (NSString *)0;
}

- (void)performAction:(id)a3
{
  sub_1A6C773C4(self, (int)a2, a3, (uint64_t)&unk_1E51021C8, (uint64_t)sub_1A6A0BDB8, (void (*)(uint64_t, uint64_t))sub_1A6FCE1A0);
}

- (void)performUndo:(id)a3
{
  sub_1A6C773C4(self, (int)a2, a3, (uint64_t)&unk_1E51021A0, (uint64_t)sub_1A687EE84, (void (*)(uint64_t, uint64_t))sub_1A6FCE490);
}

- (_TtC12PhotosUICore24SocialGroupReorderAction)initWithPhotoLibrary:(id)a3
{
  id v3;
  _TtC12PhotosUICore24SocialGroupReorderAction *result;

  v3 = a3;
  result = (_TtC12PhotosUICore24SocialGroupReorderAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore24SocialGroupReorderAction_sourceGroup));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore24SocialGroupReorderAction_destinationGroups));
  swift_bridgeObjectRelease();
}

@end
