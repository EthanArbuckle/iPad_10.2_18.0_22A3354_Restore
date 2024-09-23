@implementation PREditingHideButton

+ (id)editingTitledButtonSymbolName:(BOOL)a3
{
  if (a3)
    return CFSTR("eye.slash.fill");
  else
    return CFSTR("eye.fill");
}

+ (int64_t)editingTitledButtonType
{
  return 0;
}

@end
