@implementation WGWidgetAttributionView

+ (void)requestAttributedStringForIdentifier:(id)a3 withHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  _QWORD block[4];
  id v13;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.weather.WeatherAppTodayWidget")))
  {
    if (v6)
    {
      dispatch_get_global_queue(25, 0);
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __76__WGWidgetAttributionView_requestAttributedStringForIdentifier_withHandler___block_invoke;
      block[3] = &unk_24D7318B8;
      v13 = v6;
      dispatch_async(v7, block);

      v8 = v13;
LABEL_7:

    }
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.stocks.widget")))
  {
    if (v6)
    {
      dispatch_get_global_queue(25, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __76__WGWidgetAttributionView_requestAttributedStringForIdentifier_withHandler___block_invoke_2;
      v10[3] = &unk_24D7318B8;
      v11 = v6;
      dispatch_async(v9, v10);

      v8 = v11;
      goto LABEL_7;
    }
  }
  else if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

void __76__WGWidgetAttributionView_requestAttributedStringForIdentifier_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  WAAttributionString();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __76__WGWidgetAttributionView_requestAttributedStringForIdentifier_withHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  StocksAttributionString();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

+ (id)widgetAttributionIDsInOrder
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("com.apple.weather.WeatherAppTodayWidget");
  v3[1] = CFSTR("com.apple.stocks.widget");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (WGWidgetAttributionView)initWithWidgetAttributedString:(id)a3
{
  id v4;
  WGWidgetAttributionView *v5;
  uint64_t v6;
  NSMutableAttributedString *widgetAttributedString;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WGWidgetAttributionView;
  v5 = -[WGWidgetAttributionView init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithAttributedString:", v4);
    widgetAttributedString = v5->_widgetAttributedString;
    v5->_widgetAttributedString = (NSMutableAttributedString *)v6;

    -[WGWidgetAttributionView _configureAttributedString](v5, "_configureAttributedString");
    -[WGWidgetAttributionView _attributionBackgroundColor](v5, "_attributionBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetAttributionView setBackgroundColor:](v5, "setBackgroundColor:", v8);

    -[WGWidgetAttributionView setOpaque:](v5, "setOpaque:", 0);
    -[WGWidgetAttributionView setEditable:](v5, "setEditable:", 0);
  }

  return v5;
}

- (id)_attributionFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE0BF20], "preferredFontProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x24BDF77C8], 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_attributionBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
}

- (id)_paragraphStyle
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDF6748]);
  objc_msgSend(v2, "setAlignment:", 1);
  return v2;
}

- (void)_configureAttributedString
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSMutableAttributedString *widgetAttributedString;
  void *v7;
  NSMutableAttributedString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSMutableAttributedString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  v3 = -[NSMutableAttributedString length](self->_widgetAttributedString, "length");
  v4 = *MEMORY[0x24BDF6600];
  -[NSMutableAttributedString removeAttribute:range:](self->_widgetAttributedString, "removeAttribute:range:", *MEMORY[0x24BDF6600], 0, v3);
  v5 = *MEMORY[0x24BDF65F8];
  -[NSMutableAttributedString removeAttribute:range:](self->_widgetAttributedString, "removeAttribute:range:", *MEMORY[0x24BDF65F8], 0, v3);
  widgetAttributedString = self->_widgetAttributedString;
  -[WGWidgetAttributionView _attributionFont](self, "_attributionFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableAttributedString addAttribute:value:range:](widgetAttributedString, "addAttribute:value:range:", v5, v7, 0, v3);

  v8 = self->_widgetAttributedString;
  v9 = *MEMORY[0x24BDF6628];
  -[WGWidgetAttributionView _paragraphStyle](self, "_paragraphStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableAttributedString addAttribute:value:range:](v8, "addAttribute:value:range:", v9, v10, 0, v3);

  -[WGWidgetAttributionView legibilityTextColor](self, "legibilityTextColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = self->_widgetAttributedString;
    -[WGWidgetAttributionView legibilityTextColor](self, "legibilityTextColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableAttributedString addAttribute:value:range:](v12, "addAttribute:value:range:", v4, v13, 0, v3);

    v20[0] = v4;
    -[WGWidgetAttributionView legibilityTextColor](self, "legibilityTextColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x24BDF66D8];
    v21[0] = v14;
    v21[1] = &unk_24D744478;
    v16 = *MEMORY[0x24BDF66D0];
    v20[1] = v15;
    v20[2] = v16;
    -[WGWidgetAttributionView legibilityTextColor](self, "legibilityTextColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "colorWithAlphaComponent:", 0.4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetAttributionView setLinkTextAttributes:](self, "setLinkTextAttributes:", v19);

  }
  -[WGWidgetAttributionView setAttributedText:](self, "setAttributedText:", self->_widgetAttributedString);
  -[WGWidgetAttributionView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WGWidgetAttributionView;
  -[WGWidgetAttributionView layoutSubviews](&v3, sel_layoutSubviews);
  -[WGWidgetAttributionView _configureAttributedString](self, "_configureAttributedString");
  -[WGWidgetAttributionView sizeToFit](self, "sizeToFit");
}

- (void)setLegibilityTextColor:(id)a3
{
  UIColor *v4;
  UIColor *legibilityTextColor;

  v4 = (UIColor *)objc_msgSend(a3, "copy");
  legibilityTextColor = self->_legibilityTextColor;
  self->_legibilityTextColor = v4;

  -[WGWidgetAttributionView setNeedsLayout](self, "setNeedsLayout");
}

- (UIColor)legibilityTextColor
{
  return self->_legibilityTextColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilityTextColor, 0);
  objc_storeStrong((id *)&self->_widgetAttributedString, 0);
}

@end
