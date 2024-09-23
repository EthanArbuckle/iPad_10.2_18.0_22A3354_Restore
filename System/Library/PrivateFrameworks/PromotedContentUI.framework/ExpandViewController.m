@implementation ExpandViewController

- (_TtC17PromotedContentUI20ExpandViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B12E0A60();
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC17PromotedContentUI20ExpandViewController *v5;
  id v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17PromotedContentUI20ExpandViewController_webView);
  v5 = self;
  v6 = v4;
  sub_1B1367288();

  v7.receiver = v5;
  v7.super_class = ObjectType;
  -[ExpandViewController dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI20ExpandViewController_webView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI20ExpandViewController_closeButton));
  v3 = (char *)self + OBJC_IVAR____TtC17PromotedContentUI20ExpandViewController_expandedDestinationURL;
  v4 = sub_1B1371DC4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI20ExpandViewController_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI20ExpandViewController_navigationCoordinator));
  sub_1B12DB4F4((uint64_t)self + OBJC_IVAR____TtC17PromotedContentUI20ExpandViewController_webProcessDelegate);
  sub_1B12DB4F4((uint64_t)self + OBJC_IVAR____TtC17PromotedContentUI20ExpandViewController_actionDelegate);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_1B12D0D40((uint64_t)self + OBJC_IVAR____TtC17PromotedContentUI20ExpandViewController_backgroundedTime, (uint64_t *)&unk_1ED3893B0);
}

- (void)viewDidLoad
{
  _TtC17PromotedContentUI20ExpandViewController *v2;

  v2 = self;
  sub_1B12DF0F4();

}

- (void)viewWillAppear:(BOOL)a3
{
  sub_1B12DF710(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillAppear_, 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC17PromotedContentUI20ExpandViewController *v4;

  v4 = self;
  sub_1B12DF5B8(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_1B12DF710(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidDisappear_, 0);
}

- (void)viewWillLayoutSubviews
{
  _TtC17PromotedContentUI20ExpandViewController *v2;

  v2 = self;
  sub_1B12DF77C();

}

- (void)closeButtonTappedWithSender:(id)a3
{
  id v4;
  void *v5;
  _TtC17PromotedContentUI20ExpandViewController *v6;

  v4 = a3;
  v6 = self;
  sub_1B1372D84();
  sub_1B12CE6BC();
  v5 = (void *)sub_1B1372F70();
  sub_1B1372988();

  sub_1B12DFA28();
}

- (void)tapRecognized:(id)a3
{
  id v4;
  _TtC17PromotedContentUI20ExpandViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1B12E0B70();

}

- (_TtC17PromotedContentUI20ExpandViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC17PromotedContentUI20ExpandViewController *result;

  v4 = a4;
  result = (_TtC17PromotedContentUI20ExpandViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)webProcessPlugInBrowserContextControllerGlobalObjectIsAvailableForFrame
{
  _TtC17PromotedContentUI20ExpandViewController *v2;

  v2 = self;
  sub_1B12DFE28();

}

- (void)webProcessMRAIDJSODidCallOpen:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  void *v9;
  _TtC17PromotedContentUI20ExpandViewController *v10;
  void *v11;
  uint64_t v12;

  v4 = sub_1B1371DC4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B1371D94();
  v8 = (void *)MEMORY[0x1B5E1B0F0]((char *)self + OBJC_IVAR____TtC17PromotedContentUI20ExpandViewController_webProcessDelegate);
  if (v8)
  {
    v9 = v8;
    if ((objc_msgSend(v8, sel_respondsToSelector_, sel_webProcessMRAIDJSODidCallOpen_) & 1) != 0)
    {
      v10 = self;
      v11 = (void *)sub_1B1371D88();
      objc_msgSend(v9, sel_webProcessMRAIDJSODidCallOpen_, v11);

      swift_unknownObjectRelease();
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)webProcessMRAIDJSODidCallClose
{
  _TtC17PromotedContentUI20ExpandViewController *v2;

  v2 = self;
  sub_1B12E0184();

}

- (void)webProcessMRAIDJSODidCallExpand:(id)a3 withMaximumWidth:(double)a4 andHeight:(double)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v5 = sub_1B1371DC4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B1371D94();
  sub_1B12E0CA8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

@end
