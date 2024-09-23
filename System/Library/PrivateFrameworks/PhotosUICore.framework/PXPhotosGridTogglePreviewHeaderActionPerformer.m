@implementation PXPhotosGridTogglePreviewHeaderActionPerformer

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  id v4;
  int v5;
  unsigned __int8 v6;
  _BYTE v8[16];

  v4 = a4;
  PXPhotosViewModel.collectionKind.getter((uint64_t)v8);
  v5 = v8[1];
  swift_bridgeObjectRelease();
  if (v5 == 1)
  {
    v6 = objc_msgSend((id)objc_opt_self(), sel_px_accessibilityIsReduceMotionEnabled);

    return v6 ^ 1;
  }
  else
  {

    return 0;
  }
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  PXPhotosGridTogglePreviewHeaderActionPerformer *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = self;
  sub_1A721B64C();
  v5 = v4;

  if (v5)
  {
    v6 = (void *)sub_1A7AE3734();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
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
  PXPhotosGridTogglePreviewHeaderActionPerformer *v2;
  void *v3;

  v2 = self;
  sub_1A721ADF0();

  v3 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)performUserInteractionTask
{
  PXPhotosGridTogglePreviewHeaderActionPerformer *v2;
  PXPhotosViewModel *v3;
  void *v4;
  _QWORD v5[6];

  v2 = self;
  sub_1A721B010();
  v3 = -[PXPhotosGridActionPerformer viewModel](v2, sel_viewModel);
  v5[4] = sub_1A721AF20;
  v5[5] = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 1107296256;
  v5[2] = sub_1A687B374;
  v5[3] = &block_descriptor_3_11;
  v4 = _Block_copy(v5);
  -[PXPhotosViewModel performChanges:](v3, sel_performChanges_, v4);
  _Block_release(v4);

}

- (PXPhotosGridTogglePreviewHeaderActionPerformer)initWithViewModel:(id)a3 actionType:(id)a4
{
  id v6;
  void *v7;
  PXPhotosGridTogglePreviewHeaderActionPerformer *v8;
  objc_super v10;

  sub_1A7AE3764();
  v6 = a3;
  v7 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for PhotosGridTogglePreviewHeaderActionPerformer();
  v8 = -[PXPhotosGridActionPerformer initWithViewModel:actionType:](&v10, sel_initWithViewModel_actionType_, v6, v7);

  return v8;
}

@end
