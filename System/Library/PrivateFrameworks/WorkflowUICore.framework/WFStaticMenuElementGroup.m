@implementation WFStaticMenuElementGroup

- (WFStaticMenuElementGroup)initWithMenuElements:(id)a3
{
  id v4;
  WFStaticMenuElementGroup *v5;
  WFStaticMenuElementGroup *v6;
  uint64_t v7;
  NSArray *menuElements;
  WFStaticMenuElementGroup *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFStaticMenuElementGroup;
  v5 = -[WFStaticMenuElementGroup init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    -[WFStaticMenuElementGroup setStyle:](v5, "setStyle:", 0);
    v7 = objc_msgSend(v4, "copy");
    menuElements = v6->_menuElements;
    v6->_menuElements = (NSArray *)v7;

    v9 = v6;
  }

  return v6;
}

- (BOOL)shouldCollapse
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[WFStaticMenuElementGroup style](self, "style");
  if (v3 != 1)
    LOBYTE(v3) = -[WFStaticMenuElementGroup style](self, "style") == 2
              && (-[WFStaticMenuElementGroup menuElements](self, "menuElements"),
                  v4 = (void *)objc_claimAutoreleasedReturnValue(),
                  v5 = objc_msgSend(v4, "count"),
                  v4,
                  v5 > 6);
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

- (NSArray)menuElements
{
  return self->_menuElements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuElements, 0);
  objc_storeStrong((id *)&self->title, 0);
}

@end
