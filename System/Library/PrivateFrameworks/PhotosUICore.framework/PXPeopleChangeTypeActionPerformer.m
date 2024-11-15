@implementation PXPeopleChangeTypeActionPerformer

+ (BOOL)canPerformOn:(id)a3
{
  return 1;
}

+ (id)localizedTitleForPerson:(id)a3
{
  return sub_1A7141C98((uint64_t)a1, (uint64_t)a2, a3, (void (*)(void))_s12PhotosUICore31PeopleChangeTypeActionPerformerC14localizedTitle3forSSSgSo8PHPersonC_tFZ_0);
}

+ (id)systemImageNameForPerson:(id)a3
{
  return sub_1A7141C98((uint64_t)a1, (uint64_t)a2, a3, (void (*)(void))_s12PhotosUICore31PeopleChangeTypeActionPerformerC15systemImageName3forSSSgSo8PHPersonC_tFZ_0);
}

- (void)performBackgroundTask
{
  PXPeopleChangeTypeActionPerformer *v2;

  v2 = self;
  PeopleChangeTypeActionPerformer.performBackgroundTask()();

}

+ (int64_t)changeTypeFor:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  v4 = _s12PhotosUICore31PeopleChangeTypeActionPerformerC06changeE03forSo08PHPersonE0VSo13PHFetchResultCySo0J0CG_tFZ_0(v3);

  return v4;
}

- (PXPeopleChangeTypeActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
{
  objc_class *ObjectType;
  id v9;
  id v10;
  void *v11;
  PXPeopleChangeTypeActionPerformer *v12;
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
