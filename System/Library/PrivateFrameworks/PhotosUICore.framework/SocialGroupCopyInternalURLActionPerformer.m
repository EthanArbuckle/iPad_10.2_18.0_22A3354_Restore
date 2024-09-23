@implementation SocialGroupCopyInternalURLActionPerformer

- (void)performUserInteractionTask
{
  _TtC12PhotosUICore41SocialGroupCopyInternalURLActionPerformer *v2;

  v2 = self;
  sub_1A6C810E4();

}

- (_TtC12PhotosUICore41SocialGroupCopyInternalURLActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
{
  objc_class *ObjectType;
  id v9;
  id v10;
  void *v11;
  _TtC12PhotosUICore41SocialGroupCopyInternalURLActionPerformer *v12;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_1A7AE3764();
  v9 = a4;
  v10 = a5;
  v11 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = -[PXAssetCollectionActionPerformer initWithActionType:assetCollectionReference:displayTitleInfo:](&v14, sel_initWithActionType_assetCollectionReference_displayTitleInfo_, v11, v9, v10);

  return v12;
}

@end
