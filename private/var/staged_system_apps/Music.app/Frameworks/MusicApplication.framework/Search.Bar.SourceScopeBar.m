@implementation Search.Bar.SourceScopeBar

- (_TtCCC16MusicApplication6Search3Bar14SourceScopeBar)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtCCC16MusicApplication6Search3Bar14SourceScopeBar *result;

  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtCCC16MusicApplication6Search3Bar14SourceScopeBar_selectionHandler);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtCCC16MusicApplication6Search3Bar14SourceScopeBar *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/SearchBar.swift", 32, 2, 451, 0);
  __break(1u);
  return result;
}

- (_TtCCC16MusicApplication6Search3Bar14SourceScopeBar)initWithFrame:(CGRect)a3
{
  sub_2EA80C((uint64_t)self, (uint64_t)a2, (uint64_t)"MusicApplication.SourceScopeBar", 31);
}

- (_TtCCC16MusicApplication6Search3Bar14SourceScopeBar)initWithItems:(id)a3
{
  _TtCCC16MusicApplication6Search3Bar14SourceScopeBar *result;

  result = (_TtCCC16MusicApplication6Search3Bar14SourceScopeBar *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.SourceScopeBar", 31, "init(items:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtCCC16MusicApplication6Search3Bar14SourceScopeBar_selectionHandler), *(_QWORD *)&self->selectionHandler[OBJC_IVAR____TtCCC16MusicApplication6Search3Bar14SourceScopeBar_selectionHandler]);
  swift_bridgeObjectRelease();
}

@end
