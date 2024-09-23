@implementation BKPageCurl

- (BKPageCurl)init
{
  BKPageCurl *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKPageCurl;
  result = -[BKPageCurl init](&v3, "init");
  if (result)
    result->_duration = 0.3;
  return result;
}

- (BOOL)forwardCurl
{
  return (self->_type & 0xFFFFFFFD) == 0;
}

- (CABasicAnimation)curlAnimationTime
{
  CABasicAnimation *curlAnimationTime;
  CABasicAnimation *v4;
  CABasicAnimation *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;

  curlAnimationTime = self->_curlAnimationTime;
  if (!curlAnimationTime)
  {
    v4 = (CABasicAnimation *)objc_alloc_init((Class)CABasicAnimation);
    v5 = self->_curlAnimationTime;
    self->_curlAnimationTime = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithControlPoints:](CAMediaTimingFunction, "functionWithControlPoints:", &kCurlSmoothControlPoints));
    -[CABasicAnimation setTimingFunction:](self->_curlAnimationTime, "setTimingFunction:", v6);

    -[CABasicAnimation setKeyPath:](self->_curlAnimationTime, "setKeyPath:", CFSTR("filters.curl.inputTime"));
    -[BKPageCurl duration](self, "duration");
    -[CABasicAnimation setDuration:](self->_curlAnimationTime, "setDuration:");
    -[CABasicAnimation setFillMode:](self->_curlAnimationTime, "setFillMode:", kCAFillModeBoth);
    -[CABasicAnimation setRemovedOnCompletion:](self->_curlAnimationTime, "setRemovedOnCompletion:", 0);
    -[CABasicAnimation setDelegate:](self->_curlAnimationTime, "setDelegate:", self);
    LODWORD(v7) = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7));
    -[CABasicAnimation setFromValue:](self->_curlAnimationTime, "setFromValue:", v8);

    LODWORD(v9) = 1.0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v9));
    -[CABasicAnimation setToValue:](self->_curlAnimationTime, "setToValue:", v10);

    curlAnimationTime = self->_curlAnimationTime;
  }
  return curlAnimationTime;
}

- (CABasicAnimation)uncurlAnimationTime
{
  CABasicAnimation *uncurlAnimationTime;
  void *v4;
  CABasicAnimation *v5;
  CABasicAnimation *v6;

  uncurlAnimationTime = self->_uncurlAnimationTime;
  if (!uncurlAnimationTime)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlAnimationTime](self, "curlAnimationTime"));
    v5 = (CABasicAnimation *)objc_msgSend(v4, "copy");
    v6 = self->_uncurlAnimationTime;
    self->_uncurlAnimationTime = v5;

    -[CABasicAnimation ae_reverseValues](self->_uncurlAnimationTime, "ae_reverseValues");
    uncurlAnimationTime = self->_uncurlAnimationTime;
  }
  return uncurlAnimationTime;
}

- (CABasicAnimation)curlAnimationRadius
{
  CABasicAnimation *curlAnimationRadius;
  CABasicAnimation *v4;
  CABasicAnimation *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  double v9;
  void *v10;
  void *v11;
  unsigned int v12;
  double v13;
  void *v14;

  curlAnimationRadius = self->_curlAnimationRadius;
  if (!curlAnimationRadius)
  {
    v4 = (CABasicAnimation *)objc_alloc_init((Class)CABasicAnimation);
    v5 = self->_curlAnimationRadius;
    self->_curlAnimationRadius = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithControlPoints:](CAMediaTimingFunction, "functionWithControlPoints:", &kCurlSmoothControlPoints));
    -[CABasicAnimation setTimingFunction:](self->_curlAnimationRadius, "setTimingFunction:", v6);

    -[CABasicAnimation setKeyPath:](self->_curlAnimationRadius, "setKeyPath:", CFSTR("filters.curl.inputRadius"));
    -[BKPageCurl duration](self, "duration");
    -[CABasicAnimation setDuration:](self->_curlAnimationRadius, "setDuration:");
    -[CABasicAnimation setFillMode:](self->_curlAnimationRadius, "setFillMode:", kCAFillModeBoth);
    -[CABasicAnimation setRemovedOnCompletion:](self->_curlAnimationRadius, "setRemovedOnCompletion:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl container](self, "container"));
    v8 = objc_msgSend(v7, "im_isCompactWidth");
    LODWORD(v9) = 1125515264;
    if (v8)
      *(float *)&v9 = 40.0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v9));
    -[CABasicAnimation setFromValue:](self->_curlAnimationRadius, "setFromValue:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl container](self, "container"));
    v12 = objc_msgSend(v11, "im_isCompactWidth");
    LODWORD(v13) = 1120403456;
    if (v12)
      *(float *)&v13 = 300.0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v13));
    -[CABasicAnimation setToValue:](self->_curlAnimationRadius, "setToValue:", v14);

    curlAnimationRadius = self->_curlAnimationRadius;
  }
  return curlAnimationRadius;
}

- (CABasicAnimation)uncurlAnimationRadius
{
  CABasicAnimation *uncurlAnimationRadius;
  void *v4;
  CABasicAnimation *v5;
  CABasicAnimation *v6;

  uncurlAnimationRadius = self->_uncurlAnimationRadius;
  if (!uncurlAnimationRadius)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlAnimationRadius](self, "curlAnimationRadius"));
    v5 = (CABasicAnimation *)objc_msgSend(v4, "copy");
    v6 = self->_uncurlAnimationRadius;
    self->_uncurlAnimationRadius = v5;

    -[CABasicAnimation ae_reverseValues](self->_uncurlAnimationRadius, "ae_reverseValues");
    uncurlAnimationRadius = self->_uncurlAnimationRadius;
  }
  return uncurlAnimationRadius;
}

- (CABasicAnimation)curlAnimationAngle
{
  CABasicAnimation *v3;
  CABasicAnimation *curlAnimationAngle;
  void *v5;
  unint64_t v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;

  if (!self->_curlAnimationAngle)
  {
    v3 = (CABasicAnimation *)objc_alloc_init((Class)CABasicAnimation);
    curlAnimationAngle = self->_curlAnimationAngle;
    self->_curlAnimationAngle = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithControlPoints:](CAMediaTimingFunction, "functionWithControlPoints:", &kCurlEaseOutControlPoints));
    -[CABasicAnimation setTimingFunction:](self->_curlAnimationAngle, "setTimingFunction:", v5);

    -[CABasicAnimation setKeyPath:](self->_curlAnimationAngle, "setKeyPath:", CFSTR("filters.curl.inputAngle"));
    -[BKPageCurl duration](self, "duration");
    -[CABasicAnimation setDuration:](self->_curlAnimationAngle, "setDuration:");
    -[CABasicAnimation setFillMode:](self->_curlAnimationAngle, "setFillMode:", kCAFillModeBoth);
    -[CABasicAnimation setRemovedOnCompletion:](self->_curlAnimationAngle, "setRemovedOnCompletion:", 0);
    v6 = -[BKPageCurl spineLocation](self, "spineLocation");
    if (v6 < 3)
    {
      LODWORD(v7) = 1079994099;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7));
      -[CABasicAnimation setFromValue:](self->_curlAnimationAngle, "setFromValue:", v8);

      v9 = self->_stabilization + 3.14159265;
LABEL_6:
      *(float *)&v9 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v9));
      -[CABasicAnimation setToValue:](self->_curlAnimationAngle, "setToValue:", v11);

      return self->_curlAnimationAngle;
    }
    if (v6 == 3)
    {
      LODWORD(v7) = -1095583550;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7));
      -[CABasicAnimation setFromValue:](self->_curlAnimationAngle, "setFromValue:", v10);

      v9 = 0.0 - self->_stabilization;
      goto LABEL_6;
    }
  }
  return self->_curlAnimationAngle;
}

