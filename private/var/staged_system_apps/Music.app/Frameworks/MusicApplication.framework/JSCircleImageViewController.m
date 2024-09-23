@implementation JSCircleImageViewController

- (_TtC16MusicApplication27JSCircleImageViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC16MusicApplication27JSCircleImageViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication27JSCircleImageViewController____lazy_storage___circleImageView) = 0;
  v4 = a3;

  result = (_TtC16MusicApplication27JSCircleImageViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/JSCircleImageViewController.swift", 50, 2, 27, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC16MusicApplication27JSCircleImageViewController *v2;

  v2 = self;
  JSCircleImageViewController.viewDidLoad()();

}

- (void)viewDidLayoutSubviews
{
  id v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  v2 = v14.receiver;
  -[JSCircleImageViewController viewDidLayoutSubviews](&v14, "viewDidLayoutSubviews");
  v3 = objc_msgSend(v2, "view", v14.receiver, v14.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    v13 = sub_69148C();
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

    sub_691638(0, 0, 1);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  double *v8;
  void *v9;
  double *v10;
  id v11;
  _QWORD v12[5];
  double *v13;
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  swift_unknownObjectRetain(a4);
  v7 = v14.receiver;
  -[JSCircleImageViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  v8 = (double *)swift_allocObject(&unk_1378678, 40, 7);
  *((_QWORD *)v8 + 2) = v7;
  v8[3] = width;
  v8[4] = height;
  v12[4] = sub_693A0C;
  v13 = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_20B50C;
  v12[3] = &block_descriptor_10_20;
  v9 = _Block_copy(v12);
  v10 = v13;
  v11 = v7;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v9, 0, swift_release(v10).n128_f64[0]);
  _Block_release(v9);
  swift_unknownObjectRelease(a4);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication27JSCircleImageViewController *v6;
  _TtC16MusicApplication27JSCircleImageViewController *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  JSCircleImageViewController.traitCollectionDidChange(_:)(v8);

}

- (_TtC16MusicApplication27JSCircleImageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication27JSCircleImageViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication27JSCircleImageViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.JSCircleImageViewController", 44, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27JSCircleImageViewController_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27JSCircleImageViewController____lazy_storage___circleImageView));
}

@end
