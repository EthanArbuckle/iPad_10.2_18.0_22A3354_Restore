@implementation STUIStatusBarDataOverridesViewController

- (void)viewDidLoad
{
  _TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController *v2;

  v2 = self;
  STUIStatusBarDataOverridesViewController.viewDidLoad()();

}

- (void)dealloc
{
  void *v2;
  _TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_statusBarOverridesStatusDomain);
  v3 = self;
  objc_msgSend(v2, sel_invalidate);
  objc_msgSend(*(id *)((char *)&v3->super.super.super.isa+ OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_statusBarOverridesStatusDomainPublisher), sel_invalidate);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for STUIStatusBarDataOverridesViewController();
  -[STUIStatusBarDataOverridesViewController dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_overridesController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_statusBarOverridesStatusDomain));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_statusBarOverridesStatusDomainPublisher));
}

- (_TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_1CFEB3C70();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController *)STUIStatusBarDataOverridesViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController)initWithCoder:(id)a3
{
  return (_TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController *)STUIStatusBarDataOverridesViewController.init(coder:)(a3);
}

@end
