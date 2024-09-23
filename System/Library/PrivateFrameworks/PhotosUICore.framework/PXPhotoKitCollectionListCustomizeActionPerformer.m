@implementation PXPhotoKitCollectionListCustomizeActionPerformer

+ (BOOL)canPerformOnCollectionList:(id)a3
{
  return objc_msgSend(a3, sel_canPerformEditOperation_, 7);
}

- (void)performUserInteractionTask
{
  _TtC12PhotosUICore48PXPhotoKitCollectionListCustomizeActionPerformer *v2;

  v2 = self;
  sub_1A6F35C40();

}

+ (id)localizedTitleForActionType:(id)a3 collectionList:(id)a4
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a4;
  v5 = (void *)sub_1A7AE3734();
  v6 = PXLocalizedString(v5);

  sub_1A7AE3764();
  v7 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  return v7;
}

+ (id)systemImageNameForCollectionList:(id)a3 actionType:(id)a4
{
  return (id)sub_1A7AE3734();
}

- (_TtC12PhotosUICore48PXPhotoKitCollectionListCustomizeActionPerformer)initWithActionType:(id)a3 collectionList:(id)a4 parameters:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  _TtC12PhotosUICore48PXPhotoKitCollectionListCustomizeActionPerformer *v10;
  objc_super v12;

  sub_1A7AE3764();
  type metadata accessor for PXActionParameterKey(0);
  sub_1A6847A44((unint64_t *)&unk_1EE8F8490, (uint64_t (*)(uint64_t))type metadata accessor for PXActionParameterKey, (uint64_t)&unk_1A7C041B0);
  sub_1A7AE3584();
  v7 = a4;
  v8 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  v9 = (void *)sub_1A7AE3578();
  swift_bridgeObjectRelease();
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for PXPhotoKitCollectionListCustomizeActionPerformer();
  v10 = -[PXPhotoKitCollectionListActionPerformer initWithActionType:collectionList:parameters:](&v12, sel_initWithActionType_collectionList_parameters_, v8, v7, v9);

  return v10;
}

@end
