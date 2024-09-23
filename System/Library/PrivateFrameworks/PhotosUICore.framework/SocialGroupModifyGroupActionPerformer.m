@implementation SocialGroupModifyGroupActionPerformer

- (void)performBackgroundTask
{
  _TtC12PhotosUICore37SocialGroupModifyGroupActionPerformer *v2;

  v2 = self;
  sub_1A688CC90();

}

- (_TtC12PhotosUICore37SocialGroupModifyGroupActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
{
  uint64_t v7;
  uint64_t v8;

  v7 = sub_1A7AE3764();
  return (_TtC12PhotosUICore37SocialGroupModifyGroupActionPerformer *)sub_1A688D19C(v7, v8, a4, a5);
}

- (void).cxx_destruct
{
  sub_1A688D368((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore37SocialGroupModifyGroupActionPerformer_mutationActionDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore37SocialGroupModifyGroupActionPerformer_newKeyAsset));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
