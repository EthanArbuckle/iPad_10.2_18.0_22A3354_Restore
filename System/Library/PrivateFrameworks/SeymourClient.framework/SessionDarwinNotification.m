@implementation SessionDarwinNotification

+ (int)sessionStatusToken
{
  return 5355107;
}

+ (NSString)sessionUpdated
{
  return (NSString *)(id)sub_1CE0B626C();
}

+ (NSString)sessionMindAppRequirementConfirmation
{
  return (NSString *)(id)sub_1CE0B626C();
}

+ (NSString)sessionWorkoutAppRequirementConfirmation
{
  return (NSString *)(id)sub_1CE0B626C();
}

+ (NSString)sessionGuidedRunWorkoutAppRequirementConfirmation
{
  return (NSString *)(id)sub_1CE0B626C();
}

+ (NSString)sessionGuidedWalkWorkoutAppRequirementConfirmation
{
  return (NSString *)(id)sub_1CE0B626C();
}

- (_TtC13SeymourClient25SessionDarwinNotification)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SessionDarwinNotification();
  return -[SessionDarwinNotification init](&v3, sel_init);
}

@end
