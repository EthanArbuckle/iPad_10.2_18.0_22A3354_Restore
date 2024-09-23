@implementation BCSemanticLayoutOptions

+ (id)current
{
  if (qword_30D6A0 != -1)
    dispatch_once(&qword_30D6A0, &stru_28DE38);
  return (id)qword_30D6A8;
}

+ (id)logger
{
  if (qword_30D6B8 != -1)
    dispatch_once(&qword_30D6B8, &stru_28DE58);
  return (id)qword_30D6B0;
}

- (void)reset
{
  -[BCSemanticLayoutOptions setValuesFromDictionary:](self, "setValuesFromDictionary:", &__NSDictionary0__struct);
  -[BCSemanticLayoutOptions save](self, "save");
}

- (void)save
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCSemanticLayoutOptions asJSON](self, "asJSON"));
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("kBKSemanticLayoutOptions_v3"));

}

+ (id)fromJSON:(id)a3
{
  id v4;
  BCSemanticLayoutOptions *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v17;

  v4 = a3;
  v5 = objc_opt_new(BCSemanticLayoutOptions);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataUsingEncoding:", 4));

  if (v6)
  {
    v17 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v6, 0, &v17));
    v8 = v17;
    if (v8)
    {

      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "logger"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        sub_1B4998((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);

      v7 = &__NSDictionary0__struct;
    }
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  -[BCSemanticLayoutOptions setValuesFromDictionary:](v5, "setValuesFromDictionary:", v7);

  return v5;
}

- (void)setValuesFromDictionary:(id)a3
{
  id v4;
  double v5;

  v4 = a3;
  -[BCSemanticLayoutOptions setFontScale:](self, "setFontScale:", sub_60D4C(v4, CFSTR("kBKSemanticLayoutOption_FontScale"), 16.0));
  -[BCSemanticLayoutOptions setSideInsetFactor:](self, "setSideInsetFactor:", sub_60D4C(v4, CFSTR("kBKSemanticLayoutOption_SideInsetFactor"), 0.085));
  -[BCSemanticLayoutOptions setMinCPLForSpreadPages:](self, "setMinCPLForSpreadPages:", sub_60D4C(v4, CFSTR("kBKSemanticLayoutOption_MinCPLForSpreadPages"), 90.0));
  -[BCSemanticLayoutOptions setContentInsetTopSmall:](self, "setContentInsetTopSmall:", sub_60D4C(v4, CFSTR("kBKSemanticLayoutOption_ContentInsetTopSmall"), 44.0));
  -[BCSemanticLayoutOptions setContentInsetTopMedium:](self, "setContentInsetTopMedium:", sub_60D4C(v4, CFSTR("kBKSemanticLayoutOption_ContentInsetTopMedium"), 60.0));
  -[BCSemanticLayoutOptions setContentInsetTopLarge:](self, "setContentInsetTopLarge:", sub_60D4C(v4, CFSTR("kBKSemanticLayoutOption_ContentInsetTopLarge"), 96.0));
  -[BCSemanticLayoutOptions setScrubberWidth:](self, "setScrubberWidth:", sub_60D4C(v4, CFSTR("kBKSemanticLayoutOption_ScrubberWidth"), 44.0));
  v5 = sub_60D4C(v4, CFSTR("kBKSemanticLayoutOption_ScrubberHeight"), 28.0);

  -[BCSemanticLayoutOptions setScrubberHeight:](self, "setScrubberHeight:", v5);
}

- (double)scrollerScrubberHeight
{
  return 16.0;
}

- (id)asJSON
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[8];
  _QWORD v26[8];

  v25[0] = CFSTR("kBKSemanticLayoutOption_FontScale");
  -[BCSemanticLayoutOptions fontScale](self, "fontScale");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v26[0] = v23;
  v25[1] = CFSTR("kBKSemanticLayoutOption_SideInsetFactor");
  -[BCSemanticLayoutOptions sideInsetFactor](self, "sideInsetFactor");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v26[1] = v22;
  v25[2] = CFSTR("kBKSemanticLayoutOption_MinCPLForSpreadPages");
  -[BCSemanticLayoutOptions minCPLForSpreadPages](self, "minCPLForSpreadPages");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v26[2] = v3;
  v25[3] = CFSTR("kBKSemanticLayoutOption_ContentInsetTopSmall");
  -[BCSemanticLayoutOptions contentInsetTopSmall](self, "contentInsetTopSmall");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v26[3] = v4;
  v25[4] = CFSTR("kBKSemanticLayoutOption_ContentInsetTopMedium");
  -[BCSemanticLayoutOptions contentInsetTopMedium](self, "contentInsetTopMedium");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v26[4] = v5;
  v25[5] = CFSTR("kBKSemanticLayoutOption_ContentInsetTopLarge");
  -[BCSemanticLayoutOptions contentInsetTopLarge](self, "contentInsetTopLarge");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v26[5] = v6;
  v25[6] = CFSTR("kBKSemanticLayoutOption_ScrubberWidth");
  -[BCSemanticLayoutOptions scrubberWidth](self, "scrubberWidth");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v26[6] = v7;
  v25[7] = CFSTR("kBKSemanticLayoutOption_ScrubberHeight");
  -[BCSemanticLayoutOptions scrubberHeight](self, "scrubberHeight");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v26[7] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 8));
  v24 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v9, 0, &v24));
  v11 = v24;

  if (objc_msgSend(v10, "length"))
  {
    v12 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v10, 4);
  }
  else
  {
    v13 = objc_msgSend((id)objc_opt_class(self), "logger");
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      sub_1B4998((uint64_t)v11, v14, v15, v16, v17, v18, v19, v20);

    v12 = 0;
  }

  return v12;
}

- (double)fontScale
{
  return self->_fontScale;
}

- (void)setFontScale:(double)a3
{
  self->_fontScale = a3;
}

- (double)sideInsetFactor
{
  return self->_sideInsetFactor;
}

- (void)setSideInsetFactor:(double)a3
{
  self->_sideInsetFactor = a3;
}

- (double)minCPLForSpreadPages
{
  return self->_minCPLForSpreadPages;
}

- (void)setMinCPLForSpreadPages:(double)a3
{
  self->_minCPLForSpreadPages = a3;
}

- (BOOL)pageLabelOnLeft
{
  return self->_pageLabelOnLeft;
}

- (void)setPageLabelOnLeft:(BOOL)a3
{
  self->_pageLabelOnLeft = a3;
}

- (double)scrubberWidth
{
  return self->_scrubberWidth;
}

- (void)setScrubberWidth:(double)a3
{
  self->_scrubberWidth = a3;
}

- (double)contentInsetTopSmall
{
  return self->_contentInsetTopSmall;
}

- (void)setContentInsetTopSmall:(double)a3
{
  self->_contentInsetTopSmall = a3;
}

- (double)contentInsetTopMedium
{
  return self->_contentInsetTopMedium;
}

- (void)setContentInsetTopMedium:(double)a3
{
  self->_contentInsetTopMedium = a3;
}

- (double)contentInsetTopLarge
{
  return self->_contentInsetTopLarge;
}

- (void)setContentInsetTopLarge:(double)a3
{
  self->_contentInsetTopLarge = a3;
}

- (double)scrubberHeight
{
  return self->_scrubberHeight;
}

- (void)setScrubberHeight:(double)a3
{
  self->_scrubberHeight = a3;
}

@end
