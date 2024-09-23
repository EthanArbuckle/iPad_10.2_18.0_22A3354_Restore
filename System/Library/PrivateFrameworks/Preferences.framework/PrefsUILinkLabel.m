@implementation PrefsUILinkLabel

- (PrefsUILinkLabel)initWithFrame:(CGRect)a3
{
  PrefsUILinkLabel *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PrefsUILinkLabel;
  v3 = -[PrefsUILinkLabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v3, sel_tappedLink_);
    -[PrefsUILinkLabel addGestureRecognizer:](v3, "addGestureRecognizer:", v4);
    -[PrefsUILinkLabel setDrawsUnderline:](v3, "setDrawsUnderline:", 1);
    -[PrefsUILinkLabel setTarget:](v3, "setTarget:", v3);
    -[PrefsUILinkLabel setAction:](v3, "setAction:", sel_openURL_);

  }
  return v3;
}

- (void)setAction:(SEL)a3
{
  id WeakRetained;

  if (self->_action != a3)
  {
    self->_action = a3;
    if (a3)
    {
      WeakRetained = objc_loadWeakRetained(&self->_target);
      -[PrefsUILinkLabel setUserInteractionEnabled:](self, "setUserInteractionEnabled:", WeakRetained != 0);

    }
    else
    {
      -[PrefsUILinkLabel setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
    }
  }
}

- (void)setTarget:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained(&self->_target);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak(&self->_target, obj);
    if (self->_action)
    {
      v6 = objc_loadWeakRetained(&self->_target);
      -[PrefsUILinkLabel setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v6 != 0);

    }
    else
    {
      -[PrefsUILinkLabel setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
    }
    v5 = obj;
  }

}

- (void)openURL:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PrefsUILinkLabel URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openURL:options:completionHandler:", v4, MEMORY[0x1E0C9AA70], 0);

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if (-[PrefsUILinkLabel action](self, "action", a3, a4))
  {
    self->_touchingURL = 1;
    -[PrefsUILinkLabel setHighlighted:](self, "setHighlighted:", 1);
    -[PrefsUILinkLabel setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  BOOL v16;
  void *v17;
  CGPoint v18;
  CGRect v19;

  objc_msgSend(a3, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v17 = v5;
    -[PrefsUILinkLabel bounds](self, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v17, "locationInView:", self);
    v18.x = v14;
    v18.y = v15;
    v19.origin.x = v7;
    v19.origin.y = v9;
    v19.size.width = v11;
    v19.size.height = v13;
    v16 = CGRectContainsPoint(v19, v18);
    v5 = v17;
    if (!v16)
    {
      if (self->_touchingURL)
      {
        -[PrefsUILinkLabel setNeedsDisplay](self, "setNeedsDisplay");
        v5 = v17;
      }
      self->_touchingURL = 0;
    }
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[PrefsUILinkLabel setHighlighted:](self, "setHighlighted:", 0, a4);
  self->_touchingURL = 0;
  -[PrefsUILinkLabel setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[PrefsUILinkLabel setHighlighted:](self, "setHighlighted:", 0, a4);
  self->_touchingURL = 0;
  -[PrefsUILinkLabel setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)tappedLink:(id)a3
{
  id v4;
  id v5;

  if (-[PrefsUILinkLabel action](self, "action", a3))
  {
    self->_touchingURL = 0;
    -[PrefsUILinkLabel setHighlighted:](self, "setHighlighted:", 0);
    -[PrefsUILinkLabel setNeedsDisplay](self, "setNeedsDisplay");
    -[PrefsUILinkLabel action](self, "action");
    -[PrefsUILinkLabel target](self, "target");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (id)SFPerformSelector();

  }
}

- (id)color:(id)a3 byMultiplyingSubComponentsBy:(float)a4
{
  id v5;
  void *v6;
  double v8;
  double v9;
  double v10;
  double v11;

  v5 = a3;
  v10 = 0.0;
  v11 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  v6 = v5;
  if (objc_msgSend(v5, "getRed:green:blue:alpha:", &v11, &v10, &v9, &v8))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v11 * a4, v10 * a4, v9 * a4, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (SEL)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
