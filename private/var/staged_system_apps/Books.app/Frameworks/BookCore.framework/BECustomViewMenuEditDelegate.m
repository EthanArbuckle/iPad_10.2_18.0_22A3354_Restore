@implementation BECustomViewMenuEditDelegate

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v7;
  id v8;
  _TtC8BookCore28BECustomViewMenuEditDelegate *v9;
  Class v10;

  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = sub_1A4E88();

  return v10;
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  _TtC8BookCore28BECustomViewMenuEditDelegate *v9;
  id v10;
  void *v11;
  _TtC8BookCore28BECustomViewMenuEditDelegate *v12;
  id v13;

  v8 = a3;
  v13 = a4;
  swift_unknownObjectRetain(a5);
  v9 = self;
  v10 = objc_msgSend(v8, "view");
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v10, "removeInteraction:", v8);
    v12 = *(_TtC8BookCore28BECustomViewMenuEditDelegate **)((char *)&v9->super.isa
                                                          + OBJC_IVAR____TtC8BookCore28BECustomViewMenuEditDelegate_interaction);
    *(Class *)((char *)&v9->super.isa + OBJC_IVAR____TtC8BookCore28BECustomViewMenuEditDelegate_interaction) = 0;
    swift_unknownObjectRelease(a5);

    v9 = v12;
  }
  else
  {
    swift_unknownObjectRelease(a5);
  }

}

- (_TtC8BookCore28BECustomViewMenuEditDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8BookCore28BECustomViewMenuEditDelegate_interaction) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BECustomViewMenuEditDelegate();
  return -[BECustomViewMenuEditDelegate init](&v3, "init");
}

- (void).cxx_destruct
{

}

@end
