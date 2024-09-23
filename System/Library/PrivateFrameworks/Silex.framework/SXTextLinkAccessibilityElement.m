@implementation SXTextLinkAccessibilityElement

- (SXTextLinkAccessibilityElement)initWithHyperlinkField:(id)a3 parentRep:(id)a4
{
  id v6;
  id v7;
  SXTextLinkAccessibilityElement *v8;
  SXTextLinkAccessibilityElement *v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  void *v13;
  uint64_t v14;
  NSURL *url;
  void *v16;
  uint64_t v17;
  NSString *displayText;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SXTextLinkAccessibilityElement;
  v8 = -[SXTextLinkAccessibilityElement initWithAccessibilityContainer:](&v20, sel_initWithAccessibilityContainer_, v7);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_parentRep, v7);
    v10 = objc_msgSend(v6, "range");
    v9->_rangeInParentRep.location = objc_msgSend(v7, "sxaxRepRelativeRangeFromStorageRelativeRange:", v10, v11);
    v9->_rangeInParentRep.length = v12;
    objc_msgSend(v6, "url");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    url = v9->_url;
    v9->_url = (NSURL *)v14;

    objc_msgSend(v6, "displayText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    displayText = v9->_displayText;
    v9->_displayText = (NSString *)v17;

  }
  return v9;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73D8];
}

- (CGRect)accessibilityFrame
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  -[SXTextLinkAccessibilityElement parentRep](self, "parentRep");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SXTextLinkAccessibilityElement rangeInParentRep](self, "rangeInParentRep");
  objc_msgSend(v3, "_accessibilityBoundsForRange:", v4, v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSRange v11;
  CGRect v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[SXTextLinkAccessibilityElement displayText](self, "displayText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11.location = -[SXTextLinkAccessibilityElement rangeInParentRep](self, "rangeInParentRep");
  NSStringFromRange(v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTextLinkAccessibilityElement accessibilityFrame](self, "accessibilityFrame");
  NSStringFromCGRect(v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTextLinkAccessibilityElement parentRep](self, "parentRep");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p text=\"%@\" range=%@ frame=%@ parent=%@>"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (SXTextTangierFlowRep)parentRep
{
  return (SXTextTangierFlowRep *)objc_loadWeakRetained((id *)&self->_parentRep);
}

- (void)setParentRep:(id)a3
{
  objc_storeWeak((id *)&self->_parentRep, a3);
}

- (_NSRange)rangeInParentRep
{
  _NSRange *p_rangeInParentRep;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_rangeInParentRep = &self->_rangeInParentRep;
  location = self->_rangeInParentRep.location;
  length = p_rangeInParentRep->length;
  result.length = length;
  result.location = location;
  return result;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)displayText
{
  return self->_displayText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayText, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_destroyWeak((id *)&self->_parentRep);
}

@end
