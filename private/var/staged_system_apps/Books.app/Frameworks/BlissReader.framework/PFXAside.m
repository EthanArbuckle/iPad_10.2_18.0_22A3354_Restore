@implementation PFXAside

- (BOOL)mapStartElementWithState:(id)a3
{
  id v3;

  v3 = objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "valueForAttribute:", "type");
  if ((objc_msgSend(CFSTR("noteref"), "isEqualToString:", v3) & 1) != 0)
    return 1;
  else
    return objc_msgSend(CFSTR("footnote"), "isEqualToString:", v3);
}

- (void)mapEndElementWithState:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  NSString *v11;

  v4 = objc_msgSend(a3, "currentHtmlStackEntry");
  v5 = objc_msgSend(v4, "currentEntryMediaState");
  if (objc_msgSend(v5, "childResultCount") == (char *)&dword_0 + 1)
  {
    v6 = objc_msgSend(v5, "childResultAtIndex:", 0);
    v7 = objc_opt_class(THWViewportInfo);
    *(_QWORD *)&v9 = TSUDynamicCast(v7, v6).n128_u64[0];
    if (v8)
    {
      v10 = v8;
      v11 = +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", objc_msgSend(v4, "xmlElementId", v9));
      if (-[NSString length](v11, "length"))
        objc_msgSend(a3, "setTargetDrawableInfo:withIdentifier:", v10, v11);
    }
  }
}

@end
