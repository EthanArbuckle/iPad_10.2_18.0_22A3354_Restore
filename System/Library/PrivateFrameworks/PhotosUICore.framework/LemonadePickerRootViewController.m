@implementation LemonadePickerRootViewController

- (_TtC12PhotosUICoreP33_9C0F47138E7F57ED0AFD3108BF1ECEE532LemonadePickerRootViewController)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC12PhotosUICoreP33_9C0F47138E7F57ED0AFD3108BF1ECEE532LemonadePickerRootViewController *result;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12PhotosUICoreP33_9C0F47138E7F57ED0AFD3108BF1ECEE532LemonadePickerRootViewController_delegate);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC12PhotosUICoreP33_9C0F47138E7F57ED0AFD3108BF1ECEE532LemonadePickerRootViewController *)sub_1A7AE4AFC();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC12PhotosUICoreP33_9C0F47138E7F57ED0AFD3108BF1ECEE532LemonadePickerRootViewController *v2;

  v2 = self;
  sub_1A6F9A548();

}

- (void)viewWillLayoutSubviews
{
  char *v2;
  uint64_t v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for LemonadePickerRootViewController();
  v2 = (char *)v10.receiver;
  -[LemonadePickerRootViewController viewWillLayoutSubviews](&v10, sel_viewWillLayoutSubviews);
  v3 = *(_QWORD *)&v2[OBJC_IVAR____TtC12PhotosUICoreP33_9C0F47138E7F57ED0AFD3108BF1ECEE532LemonadePickerRootViewController_rootModel];
  v4 = objc_msgSend(v2, sel_view, v10.receiver, v10.super_class);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, sel_bounds);
    v7 = v6;
    v9 = v8;

    (*(void (**)(double, double))(*(_QWORD *)v3 + 536))(v7, v9);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LemonadePickerRootViewController();
  v4 = v5.receiver;
  -[LemonadePickerRootViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  sub_1A6F9B5FC();

}

- (void)dealloc
{
  _QWORD *v2;
  _TtC12PhotosUICoreP33_9C0F47138E7F57ED0AFD3108BF1ECEE532LemonadePickerRootViewController *v3;
  objc_super v4;

  v2 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12PhotosUICoreP33_9C0F47138E7F57ED0AFD3108BF1ECEE532LemonadePickerRootViewController_delegate);
  *v2 = 0;
  v2[1] = 0;
  v3 = self;
  swift_unknownObjectRelease();
  sub_1A7ADBF34();
  sub_1A7ADE61C();
  swift_release();
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for LemonadePickerRootViewController();
  -[LemonadePickerRootViewController dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_9C0F47138E7F57ED0AFD3108BF1ECEE532LemonadePickerRootViewController_pickerConfiguration));
  swift_unknownObjectRelease();
}

- (_TtC12PhotosUICoreP33_9C0F47138E7F57ED0AFD3108BF1ECEE532LemonadePickerRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12PhotosUICoreP33_9C0F47138E7F57ED0AFD3108BF1ECEE532LemonadePickerRootViewController *result;

  v4 = a4;
  result = (_TtC12PhotosUICoreP33_9C0F47138E7F57ED0AFD3108BF1ECEE532LemonadePickerRootViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
