@implementation THEmptyNoteCardInfoAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THEmptyNoteCardInfo");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (NSString)thaxFrontDescription
{
  return 0;
}

- (NSString)thaxFrontHint
{
  return 0;
}

- (NSString)thaxBackDescription
{
  return 0;
}

- (NSString)thaxBackHint
{
  return 0;
}

@end
