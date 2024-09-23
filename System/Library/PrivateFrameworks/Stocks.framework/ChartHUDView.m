@implementation ChartHUDView

+ (id)_dateRangeSeparatorString
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_dateRangeSeparatorString_dateRangeSeparatorString;
  if (!_dateRangeSeparatorString_dateRangeSeparatorString)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%C"), 8211);
    v4 = (void *)_dateRangeSeparatorString_dateRangeSeparatorString;
    _dateRangeSeparatorString_dateRangeSeparatorString = v3;

    v2 = (void *)_dateRangeSeparatorString_dateRangeSeparatorString;
  }
  return v2;
}

+ (void)initializeDateFormattersIfNeededForInterval:(int64_t)a3 withTimeZone:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  v5 = a4;
  v20 = v5;
  if (a3 < 2)
  {
    v13 = (void *)shortTermSingleDateFormatter;
    if (!shortTermSingleDateFormatter)
    {
      v14 = objc_alloc_init(MEMORY[0x24BDD1500]);
      v15 = (void *)shortTermSingleDateFormatter;
      shortTermSingleDateFormatter = (uint64_t)v14;

      objc_msgSend((id)shortTermSingleDateFormatter, "setDateStyle:", 3);
      objc_msgSend((id)shortTermSingleDateFormatter, "setTimeStyle:", 2);
      v16 = objc_alloc_init(MEMORY[0x24BDD1500]);
      v17 = (void *)shortTermDoubleDateFormatter;
      shortTermDoubleDateFormatter = (uint64_t)v16;

      objc_msgSend((id)shortTermDoubleDateFormatter, "setDateStyle:", 1);
      objc_msgSend((id)shortTermDoubleDateFormatter, "setTimeStyle:", 1);
      v18 = objc_alloc_init(MEMORY[0x24BDD1500]);
      v19 = (void *)daySecondDateFormatter;
      daySecondDateFormatter = (uint64_t)v18;

      objc_msgSend((id)daySecondDateFormatter, "setDateStyle:", 0);
      objc_msgSend((id)daySecondDateFormatter, "setTimeStyle:", 1);
      v13 = (void *)shortTermSingleDateFormatter;
    }
    objc_msgSend(v13, "setTimeZone:", v20);
    v6 = v20;
    v7 = (void *)shortTermDoubleDateFormatter;
    v8 = &daySecondDateFormatter;
  }
  else
  {
    v6 = v5;
    v7 = (void *)longTermSingleDateFormatter;
    v8 = &longTermDoubleDateFormatter;
    if (!longTermSingleDateFormatter)
    {
      v9 = objc_alloc_init(MEMORY[0x24BDD1500]);
      v10 = (void *)longTermSingleDateFormatter;
      longTermSingleDateFormatter = (uint64_t)v9;

      objc_msgSend((id)longTermSingleDateFormatter, "setDateStyle:", 3);
      objc_msgSend((id)longTermSingleDateFormatter, "setTimeStyle:", 0);
      v11 = objc_alloc_init(MEMORY[0x24BDD1500]);
      v12 = (void *)longTermDoubleDateFormatter;
      longTermDoubleDateFormatter = (uint64_t)v11;

      objc_msgSend((id)longTermDoubleDateFormatter, "setDateStyle:", 2);
      objc_msgSend((id)longTermDoubleDateFormatter, "setTimeStyle:", 0);
      v6 = v20;
      v7 = (void *)longTermSingleDateFormatter;
    }
  }
  objc_msgSend(v7, "setTimeZone:", v6);
  objc_msgSend((id)*v8, "setTimeZone:", v20);

}

- (void)resetLocale
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)longTermSingleDateFormatter;
  longTermSingleDateFormatter = 0;

  v3 = (void *)longTermDoubleDateFormatter;
  longTermDoubleDateFormatter = 0;

  v4 = (void *)shortTermSingleDateFormatter;
  shortTermSingleDateFormatter = 0;

  v5 = (void *)shortTermDoubleDateFormatter;
  shortTermDoubleDateFormatter = 0;

  v6 = (void *)daySecondDateFormatter;
  daySecondDateFormatter = 0;

}

+ (id)stringForTimeIntervalSince1970:(double)a3 withInterval:(int64_t)a4 isDouble:(BOOL)a5 isLeft:(BOOL)a6
{
  uint64_t *v7;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  if (a4 < 2)
  {
    if (!a5)
    {
      v9 = (void *)shortTermSingleDateFormatter;
      goto LABEL_13;
    }
    v7 = &shortTermDoubleDateFormatter;
    if (a4 != 1 && !a6)
      v7 = &daySecondDateFormatter;
  }
  else
  {
    v7 = &longTermDoubleDateFormatter;
    if (!a5)
      v7 = &longTermSingleDateFormatter;
  }
  v9 = (void *)*v7;
LABEL_13:
  v10 = v9;
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)newHUDLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  +[StocksStyle sharedStyle](StocksStyle, "sharedStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lightFontOfSize:", 22.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "monoSpacedFontWithFont:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v6);

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.8, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v7);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v8);

  objc_msgSend(v3, "setClipsToBounds:", 0);
  return v3;
}

