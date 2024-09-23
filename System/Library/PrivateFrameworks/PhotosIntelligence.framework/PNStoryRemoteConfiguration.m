@implementation PNStoryRemoteConfiguration

+ (NSString)personalTraitsEntityConfiguration
{
  void *v2;

  static StoryRemoteConfiguration.personalTraitsEntityConfiguration.getter();
  v2 = (void *)sub_243F84E08();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (PNStoryRemoteConfiguration)init
{
  return (PNStoryRemoteConfiguration *)StoryRemoteConfiguration.init()();
}

- (id)fileURLForFactorKey:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  PNStoryRemoteConfiguration *v10;
  void *v11;
  uint64_t v13;

  v5 = sub_243F83C38();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_243F84E2C();
  v10 = self;
  sub_243DB68A8();
  swift_bridgeObjectRelease();

  v11 = (void *)sub_243F83BCC();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  return v11;
}

- (void).cxx_destruct
{

}

@end