- (CABasicAnimation)uncurlAnimationAngle
{
  CABasicAnimation *uncurlAnimationAngle;
  void *v4;
  CABasicAnimation *v5;
  CABasicAnimation *v6;
  void *v7;

  uncurlAnimationAngle = self->_uncurlAnimationAngle;
  if (!uncurlAnimationAngle)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlAnimationAngle](self, "curlAnimationAngle"));
    v5 = (CABasicAnimation *)objc_msgSend(v4, "copy");
    v6 = self->_uncurlAnimationAngle;
    self->_uncurlAnimationAngle = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithControlPoints:](CAMediaTimingFunction, "functionWithControlPoints:", &kCurlEaseInControlPoints));
    -[CABasicAnimation setTimingFunction:](self->_uncurlAnimationAngle, "setTimingFunction:", v7);

    -[CABasicAnimation ae_reverseValues](self->_uncurlAnimationAngle, "ae_reverseValues");
    uncurlAnimationAngle = self->_uncurlAnimationAngle;
  }
  return uncurlAnimationAngle;
}

- (CABasicAnimation)curlAnimationShadowColor
{
  CABasicAnimation *v3;
  CABasicAnimation *curlAnimationShadowColor;
  void *v5;
  id v6;
  double v7;
  double v8;
  id v9;
  _OWORD v11[2];

  if (!self->_curlAnimationShadowColor)
  {
    v3 = (CABasicAnimation *)objc_alloc_init((Class)CABasicAnimation);
    curlAnimationShadowColor = self->_curlAnimationShadowColor;
    self->_curlAnimationShadowColor = v3;

    v11[0] = xmmword_172F88;
    v11[1] = unk_172F98;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithControlPoints:](CAMediaTimingFunction, "functionWithControlPoints:", v11));
    -[CABasicAnimation setTimingFunction:](self->_curlAnimationShadowColor, "setTimingFunction:", v5);

    -[CABasicAnimation setKeyPath:](self->_curlAnimationShadowColor, "setKeyPath:", CFSTR("filters.curl.inputShadowColor"));
    -[BKPageCurl duration](self, "duration");
    -[CABasicAnimation setDuration:](self->_curlAnimationShadowColor, "setDuration:");
    -[CABasicAnimation setFillMode:](self->_curlAnimationShadowColor, "setFillMode:", kCAFillModeBoth);
    -[CABasicAnimation setRemovedOnCompletion:](self->_curlAnimationShadowColor, "setRemovedOnCompletion:", 0);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.0)));
    -[CABasicAnimation setToValue:](self->_curlAnimationShadowColor, "setToValue:", objc_msgSend(v6, "CGColor"));

    if (-[BKPageCurl nightMode](self, "nightMode"))
      v7 = 0.7;
    else
      v7 = 0.25;
    if (!-[BKPageCurl nightMode](self, "nightMode")
      || (v8 = 0.5, -[BKPageCurl type](self, "type")) && -[BKPageCurl type](self, "type") != 1)
    {
      v8 = 0.0;
    }
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v8, v7)));
    -[CABasicAnimation setFromValue:](self->_curlAnimationShadowColor, "setFromValue:", objc_msgSend(v9, "CGColor"));

  }
  return self->_curlAnimationShadowColor;
}

- (CABasicAnimation)uncurlAnimationShadowColor
{
  CABasicAnimation *uncurlAnimationShadowColor;
  void *v4;
  CABasicAnimation *v5;
  CABasicAnimation *v6;
  void *v7;
  _OWORD v9[2];

  uncurlAnimationShadowColor = self->_uncurlAnimationShadowColor;
  if (!uncurlAnimationShadowColor)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlAnimationShadowColor](self, "curlAnimationShadowColor"));
    v5 = (CABasicAnimation *)objc_msgSend(v4, "copy");
    v6 = self->_uncurlAnimationShadowColor;
    self->_uncurlAnimationShadowColor = v5;

    v9[0] = xmmword_172F68;
    v9[1] = unk_172F78;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithControlPoints:](CAMediaTimingFunction, "functionWithControlPoints:", v9));
    -[CABasicAnimation setTimingFunction:](self->_uncurlAnimationShadowColor, "setTimingFunction:", v7);

    -[CABasicAnimation ae_reverseValues](self->_uncurlAnimationShadowColor, "ae_reverseValues");
    uncurlAnimationShadowColor = self->_uncurlAnimationShadowColor;
  }
  return uncurlAnimationShadowColor;
}

- (CABasicAnimation)curlAnimationBackColor0
{
  CABasicAnimation *curlAnimationBackColor0;
  CABasicAnimation *v4;
  CABasicAnimation *v5;
  void *v6;
  id v7;
  id v8;
  _OWORD v10[2];

  curlAnimationBackColor0 = self->_curlAnimationBackColor0;
  if (!curlAnimationBackColor0)
  {
    v4 = (CABasicAnimation *)objc_alloc_init((Class)CABasicAnimation);
    v5 = self->_curlAnimationBackColor0;
    self->_curlAnimationBackColor0 = v4;

    v10[0] = xmmword_172F88;
    v10[1] = unk_172F98;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithControlPoints:](CAMediaTimingFunction, "functionWithControlPoints:", v10));
    -[CABasicAnimation setTimingFunction:](self->_curlAnimationBackColor0, "setTimingFunction:", v6);

    -[CABasicAnimation setKeyPath:](self->_curlAnimationBackColor0, "setKeyPath:", CFSTR("filters.curl.inputBackColor0"));
    -[BKPageCurl duration](self, "duration");
    -[CABasicAnimation setDuration:](self->_curlAnimationBackColor0, "setDuration:");
    -[CABasicAnimation setFillMode:](self->_curlAnimationBackColor0, "setFillMode:", kCAFillModeBoth);
    -[CABasicAnimation setRemovedOnCompletion:](self->_curlAnimationBackColor0, "setRemovedOnCompletion:", 0);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BKPageCurl _backColor0AtPosition:](self, "_backColor0AtPosition:", 0.0)));
    -[CABasicAnimation setFromValue:](self->_curlAnimationBackColor0, "setFromValue:", objc_msgSend(v7, "CGColor"));

    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BKPageCurl _backColor0AtPosition:](self, "_backColor0AtPosition:", 1.0)));
    -[CABasicAnimation setToValue:](self->_curlAnimationBackColor0, "setToValue:", objc_msgSend(v8, "CGColor"));

    curlAnimationBackColor0 = self->_curlAnimationBackColor0;
  }
  return curlAnimationBackColor0;
}

- (CABasicAnimation)curlAnimationBackColor1
{
  CABasicAnimation *curlAnimationBackColor1;
  CABasicAnimation *v4;
  CABasicAnimation *v5;
  void *v6;
  id v7;
  id v8;
  _OWORD v10[2];

  curlAnimationBackColor1 = self->_curlAnimationBackColor1;
  if (!curlAnimationBackColor1)
  {
    v4 = (CABasicAnimation *)objc_alloc_init((Class)CABasicAnimation);
    v5 = self->_curlAnimationBackColor1;
    self->_curlAnimationBackColor1 = v4;

    v10[0] = xmmword_172F88;
    v10[1] = unk_172F98;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithControlPoints:](CAMediaTimingFunction, "functionWithControlPoints:", v10));
    -[CABasicAnimation setTimingFunction:](self->_curlAnimationBackColor1, "setTimingFunction:", v6);

    -[CABasicAnimation setKeyPath:](self->_curlAnimationBackColor1, "setKeyPath:", CFSTR("filters.curl.inputBackColor1"));
    -[BKPageCurl duration](self, "duration");
    -[CABasicAnimation setDuration:](self->_curlAnimationBackColor1, "setDuration:");
    -[CABasicAnimation setFillMode:](self->_curlAnimationBackColor1, "setFillMode:", kCAFillModeBoth);
    -[CABasicAnimation setRemovedOnCompletion:](self->_curlAnimationBackColor1, "setRemovedOnCompletion:", 0);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BKPageCurl _backColor1AtPosition:](self, "_backColor1AtPosition:", 0.0)));
    -[CABasicAnimation setFromValue:](self->_curlAnimationBackColor1, "setFromValue:", objc_msgSend(v7, "CGColor"));

    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BKPageCurl _backColor1AtPosition:](self, "_backColor1AtPosition:", 1.0)));
    -[CABasicAnimation setToValue:](self->_curlAnimationBackColor1, "setToValue:", objc_msgSend(v8, "CGColor"));

    curlAnimationBackColor1 = self->_curlAnimationBackColor1;
  }
  return curlAnimationBackColor1;
}

