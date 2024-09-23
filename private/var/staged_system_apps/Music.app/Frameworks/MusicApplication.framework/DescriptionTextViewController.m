@implementation DescriptionTextViewController

- (_TtC16MusicApplication29DescriptionTextViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC16MusicApplication29DescriptionTextViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication29DescriptionTextViewController____lazy_storage___descriptionTextView) = 0;
  v4 = a3;

  result = (_TtC16MusicApplication29DescriptionTextViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/DescriptionTextViewController.swift", 52, 2, 29, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC16MusicApplication29DescriptionTextViewController *v2;

  v2 = self;
  sub_613830();

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication29DescriptionTextViewController *v2;

  v2 = self;
  sub_613C80();

}

- (void)dismissAnimated
{
  -[DescriptionTextViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (_TtC16MusicApplication29DescriptionTextViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication29DescriptionTextViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication29DescriptionTextViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.DescriptionTextViewController", 46, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->descriptionText[OBJC_IVAR____TtC16MusicApplication29DescriptionTextViewController_descriptionText]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29DescriptionTextViewController____lazy_storage___descriptionTextView));
}

@end
