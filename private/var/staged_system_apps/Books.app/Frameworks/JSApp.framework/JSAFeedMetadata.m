@implementation JSAFeedMetadata

- (JSAFeedMetadata)initWithDictionary:(id)a3
{
  id v4;
  JSAFeedMetadata *v5;
  JSAFeedMetadata *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  uint64_t v26;
  UIColor *navigationBarTintColor;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  uint64_t v32;
  UIColor *dayBackgroundColor;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  uint64_t v39;
  UIColor *nightBackgroundColor;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  NSString *v46;
  NSString *backTitle;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  NSString *v53;
  NSString *title;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  NSString *v60;
  NSString *trackerName;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  NSString *v67;
  NSString *accessibilitySummary;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  NSArray *v74;
  NSArray *messagePlacements;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  CGFloat v81;
  objc_super v83;

  v4 = a3;
  v83.receiver = self;
  v83.super_class = (Class)JSAFeedMetadata;
  v5 = -[JSAFeedMetadata init](&v83, "init");
  v6 = v5;
  if (v5)
  {
    v5->_navigationBarVisible = 1;
    v5->_navigationBarStyle = 0;
    v5->_navigationBarInitialBackgroundOpacity = 1.0;
    if (v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("navigationBarVisibility")));
      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("navigationBarVisibility")));
        v6->_navigationBarVisible = objc_msgSend(v8, "BOOLValue");

      }
      else
      {
        v6->_navigationBarVisible = 1;
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("showsVerticalScrollIndicator")));
      if (v10)
      {
        v11 = objc_opt_class(NSNumber, v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("showsVerticalScrollIndicator")));
        v13 = BUDynamicCast(v11, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        v6->_showsVerticalScrollIndicator = objc_msgSend(v14, "BOOLValue");

      }
      else
      {
        v6->_showsVerticalScrollIndicator = 1;
      }

      v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("navigationBarStyle")));
      if ((objc_msgSend(v15, "isEqualToString:", CFSTR("transparent")) & 1) != 0)
      {
        v16 = 2;
      }
      else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("small")) & 1) != 0)
      {
        v16 = 1;
      }
      else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("transparent-with-insets")) & 1) != 0)
      {
        v16 = 3;
      }
      else if (objc_msgSend(v15, "isEqualToString:", CFSTR("transparent-always")))
      {
        v16 = 4;
      }
      else
      {
        v16 = 0;
      }

      v6->_navigationBarStyle = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("navigationBarInitialBackgroundOpacity")));
      if (v17)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("navigationBarInitialBackgroundOpacity")));
        objc_msgSend(v18, "doubleValue");
        v6->_navigationBarInitialBackgroundOpacity = v19;

      }
      else
      {
        v6->_navigationBarInitialBackgroundOpacity = 1.0;
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("navigationBarTintOpacity")));
      v21 = 1.0;
      v22 = 1.0;
      if (v20)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("navigationBarTintOpacity")));
        objc_msgSend(v23, "doubleValue");
        v22 = v24;

      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("navigationBarTintColor")));
      v26 = objc_claimAutoreleasedReturnValue(+[UIColor jsa_colorWithHexString:alpha:](UIColor, "jsa_colorWithHexString:alpha:", v25, v22));
      navigationBarTintColor = v6->_navigationBarTintColor;
      v6->_navigationBarTintColor = (UIColor *)v26;

      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dayBackgroundOpacity")));
      if (v28)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dayBackgroundOpacity")));
        objc_msgSend(v29, "doubleValue");
        v21 = v30;

      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dayBackgroundColor")));
      v32 = objc_claimAutoreleasedReturnValue(+[UIColor jsa_colorWithHexString:alpha:](UIColor, "jsa_colorWithHexString:alpha:", v31, v21));
      dayBackgroundColor = v6->_dayBackgroundColor;
      v6->_dayBackgroundColor = (UIColor *)v32;

      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nightBackgroundOpacity")));
      if (v34)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nightBackgroundOpacity")));
        objc_msgSend(v35, "doubleValue");
        v37 = v36;

      }
      else
      {
        v37 = 1.0;
      }

      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nightBackgroundColor")));
      v39 = objc_claimAutoreleasedReturnValue(+[UIColor jsa_colorWithHexString:alpha:](UIColor, "jsa_colorWithHexString:alpha:", v38, v37));
      nightBackgroundColor = v6->_nightBackgroundColor;
      v6->_nightBackgroundColor = (UIColor *)v39;

      v42 = objc_opt_class(NSString, v41);
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backTitle")));
      v44 = BUDynamicCast(v42, v43);
      v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
      v46 = (NSString *)objc_msgSend(v45, "copy");
      backTitle = v6->_backTitle;
      v6->_backTitle = v46;

      v49 = objc_opt_class(NSString, v48);
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title")));
      v51 = BUDynamicCast(v49, v50);
      v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
      v53 = (NSString *)objc_msgSend(v52, "copy");
      title = v6->_title;
      v6->_title = v53;

      v56 = objc_opt_class(NSString, v55);
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trackerName")));
      v58 = BUDynamicCast(v56, v57);
      v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
      v60 = (NSString *)objc_msgSend(v59, "copy");
      trackerName = v6->_trackerName;
      v6->_trackerName = v60;

      v63 = objc_opt_class(NSString, v62);
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accessibilitySummary")));
      v65 = BUDynamicCast(v63, v64);
      v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
      v67 = (NSString *)objc_msgSend(v66, "copy");
      accessibilitySummary = v6->_accessibilitySummary;
      v6->_accessibilitySummary = v67;

      v70 = objc_opt_class(NSArray, v69);
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("messagePlacements")));
      v72 = BUDynamicCast(v70, v71);
      v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
      v74 = (NSArray *)objc_msgSend(v73, "copy");
      messagePlacements = v6->_messagePlacements;
      v6->_messagePlacements = v74;

      v77 = objc_opt_class(NSNumber, v76);
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("navigationBarHorizontalLayoutInset")));
      v79 = BUDynamicCast(v77, v78);
      v80 = (void *)objc_claimAutoreleasedReturnValue(v79);

      if (v80)
      {
        objc_msgSend(v80, "doubleValue");
        v6->_navigationBarLayoutInsets.top = 0.0;
        v6->_navigationBarLayoutInsets.left = v81;
        v6->_navigationBarLayoutInsets.bottom = 0.0;
        v6->_navigationBarLayoutInsets.right = v81;
      }

    }
  }

  return v6;
}

