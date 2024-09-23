@implementation PXMapOptionsView

- (unint64_t)mapStyle
{
  unint64_t *v2;

  v2 = (unint64_t *)((char *)self + OBJC_IVAR___PXMapOptionsView_mapStyle);
  swift_beginAccess();
  return *v2;
}

- (void)setMapStyle:(unint64_t)a3
{
  unint64_t *v5;
  PXMapOptionsView *v6;

  v5 = (unint64_t *)((char *)self + OBJC_IVAR___PXMapOptionsView_mapStyle);
  swift_beginAccess();
  *v5 = a3;
  v6 = self;
  sub_1A7055BDC();

}

- (BOOL)enableUserTrackingButton
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PXMapOptionsView_enableUserTrackingButton;
  swift_beginAccess();
  return *v2;
}

- (void)setEnableUserTrackingButton:(BOOL)a3
{
  BOOL *v5;
  uint64_t (*v6)(void);
  PXMapOptionsView *v7;
  _BOOL8 v8;

  v5 = (BOOL *)self + OBJC_IVAR___PXMapOptionsView_enableUserTrackingButton;
  swift_beginAccess();
  *v5 = a3;
  v6 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.super.isa) + 0xE0);
  v7 = self;
  v8 = (v6() & 1) == 0;
  objc_msgSend(*(id *)((char *)&v7->super.super.super.isa + OBJC_IVAR___PXMapOptionsView_userLocationButton), sel_setHidden_, v8);
  objc_msgSend(*(id *)((char *)&v7->super.super.super.isa + OBJC_IVAR___PXMapOptionsView_platterSeparatorView), sel_setHidden_, v8);

}

- (PXMapOptionsViewDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___PXMapOptionsView_delegate;
  swift_beginAccess();
  return (PXMapOptionsViewDelegate *)(id)MEMORY[0x1A85CED04](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (PXMapOptionsView)initWithMapView:(id)a3
{
  return (PXMapOptionsView *)MapOptionsView.init(mapView:)(a3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXMapOptionsView_platterContainerView), sel_sizeThatFits_, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setPerspectiveButtonState:(unint64_t)a3 animated:(BOOL)a4
{
  PXMapOptionsView *v6;

  if (*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXMapOptionsView_perspectiveButtonState) != (Class)a3)
  {
    v6 = self;
    sub_1A70560CC(a3, a4);

  }
}

- (void)didTapMapModeSettingsButton
{
  uint64_t (*v2)(void);
  void *v3;
  PXMapOptionsView *v4;

  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.super.isa) + 0x110);
  v4 = self;
  v3 = (void *)v2();
  if (v3)
  {
    objc_msgSend(v3, sel_mapOptionsViewDidTapMapModeSettingsButton_, v4);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (void)didTapPerspective2DButtonWithSender:(id)a3
{
  sub_1A7056568(self, (uint64_t)a2, a3, (SEL *)&selRef_mapOptionsViewDidTapPerspective2DButton_);
}

- (void)didTapPerspective3DButtonWithSender:(id)a3
{
  sub_1A7056568(self, (uint64_t)a2, a3, (SEL *)&selRef_mapOptionsViewDidTapPerspective3DButton_);
}

- (PXMapOptionsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A7056A38();
}

- (PXMapOptionsView)initWithFrame:(CGRect)a3
{
  PXMapOptionsView *result;

  result = (PXMapOptionsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_1A688D368((uint64_t)self + OBJC_IVAR___PXMapOptionsView_delegate);
}

@end
