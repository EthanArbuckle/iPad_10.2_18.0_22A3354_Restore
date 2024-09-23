@implementation SocialGroupCreateGroupActionPerformer

- (void)performBackgroundTask
{
  _TtC12PhotosUICore37SocialGroupCreateGroupActionPerformer *v2;

  v2 = self;
  sub_1A70B4774();

}

- (_TtC12PhotosUICore37SocialGroupCreateGroupActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
{
  uint64_t v7;
  uint64_t v8;

  v7 = sub_1A7AE3764();
  return (_TtC12PhotosUICore37SocialGroupCreateGroupActionPerformer *)sub_1A70B4B0C(v7, v8, a4, a5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore37SocialGroupCreateGroupActionPerformer_photoLibrary));
  sub_1A6855D80(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12PhotosUICore37SocialGroupCreateGroupActionPerformer_creationCompletionBlock));
  sub_1A688D368((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore37SocialGroupCreateGroupActionPerformer_mutationActionDelegate);
}

@end
