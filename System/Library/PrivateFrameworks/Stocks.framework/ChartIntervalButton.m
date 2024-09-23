@implementation ChartIntervalButton

- (ChartIntervalButton)initWithFrame:(CGRect)a3
{
  ChartIntervalButton *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ChartIntervalButton;
  v3 = -[ChartIntervalButton initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ChartIntervalButton setBackgroundColor:](v3, "setBackgroundColor:", v4);

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ChartIntervalButton setTextColor:](v3, "setTextColor:", v5);

    +[StocksStyle sharedStyle](StocksStyle, "sharedStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_referenceBounds");
    v8 = 14.0;
    if (v9 == 667.0)
      v8 = 17.0;
    objc_msgSend(v6, "lightFontOfSize:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ChartIntervalButton setFont:](v3, "setFont:", v10);

    -[ChartIntervalButton setTextAlignment:](v3, "setTextAlignment:", 1);
  }
  return v3;
}

- (void)setSelected:(BOOL)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  if (-[ChartIntervalButton isSelected](self, "isSelected") != a3)
  {
    self->_selected = a3;
    +[StocksStyle sharedStyle](StocksStyle, "sharedStyle");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_referenceBounds");
    v6 = 14.0;
    if (v7 == 667.0)
      v6 = 17.0;
    if (a3)
      objc_msgSend(v9, "boldFontOfSize:", v6);
    else
      objc_msgSend(v9, "lightFontOfSize:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ChartIntervalButton setFont:](self, "setFont:", v8);

  }
}

+ (id)titleForInterval:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  switch(a3)
  {
    case 1:
      +[StocksBundles getBundle:](StocksBundles, "getBundle:", 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("1w");
      break;
    case 2:
      +[StocksBundles getBundle:](StocksBundles, "getBundle:", 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("1m");
      break;
    case 3:
      +[StocksBundles getBundle:](StocksBundles, "getBundle:", 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("3m");
      break;
    case 4:
      +[StocksBundles getBundle:](StocksBundles, "getBundle:", 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("6m");
      break;
    case 5:
      +[StocksBundles getBundle:](StocksBundles, "getBundle:", 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("1y");
      break;
    case 6:
      +[StocksBundles getBundle:](StocksBundles, "getBundle:", 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("2y");
      break;
    case 7:
      +[StocksBundles getBundle:](StocksBundles, "getBundle:", 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("5y");
      break;
    case 8:
      +[StocksBundles getBundle:](StocksBundles, "getBundle:", 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("10y");
      break;
    default:
      +[StocksBundles getBundle:](StocksBundles, "getBundle:", 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("1d");
      break;
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24D74CF50, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isSelected
{
  return self->_selected;
}

@end