- (BOOL)isGoingToNextPage
{
  return !-[BKPageCurl type](self, "type") || -[BKPageCurl type](self, "type") == 2;
}

- (void)ensureCurlFilterOnLayer:(id)a3
{
  id v4;
  id v5;
  CAFilter *v6;
  CAFilter *curlFilter;
  CAFilter *v8;
  id v9;
  double v10;
  unsigned int v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  CAFilter *v16;
  id v17;
  CAFilter *v18;
  id v19;
  CAFilter *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;

  v4 = a3;
  if (!self->_curlFilter)
  {
    v5 = objc_alloc((Class)CAFilter);
    v6 = (CAFilter *)objc_msgSend(v5, "initWithType:", kCAFilterPageCurl);
    curlFilter = self->_curlFilter;
    self->_curlFilter = v6;

    -[CAFilter setName:](self->_curlFilter, "setName:", CFSTR("curl"));
    v8 = self->_curlFilter;
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor")));
    -[CAFilter setValue:forKeyPath:](v8, "setValue:forKeyPath:", objc_msgSend(v9, "CGColor"), CFSTR("inputFrontColor"));

    if (-[BKPageCurl nightMode](self, "nightMode"))
      v10 = 0.7;
    else
      v10 = 0.25;
    v11 = -[BKPageCurl nightMode](self, "nightMode");
    v12 = 0.15;
    if (v11)
      v12 = 0.0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v12, v10));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl _backColor0AtPosition:](self, "_backColor0AtPosition:", 0.0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl _backColor1AtPosition:](self, "_backColor1AtPosition:", 0.0));
    v16 = self->_curlFilter;
    v17 = objc_retainAutorelease(v14);
    -[CAFilter setValue:forKeyPath:](v16, "setValue:forKeyPath:", objc_msgSend(v17, "CGColor"), CFSTR("inputBackColor0"));
    v18 = self->_curlFilter;
    v19 = objc_retainAutorelease(v15);
    -[CAFilter setValue:forKeyPath:](v18, "setValue:forKeyPath:", objc_msgSend(v19, "CGColor"), CFSTR("inputBackColor1"));
    v20 = self->_curlFilter;
    v21 = objc_retainAutorelease(v13);
    -[CAFilter setValue:forKeyPath:](v20, "setValue:forKeyPath:", objc_msgSend(v21, "CGColor"), CFSTR("inputShadowColor"));

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filters"));
  v23 = objc_msgSend(v22, "count");

  if (!v23)
  {
    v24 = -[CAFilter copy](self->_curlFilter, "copy");
    v26 = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
    objc_msgSend(v4, "setFilters:", v25);

  }
}

- (void)_setupViews
{
  int64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = -[BKPageCurl spineLocation](self, "spineLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl backPage](self, "backPage"));
  if (!-[BKPageCurl type](self, "type"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl existingPages](self, "existingPages"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
    goto LABEL_5;
  }
  if (v3 == 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl existingPages](self, "existingPages"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", 0));
LABEL_5:
    v7 = (void *)v6;

    v8 = v4;
    v4 = v7;
    goto LABEL_7;
  }
  v8 = 0;
LABEL_7:
  v18 = v3;
  v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
  objc_msgSend(v9, "addObject:", v4);
  if (v8)
    objc_msgSend(v9, "addObject:", v8);
  -[BKPageCurl setCurlPages:](self, "setCurlPages:", v9);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl existingPages](self, "existingPages"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl container](self, "container"));
        objc_msgSend(v16, "insertSubview:atIndex:", v15, 0);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  if (-[BKPageCurl type](self, "type") == 1 && v18 != 2)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl container](self, "container"));
    objc_msgSend(v17, "addSubview:", v4);

  }
}

- (id)_backColor0AtPosition:(double)a3
{
  int64_t v5;
  double v6;
  double v7;
  unsigned int v8;
  void *v9;
  void *v10;

  v5 = -[BKPageCurl spineLocation](self, "spineLocation");
  if (-[BKPageCurl nightMode](self, "nightMode"))
  {
    if (v5 == 2)
    {
      v6 = 0.125;
      v7 = 0.65;
      if (a3 > 0.75)
        v6 = (1.0 - a3) * 4.0 * 0.125;
    }
    else
    {
      v8 = -[BKPageCurl type](self, "type");
      if (v8 && -[BKPageCurl type](self, "type") != 1)
      {
        v6 = 0.6;
        v7 = 0.15;
      }
      else
      {
        v6 = 0.425;
        v7 = 0.4;
      }
    }
    goto LABEL_13;
  }
  if (v5 == 2)
  {
    v7 = 1.0;
    v6 = 0.0;
LABEL_13:
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v7, v6));
    return v10;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl pageColor](self, "pageColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorWithAlphaComponent:", 0.8));

  return v10;
}

- (id)_backColor1AtPosition:(double)a3
{
  double v4;
  void *v5;
  void *v6;

  if (-[BKPageCurl nightMode](self, "nightMode", a3))
    v4 = 0.7;
  else
    v4 = 0.55;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl backColor](self, "backColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorWithAlphaComponent:", v4));

  return v6;
}

