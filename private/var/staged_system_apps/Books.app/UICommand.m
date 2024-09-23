@implementation UICommand

- (NSString)books_themeID
{
  UICommand *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  UICommand.books_themeID.getter();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

@end
