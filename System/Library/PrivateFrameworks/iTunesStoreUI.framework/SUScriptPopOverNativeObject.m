@implementation SUScriptPopOverNativeObject

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptPopOverNativeObject;
  -[SUScriptPopOverNativeObject dealloc](&v3, sel_dealloc);
}

- (void)destroyNativeObject
{
  void *v3;
  id v4;
  objc_super v5;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7FF8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF8030], 0);
  v4 = -[SUScriptNativeObject object](self, "object");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "isPopoverVisible"))
    objc_msgSend(v4, "dismissPopoverAnimated:", 0);
  v5.receiver = self;
  v5.super_class = (Class)SUScriptPopOverNativeObject;
  -[SUScriptNativeObject destroyNativeObject](&v5, sel_destroyNativeObject);
}

- (void)setupNativeObject
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__windowDidRotateNotification_, *MEMORY[0x24BDF7FF8], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__windowWillRotateNotification_, *MEMORY[0x24BDF8030], 0);
  v4.receiver = self;
  v4.super_class = (Class)SUScriptPopOverNativeObject;
  -[SUScriptNativeObject setupNativeObject](&v4, sel_setupNativeObject);
}

- (void)_windowDidRotateNotification:(id)a3
{
  SUScrollViewScroller *v4;
  UIScrollView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  _QWORD v15[6];

  if (self->_redisplayAfterRotation)
  {
    if (self->_sourceDOMElement)
    {
      v4 = objc_alloc_init(SUScrollViewScroller);
      v5 = -[UIWebView scrollView](-[SUDOMElement webView](self->_sourceDOMElement, "webView"), "scrollView");
      -[SUDOMElement frame](self->_sourceDOMElement, "frame");
      -[UIScrollView convertRect:fromView:](v5, "convertRect:fromView:", 0);
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      -[SUScrollViewScroller attachToScrollView:](v4, "attachToScrollView:", v5);
      v14 = objc_msgSend(MEMORY[0x24BEB20C0], "weakReferenceWithObject:", self);
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __60__SUScriptPopOverNativeObject__windowDidRotateNotification___block_invoke;
      v15[3] = &unk_24DE7AFB8;
      v15[4] = v14;
      v15[5] = v4;
      -[SUScrollViewScroller scrollFrameToVisible:animated:completionBlock:](v4, "scrollFrameToVisible:animated:completionBlock:", 1, v15, v7, v9, v11, v13);

    }
    -[SUScriptObject _setIgnoresDismiss:](-[SUScriptNativeObject scriptObject](self, "scriptObject", a3), "_setIgnoresDismiss:", 0);
    self->_redisplayAfterRotation = 0;
  }
}

uint64_t __60__SUScriptPopOverNativeObject__windowDidRotateNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "object");
  v3 = (void *)objc_msgSend(v2, "object");
  v4 = (void *)objc_msgSend(v2, "sourceDOMElement");
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    v6 = v4;
    v7 = (void *)objc_msgSend(v4, "webView");
    objc_msgSend(v6, "frame");
    objc_msgSend(v7, "convertRect:fromView:", 0);
    objc_msgSend(v3, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v7, 15, 1);
  }
  return objc_msgSend(*(id *)(a1 + 40), "detachFromScrollView");
}

- (void)_windowWillRotateNotification:(id)a3
{
  id v4;
  void *v5;

  if (-[SUScriptPopOverNativeObject _isAffectedByWindowNotification:](self, "_isAffectedByWindowNotification:", a3))
  {
    v4 = -[SUScriptNativeObject object](self, "object");
    if (self->_sourceDOMElement)
    {
      v5 = v4;
      if (objc_msgSend(v4, "isPopoverVisible"))
      {
        if (!objc_msgSend((id)objc_msgSend(v5, "contentViewController"), "presentedViewController"))
        {
          self->_redisplayAfterRotation = 1;
          -[SUScriptObject _setIgnoresDismiss:](-[SUScriptNativeObject scriptObject](self, "scriptObject"), "_setIgnoresDismiss:", 1);
          objc_msgSend(v5, "dismissPopoverAnimated:", 0);
        }
      }
    }
  }
}

- (BOOL)_isAffectedByWindowNotification:(id)a3
{
  void *v4;
  int v5;

  v4 = (void *)objc_msgSend(-[SUScriptNativeObject object](self, "object"), "contentViewController");
  v5 = objc_msgSend(v4, "isViewLoaded");
  if (v5)
    LOBYTE(v5) = objc_msgSend((id)objc_msgSend(v4, "view"), "isDescendantOfView:", objc_msgSend(a3, "object"));
  return v5;
}

- (UIBarButtonItem)sourceButtonItem
{
  return self->_sourceButtonItem;
}

- (void)setSourceButtonItem:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (SUDOMElement)sourceDOMElement
{
  return self->_sourceDOMElement;
}

- (void)setSourceDOMElement:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

@end
