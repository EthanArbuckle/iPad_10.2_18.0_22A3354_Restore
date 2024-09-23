@implementation PXPeopleMergeActionPerformer

+ (BOOL)canPerformOn:(id)a3
{
  id v3;
  id v4;
  unint64_t v5;
  uint64_t v6;

  v3 = a3;
  v4 = objc_msgSend(v3, sel_fetchedObjects);
  if (!v4)
  {

    return v4 & 1;
  }
  sub_1A68DEE28();
  v5 = sub_1A7AE3A10();

  if (v5 >> 62)
  {
    _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
    v6 = sub_1A7AE4B44();
    swift_bridgeObjectRelease();
    if (v6 > 1)
      goto LABEL_4;
LABEL_7:

    swift_bridgeObjectRelease();
    LOBYTE(v4) = 0;
    return v4 & 1;
  }
  if (*(uint64_t *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10) <= 1)
    goto LABEL_7;
LABEL_4:
  type metadata accessor for PeopleMergeUtilities();
  LOBYTE(v4) = sub_1A687B488(v5);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

+ (id)localizedTitleForPerson:(id)a3
{
  id v3;
  id result;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v3 = a3;
  result = objc_msgSend(v3, sel_photoLibrary);
  if (result)
  {
    v5 = result;
    v6 = objc_msgSend(result, sel_px_peoplePetsHomeVisibility);

    v7 = (void *)sub_1A7AE3734();
    v8 = PXLocalizedStringForPersonOrPetAndVisibility(0, (uint64_t)v6, v7);

    sub_1A7AE3764();
    v9 = (void *)sub_1A7AE3734();
    swift_bridgeObjectRelease();
    return v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

+ (id)systemImageNameForPerson:(id)a3
{
  return (id)sub_1A7AE3734();
}

- (void)performUserInteractionTask
{
  PXPeopleMergeActionPerformer *v2;

  v2 = self;
  PeopleMergeActionPerformer.performUserInteractionTask()();

}

- (PXPeopleMergeActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
{
  objc_class *ObjectType;
  id v9;
  id v10;
  void *v11;
  PXPeopleMergeActionPerformer *v12;
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
