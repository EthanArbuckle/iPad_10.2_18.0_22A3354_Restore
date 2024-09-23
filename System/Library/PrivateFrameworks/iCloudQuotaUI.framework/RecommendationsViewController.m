@implementation RecommendationsViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for RecommendationsViewController();
  v4 = v7.receiver;
  -[RecommendationsViewController viewWillAppear:](&v7, sel_viewWillAppear_, v3);
  v5 = objc_msgSend(v4, sel_navigationController, v7.receiver, v7.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_setNavigationBarHidden_animated_, 1, 0);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for RecommendationsViewController();
  v4 = v7.receiver;
  -[RecommendationsViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);
  v5 = objc_msgSend(v4, sel_navigationController, v7.receiver, v7.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_setNavigationBarHidden_animated_, 0, v3);

  }
}

- (void)viewDidLoad
{
  _TtC13iCloudQuotaUI29RecommendationsViewController *v2;

  v2 = self;
  sub_21F3659A8();

}

- (void)enablePrivateRelayForRecommendation:(id)a3
{
  _TtC13iCloudQuotaUI29RecommendationsViewController *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_21F3685DC(v5);

}

- (void)enableMessagesDataclassForRecommendation:(id)a3
{
  _TtC13iCloudQuotaUI29RecommendationsViewController *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_21F3689F8(v5);

}

- (void)setupiCloudEmailForRecommendation:(id)a3
{
  _TtC13iCloudQuotaUI29RecommendationsViewController *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_21F368F40(v5);

}

- (void)handlePostFamilySharingFlowChecks:(id)a3 familyCircle:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  id v12;
  _TtC13iCloudQuotaUI29RecommendationsViewController *v13;
  id v14;
  id v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554C1040);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21F456268();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  sub_21F456238();
  v11 = a3;
  v12 = a4;
  v13 = self;
  v14 = v12;
  v15 = v11;
  v16 = sub_21F45622C();
  v17 = (_QWORD *)swift_allocObject();
  v18 = MEMORY[0x24BEE6930];
  v17[2] = v16;
  v17[3] = v18;
  v17[4] = v13;
  v17[5] = v14;
  v17[6] = v15;
  sub_21F366078((uint64_t)v9, (uint64_t)&unk_2554C1128, (uint64_t)v17);
  swift_release();

}

- (void)completedRecommendation:(id)a3 storageRecovered:(id)a4
{
  id v6;
  id v7;
  _TtC13iCloudQuotaUI29RecommendationsViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_21F36AD18((uint64_t)v6, v7);

}

- (void)cancelledRecommendation:(id)a3
{
  id v4;
  _TtC13iCloudQuotaUI29RecommendationsViewController *v5;
  _TtC13iCloudQuotaUI25RecommendationsController *v6;

  v4 = a3;
  v5 = self;
  v6 = -[ICQUIRecommendationsRestorableViewController controller](v5, sel_controller);
  (*(void (**)(id))((*MEMORY[0x24BEE4EA0] & (uint64_t)v6->super.isa) + 0x3B0))(v4);

}

- (_TtC13iCloudQuotaUI29RecommendationsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  char *v6;
  uint64_t v7;
  id v8;
  void *v9;
  char *v10;
  uint64_t v11;
  id v12;
  _TtC13iCloudQuotaUI29RecommendationsViewController *v13;
  objc_super v15;

  if (a3)
  {
    sub_21F45601C();
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC13iCloudQuotaUI29RecommendationsViewController_mailAccountProvider) = 0;
    v6 = (char *)self + OBJC_IVAR____TtC13iCloudQuotaUI29RecommendationsViewController_metricsPipeline;
    v7 = sub_21F455CB0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
    v8 = a4;
    v9 = (void *)sub_21F455FEC();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC13iCloudQuotaUI29RecommendationsViewController_mailAccountProvider) = 0;
    v10 = (char *)self + OBJC_IVAR____TtC13iCloudQuotaUI29RecommendationsViewController_metricsPipeline;
    v11 = sub_21F455CB0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
    v12 = a4;
    v9 = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for RecommendationsViewController();
  v13 = -[RecommendationsViewController initWithNibName:bundle:](&v15, sel_initWithNibName_bundle_, v9, a4);

  return v13;
}

- (_TtC13iCloudQuotaUI29RecommendationsViewController)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  objc_super v8;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC13iCloudQuotaUI29RecommendationsViewController_mailAccountProvider) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC13iCloudQuotaUI29RecommendationsViewController_metricsPipeline;
  v6 = sub_21F455CB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for RecommendationsViewController();
  return -[RecommendationsViewController initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13iCloudQuotaUI29RecommendationsViewController_mailAccountProvider));
  sub_21F3654E8((uint64_t)self + OBJC_IVAR____TtC13iCloudQuotaUI29RecommendationsViewController_metricsPipeline, &qword_2554C1038);
}

@end
