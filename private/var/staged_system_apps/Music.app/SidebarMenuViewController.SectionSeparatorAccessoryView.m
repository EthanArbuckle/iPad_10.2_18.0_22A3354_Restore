@implementation SidebarMenuViewController.SectionSeparatorAccessoryView

- (_TtCC5Music25SidebarMenuViewControllerP33_D0EFC382E9A5C570068C690D1523DE3D29SectionSeparatorAccessoryView)init
{
  return (_TtCC5Music25SidebarMenuViewControllerP33_D0EFC382E9A5C570068C690D1523DE3D29SectionSeparatorAccessoryView *)sub_1008CC08C();
}

- (_TtCC5Music25SidebarMenuViewControllerP33_D0EFC382E9A5C570068C690D1523DE3D29SectionSeparatorAccessoryView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtCC5Music25SidebarMenuViewControllerP33_D0EFC382E9A5C570068C690D1523DE3D29SectionSeparatorAccessoryView *result;

  v5 = OBJC_IVAR____TtCC5Music25SidebarMenuViewControllerP33_D0EFC382E9A5C570068C690D1523DE3D29SectionSeparatorAccessoryView_hairline;
  v6 = objc_allocWithZone((Class)UIView);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);

  result = (_TtCC5Music25SidebarMenuViewControllerP33_D0EFC382E9A5C570068C690D1523DE3D29SectionSeparatorAccessoryView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/SidebarMenuViewController.swift", 37, 2, 1037, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  _TtCC5Music25SidebarMenuViewControllerP33_D0EFC382E9A5C570068C690D1523DE3D29SectionSeparatorAccessoryView *v7;
  id v8;
  uint64_t v9;
  objc_super v10;

  v3 = sub_100007E8C(&qword_10119DDD8);
  __chkstk_darwin(v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for SidebarMenuViewController.SectionSeparatorAccessoryView();
  v10.receiver = self;
  v10.super_class = v6;
  v7 = self;
  -[SidebarMenuViewController.SectionSeparatorAccessoryView layoutSubviews](&v10, "layoutSubviews");
  v8 = objc_msgSend(*(id *)((char *)&v7->super.super.super.isa+ OBJC_IVAR____TtCC5Music25SidebarMenuViewControllerP33_D0EFC382E9A5C570068C690D1523DE3D29SectionSeparatorAccessoryView_hairline), "setFrame:", CGRect.centeringAlong(axes:in:)(3, 0.0, 0.0, 1.5, 20.0));
  static UIView.Corner.rounded.getter(v8);
  v9 = type metadata accessor for UIView.Corner(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v5, 0, 1, v9);
  UIView.corner.setter(v5);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 3.0;
  v3 = 20.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[SidebarMenuViewController.SectionSeparatorAccessoryView intrinsicContentSize](self, "intrinsicContentSize", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtCC5Music25SidebarMenuViewControllerP33_D0EFC382E9A5C570068C690D1523DE3D29SectionSeparatorAccessoryView)initWithFrame:(CGRect)a3
{
  _TtCC5Music25SidebarMenuViewControllerP33_D0EFC382E9A5C570068C690D1523DE3D29SectionSeparatorAccessoryView *result;

  result = (_TtCC5Music25SidebarMenuViewControllerP33_D0EFC382E9A5C570068C690D1523DE3D29SectionSeparatorAccessoryView *)_swift_stdlib_reportUnimplementedInitializer("Music.SectionSeparatorAccessoryView", 35, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5Music25SidebarMenuViewControllerP33_D0EFC382E9A5C570068C690D1523DE3D29SectionSeparatorAccessoryView_hairline));
}

@end