+ (id)monoSpacedFontWithFont:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "fontDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x24BDF7748];
  v4 = *MEMORY[0x24BDF7778];
  v11[0] = *MEMORY[0x24BDF7780];
  v11[1] = v4;
  v12[0] = &unk_24D75F148;
  v12[1] = &unk_24D75F160;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontDescriptorByAddingAttributes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v8, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (ChartHUDView)initWithFrame:(CGRect)a3
{
  ChartHUDView *v3;
  UILabel *v4;
  UILabel *leftDateLabel;
  UILabel *v6;
  UILabel *centeredLabel;
  UILabel *v8;
  UILabel *rightDateLabel;
  id v10;
  HUDTouchInfo *v11;
  HUDTouchInfo *v12;
  uint64_t v13;
  NSMutableSet *inactiveTouchInfoSet;
  uint64_t v15;
  NSMutableSet *touchInfoSet;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  PricePopoverBar *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  uint64_t v41;
  PricePopoverBar *pricePopoverBar;
  StocksTapDragGestureRecognizer *v43;
  StocksTapDragGestureRecognizer *tapDragGesture;
  void *v46;
  NSMutableSet *obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  objc_super v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v52.receiver = self;
  v52.super_class = (Class)ChartHUDView;
  v3 = -[ChartHUDView initWithFrame:](&v52, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[ChartHUDView newHUDLabel](ChartHUDView, "newHUDLabel");
    leftDateLabel = v3->_leftDateLabel;
    v3->_leftDateLabel = v4;

    -[ChartHUDView addSubview:](v3, "addSubview:", v4);
    v6 = +[ChartHUDView newHUDLabel](ChartHUDView, "newHUDLabel");
    centeredLabel = v3->_centeredLabel;
    v3->_centeredLabel = v6;

    -[ChartHUDView addSubview:](v3, "addSubview:", v6);
    v8 = +[ChartHUDView newHUDLabel](ChartHUDView, "newHUDLabel");
    rightDateLabel = v3->_rightDateLabel;
    v3->_rightDateLabel = v8;

    -[ChartHUDView addSubview:](v3, "addSubview:", v8);
    v10 = objc_alloc(MEMORY[0x24BDBCEF0]);
    v11 = objc_alloc_init(HUDTouchInfo);
    v12 = objc_alloc_init(HUDTouchInfo);
    v13 = objc_msgSend(v10, "initWithObjects:", v11, v12, 0);
    inactiveTouchInfoSet = v3->_inactiveTouchInfoSet;
    v3->_inactiveTouchInfoSet = (NSMutableSet *)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 2);
    touchInfoSet = v3->_touchInfoSet;
    v3->_touchInfoSet = (NSMutableSet *)v15;

    +[StocksBundles getBundle:](StocksBundles, "getBundle:", 1);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x24BDF6AC8];
    -[ChartHUDView traitCollection](v3, "traitCollection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)v17;
    objc_msgSend(v18, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("HUDDot"), v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    obj = v3->_inactiveTouchInfoSet;
    v21 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v49;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v49 != v23)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v24);
          v26 = (void *)objc_opt_new();
          objc_msgSend(v25, "setBar:", v26);

          v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v20);
          objc_msgSend(v25, "setDot:", v27);

          objc_msgSend(v25, "bar");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setAlpha:", 0.0);

          +[StocksStyle sharedStyle](StocksStyle, "sharedStyle");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "chartHighlightColor");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "bar");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setBackgroundColor:", v30);

          objc_msgSend(v25, "dot");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setAlpha:", 0.0);

          objc_msgSend(v25, "bar");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[ChartHUDView addSubview:](v3, "addSubview:", v33);

          objc_msgSend(v25, "dot");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[ChartHUDView addSubview:](v3, "addSubview:", v34);

          ++v24;
        }
        while (v22 != v24);
        v22 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      }
      while (v22);
    }

    v35 = [PricePopoverBar alloc];
    v36 = (void *)MEMORY[0x24BDF6AC8];
    -[ChartHUDView traitCollection](v3, "traitCollection");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("ButtonMask"), v46, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = CeilToPixel(4.5);
    objc_msgSend(v38, "resizableImageWithCapInsets:resizingMode:", 1, 0.0, v39, 0.0, CeilToPixel(4.5));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[PricePopoverBar initWithBackgroundImage:](v35, "initWithBackgroundImage:", v40);
    pricePopoverBar = v3->_pricePopoverBar;
    v3->_pricePopoverBar = (PricePopoverBar *)v41;

    -[PricePopoverBar setAlpha:](v3->_pricePopoverBar, "setAlpha:", 0.0);
    -[ChartHUDView addSubview:](v3, "addSubview:", v3->_pricePopoverBar);
    v43 = -[StocksTapDragGestureRecognizer initWithTarget:action:]([StocksTapDragGestureRecognizer alloc], "initWithTarget:action:", v3, sel_tapDragGestureChanged_);
    tapDragGesture = v3->_tapDragGesture;
    v3->_tapDragGesture = v43;

    -[StocksTapDragGestureRecognizer setMaximumNumberOfTouches:](v3->_tapDragGesture, "setMaximumNumberOfTouches:", 2);
    -[StocksTapDragGestureRecognizer setRequiredPressDelay:](v3->_tapDragGesture, "setRequiredPressDelay:", 0.1);
    -[ChartHUDView addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_tapDragGesture);

  }
  return v3;
}

