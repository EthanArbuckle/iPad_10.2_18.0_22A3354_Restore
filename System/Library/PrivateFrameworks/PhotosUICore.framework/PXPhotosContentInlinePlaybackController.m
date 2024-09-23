@implementation PXPhotosContentInlinePlaybackController

- (int64_t)numberOfItemsToPlay
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___PXPhotosContentInlinePlaybackController_numberOfItemsToPlay);
  swift_beginAccess();
  return *v2;
}

- (void)setNumberOfItemsToPlay:(int64_t)a3
{
  int64_t *v5;
  int64_t v6;
  uint64_t (*v7)(void);
  PXPhotosContentInlinePlaybackController *v8;

  v5 = (int64_t *)((char *)self + OBJC_IVAR___PXPhotosContentInlinePlaybackController_numberOfItemsToPlay);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.isa) + 0x70);
  v8 = self;
  if (v6 > 0 == v7() < 1)
    -[PXGridInlinePlaybackController invalidatePlaybackEnabled](v8, sel_invalidatePlaybackEnabled);

}

- (PXScrollViewSpeedometer)scrollViewSpeedometer
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___PXPhotosContentInlinePlaybackController_scrollViewSpeedometer);
  swift_beginAccess();
  return (PXScrollViewSpeedometer *)*v2;
}

- (void)setScrollViewSpeedometer:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  PXPhotosContentInlinePlaybackController *v8;

  v5 = (void **)((char *)&self->super.super.isa
               + OBJC_IVAR___PXPhotosContentInlinePlaybackController_scrollViewSpeedometer);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;
  sub_1A713BF8C(v6);

}

- (PXPhotosContentInlinePlaybackControllerDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___PXPhotosContentInlinePlaybackController_delegate;
  swift_beginAccess();
  return (PXPhotosContentInlinePlaybackControllerDelegate *)(id)MEMORY[0x1A85CED04](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (id)pixelBufferSourceForDisplayAsset:(id)a3 mediaProvider:(id)a4 spriteReference:(id)a5
{
  id v9;
  id v10;
  PXPhotosContentInlinePlaybackController *v11;
  id v12;
  void *v13;
  void *v14;

  swift_unknownObjectRetain();
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = -[PXGridInlinePlaybackController checkOutPlaybackRecordForDisplayAsset:mediaProvider:geometryReference:](v11, sel_checkOutPlaybackRecordForDisplayAsset_mediaProvider_geometryReference_, a3, v9, v10);
  if (v12)
  {
    v13 = v12;
    v14 = (void *)swift_dynamicCastObjCProtocolConditional();

    if (!v14)
  }
  else
  {

    v14 = 0;
  }
  swift_unknownObjectRelease();

  return v14;
}

- (void)recyclePixelBufferSourceForDisplayAssets:(id)a3
{
  PXPhotosContentInlinePlaybackController *v4;
  id v5;

  sub_1A68F0D08();
  sub_1A7AE3A10();
  v4 = self;
  v5 = (id)sub_1A7AE39F8();
  -[PXGridInlinePlaybackController checkInPlaybackRecordForDisplayAssets:](v4, sel_checkInPlaybackRecordForDisplayAssets_, v5);

  swift_bridgeObjectRelease();
}

- (BOOL)shouldDisplayPreviousNonNullPixelBufferForPixelBufferSource:(id)a3
{
  return -[PXPhotosContentInlinePlaybackController isContentViewVisible](self, sel_isContentViewVisible, a3);
}

- (BOOL)isContentViewVisible
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PhotosContentInlinePlaybackController();
  return -[PXGridInlinePlaybackController isContentViewVisible](&v3, sel_isContentViewVisible);
}

- (void)setIsContentViewVisible:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PhotosContentInlinePlaybackController();
  -[PXGridInlinePlaybackController setIsContentViewVisible:](&v4, sel_setIsContentViewVisible_, v3);
}

- (id)createPlaybackRecordForDisplayAsset:(id)a3 mediaProvider:(id)a4 geometryReference:(id)a5
{
  id v8;
  PXPhotosContentInlinePlaybackController *v9;
  id v10;
  _BYTE v12[32];

  swift_unknownObjectRetain();
  v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_1A7AE46D0();
  swift_unknownObjectRelease();
  v10 = sub_1A713C6A0(a3, a4, (uint64_t)v12);
  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v10;
}

