@implementation PXPhotosGridShowMapActionPerformer

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  return objc_msgSend(a4, sel_allowsShowMapAction, a3);
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  PXPhotosGridShowMapActionPerformer *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = self;
  v4 = (void *)sub_1A7AE3734();
  v5 = PXLocalizedString(v4);

  sub_1A7AE3764();
  v6 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  return v6;
}

- (NSString)activityType
{
  void *v2;

  sub_1A7AE3764();
  v2 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)activitySystemImageName
{
  return (NSString *)(id)sub_1A7AE3734();
}

- (void)performUserInteractionTask
{
  PXPhotosGridShowMapActionPerformer *v2;

  v2 = self;
  sub_1A69AB368();

}

- (PXPhotosGridShowMapActionPerformer)initWithViewModel:(id)a3 actionType:(id)a4
{
  id v6;
  void *v7;
  PXPhotosGridShowMapActionPerformer *v8;
  objc_super v10;

  sub_1A7AE3764();
  v6 = a3;
  v7 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for PhotosGridShowMapActionPerformer();
  v8 = -[PXPhotosGridActionPerformer initWithViewModel:actionType:](&v10, sel_initWithViewModel_actionType_, v6, v7);

  return v8;
}

@end