- (void)setFrame:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id WeakRetained;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)ChartHUDView;
  -[ChartHUDView setFrame:](&v22, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[StockGraphView frame](self->_graphView, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chartView);
  -[ChartHUDView convertRect:fromView:](self, "convertRect:fromView:", WeakRetained, v5, v7, v9, v11);
  v14 = v13;
  v16 = v15;

  v17 = objc_loadWeakRetained((id *)&self->_chartView);
  objc_msgSend(v17, "bounds");
  v19 = v18;
  v21 = v20;

  -[StocksTapDragGestureRecognizer setTouchableBounds:](self->_tapDragGesture, "setTouchableBounds:", v14, v16, v19, v21 - v16);
}

- (void)setOverlayHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  self->_overlayHidden = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[ChartHUDView subviews](self, "subviews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setHidden:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)setEnabled:(BOOL)a3
{
  -[StocksTapDragGestureRecognizer setEnabled:](self->_tapDragGesture, "setEnabled:", a3);
}

- (void)resizeSelectedClipViewsIfNeeded
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v34;
  id v35;

  v3 = -[NSMutableSet count](self->_touchInfoSet, "count");
  -[NSMutableSet allObjects](self->_touchInfoSet, "allObjects");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 == 2)
  {
    objc_msgSend(v35, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "plottedLocation");
    v6 = v5;

    objc_msgSend(v35, "objectAtIndex:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "plottedLocation");
    v9 = v8;

    -[ChartHUDView convertPoint:toView:](self, "convertPoint:toView:", self->_graphView, v6, 0.0);
    v11 = v10;
    -[ChartHUDView convertPoint:toView:](self, "convertPoint:toView:", self->_graphView, v9, 0.0);
    if (v11 >= v12)
      v13 = v12;
    else
      v13 = v11;
    if (v11 >= v12)
      v14 = v11;
    else
      v14 = v12;
    -[StockGraphView resizeSelectedLineClipViewWithLeftX:rightX:](self->_graphView, "resizeSelectedLineClipViewWithLeftX:rightX:", v13, v14);
  }
  if (-[NSMutableSet count](self->_touchInfoSet, "count"))
  {
    -[NSMutableSet allObjects](self->_touchInfoSet, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "touch");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "locationInView:", self->_graphView);
    v19 = v18;
    v21 = v20;

    if (v3 == 2)
    {
      objc_msgSend(v15, "lastObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "touch");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "locationInView:", self->_graphView);
      v25 = v24;
      v27 = v26;

      if (v19 >= v25)
        v28 = v21;
      else
        v28 = v27;
      if (v19 < v25)
      {
        v29 = v25;
      }
      else
      {
        v21 = v27;
        v29 = v19;
      }
      if (v19 >= v25)
        v19 = v25;
    }
    else
    {
      v29 = 0.0;
      v28 = 0.0;
    }
    -[StockGraphView volumeBarRectNearestToPoint:](self->_graphView, "volumeBarRectNearestToPoint:", v19, v21);
    v34 = v30;
    if (v3 == 2)
      -[StockGraphView volumeBarRectNearestToPoint:](self->_graphView, "volumeBarRectNearestToPoint:", v29, v28);
    -[StockGraphView resizeSelectedVolumeClipViewWithLeftX:rightX:](self->_graphView, "resizeSelectedVolumeClipViewWithLeftX:rightX:", v34, CGRectGetMaxX(*(CGRect *)&v30));

  }
}