- (void)startAutoCurl
{
  double v3;

  -[BKPageCurl _setupViews](self, "_setupViews");
  -[BKPageCurl delay](self, "delay");
  if (v3 == 0.0)
  {
    -[BKPageCurl _beginAnimation](self, "_beginAnimation");
  }
  else
  {
    -[BKPageCurl delay](self, "delay");
    -[BKPageCurl performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_beginAnimation", 0);
  }
}

- (void)_beginAnimation
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *j;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *k;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id obj;
  id obja;
  uint64_t v71;
  uint64_t v72;
  BKPageCurl *v73;
  unsigned int v74;
  void *v75;
  id v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  CATransform3D v86;
  CATransform3D v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];

  v3 = -[BKPageCurl spineLocation](self, "spineLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlPages](self, "curlPages"));
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlPages](self, "curlPages"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", 0));

  }
  else
  {
    v6 = 0;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlPages](self, "curlPages"));
  if ((unint64_t)objc_msgSend(v7, "count") < 2)
  {
    v9 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlPages](self, "curlPages"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", 1));

  }
  v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
  if (v6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
    objc_msgSend(v10, "addObject:", v11);

  }
  if (v9 && v9 != v6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));
    objc_msgSend(v10, "addObject:", v12);

  }
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v88, v94, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v89;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v89 != v16)
          objc_enumerationMutation(v13);
        -[BKPageCurl ensureCurlFilterOnLayer:](self, "ensureCurlFilterOnLayer:", *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * (_QWORD)i));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v88, v94, 16);
    }
    while (v15);
  }

  v73 = self;
  v68 = v6;
  if (-[BKPageCurl type](self, "type") != 1 || v3 == 2)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlAnimationTime](self, "curlAnimationTime", v9));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlAnimationRadius](self, "curlAnimationRadius"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlAnimationAngle](self, "curlAnimationAngle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlAnimationShadowColor](self, "curlAnimationShadowColor"));
    if (-[BKPageCurl nightMode](self, "nightMode"))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlAnimationBackColor0](self, "curlAnimationBackColor0"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlAnimationBackColor1](self, "curlAnimationBackColor1"));
    }
    else
    {
      v23 = 0;
      v22 = 0;
    }
    if (v3 == 2)
    {
      v74 = -[BKPageCurl type](v73, "type");
      LODWORD(v24) = 1125515264;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v24));
      objc_msgSend(v19, "setFromValue:", v25);

      LODWORD(v26) = 1.0;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v26));
      objc_msgSend(v19, "setToValue:", v27);

      if (v74)
      {
        LODWORD(v28) = -1095583550;
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v28));
        objc_msgSend(v20, "setFromValue:", v29);

        v30 = 0.0 - v73->_stabilization;
        *(float *)&v30 = v30;
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v30));
        objc_msgSend(v20, "setToValue:", v31);

      }
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl container](v73, "container"));
      objc_msgSend(v32, "insertSubview:atIndex:", v68, 1);

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl container](v73, "container"));
      objc_msgSend(v33, "addSubview:", v67);

      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "layer"));
      CATransform3DMakeScale(&v87, -1.0, 1.0, 1.0);
      v86 = v87;
      objc_msgSend(v34, "setSublayerTransform:", &v86);
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "layer"));
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "valueForKeyPath:", CFSTR("filters.curl")));

      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
      objc_msgSend(v75, "setValue:forKey:", v36, CFSTR("inputBackEnabled"));

      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "valueForKeyPath:", CFSTR("filters.curl")));
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
      objc_msgSend(v37, "setValue:forKey:", v38, CFSTR("inputFrontEnabled"));

    }
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl uncurlAnimationTime](self, "uncurlAnimationTime", v9));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl uncurlAnimationRadius](self, "uncurlAnimationRadius"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl uncurlAnimationAngle](self, "uncurlAnimationAngle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl uncurlAnimationShadowColor](self, "uncurlAnimationShadowColor"));
    v22 = 0;
    v23 = 0;
  }
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  obj = v13;
  v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v93, 16);
  if (v76)
  {
    v71 = *(_QWORD *)v83;
    do
    {
      for (j = 0; j != v76; j = (char *)j + 1)
      {
        if (*(_QWORD *)v83 != v71)
          objc_enumerationMutation(obj);
        v40 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)j);
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "fromValue"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "keyPath"));
        objc_msgSend(v40, "setValue:forKeyPath:", v41, v42);

        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "fromValue"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "keyPath"));
        objc_msgSend(v40, "setValue:forKeyPath:", v43, v44);

        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "fromValue"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "keyPath"));
        objc_msgSend(v40, "setValue:forKeyPath:", v45, v46);

        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "fromValue"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "keyPath"));
        objc_msgSend(v40, "setValue:forKeyPath:", v47, v48);

        if (v23)
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "fromValue"));
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "keyPath"));
          objc_msgSend(v40, "setValue:forKeyPath:", v49, v50);

        }
        if (v22)
        {
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "fromValue"));
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "keyPath"));
          objc_msgSend(v40, "setValue:forKeyPath:", v51, v52);

        }
      }
      v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v93, 16);
    }
    while (v76);
  }

  +[CATransaction begin](CATransaction, "begin");
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  obja = obj;
  v77 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v78, v92, 16);
  if (v77)
  {
    v72 = *(_QWORD *)v79;
    do
    {
      for (k = 0; k != v77; k = (char *)k + 1)
      {
        if (*(_QWORD *)v79 != v72)
          objc_enumerationMutation(obja);
        v54 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)k);
        ++v73->_didEndCount;
        objc_msgSend(v54, "addAnimation:forKey:", v18, CFSTR("curlTime"));
        objc_msgSend(v54, "addAnimation:forKey:", v19, CFSTR("curlRadius"));
        objc_msgSend(v54, "addAnimation:forKey:", v20, CFSTR("curlAngle"));
        objc_msgSend(v54, "addAnimation:forKey:", v21, CFSTR("curlShadowColor"));
        if (v23)
          objc_msgSend(v54, "addAnimation:forKey:", v23, CFSTR("curlBackColor0"));
        if (v22)
          objc_msgSend(v54, "addAnimation:forKey:", v22, CFSTR("curlBackColor1"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "toValue"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "keyPath"));
        objc_msgSend(v54, "setValue:forKeyPath:", v55, v56);

        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "toValue"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "keyPath"));
        objc_msgSend(v54, "setValue:forKeyPath:", v57, v58);

        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "toValue"));
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "keyPath"));
        objc_msgSend(v54, "setValue:forKeyPath:", v59, v60);

        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "toValue"));
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "keyPath"));
        objc_msgSend(v54, "setValue:forKeyPath:", v61, v62);

        if (v23)
        {
          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "toValue"));
          v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "keyPath"));
          objc_msgSend(v54, "setValue:forKeyPath:", v63, v64);

        }
        if (v22)
        {
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "toValue"));
          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "keyPath"));
          objc_msgSend(v54, "setValue:forKeyPath:", v65, v66);

        }
      }
      v77 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v78, v92, 16);
    }
    while (v77);
  }

  +[CATransaction commit](CATransaction, "commit");
  v73->_state = 1;

}

- (void)beginManualCurlAtLocation:(CGPoint)a3
{
  double y;
  double x;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *j;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  CGFloat v39;
  CGFloat v40;
  long double width;
  long double height;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  void *k;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  uint64_t v77;
  void *m;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  char *v89;
  id v90;
  id obj;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  CATransform3D v100;
  CATransform3D v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  CGRect v114;
  CGRect v115;

  y = a3.y;
  x = a3.x;
  v6 = -[BKPageCurl spineLocation](self, "spineLocation");
  v7 = -[BKPageCurl spineLocation](self, "spineLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlPages](self, "curlPages"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));

  v10 = objc_claimAutoreleasedReturnValue(-[BKPageCurl backPage](self, "backPage"));
  v89 = (char *)v6;
  if (v6 == 2)
  {
    v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
    objc_msgSend(v11, "addObject:", v9);
    if (v10)
      objc_msgSend(v11, "addObject:", v10);
    -[BKPageCurl setCurlPages:](self, "setCurlPages:", v11);

  }
  v88 = (void *)v10;
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl existingPages](self, "existingPages"));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v106, v113, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v107;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v107 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl container](self, "container"));
        objc_msgSend(v18, "insertSubview:atIndex:", v17, 0);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v106, v113, 16);
    }
    while (v14);
  }

  if (v89 == (_BYTE *)&dword_0 + 2)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl container](self, "container"));
    objc_msgSend(v19, "insertSubview:atIndex:", v9, 1);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl container](self, "container"));
    v21 = v88;
    objc_msgSend(v20, "addSubview:", v88);
LABEL_21:

    goto LABEL_22;
  }
  v21 = v88;
  if (-[BKPageCurl type](self, "type") == 3)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl existingPages](self, "existingPages"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "lastObject"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl container](self, "container"));
    objc_msgSend(v23, "insertSubview:aboveSubview:", v9, v20);

    goto LABEL_21;
  }
  v24 = -[BKPageCurl type](self, "type");
  if (v24 == 2 && v88 && v88 != v9)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl container](self, "container"));
    objc_msgSend(v20, "insertSubview:belowSubview:", v88, v9);
    goto LABEL_21;
  }
