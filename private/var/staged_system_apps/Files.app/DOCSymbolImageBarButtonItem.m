@implementation DOCSymbolImageBarButtonItem

- (_TtC5Files27DOCSymbolImageBarButtonItem)initWithCoder:(id)a3
{
  _TtC5Files27DOCSymbolImageBarButtonItem *result;

  result = (_TtC5Files27DOCSymbolImageBarButtonItem *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010050DA60, "Files/DOCSymbolImageBarButtonItem.swift", 39, 2, 48, 0);
  __break(1u);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _TtC5Files27DOCSymbolImageBarButtonItem *v5;
  uint64_t v6;
  _TtC5Files27DOCSymbolImageBarButtonItem *v7;
  char v8;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = DOCSymbolImageBarButtonItem.isEqual(_:)((uint64_t)v10);

  sub_10007EB54((uint64_t)v10);
  return v8 & 1;
}

- (_TtC5Files27DOCSymbolImageBarButtonItem)init
{
  _TtC5Files27DOCSymbolImageBarButtonItem *result;

  result = (_TtC5Files27DOCSymbolImageBarButtonItem *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCSymbolImageBarButtonItem", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->symbolDescriptor[OBJC_IVAR____TtC5Files27DOCSymbolImageBarButtonItem_symbolDescriptor]);
}

@end
