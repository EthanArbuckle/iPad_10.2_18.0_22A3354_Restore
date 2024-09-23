@implementation StocksLayout

+ (id)layoutForSize:(CGSize)a3
{
  void *v3;

  if (a3.height >= a3.width)
  {
    if (a3.width >= 640.0)
      +[StocksLayout twoColumnsPortraitLayoutForSize:](StocksLayout, "twoColumnsPortraitLayoutForSize:");
    else
      +[StocksLayout singleColumnPortraitLayoutForSize:](StocksLayout, "singleColumnPortraitLayoutForSize:");
    goto LABEL_6;
  }
  if (a3.height >= 376.0)
  {
    if (a3.width >= 1024.0)
      +[StocksLayout threeColumnsLandscapeLayoutForSize:](StocksLayout, "threeColumnsLandscapeLayoutForSize:");
    else
      +[StocksLayout twoColumnsLandscapeLayoutForSize:](StocksLayout, "twoColumnsLandscapeLayoutForSize:");
LABEL_6:
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  +[StocksLayout fullScreenChartLayoutForSize:](StocksLayout, "fullScreenChartLayoutForSize:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

+ (id)singleColumnPortraitLayoutForSize:(CGSize)a3
{
  double height;
  double width;
  unint64_t v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double MaxX;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  CGRect v28;

  height = a3.height;
  width = a3.width;
  v6 = objc_msgSend(a1, "numberOfRowsForSize:");
  v7 = (double)v6 * 56.0;
  v8 = height + -44.0;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_referenceBounds");
  if (v10 == 812.0)
    v11 = 34.0;
  else
    v11 = 0.0;

  v12 = objc_alloc_init((Class)a1);
  objc_msgSend(v12, "setListViewFrame:", RoundRectToPixel(0.0));
  v13 = v8 - v7;
  objc_msgSend(v12, "setInfoViewFrame:", RoundRectToPixel(0.0));
  objc_msgSend(v12, "setChartViewFrame:", RoundRectToPixel(width));
  objc_msgSend(v12, "setNewsViewFrame:", RoundRectToPixel(width + width));
  objc_msgSend(v12, "setListViewContentInsets:", 0.0, 0.0, v8 + 44.0 - v7 + v11, 0.0);
  objc_msgSend(v12, "setNewsViewHasBottomLine:", 1);
  objc_msgSend(v12, "setInfoViewHasBottomLine:", 1);
  objc_msgSend(v12, "setChartViewHasBottomLine:", 1);
  objc_msgSend(v12, "setNewsViewShouldUseLargerFonts:", width > 350.0);
  objc_msgSend(v12, "setHasScrollView:", 1);
  objc_msgSend(v12, "setScrollViewFrame:", RoundRectToPixel(0.0));
  objc_msgSend(v12, "setScrollViewContentSize:", width * 3.0, v8 - v7);
  objc_msgSend(v12, "setInfoViewInScrollView:", 1);
  objc_msgSend(v12, "setChartViewInScrollView:", 1);
  objc_msgSend(v12, "setNewsViewInScrollView:", 1);
  objc_msgSend(v12, "setHasBlurView:", 1);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scale");
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scale");
  objc_msgSend(v12, "setBlurViewFrame:", RoundRectToPixel(0.0));

  objc_msgSend(v12, "setHasGrayView:", 1);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scale");
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scale");
  objc_msgSend(v12, "setGrayViewFrame:", RoundRectToPixel(0.0));

  objc_msgSend(v12, "setHasSecondaryGrayView:", 0);
  objc_msgSend(v12, "setSecondaryGrayViewFrame:", RoundRectToPixel(0.0));
  objc_msgSend(v12, "setListViewRowCount:", v6);
  objc_msgSend(v12, "setStatusViewCenteringRatio:", 0.5);
  objc_msgSend(v12, "setHasStatusView:", 1);
  objc_msgSend(v12, "setStatusViewFrame:", 0.0, v8, width, 44.0);
  objc_msgSend(v12, "setHasStatusViewDivider:", 0);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "scale");
  objc_msgSend(v12, "setStatusViewDividerFrame:", RoundRectToPixel(0.0));

  objc_msgSend(v12, "setHasPrimaryHorizontalDivider:", 0);
  objc_msgSend(v12, "setHasSecondaryHorizontalDivider:", 0);
  objc_msgSend(v12, "setHasPrimaryVerticalDivider:", 0);
  objc_msgSend(v12, "listViewFrame");
  MaxX = CGRectGetMaxX(v28);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "scale");
  objc_msgSend(v12, "listViewFrame");
  objc_msgSend(v12, "setPrimaryVerticalDividerFrame:", RoundRectToPixel(MaxX));

  objc_msgSend(v12, "setHasSecondaryVerticalDivider:", 0);
  +[StockChartDisplayMode defaultDisplayMode](StockChartDisplayMode, "defaultDisplayMode");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setMaxInterval:", 6);
  objc_msgSend(v21, "setGraphOverlapsYAxisLabels:", 1);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setXAxisKeylineColor:", v22);

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAxisLabelsColor:", v23);

  objc_msgSend(v21, "setYAxisLabelCount:", 2);
  objc_msgSend(v21, "setChartSize:", width, v13);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_referenceBounds");
  v26 = v25;

  if (v26 == 736.0)
    objc_msgSend(v21, "setHorizontalGridlineCount:", 4);
  objc_msgSend(v12, "setChartDisplayMode:", v21, 0x4046000000000000);

  return v12;
}

+ (id)twoColumnsPortraitLayoutForSize:(CGSize)a3
{
  double width;
  CGFloat v4;
  id v5;
  void *v6;
  void *v7;
  double MaxX;
  void *v9;
  void *v10;
  void *v11;
  CGRect v13;

  width = a3.width;
  v4 = a3.height + -64.0;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setListViewFrame:", RoundRectToPixel(0.0));
  objc_msgSend(v5, "setInfoViewFrame:", RoundRectToPixel(width * 0.4));
  objc_msgSend(v5, "setChartViewFrame:", RoundRectToPixel(width * 0.4));
  objc_msgSend(v5, "setNewsViewFrame:", RoundRectToPixel(0.0));
  objc_msgSend(v5, "setListViewContentInsets:", 0.0, 0.0, v4 * 0.5 + 44.0, 0.0);
  objc_msgSend(v5, "setNewsViewShouldUseLargerFonts:", 1);
  objc_msgSend(v5, "setHasScrollView:", 0);
  objc_msgSend(v5, "setScrollViewFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v5, "setScrollViewContentSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  objc_msgSend(v5, "setInfoViewInScrollView:", 0);
  objc_msgSend(v5, "setChartViewInScrollView:", 0);
  objc_msgSend(v5, "setNewsViewInScrollView:", 0);
  objc_msgSend(v5, "setBlurViewFrame:", 0.0, v4 * 0.5 + 20.0, width, v4 * 0.5 + 44.0);
  objc_msgSend(v5, "setHasBlurView:", 1);
  objc_msgSend(v5, "setHasGrayView:", 1);
  objc_msgSend(v5, "setGrayViewFrame:", RoundRectToPixel(width * 0.4));
  objc_msgSend(v5, "setHasSecondaryGrayView:", 1);
  objc_msgSend(v5, "setSecondaryGrayViewFrame:", RoundRectToPixel(0.0));
  objc_msgSend(v5, "setStatusViewCenteringRatio:", 0.5);
  objc_msgSend(v5, "setHasStatusView:", 1);
  objc_msgSend(v5, "setStatusViewFrame:", RoundRectToPixel(0.0));
  objc_msgSend(v5, "setHasStatusViewDivider:", 1);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  objc_msgSend(v5, "setStatusViewDividerFrame:", RoundRectToPixel(0.0));

  objc_msgSend(v5, "setHasPrimaryHorizontalDivider:", 1);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  objc_msgSend(v5, "setPrimaryHorizontalDividerFrame:", RoundRectToPixel(0.0));

  objc_msgSend(v5, "setHasSecondaryHorizontalDivider:", 0);
  objc_msgSend(v5, "setHasPrimaryVerticalDivider:", 1);
  objc_msgSend(v5, "listViewFrame");
  MaxX = CGRectGetMaxX(v13);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  objc_msgSend(v5, "setPrimaryVerticalDividerFrame:", RoundRectToPixel(MaxX));

  objc_msgSend(v5, "setHasSecondaryVerticalDivider:", 0);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  objc_msgSend(v5, "setSecondaryVerticalDividerFrame:", RoundRectToPixel(width));

  +[StockChartDisplayMode defaultDisplayMode](StockChartDisplayMode, "defaultDisplayMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setVolumeHeight:", RoundToPixel(18.0));
  objc_msgSend(v11, "setMaxInterval:", 6);
  objc_msgSend(v11, "setYAxisLabelCount:", 2);
  objc_msgSend(v11, "setHorizontalGridlineCount:", 4);
  objc_msgSend(v11, "setGraphOverlapsYAxisLabels:", 1);
  objc_msgSend(v11, "setChartSize:", width * 0.6, v4 * 0.5 * 0.5);
  objc_msgSend(v5, "setChartDisplayMode:", v11);

  return v5;
}

+ (id)fullScreenChartLayoutForSize:(CGSize)a3
{
  double height;
  double width;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;

  height = a3.height;
  width = a3.width;
  v5 = objc_alloc_init((Class)a1);
  v6 = *MEMORY[0x24BDBF090];
  v7 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v8 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v9 = *(double *)(MEMORY[0x24BDBF090] + 24);
  objc_msgSend(v5, "setListViewFrame:", *MEMORY[0x24BDBF090], v7, v8, v9);
  objc_msgSend(v5, "setInfoViewFrame:", RoundRectToPixel(width * 0.4));
  objc_msgSend(v5, "setChartViewFrame:", RoundRectToPixel(width));
  objc_msgSend(v5, "setNewsViewFrame:", width, height, width * 0.6, height);
  objc_msgSend(v5, "setHasScrollView:", 1);
  objc_msgSend(v5, "setScrollViewFrame:", RoundRectToPixel(0.0));
  objc_msgSend(v5, "setScrollViewContentSize:", width * 3.0, height);
  objc_msgSend(v5, "setInfoViewInScrollView:", 0);
  objc_msgSend(v5, "setChartViewInScrollView:", 1);
  objc_msgSend(v5, "setNewsViewInScrollView:", 0);
  objc_msgSend(v5, "setBlurViewFrame:", v6, v7, v8, v9);
  objc_msgSend(v5, "setHasBlurView:", 0);
  objc_msgSend(v5, "setStatusViewCenteringRatio:", 0.7);
  objc_msgSend(v5, "setHasStatusView:", 1);
  objc_msgSend(v5, "setStatusViewFrame:", RoundRectToPixel(0.0));
  objc_msgSend(v5, "setChartViewHasTapGesture:", height >= 376.0);
  objc_msgSend(v5, "setHasStatusViewDivider:", 0);
  objc_msgSend(v5, "setHasPrimaryHorizontalDivider:", 0);
  objc_msgSend(v5, "setHasSecondaryHorizontalDivider:", 0);
  objc_msgSend(v5, "setHasPrimaryVerticalDivider:", 0);
  objc_msgSend(v5, "setHasSecondaryVerticalDivider:", 0);
  +[StockChartDisplayMode defaultDisplayMode](StockChartDisplayMode, "defaultDisplayMode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMaxInterval:", 8);
  objc_msgSend(v10, "setShowsPriceLabelForPreviousClose:", 1);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setXAxisKeylineColor:", v11);

  objc_msgSend(v10, "setYAxisLabelCount:", 5);
  objc_msgSend(v10, "setHorizontalGridlineCount:", objc_msgSend(v10, "yAxisLabelCount"));
  objc_msgSend(v10, "setUsesDetailedAxisLabels:", 1);
  objc_msgSend(v10, "setShowsTitle:", 1.0);
  objc_msgSend(v10, "setHUDEnabled:", 1);
  objc_msgSend(v10, "setChartSize:", width, height);
  objc_msgSend(v5, "setChartDisplayMode:", v10);
  objc_msgSend(v5, "setHasBlackView:", 1);
  objc_msgSend(v5, "setIsFullScreenChart:", 1);

  return v5;
}

+ (id)twoColumnsLandscapeLayoutForSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v22;
  double v23;
  double v24;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceLayoutDirection");

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scale");
    v10 = width - (-1.0 / v9 + width * 0.4);

    v11 = width * 0.6;
    v22 = 0.0;
    v23 = 0.3;
    v24 = width * 0.6;
    v12 = width * 0.6;
  }
  else
  {
    v12 = width * 0.6;
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scale");
    v24 = -1.0 / v14 + width * 0.4;

    v10 = 0.0;
    v22 = width * 0.6;
    v23 = 0.7;
    v11 = 0.0;
  }
  if (v7)
    v15 = 0.0;
  else
    v15 = width * 0.4;
  v16 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scale");
  objc_msgSend(v16, "setListViewFrame:", RoundRectToPixel(v10));

  objc_msgSend(v16, "setInfoViewFrame:", RoundRectToPixel(v11));
  objc_msgSend(v16, "setChartViewFrame:", RoundRectToPixel(v11));
  objc_msgSend(v16, "setNewsViewFrame:", RoundRectToPixel(v22));
  objc_msgSend(v16, "setHasScrollView:", 1);
  objc_msgSend(v16, "setScrollViewFrame:", RoundRectToPixel(v15));
  objc_msgSend(v16, "setScrollViewContentSize:", (width + width) * 0.6, height + -44.0);
  objc_msgSend(v16, "setInfoViewInScrollView:", 1);
  objc_msgSend(v16, "setChartViewInScrollView:", 1);
  objc_msgSend(v16, "setNewsViewInScrollView:", 1);
  objc_msgSend(v16, "setHasBlurView:", 0);
  objc_msgSend(v16, "setBlurViewFrame:", RoundRectToPixel(v15));
  objc_msgSend(v16, "setHasGrayView:", 1);
  objc_msgSend(v16, "setGrayViewFrame:", RoundRectToPixel(v15));
  objc_msgSend(v16, "setHasSecondaryGrayView:", 0);
  objc_msgSend(v16, "setSecondaryGrayViewFrame:", RoundRectToPixel(0.0));
  objc_msgSend(v16, "setStatusViewCenteringRatio:", v23);
  objc_msgSend(v16, "setHasStatusView:", 1);
  objc_msgSend(v16, "setStatusViewFrame:", RoundRectToPixel(0.0));
  objc_msgSend(v16, "setChartViewHasTapGesture:", 1);
  objc_msgSend(v16, "setHasStatusViewDivider:", 1);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "scale");
  objc_msgSend(v16, "setStatusViewDividerFrame:", RoundRectToPixel(0.0));

  objc_msgSend(v16, "setHasPrimaryHorizontalDivider:", 0);
  objc_msgSend(v16, "setHasSecondaryHorizontalDivider:", 0);
  objc_msgSend(v16, "setHasPrimaryVerticalDivider:", 1);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "scale");
  objc_msgSend(v16, "setPrimaryVerticalDividerFrame:", RoundRectToPixel(v24));

  objc_msgSend(v16, "setHasSecondaryVerticalDivider:", 1);
  +[StockChartDisplayMode defaultDisplayMode](StockChartDisplayMode, "defaultDisplayMode");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setVolumeHeight:", RoundToPixel(12.0));
  objc_msgSend(v20, "setMaxInterval:", 6);
  objc_msgSend(v20, "setYAxisLabelCount:", 2);
  objc_msgSend(v20, "setHorizontalGridlineCount:", 3);
  objc_msgSend(v20, "setGraphOverlapsYAxisLabels:", 1);
  objc_msgSend(v20, "setChartSize:", v12, (height + -44.0) * 0.5);
  objc_msgSend(v16, "setChartDisplayMode:", v20);

  return v16;
}

