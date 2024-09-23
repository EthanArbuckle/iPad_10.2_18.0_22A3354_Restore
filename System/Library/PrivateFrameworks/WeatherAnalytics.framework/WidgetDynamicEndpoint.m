@implementation WidgetDynamicEndpoint

- (NSURL)url
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v8;

  v2 = sub_1DBE49A64();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_1DBE1686C((uint64_t)v5);
  swift_release();
  v6 = (void *)sub_1DBE49A58();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (NSURL *)v6;
}

- (NSString)name
{
  void *v2;

  swift_retain();
  sub_1DBE16AB4();
  swift_release();
  v2 = (void *)sub_1DBE4A8EC();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)sharedContainerIdentifier
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  swift_retain();
  sub_1DBDFDEE8();
  v3 = v2;
  swift_release();
  if (v3)
  {
    v4 = (void *)sub_1DBE4A8EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

@end
