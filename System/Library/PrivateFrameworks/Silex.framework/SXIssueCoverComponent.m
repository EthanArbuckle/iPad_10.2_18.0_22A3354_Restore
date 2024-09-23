@implementation SXIssueCoverComponent

+ (id)typeString
{
  return CFSTR("issue_cover");
}

- (BOOL)videoPlaybackEnabledWithValue:(id)a3 withType:(int)a4
{
  if (a4 == 2)
    return objc_msgSend(a3, "BOOLValue");
  else
    return 1;
}

@end
