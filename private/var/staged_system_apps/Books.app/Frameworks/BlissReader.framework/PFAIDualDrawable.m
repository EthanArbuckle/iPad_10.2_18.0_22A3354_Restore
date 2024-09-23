@implementation PFAIDualDrawable

+ (BOOL)shouldImportInCurrentLayoutWithStackEntry:(id)a3 state:(id)a4
{
  void *v7;
  void *v8;
  unsigned int v9;
  BOOL result;

  if (!objc_msgSend(a3, "reader"))
    return 1;
  v7 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___PFAIDualDrawable, objc_msgSend(a3, "reader"));
  if (!v7)
    return objc_msgSend(a1, "shouldImportInCurrentLayoutWithStackEntry:state:", objc_msgSend(a3, "parentEntry"), a4);
  v8 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___PFXDrawablePlacementVendor, objc_msgSend(v7, "currentSubreaderWithState:", a4));
  if (!v8)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[PFAIDualDrawable shouldImportInCurrentLayoutWithStackEntry:state:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/PFAIDualDrawable.mm"), 39, CFSTR("invalid nil value for '%s'"), "drawableMapper");
    return 1;
  }
  v9 = objc_msgSend(objc_msgSend(v8, "placement"), "mode");
  result = 1;
  switch(v9)
  {
    case 0u:
      result = 0;
      break;
    case 1u:
      result = objc_msgSend(a4, "paginatedIsCurrent");
      break;
    case 4u:
      return objc_msgSend(a1, "shouldImportInCurrentLayoutWithStackEntry:state:", objc_msgSend(a3, "parentEntry"), a4);
    case 5u:
    case 6u:
      result = objc_msgSend(a4, "flowIsCurrent");
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)shouldImportInCurrentLayoutWithState:(id)a3
{
  return objc_msgSend((id)objc_opt_class(self), "shouldImportInCurrentLayoutWithStackEntry:state:", objc_msgSend(a3, "currentXmlStackEntry"), a3);
}

@end
