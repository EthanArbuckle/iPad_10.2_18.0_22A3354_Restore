@implementation WFAppearanceProxy

+ (id)setupAppearanceProxy
{
  WFAppearanceProxy *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(WFAppearanceProxy);
  objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAppearanceProxy setTableViewCellBackgroundColor:](v2, "setTableViewCellBackgroundColor:", v3);

  v4 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pointSize");
  objc_msgSend(v4, "systemFontOfSize:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAppearanceProxy setCellTextLabelFont:](v2, "setCellTextLabelFont:", v6);

  -[WFAppearanceProxy setTableViewStyle:](v2, "setTableViewStyle:", 2);
  return v2;
}

+ (id)defaultAppearanceProxy
{
  WFAppearanceProxy *v2;
  uint64_t v3;

  v2 = objc_alloc_init(WFAppearanceProxy);
  if (WFShouldUseInsetTableView())
    v3 = 2;
  else
    v3 = 1;
  -[WFAppearanceProxy setTableViewStyle:](v2, "setTableViewStyle:", v3);
  return v2;
}

- (void)apply
{
  void *v3;
  void *v4;
  id v5;

  -[WFAppearanceProxy tableViewCellBackgroundColor](self, "tableViewCellBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD9F8], "appearance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[WFAppearanceProxy tableViewCellBackgroundColor](self, "tableViewCellBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

  }
}

- (int64_t)tableViewStyle
{
  return self->_tableViewStyle;
}

- (void)setTableViewStyle:(int64_t)a3
{
  self->_tableViewStyle = a3;
}

- (UIFont)cellTextLabelFont
{
  return self->_cellTextLabelFont;
}

- (void)setCellTextLabelFont:(id)a3
{
  self->_cellTextLabelFont = (UIFont *)a3;
}

- (UIColor)tableViewCellBackgroundColor
{
  return self->_tableViewCellBackgroundColor;
}

- (void)setTableViewCellBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewCellBackgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableViewCellBackgroundColor, 0);
}

@end
