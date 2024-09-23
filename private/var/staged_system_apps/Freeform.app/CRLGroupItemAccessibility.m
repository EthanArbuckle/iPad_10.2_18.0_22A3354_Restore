@implementation CRLGroupItemAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("Freeform.CRLGroupItem");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLBoardItemAccessibility, a2);
}

- (id)crlaxTypeDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("GROUP_ACCESSIBILITY"), CFSTR("Group"), 0));

  return v3;
}

@end
