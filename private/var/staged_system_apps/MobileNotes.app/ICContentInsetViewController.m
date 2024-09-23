@implementation ICContentInsetViewController

- (UIViewController)contentViewController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                     + OBJC_IVAR___ICContentInsetViewController_contentViewController));
}

- (ICContentInsetViewControllerConfiguration)configuration
{
  return (ICContentInsetViewControllerConfiguration *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                              + OBJC_IVAR___ICContentInsetViewController_configuration));
}

- (void)setConfiguration:(id)a3
{
  void *v4;
  ICContentInsetViewController *v5;
  id v6;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICContentInsetViewController_configuration);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICContentInsetViewController_configuration) = (Class)a3;
  v6 = a3;
  v5 = self;
  sub_1003B9F00((uint64_t)v4);

}

- (ICContentInsetViewController)initWithContentViewController:(id)a3
{
  id v3;
  ICContentInsetViewController *v4;

  v3 = a3;
  v4 = (ICContentInsetViewController *)sub_1003BA5E8(v3);

  return v4;
}

- (ICContentInsetViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  CGFloat bottom;
  CGFloat trailing;
  objc_class *v8;
  _BYTE *v9;
  CGFloat *v10;
  id v11;
  ICContentInsetViewController *result;
  __int128 v13;
  objc_super v14;

  v5 = OBJC_IVAR___ICContentInsetViewController_configuration;
  v13 = *(_OWORD *)&NSDirectionalEdgeInsetsZero.top;
  bottom = NSDirectionalEdgeInsetsZero.bottom;
  trailing = NSDirectionalEdgeInsetsZero.trailing;
  v8 = (objc_class *)type metadata accessor for ContentInsetViewController.Configuration();
  v9 = objc_allocWithZone(v8);
  v10 = (CGFloat *)&v9[OBJC_IVAR___ICContentInsetViewControllerConfiguration_insets];
  *(_OWORD *)v10 = v13;
  v10[2] = bottom;
  v10[3] = trailing;
  v9[OBJC_IVAR___ICContentInsetViewControllerConfiguration_usesSafeAreaLayoutGuide] = 0;
  *(_QWORD *)&v9[OBJC_IVAR___ICContentInsetViewControllerConfiguration_cornerRadius] = 0;
  v14.receiver = v9;
  v14.super_class = v8;
  v11 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)-[ICContentInsetViewController init](&v14, "init");

  result = (ICContentInsetViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004796E0, "MobileNotes/ContentInsetViewController.swift", 44, 2, 63, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ContentInsetViewController();
  v2 = v3.receiver;
  -[ICContentInsetViewController viewDidLoad](&v3, "viewDidLoad");
  sub_1003BA1B0();

}

- (ICContentInsetViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  ICContentInsetViewController *result;

  v4 = a4;
  result = (ICContentInsetViewController *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.ContentInsetViewController", 38, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICContentInsetViewController_contentViewController));

}

@end
