@implementation ICSHomeViewController

- (ICSHomeViewController)init
{
  return (ICSHomeViewController *)sub_24B55107C();
}

- (void)dealloc
{
  uint64_t v2;
  ICSHomeViewController *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  objc_super v8;

  v2 = qword_2544D8D50;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = sub_24B5E32C4();
  __swift_project_value_buffer(v4, (uint64_t)qword_2544D8DC8);
  v5 = sub_24B5E32AC();
  v6 = sub_24B5E4518();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_24B4C1000, v5, v6, "iCloudHome deinitialized.", v7, 2u);
    MEMORY[0x24BD23834](v7, -1, -1);
  }

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for iCloudHomeViewController();
  -[ICSHomeViewController dealloc](&v8, sel_dealloc);
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ICSHomeViewController____lazy_storage___serviceOwnersManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ICSHomeViewController____lazy_storage___accountManager));
}

- (ICSHomeViewController)initWithCoder:(id)a3
{
  id v4;
  ICSHomeViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___ICSHomeViewController_viewModel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___ICSHomeViewController_delayedDeeplinkInfo) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___ICSHomeViewController____lazy_storage___serviceOwnersManager) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___ICSHomeViewController____lazy_storage___accountManager) = 0;
  v4 = a3;

  result = (ICSHomeViewController *)sub_24B5E477C();
  __break(1u);
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  ICSHomeViewController *v4;

  v4 = self;
  sub_24B5514B8(a3);

}

- (void)viewWillAppear:(BOOL)a3
{
  ICSHomeViewController *v4;

  v4 = self;
  sub_24B551958(a3);

}

- (void)viewDidLoad
{
  ICSHomeViewController *v2;

  v2 = self;
  sub_24B551B80();

}

- (void)handleURL:(id)a3
{
  uint64_t v4;
  ICSHomeViewController *v5;

  if (a3)
    v4 = sub_24B5E4290();
  else
    v4 = 0;
  v5 = self;
  sub_24B552BCC(v4);

  swift_bridgeObjectRelease();
}

- (ICSHomeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  ICSHomeViewController *result;

  v4 = a4;
  result = (ICSHomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)genericTermsRemoteUI:(id)a3 didFinishWithSuccess:(BOOL)a4
{
  id v6;
  ICSHomeViewController *v7;

  v6 = a3;
  v7 = self;
  sub_24B553CD8(a4);

}

- (void)genericTermsRemoteUI:(id)a3 acceptedTermsInfo:(id)a4
{
  uint64_t v6;
  id v7;
  ICSHomeViewController *v8;

  if (a4)
    v6 = sub_24B5E4290();
  else
    v6 = 0;
  v7 = a3;
  v8 = self;
  sub_24B553E80(v6);

  swift_bridgeObjectRelease();
}

- (id)accountsForAccountManager:(id)a3
{
  id v4;
  ICSHomeViewController *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  _s14iCloudSettings01iA18HomeViewControllerC8accounts3forSDySo15AIDAServiceTypeaSo9ACAccountCGSo18AIDAAccountManagerC_tF_0();

  type metadata accessor for AIDAServiceType(0);
  sub_24B5123F4(0, &qword_2579992C0);
  sub_24B4F16E8(&qword_25799B1E0, (uint64_t (*)(uint64_t))type metadata accessor for AIDAServiceType, (uint64_t)&unk_24B5E8E00);
  v6 = (void *)sub_24B5E4284();
  swift_bridgeObjectRelease();
  return v6;
}

@end
