@implementation BAContentSettingsData

- (BAContentSettingsData)initWithBookmarkCount:(id)a3 noteCount:(id)a4 highlightCount:(id)a5
{
  id v8;
  id v9;
  id v10;
  objc_super v12;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAContentSettingsData_bookmarkCount) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAContentSettingsData_noteCount) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAContentSettingsData_highlightCount) = (Class)a5;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for BridgedContentSettingsData();
  v8 = a3;
  v9 = a4;
  v10 = a5;
  return -[BAContentSettingsData init](&v12, "init");
}

- (BAContentSettingsData)init
{
  BAContentSettingsData *result;

  result = (BAContentSettingsData *)_swift_stdlib_reportUnimplementedInitializer("BookAnalytics.BridgedContentSettingsData", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