- (void)layoutSubviews
{
  void *v2;
  uint64_t j;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id WeakRetained;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  _BOOL4 forceTouchUpdate;
  NSMutableSet *v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  StockGraphView *graphView;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  void *v76;
  int v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  void *v82;
  double v83;
  double v84;
  _BOOL8 v85;
  void *v86;
  void *v87;
  double v88;
  double v89;
  void *v90;
  void *v91;
  double v92;
  double v93;
  float v94;
  float v95;
  double v96;
  float v97;
  float v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  PricePopoverBar *pricePopoverBar;
  void *v110;
  void *v111;
  void *v112;
  const __CFString *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  PricePopoverBar *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  UILabel **p_rightDateLabel;
  double v126;
  double v127;
  double v128;
  double v129;
  void *v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  void *v136;
  double v137;
  double v138;
  void *v139;
  double v140;
  double v141;
  double v142;
  int64_t interval;
  double v144;
  double v145;
  uint64_t v146;
  UILabel *leftDateLabel;
  double v148;
  double v149;
  NSMutableSet *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  double v154;
  uint64_t k;
  double v156;
  double v157;
  double v158;
  uint64_t v159;
  double v160;
  double v161;
  double v162;
  double v163;
  void *v164;
  void *v165;
  double v166;
  void *v167;
  CGFloat rect;
  CGFloat v169;
  double v170;
  double v171;
  double v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  double v177;
  double v178;
  __int128 v179;
  uint64_t v180;
  __int128 v181;
  uint64_t v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  _BYTE v191[128];
  _BYTE v192[128];
  _BYTE v193[128];
  uint64_t v194;
  CGRect v195;
  CGRect v196;

  v194 = *MEMORY[0x24BDAC8D0];
  if (-[NSMutableSet count](self->_touchInfoSet, "count"))
  {
    -[ChartHUDView alpha](self, "alpha");
    if (v5 != 0.0)
    {
      -[StockGraphView frame](self->_graphView, "frame");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      WeakRetained = objc_loadWeakRetained((id *)&self->_chartView);
      -[ChartHUDView convertRect:fromView:](self, "convertRect:fromView:", WeakRetained, v7, v9, v11, v13);
      v169 = v16;
      v170 = v15;
      v18 = v17;
      rect = v19;

      -[PricePopoverBar frame](self->_pricePopoverBar, "frame");
      v171 = v20;
      v172 = v21;
      v166 = v22;
      v187 = 0u;
      v188 = 0u;
      v189 = 0u;
      v190 = 0u;
      -[NSMutableSet setByAddingObjectsFromSet:](self->_touchInfoSet, "setByAddingObjectsFromSet:", self->_inactiveTouchInfoSet);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v187, v193, 16);
      if (v24)
      {
        v25 = v24;
        j = *(_QWORD *)v188;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v188 != j)
              objc_enumerationMutation(v23);
            v27 = *(void **)(*((_QWORD *)&v187 + 1) + 8 * i);
            objc_msgSend(v27, "bar");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "bar");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "frame");
            v31 = v30;
            objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "scale");
            objc_msgSend(v28, "setFrame:", v31, v18 + 1.0 / v32, RoundToPixel(0.5), self->_barHeight);

          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v187, v193, 16);
        }
        while (v25);
      }

      forceTouchUpdate = self->_forceTouchUpdate;
      self->_forceTouchUpdate = 0;
      v183 = 0u;
      v184 = 0u;
      v185 = 0u;
      v186 = 0u;
      v34 = self->_touchInfoSet;
      v35 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v183, v192, 16);
      v36 = forceTouchUpdate;
      if (v35)
      {
        v37 = v35;
        v2 = *(void **)v184;
        do
        {
          for (j = 0; j != v37; ++j)
          {
            if (*(void **)v184 != v2)
              objc_enumerationMutation(v34);
            v38 = *(void **)(*((_QWORD *)&v183 + 1) + 8 * j);
            objc_msgSend(v38, "touch");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "locationInView:", self);
            v41 = v40;
            v43 = v42;

            objc_msgSend(v38, "setLocationInHUD:", v41, v43);
            v177 = 0.0;
            v178 = 0.0;
            -[ChartHUDView convertPoint:toView:](self, "convertPoint:toView:", self->_graphView, v41, v43);
            v177 = v44;
            v178 = v45;
            graphView = self->_graphView;
            if (graphView)
            {
              -[StockGraphView plottedPointNearestToPoint:](graphView, "plottedPointNearestToPoint:", &v177);
            }
            else
            {
              v181 = 0uLL;
              v182 = 0;
            }
            v179 = v181;
            v180 = v182;
            objc_msgSend(v38, "setStockValue:", &v179);
            -[ChartHUDView convertPoint:fromView:](self, "convertPoint:fromView:", self->_graphView, v177, v178);
            v48 = v47;
            v50 = v49;
            objc_msgSend(v38, "plottedLocation");
            if (v48 != v52 || v50 != v51)
            {
              objc_msgSend(v38, "setPlottedLocation:", v48, v50);
              objc_msgSend(v38, "dot");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "setCenter:", v48, v50);

              objc_msgSend(v38, "bar");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "frame");
              v57 = v56;
              v59 = v58;
              v61 = v60;

              v62 = v18;
              v63 = RoundToPixel(v48 + v59 * -0.5);
              objc_msgSend(v38, "bar");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              v65 = v63;
              v18 = v62;
              objc_msgSend(v64, "setFrame:", v65, v57, v59, v61);

              -[ChartHUDView convertPoint:toView:](self, "convertPoint:toView:", self->_graphView, v48, v50);
              v177 = v66;
              v178 = v67;
              v36 = 1;
            }
            if (-[NSMutableSet count](self->_touchInfoSet, "count") == 1)
            {
              v195.size.width = v169;
              v195.origin.x = v170;
              v195.origin.y = v18;
              v195.size.height = rect;
              v68 = CGRectGetMaxX(v195) - v172;
              v69 = RoundToPixel(v48 - v172 * 0.5);
              if (v170 >= v69)
                v69 = v170;
              if (v68 < v69)
                v69 = v68;
              v171 = v69;
            }
          }
          v37 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v183, v192, 16);
        }
        while (v37);
      }

      if (v36 && -[NSMutableSet count](self->_touchInfoSet, "count"))
      {
        -[ChartHUDView resizeSelectedClipViewsIfNeeded](self, "resizeSelectedClipViewsIfNeeded");
        +[StocksStyle sharedStyle](StocksStyle, "sharedStyle");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "chartHighlightColor");
        v71 = objc_claimAutoreleasedReturnValue();

        v164 = (void *)v71;
        if (-[NSMutableSet count](self->_touchInfoSet, "count") == 1)
        {
          -[NSMutableSet anyObject](self->_touchInfoSet, "anyObject");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = v72;
          if (v72)
          {
            objc_msgSend(v72, "stockValue");
            v75 = v177;
            v74 = v178;

            v76 = (void *)MEMORY[0x24BDD16E0];
            if (v74 >= 1000.0)
            {
              v74 = RoundToPixel(v74);
              v77 = 0;
            }
            else
            {
              v77 = 1;
            }
          }
          else
          {

            v76 = (void *)MEMORY[0x24BDD16E0];
            v75 = 0.0;
            v77 = 1;
            v74 = 0.0;
          }
          objc_msgSend(v76, "numberWithDouble:", v74);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          +[StockDataFormatter sharedDataFormatter](StockDataFormatter, "sharedDataFormatter");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          if (v77)
          {
            -[ChartHUDView chartView](self, "chartView");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "stock");
            j = objc_claimAutoreleasedReturnValue();
            v115 = objc_msgSend((id)j, "pricePrecision");
          }
          else
          {
            v115 = 0;
          }
          objc_msgSend(v114, "formattedNumber:withPrecision:useGroupSeparator:", v78, v115, 1);
          v108 = objc_claimAutoreleasedReturnValue();
          if (v77)
          {

          }
          -[PricePopoverBar setImageMaskColor:](self->_pricePopoverBar, "setImageMaskColor:", v71);
          -[PricePopoverBar setChangeImage:](self->_pricePopoverBar, "setChangeImage:", 0);
          v106 = 0;
          v92 = 0.0;
        }
        else
        {
          -[NSMutableSet allObjects](self->_touchInfoSet, "allObjects");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "objectAtIndex:", 0);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "locationInHUD");
          v81 = v80;
          objc_msgSend(v78, "objectAtIndex:", 1);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "locationInHUD");
          v84 = v83;
          v85 = v81 >= v83;

          objc_msgSend(v78, "objectAtIndex:", v85);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = v86;
          v88 = 0.0;
          v89 = 0.0;
          v75 = 0.0;
          if (v86)
          {
            objc_msgSend(v86, "stockValue");
            v75 = v177;
            v89 = v178;
          }

          objc_msgSend(v78, "objectAtIndex:", v81 < v84);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = v90;
          v92 = 0.0;
          if (v90)
          {
            objc_msgSend(v90, "stockValue");
            v92 = v177;
            v88 = v178;
          }

          v93 = v88 - v89;
          v94 = (v88 - v89) / v89;
          v95 = v93;
          v96 = fabsf(v94);
          if (v96 >= 0.0001)
            v97 = v95;
          else
            v97 = 0.0;
          if (v96 >= 0.0001)
            v98 = v94;
          else
            v98 = 0.0;
          +[StockDataFormatter sharedDataFormatter](StockDataFormatter, "sharedDataFormatter");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", fabsf(v97));
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          -[ChartHUDView chartView](self, "chartView");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "stock");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "formattedNumber:withPrecision:useGroupSeparator:", v100, objc_msgSend(v102, "pricePrecision"), 1);
          v103 = (void *)objc_claimAutoreleasedReturnValue();

          +[StockDataFormatter sharedDataFormatter](StockDataFormatter, "sharedDataFormatter");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", fabsf(v98));
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "formattedPercent:", v105);
          v106 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("+-"));
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "stringByTrimmingCharactersInSet:", v107);
          v108 = objc_claimAutoreleasedReturnValue();

          if (v96 >= 0.0001)
          {
            v165 = v106;
            pricePopoverBar = self->_pricePopoverBar;
            +[StocksStyle sharedStyle](StocksStyle, "sharedStyle");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            v111 = v110;
            if (v94 >= 0.0)
            {
              objc_msgSend(v110, "gainColor");
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              v113 = CFSTR("PlusSign");
            }
            else
            {
              objc_msgSend(v110, "lossColor");
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              v113 = CFSTR("MinusSign");
            }
            -[PricePopoverBar setImageMaskColor:](pricePopoverBar, "setImageMaskColor:", v112);

            +[StocksBundles getBundle:](StocksBundles, "getBundle:", 1);
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            v117 = self->_pricePopoverBar;
            v118 = (void *)MEMORY[0x24BDF6AC8];
            -[ChartHUDView traitCollection](self, "traitCollection");
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v118, "imageNamed:inBundle:compatibleWithTraitCollection:", v113, v116, v119);
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            -[PricePopoverBar setChangeImage:](v117, "setChangeImage:", v120);

            v106 = v165;
          }
          else
          {
            -[PricePopoverBar setImageMaskColor:](self->_pricePopoverBar, "setImageMaskColor:", v164);
            -[PricePopoverBar setChangeImage:](self->_pricePopoverBar, "setChangeImage:", 0);
          }
        }

        v167 = (void *)v108;
        -[PricePopoverBar setPriceString:](self->_pricePopoverBar, "setPriceString:", v108);
        -[PricePopoverBar setPercentChange:](self->_pricePopoverBar, "setPercentChange:", v106);
        +[ChartHUDView stringForTimeIntervalSince1970:withInterval:isDouble:isLeft:](ChartHUDView, "stringForTimeIntervalSince1970:withInterval:isDouble:isLeft:", self->_interval, -[NSMutableSet count](self->_touchInfoSet, "count") == 2, 1, v75);
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel font](self->_leftDateLabel, "font");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSMutableSet count](self->_touchInfoSet, "count") != 2 || v92 == v75)
        {
          v132 = *MEMORY[0x24BDBF148];
          v134 = *(double *)(MEMORY[0x24BDBF148] + 8);
          -[UILabel setText:](self->_centeredLabel, "setText:", v121);
          p_rightDateLabel = &self->_rightDateLabel;
          -[UILabel setText:](self->_rightDateLabel, "setText:", 0);
          -[UILabel setText:](self->_leftDateLabel, "setText:", 0);
          v135 = 0.0;
          v129 = v134;
          v127 = v132;
        }
        else
        {
          +[ChartHUDView _dateRangeSeparatorString](ChartHUDView, "_dateRangeSeparatorString");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setText:](self->_centeredLabel, "setText:", v123);

          -[UILabel setText:](self->_leftDateLabel, "setText:", v121);
          +[ChartHUDView stringForTimeIntervalSince1970:withInterval:isDouble:isLeft:](ChartHUDView, "stringForTimeIntervalSince1970:withInterval:isDouble:isLeft:", self->_interval, -[NSMutableSet count](self->_touchInfoSet, "count") == 2, 0, v92);
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          p_rightDateLabel = &self->_rightDateLabel;
          -[UILabel setText:](self->_rightDateLabel, "setText:", v124);

          objc_msgSend(v121, "_legacy_sizeWithFont:", v122);
          v127 = v126;
          v129 = v128;
          -[UILabel text](self->_rightDateLabel, "text");
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v130, "_legacy_sizeWithFont:", v122);
          v132 = v131;
          v134 = v133;

          v135 = 1.0;
        }
        -[UILabel setAlpha:](*p_rightDateLabel, "setAlpha:", v135);
        -[UILabel setAlpha:](self->_leftDateLabel, "setAlpha:", v135);
        -[UILabel font](self->_centeredLabel, "font");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v136, "ascender");
        v138 = RoundToPixel(22.0 - v137);

        -[UILabel text](self->_centeredLabel, "text");
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v139, "_legacy_sizeWithFont:", v122);
        v141 = v140;
        v163 = v142;

        v162 = v138 - RoundToPixel(1.5);
        interval = self->_interval;
        -[ChartHUDView bounds](self, "bounds");
        if (interval)
          v145 = RoundToPixel((v144 - v141) * 0.5);
        else
          v145 = v127 + RoundToPixel((v144 - v127 - v141 - v132) * 0.5);
        -[UILabel setFrame:](self->_centeredLabel, "setFrame:", v145, v162, v141, v163);
        v146 = objc_msgSend(MEMORY[0x24BDF6F90], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[ChartHUDView semanticContentAttribute](self, "semanticContentAttribute"));
        leftDateLabel = self->_leftDateLabel;
        if (v146)
        {
          -[UILabel setFrame:](leftDateLabel, "setFrame:", v141 + v145 + 3.0, v138, v127, v129);
          v148 = v145 - v132;
          v149 = -3.0;
        }
        else
        {
          -[UILabel setFrame:](leftDateLabel, "setFrame:", v145 - v127 + -3.0, v138, v127, v129);
          v148 = v141 + v145;
          v149 = 3.0;
        }
        -[UILabel setFrame:](self->_rightDateLabel, "setFrame:", v148 + v149, v138, v132, v134);

      }
      v175 = 0u;
      v176 = 0u;
      v173 = 0u;
      v174 = 0u;
      v150 = self->_touchInfoSet;
      v151 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v150, "countByEnumeratingWithState:objects:count:", &v173, v191, 16);
      if (v151)
      {
        v152 = v151;
        v153 = *(_QWORD *)v174;
        v154 = 0.0;
        do
        {
          for (k = 0; k != v152; ++k)
          {
            if (*(_QWORD *)v174 != v153)
              objc_enumerationMutation(v150);
            objc_msgSend(*(id *)(*((_QWORD *)&v173 + 1) + 8 * k), "locationInHUD");
            v154 = v154 + v156 / (float)(unint64_t)-[NSMutableSet count](self->_touchInfoSet, "count");
          }
          v152 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v150, "countByEnumeratingWithState:objects:count:", &v173, v191, 16);
        }
        while (v152);
      }
      else
      {
        v154 = 0.0;
      }

      -[StockGraphView rightmostPlottedPoint](self->_graphView, "rightmostPlottedPoint");
      -[ChartHUDView convertPoint:fromView:](self, "convertPoint:fromView:", self->_graphView);
      v158 = v157;
      v159 = -[NSMutableSet count](self->_touchInfoSet, "count");
      v160 = v171;
      if (v159 == 2)
      {
        if (v154 >= v158)
          v154 = v158;
        v196.size.width = v169;
        v196.origin.x = v170;
        v196.origin.y = v18;
        v196.size.height = rect;
        v160 = CGRectGetMaxX(v196) - v172;
        v161 = fmax(round(v154 + v172 * -0.5), 16.0);
        if (v160 >= v161)
          v160 = v161;
      }
      -[PricePopoverBar setFrame:](self->_pricePopoverBar, "setFrame:", v160, v18 - v166 + -3.0, v172);
    }
  }
}

