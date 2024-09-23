@implementation PXOneUpTipsHelper_Swift

+ (PXOneUpTipsHelper_Swift)shared
{
  if (qword_1EE945A60 != -1)
    swift_once();
  return (PXOneUpTipsHelper_Swift *)(id)qword_1EE945A58;
}

+ (NSString)livePhotosTipID
{
  return (NSString *)sub_1A6848288((uint64_t)a1, (uint64_t)a2, &qword_1EE945A38);
}

+ (NSString)infoPanelTipID
{
  return (NSString *)sub_1A6848288((uint64_t)a1, (uint64_t)a2, &qword_1EE945A40);
}

+ (NSString)syndicatedPhotosTipID
{
  return (NSString *)sub_1A6848288((uint64_t)a1, (uint64_t)a2, &qword_1EE945A30);
}

+ (NSString)actionsMenuTipID
{
  return (NSString *)sub_1A6848288((uint64_t)a1, (uint64_t)a2, &qword_1EE945A50);
}

+ (NSString)quickCropTipID
{
  return (NSString *)sub_1A6848288((uint64_t)a1, (uint64_t)a2, &qword_1EE945A48);
}

+ (void)setTipsPresentationDelegate:(id)a3
{
  uint64_t v3;

  swift_getObjCClassMetadata();
  v3 = swift_unknownObjectRetain();
  sub_1A6AC454C(v3);
  swift_unknownObjectRelease();
}

+ (void)setTip:(id)a3 isPresentable:(BOOL)a4
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_1A7AE3764();
  _s12PhotosUICore17PXOneUpTipsHelperC6setTip_13isPresentableySS_SbtFZ_0(v5, v6, a4);
  swift_bridgeObjectRelease();
}

+ (void)setTipActionPerformed:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_1A7AE3764();
  _s12PhotosUICore17PXOneUpTipsHelperC21setTipActionPerformedyySSFZ_0(v3, v4);
  swift_bridgeObjectRelease();
}

+ (void)signalOneUpPhotoOpened
{
  sub_1A6AC5288((uint64_t)a1, (uint64_t)a2, (uint64_t)&unk_1E50D3AA0, (uint64_t)&unk_1EE8E3738);
}

+ (void)signalSyndicatedPhotosPresented
{
  sub_1A6AC5288((uint64_t)a1, (uint64_t)a2, (uint64_t)&unk_1E50D3A78, (uint64_t)&unk_1EE8E3730);
}

+ (void)signalDidQuickCrop
{
  sub_1A6AC5288((uint64_t)a1, (uint64_t)a2, (uint64_t)&unk_1E50D3A50, (uint64_t)&unk_1EE8E3728);
}

- (PXOneUpTipsHelper_Swift)init
{
  return (PXOneUpTipsHelper_Swift *)PXOneUpTipsHelper.init()();
}

@end
