@implementation DOCSidebarDropProposal

- (_TtC5Files22DOCSidebarDropProposal)initWithDropOperation:(unint64_t)a3 intent:(int64_t)a4
{
  sub_10025FFD0((uint64_t)self, (uint64_t)a2, a3, a4, (uint64_t)"init(operation:intent:)", 23);
}

- (_TtC5Files22DOCSidebarDropProposal)initWithDropOperation:(unint64_t)a3
{
  _TtC5Files22DOCSidebarDropProposal *result;

  result = (_TtC5Files22DOCSidebarDropProposal *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCSidebarDropProposal", 28, "init(operation:)", 16, 0);
  __break(1u);
  return result;
}

- (_TtC5Files22DOCSidebarDropProposal)initWithDropOperation:(unint64_t)a3 dropLocation:(int64_t)a4
{
  sub_10025FFD0((uint64_t)self, (uint64_t)a2, a3, a4, (uint64_t)"init(dropOperation:dropLocation:)", 33);
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC5Files22DOCSidebarDropProposal_indexPath;
  v3 = type metadata accessor for IndexPath(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
