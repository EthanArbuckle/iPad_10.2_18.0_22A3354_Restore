@implementation StocksStyle

+ (id)sharedStyle
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_sharedInstance;
  if (!_sharedInstance)
  {
    v3 = objc_opt_new();
    v4 = (void *)_sharedInstance;
    _sharedInstance = v3;

    v2 = (void *)_sharedInstance;
  }
  return v2;
}

- (StocksStyle)init
{
  StocksStyle *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)StocksStyle;
  v2 = -[StocksStyle init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_resetLocale, *MEMORY[0x24BDBCA70], 0);

  }
  return v2;
}

- (void)resetLocale
{
  UIFont *mainFont;
  UIFont *chartLabelFont;

  mainFont = self->_mainFont;
  self->_mainFont = 0;

  chartLabelFont = self->_chartLabelFont;
  self->_chartLabelFont = 0;

}

- (id)gainColor
{
  void *v2;
  char v3;

  +[StocksPreferences sharedPreferences](StocksPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isChangeColorSwapped");

  if ((v3 & 1) != 0)
    objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "systemGreenColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)lossColor
{
  void *v2;
  char v3;

  +[StocksPreferences sharedPreferences](StocksPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isChangeColorSwapped");

  if ((v3 & 1) != 0)
    objc_msgSend(MEMORY[0x24BDF6950], "systemGreenColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)chartHighlightColor
{
  UIColor *chartHighlightColor;
  UIColor *v4;
  UIColor *v5;

  chartHighlightColor = self->_chartHighlightColor;
  if (!chartHighlightColor)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.584313725, 1.0, 1.0);
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_chartHighlightColor;
    self->_chartHighlightColor = v4;

    chartHighlightColor = self->_chartHighlightColor;
  }
  return chartHighlightColor;
}

- (id)lightFontOfSize:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", a3);
}

- (id)fontOfSize:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", a3);
}

- (id)mediumFontOfSize:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", a3);
}

- (id)boldFontOfSize:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chartLabelFont, 0);
  objc_storeStrong((id *)&self->_mainFont, 0);
  objc_storeStrong((id *)&self->_chartHighlightColor, 0);
}

@end
