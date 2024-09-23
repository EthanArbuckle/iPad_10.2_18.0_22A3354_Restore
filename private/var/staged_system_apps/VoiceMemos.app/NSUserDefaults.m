@implementation NSUserDefaults

- (BOOL)isRecording
{
  NSUserDefaults *v2;
  NSString v3;
  unsigned __int8 v4;

  v2 = self;
  v3 = String._bridgeToObjectiveC()();
  v4 = -[NSUserDefaults BOOLForKey:](v2, "BOOLForKey:", v3);

  return v4;
}

- (void)setIsRecording:(BOOL)a3
{
  _BOOL8 v3;
  NSUserDefaults *v4;
  id v5;

  v3 = a3;
  v4 = self;
  v5 = String._bridgeToObjectiveC()();
  -[NSUserDefaults setBool:forKey:](v4, "setBool:forKey:", v3, v5);

}

@end
