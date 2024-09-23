@implementation SUDOMElement

- (SUDOMElement)initWithDOMElement:(id)a3
{
  SUDOMElement *v4;

  v4 = -[SUDOMElement init](self, "init");
  if (v4)
    v4->_element = (DOMElement *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUDOMElement;
  -[SUDOMElement dealloc](&v3, sel_dealloc);
}

+ (CGRect)frameForDOMElement:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  WebThreadLock();
  if (a3)
    objc_msgSend(a3, "innerFrameQuad");
  v4 = (float)0.0;
  v5 = v4;
  v6 = (float)((float)0.0 - (float)0.0);
  v7 = v6;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)frame
{
  UIWebView *webView;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  webView = self->_webView;
  if (webView)
  {
    -[SUDOMElement _frame](self, "_frame");
    -[UIWebView convertRect:toView:](webView, "convertRect:toView:", 0);
  }
  else
  {
    v3 = *MEMORY[0x24BDBF090];
    v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (UIImage)imageRepresentation
{
  void *v3;
  UIImage *v4;
  UIWebView *webView;
  uint64_t v6;
  CGImage *v7;

  if (!self->_image)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (WebThreadLock(),
          v3 = (void *)-[DOMElement dataRepresentation:](self->_element, "dataRepresentation:", 0),
          objc_msgSend(v3, "length")))
    {
      v4 = (UIImage *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithData:", v3);
      self->_image = v4;
      if (v4)
        return self->_image;
    }
    else if (self->_image)
    {
      return self->_image;
    }
    webView = self->_webView;
    -[SUDOMElement _frame](self, "_frame");
    v6 = -[UIWebView newSnapshotWithRect:](webView, "newSnapshotWithRect:");
    if (v6)
    {
      v7 = (CGImage *)v6;
      self->_image = (UIImage *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithCGImage:", v6);
      CGImageRelease(v7);
    }
  }
  return self->_image;
}

- (NSString)innerText
{
  NSString *v3;

  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0;
  v3 = -[DOMElement innerText](self->_element, "innerText");
  return -[NSString stringByTrimmingCharactersInSet:](v3, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet"));
}

- (id)newImageView
{
  UIImage *v3;

  v3 = -[SUDOMElement imageRepresentation](self, "imageRepresentation");
  if (v3)
  {
    v3 = (UIImage *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v3);
    -[SUDOMElement frame](self, "frame");
    -[UIImage setFrame:](v3, "setFrame:");
  }
  return v3;
}

- (id)newLabelForElementWithText:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;

  v5 = (void *)objc_msgSend((id)-[DOMElement ownerDocument](self->_element, "ownerDocument"), "getComputedStyle:pseudoElement:", self->_element, &stru_24DE83F60);
  v6 = objc_msgSend(v5, "getPropertyValue:", CFSTR("font-family"));
  v7 = (void *)objc_msgSend(v5, "getPropertyCSSValue:", CFSTR("font-size"));
  v8 = -1.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "getFloatValue:", 5);
    v8 = v9;
  }
  v10 = (void *)objc_msgSend(v5, "getPropertyCSSValue:", CFSTR("color"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11 = (void *)objc_msgSend(v10, "getRGBColorValue");
  else
    v11 = 0;
  v12 = 0;
  if (v6)
  {
    if (v8 > 0.00000011921)
    {
      v13 = objc_alloc(MEMORY[0x24BDF6B68]);
      -[SUDOMElement frame](self, "frame");
      v12 = (void *)objc_msgSend(v13, "initWithFrame:");
      objc_msgSend(v12, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
      objc_msgSend(v12, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "fontWithFamilyName:traits:size:", v6, 2, v8));
      objc_msgSend(v12, "setText:", a3);
      v14 = objc_msgSend(v11, "color");
      if (v14)
        objc_msgSend(v12, "setTextColor:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:", v14));
    }
  }
  return v12;
}

- (void)setProperty:(id)a3 value:(id)a4
{
  WebThreadLock();
  -[DOMCSSStyleDeclaration setProperty:value:priority:](-[DOMElement style](self->_element, "style"), "setProperty:value:priority:", a3, a4, CFSTR("important"));
  objc_msgSend((id)-[UIWebView _browserView](self->_webView, "_browserView"), "forceLayout");
}

- (CGRect)_frame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  objc_msgSend((id)-[UIWebView _scrollView](self->_webView, "_scrollView"), "contentOffset");
  v4 = v3;
  v6 = v5;
  objc_msgSend((id)objc_opt_class(), "frameForDOMElement:", self->_element);
  v10 = v9 - v4;
  v12 = v11 - v6;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v12;
  result.origin.x = v10;
  return result;
}

- (DOMElement)element
{
  return self->_element;
}

- (UIWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
