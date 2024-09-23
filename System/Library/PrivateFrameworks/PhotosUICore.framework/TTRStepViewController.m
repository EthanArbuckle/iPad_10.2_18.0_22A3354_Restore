@implementation TTRStepViewController

- (_TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA821TTRStepViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A6A4CA58();
}

- (void)viewDidLoad
{
  _TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA821TTRStepViewController *v2;

  v2 = self;
  sub_1A6A47094();

}

- (void)handleClose
{
  -[TTRStepViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (void)handleBack
{
  _TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA821TTRStepViewController *v2;
  _TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA821TTRStepViewController *v3;
  id v4;
  _TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA821TTRStepViewController *v5;
  _TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA821TTRStepViewController *v6;

  v6 = self;
  v2 = (_TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA821TTRStepViewController *)-[TTRStepViewController navigationController](v6, sel_navigationController);
  if (v2)
  {
    v3 = v2;
    v4 = -[TTRStepViewController popViewControllerAnimated:](v2, sel_popViewControllerAnimated_, 1);

    v5 = v3;
  }
  else
  {
    v5 = v6;
  }

}

- (_TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA821TTRStepViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_1A6A4A3C4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA821TTRStepViewController____lazy_storage___containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA821TTRStepViewController____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA821TTRStepViewController____lazy_storage___descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA821TTRStepViewController____lazy_storage___headerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA821TTRStepViewController____lazy_storage___stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA821TTRStepViewController____lazy_storage___closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_FCD1DCB97D423C32F6337A2DCF1B8FA821TTRStepViewController____lazy_storage___backButton));
}

@end