LABEL_22:
  v25 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));
  objc_msgSend(v25, "addObject:", v26);
  if (v21 && v21 != v9 && v89 == (_BYTE *)&dword_0 + 2)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "layer"));
    objc_msgSend(v25, "addObject:", v27);

  }
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v28 = v25;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v102, v112, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v103;
    do
    {
      for (j = 0; j != v30; j = (char *)j + 1)
      {
        if (*(_QWORD *)v103 != v31)
          objc_enumerationMutation(v28);
        -[BKPageCurl ensureCurlFilterOnLayer:](self, "ensureCurlFilterOnLayer:", *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * (_QWORD)j));
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v102, v112, 16);
    }
    while (v30);
  }

  v33 = 1.0;
  if (v89 == (_BYTE *)&dword_0 + 2)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "layer"));
    CATransform3DMakeScale(&v101, -1.0, 1.0, 1.0);
    v100 = v101;
    objc_msgSend(v34, "setSublayerTransform:", &v100);
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "valueForKeyPath:", CFSTR("filters.curl")));
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
    objc_msgSend(v35, "setValue:forKey:", v36, CFSTR("inputBackEnabled"));

    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "valueForKeyPath:", CFSTR("filters.curl")));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
    objc_msgSend(v37, "setValue:forKey:", v38, CFSTR("inputFrontEnabled"));

    v33 = 2.0;
  }
  objc_msgSend(v9, "bounds");
  v39 = v114.origin.x;
  v40 = v114.origin.y;
  width = v114.size.width;
  height = v114.size.height;
  v43 = CGRectGetWidth(v114);
  self->_lastPoint.x = x;
  self->_lastPoint.y = y;
  if (-[BKPageCurl type](self, "type") != 3)
  {
    self->_manualStartPoint.x = x;
    self->_manualStartPoint.y = y;
    v44 = width;
    if (v7 != 3)
      goto LABEL_41;
    goto LABEL_39;
  }
  if (v7 == 3)
  {
    self->_manualStartPoint.x = 0.0;
    self->_manualStartPoint.y = y;
LABEL_39:
    v44 = -width;
    goto LABEL_41;
  }
  self->_manualStartPoint.x = v33 * v43 - x;
  self->_manualStartPoint.y = y;
  v44 = width;
LABEL_41:
  v86 = v9;
  v87 = v26;
  self->_diagonalAngle = atan2(height, v44);
  self->_diagonalLengthPixels = hypot(width, height);
  v115.origin.x = v39;
  v115.origin.y = v40;
  v115.size.width = width;
  v115.size.height = height;
  if (y < CGRectGetHeight(v115) * 0.5)
    self->_diagonalAngle = -self->_diagonalAngle;
  v45 = 15.0;
  if (v89 != (_BYTE *)&dword_0 + 2)
    v45 = 20.0;
  self->_initialCurlRadius = v45;
  self->_k = (150.0 - v45) / 20.0;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlAnimationTime](self, "curlAnimationTime"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlAnimationRadius](self, "curlAnimationRadius"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlAnimationAngle](self, "curlAnimationAngle"));
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  obj = v28;
  v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v111, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v97;
    do
    {
      for (k = 0; k != v50; k = (char *)k + 1)
      {
        if (*(_QWORD *)v97 != v51)
          objc_enumerationMutation(obj);
        v53 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * (_QWORD)k);
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "fromValue"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "keyPath"));
        objc_msgSend(v53, "setValue:forKeyPath:", v54, v55);

        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "fromValue"));
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "keyPath"));
        objc_msgSend(v53, "setValue:forKeyPath:", v56, v57);

        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "fromValue"));
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "keyPath"));
        objc_msgSend(v53, "setValue:forKeyPath:", v58, v59);

      }
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v111, 16);
    }
    while (v50);
  }

  if (-[BKPageCurl type](self, "type") != 3 || v89 == (_BYTE *)&dword_0 + 2)
  {
    v61 = v46;
    v63 = v47;
    v65 = v48;
  }
  else
  {
    self->_inUncurl = 1;
    -[BKPageCurl updateManualCurlToLocation:](self, "updateManualCurlToLocation:", x, y);
    self->_ignoreManualUpdates = 1;
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl uncurlAnimationTime](self, "uncurlAnimationTime"));
    v61 = objc_msgSend(v60, "copy");

    v62 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl uncurlAnimationRadius](self, "uncurlAnimationRadius"));
    v63 = objc_msgSend(v62, "copy");

    v64 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl uncurlAnimationAngle](self, "uncurlAnimationAngle"));
    v65 = objc_msgSend(v64, "copy");

    -[BKPageCurl duration](self, "duration");
    objc_msgSend(v61, "setDuration:", v66 * 0.5);
    -[BKPageCurl duration](self, "duration");
    objc_msgSend(v63, "setDuration:", v67 * 0.5);
    -[BKPageCurl duration](self, "duration");
    objc_msgSend(v65, "setDuration:", v68 * 0.5);
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "keyPath"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "valueForKeyPath:", v69));
    objc_msgSend(v61, "setToValue:", v70);

    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "keyPath"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "valueForKeyPath:", v71));
    objc_msgSend(v63, "setToValue:", v72);

    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "keyPath"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "valueForKeyPath:", v73));
    objc_msgSend(v65, "setToValue:", v74);

    +[CATransaction begin](CATransaction, "begin");
    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    v90 = obj;
    v75 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v92, v110, 16);
    if (v75)
    {
      v76 = v75;
      v77 = *(_QWORD *)v93;
      do
      {
        for (m = 0; m != v76; m = (char *)m + 1)
        {
          if (*(_QWORD *)v93 != v77)
            objc_enumerationMutation(v90);
          v79 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * (_QWORD)m);
          ++self->_didEndCount;
          objc_msgSend(v79, "addAnimation:forKey:", v61, CFSTR("curlTime"));
          objc_msgSend(v79, "addAnimation:forKey:", v63, CFSTR("curlRadius"));
          objc_msgSend(v79, "addAnimation:forKey:", v65, CFSTR("curlAngle"));
          v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "fromValue"));
          v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "keyPath"));
          objc_msgSend(v79, "setValue:forKeyPath:", v80, v81);

          v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "fromValue"));
          v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "keyPath"));
          objc_msgSend(v79, "setValue:forKeyPath:", v82, v83);

          v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "fromValue"));
          v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "keyPath"));
          objc_msgSend(v79, "setValue:forKeyPath:", v84, v85);

        }
        v76 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v92, v110, 16);
      }
      while (v76);
    }

    +[CATransaction commit](CATransaction, "commit");
    self->_state = 1;
  }

}

