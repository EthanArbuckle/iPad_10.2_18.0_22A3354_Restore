@implementation QuickLookProvider

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  return 1;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  uint64_t (*v5)(void);
  id v6;
  _TtC13iCloudQuotaUI17QuickLookProvider *v7;
  void *v8;
  id v9;

  v5 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0x60);
  v6 = a3;
  v7 = self;
  v8 = (void *)v5();
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE5EB8]), sel_initWithFPItem_, v8);

  return v9;
}

- (BOOL)previewController:(id)a3 canShareItem:(id)a4
{
  return 0;
}

- (int64_t)previewController:(id)a3 editingModeForPreviewItem:(id)a4
{
  return 0;
}

- (void)previewControllerDidDismiss:(id)a3
{
  id v4;
  _TtC13iCloudQuotaUI17QuickLookProvider *v5;

  v4 = a3;
  v5 = self;
  sub_21F44A310();

}

- (_TtC13iCloudQuotaUI17QuickLookProvider)init
{
  _TtC13iCloudQuotaUI17QuickLookProvider *result;

  result = (_TtC13iCloudQuotaUI17QuickLookProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_21F37E16C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13iCloudQuotaUI17QuickLookProvider_didUpdateItem));
}

@end
