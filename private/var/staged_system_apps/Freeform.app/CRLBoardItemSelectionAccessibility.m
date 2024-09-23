@implementation CRLBoardItemSelectionAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("Freeform.CRLBoardItemSelection");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLSubselectionAccessibility, a2);
}

- (NSSet)crlaxInfos
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemSelectionAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "boardItems"));

  return (NSSet *)v3;
}

- (unint64_t)crlaxInfoCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemSelectionAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "itemCount");

  return (unint64_t)v3;
}

@end