- (void)updateManualCurlToLocation:(CGPoint)a3
{
  double y;
  double x;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  int64_t v15;
  _BOOL4 v16;
  double v17;
  int64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  BOOL v27;
  _BOOL4 v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  long double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double initialCurlRadius;
  double k;
  double v56;
  double v57;
  double diagonalLengthPixels;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  id v67;
  id v68;
  double v69;
  uint64_t v70;
  float v71;
  float v72;
  float v73;
  void *i;
  void *v75;
  void *v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  void *v82;
  void *v83;
  void *v84;
  double v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  CGFloat __x;
  double __xa;
  void *__xb;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];

  y = a3.y;
  x = a3.x;
  v6 = -[UIView bounds](self->_container, "bounds");
  v11 = CGPointClipToRect(v6, x, y, v7, v8, v9, v10);
  self->_lastPoint.x = v11;
  self->_lastPoint.y = v12;
  if (!self->_ignoreManualUpdates)
  {
    v13 = v11;
    v14 = v12;
    v15 = -[BKPageCurl spineLocation](self, "spineLocation");
    if (v15 == 2)
    {
      v16 = -[BKPageCurl type](self, "type") == 3;
      v17 = 2.0;
    }
    else
    {
      v16 = 0;
      v17 = 1.0;
    }
    v18 = -[BKPageCurl spineLocation](self, "spineLocation");
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlPages](self, "curlPages"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndex:", 0));

    objc_msgSend(v20, "bounds");
    v22 = v17 * v21;
    objc_msgSend(v20, "bounds");
    v24 = v23;
    if (v16)
      v13 = v22 - v13;
    v25 = self->_manualStartPoint.y;
    __x = self->_manualStartPoint.x - v13;
    v26 = atan2(v25 - v14, __x) + 3.14159265;
    v27 = v18 == 3;
    v28 = v18 == 3;
    v29 = v22 - v13;
    if (v27)
      v29 = v13;
    v30 = v29 / v22;
    if (v27)
      v31 = 0.0;
    else
      v31 = 180.0;
    if (v28 && v26 > 3.14159265)
      v32 = v26 + -6.28318531;
    else
      v32 = v26;
    v33 = cos(v25 / v24 * 6.28318531) * 27.5 + 27.5 + 5.0;
    v34 = cos(v30 * 3.14159265);
    v35 = v34 * 0.5 + 0.5;
    v36 = v34 * 0.25 + 0.75;
    if (v15 == 2)
      v36 = v35;
    v37 = v33 * v36;
    v38 = 1.0 - v30;
    if (v15 != 2)
      v38 = 1.0;
    v39 = v31 + v37;
    v40 = v31 - v37;
    v41 = v31 + v38 * 5.0;
    if (v28 != v25 <= v24 * 0.5)
    {
      v42 = v40;
    }
    else
    {
      v41 = v39;
      v42 = v31 + v38 * -5.0;
    }
    v43 = v42 * 0.0174532925;
    if (v32 >= v42 * 0.0174532925)
    {
      v44 = v41 * 0.0174532925;
      v43 = v32;
      if (v32 > v44)
        v43 = v44;
    }
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl configuration](self, "configuration"));
    objc_msgSend(v45, "heightAllowanceScalar");
    v47 = v46;

    v48 = 0.333333333;
    if (v15 != 2)
      v48 = 0.5;
    v49 = v48 * v47;
    v50 = self->_manualStartPoint.y;
    v51 = v50 - v24 * v49;
    v52 = v50 + v24 * v49;
    if (v52 >= v14)
      v52 = v14;
    if (v51 >= v52)
      v52 = v51;
    v53 = hypot(__x, v50 - v52);
    initialCurlRadius = self->_initialCurlRadius;
    k = self->_k;
    if ((v53 + initialCurlRadius * -3.14159265) / (k * 3.14159265 + 2.0) >= 0.0)
      v56 = (v53 + initialCurlRadius * -3.14159265) / (k * 3.14159265 + 2.0);
    else
      v56 = 0.0;
    v57 = v43;
    diagonalLengthPixels = self->_diagonalLengthPixels;
    __xa = v57;
    v59 = diagonalLengthPixels * cos(self->_diagonalAngle - (v57 + -3.14159265));
    if (v56 <= 20.0)
    {
      v63 = initialCurlRadius + k * v56;
      v64 = (v56 + v63 * 3.14159265) / (v63 + v59);
      self->_secondHalf = 0;
    }
    else
    {
      v60 = -149.0 / (v59 + 1.0 + -20.0);
      v61 = v60 * -20.0 + 150.0;
      if (!self->_secondHalf)
        self->_secondHalf = 1;
      v62 = (v53 + v61 * -3.14159265) / (v60 * 3.14159265 + 2.0);
      v63 = v61 + v60 * v62;
      v64 = (v62 + v63 * 3.14159265) / (v59 + v63);
    }
    v65 = __xa;
    if (v63 >= 1.0)
      v66 = v63;
    else
      v66 = 1.0;
    if (v16)
    {
      if (__xa >= 3.14159265)
        v65 = 6.28318531 - __xa + 3.14159265;
      else
        v65 = 3.14159265 - __xa;
    }
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    __xb = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlPages](self, "curlPages"));
    v67 = objc_msgSend(__xb, "countByEnumeratingWithState:objects:count:", &v94, v98, 16);
    if (v67)
    {
      v68 = v67;
      v69 = fmin(v64, 1.0);
      v70 = *(_QWORD *)v95;
      v71 = v65;
      v72 = v69;
      do
      {
        for (i = 0; i != v68; i = (char *)i + 1)
        {
          if (*(_QWORD *)v95 != v70)
            objc_enumerationMutation(__xb);
          v75 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)i);
          v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "layer"));
          *(float *)&v77 = v71;
          v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v77));
          v79 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlAnimationAngle](self, "curlAnimationAngle"));
          v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "keyPath"));
          objc_msgSend(v76, "setValue:forKeyPath:", v78, v80);

          *(float *)&v81 = v72;
          v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v81));
          v83 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlAnimationTime](self, "curlAnimationTime"));
          v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "keyPath"));
          objc_msgSend(v76, "setValue:forKeyPath:", v82, v84);

          v73 = v66;
          *(float *)&v85 = v73;
          v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v85));
          v87 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlAnimationRadius](self, "curlAnimationRadius"));
          v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "keyPath"));
          objc_msgSend(v76, "setValue:forKeyPath:", v86, v88);

          objc_msgSend(v75, "updateCurlPercent:", v30);
        }
        v68 = objc_msgSend(__xb, "countByEnumeratingWithState:objects:count:", &v94, v98, 16);
      }
      while (v68);
    }

    if (!self->_setupEndNotificationSent)
    {
      self->_setupEndNotificationSent = 1;
      v89 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
      objc_msgSend(v89, "postEvent:sender:", kBETestDriverPageTurnSetupEnd, self);

    }
    if (!self->_curlStartNotificationSent && !self->_inUncurl)
    {
      self->_curlStartNotificationSent = 1;
      v90 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
      objc_msgSend(v90, "postEvent:sender:", kBETestDriverPageTurnAnimationStart, self);

    }
  }
}

- (void)finishManualCurl
{
  -[BKPageCurl _finishManualCurl](self, "_finishManualCurl");
}

- (void)cancelManualCurl
{
  self->_cancelledManualCurl = 1;
  -[BKPageCurl _finishManualCurl](self, "_finishManualCurl");
}

