@implementation AlishaExternal.RequestInProgress

- (NSData)keyIdentifier
{
  uint64_t v2;
  unint64_t v3;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCC10seserviced14AlishaExternal17RequestInProgress_keyIdentifier);
  v3 = *(_QWORD *)&self->keyIdentifier[OBJC_IVAR____TtCC10seserviced14AlishaExternal17RequestInProgress_keyIdentifier];
  sub_100063C8C(v2, v3);
  isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100063CD0(v2, v3);
  return (NSData *)isa;
}

- (unsigned)functionIdentifier
{
  return *(_WORD *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCC10seserviced14AlishaExternal17RequestInProgress_functionIdentifier);
}

- (_TtCC10seserviced14AlishaExternal17RequestInProgress)init
{
  _TtCC10seserviced14AlishaExternal17RequestInProgress *result;

  result = (_TtCC10seserviced14AlishaExternal17RequestInProgress *)_swift_stdlib_reportUnimplementedInitializer("seserviced.RequestInProgress", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100063CD0(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCC10seserviced14AlishaExternal17RequestInProgress_keyIdentifier), *(_QWORD *)&self->keyIdentifier[OBJC_IVAR____TtCC10seserviced14AlishaExternal17RequestInProgress_keyIdentifier]);
}

@end
