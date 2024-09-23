@implementation TTRIQuickLookPreviewItem

- (NSURL)previewItemURL
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4E9EC0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B41EA51C((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore24TTRIQuickLookPreviewItem_previewItemURL, (uint64_t)v5, &qword_1ED4E9EC0);
  v6 = sub_1B49036D4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
  {
    v8 = (void *)sub_1B4903638();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }
  return (NSURL *)v8;
}

- (NSString)previewItemTitle
{
  void *v2;

  if (*(_QWORD *)&self->_anon_0[OBJC_IVAR____TtC15RemindersUICore24TTRIQuickLookPreviewItem_previewItemTitle])
  {
    _s15RemindersUICore21TTRProcessEnvironmentV24dictionaryRepresentationSDyS2SGvg_0();
    v2 = (void *)sub_1B4906A34();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)isEqual:(id)a3
{
  _TtC15RemindersUICore24TTRIQuickLookPreviewItem *v4;
  _TtC15RemindersUICore24TTRIQuickLookPreviewItem *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B4907C4C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1B4694658((uint64_t)v8);

  sub_1B41EA560((uint64_t)v8, &qword_1ED4ED170);
  return v6;
}

- (_TtC15RemindersUICore24TTRIQuickLookPreviewItem)init
{
  _TtC15RemindersUICore24TTRIQuickLookPreviewItem *result;

  result = (_TtC15RemindersUICore24TTRIQuickLookPreviewItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B41EA560((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore24TTRIQuickLookPreviewItem_previewItemURL, &qword_1ED4E9EC0);
  swift_bridgeObjectRelease();
}

@end
