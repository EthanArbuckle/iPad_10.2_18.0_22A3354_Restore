@implementation WeekDayInitialsHeaderView

- (WeekDayInitialsHeaderView)initWithFrame:(CGRect)a3
{
  WeekDayInitialsHeaderView *v3;
  WeekDayInitialsHeaderView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WeekDayInitialsHeaderView;
  v3 = -[WeekDayInitialsHeaderView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[WeekDayInitialsHeaderView setOpaque:](v3, "setOpaque:", 0);
    -[WeekDayInitialsHeaderView setClearsContextBeforeDrawing:](v4, "setClearsContextBeforeDrawing:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WeekDayInitialsHeaderView layer](v4, "layer"));
    objc_msgSend(v5, "setValue:forKeyPath:", &__kCFBooleanTrue, CFSTR("separatedOptions.enableContext"));
    objc_msgSend(v5, "setNeedsDisplay");

  }
  return v4;
}

- (id)weekdayAbbreviations
{
  void *v2;
  void *v3;
  unsigned int v4;
  uint64_t v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localeIdentifier"));
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("ar"));

  if (v4)
    v5 = CUIKWeekdayAbbreviations();
  else
    v5 = CUIKWeekdayVeryShortAbbreviations();
  return (id)objc_claimAutoreleasedReturnValue(v5);
}

- (void)setUseCustomDayFrames:(BOOL)a3
{
  self->_useCustomDayFrames = a3;
  -[WeekDayInitialsHeaderView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)drawRect:(CGRect)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  void *i;
  void *v20;
  void *v21;
  int IsWeekend;
  void *v23;
  id v24;
  void *v25;
  id v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double MaxY;
  double v34;
  double v35;
  CGFloat Height;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id obj;
  uint64_t v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[3];
  _QWORD v53[3];
  _BYTE v54[128];
  CGRect v55;
  CGRect v56;

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[WeekDayInitialsHeaderView weekdayAbbreviations](self, "weekdayAbbreviations", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height));
  v4 = objc_msgSend((id)objc_opt_class(self), "dayInitialFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v6 = WeekendTextColor();
  v44 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeekDayInitialsHeaderView dayFrames](self, "dayFrames"));
  v8 = objc_msgSend(v5, "lineHeight");
  v10 = CalCeilToScreenScale(v8, v9);
  v46 = v5;
  objc_msgSend(v5, "descender");
  v12 = v11;
  v13 = -[WeekDayInitialsHeaderView dayInitialTextAlignment](self, "dayInitialTextAlignment");
  v43 = objc_alloc_init((Class)NSMutableParagraphStyle);
  v14 = CUIKZeroIndexedWeekStart(objc_msgSend(v43, "setAlignment:", v13));
  if ((CalTimeDirectionIsLeftToRight(v14, v15) & 1) != 0)
  {
    v16 = 1;
  }
  else
  {
    v14 = ((uint64_t)objc_msgSend(v7, "count") + v14 - 1) % 7;
    v16 = -1;
  }
  v42 = v16;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v7;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v17)
  {
    v18 = v17;
    v41 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v49 != v41)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectAtIndexedSubscript:", v14));
        IsWeekend = CUIKDayOfWeekIsWeekend(v14);
        v23 = v45;
        if (IsWeekend)
          v23 = v44;
        v52[0] = NSFontAttributeName;
        v52[1] = NSForegroundColorAttributeName;
        v53[0] = v46;
        v53[1] = v23;
        v52[2] = NSParagraphStyleAttributeName;
        v53[2] = v43;
        v24 = v23;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v53, v52, 3));
        v26 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v21, v25);
        objc_msgSend(v20, "CGRectValue");
        v28 = v27;
        v30 = v29;
        v32 = v31;

        -[WeekDayInitialsHeaderView bounds](self, "bounds");
        MaxY = CGRectGetMaxY(v55);
        -[WeekDayInitialsHeaderView bottomPadding](self, "bottomPadding");
        v35 = MaxY - v34 - v12;
        v56.origin.x = v28;
        v56.origin.y = v30;
        v56.size.width = v32;
        v56.size.height = v10;
        Height = CGRectGetHeight(v56);
        objc_msgSend(v26, "drawInRect:", v28, CalRoundToScreenScale(v37, v38, v35 - Height), v32, v10);
        v39 = v14 + v42;
        if (v14 + v42 < 0)
          v39 += (uint64_t)objc_msgSend(obj, "count");
        v14 = v39 % 7;

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v18);
  }

}

- (void)setDayFrames:(id)a3
{
  NSArray *v4;
  unint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  NSArray *dayFrames;
  id v18;

  v18 = a3;
  self->_useCustomDayFrames = 1;
  v4 = (NSArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v18, "count"));
  if (objc_msgSend(v18, "count"))
  {
    v5 = 0;
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", v5));
      objc_msgSend(v6, "CGRectValue");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;

      -[WeekDayInitialsHeaderView dayFrameRightInset](self, "dayFrameRightInset");
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v8, v10, v12 - v15, v14));
      -[NSArray addObject:](v4, "addObject:", v16);

      ++v5;
    }
    while (v5 < (unint64_t)objc_msgSend(v18, "count"));
  }
  dayFrames = self->_dayFrames;
  self->_dayFrames = v4;

  -[WeekDayInitialsHeaderView setNeedsDisplay](self, "setNeedsDisplay");
}

- (double)dayFrameRightInset
{
  return 0.0;
}

- (int64_t)dayInitialTextAlignment
{
  return 1;
}

- (id)dayFrames
{
  if (self->_useCustomDayFrames)
    return self->_dayFrames;
  else
    return (id)objc_claimAutoreleasedReturnValue(-[WeekDayInitialsHeaderView _automaticDayFrames](self, "_automaticDayFrames"));
}

- (double)bottomPadding
{
  return 7.0;
}

- (id)_automaticDayFrames
{
  id v3;
  void *v4;
  char *v5;
  double v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  __n128 v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  NSValue *v20;
  void *v21;

  v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WeekDayInitialsHeaderView weekdayAbbreviations](self, "weekdayAbbreviations"));
  v5 = (char *)objc_msgSend(v4, "count");

  -[WeekDayInitialsHeaderView bounds](self, "bounds");
  if (v5)
  {
    v7 = (v6 + -1.0) / (double)(unint64_t)v5;
    v8 = 0.5;
    do
    {
      v9 = -[WeekDayInitialsHeaderView bounds](self, "bounds");
      v11 = v10;
      v13 = v12;
      v15 = CalRoundToScreenScale(v9, v14, v8);
      v16.n128_f64[0] = v8;
      v17 = CalFloorToScreenScale(v16);
      v20 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v15, v11, CalRoundToScreenScale(v18, v19, v7 + v8 - v17), v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      objc_msgSend(v3, "addObject:", v21);

      v8 = v7 + v8;
      --v5;
    }
    while (v5);
  }
  return v3;
}

- (BOOL)useCustomDayFrames
{
  return self->_useCustomDayFrames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayFrames, 0);
}

+ (id)dayInitialFont
{
  uint64_t v4;

  v4 = objc_opt_class(a1);
  NSRequestConcreteImplementation(a1, a2, v4);
  return (id)UISystemFontForSize(10);
}

@end
