@implementation WFDeferredMenuElementGroup

- (WFDeferredMenuElementGroup)initWithProvider:(id)a3
{
  id v4;
  WFDeferredMenuElementGroup *v5;
  WFDeferredMenuElementGroup *v6;
  uint64_t v7;
  id itemProvider;
  WFDeferredMenuElementGroup *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFDeferredMenuElementGroup;
  v5 = -[WFDeferredMenuElementGroup init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    -[WFDeferredMenuElementGroup setStyle:](v5, "setStyle:", 0);
    v7 = objc_msgSend(v4, "copy");
    itemProvider = v6->_itemProvider;
    v6->_itemProvider = (id)v7;

    v6->_estimatedItemCount = -1;
    v6->_mayContainSelectedItem = 1;
    v9 = v6;
  }

  return v6;
}

- (BOOL)shouldCollapse
{
  unint64_t v3;

  v3 = -[WFDeferredMenuElementGroup style](self, "style");
  if (v3 != 1)
    LOBYTE(v3) = -[WFDeferredMenuElementGroup style](self, "style") == 2;
  return v3;
}

- (unint64_t)style
{
  return self->style;
}

- (void)setStyle:(unint64_t)a3
{
  self->style = a3;
}

- (NSString)title
{
  return self->title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->title, a3);
}

- (BOOL)onlyDisplayTitleWhenCollapsed
{
  return self->onlyDisplayTitleWhenCollapsed;
}

- (void)setOnlyDisplayTitleWhenCollapsed:(BOOL)a3
{
  self->onlyDisplayTitleWhenCollapsed = a3;
}

- (id)itemProvider
{
  return self->_itemProvider;
}

- (int64_t)estimatedItemCount
{
  return self->_estimatedItemCount;
}

- (void)setEstimatedItemCount:(int64_t)a3
{
  self->_estimatedItemCount = a3;
}

- (BOOL)mayContainSelectedItem
{
  return self->_mayContainSelectedItem;
}

- (void)setMayContainSelectedItem:(BOOL)a3
{
  self->_mayContainSelectedItem = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->title, 0);
}

@end
