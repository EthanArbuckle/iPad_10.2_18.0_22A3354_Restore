@implementation RUICustomContentRow

- (id)subElementWithID:(id)a3
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  char *v8;
  void *v9;

  if (a3)
  {
    v3 = (char *)self;
    v4 = sub_209F672C4();
    v6 = v5;
    v7 = *(uint64_t (**)(uint64_t, uint64_t))(**(_QWORD **)&v3[OBJC_IVAR____TtC8RemoteUI19RUICustomContentRow_childElementDirectory]
                                                    + 120);
    v8 = v3;
    v9 = (void *)v7(v4, v6);

    swift_bridgeObjectRelease();
    return v9;
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (id)tableCell
{
  _TtC8RemoteUI19RUICustomContentRow *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_209F44960();

  return v3;
}

- (void)prepareToPreload
{
  _TtC8RemoteUI19RUICustomContentRow *v2;

  v2 = self;
  sub_209F44D30();

}

- (_TtC8RemoteUI19RUICustomContentRow)init
{
  uint64_t v3;
  _TtC8RemoteUI19RUICustomContentRow *v4;
  objc_super v6;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8RemoteUI19RUICustomContentRow_cell) = 0;
  v3 = OBJC_IVAR____TtC8RemoteUI19RUICustomContentRow_childElementDirectory;
  type metadata accessor for ElementDirectory();
  v4 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v3) = (Class)sub_209F48184();
  *(Class *)((char *)&v4->super.super.super.super.isa
           + OBJC_IVAR____TtC8RemoteUI19RUICustomContentRow____lazy_storage___contentLoader) = 0;

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for RUICustomContentRow();
  return -[RUISwiftUITableViewRow init](&v6, sel_init);
}

- (_TtC8RemoteUI19RUICustomContentRow)initWithAttributes:(id)a3 parent:(id)a4
{
  uint64_t v5;
  id v6;

  if (a3)
    v5 = sub_209F67258();
  else
    v5 = 0;
  v6 = a4;
  return (_TtC8RemoteUI19RUICustomContentRow *)RUICustomContentRow.init(attributes:parent:)(v5, a4);
}

- (void).cxx_destruct
{

  swift_release();
  swift_release();
}

@end
