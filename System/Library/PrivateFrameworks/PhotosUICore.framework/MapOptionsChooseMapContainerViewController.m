@implementation MapOptionsChooseMapContainerViewController

- (_TtC12PhotosUICore42MapOptionsChooseMapContainerViewController)init
{
  return (_TtC12PhotosUICore42MapOptionsChooseMapContainerViewController *)sub_1A703EEC8();
}

- (_TtC12PhotosUICore42MapOptionsChooseMapContainerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A70415E4();
}

- (void)viewDidLoad
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MapOptionsChooseMapContainerViewController();
  v2 = (char *)v3.receiver;
  -[MapOptionsChooseMapContainerViewController viewDidLoad](&v3, sel_viewDidLoad);
  sub_1A703FC90();
  sub_1A703FEE8();
  sub_1A70404FC();
  sub_1A7040D1C();
  sub_1A7041038();
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC12PhotosUICore42MapOptionsChooseMapContainerViewController_scrollView], sel_setDelegate_, v2, v3.receiver, v3.super_class);

}

- (void)viewDidLayoutSubviews
{
  _TtC12PhotosUICore42MapOptionsChooseMapContainerViewController *v2;

  v2 = self;
  sub_1A703FBB8();

}

- (_TtC12PhotosUICore42MapOptionsChooseMapContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12PhotosUICore42MapOptionsChooseMapContainerViewController *result;

  v4 = a4;
  result = (_TtC12PhotosUICore42MapOptionsChooseMapContainerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore42MapOptionsChooseMapContainerViewController_headerBlurredBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore42MapOptionsChooseMapContainerViewController_headerViewSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore42MapOptionsChooseMapContainerViewController_headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore42MapOptionsChooseMapContainerViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore42MapOptionsChooseMapContainerViewController_scrollViewContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore42MapOptionsChooseMapContainerViewController_chooseMapViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore42MapOptionsChooseMapContainerViewController_contentLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore42MapOptionsChooseMapContainerViewController_contentLayoutGuideTopConstraint));
  swift_release();
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  _TtC12PhotosUICore42MapOptionsChooseMapContainerViewController *v8;

  v4 = a3;
  v8 = self;
  objc_msgSend(v4, sel_contentOffset);
  v6 = v5;
  if (qword_1EE984C20 != -1)
    swift_once();
  if (v6 / *(double *)&qword_1EE984C28 > 0.0)
    v7 = v6 / *(double *)&qword_1EE984C28;
  else
    v7 = 0.0;
  objc_msgSend(*(id *)((char *)&v8->super.super.super.isa+ OBJC_IVAR____TtC12PhotosUICore42MapOptionsChooseMapContainerViewController_headerBlurredBackgroundView), sel_setAlpha_, v7);
  objc_msgSend(*(id *)((char *)&v8->super.super.super.isa+ OBJC_IVAR____TtC12PhotosUICore42MapOptionsChooseMapContainerViewController_headerViewSeparator), sel_setAlpha_, v7);

}

@end
