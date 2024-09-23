@implementation PSFooterMultiHyperlinkViewLinkSpec

+ (id)specWithRange:(_NSRange)a3 url:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  PSFooterMultiHyperlinkViewLinkSpec *v7;

  length = a3.length;
  location = a3.location;
  v6 = a4;
  v7 = objc_alloc_init(PSFooterMultiHyperlinkViewLinkSpec);
  -[PSFooterMultiHyperlinkViewLinkSpec setLinkRange:](v7, "setLinkRange:", location, length);
  -[PSFooterMultiHyperlinkViewLinkSpec setURL:](v7, "setURL:", v6);

  return v7;
}

+ (id)specWithRange:(_NSRange)a3 target:(id)a4 action:(SEL)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  PSFooterMultiHyperlinkViewLinkSpec *v9;

  length = a3.length;
  location = a3.location;
  v8 = a4;
  v9 = objc_alloc_init(PSFooterMultiHyperlinkViewLinkSpec);
  -[PSFooterMultiHyperlinkViewLinkSpec setLinkRange:](v9, "setLinkRange:", location, length);
  -[PSFooterMultiHyperlinkViewLinkSpec setTarget:](v9, "setTarget:", v8);

  -[PSFooterMultiHyperlinkViewLinkSpec setAction:](v9, "setAction:", a5);
  return v9;
}

- (_NSRange)linkRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_linkRange.length;
  location = self->_linkRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setLinkRange:(_NSRange)a3
{
  self->_linkRange = a3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->_target, a3);
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
