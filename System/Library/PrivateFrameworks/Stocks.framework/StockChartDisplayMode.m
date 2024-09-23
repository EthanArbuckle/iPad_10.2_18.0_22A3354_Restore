@implementation StockChartDisplayMode

+ (id)defaultDisplayMode
{
  return objc_alloc_init(StockChartDisplayMode);
}

- (StockChartDisplayMode)init
{
  StockChartDisplayMode *v2;
  StockChartDisplayMode *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *hash;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)StockChartDisplayMode;
  v2 = -[StockChartDisplayMode init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    -[StockChartDisplayMode setLineWidth:](v2, "setLineWidth:", 2.5);
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.450980392, 0.4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[StockChartDisplayMode setBackgroundLinesColor:](v3, "setBackgroundLinesColor:", v4);

    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.980392157, 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[StockChartDisplayMode setLineColor:](v3, "setLineColor:", v5);

    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[StockChartDisplayMode setXAxisKeylineColor:](v3, "setXAxisKeylineColor:", v6);

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[StockChartDisplayMode setAxisLabelsColor:](v3, "setAxisLabelsColor:", v7);

    -[StockChartDisplayMode setVolumeHeight:](v3, "setVolumeHeight:", RoundToPixel(19.5));
    -[StockChartDisplayMode setYAxisLabelCount:](v3, "setYAxisLabelCount:", 5);
    -[StockChartDisplayMode setMaxInterval:](v3, "setMaxInterval:", 6);
    -[StockChartDisplayMode setIntervalRowHeight:](v3, "setIntervalRowHeight:", 34.5);
    -[StockChartDisplayMode setShowsVolume:](v3, "setShowsVolume:", 1);
    -[StockChartDisplayMode setChartRenderingInsets:](v3, "setChartRenderingInsets:", 0.0, 16.0, 0.0, 16.0);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = objc_claimAutoreleasedReturnValue();
    hash = v3->_hash;
    v3->_hash = (NSString *)v9;

  }
  return v3;
}

