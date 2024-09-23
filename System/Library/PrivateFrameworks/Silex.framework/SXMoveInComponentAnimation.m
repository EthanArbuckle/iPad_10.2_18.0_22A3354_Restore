@implementation SXMoveInComponentAnimation

- (Class)handlerClass
{
  return (Class)objc_opt_class();
}

- (int64_t)preferredStartingPositionWithValue:(id)a3 withType:(int)a4
{
  id v4;
  int64_t v5;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("left")) & 1) != 0)
  {
    v5 = 1;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("right")))
  {
    v5 = 2;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
