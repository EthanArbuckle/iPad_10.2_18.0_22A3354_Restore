@implementation PXPhotosZoomableOverlayController

- (PXPhotosZoomableOverlayController)initWithPhotoLibrary:(id)a3
{
  return (PXPhotosZoomableOverlayController *)sub_1A71AF7C4((uint64_t)a3);
}

- (id)overlayLayoutProvider
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD aBlock[6];

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___PXPhotosZoomableOverlayController_overlayLayoutProvider);
  swift_beginAccess();
  if (!*v2)
    return 0;
  v3 = v2[1];
  aBlock[4] = *v2;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A69D8880;
  aBlock[3] = &block_descriptor_7_8;
  v4 = _Block_copy(aBlock);
  sub_1A7ADBF34();
  swift_release();
  return v4;
}

- (void)setOverlayLayoutProvider:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1A69D964C;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___PXPhotosZoomableOverlayController_overlayLayoutProvider);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1A6855D80(v7);
}

- (NSArray)availableLenses
{
  uint64_t v3;
  PXPhotosZoomableOverlayController *v4;
  uint64_t *v5;
  uint64_t *v6;
  void *v7;

  sub_1A6847920(0, (unint64_t *)&qword_1EE8C44F0, MEMORY[0x1E0DEE9B0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1A7BA0FC0;
  v4 = self;
  v5 = sub_1A704FAB0();
  swift_beginAccess();
  *(_QWORD *)(v3 + 32) = *v5;
  swift_unknownObjectRetain();
  v6 = sub_1A704FAF0();
  swift_beginAccess();
  *(_QWORD *)(v3 + 40) = *v6;
  sub_1A7AE3A28();
  swift_unknownObjectRetain();

  sub_1A6D66648();
  v7 = (void *)sub_1A7AE39F8();
  swift_bridgeObjectRelease();
  return (NSArray *)v7;
}

- (PXPhotosViewModel)photosViewModel
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___PXPhotosZoomableOverlayController_photosViewModel);
  swift_beginAccess();
  return (PXPhotosViewModel *)*v2;
}

- (void)setPhotosViewModel:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  PXPhotosZoomableOverlayController *v8;

  v5 = (void **)((char *)&self->super.isa + OBJC_IVAR___PXPhotosZoomableOverlayController_photosViewModel);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;
  sub_1A71B0028(v6);

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
  PXPhotosZoomableOverlayController *v7;

  v5 = (void **)((char *)&self->super.isa + OBJC_IVAR___PXPhotosZoomableOverlayController_currentLens);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  swift_unknownObjectRetain_n();
  v7 = self;
  sub_1A71B0424(v6);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (PXPhotosOverlayControllerDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___PXPhotosZoomableOverlayController_delegate;
  swift_beginAccess();
  return (PXPhotosOverlayControllerDelegate *)(id)MEMORY[0x1A85CED04](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (BOOL)canHandleObjectReference:(id)a3
{
  return 0;
}

- (PXPhotosZoomableOverlayController)init
{
  PXPhotosZoomableOverlayController *result;

  result = (PXPhotosZoomableOverlayController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_1A6855D80(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___PXPhotosZoomableOverlayController_overlayLayoutProvider));

  swift_unknownObjectRelease();
  sub_1A688D368((uint64_t)self + OBJC_IVAR___PXPhotosZoomableOverlayController_delegate);
  swift_unknownObjectRelease();
}

@end