- (void)dealloc
{
  CGGradient *backgroundGradient;
  objc_super v4;

  backgroundGradient = self->_backgroundGradient;
  if (backgroundGradient)
    CGGradientRelease(backgroundGradient);
  v4.receiver = self;
  v4.super_class = (Class)StockChartDisplayMode;
  -[StockChartDisplayMode dealloc](&v4, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = -[NSString copy](self->_hash, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  -[StockChartDisplayMode chartSize](self, "chartSize");
  objc_msgSend(v4, "setChartSize:");
  objc_msgSend(v4, "setShowsVolume:", -[StockChartDisplayMode showsVolume](self, "showsVolume"));
  objc_msgSend(v4, "setMaxInterval:", -[StockChartDisplayMode maxInterval](self, "maxInterval"));
  objc_msgSend(v4, "setHUDEnabled:", -[StockChartDisplayMode HUDEnabled](self, "HUDEnabled"));
  -[StockChartDisplayMode showsTitle](self, "showsTitle");
  objc_msgSend(v4, "setShowsTitle:");
  objc_msgSend(v4, "setYAxisLabelCount:", -[StockChartDisplayMode yAxisLabelCount](self, "yAxisLabelCount"));
  objc_msgSend(v4, "setHorizontalGridlineCount:", -[StockChartDisplayMode horizontalGridlineCount](self, "horizontalGridlineCount"));
  objc_msgSend(v4, "setShowsPriceLabelForPreviousClose:", -[StockChartDisplayMode showsPriceLabelForPreviousClose](self, "showsPriceLabelForPreviousClose"));
  objc_msgSend(v4, "setUsesDetailedAxisLabels:", -[StockChartDisplayMode usesDetailedAxisLabels](self, "usesDetailedAxisLabels"));
  -[StockChartDisplayMode lineGraphInsets](self, "lineGraphInsets");
  objc_msgSend(v4, "setLineGraphInsets:");
  objc_msgSend(v4, "setGraphOverlapsYAxisLabels:", -[StockChartDisplayMode graphOverlapsYAxisLabels](self, "graphOverlapsYAxisLabels"));
  -[StockChartDisplayMode volumeHeight](self, "volumeHeight");
  objc_msgSend(v4, "setVolumeHeight:");
  -[StockChartDisplayMode intervalRowHeight](self, "intervalRowHeight");
  objc_msgSend(v4, "setIntervalRowHeight:");
  objc_msgSend(v4, "setYAxisLabelCount:", -[StockChartDisplayMode yAxisLabelCount](self, "yAxisLabelCount"));
  -[StockChartDisplayMode lineWidth](self, "lineWidth");
  objc_msgSend(v4, "setLineWidth:");
  -[StockChartDisplayMode lineColor](self, "lineColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLineColor:", v7);

  -[StockChartDisplayMode backgroundLinesColor](self, "backgroundLinesColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundLinesColor:", v8);

  -[StockChartDisplayMode xAxisKeylineColor](self, "xAxisKeylineColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setXAxisKeylineColor:", v9);

  -[StockChartDisplayMode axisLabelsColor](self, "axisLabelsColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAxisLabelsColor:", v10);

  objc_msgSend(v4, "setBackgroundGradient:", -[StockChartDisplayMode backgroundGradient](self, "backgroundGradient"));
  return v4;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_hash, "hash");
}

- (BOOL)isEqual:(id)a3
{
  StockChartDisplayMode *v4;
  char v5;

  v4 = (StockChartDisplayMode *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = -[NSString isEqualToString:](v4->_hash, "isEqualToString:", self->_hash);
    else
      v5 = 0;
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  CGSize v8;

  v7.receiver = self;
  v7.super_class = (Class)StockChartDisplayMode;
  -[StockChartDisplayMode description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
  -[StockChartDisplayMode chartSize](self, "chartSize");
  NSStringFromCGSize(v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("; chart size %@>"), v5);

  return v4;
}

- (void)setBackgroundGradient:(CGGradient *)a3
{
  CGGradient *backgroundGradient;

  backgroundGradient = self->_backgroundGradient;
  if (backgroundGradient != a3)
  {
    if (backgroundGradient)
      CGGradientRelease(backgroundGradient);
    self->_backgroundGradient = a3;
    if (a3)
      CGGradientRetain(a3);
  }
}

- (double)gutterHeight
{
  double v2;

  -[StockChartDisplayMode volumeHeight](self, "volumeHeight");
  return v2 + 18.0;
}

- (double)lineGraphBottomPadding
{
  double v2;

  -[StockChartDisplayMode gutterHeight](self, "gutterHeight");
  return v2 + 17.0;
}

- (CGSize)chartSize
{
  double width;
  double height;
  CGSize result;

  width = self->_chartSize.width;
  height = self->_chartSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setChartSize:(CGSize)a3
{
  self->_chartSize = a3;
}

- (BOOL)showsVolume
{
  return self->_showsVolume;
}

- (void)setShowsVolume:(BOOL)a3
{
  self->_showsVolume = a3;
}

- (int64_t)maxInterval
{
  return self->_maxInterval;
}

- (void)setMaxInterval:(int64_t)a3
{
  self->_maxInterval = a3;
}

- (BOOL)HUDEnabled
{
  return self->_HUDEnabled;
}

- (void)setHUDEnabled:(BOOL)a3
{
  self->_HUDEnabled = a3;
}

- (double)showsTitle
{
  return self->_showsTitle;
}

- (void)setShowsTitle:(double)a3
{
  self->_showsTitle = a3;
}

- (unint64_t)yAxisLabelCount
{
  return self->_yAxisLabelCount;
}

- (void)setYAxisLabelCount:(unint64_t)a3
{
  self->_yAxisLabelCount = a3;
}

- (unint64_t)horizontalGridlineCount
{
  return self->_horizontalGridlineCount;
}

- (void)setHorizontalGridlineCount:(unint64_t)a3
{
  self->_horizontalGridlineCount = a3;
}

- (BOOL)showsPriceLabelForPreviousClose
{
  return self->_showsPriceLabelForPreviousClose;
}

- (void)setShowsPriceLabelForPreviousClose:(BOOL)a3
{
  self->_showsPriceLabelForPreviousClose = a3;
}

- (BOOL)usesDetailedAxisLabels
{
  return self->_usesDetailedAxisLabels;
}

- (void)setUsesDetailedAxisLabels:(BOOL)a3
{
  self->_usesDetailedAxisLabels = a3;
}

- (UIEdgeInsets)lineGraphInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_lineGraphInsets.top;
  left = self->_lineGraphInsets.left;
  bottom = self->_lineGraphInsets.bottom;
  right = self->_lineGraphInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setLineGraphInsets:(UIEdgeInsets)a3
{
  self->_lineGraphInsets = a3;
}

- (BOOL)graphOverlapsYAxisLabels
{
  return self->_graphOverlapsYAxisLabels;
}

- (void)setGraphOverlapsYAxisLabels:(BOOL)a3
{
  self->_graphOverlapsYAxisLabels = a3;
}

- (double)volumeHeight
{
  return self->_volumeHeight;
}

- (void)setVolumeHeight:(double)a3
{
  self->_volumeHeight = a3;
}

- (double)intervalRowHeight
{
  return self->_intervalRowHeight;
}

- (void)setIntervalRowHeight:(double)a3
{
  self->_intervalRowHeight = a3;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (UIColor)lineColor
{
  return self->_lineColor;
}

- (void)setLineColor:(id)a3
{
  objc_storeStrong((id *)&self->_lineColor, a3);
}

- (UIColor)backgroundLinesColor
{
  return self->_backgroundLinesColor;
}

- (void)setBackgroundLinesColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundLinesColor, a3);
}

- (UIColor)xAxisKeylineColor
{
  return self->_xAxisKeylineColor;
}

- (void)setXAxisKeylineColor:(id)a3
{
  objc_storeStrong((id *)&self->_xAxisKeylineColor, a3);
}

- (UIColor)axisLabelsColor
{
  return self->_axisLabelsColor;
}

- (void)setAxisLabelsColor:(id)a3
{
  objc_storeStrong((id *)&self->_axisLabelsColor, a3);
}

- (CGGradient)backgroundGradient
{
  return self->_backgroundGradient;
}

- (UIEdgeInsets)chartRenderingInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_chartRenderingInsets.top;
  left = self->_chartRenderingInsets.left;
  bottom = self->_chartRenderingInsets.bottom;
  right = self->_chartRenderingInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setChartRenderingInsets:(UIEdgeInsets)a3
{
  self->_chartRenderingInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axisLabelsColor, 0);
  objc_storeStrong((id *)&self->_xAxisKeylineColor, 0);
  objc_storeStrong((id *)&self->_backgroundLinesColor, 0);
  objc_storeStrong((id *)&self->_lineColor, 0);
  objc_storeStrong((id *)&self->_hash, 0);
}

@end
