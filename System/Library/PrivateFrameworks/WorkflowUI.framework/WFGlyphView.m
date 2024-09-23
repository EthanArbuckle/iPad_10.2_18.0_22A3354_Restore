@implementation WFGlyphView

- (WFGlyphView)initWithFrame:(CGRect)a3
{
  WFGlyphView *v3;
  void *v4;
  uint64_t v5;
  WFWorkflowIconDrawer *iconDrawer;
  WFGlyphView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFGlyphView;
  v3 = -[WFGlyphView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFGlyphView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[WFGlyphView setGlyphInsets:](v3, "setGlyphInsets:", 5.0, 5.0, 5.0, 5.0);
    -[WFGlyphView setContentMode:](v3, "setContentMode:", 3);
    v5 = objc_opt_new();
    iconDrawer = v3->_iconDrawer;
    v3->_iconDrawer = (WFWorkflowIconDrawer *)v5;

    -[WFWorkflowIconDrawer setDrawBackground:](v3->_iconDrawer, "setDrawBackground:", 0);
    v7 = v3;
  }

  return v3;
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  _BOOL8 v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19.receiver = self;
  v19.super_class = (Class)WFGlyphView;
  -[WFGlyphView drawRect:](&v19, sel_drawRect_);
  -[WFGlyphView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceStyle") == 2;
  -[WFGlyphView iconDrawer](self, "iconDrawer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDark:", v9);

  v11 = objc_msgSend(v8, "accessibilityContrast") == 1;
  -[WFGlyphView iconDrawer](self, "iconDrawer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHighContrast:", v11);

  -[WFGlyphView iconDrawer](self, "iconDrawer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC1378], "currentContextWithScale:", 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFGlyphView glyphInsets](self, "glyphInsets");
  objc_msgSend(v13, "drawInContext:inRect:", v14, x + v18, y + v15, width - (v18 + v16), height - (v15 + v17));

}

- (BOOL)outline
{
  void *v2;
  char v3;

  -[WFGlyphView iconDrawer](self, "iconDrawer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "outline");

  return v3;
}

- (void)setOutline:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[WFGlyphView iconDrawer](self, "iconDrawer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOutline:", v3);

}

- (unsigned)glyphCharacter
{
  void *v2;
  unsigned __int16 v3;

  -[WFGlyphView iconDrawer](self, "iconDrawer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "glyphCharacter");

  return v3;
}

- (void)setGlyphCharacter:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;

  v3 = a3;
  if (-[WFGlyphView glyphCharacter](self, "glyphCharacter") != a3)
  {
    -[WFGlyphView iconDrawer](self, "iconDrawer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGlyphCharacter:", v3);

    -[WFGlyphView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (UIColor)glyphColor
{
  void *v2;
  void *v3;
  void *v4;

  -[WFGlyphView iconDrawer](self, "iconDrawer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "glyphColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UIColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

- (void)setGlyphColor:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[WFGlyphView glyphColor](self, "glyphColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v8);

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC1398]), "initWithPlatformColor:", v8);
    -[WFGlyphView iconDrawer](self, "iconDrawer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setGlyphColor:", v6);

    -[WFGlyphView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (UIEdgeInsets)glyphInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_glyphInsets.top;
  left = self->_glyphInsets.left;
  bottom = self->_glyphInsets.bottom;
  right = self->_glyphInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setGlyphInsets:(UIEdgeInsets)a3
{
  self->_glyphInsets = a3;
}

- (WFWorkflowIconDrawer)iconDrawer
{
  return self->_iconDrawer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconDrawer, 0);
}

@end