- (BOOL)canPlayAsset:(id)a3
{
  return sub_1A713CE4C(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_canPlay_);
}

- (BOOL)shouldEnablePlayback
{
  _QWORD *v2;
  uint64_t (*v3)(void);
  PXPhotosContentInlinePlaybackController *v4;
  void *v5;
  unsigned __int8 v6;
  unsigned __int8 v7;

  v2 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v3 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.isa) + 0x70);
  v4 = self;
  if (v3() < 1
    || (v5 = (void *)(*(uint64_t (**)(void))((*v2 & (uint64_t)v4->super.super.isa) + 0xA0))()) != 0
    && (v6 = objc_msgSend(v5, sel_shouldEnablePlaybackFor_, v4),
        swift_unknownObjectRelease(),
        (v6 & 1) == 0))
  {

    return 0;
  }
  else
  {
    v7 = objc_msgSend((id)objc_opt_self(), sel_px_accessibilityIsReduceMotionEnabled);

    return v7 ^ 1;
  }
}

- (NSString)debugDescription
{
  PXPhotosContentInlinePlaybackController *v2;
  void *v3;

  v2 = self;
  sub_1A713C9A0();

  v3 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (CGRect)currentVisibleRect
{
  uint64_t (*v2)(void);
  PXPhotosContentInlinePlaybackController *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.isa) + 0xA0);
  v3 = self;
  v4 = (void *)v2();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, sel_visibleRectFor_, v3);
    objc_msgSend(v5, sel_safeAreaInsetsFor_, v3);
    PXEdgeInsetsInsetRect();
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    swift_unknownObjectRelease();
  }
  else
  {

    v7 = 0.0;
    v9 = 0.0;
    v11 = 0.0;
    v13 = 0.0;
  }
  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (UIEdgeInsets)criticallyVisibleEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0DC49E8];
  v3 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGRect)frameForPlaybackRecord:(id)a3 minPlayableSize:(CGSize *)a4
{
  id v6;
  PXPhotosContentInlinePlaybackController *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v6 = a3;
  v7 = self;
  sub_1A713CC84(v6, (uint64_t)a4);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (PXDisplayAsset)currentHoveredDisplayAsset
{
  return (PXDisplayAsset *)0;
}

- (BOOL)isDisplayAssetEligibleForAutoPlayback:(id)a3
{
  return sub_1A713CE4C(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_isDisplayAssetEligibleForAutoPlayback_);
}

- (id)filterSortedRecordsToPlay:(id)a3
{
  unint64_t v4;
  PXPhotosContentInlinePlaybackController *v5;
  void *v6;

  sub_1A6856488(0, &qword_1EE90B5E0);
  v4 = sub_1A7AE3A10();
  v5 = self;
  sub_1A713CEE8(v4);

  swift_bridgeObjectRelease();
  v6 = (void *)sub_1A7AE39F8();
  swift_bridgeObjectRelease();
  return v6;
}

- (int64_t)maxNumberOfPlayingItems
{
  uint64_t (*v2)(void);
  PXPhotosContentInlinePlaybackController *v3;
  int64_t v4;

  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.isa) + 0x70);
  v3 = self;
  v4 = v2();

  return v4;
}

- (PXPhotosContentInlinePlaybackController)init
{
  _QWORD *v3;
  objc_class *v4;
  objc_super v6;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PXPhotosContentInlinePlaybackController_numberOfItemsToPlay) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PXPhotosContentInlinePlaybackController_scrollViewSpeedometer) = 0;
  swift_unknownObjectWeakInit();
  v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR___PXPhotosContentInlinePlaybackController_scrollViewSpeedometerObservation);
  v4 = (objc_class *)type metadata accessor for PhotosContentInlinePlaybackController();
  *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[PXGridInlinePlaybackController init](&v6, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___PXPhotosContentInlinePlaybackController_scrollViewSpeedometer));
  sub_1A688D368((uint64_t)self + OBJC_IVAR___PXPhotosContentInlinePlaybackController_delegate);
  swift_unknownObjectRelease();
}

@end
