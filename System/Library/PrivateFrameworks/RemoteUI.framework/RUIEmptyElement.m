@implementation RUIEmptyElement

- (id)view
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                 + OBJC_IVAR____TtC8RemoteUI15RUIEmptyElement__view));
}

- (_TtC8RemoteUI15RUIEmptyElement)initWithAttributes:(id)a3 parent:(id)a4
{
  uint64_t v5;
  id v6;

  if (a3)
    v5 = sub_209F67258();
  else
    v5 = 0;
  v6 = a4;
  return (_TtC8RemoteUI15RUIEmptyElement *)sub_209F3FC98(v5, a4);
}

- (_TtC8RemoteUI15RUIEmptyElement)init
{
  uint64_t v3;
  id v4;
  _TtC8RemoteUI15RUIEmptyElement *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC8RemoteUI15RUIEmptyElement__view;
  v4 = objc_allocWithZone(MEMORY[0x24BEBDB00]);
  v5 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)objc_msgSend(v4, sel_init);

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for RUIEmptyElement();
  return -[RUIElement init](&v7, sel_init);
}

- (void).cxx_destruct
{

}

@end
