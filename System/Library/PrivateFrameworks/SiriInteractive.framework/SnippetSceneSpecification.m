@implementation SnippetSceneSpecification

- (Class)settingsClass
{
  sub_24648150C();
  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)clientSettingsClass
{
  sub_246481528();
  return (Class)swift_getObjCClassFromMetadata();
}

- (NSString)uiSceneSessionRole
{
  _TtC15SiriInteractive25SnippetSceneSpecification *v2;
  id v3;

  v2 = self;
  v3 = sub_246472E34();

  return (NSString *)v3;
}

- (Class)uiSceneMinimumClass
{
  Class result;

  result = (Class)sub_246481580();
  if (result)
    return (Class)swift_getObjCClassFromMetadata();
  return result;
}

- (_TtC15SiriInteractive25SnippetSceneSpecification)init
{
  return (_TtC15SiriInteractive25SnippetSceneSpecification *)SnippetSceneSpecification.init()();
}

@end
