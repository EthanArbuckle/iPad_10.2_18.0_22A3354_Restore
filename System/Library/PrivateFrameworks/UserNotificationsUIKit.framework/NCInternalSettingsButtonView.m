@implementation NCInternalSettingsButtonView

- (NCInternalSettingsButtonViewDelegate)delegate
{
  return (NCInternalSettingsButtonViewDelegate *)(id)MEMORY[0x1D17DD63C]((char *)self+ OBJC_IVAR___NCInternalSettingsButtonView_delegate, a2);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (BOOL)isDeviceAuthenticated
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___NCInternalSettingsButtonView_isDeviceAuthenticated);
}

- (void)setIsDeviceAuthenticated:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___NCInternalSettingsButtonView_isDeviceAuthenticated) = a3;
}

- (NCInternalSettingsButtonView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  swift_unknownObjectWeakInit();
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___NCInternalSettingsButtonView_isDeviceAuthenticated) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NCInternalSettingsButtonView_hostingController) = 0;
  v9.receiver = self;
  v9.super_class = (Class)NCInternalSettingsButtonView;
  return -[NCInternalSettingsButtonView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (NCInternalSettingsButtonView)initWithCoder:(id)a3
{
  id v5;
  NCInternalSettingsButtonView *result;

  swift_unknownObjectWeakInit();
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___NCInternalSettingsButtonView_isDeviceAuthenticated) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NCInternalSettingsButtonView_hostingController) = 0;
  v5 = a3;

  result = (NCInternalSettingsButtonView *)sub_1CFD7C814();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  void *v3;
  double height;
  double width;
  NCInternalSettingsButtonView *v6;
  id v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NCInternalSettingsButtonView_hostingController);
  if (v3)
  {
    height = result.height;
    width = result.width;
    v6 = self;
    v7 = objc_msgSend(v3, sel_view);
    if (v7)
    {
      v8 = v7;
      objc_msgSend(v7, sel_sizeThatFits_, width, height);
      v10 = v9;
      v12 = v11;

      result.width = v10;
      result.height = v12;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  NCInternalSettingsButtonView *v2;

  v2 = self;
  NCInternalSettingsButtonView.layoutSubviews()();

}

- (void).cxx_destruct
{
  sub_1CFD3E3A0((uint64_t)self + OBJC_IVAR___NCInternalSettingsButtonView_delegate);

}

@end
