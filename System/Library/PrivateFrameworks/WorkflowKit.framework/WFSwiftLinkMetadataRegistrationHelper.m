@implementation WFSwiftLinkMetadataRegistrationHelper

+ (BOOL)registerWithBundle:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v6;

  sub_1C1B0F224();
  v6 = a3;
  sub_1C164A4B0(v6);
  swift_bridgeObjectRelease();

  return 1;
}

- (WFSwiftLinkMetadataRegistrationHelper)init
{
  return (WFSwiftLinkMetadataRegistrationHelper *)LinkMetadataRegistrationHelper.init()();
}

@end
