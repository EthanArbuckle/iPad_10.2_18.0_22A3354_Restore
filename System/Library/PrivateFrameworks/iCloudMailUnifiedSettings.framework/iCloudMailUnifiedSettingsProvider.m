@implementation iCloudMailUnifiedSettingsProvider

- (iCloudMailUnifiedSettingsProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  iCloudMailUnifiedSettingsProvider *v10;
  objc_super v12;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___iCloudMailUnifiedSettingsProvider_mailSettingsProvider) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___iCloudMailUnifiedSettingsProvider_accountManager) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___iCloudMailUnifiedSettingsProvider_presenter) = (Class)a4;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for iCloudMailUnifiedSettingsProvider();
  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v7;
  v10 = -[iCloudMailUnifiedSettingsProvider init](&v12, sel_init);
  sub_24B4C0294();

  return v10;
}

- (void)navigateToiCloudMailSettings
{
  iCloudMailUnifiedSettingsProvider *v2;

  v2 = self;
  sub_24B4BFE90(0, 0);

}

- (void)navigateToiCloudMailSettingsWith:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  iCloudMailUnifiedSettingsProvider *v7;

  if (a3)
  {
    v4 = sub_24B4C051C();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_24B4BFE90(v4, v6);

  swift_bridgeObjectRelease();
}

- (iCloudMailUnifiedSettingsProvider)init
{
  iCloudMailUnifiedSettingsProvider *result;

  result = (iCloudMailUnifiedSettingsProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
}

@end
