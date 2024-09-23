@implementation ICQRemoteExtensionHost

- (void)presentRemoteViewControllerWithContext:(id)a3 presentingViewController:(id)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  ICQRemoteExtensionHost *v10;
  id v11;

  v7 = _Block_copy(a5);
  v8 = sub_21F455F98();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  v11 = a4;
  v10 = self;
  sub_21F39EC98(v8, v11, (uint64_t)sub_21F39F9B8, v9);
  swift_release();
  swift_bridgeObjectRelease();

}

- (void)dismissViewControllerWithError:(id)a3
{
  ICQRemoteExtensionHost *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_21F39F204(a3);

}

- (ICQRemoteExtensionHost)init
{
  _QWORD *v3;
  objc_class *v4;
  objc_super v6;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICQRemoteExtensionHost_presentingVC) = 0;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ICQRemoteExtensionHost_flowCompletion);
  v4 = (objc_class *)type metadata accessor for RemoteExtensionHost();
  *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[ICQRemoteExtensionHost init](&v6, sel_init);
}

- (void).cxx_destruct
{

  sub_21F37E16C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICQRemoteExtensionHost_flowCompletion));
}

@end
