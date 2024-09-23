@implementation WFNetworkListViewController

- (void)viewDidLoad
{
  WFNetworkListViewController *v2;

  v2 = self;
  WFNetworkListViewController.viewDidLoad()();

}

- (WFNetworkListViewController)initWithNetworkListDataSource:(id)a3 networkListConfigDataSource:(id)a4
{
  id v6;
  id v7;
  objc_super v9;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___WFNetworkListViewController_hostingController) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___WFNetworkListViewController_networkListDataSource) = (Class)a3;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___WFNetworkListViewController_networkConfigDataSource) = (Class)a4;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for WFNetworkListViewController();
  v6 = a3;
  v7 = a4;
  return -[WFNetworkListViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
}

- (WFNetworkListViewController)initWithCoder:(id)a3
{
  id v4;
  WFNetworkListViewController *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___WFNetworkListViewController_hostingController) = 0;
  v4 = a3;

  result = (WFNetworkListViewController *)sub_219752B70();
  __break(1u);
  return result;
}

- (WFNetworkListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  WFNetworkListViewController *result;

  v4 = a4;
  result = (WFNetworkListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___WFNetworkListViewController_networkListDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___WFNetworkListViewController_networkConfigDataSource));
}

@end
