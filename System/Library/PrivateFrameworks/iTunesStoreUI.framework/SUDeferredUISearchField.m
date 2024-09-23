@implementation SUDeferredUISearchField

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUDeferredUISearchField;
  -[SUDeferredUISearchField dealloc](&v3, sel_dealloc);
}

- (BOOL)isDeferringInterfaceUpdates
{
  return self->_isDeferringInterfaceUpdates;
}

- (void)setDeferringInterfaceUpdates:(BOOL)a3
{
  if (self->_isDeferringInterfaceUpdates != a3)
  {
    if (!self->_isDeferringInterfaceUpdates)
      -[SUDeferredUISearchField _saveCurrentStateAsDeferred](self, "_saveCurrentStateAsDeferred");
    self->_isDeferringInterfaceUpdates = a3;
    if (!a3)
      -[SUDeferredUISearchField _commitDeferredInterfaceUpdates](self, "_commitDeferredInterfaceUpdates");
  }
}

- (int64_t)clearButtonMode
{
  objc_super v4;

  if (-[SUDeferredUISearchField isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
    return self->_deferredClearButtonMode;
  v4.receiver = self;
  v4.super_class = (Class)SUDeferredUISearchField;
  return -[SUDeferredUISearchField clearButtonMode](&v4, sel_clearButtonMode);
}

- (id)font
{
  objc_super v4;

  if (-[SUDeferredUISearchField isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
    return self->_deferredFont;
  v4.receiver = self;
  v4.super_class = (Class)SUDeferredUISearchField;
  return -[SUDeferredUISearchField font](&v4, sel_font);
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  objc_super v7;
  CGRect result;

  if (-[SUDeferredUISearchField isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
  {
    x = self->_deferredFrame.origin.x;
    y = self->_deferredFrame.origin.y;
    width = self->_deferredFrame.size.width;
    height = self->_deferredFrame.size.height;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SUDeferredUISearchField;
    -[SUDeferredUISearchField frame](&v7, sel_frame);
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (float)paddingLeft
{
  float result;
  objc_super v4;

  if (-[SUDeferredUISearchField isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
    return self->_deferredPaddingLeft;
  v4.receiver = self;
  v4.super_class = (Class)SUDeferredUISearchField;
  -[SUDeferredUISearchField paddingLeft](&v4, sel_paddingLeft);
  return result;
}

- (float)paddingTop
{
  float result;
  objc_super v4;

  if (-[SUDeferredUISearchField isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
    return self->_deferredPaddingTop;
  v4.receiver = self;
  v4.super_class = (Class)SUDeferredUISearchField;
  -[SUDeferredUISearchField paddingTop](&v4, sel_paddingTop);
  return result;
}

- (id)placeholder
{
  objc_super v4;

  if (-[SUDeferredUISearchField isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
    return self->_deferredPlaceholder;
  v4.receiver = self;
  v4.super_class = (Class)SUDeferredUISearchField;
  return -[SUDeferredUISearchField placeholder](&v4, sel_placeholder);
}

- (void)setClearButtonMode:(int64_t)a3
{
  objc_super v5;

  if (-[SUDeferredUISearchField isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
  {
    self->_deferredClearButtonMode = a3;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SUDeferredUISearchField;
    -[SUDeferredUISearchField setClearButtonMode:](&v5, sel_setClearButtonMode_, a3);
  }
}

- (void)setFont:(id)a3
{
  id deferredFont;
  id v6;
  objc_super v7;

  if (-[SUDeferredUISearchField isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
  {
    deferredFont = self->_deferredFont;
    if (deferredFont != a3)
    {

      if (a3)
        v6 = a3;
      else
        v6 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      self->_deferredFont = v6;
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SUDeferredUISearchField;
    -[SUDeferredUISearchField setFont:](&v7, sel_setFont_, a3);
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[SUDeferredUISearchField isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
  {
    self->_deferredFrame.origin.x = x;
    self->_deferredFrame.origin.y = y;
    self->_deferredFrame.size.width = width;
    self->_deferredFrame.size.height = height;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SUDeferredUISearchField;
    -[SUDeferredUISearchField setFrame:](&v8, sel_setFrame_, x, y, width, height);
  }
}

- (void)setPaddingTop:(float)a3 paddingLeft:(float)a4
{
  double v7;
  double v8;
  objc_super v9;

  if (-[SUDeferredUISearchField isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
  {
    self->_deferredPaddingLeft = a4;
    self->_deferredPaddingTop = a3;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SUDeferredUISearchField;
    *(float *)&v7 = a3;
    *(float *)&v8 = a4;
    -[UISearchField setPaddingTop:paddingLeft:](&v9, sel_setPaddingTop_paddingLeft_, v7, v8);
  }
}

- (void)setPlaceholder:(id)a3
{
  NSString *deferredPlaceholder;
  NSString *v6;
  objc_super v7;

  if (-[SUDeferredUISearchField isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
  {
    deferredPlaceholder = self->_deferredPlaceholder;
    if (deferredPlaceholder != a3)
    {

      if (a3)
        v6 = (NSString *)objc_msgSend(a3, "copy");
      else
        v6 = (NSString *)(id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      self->_deferredPlaceholder = v6;
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SUDeferredUISearchField;
    -[SUDeferredUISearchField setPlaceholder:](&v7, sel_setPlaceholder_, a3);
  }
}

- (void)setText:(id)a3
{
  NSString *deferredText;
  NSString *v6;
  objc_super v7;

  if (-[SUDeferredUISearchField isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
  {
    deferredText = self->_deferredText;
    if (deferredText != a3)
    {

      if (a3)
        v6 = (NSString *)objc_msgSend(a3, "copy");
      else
        v6 = (NSString *)(id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      self->_deferredText = v6;
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SUDeferredUISearchField;
    -[SUDeferredUISearchField setText:](&v7, sel_setText_, a3);
  }
}

- (id)text
{
  objc_super v4;

  if (-[SUDeferredUISearchField isDeferringInterfaceUpdates](self, "isDeferringInterfaceUpdates"))
    return self->_deferredText;
  v4.receiver = self;
  v4.super_class = (Class)SUDeferredUISearchField;
  return -[SUDeferredUISearchField text](&v4, sel_text);
}

- (void)_commitDeferredInterfaceUpdates
{
  id deferredFont;
  id v4;
  double v5;
  double v6;
  NSString *deferredPlaceholder;
  NSString *v8;
  NSString *deferredText;
  NSString *v10;

  -[SUDeferredUISearchField setClearButtonMode:](self, "setClearButtonMode:", self->_deferredClearButtonMode);
  deferredFont = self->_deferredFont;
  if (deferredFont == (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
    v4 = 0;
  else
    v4 = self->_deferredFont;
  -[SUDeferredUISearchField setFont:](self, "setFont:", v4);
  -[SUDeferredUISearchField setFrame:](self, "setFrame:", self->_deferredFrame.origin.x, self->_deferredFrame.origin.y, self->_deferredFrame.size.width, self->_deferredFrame.size.height);
  *(float *)&v5 = self->_deferredPaddingTop;
  *(float *)&v6 = self->_deferredPaddingLeft;
  -[SUDeferredUISearchField setPaddingTop:paddingLeft:](self, "setPaddingTop:paddingLeft:", v5, v6);
  deferredPlaceholder = self->_deferredPlaceholder;
  if (deferredPlaceholder == (NSString *)objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
    v8 = 0;
  else
    v8 = self->_deferredPlaceholder;
  -[SUDeferredUISearchField setPlaceholder:](self, "setPlaceholder:", v8);
  deferredText = self->_deferredText;
  if (deferredText == (NSString *)objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
    v10 = 0;
  else
    v10 = self->_deferredText;
  -[SUDeferredUISearchField setText:](self, "setText:", v10);
}

- (void)_saveCurrentStateAsDeferred
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  float v7;
  float v8;

  self->_deferredClearButtonMode = -[SUDeferredUISearchField clearButtonMode](self, "clearButtonMode");
  -[SUDeferredUISearchField frame](self, "frame");
  self->_deferredFrame.origin.x = v3;
  self->_deferredFrame.origin.y = v4;
  self->_deferredFrame.size.width = v5;
  self->_deferredFrame.size.height = v6;
  -[SUDeferredUISearchField paddingLeft](self, "paddingLeft");
  self->_deferredPaddingLeft = v7;
  -[SUDeferredUISearchField paddingTop](self, "paddingTop");
  self->_deferredPaddingTop = v8;

  self->_deferredFont = -[SUDeferredUISearchField font](self, "font");
  self->_deferredPlaceholder = (NSString *)-[SUDeferredUISearchField placeholder](self, "placeholder");

  self->_deferredText = (NSString *)-[SUDeferredUISearchField text](self, "text");
}

@end
