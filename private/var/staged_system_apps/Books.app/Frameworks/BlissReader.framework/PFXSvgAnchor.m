@implementation PFXSvgAnchor

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFXSvgAnchor;
  -[PFXSvgAnchor dealloc](&v3, "dealloc");
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v4;
  id v5;

  v4 = objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "valueForAttribute:", "href");
  if (v4)
  {
    v5 = v4;
    if (objc_msgSend(v4, "length"))
      -[PFXSvgAnchor setURL:](self, "setURL:", +[NSURL URLWithString:](NSURL, "URLWithString:", v5));
  }
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  id v4;
  char *v5;
  char *v6;
  char *i;
  id v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;

  v4 = objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState");
  objc_msgSend(objc_msgSend(v4, "parentEntryMediaState"), "addChildResultsFromState:", v4);
  v5 = (char *)objc_msgSend(v4, "childResultCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      v8 = objc_msgSend(v4, "childResultAtIndex:", i);
      v9 = objc_opt_class(TSDDrawableInfo);
      *(_QWORD *)&v10 = TSUDynamicCast(v9, v8).n128_u64[0];
      v12 = v11;
      if (-[PFXSvgAnchor URL](self, "URL", v10))
        objc_msgSend(v12, "setHyperlinkURL:", -[PFXSvgAnchor URL](self, "URL"));
    }
  }
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

@end
