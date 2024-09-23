@implementation WFNetworkListRow

- (void)prepareForReuse
{
  id v2;
  _OWORD v3[2];
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NetworkListRow();
  v2 = v5.receiver;
  -[WFNetworkListRow prepareForReuse](&v5, sel_prepareForReuse);
  v4 = 0;
  memset(v3, 0, sizeof(v3));
  MEMORY[0x219A324D4](v3);

}

- (WFNetworkRowConfig)config
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___WFNetworkListRow_config);
  swift_beginAccess();
  return (WFNetworkRowConfig *)*v2;
}

- (void)setConfig:(id)a3
{
  id *v5;
  id v6;
  WFNetworkListRow *v7;
  WFNetworkListRow *v8;
  WFNetworkListRow *v9;

  v5 = (id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___WFNetworkListRow_config);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = (WFNetworkListRow *)a3;
  v8 = self;

  if (*v5)
  {
    v9 = (WFNetworkListRow *)*v5;
    sub_21972F07C(v9);

    v8 = v7;
    v7 = v9;
  }

}

- (WFNetworkListRow)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  void *v5;
  WFNetworkListRow *v6;
  objc_super v8;

  if (a4)
  {
    sub_2197529A8();
    *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___WFNetworkListRow_config) = 0;
    v5 = (void *)sub_219752984();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
    *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___WFNetworkListRow_config) = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for NetworkListRow();
  v6 = -[WFNetworkListRow initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, 0, v5);

  return v6;
}

- (WFNetworkListRow)initWithCoder:(id)a3
{
  id v4;
  WFNetworkListRow *result;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___WFNetworkListRow_config) = 0;
  v4 = a3;

  result = (WFNetworkListRow *)sub_219752B70();
  __break(1u);
  return result;
}

- (void)configure:(id)a3
{
  WFNetworkRowConfig *v4;
  WFNetworkListRow *v5;

  v4 = (WFNetworkRowConfig *)a3;
  v5 = self;
  NetworkListRow.configure(_:)(v4);

}

- (void).cxx_destruct
{

}

@end
