@implementation WFCustomSymbolToolbarButton

- (void)setSymbolName:(id)a3 pointSizeToWidthRatio:(double)a4
{
  -[WFCustomSymbolToolbarButton setSymbolName:](self, "setSymbolName:", a3);
  -[WFCustomSymbolToolbarButton setPointSizeToWidthRatio:](self, "setPointSizeToWidthRatio:", a4);
  -[WFCustomSymbolToolbarButton updateImage](self, "updateImage");
}

- (void)setSymbolName:(id)a3
{
  objc_storeStrong((id *)&self->_symbolName, a3);
}

- (void)setPointSizeToWidthRatio:(double)a3
{
  self->_pointSizeToWidthRatio = a3;
}

- (void)updateImage
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[WFCustomSymbolToolbarButton symbolName](self, "symbolName");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[WFCustomSymbolToolbarButton pointSizeToWidthRatio](self, "pointSizeToWidthRatio");
    v6 = v5;

    if (v6 != 0.0)
    {
      objc_msgSend(MEMORY[0x24BEBD660], "configurationWithTextStyle:", *MEMORY[0x24BEBE1D0]);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BEBD640];
      -[WFCustomSymbolToolbarButton symbolName](self, "symbolName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "systemImageNamed:withConfiguration:", v8, v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFCustomSymbolToolbarButton setImage:forState:](self, "setImage:forState:", v9, 0);
      -[WFCustomSymbolToolbarButton imageView](self, "imageView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setContentMode:", 4);

    }
  }
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (double)pointSizeToWidthRatio
{
  return self->_pointSizeToWidthRatio;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pointSize");
  v8 = v7;

  -[WFCustomSymbolToolbarButton pointSizeToWidthRatio](self, "pointSizeToWidthRatio");
  v10 = fmin(v8, 21.0) * v9;
  v14.receiver = self;
  v14.super_class = (Class)WFCustomSymbolToolbarButton;
  -[WFCustomSymbolToolbarButton sizeThatFits:](&v14, sel_sizeThatFits_, width, height);
  v12 = v11 + 10.0;
  v13 = v10;
  result.height = v12;
  result.width = v13;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFCustomSymbolToolbarButton;
  v4 = a3;
  -[WFCustomSymbolToolbarButton traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[WFCustomSymbolToolbarButton traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
    -[WFCustomSymbolToolbarButton updateImage](self, "updateImage");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end
