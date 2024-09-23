@implementation CompactMonthWeekDayOverlay

+ (id)_attributes
{
  if (qword_1001F61C0 != -1)
    dispatch_once(&qword_1001F61C0, &stru_1001B3308);
  return (id)qword_1001F61B8;
}

+ (id)_generateImageForString:(id)a3 isWeekend:(BOOL)a4 underlineThickness:(double)a5 fontSize:(double)a6 style:(int64_t)a7
{
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  _QWORD v34[4];
  id v35;
  id v36;
  double v37;
  double v38;
  double v39;

  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_attributes"));
  if (a4)
  {
    v13 = WeekendTextColor();
    v14 = objc_claimAutoreleasedReturnValue(v13);
  }
  else
  {
    v14 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  }
  v15 = (void *)v14;
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, NSForegroundColorAttributeName);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", NSFontAttributeName));
  objc_msgSend(v16, "pointSize");
  if (vabdd_f64(v17, a6) >= 2.22044605e-16)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", a6));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, NSFontAttributeName);

  }
  v19 = objc_msgSend(v11, "boundingRectWithSize:options:attributes:context:", 0, v12, 0, CGSizeZero.width, CGSizeZero.height);
  v21 = v20;
  v23 = CalCeilToScreenScale(v19, v22);
  v25 = CalCeilToScreenScale(v24, v21);
  v26 = a5 + 2.0;
  if (a5 <= 0.0)
    v26 = -0.0;
  v27 = v26 + v25;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIGraphicsImageRendererFormat defaultFormat](UIGraphicsImageRendererFormat, "defaultFormat"));
  v29 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:format:", v28, v23, v27);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100063ED4;
  v34[3] = &unk_1001B3330;
  v37 = v23;
  v38 = v25;
  v35 = v11;
  v36 = v12;
  v39 = a5;
  v30 = v12;
  v31 = v11;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "imageWithActions:", v34));

  return v32;
}

+ (id)_cachedImageForString:(id)a3 isWeekend:(BOOL)a4 underlineThickness:(double)a5 fontSize:(double)a6 style:(int64_t)a7
{
  _BOOL8 v10;
  id v12;
  const __CFString *v13;
  void *v14;
  void *v15;

  v10 = a4;
  v12 = a3;
  if (qword_1001F61D0 != -1)
    dispatch_once(&qword_1001F61D0, &stru_1001B3350);
  v13 = CFSTR("weekday");
  if (v10)
    v13 = CFSTR("weekend");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@:%f:%f:%tu"), v12, v13, *(_QWORD *)&a5, *(_QWORD *)&a6, a7));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001F61C8, "objectForKey:", v14));
  if (!v15)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_generateImageForString:isWeekend:underlineThickness:fontSize:style:", v12, v10, a7, a5, a6));
    objc_msgSend((id)qword_1001F61C8, "setObject:forKey:", v15, v14);
  }

  return v15;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
  -[CompactMonthWeekDayOverlay update](self, "update");
}

- (void)update
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  double v8;
  NSDate *date;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  id v36;
  _QWORD v37[5];
  id v38;
  uint64_t *v39;
  double v40;
  unsigned __int8 v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  if (self->_date)
  {
    v3 = CUIKGetOverlayCalendar(self, a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "components:fromDate:", 24, self->_date));

    v6 = objc_msgSend(v5, "day");
    v8 = 0.0;
    if (v6 == (id)1)
    {
      v6 = objc_msgSend(v5, "month");
      v8 = 1.0;
      if (v6 == (id)1)
      {
        v6 = objc_msgSend(v5, "isLeapMonth");
        if ((_DWORD)v6)
          v8 = 1.0;
        else
          v8 = 1.5;
      }
    }
    date = self->_date;
    v10 = CUIKGetOverlayCalendar(v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKDateStrings overlayShortStringForDate:inCalendar:](CUIKDateStrings, "overlayShortStringForDate:inCalendar:", date, v11));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayOverlay traitCollection](self, "traitCollection"));
    LODWORD(v11) = EKUIUsesLargeTextLayout(v13, v14);

    v16 = CUIKCalendar(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = objc_msgSend(v17, "isDateInWeekend:", self->_date);

    v42 = 0;
    v43 = &v42;
    v44 = 0x3032000000;
    v45 = sub_1000643B4;
    v46 = sub_1000643C4;
    v47 = 0;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayOverlay traitCollection](self, "traitCollection"));
    if ((_DWORD)v11)
      v8 = v8 + v8;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000643CC;
    v37[3] = &unk_1001B3378;
    v39 = &v42;
    v37[4] = self;
    v20 = v12;
    v38 = v20;
    v41 = v18;
    v40 = v8;
    objc_msgSend(v19, "performAsCurrentTraitCollection:", v37);

    v21 = objc_msgSend(objc_retainAutorelease((id)v43[5]), "CGImage");
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayOverlay layer](self, "layer"));
    objc_msgSend(v22, "setContents:", v21);

    -[CompactMonthWeekDayOverlay frame](self, "frame");
    v24 = v23;
    v26 = v25;
    objc_msgSend((id)v43[5], "size");
    if (v24 != v28 || v26 != v27)
    {
      -[CompactMonthWeekDayOverlay frame](self, "frame");
      v30 = v29;
      v32 = v31;
      objc_msgSend((id)v43[5], "size");
      -[CompactMonthWeekDayOverlay setFrame:](self, "setFrame:", v30, v32, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayOverlay superview](self, "superview"));
      objc_msgSend(v35, "setNeedsLayout");

    }
    _Block_object_dispose(&v42, 8);

  }
  else
  {
    v36 = (id)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayOverlay layer](self, "layer"));
    objc_msgSend(v36, "setContents:", 0);

  }
}

- (NSDate)date
{
  return self->_date;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