- (JSAFeedMetadata)init
{
  JSAFeedMetadata *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)JSAFeedMetadata;
  result = -[JSAFeedMetadata init](&v3, "init");
  if (result)
  {
    result->_navigationBarVisible = 1;
    result->_navigationBarStyle = 0;
    result->_navigationBarInitialBackgroundOpacity = 1.0;
  }
  return result;
}

+ (id)metadataDictionary:(id)a3 variationWithNavigationBarStyle:(unint64_t)a4
{
  id v5;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  id v9;

  v5 = a3;
  v6 = v5;
  if (v5)
    v7 = (NSMutableDictionary *)objc_msgSend(v5, "mutableCopy");
  else
    v7 = objc_opt_new(NSMutableDictionary);
  v8 = v7;
  if (a4 <= 4)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", off_9E1D8[a4], CFSTR("navigationBarStyle"));
  v9 = -[NSMutableDictionary copy](v8, "copy");

  return v9;
}

+ (id)metadataDictionary:(id)a3 variationWithNavigationBarVisibile:(BOOL)a4
{
  _BOOL8 v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  void *v7;
  id v8;

  v4 = a4;
  if (a3)
    v5 = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
  else
    v5 = objc_opt_new(NSMutableDictionary);
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v7, CFSTR("navigationBarVisibility"));

  v8 = -[NSMutableDictionary copy](v6, "copy");
  return v8;
}

- (BOOL)navigationBarVisible
{
  return self->_navigationBarVisible;
}

- (BOOL)showsVerticalScrollIndicator
{
  return self->_showsVerticalScrollIndicator;
}

- (unint64_t)navigationBarStyle
{
  return self->_navigationBarStyle;
}

- (double)navigationBarInitialBackgroundOpacity
{
  return self->_navigationBarInitialBackgroundOpacity;
}

- (UIColor)navigationBarTintColor
{
  return self->_navigationBarTintColor;
}

- (UIColor)dayBackgroundColor
{
  return self->_dayBackgroundColor;
}

- (UIColor)nightBackgroundColor
{
  return self->_nightBackgroundColor;
}

- (NSString)backTitle
{
  return self->_backTitle;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)trackerName
{
  return self->_trackerName;
}

- (UIEdgeInsets)navigationBarLayoutInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_navigationBarLayoutInsets.top;
  left = self->_navigationBarLayoutInsets.left;
  bottom = self->_navigationBarLayoutInsets.bottom;
  right = self->_navigationBarLayoutInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (NSArray)messagePlacements
{
  return self->_messagePlacements;
}

- (NSString)accessibilitySummary
{
  return self->_accessibilitySummary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilitySummary, 0);
  objc_storeStrong((id *)&self->_messagePlacements, 0);
  objc_storeStrong((id *)&self->_trackerName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_backTitle, 0);
  objc_storeStrong((id *)&self->_nightBackgroundColor, 0);
  objc_storeStrong((id *)&self->_dayBackgroundColor, 0);
  objc_storeStrong((id *)&self->_navigationBarTintColor, 0);
}

@end
