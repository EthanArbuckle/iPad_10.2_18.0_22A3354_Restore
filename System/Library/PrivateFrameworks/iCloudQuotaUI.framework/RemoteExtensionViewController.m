@implementation RemoteExtensionViewController

- (void)loadView
{
  _TtC13iCloudQuotaUI29RemoteExtensionViewController *v2;

  v2 = self;
  sub_21F39FD94();

}

- (_TtC13iCloudQuotaUI29RemoteExtensionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _TtC13iCloudQuotaUI29RemoteExtensionViewController *v9;
  objc_super v11;

  if (a3)
  {
    sub_21F45601C();
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC13iCloudQuotaUI29RemoteExtensionViewController____lazy_storage___contentViewController) = 0;
    v6 = a4;
    v7 = (void *)sub_21F455FEC();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC13iCloudQuotaUI29RemoteExtensionViewController____lazy_storage___contentViewController) = 0;
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for RemoteExtensionViewController();
  v9 = -[RemoteExtensionViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (_TtC13iCloudQuotaUI29RemoteExtensionViewController)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC13iCloudQuotaUI29RemoteExtensionViewController____lazy_storage___contentViewController) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RemoteExtensionViewController();
  return -[RemoteExtensionViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13iCloudQuotaUI29RemoteExtensionViewController____lazy_storage___contentViewController));
}

@end
