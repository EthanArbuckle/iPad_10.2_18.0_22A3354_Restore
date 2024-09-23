@implementation PFXUtilities

+ (BOOL)elementHasTextAlign:(const char *)a3
{
  id v3;

  v3 = +[PFXElementInfo elementInfoForElement:](PFXElementInfo, "elementInfoForElement:", a3);
  if (v3)
    LOBYTE(v3) = objc_msgSend(v3, "hasTextAlign");
  return (char)v3;
}

+ (BOOL)elementIsTableRelated:(const char *)a3
{
  id v3;

  v3 = +[PFXElementInfo elementInfoForElement:](PFXElementInfo, "elementInfoForElement:", a3);
  if (v3)
    LOBYTE(v3) = objc_msgSend(v3, "isTableRelated");
  return (char)v3;
}

+ (BOOL)elementDenotesList:(const char *)a3
{
  id v3;

  v3 = +[PFXElementInfo elementInfoForElement:](PFXElementInfo, "elementInfoForElement:", a3);
  if (v3)
    LOBYTE(v3) = objc_msgSend(v3, "denotesList");
  return (char)v3;
}

+ (BOOL)elementDenotesListItem:(const char *)a3
{
  id v3;

  v3 = +[PFXElementInfo elementInfoForElement:](PFXElementInfo, "elementInfoForElement:", a3);
  if (v3)
    LOBYTE(v3) = objc_msgSend(v3, "denotesListItem");
  return (char)v3;
}

+ (BOOL)hasEntry:(id)a3 inArchive:(id)a4
{
  BOOL result;

  result = 0;
  if (a3)
  {
    if (a4)
      return objc_msgSend(a4, "entryWithName:") != 0;
  }
  return result;
}

+ (id)valueForRegExpression:(id)a3 inProcessingInstruction:(id)a4 searchOptions:(unint64_t)a5 attributeName:(id)a6
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;

  v8 = objc_msgSend(a3, "matchesInString:options:range:", a4, a5, 0, objc_msgSend(a4, "length"));
  if (!v8)
    return 0;
  v9 = v8;
  if (!objc_msgSend(v8, "count"))
    return 0;
  v10 = objc_msgSend(objc_msgSend(v9, "lastObject"), "range");
  v12 = objc_msgSend(objc_msgSend(a4, "substringWithRange:", v10, v11), "substringFromIndex:", (char *)objc_msgSend(a6, "length") + 2);
  return objc_msgSend(v12, "substringToIndex:", (char *)objc_msgSend(v12, "length") - 1);
}

+ (id)createPIRegularExpressionForAttribute:(id)a3 searchOptions:(unint64_t)a4
{
  id v4;
  id v6;

  v6 = 0;
  v4 = objc_msgSend(objc_alloc((Class)NSRegularExpression), "initWithPattern:options:error:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@=[\"'][A-Za-z0-9 .\\-/\\(\\):]+[\"']"), a3), a4, &v6);
  if (v6)

  return v4;
}

+ (id)valueOfHrefAttributeInProcessingInstruction:(id)a3
{
  void *v4;

  if (!qword_5433D0)
  {
    v4 = (void *)objc_opt_class(a1);
    objc_sync_enter(v4);
    if (!qword_5433D0)
      qword_5433D0 = (uint64_t)objc_msgSend(a1, "createPIRegularExpressionForAttribute:searchOptions:", CFSTR("href"), 0);
    objc_sync_exit(v4);
  }
  return objc_msgSend(a1, "valueForRegExpression:inProcessingInstruction:searchOptions:attributeName:");
}

+ (id)valueOfMediaAttributeInProcessingInstruction:(id)a3
{
  void *v4;

  if (!qword_5433D8)
  {
    v4 = (void *)objc_opt_class(a1);
    objc_sync_enter(v4);
    if (!qword_5433D8)
      qword_5433D8 = (uint64_t)objc_msgSend(a1, "createPIRegularExpressionForAttribute:searchOptions:", CFSTR("media"), 0);
    objc_sync_exit(v4);
  }
  return objc_msgSend(a1, "valueForRegExpression:inProcessingInstruction:searchOptions:attributeName:");
}

+ (id)valueOfTypeAttributeInProcessingInstruction:(id)a3
{
  void *v4;

  if (!qword_5433E0)
  {
    v4 = (void *)objc_opt_class(a1);
    objc_sync_enter(v4);
    if (!qword_5433E0)
      qword_5433E0 = (uint64_t)objc_msgSend(a1, "createPIRegularExpressionForAttribute:searchOptions:", CFSTR("type"), 0);
    objc_sync_exit(v4);
  }
  return objc_msgSend(a1, "valueForRegExpression:inProcessingInstruction:searchOptions:attributeName:");
}

@end
