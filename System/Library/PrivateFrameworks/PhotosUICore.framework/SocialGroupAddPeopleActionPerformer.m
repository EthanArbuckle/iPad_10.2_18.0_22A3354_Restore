@implementation SocialGroupAddPeopleActionPerformer

- (void)performUserInteractionTask
{
  _TtC12PhotosUICore35SocialGroupAddPeopleActionPerformer *v2;

  v2 = self;
  sub_1A6C40E7C();

}

- (_TtC12PhotosUICore35SocialGroupAddPeopleActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
{
  uint64_t v7;
  uint64_t v8;

  v7 = sub_1A7AE3764();
  return (_TtC12PhotosUICore35SocialGroupAddPeopleActionPerformer *)sub_1A6C418FC(v7, v8, a4, a5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore35SocialGroupAddPeopleActionPerformer_photoLibrary));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore35SocialGroupAddPeopleActionPerformer_peopleToAdd));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore35SocialGroupAddPeopleActionPerformer_error));
  sub_1A688D368((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore35SocialGroupAddPeopleActionPerformer_mutationActionDelegate);
}

@end
