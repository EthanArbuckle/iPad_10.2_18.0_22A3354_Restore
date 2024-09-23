@implementation _UIBlurThroughEffect

- (_UIBlurThroughEffect)initWithStyle:(int64_t)a3
{

  return 0;
}

+ (id)_blurThroughWithStyle:(int64_t)a3
{
  return -[_UIBlurThroughEffect initWithStyle:]([_UIBlurThroughEffect alloc], "initWithStyle:", a3);
}

- (int64_t)_expectedUsage
{
  return 1;
}

- (BOOL)_indicatesMacSidebarBackground
{
  return 1;
}

@end
