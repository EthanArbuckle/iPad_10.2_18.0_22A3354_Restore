@implementation DOCNamedLocationResolver

- (_TtC5Files24DOCNamedLocationResolver)initWithConfiguration:(id)a3 defaultSourceUIManager:(id)a4
{
  id v6;
  id v7;
  objc_super v9;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files24DOCNamedLocationResolver_iCloudSource) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files24DOCNamedLocationResolver_configuration) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files24DOCNamedLocationResolver_defaultSourceUIManager) = (Class)a4;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCNamedLocationResolver();
  v6 = a3;
  v7 = a4;
  return -[DOCNamedLocationResolver init](&v9, "init");
}

- (_TtC5Files24DOCNamedLocationResolver)init
{
  _TtC5Files24DOCNamedLocationResolver *result;

  result = (_TtC5Files24DOCNamedLocationResolver *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCNamedLocationResolver", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