- (void)setSelectedInterval:(int64_t)a3 timeZone:(id)a4
{
  self->_interval = a3;
  +[ChartHUDView initializeDateFormattersIfNeededForInterval:withTimeZone:](ChartHUDView, "initializeDateFormattersIfNeededForInterval:withTimeZone:");
}

- (void)setShowingTracking:(BOOL)a3 withTouchInfo:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  double v10;
  id v11;
  _QWORD v12[4];
  id v13;
  ChartHUDView *v14;
  BOOL v15;

  v5 = a5;
  v6 = a3;
  v8 = a4;
  if (v6)
    -[ChartHUDView setNeedsLayout](self, "setNeedsLayout");
  v9 = (void *)MEMORY[0x24BDF6F90];
  if (v5)
    v10 = 0.150000002;
  else
    v10 = 0.0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__ChartHUDView_setShowingTracking_withTouchInfo_animated___block_invoke;
  v12[3] = &unk_24D74C308;
  v15 = v6;
  v13 = v8;
  v14 = self;
  v11 = v8;
  objc_msgSend(v9, "animateWithDuration:animations:", v12, v10);

}

uint64_t __58__ChartHUDView_setShowingTracking_withTouchInfo_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  uint64_t v8;
  void *v9;
  double v10;

  objc_msgSend(*(id *)(a1 + 32), "dot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_BYTE *)(a1 + 48))
    v4 = 1.0;
  else
    v4 = 0.0;
  objc_msgSend(v2, "setAlpha:", v4);

  objc_msgSend(*(id *)(a1 + 32), "bar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (*(_BYTE *)(a1 + 48))
    v7 = 1.0;
  else
    v7 = 0.0;
  objc_msgSend(v5, "setAlpha:", v7);

  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(v8 + 472);
  if (objc_msgSend(*(id *)(v8 + 456), "count"))
    v10 = 1.0;
  else
    v10 = 0.0;
  objc_msgSend(v9, "setAlpha:", v10);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 504), "setShowingSelectedVolumeRegion:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 456), "count") != 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 504), "setShowingSelectedLine:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 456), "count") == 2);
}

