@implementation _WTColor

+ (_WTColor)platformTextColor
{
  return (_WTColor *)objc_msgSend((id)objc_opt_class(), "grayColor");
}

@end
