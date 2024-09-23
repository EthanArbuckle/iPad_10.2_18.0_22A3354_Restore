@implementation PXSocialGroupRejectGroupActionPerformer

+ (BOOL)isActionDestructive
{
  return 1;
}

- (void)performBackgroundTask
{
  PXSocialGroupRejectGroupActionPerformer *v2;

  v2 = self;
  sub_1A68D2868();

}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)swift_unknownObjectRetain();
  v6 = sub_1A68D2D38(v5);

  swift_unknownObjectRelease();
  return v6 & 1;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  id v5;
  void *v6;

  v5 = a4;
  swift_unknownObjectRetain();
  sub_1A6F8FADC();

  swift_unknownObjectRelease();
  v6 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  return v6;
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return (id)sub_1A7AE3734();
}

- (PXSocialGroupRejectGroupActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
{
  objc_class *ObjectType;
  id v9;
  id v10;
  void *v11;
  PXSocialGroupRejectGroupActionPerformer *v12;
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
