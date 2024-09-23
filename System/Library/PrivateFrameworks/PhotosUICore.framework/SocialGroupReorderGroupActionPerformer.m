@implementation SocialGroupReorderGroupActionPerformer

- (void)performBackgroundTask
{
  _TtC12PhotosUICore38SocialGroupReorderGroupActionPerformer *v2;

  v2 = self;
  sub_1A6EDDDE4();

}

- (_TtC12PhotosUICore38SocialGroupReorderGroupActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
{
  objc_class *ObjectType;
  char *v9;
  id v10;
  id v11;
  void *v12;
  _TtC12PhotosUICore38SocialGroupReorderGroupActionPerformer *v13;
  objc_super v15;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_1A7AE3764();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12PhotosUICore38SocialGroupReorderGroupActionPerformer_sourceGroup) = 0;
  v9 = (char *)self + OBJC_IVAR____TtC12PhotosUICore38SocialGroupReorderGroupActionPerformer_destinationIndex;
  *(_QWORD *)v9 = 0;
  v9[8] = 1;
  v10 = a4;
  v11 = a5;
  v12 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  v15.receiver = self;
  v15.super_class = ObjectType;
  v13 = -[PXAssetCollectionActionPerformer initWithActionType:assetCollectionReference:displayTitleInfo:](&v15, sel_initWithActionType_assetCollectionReference_displayTitleInfo_, v12, v10, v11);

  return v13;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore38SocialGroupReorderGroupActionPerformer_sourceGroup));
}

@end
