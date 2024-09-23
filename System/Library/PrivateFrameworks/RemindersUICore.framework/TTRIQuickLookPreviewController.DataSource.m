@implementation TTRIQuickLookPreviewController.DataSource

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  unint64_t v3;
  id v6;
  _TtCC15RemindersUICore30TTRIQuickLookPreviewControllerP33_5E2A18B72E000F5EB686E3810129004A10DataSource *v7;
  int64_t v8;

  v3 = *(unint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC15RemindersUICore30TTRIQuickLookPreviewControllerP33_5E2A18B72E000F5EB686E3810129004A10DataSource_previewItems);
  if (!(v3 >> 62))
    return *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = a3;
  v7 = self;
  _s15RemindersUICore21TTRProcessEnvironmentV24dictionaryRepresentationSDyS2SGvg_0();
  v8 = sub_1B49081B0();

  swift_bridgeObjectRelease();
  return v8;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v5 = *(_QWORD *)((char *)self
                 + OBJC_IVAR____TtCC15RemindersUICore30TTRIQuickLookPreviewControllerP33_5E2A18B72E000F5EB686E3810129004A10DataSource_previewItems);
  if ((v5 & 0xC000000000000001) != 0)
  {
    v7 = self;
    v8 = a3;
    v9 = v7;
    v6 = (void *)MEMORY[0x1B5E3C268](a4, v5);

    return v6;
  }
  if (a4 < 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10) > (unint64_t)a4)
  {
    v6 = *(void **)(v5 + 8 * a4 + 32);
    swift_unknownObjectRetain();
    return v6;
  }
  __break(1u);
  return self;
}

- (_TtCC15RemindersUICore30TTRIQuickLookPreviewControllerP33_5E2A18B72E000F5EB686E3810129004A10DataSource)init
{
  _TtCC15RemindersUICore30TTRIQuickLookPreviewControllerP33_5E2A18B72E000F5EB686E3810129004A10DataSource *result;

  result = (_TtCC15RemindersUICore30TTRIQuickLookPreviewControllerP33_5E2A18B72E000F5EB686E3810129004A10DataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
