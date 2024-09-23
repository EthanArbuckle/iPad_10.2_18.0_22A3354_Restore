@implementation SidebarMenuViewController.SectionSeparatorAccessoryView

- (_TtCC16MusicApplication25SidebarMenuViewControllerP33_CBA8DD5BF8BC7A98975F6FD5A9B6C9D029SectionSeparatorAccessoryView)init
{
  return (_TtCC16MusicApplication25SidebarMenuViewControllerP33_CBA8DD5BF8BC7A98975F6FD5A9B6C9D029SectionSeparatorAccessoryView *)sub_3E9FB4();
}

- (_TtCC16MusicApplication25SidebarMenuViewControllerP33_CBA8DD5BF8BC7A98975F6FD5A9B6C9D029SectionSeparatorAccessoryView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtCC16MusicApplication25SidebarMenuViewControllerP33_CBA8DD5BF8BC7A98975F6FD5A9B6C9D029SectionSeparatorAccessoryView *result;

  v5 = OBJC_IVAR____TtCC16MusicApplication25SidebarMenuViewControllerP33_CBA8DD5BF8BC7A98975F6FD5A9B6C9D029SectionSeparatorAccessoryView_hairline;
  v6 = objc_allocWithZone((Class)UIView);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);

  result = (_TtCC16MusicApplication25SidebarMenuViewControllerP33_CBA8DD5BF8BC7A98975F6FD5A9B6C9D029SectionSeparatorAccessoryView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/SidebarMenuViewController.swift", 48, 2, 1037, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  _TtCC16MusicApplication25SidebarMenuViewControllerP33_CBA8DD5BF8BC7A98975F6FD5A9B6C9D029SectionSeparatorAccessoryView *v7;
  id v8;
  uint64_t v9;
  objc_super v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_14C0170);
  __chkstk_darwin(v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for SidebarMenuViewController.SectionSeparatorAccessoryView();
  v10.receiver = self;
  v10.super_class = v6;
  v7 = self;
  -[SidebarMenuViewController.SectionSeparatorAccessoryView layoutSubviews](&v10, "layoutSubviews");
  v8 = objc_msgSend(*(id *)((char *)&v7->super.super.super.isa+ OBJC_IVAR____TtCC16MusicApplication25SidebarMenuViewControllerP33_CBA8DD5BF8BC7A98975F6FD5A9B6C9D029SectionSeparatorAccessoryView_hairline), "setFrame:", CGRect.centeringAlong(axes:in:)(3, 0.0, 0.0, 1.5, 20.0));
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

- (_TtCC16MusicApplication25SidebarMenuViewControllerP33_CBA8DD5BF8BC7A98975F6FD5A9B6C9D029SectionSeparatorAccessoryView)initWithFrame:(CGRect)a3
{
  _TtCC16MusicApplication25SidebarMenuViewControllerP33_CBA8DD5BF8BC7A98975F6FD5A9B6C9D029SectionSeparatorAccessoryView *result;

  result = (_TtCC16MusicApplication25SidebarMenuViewControllerP33_CBA8DD5BF8BC7A98975F6FD5A9B6C9D029SectionSeparatorAccessoryView *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.SectionSeparatorAccessoryView", 46, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication25SidebarMenuViewControllerP33_CBA8DD5BF8BC7A98975F6FD5A9B6C9D029SectionSeparatorAccessoryView_hairline));
}

@end
