@implementation PXPhotoKitAssetCollectionChangePersonSortOrder

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  if (!a4)
    return 0;
  if ((objc_msgSend(a4, sel_respondsToSelector_, sel_people) & 1) != 0)
  {
    v5 = a3;
    v6 = objc_msgSend((id)swift_unknownObjectRetain(), sel_people);
    if (v6)
    {
      v7 = v6;
      v8 = objc_msgSend(v6, sel_count);

      swift_unknownObjectRelease();
      return v8 == (id)1;
    }

    swift_unknownObjectRelease();
  }
  return 0;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a4;
  v6 = (void *)swift_unknownObjectRetain();
  sub_1A6AAEC24(v6);
  v8 = v7;

  swift_unknownObjectRelease();
  if (v8)
  {
    v9 = (void *)sub_1A7AE3734();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (NSString)activityType
{
  return (NSString *)(id)sub_1A7AE3734();
}

+ (id)createStandardActionForAssetCollectionReference:(id)a3 withInput:(id)a4 handler:(id)a5
{
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = _Block_copy(a5);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = (void *)swift_unknownObjectRetain();
  sub_1A6AAECF0(v9, (uint64_t)sub_1A6A7D9DC, v7);
  v11 = v10;

  swift_unknownObjectRelease();
  swift_release();
  return v11;
}

- (void)performUserInteractionTask
{
  PXPhotoKitAssetCollectionChangePersonSortOrder *v2;

  v2 = self;
  sub_1A6AAE6C4();

}

- (PXPhotoKitAssetCollectionChangePersonSortOrder)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  PXPhotoKitAssetCollectionChangePersonSortOrder *v11;
  objc_super v13;

  sub_1A7AE3764();
  v8 = a4;
  v9 = a5;
  v10 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for PhotoKitAssetCollectionChangePersonSortOrder();
  v11 = -[PXAssetCollectionActionPerformer initWithActionType:assetCollectionReference:displayTitleInfo:](&v13, sel_initWithActionType_assetCollectionReference_displayTitleInfo_, v10, v8, v9);

  return v11;
}

@end
