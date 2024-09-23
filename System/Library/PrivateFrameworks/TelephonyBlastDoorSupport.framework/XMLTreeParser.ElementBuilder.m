@implementation XMLTreeParser.ElementBuilder

- (_TtCV25TelephonyBlastDoorSupport13XMLTreeParser14ElementBuilder)init
{
  objc_class *v3;
  objc_super v5;

  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCV25TelephonyBlastDoorSupport13XMLTreeParser14ElementBuilder_rootElement) = 0;
  type metadata accessor for XMLTreeParser.ErrorContext();
  v3 = (objc_class *)swift_allocObject();
  *((_QWORD *)v3 + 2) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCV25TelephonyBlastDoorSupport13XMLTreeParser14ElementBuilder_errorContext) = v3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for XMLTreeParser.ElementBuilder();
  return -[XMLTreeParser.ElementBuilder init](&v5, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV25TelephonyBlastDoorSupport13XMLTreeParser14ElementBuilder_rootElement));
  swift_release();
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  sub_247ECFEE4(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, sub_247ED015C);
}

@end
