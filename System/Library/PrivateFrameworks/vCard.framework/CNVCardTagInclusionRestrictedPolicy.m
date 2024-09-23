@implementation CNVCardTagInclusionRestrictedPolicy

- (BOOL)shouldParseTag:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  _TtC5vCard35CNVCardTagInclusionRestrictedPolicy *v9;

  v5 = sub_1D3C29AF8();
  v6 = v4;
  if (v5 == 0x4E4F4953524556 && v4 == 0xE700000000000000 || (sub_1D3C29B58() & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5vCard35CNVCardTagInclusionRestrictedPolicy_tags);
    v9 = self;
    v7 = sub_1D3C28648(v5, v6, v8);

  }
  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (BOOL)shouldCaptureUnknownTags
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR____TtC5vCard35CNVCardTagInclusionRestrictedPolicy_shouldCaptureUnknownTags);
}

- (void)setShouldCaptureUnknownTags:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC5vCard35CNVCardTagInclusionRestrictedPolicy_shouldCaptureUnknownTags) = a3;
}

- (_TtC5vCard35CNVCardTagInclusionRestrictedPolicy)init
{
  _TtC5vCard35CNVCardTagInclusionRestrictedPolicy *result;

  result = (_TtC5vCard35CNVCardTagInclusionRestrictedPolicy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