+ (id)threeColumnsLandscapeLayoutForSize:(CGSize)a3
{
  double width;
  CGFloat v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  width = a3.width;
  v4 = a3.height + -64.0;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setListViewFrame:", RoundRectToPixel(0.0));
  objc_msgSend(v5, "setInfoViewFrame:", RoundRectToPixel(width * 0.3));
  objc_msgSend(v5, "setChartViewFrame:", RoundRectToPixel(width * 0.65));
  objc_msgSend(v5, "setNewsViewFrame:", RoundRectToPixel(width * 0.3));
  objc_msgSend(v5, "setNewsViewShouldUseLargerFonts:", 1);
  objc_msgSend(v5, "setHasScrollView:", 0);
  objc_msgSend(v5, "setScrollViewFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v5, "setScrollViewContentSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  objc_msgSend(v5, "setInfoViewInScrollView:", 0);
  objc_msgSend(v5, "setChartViewInScrollView:", 0);
  objc_msgSend(v5, "setNewsViewInScrollView:", 0);
  objc_msgSend(v5, "setHasBlurView:", 0);
  objc_msgSend(v5, "setBlurViewFrame:", RoundRectToPixel(width * 0.3));
  objc_msgSend(v5, "setHasGrayView:", 1);
  objc_msgSend(v5, "setGrayViewFrame:", RoundRectToPixel(width * 0.3));
  objc_msgSend(v5, "setHasSecondaryGrayView:", 1);
  objc_msgSend(v5, "setSecondaryGrayViewFrame:", RoundRectToPixel(width * 0.3));
  objc_msgSend(v5, "setStatusViewCenteringRatio:", 0.65);
  objc_msgSend(v5, "setHasStatusView:", 1);
  objc_msgSend(v5, "setStatusViewFrame:", RoundRectToPixel(0.0));
  objc_msgSend(v5, "setHasStatusViewDivider:", 1);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  objc_msgSend(v5, "setStatusViewDividerFrame:", RoundRectToPixel(0.0));

  objc_msgSend(v5, "setHasPrimaryHorizontalDivider:", 1);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  objc_msgSend(v5, "setPrimaryHorizontalDividerFrame:", RoundRectToPixel(width * 0.3));

  objc_msgSend(v5, "setHasSecondaryHorizontalDivider:", 0);
  objc_msgSend(v5, "setHasPrimaryVerticalDivider:", 1);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  objc_msgSend(v5, "setPrimaryVerticalDividerFrame:", RoundRectToPixel(width * 0.3));

  objc_msgSend(v5, "setHasSecondaryVerticalDivider:", 1);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  objc_msgSend(v5, "setSecondaryVerticalDividerFrame:", RoundRectToPixel(width * 0.65));

  +[StockChartDisplayMode defaultDisplayMode](StockChartDisplayMode, "defaultDisplayMode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setVolumeHeight:", RoundToPixel(18.0));
  objc_msgSend(v10, "setMaxInterval:", 6);
  objc_msgSend(v10, "setYAxisLabelCount:", 2);
  objc_msgSend(v10, "setHorizontalGridlineCount:", 4);
  objc_msgSend(v10, "setGraphOverlapsYAxisLabels:", 1);
  objc_msgSend(v10, "setChartSize:", width * 0.7 * 0.5, v4 * 0.5);
  objc_msgSend(v5, "setChartDisplayMode:", v10);

  return v5;
}

+ (unint64_t)numberOfRowsForSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  unint64_t v11;
  void *v12;
  double v13;
  double v14;
  CGRect v17;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v6 = CGRectGetHeight(v17);

  v7 = 20.0;
  if (v6 - height > 1.0)
    v7 = 0.0;
  v8 = height - v7;
  v9 = -1;
  do
  {
    v10 = width / (v8 + (double)(unint64_t)(v9 + 2) * -56.0);
    ++v9;
  }
  while (v10 < 1.25);
  if (v10 > 1.51)
    v11 = v9;
  else
    v11 = v9 + 1;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_referenceBounds");
  v14 = v13;

  if (v11 > 7 && v14 == 812.0)
    return 7;
  else
    return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  CGSize v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  v15 = (void *)MEMORY[0x24BDD17C8];
  -[StocksLayout listViewFrame](self, "listViewFrame");
  NSStringFromCGRect(v17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[StocksLayout infoViewFrame](self, "infoViewFrame");
  NSStringFromCGRect(v18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("YES");
  if (-[StocksLayout infoViewInScrollView](self, "infoViewInScrollView"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  -[StocksLayout chartViewFrame](self, "chartViewFrame");
  NSStringFromCGRect(v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[StocksLayout chartViewInScrollView](self, "chartViewInScrollView"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  -[StocksLayout newsViewFrame](self, "newsViewFrame");
  NSStringFromCGRect(v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[StocksLayout newsViewInScrollView](self, "newsViewInScrollView"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (!-[StocksLayout hasScrollView](self, "hasScrollView"))
    v5 = CFSTR("NO");
  -[StocksLayout scrollViewFrame](self, "scrollViewFrame");
  NSStringFromCGRect(v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[StocksLayout scrollViewContentSize](self, "scrollViewContentSize");
  NSStringFromCGSize(v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("listView\n\t-frame: %@\ninfoView\n\t-frame: %@\n\t-in scrollview: %@\nchartView\n\t-frame: %@\n\t-in scrollview: %@\nnewsView\n\t-frame: %@\n\t-in scrollview: %@\nscrollView\n\t-present: %@\n\t-frame: %@\n\t-content size: %@"), v3, v4, v6, v7, v8, v9, v10, v5, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (CGRect)listViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_listViewFrame.origin.x;
  y = self->_listViewFrame.origin.y;
  width = self->_listViewFrame.size.width;
  height = self->_listViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setListViewFrame:(CGRect)a3
{
  self->_listViewFrame = a3;
}

- (CGRect)infoViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_infoViewFrame.origin.x;
  y = self->_infoViewFrame.origin.y;
  width = self->_infoViewFrame.size.width;
  height = self->_infoViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInfoViewFrame:(CGRect)a3
{
  self->_infoViewFrame = a3;
}

- (CGRect)chartViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_chartViewFrame.origin.x;
  y = self->_chartViewFrame.origin.y;
  width = self->_chartViewFrame.size.width;
  height = self->_chartViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setChartViewFrame:(CGRect)a3
{
  self->_chartViewFrame = a3;
}

- (CGRect)newsViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_newsViewFrame.origin.x;
  y = self->_newsViewFrame.origin.y;
  width = self->_newsViewFrame.size.width;
  height = self->_newsViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setNewsViewFrame:(CGRect)a3
{
  self->_newsViewFrame = a3;
}

- (UIEdgeInsets)listViewContentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_listViewContentInsets.top;
  left = self->_listViewContentInsets.left;
  bottom = self->_listViewContentInsets.bottom;
  right = self->_listViewContentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setListViewContentInsets:(UIEdgeInsets)a3
{
  self->_listViewContentInsets = a3;
}

- (BOOL)infoViewHasBottomLine
{
  return self->_infoViewHasBottomLine;
}

- (void)setInfoViewHasBottomLine:(BOOL)a3
{
  self->_infoViewHasBottomLine = a3;
}

- (BOOL)newsViewHasBottomLine
{
  return self->_newsViewHasBottomLine;
}

- (void)setNewsViewHasBottomLine:(BOOL)a3
{
  self->_newsViewHasBottomLine = a3;
}

- (BOOL)chartViewHasBottomLine
{
  return self->_chartViewHasBottomLine;
}

- (void)setChartViewHasBottomLine:(BOOL)a3
{
  self->_chartViewHasBottomLine = a3;
}

- (BOOL)newsViewShouldUseLargerFonts
{
  return self->_newsViewShouldUseLargerFonts;
}

- (void)setNewsViewShouldUseLargerFonts:(BOOL)a3
{
  self->_newsViewShouldUseLargerFonts = a3;
}

- (BOOL)chartViewHasTapGesture
{
  return self->_chartViewHasTapGesture;
}

- (void)setChartViewHasTapGesture:(BOOL)a3
{
  self->_chartViewHasTapGesture = a3;
}

- (BOOL)hasScrollView
{
  return self->_hasScrollView;
}

- (void)setHasScrollView:(BOOL)a3
{
  self->_hasScrollView = a3;
}

- (CGRect)scrollViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_scrollViewFrame.origin.x;
  y = self->_scrollViewFrame.origin.y;
  width = self->_scrollViewFrame.size.width;
  height = self->_scrollViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setScrollViewFrame:(CGRect)a3
{
  self->_scrollViewFrame = a3;
}

- (CGSize)scrollViewContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_scrollViewContentSize.width;
  height = self->_scrollViewContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setScrollViewContentSize:(CGSize)a3
{
  self->_scrollViewContentSize = a3;
}

- (BOOL)infoViewInScrollView
{
  return self->_infoViewInScrollView;
}

- (void)setInfoViewInScrollView:(BOOL)a3
{
  self->_infoViewInScrollView = a3;
}

- (BOOL)chartViewInScrollView
{
  return self->_chartViewInScrollView;
}

- (void)setChartViewInScrollView:(BOOL)a3
{
  self->_chartViewInScrollView = a3;
}

- (BOOL)newsViewInScrollView
{
  return self->_newsViewInScrollView;
}

- (void)setNewsViewInScrollView:(BOOL)a3
{
  self->_newsViewInScrollView = a3;
}

- (BOOL)hasBlurView
{
  return self->_hasBlurView;
}

- (void)setHasBlurView:(BOOL)a3
{
  self->_hasBlurView = a3;
}

- (CGRect)blurViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_blurViewFrame.origin.x;
  y = self->_blurViewFrame.origin.y;
  width = self->_blurViewFrame.size.width;
  height = self->_blurViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBlurViewFrame:(CGRect)a3
{
  self->_blurViewFrame = a3;
}

- (BOOL)hasGrayView
{
  return self->_hasGrayView;
}

- (void)setHasGrayView:(BOOL)a3
{
  self->_hasGrayView = a3;
}

- (CGRect)grayViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_grayViewFrame.origin.x;
  y = self->_grayViewFrame.origin.y;
  width = self->_grayViewFrame.size.width;
  height = self->_grayViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setGrayViewFrame:(CGRect)a3
{
  self->_grayViewFrame = a3;
}

- (BOOL)hasSecondaryGrayView
{
  return self->_hasSecondaryGrayView;
}

- (void)setHasSecondaryGrayView:(BOOL)a3
{
  self->_hasSecondaryGrayView = a3;
}

- (CGRect)secondaryGrayViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_secondaryGrayViewFrame.origin.x;
  y = self->_secondaryGrayViewFrame.origin.y;
  width = self->_secondaryGrayViewFrame.size.width;
  height = self->_secondaryGrayViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSecondaryGrayViewFrame:(CGRect)a3
{
  self->_secondaryGrayViewFrame = a3;
}

- (BOOL)hasStatusView
{
  return self->_hasStatusView;
}

- (void)setHasStatusView:(BOOL)a3
{
  self->_hasStatusView = a3;
}

- (CGRect)statusViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_statusViewFrame.origin.x;
  y = self->_statusViewFrame.origin.y;
  width = self->_statusViewFrame.size.width;
  height = self->_statusViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setStatusViewFrame:(CGRect)a3
{
  self->_statusViewFrame = a3;
}

- (BOOL)hasStatusViewDivider
{
  return self->_hasStatusViewDivider;
}

- (void)setHasStatusViewDivider:(BOOL)a3
{
  self->_hasStatusViewDivider = a3;
}

- (CGRect)statusViewDividerFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_statusViewDividerFrame.origin.x;
  y = self->_statusViewDividerFrame.origin.y;
  width = self->_statusViewDividerFrame.size.width;
  height = self->_statusViewDividerFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setStatusViewDividerFrame:(CGRect)a3
{
  self->_statusViewDividerFrame = a3;
}

- (BOOL)hasPrimaryHorizontalDivider
{
  return self->_hasPrimaryHorizontalDivider;
}

- (void)setHasPrimaryHorizontalDivider:(BOOL)a3
{
  self->_hasPrimaryHorizontalDivider = a3;
}

- (CGRect)primaryHorizontalDividerFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_primaryHorizontalDividerFrame.origin.x;
  y = self->_primaryHorizontalDividerFrame.origin.y;
  width = self->_primaryHorizontalDividerFrame.size.width;
  height = self->_primaryHorizontalDividerFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPrimaryHorizontalDividerFrame:(CGRect)a3
{
  self->_primaryHorizontalDividerFrame = a3;
}

- (BOOL)hasSecondaryHorizontalDivider
{
  return self->_hasSecondaryHorizontalDivider;
}

- (void)setHasSecondaryHorizontalDivider:(BOOL)a3
{
  self->_hasSecondaryHorizontalDivider = a3;
}

- (CGRect)secondaryHorizontalDividerFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_secondaryHorizontalDividerFrame.origin.x;
  y = self->_secondaryHorizontalDividerFrame.origin.y;
  width = self->_secondaryHorizontalDividerFrame.size.width;
  height = self->_secondaryHorizontalDividerFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSecondaryHorizontalDividerFrame:(CGRect)a3
{
  self->_secondaryHorizontalDividerFrame = a3;
}

- (BOOL)hasPrimaryVerticalDivider
{
  return self->_hasPrimaryVerticalDivider;
}

- (void)setHasPrimaryVerticalDivider:(BOOL)a3
{
  self->_hasPrimaryVerticalDivider = a3;
}

- (CGRect)primaryVerticalDividerFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_primaryVerticalDividerFrame.origin.x;
  y = self->_primaryVerticalDividerFrame.origin.y;
  width = self->_primaryVerticalDividerFrame.size.width;
  height = self->_primaryVerticalDividerFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPrimaryVerticalDividerFrame:(CGRect)a3
{
  self->_primaryVerticalDividerFrame = a3;
}

- (BOOL)hasSecondaryVerticalDivider
{
  return self->_hasSecondaryVerticalDivider;
}

- (void)setHasSecondaryVerticalDivider:(BOOL)a3
{
  self->_hasSecondaryVerticalDivider = a3;
}

- (CGRect)secondaryVerticalDividerFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_secondaryVerticalDividerFrame.origin.x;
  y = self->_secondaryVerticalDividerFrame.origin.y;
  width = self->_secondaryVerticalDividerFrame.size.width;
  height = self->_secondaryVerticalDividerFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSecondaryVerticalDividerFrame:(CGRect)a3
{
  self->_secondaryVerticalDividerFrame = a3;
}

- (unint64_t)listViewRowCount
{
  return self->_listViewRowCount;
}

- (void)setListViewRowCount:(unint64_t)a3
{
  self->_listViewRowCount = a3;
}

- (double)statusViewCenteringRatio
{
  return self->_statusViewCenteringRatio;
}

- (void)setStatusViewCenteringRatio:(double)a3
{
  self->_statusViewCenteringRatio = a3;
}

- (StockChartDisplayMode)chartDisplayMode
{
  return self->_chartDisplayMode;
}

- (void)setChartDisplayMode:(id)a3
{
  objc_storeStrong((id *)&self->_chartDisplayMode, a3);
}

- (BOOL)hasBlackView
{
  return self->_hasBlackView;
}

- (void)setHasBlackView:(BOOL)a3
{
  self->_hasBlackView = a3;
}

- (BOOL)isFullScreenChart
{
  return self->_isFullScreenChart;
}

- (void)setIsFullScreenChart:(BOOL)a3
{
  self->_isFullScreenChart = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chartDisplayMode, 0);
}

@end