- (BOOL)isTrackingTouches
{
  return -[NSMutableSet count](self->_touchInfoSet, "count") != 0;
}

- (void)_showHUD
{
  StockChartView **p_chartView;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  p_chartView = &self->_chartView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chartView);
  objc_msgSend(WeakRetained, "chartData");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v8, "chartInterval");
  objc_msgSend(v8, "marketTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ChartHUDView setSelectedInterval:timeZone:](self, "setSelectedInterval:timeZone:", v5, v6);

  v7 = objc_loadWeakRetained((id *)p_chartView);
  objc_msgSend(v7, "setShowingHUD:", 1);

  -[ChartHUDView setNeedsLayout](self, "setNeedsLayout");
}

- (void)tapDragGestureChanged:(id)a3
{
  uint64_t v4;
  void *v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t k;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t m;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t n;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  id WeakRetained;
  NSMutableSet *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  NSMutableSet *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v44 = a3;
  v4 = objc_msgSend(v44, "state");
  switch(v4)
  {
    case 3:
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v32 = self->_touchInfoSet;
      v33 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v49, v66, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v34; ++i)
          {
            if (*(_QWORD *)v50 != v35)
              objc_enumerationMutation(v32);
            -[NSMutableSet addObject:](self->_inactiveTouchInfoSet, "addObject:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i));
          }
          v34 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v49, v66, 16);
        }
        while (v34);
      }

      -[NSMutableSet removeAllObjects](self->_touchInfoSet, "removeAllObjects");
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v37 = self->_inactiveTouchInfoSet;
      v38 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v45, v65, 16);
      if (v38)
      {
        v39 = v38;
        v40 = *(_QWORD *)v46;
        do
        {
          for (j = 0; j != v39; ++j)
          {
            if (*(_QWORD *)v46 != v40)
              objc_enumerationMutation(v37);
            v42 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
            objc_msgSend(v42, "setTouch:", 0);
            -[ChartHUDView setShowingTracking:withTouchInfo:animated:](self, "setShowingTracking:withTouchInfo:animated:", 0, v42, 1);
          }
          v39 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v45, v65, 16);
        }
        while (v39);
      }

      self->_forceTouchUpdate = 1;
      WeakRetained = objc_loadWeakRetained((id *)&self->_chartView);
      objc_msgSend(WeakRetained, "setShowingHUD:", 0);
      goto LABEL_48;
    case 2:
