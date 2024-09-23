@implementation NSUserDefaults

- (BOOL)userHasAcknowledgedFindMy
{
  NSUserDefaults *v2;
  NSString v3;
  unsigned __int8 v4;

  v2 = self;
  v3 = String._bridgeToObjectiveC()();
  v4 = -[NSUserDefaults BOOLForKey:](v2, "BOOLForKey:", v3);

  return v4;
}

- (void)setUserHasAcknowledgedFindMy:(BOOL)a3
{
  NSUserDefaults *v3;
  Class isa;
  NSString v5;

  v3 = self;
  isa = Bool._bridgeToObjectiveC()().super.super.isa;
  v5 = String._bridgeToObjectiveC()();
  -[NSUserDefaults setValue:forKey:](v3, "setValue:forKey:", isa, v5);

}

@end
