@implementation WFIconComposePreviewView

- (WFIconComposePreviewView)initWithFrame:(CGRect)a3
{
  WFIconComposePreviewView *v3;
  WFIconComposePreviewView *v4;
  void *v5;
  uint64_t v6;
  WFWorkflowIconDrawer *iconDrawer;
  WFIconComposePreviewView *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFIconComposePreviewView;
  v3 = -[WFIconComposePreviewView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[WFIconComposePreviewView setContentMode:](v3, "setContentMode:", 3);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFIconComposePreviewView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = objc_opt_new();
    iconDrawer = v4->_iconDrawer;
    v4->_iconDrawer = (WFWorkflowIconDrawer *)v6;

    v8 = v4;
  }

  return v4;
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
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)WFIconComposePreviewView;
  -[WFIconComposePreviewView drawRect:](&v15, sel_drawRect_);
  -[WFIconComposePreviewView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceStyle") == 2;
  -[WFIconComposePreviewView iconDrawer](self, "iconDrawer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDark:", v9);

  v11 = objc_msgSend(v8, "accessibilityContrast") == 1;
  -[WFIconComposePreviewView iconDrawer](self, "iconDrawer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHighContrast:", v11);

  -[WFIconComposePreviewView iconDrawer](self, "iconDrawer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC1378], "currentContextWithScale:", 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "drawInContext:inRect:", v14, x, y, width, height);

}

- (void)setIcon:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[WFIconComposePreviewView iconDrawer](self, "iconDrawer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIcon:", v4);

  -[WFIconComposePreviewView setNeedsDisplay](self, "setNeedsDisplay");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 150.0;
  v3 = 150.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (WFWorkflowIconDrawer)iconDrawer
{
  return self->_iconDrawer;
}

- (void)setIconDrawer:(id)a3
{
  objc_storeStrong((id *)&self->_iconDrawer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconDrawer, 0);
}

@end
