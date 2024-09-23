@implementation RefinementsBarViewModel

- (BOOL)tapInteractionEnabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps23RefinementsBarViewModel_tapInteractionEnabled);
}

- (void)setTapInteractionEnabled:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps23RefinementsBarViewModel_tapInteractionEnabled) = a3;
}

- (BOOL)hasAllRefinements
{
  _TtC4Maps23RefinementsBarViewModel *v2;
  char v3;

  v2 = self;
  v3 = sub_100020BFC();

  return v3 & 1;
}

- (_TtC4Maps23RefinementsBarViewModel)init
{
  _TtC4Maps23RefinementsBarViewModel *result;

  result = (_TtC4Maps23RefinementsBarViewModel *)_swift_stdlib_reportUnimplementedInitializer("Maps.RefinementsBarViewModel", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC4Maps23RefinementsBarViewModel__refinements;
  v3 = sub_100008B04(&qword_1014938C0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
