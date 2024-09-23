@implementation PFXSvg

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFXSvg;
  -[PFXDrawable dealloc](&v3, "dealloc");
}

- (void)_addAlternateDescription:(id)a3 toChildInfo:(id)a4
{
  uint64_t v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  id v11;

  v6 = objc_opt_class(TSDDrawableInfo);
  *(_QWORD *)&v8 = TSUDynamicCast(v6, a4).n128_u64[0];
  if (v7)
  {
    v9 = v7;
    if (objc_msgSend(a3, "length", v8))
    {
      v11 = objc_msgSend(v9, "accessibilityDescriptions");
      if (!v11)
      {
        v11 = (id)objc_opt_new(NSMutableDictionary, v10);
        objc_msgSend(v9, "setAccessibilityDescriptions:", v11);

      }
      objc_msgSend(v11, "setObject:forKey:", a3, CFSTR("siblingTitle"));
    }
  }
}

- (void)_addURLToChildInfo:(id)a3
{
  uint64_t v5;
  double v6;
  id v7;

  if (-[PFXSvg URL](self, "URL"))
  {
    v5 = objc_opt_class(TSDDrawableInfo);
    *(_QWORD *)&v6 = TSUDynamicCast(v5, a3).n128_u64[0];
    objc_msgSend(v7, "setHyperlinkURL:", -[PFXSvg URL](self, "URL", v6));
  }
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5;
  id v6;
  objc_super v8;

  v5 = objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "valueForAttribute:", "href");
  if (v5)
  {
    v6 = v5;
    if (objc_msgSend(v5, "length"))
      -[PFXSvg setURL:](self, "setURL:", +[NSURL URLWithString:](NSURL, "URLWithString:", v6));
  }
  v8.receiver = self;
  v8.super_class = (Class)PFXSvg;
  return -[PFXDrawable mapStartElementWithState:](&v8, "mapStartElementWithState:", a3);
}

- (void)mapEndElementWithState:(id)a3
{
  id v5;
  id v6;
  char *v7;
  id v8;
  char *v9;
  id v10;
  char *i;
  id v12;
  objc_super v13;

  v5 = objc_msgSend(a3, "currentHtmlStackEntry");
  v6 = objc_msgSend(v5, "currentEntryMediaState");
  v7 = (char *)objc_msgSend(v6, "childResultCount");
  if (v7 == (_BYTE *)&dword_0 + 1)
  {
    v8 = objc_msgSend(v6, "childResultAtIndex:", 0);
    if (objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___TSDInfo))
    {
      objc_msgSend(v6, "setResult:", v8);
      -[PFXSvg _addAlternateDescription:toChildInfo:](self, "_addAlternateDescription:toChildInfo:", objc_msgSend(v6, "altDesc"), v8);
      -[PFXSvg _addURLToChildInfo:](self, "_addURLToChildInfo:", v8);
      if (objc_msgSend(a3, "isInsideWidget"))
        objc_msgSend(v5, "addChildAttributesToParentForResult:", v8);
    }
  }
  else
  {
    v9 = v7;
    v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v7);
    if (v9)
    {
      for (i = 0; i != v9; ++i)
      {
        v12 = objc_msgSend(v6, "childResultAtIndex:", i);
        if (objc_msgSend(v12, "conformsToProtocol:", &OBJC_PROTOCOL___TSDInfo))
        {
          objc_msgSend(v10, "addObject:", v12);
          -[PFXSvg _addAlternateDescription:toChildInfo:](self, "_addAlternateDescription:toChildInfo:", objc_msgSend(v6, "altDesc"), v12);
          -[PFXSvg _addURLToChildInfo:](self, "_addURLToChildInfo:", v12);
        }
      }
    }
    objc_msgSend(v6, "setResult:", v10);

  }
  v13.receiver = self;
  v13.super_class = (Class)PFXSvg;
  -[PFXDrawable mapEndElementWithState:](&v13, "mapEndElementWithState:", a3);
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
