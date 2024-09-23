@implementation PXPhotosHighlightsOverlayController

- (PXPhotosHighlightsOverlayController)initWithPhotoLibrary:(id)a3
{
  id v5;
  objc_super v7;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXPhotosHighlightsOverlayController____lazy_storage___rootLayout) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXPhotosHighlightsOverlayController_currentLens) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXPhotosHighlightsOverlayController_photosViewModel) = 0;
  swift_unknownObjectWeakInit();
  *((_BYTE *)&self->super.isa + OBJC_IVAR___PXPhotosHighlightsOverlayController_isSwitchingLens) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXPhotosHighlightsOverlayController_photoLibrary) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PhotosHighlightsOverlayController();
  v5 = a3;
  return -[PXPhotosHighlightsOverlayController init](&v7, sel_init);
}

- (id)overlayLayoutProvider
{
  uint64_t v3;
  void *v4;
  PXPhotosHighlightsOverlayController *v5;
  _QWORD v7[6];

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = self;
  v7[4] = sub_1A705177C;
  v7[5] = v3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 1107296256;
  v7[2] = sub_1A69D8880;
  v7[3] = &block_descriptor_221;
  v4 = _Block_copy(v7);
  v5 = self;
  swift_release();
  return v4;
}

- (NSArray)availableLenses
{
  uint64_t v3;
  uint64_t v4;
  PXPhotosHighlightsOverlayController *v5;
  uint64_t v6;
  void *v7;

  sub_1A692EFEC();
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1A7BA0FC0;
  v4 = qword_1EE9851A8;
  v5 = self;
  if (v4 != -1)
    swift_once();
  swift_beginAccess();
  *(_QWORD *)(v3 + 32) = qword_1EE9851B0;
  v6 = qword_1EE9851B8;
  swift_unknownObjectRetain();
  if (v6 != -1)
    swift_once();
  swift_beginAccess();
  *(_QWORD *)(v3 + 40) = qword_1EE9851C0;
  sub_1A7AE3A28();
  swift_unknownObjectRetain();

  sub_1A6D66648();
  v7 = (void *)sub_1A7AE39F8();
  swift_bridgeObjectRelease();
  return (NSArray *)v7;
}

- (PXPhotosLensControlItem)currentLens
{
  swift_beginAccess();
  return (PXPhotosLensControlItem *)(id)swift_unknownObjectRetain();
}

- (void)setCurrentLens:(id)a3
{
  void **v5;
  void *v6;
  PXPhotosHighlightsOverlayController *v7;

  v5 = (void **)((char *)&self->super.isa + OBJC_IVAR___PXPhotosHighlightsOverlayController_currentLens);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  swift_unknownObjectRetain_n();
  v7 = self;
  sub_1A7050068(v6);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (PXPhotosViewModel)photosViewModel
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___PXPhotosHighlightsOverlayController_photosViewModel);
  swift_beginAccess();
  return (PXPhotosViewModel *)*v2;
}

- (void)setPhotosViewModel:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___PXPhotosHighlightsOverlayController_photosViewModel);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (PXPhotosOverlayControllerDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___PXPhotosHighlightsOverlayController_delegate;
  swift_beginAccess();
  return (PXPhotosOverlayControllerDelegate *)(id)MEMORY[0x1A85CED04](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (void)handleTapWithHitTestResult:(id)a3
{
  id v4;
  PXPhotosHighlightsOverlayController *v5;

  v4 = a3;
  v5 = self;
  sub_1A70509E8(v4);

}

- (BOOL)canHandleObjectReference:(id)a3
{
  sub_1A7050ECC(0);
  return swift_dynamicCastClass() != 0;
}

- (PXPhotosHighlightsOverlayController)init
{
  PXPhotosHighlightsOverlayController *result;

  result = (PXPhotosHighlightsOverlayController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXPhotosHighlightsOverlayController____lazy_storage___rootLayout));
  swift_unknownObjectRelease();

  sub_1A688D368((uint64_t)self + OBJC_IVAR___PXPhotosHighlightsOverlayController_delegate);
}

@end
