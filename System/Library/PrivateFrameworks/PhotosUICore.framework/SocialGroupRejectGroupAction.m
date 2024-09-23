@implementation SocialGroupRejectGroupAction

- (NSString)actionIdentifier
{
  _TtC12PhotosUICore28SocialGroupRejectGroupAction *v2;
  void *v3;

  v2 = self;
  sub_1A6F72F48();
  _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();

  v3 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)localizedActionName
{
  _TtC12PhotosUICore28SocialGroupRejectGroupAction *v2;
  void *v3;

  v2 = self;
  sub_1A6F8FADC();

  v3 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)performAction:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12PhotosUICore28SocialGroupRejectGroupAction *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1A6A0B980((uint64_t)sub_1A6A0BDB8, v5, (uint64_t)sub_1A6A0B8E8, (uint64_t)&block_descriptor_55, (uint64_t)&block_descriptor_3_0);

  swift_release();
}

- (void)performUndo:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12PhotosUICore28SocialGroupRejectGroupAction *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1A6A0B980((uint64_t)sub_1A687EE84, v5, (uint64_t)sub_1A6A0BA94, (uint64_t)&block_descriptor_7_0, (uint64_t)&block_descriptor_10_1);

  swift_release();
}

- (_TtC12PhotosUICore28SocialGroupRejectGroupAction)initWithPhotoLibrary:(id)a3
{
  id v3;
  _TtC12PhotosUICore28SocialGroupRejectGroupAction *result;

  v3 = a3;
  result = (_TtC12PhotosUICore28SocialGroupRejectGroupAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore28SocialGroupRejectGroupAction_socialGroup));
}

@end
