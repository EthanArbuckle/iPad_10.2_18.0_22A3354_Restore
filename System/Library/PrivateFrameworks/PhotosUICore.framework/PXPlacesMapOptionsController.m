@implementation PXPlacesMapOptionsController

- (PXPlacesMapOptionsControllerDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___PXPlacesMapOptionsController_delegate;
  swift_beginAccess();
  return (PXPlacesMapOptionsControllerDelegate *)(id)MEMORY[0x1A85CED04](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (unint64_t)mapStyle
{
  void *v2;
  PXPlacesMapOptionsController *v3;
  unint64_t v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXPlacesMapOptionsController_mapModeController);
  v3 = self;
  v4 = sub_1A71FC1E8((uint64_t)objc_msgSend(v2, sel_mapStyle));

  return v4;
}

- (unint64_t)perspectiveButtonState
{
  PXPlacesMapOptionsController *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_1A71FAFB0();

  return v3;
}

- (BOOL)enableUserTrackingButton
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PXPlacesMapOptionsController_enableUserTrackingButton;
  swift_beginAccess();
  return *v2;
}

- (void)setEnableUserTrackingButton:(BOOL)a3
{
  BOOL *v5;
  uint64_t (*v6)(void);
  PXPlacesMapOptionsController *v7;
  void *v8;

  v5 = (BOOL *)self + OBJC_IVAR___PXPlacesMapOptionsController_enableUserTrackingButton;
  swift_beginAccess();
  *v5 = a3;
  v6 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x90);
  v7 = self;
  v8 = (void *)v6();
  if (v8)
  {
    objc_msgSend(v8, sel_mapOptionsControllerDidInvalidateMapOptions_, v7);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (PXPlacesMapOptionsController)initWithMapModeController:(id)a3 mapFetchResultController:(id)a4 locationAuthorizationMonitor:(id)a5
{
  return (PXPlacesMapOptionsController *)PlacesMapOptionsController.init(mapModeController:mapFetchResultController:locationAuthorizationMonitor:)(a3, a4, a5);
}

- (PXPlacesMapOptionsController)init
{
  PXPlacesMapOptionsController *result;

  result = (PXPlacesMapOptionsController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A688D368((uint64_t)self + OBJC_IVAR___PXPlacesMapOptionsController_delegate);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXPlacesMapOptionsController_currentChooseMapSheetController));

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)mapOptionsViewDidTapMapModeSettingsButton:(id)a3
{
  id v4;
  PXPlacesMapOptionsController *v5;

  v4 = a3;
  v5 = self;
  PlacesMapOptionsController.mapOptionsViewDidTapMapModeSettingsButton(_:)(v4);

}

- (void)mapOptionsViewDidTapPerspective2DButton:(void *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;

  v5 = sub_1A7ADFF24();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(void **)&a1[OBJC_IVAR___PXPlacesMapOptionsController_mapModeController];
  v10 = a3;
  v13 = a1;
  if (!objc_msgSend(v9, sel_toggle3DModeIfPossible))
  {
    v11 = sub_1A6B3E690();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v11, v5);
    sub_1A6939310((uint64_t)v8, 0xD000000000000046, 0x80000001A7C69200);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }

}

- (void)chooseMapViewDidTapCardForMapStyle:(unint64_t)a3
{
  void *v4;
  PXPlacesMapOptionsController *v5;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXPlacesMapOptionsController_mapModeController);
  v5 = self;
  objc_msgSend(v4, sel_setMapStyle_, sub_1A71FC71C(a3));

}

- (void)chooseMapViewDidTapAttributionWithURL:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v3 = sub_1A7ADC8A0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A7ADC834();
  _s12PhotosUICore26PlacesMapOptionsControllerC06chooseD28ViewDidTapAttributionWithURLyy10Foundation0M0VF_0((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end
