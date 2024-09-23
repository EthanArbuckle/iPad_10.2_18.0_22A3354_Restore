@implementation GroupActivitiesManager.SuggestionProvider

- (UIActivityItemsConfigurationReading)activityItemsConfiguration
{
  _TtCE5MusicC9MusicCore22GroupActivitiesManager18SuggestionProvider *v2;
  id v3;

  v2 = self;
  v3 = GroupActivitiesManager.SuggestionProvider.activityItemsConfiguration.getter();

  return (UIActivityItemsConfigurationReading *)v3;
}

- (_TtCE5MusicC9MusicCore22GroupActivitiesManager18SuggestionProvider)init
{
  objc_class *ObjectType;
  char *v4;
  char *v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = (char *)self
     + OBJC_IVAR____TtCE5MusicC9MusicCore22GroupActivitiesManager18SuggestionProvider_playingItemSuggestion;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_OWORD *)v4 + 2) = 0u;
  *((_OWORD *)v4 + 3) = 0u;
  *((_QWORD *)v4 + 8) = 0;
  v5 = (char *)self
     + OBJC_IVAR____TtCE5MusicC9MusicCore22GroupActivitiesManager18SuggestionProvider_containerItemSuggestion;
  *((_QWORD *)v5 + 8) = 0;
  *((_OWORD *)v5 + 2) = 0u;
  *((_OWORD *)v5 + 3) = 0u;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[GroupActivitiesManager.SuggestionProvider init](&v7, "init");
}

- (void).cxx_destruct
{
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtCE5MusicC9MusicCore22GroupActivitiesManager18SuggestionProvider_playingItemSuggestion, &qword_1011B2DF8);
  sub_10004FF60((uint64_t)self+ OBJC_IVAR____TtCE5MusicC9MusicCore22GroupActivitiesManager18SuggestionProvider_containerItemSuggestion, &qword_1011B2DF8);
}

@end