LABEL_5:
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v6 = self->_touchInfoSet;
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v62;
        do
        {
          for (k = 0; k != v8; ++k)
          {
            if (*(_QWORD *)v62 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * k);
            objc_msgSend(v44, "touches");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "touch");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v12, "containsObject:", v13);

            if ((v14 & 1) == 0)
              objc_msgSend(v5, "addObject:", v11);
          }
          v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
        }
        while (v8);
      }

      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v15 = v5;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v58;
        do
        {
          for (m = 0; m != v17; ++m)
          {
            if (*(_QWORD *)v58 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * m);
            objc_msgSend(v20, "setTouch:", 0);
            -[NSMutableSet removeObject:](self->_touchInfoSet, "removeObject:", v20);
            -[NSMutableSet addObject:](self->_inactiveTouchInfoSet, "addObject:", v20);
            -[ChartHUDView setShowingTracking:withTouchInfo:animated:](self, "setShowingTracking:withTouchInfo:animated:", 0, v20, 1);
            self->_forceTouchUpdate = 1;
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
        }
        while (v17);
      }
      v43 = v15;

      -[NSMutableSet valueForKey:](self->_touchInfoSet, "valueForKey:", CFSTR("touch"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      objc_msgSend(v44, "touches");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v54;
        do
        {
          for (n = 0; n != v24; ++n)
          {
            if (*(_QWORD *)v54 != v25)
              objc_enumerationMutation(v22);
            v27 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * n);
            if ((objc_msgSend(v21, "containsObject:", v27) & 1) == 0)
            {
              -[NSMutableSet anyObject](self->_inactiveTouchInfoSet, "anyObject");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = v28;
              if (v28)
              {
                objc_msgSend(v28, "setTouch:", v27);
                objc_msgSend(v27, "locationInView:", self);
                objc_msgSend(v29, "setLocationInHUD:");
                -[NSMutableSet addObject:](self->_touchInfoSet, "addObject:", v29);
                -[NSMutableSet removeObject:](self->_inactiveTouchInfoSet, "removeObject:", v29);
                -[ChartHUDView alpha](self, "alpha");
                -[ChartHUDView setShowingTracking:withTouchInfo:animated:](self, "setShowingTracking:withTouchInfo:animated:", 1, v29, v30 != 0.0);
                self->_forceTouchUpdate = 1;
              }

            }
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
        }
        while (v24);
      }

      -[ChartHUDView setNeedsLayout](self, "setNeedsLayout");
      WeakRetained = v43;
LABEL_48:

      break;
    case 1:
      -[ChartHUDView _showHUD](self, "_showHUD");
      goto LABEL_5;
  }

}

- (StockChartView)chartView
{
  return (StockChartView *)objc_loadWeakRetained((id *)&self->_chartView);
}

- (void)setChartView:(id)a3
{
  objc_storeWeak((id *)&self->_chartView, a3);
}

- (StockGraphView)graphView
{
  return self->_graphView;
}

- (void)setGraphView:(id)a3
{
  objc_storeStrong((id *)&self->_graphView, a3);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)isOverlayHidden
{
  return self->_overlayHidden;
}

- (double)barHeight
{
  return self->_barHeight;
}

- (void)setBarHeight:(double)a3
{
  self->_barHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphView, 0);
  objc_destroyWeak((id *)&self->_chartView);
  objc_storeStrong((id *)&self->_tapDragGesture, 0);
  objc_storeStrong((id *)&self->_pricePopoverBar, 0);
  objc_storeStrong((id *)&self->_touchInfoSet, 0);
  objc_storeStrong((id *)&self->_inactiveTouchInfoSet, 0);
  objc_storeStrong((id *)&self->_rightDateLabel, 0);
  objc_storeStrong((id *)&self->_centeredLabel, 0);
  objc_storeStrong((id *)&self->_leftDateLabel, 0);
}

@end