- (void)_finishManualCurl
{
  BOOL cancelledManualCurl;
  int64_t v4;
  unsigned int v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  BKPageCurl *v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  float v54;
  BOOL v55;
  double v56;
  void *v57;
  id v58;
  id v59;
  void *i;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id obj;
  int64_t v77;
  uint64_t v78;
  BOOL v79;
  id v80;
  id v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];

  cancelledManualCurl = self->_cancelledManualCurl;
  v4 = -[BKPageCurl spineLocation](self, "spineLocation");
  v5 = -[BKPageCurl type](self, "type");
  v77 = v4;
  if (v4 == 2)
    v6 = !cancelledManualCurl;
  else
    v6 = cancelledManualCurl;
  if (v5 != 3)
    v6 = !cancelledManualCurl;
  v79 = v6;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlAnimationTime](self, "curlAnimationTime"));
    v80 = objc_msgSend(v7, "copy");

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlAnimationRadius](self, "curlAnimationRadius"));
    v82 = objc_msgSend(v8, "copy");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlAnimationAngle](self, "curlAnimationAngle"));
    v81 = objc_msgSend(v9, "copy");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlAnimationShadowColor](self, "curlAnimationShadowColor"));
    v11 = objc_msgSend(v10, "copy");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlAnimationBackColor0](self, "curlAnimationBackColor0"));
    v13 = objc_msgSend(v12, "copy");

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlAnimationBackColor1](self, "curlAnimationBackColor1"));
    v15 = objc_msgSend(v14, "copy");
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl uncurlAnimationTime](self, "uncurlAnimationTime"));
    v80 = objc_msgSend(v16, "copy");

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl uncurlAnimationRadius](self, "uncurlAnimationRadius"));
    v82 = objc_msgSend(v17, "copy");

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl uncurlAnimationAngle](self, "uncurlAnimationAngle"));
    v81 = objc_msgSend(v18, "copy");

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl uncurlAnimationShadowColor](self, "uncurlAnimationShadowColor"));
    v11 = objc_msgSend(v14, "copy");
    v13 = 0;
    v15 = 0;
  }
  v19 = self;

  *(_QWORD *)&v20 = objc_opt_class(UIView).n128_u64[0];
  v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlPages](self, "curlPages", v20));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndex:", 0));
  v25 = BUDynamicCast(v22, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "layer"));

  +[CATransaction flush](CATransaction, "flush");
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "presentationLayer"));

  if (v28)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "presentationLayer"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "keyPath"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "valueForKeyPath:", v30));
    objc_msgSend(v80, "setFromValue:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "presentationLayer"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "keyPath"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "valueForKeyPath:", v33));
    objc_msgSend(v82, "setFromValue:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "presentationLayer"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "keyPath"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "valueForKeyPath:", v36));
    objc_msgSend(v81, "setFromValue:", v37);

    if (v13)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "presentationLayer"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "keyPath"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "valueForKeyPath:", v39));
      objc_msgSend(v13, "setFromValue:", v40);

    }
    if (v15)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "presentationLayer"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "keyPath"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "valueForKeyPath:", v42));
      objc_msgSend(v15, "setFromValue:", v43);

    }
  }
  v75 = v27;
  -[BKPageCurl duration](v19, "duration");
  v45 = v44;
  objc_msgSend(v80, "setDuration:");
  objc_msgSend(v82, "setDuration:", v45);
  objc_msgSend(v81, "setDuration:", v45);
  objc_msgSend(v11, "setDuration:", v45);
  if (v77 == 2)
  {
    LODWORD(v46) = 1.0;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v46));
    objc_msgSend(v82, "setToValue:", v47);

    if (-[BKPageCurl type](v19, "type") == 3)
    {
      *(_QWORD *)&v48 = objc_opt_class(NSNumber).n128_u64[0];
      v50 = v49;
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "fromValue", v48));
      v52 = BUDynamicCast(v50, v51);
      v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
      objc_msgSend(v53, "floatValue");
      v55 = v54 <= 3.14159265;
      v56 = 6.28318531;
      if (v55)
        v56 = 0.0;
      *(float *)&v56 = v56;
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v56));
      objc_msgSend(v81, "setToValue:", v57);

    }
  }
  +[CATransaction begin](CATransaction, "begin");
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlPages](v19, "curlPages"));
  v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
  if (v58)
  {
    v59 = v58;
    v78 = *(_QWORD *)v84;
    do
    {
      for (i = 0; i != v59; i = (char *)i + 1)
      {
        if (*(_QWORD *)v84 != v78)
          objc_enumerationMutation(obj);
        v61 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * (_QWORD)i);
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "layer"));
        ++v19->_didEndCount;
        objc_msgSend(v62, "addAnimation:forKey:", v80, CFSTR("curlTime"));
        objc_msgSend(v62, "addAnimation:forKey:", v82, CFSTR("curlRadius"));
        objc_msgSend(v62, "addAnimation:forKey:", v81, CFSTR("curlAngle"));
        objc_msgSend(v62, "addAnimation:forKey:", v11, CFSTR("curlShadowColor"));
        if (v13)
          objc_msgSend(v62, "addAnimation:forKey:", v13, CFSTR("curlBackColor0"));
        if (v15)
          objc_msgSend(v62, "addAnimation:forKey:", v15, CFSTR("curlBackColor1"));
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "toValue"));
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "keyPath"));
        objc_msgSend(v62, "setValue:forKeyPath:", v63, v64);

        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "toValue"));
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "keyPath"));
        objc_msgSend(v62, "setValue:forKeyPath:", v65, v66);

        v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "toValue"));
        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "keyPath"));
        objc_msgSend(v62, "setValue:forKeyPath:", v67, v68);

        v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "toValue"));
        v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "keyPath"));
        objc_msgSend(v62, "setValue:forKeyPath:", v69, v70);

        if (v13)
        {
          v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "toValue"));
          v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "keyPath"));
          objc_msgSend(v62, "setValue:forKey:", v71, v72);

        }
        if (v15)
        {
          v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "toValue"));
          v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "keyPath"));
          objc_msgSend(v62, "setValue:forKey:", v73, v74);

        }
        if (!v79)
          objc_msgSend(v61, "pageCurlWillCancelWithDuration:", v45);

      }
      v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
    }
    while (v59);
  }

  +[CATransaction commit](CATransaction, "commit");
  v19->_state = 1;

}

- (void)killCurl
{
  void *v3;

  self->_state = 4;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl delegate](self, "delegate"));
  objc_msgSend(v3, "pageCurl:finished:", self, 0);

  -[BKPageCurl fullCleanup](self, "fullCleanup");
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  int v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a4;
  v6 = a3;
  self->_finished = v4;
  v7 = self->_didEndCount - 1;
  self->_didEndCount = v7;
  if (self->_inUncurl)
  {
    self->_ignoreManualUpdates = 0;
    if (v4)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlPages](self, "curlPages", 0));
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v15;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v15 != v11)
              objc_enumerationMutation(v8);
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "layer"));
            objc_msgSend(v13, "removeAllAnimations");

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v10);
      }

      -[BKPageCurl updateManualCurlToLocation:](self, "updateManualCurlToLocation:", self->_lastPoint.x, self->_lastPoint.y);
    }
    self->_inUncurl = 0;
    kdebug_trace(725353252, 0, 0, 0, 0);
  }
  else if (!v7 && (int *)-[BKPageCurl state](self, "state") != &dword_4)
  {
    -[BKPageCurl _animationDidStop:](self, "_animationDidStop:", v4);
  }

}

- (void)_animationDidStop:(BOOL)a3
{
  _BOOL8 v3;
  int64_t v5;
  id WeakRetained;
  id v7;

  v3 = a3;
  if (a3)
  {
    if ((-[BKPageCurl type](self, "type") == 2 || -[BKPageCurl type](self, "type") == 3) && self->_cancelledManualCurl)
      v5 = 3;
    else
      v5 = 2;
  }
  else
  {
    v5 = 4;
  }
  self->_state = v5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (!WeakRetained)
    -[BKPageCurl fullCleanup](self, "fullCleanup");
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKPageCurl delegate](self, "delegate"));
  objc_msgSend(v7, "pageCurl:finished:", self, v3);

}

- (void)fullCleanup
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl existingPages](self, "existingPages"));
  objc_msgSend(v3, "makeObjectsPerformSelector:", "removeFromSuperview");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl curlPages](self, "curlPages"));
  objc_msgSend(v4, "makeObjectsPerformSelector:", "removeFromSuperview");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurl backPage](self, "backPage"));
  objc_msgSend(v5, "removeFromSuperview");

  -[BKPageCurl cleanup](self, "cleanup");
}

- (void)cleanup
{
  -[BKPageCurl setCurlPages:](self, "setCurlPages:", 0);
  -[BKPageCurl setExistingPages:](self, "setExistingPages:", 0);
  -[BKPageCurl setBackPages:](self, "setBackPages:", 0);
  -[BKPageCurl setBackPage:](self, "setBackPage:", 0);
  -[BKPageCurl setContainer:](self, "setContainer:", 0);
  self->_cancelledManualCurl = 0;
  -[CABasicAnimation setDelegate:](self->_curlAnimationTime, "setDelegate:", 0);
  -[CABasicAnimation setDelegate:](self->_curlAnimationRadius, "setDelegate:", 0);
  -[CABasicAnimation setDelegate:](self->_curlAnimationAngle, "setDelegate:", 0);
  -[CABasicAnimation setDelegate:](self->_curlAnimationShadowColor, "setDelegate:", 0);
  -[CABasicAnimation setDelegate:](self->_curlAnimationBackColor0, "setDelegate:", 0);
  -[CABasicAnimation setDelegate:](self->_curlAnimationBackColor1, "setDelegate:", 0);
  -[CABasicAnimation setDelegate:](self->_uncurlAnimationTime, "setDelegate:", 0);
  -[CABasicAnimation setDelegate:](self->_uncurlAnimationRadius, "setDelegate:", 0);
  -[CABasicAnimation setDelegate:](self->_uncurlAnimationAngle, "setDelegate:", 0);
  -[CABasicAnimation setDelegate:](self->_uncurlAnimationShadowColor, "setDelegate:", 0);
}

