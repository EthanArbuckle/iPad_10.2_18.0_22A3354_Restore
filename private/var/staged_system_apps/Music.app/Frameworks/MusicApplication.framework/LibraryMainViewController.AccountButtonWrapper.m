@implementation LibraryMainViewController.AccountButtonWrapper

- (_TtCC16MusicApplication25LibraryMainViewControllerP33_5F5244F1910881C99358F64384479D9720AccountButtonWrapper)init
{
  _TtCC16MusicApplication25LibraryMainViewControllerP33_5F5244F1910881C99358F64384479D9720AccountButtonWrapper *v2;
  objc_super v4;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication25LibraryMainViewControllerP33_5F5244F1910881C99358F64384479D9720AccountButtonWrapper_button) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for LibraryMainViewController.AccountButtonWrapper();
  v2 = -[LibraryMainViewController.AccountButtonWrapper initWithFrame:](&v4, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  -[LibraryMainViewController.AccountButtonWrapper sizeToFit](v2, "sizeToFit");
  return v2;
}

- (_TtCC16MusicApplication25LibraryMainViewControllerP33_5F5244F1910881C99358F64384479D9720AccountButtonWrapper)initWithCoder:(id)a3
{
  id v4;
  _TtCC16MusicApplication25LibraryMainViewControllerP33_5F5244F1910881C99358F64384479D9720AccountButtonWrapper *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication25LibraryMainViewControllerP33_5F5244F1910881C99358F64384479D9720AccountButtonWrapper_button) = 0;
  v4 = a3;

  result = (_TtCC16MusicApplication25LibraryMainViewControllerP33_5F5244F1910881C99358F64384479D9720AccountButtonWrapper *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/LibraryMainViewController.swift", 48, 2, 426, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  char *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LibraryMainViewController.AccountButtonWrapper();
  v2 = (char *)v5.receiver;
  -[LibraryMainViewController.AccountButtonWrapper layoutSubviews](&v5, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtCC16MusicApplication25LibraryMainViewControllerP33_5F5244F1910881C99358F64384479D9720AccountButtonWrapper_button];
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v2, "bounds", v5.receiver, v5.super_class);
    objc_msgSend(v4, "setFrame:");

    v2 = v4;
  }

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 28.0;
  v3 = 28.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[LibraryMainViewController.AccountButtonWrapper intrinsicContentSize](self, "intrinsicContentSize", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtCC16MusicApplication25LibraryMainViewControllerP33_5F5244F1910881C99358F64384479D9720AccountButtonWrapper)initWithFrame:(CGRect)a3
{
  _TtCC16MusicApplication25LibraryMainViewControllerP33_5F5244F1910881C99358F64384479D9720AccountButtonWrapper *result;

  result = (_TtCC16MusicApplication25LibraryMainViewControllerP33_5F5244F1910881C99358F64384479D9720AccountButtonWrapper *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.AccountButtonWrapper", 37, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication25LibraryMainViewControllerP33_5F5244F1910881C99358F64384479D9720AccountButtonWrapper_button));
}

@end
