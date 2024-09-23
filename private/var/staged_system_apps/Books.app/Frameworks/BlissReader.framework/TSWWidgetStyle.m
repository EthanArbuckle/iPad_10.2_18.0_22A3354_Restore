@implementation TSWWidgetStyle

+ (id)properties
{
  id result;

  result = (id)qword_543160;
  if (!qword_543160)
  {
    result = objc_msgSend(objc_alloc((Class)TSSPropertySet), "initWithProperties:", 4622, 0);
    qword_543160 = (uint64_t)result;
  }
  return result;
}

@end