- (id)existingPages
{
  return self->_existingPages;
}

- (void)setExistingPages:(id)a3
{
  objc_storeStrong((id *)&self->_existingPages, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (BOOL)nightMode
{
  return self->_nightMode;
}

- (void)setNightMode:(BOOL)a3
{
  self->_nightMode = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)stabilization
{
  return self->_stabilization;
}

- (void)setStabilization:(double)a3
{
  self->_stabilization = a3;
}

- (NSArray)curlPages
{
  return self->_curlPages;
}

- (void)setCurlPages:(id)a3
{
  objc_storeStrong((id *)&self->_curlPages, a3);
}

- (NSArray)backPages
{
  return self->_backPages;
}

- (void)setBackPages:(id)a3
{
  objc_storeStrong((id *)&self->_backPages, a3);
}

- (UIView)backPage
{
  return self->_backPage;
}

- (void)setBackPage:(id)a3
{
  objc_storeStrong((id *)&self->_backPage, a3);
}

- (UIView)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (UIColor)pageColor
{
  return self->_pageColor;
}

- (void)setPageColor:(id)a3
{
  objc_storeStrong((id *)&self->_pageColor, a3);
}

- (UIColor)backColor
{
  return self->_backColor;
}

- (void)setBackColor:(id)a3
{
  objc_storeStrong((id *)&self->_backColor, a3);
}

- (BKPageCurlDelegate)delegate
{
  return (BKPageCurlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)extraView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_extraView);
}

- (void)setExtraView:(id)a3
{
  objc_storeWeak((id *)&self->_extraView, a3);
}

- (int64_t)spineLocation
{
  return self->_spineLocation;
}

- (void)setSpineLocation:(int64_t)a3
{
  self->_spineLocation = a3;
}

- (BKPageCurlConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (CAFilter)curlFilter
{
  return self->_curlFilter;
}

- (void)setCurlFilter:(id)a3
{
  objc_storeStrong((id *)&self->_curlFilter, a3);
}

- (double)k
{
  return self->_k;
}

- (void)setK:(double)a3
{
  self->_k = a3;
}

- (double)diagonalLengthPixels
{
  return self->_diagonalLengthPixels;
}

- (void)setDiagonalLengthPixels:(double)a3
{
  self->_diagonalLengthPixels = a3;
}

- (double)diagonalAngle
{
  return self->_diagonalAngle;
}

- (void)setDiagonalAngle:(double)a3
{
  self->_diagonalAngle = a3;
}

- (double)projectedDiagonal
{
  return self->_projectedDiagonal;
}

- (void)setProjectedDiagonal:(double)a3
{
  self->_projectedDiagonal = a3;
}

- (double)initialCurlRadius
{
  return self->_initialCurlRadius;
}

- (void)setInitialCurlRadius:(double)a3
{
  self->_initialCurlRadius = a3;
}

- (CGPoint)manualStartPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_manualStartPoint.x;
  y = self->_manualStartPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setManualStartPoint:(CGPoint)a3
{
  self->_manualStartPoint = a3;
}

- (CGPoint)lastPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastPoint.x;
  y = self->_lastPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastPoint:(CGPoint)a3
{
  self->_lastPoint = a3;
}

- (int)didEndCount
{
  return self->_didEndCount;
}

- (void)setDidEndCount:(int)a3
{
  self->_didEndCount = a3;
}

- (BOOL)secondHalf
{
  return self->_secondHalf;
}

- (void)setSecondHalf:(BOOL)a3
{
  self->_secondHalf = a3;
}

- (BOOL)ignoreManualUpdates
{
  return self->_ignoreManualUpdates;
}

- (void)setIgnoreManualUpdates:(BOOL)a3
{
  self->_ignoreManualUpdates = a3;
}

- (BOOL)inUncurl
{
  return self->_inUncurl;
}

- (void)setInUncurl:(BOOL)a3
{
  self->_inUncurl = a3;
}

- (BOOL)cancelledManualCurl
{
  return self->_cancelledManualCurl;
}

- (void)setCancelledManualCurl:(BOOL)a3
{
  self->_cancelledManualCurl = a3;
}

- (BOOL)curlStartNotificationSent
{
  return self->_curlStartNotificationSent;
}

- (void)setCurlStartNotificationSent:(BOOL)a3
{
  self->_curlStartNotificationSent = a3;
}

- (BOOL)setupEndNotificationSent
{
  return self->_setupEndNotificationSent;
}

- (void)setSetupEndNotificationSent:(BOOL)a3
{
  self->_setupEndNotificationSent = a3;
}

- (void)setCurlAnimationTime:(id)a3
{
  objc_storeStrong((id *)&self->_curlAnimationTime, a3);
}

- (void)setUncurlAnimationTime:(id)a3
{
  objc_storeStrong((id *)&self->_uncurlAnimationTime, a3);
}

- (void)setCurlAnimationRadius:(id)a3
{
  objc_storeStrong((id *)&self->_curlAnimationRadius, a3);
}

- (void)setUncurlAnimationRadius:(id)a3
{
  objc_storeStrong((id *)&self->_uncurlAnimationRadius, a3);
}

- (void)setCurlAnimationAngle:(id)a3
{
  objc_storeStrong((id *)&self->_curlAnimationAngle, a3);
}

- (void)setUncurlAnimationAngle:(id)a3
{
  objc_storeStrong((id *)&self->_uncurlAnimationAngle, a3);
}

- (void)setCurlAnimationShadowColor:(id)a3
{
  objc_storeStrong((id *)&self->_curlAnimationShadowColor, a3);
}

- (void)setUncurlAnimationShadowColor:(id)a3
{
  objc_storeStrong((id *)&self->_uncurlAnimationShadowColor, a3);
}

- (void)setCurlAnimationBackColor0:(id)a3
{
  objc_storeStrong((id *)&self->_curlAnimationBackColor0, a3);
}

- (void)setCurlAnimationBackColor1:(id)a3
{
  objc_storeStrong((id *)&self->_curlAnimationBackColor1, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curlAnimationBackColor1, 0);
  objc_storeStrong((id *)&self->_curlAnimationBackColor0, 0);
  objc_storeStrong((id *)&self->_uncurlAnimationShadowColor, 0);
  objc_storeStrong((id *)&self->_curlAnimationShadowColor, 0);
  objc_storeStrong((id *)&self->_uncurlAnimationAngle, 0);
  objc_storeStrong((id *)&self->_curlAnimationAngle, 0);
  objc_storeStrong((id *)&self->_uncurlAnimationRadius, 0);
  objc_storeStrong((id *)&self->_curlAnimationRadius, 0);
  objc_storeStrong((id *)&self->_uncurlAnimationTime, 0);
  objc_storeStrong((id *)&self->_curlAnimationTime, 0);
  objc_storeStrong((id *)&self->_curlFilter, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_extraView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_existingPages, 0);
  objc_storeStrong((id *)&self->_backColor, 0);
  objc_storeStrong((id *)&self->_pageColor, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_backPage, 0);
  objc_storeStrong((id *)&self->_backPages, 0);
  objc_storeStrong((id *)&self->_curlPages, 0);
}

@end
