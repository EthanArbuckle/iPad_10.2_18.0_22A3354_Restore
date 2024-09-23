@implementation _UIPageCurl

- (_UIPageCurl)initWithSpineLocation:(int64_t)a3 andContentRect:(CGRect)a4 inContentView:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  _UIPageCurl *v14;
  NSMutableArray *v16;
  NSMutableArray *pendingStateQueue;
  NSMutableArray *v18;
  NSMutableArray *activeStateQueue;
  NSMutableSet *v20;
  NSMutableSet *completedStates;
  int64_t spineLocation;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  float v30;
  float v31;
  void *v32;
  objc_super v33;
  CGRect v34;
  CGRect v35;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a5;
  v33.receiver = self;
  v33.super_class = (Class)_UIPageCurl;
  v14 = -[_UIPageCurl init](&v33, sel_init);
  if (v14)
  {
    if ((unint64_t)a3 > 0x20 || ((1 << a3) & 0x10001011ELL) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("_UIPageCurl.m"), 500, CFSTR("'%ld' is not a permissible spine location"), a3);

    }
    v14->_spineLocation = a3;
    v14->_contentRect.origin.x = x;
    v14->_contentRect.origin.y = y;
    v14->_contentRect.size.width = width;
    v14->_contentRect.size.height = height;
    objc_storeStrong((id *)&v14->_contentView, a5);
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingStateQueue = v14->_pendingStateQueue;
    v14->_pendingStateQueue = v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    activeStateQueue = v14->_activeStateQueue;
    v14->_activeStateQueue = v18;

    v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    completedStates = v14->_completedStates;
    v14->_completedStates = v20;

    spineLocation = v14->_spineLocation;
    v24 = v14->_contentRect.origin.x;
    v23 = v14->_contentRect.origin.y;
    v26 = v14->_contentRect.size.width;
    v25 = v14->_contentRect.size.height;
    v27 = 3.14159265;
    switch(spineLocation)
    {
      case 1:
        goto LABEL_10;
      case 2:
        goto LABEL_9;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_15;
      case 4:
        v28 = CGRectGetWidth(v14->_contentRect) * 0.5;
        goto LABEL_11;
      case 8:
        v28 = CGRectGetHeight(v14->_contentRect) * 0.5;
        goto LABEL_13;
      default:
        if (spineLocation == 16)
        {
LABEL_10:
          v28 = CGRectGetWidth(v14->_contentRect);
LABEL_11:
          v34.origin.x = v24;
          v34.origin.y = v23;
          v34.size.width = v26;
          v34.size.height = v25;
          v29 = CGRectGetHeight(v34);
        }
        else
        {
          if (spineLocation != 32)
            goto LABEL_15;
LABEL_9:
          v28 = CGRectGetHeight(v14->_contentRect);
LABEL_13:
          v35.origin.x = v24;
          v35.origin.y = v23;
          v35.size.width = v26;
          v35.size.height = v25;
          v29 = CGRectGetWidth(v35);
        }
        v30 = v28;
        v31 = v29 * 0.5;
        v27 = atan2f(v30, v31);
LABEL_15:
        v14->_manualPageCurlMaxDAngle = v27;
        break;
    }
  }

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[_UIPageCurl _cancelAllActiveTransitionsAndAbandonCallbacks:](self, "_cancelAllActiveTransitionsAndAbandonCallbacks:", 1);
  v3.receiver = self;
  v3.super_class = (Class)_UIPageCurl;
  -[_UIPageCurl dealloc](&v3, sel_dealloc);
}

- (BOOL)_isManualPageCurlInProgressAndUncommitted
{
  _UIPageCurlState *manualPageCurlState;

  manualPageCurlState = self->_manualPageCurlState;
  if (manualPageCurlState)
    LOBYTE(manualPageCurlState) = -[_UIPageCurlState curlState](manualPageCurlState, "curlState") < 5;
  return (char)manualPageCurlState;
}

- (BOOL)_areAnimationsInFlightOrPending
{
  return -[NSMutableArray count](self->_activeStateQueue, "count")
      || -[NSMutableArray count](self->_pendingStateQueue, "count") != 0;
}

- (NSNumber)_wrappedManualPageCurlDirection
{
  void *manualPageCurlState;

  manualPageCurlState = self->_manualPageCurlState;
  if (manualPageCurlState)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(manualPageCurlState, "transitionDirection"));
    manualPageCurlState = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)manualPageCurlState;
}

- (void)_setContentRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v21 = *MEMORY[0x1E0C80C00];
  if (!CGRectEqualToRect(self->_contentRect, a3))
  {
    self->_contentRect.origin.x = x;
    self->_contentRect.origin.y = y;
    self->_contentRect.size.width = width;
    self->_contentRect.size.height = height;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = self->_activeStateQueue;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          v14 = (id)objc_msgSend(v13, "frontPageView", (_QWORD)v16);
          v15 = (id)objc_msgSend(v13, "backPageView");
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

  }
}

- (CGRect)_pageViewFrame:(BOOL)a3
{
  CGFloat y;
  CGFloat x;
  double height;
  double width;
  int64_t spineLocation;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  x = self->_contentRect.origin.x;
  y = self->_contentRect.origin.y;
  width = self->_contentRect.size.width;
  height = self->_contentRect.size.height;
  spineLocation = self->_spineLocation;
  if (spineLocation == 8)
  {
    height = CGRectGetHeight(self->_contentRect) * 0.5;
    if (!a3)
      y = CGRectGetMidY(self->_contentRect);
  }
  else if (spineLocation == 4)
  {
    width = CGRectGetWidth(self->_contentRect) * 0.5;
    if (!a3)
      x = CGRectGetMidX(self->_contentRect);
  }
  v10 = x;
  v11 = y;
  v12 = width;
  v13 = height;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (id)_newCurlFilter
{
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;

  v2 = objc_alloc(MEMORY[0x1E0CD2780]);
  v3 = (void *)objc_msgSend(v2, "initWithType:", *MEMORY[0x1E0CD2E88]);
  objc_msgSend(v3, "setName:", CFSTR("curl"));
  objc_msgSend(v3, "setCachesInputImage:", 1);
  +[UIColor whiteColor](UIColor, "whiteColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setValue:forKeyPath:", objc_msgSend(v4, "CGColor"), CFSTR("inputFrontColor"));

  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.956862745, 0.8);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setValue:forKeyPath:", objc_msgSend(v5, "CGColor"), CFSTR("inputBackColor0"));

  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.7, 1.0);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setValue:forKeyPath:", objc_msgSend(v6, "CGColor"), CFSTR("inputBackColor1"));

  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.15, 1.0);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setValue:forKeyPath:", objc_msgSend(v7, "CGColor"), CFSTR("inputShadowColor"));

  return v3;
}

- (id)_newAnimationForState:(id)a3 withKeyPath:(id)a4 duration:(double)a5 fromValue:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = objc_alloc_init(MEMORY[0x1E0CD2710]);
  objc_msgSend(v12, "setKeyPath:", v10);
  objc_msgSend(v12, "setDuration:", UIAnimationDragCoefficient() * a5);
  objc_msgSend(v12, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  if (v11)
    objc_msgSend(v12, "setFromValue:", v11);
  if (!objc_msgSend(v10, "isEqualToString:", CFSTR("filters.curl.inputTime")))
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("filters.curl.inputRadius")))
    {
      v14 = (void *)MEMORY[0x1E0CD27D0];
      v15 = &kUIPageCurlSmoothControlPoints;
    }
    else
    {
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("filters.curl.inputAngle")))
        goto LABEL_13;
      v16 = (void *)MEMORY[0x1E0CD27D0];
      if (objc_msgSend(v9, "curlType") >= 3)
        v15 = &kUIPageCurlEaseInControlPoints;
      else
        v15 = &kUIPageCurlEaseOutControlPoints;
      v14 = v16;
    }
    objc_msgSend(v14, "uiFunctionWithControlPoints:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTimingFunction:", v17);

    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CD27D0], "uiFunctionWithControlPoints:", &kUIPageCurlSmoothControlPoints);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTimingFunction:", v13);

  objc_msgSend(v12, "setDelegate:", v9);
LABEL_13:

  return v12;
}

- (double)_baseAngleOffsetForState:(id)a3
{
  id v5;
  void *v6;
  int64_t spineLocation;
  double v8;
  void *v9;

  v5 = a3;
  v6 = v5;
  spineLocation = self->_spineLocation;
  v8 = 3.14159265;
  if (spineLocation == 1)
    goto LABEL_19;
  if (spineLocation == 4)
  {
    if (!objc_msgSend(v5, "transitionDirection"))
      goto LABEL_19;
    spineLocation = self->_spineLocation;
  }
  if (spineLocation == 3)
    goto LABEL_19;
  if (spineLocation == 16)
    goto LABEL_18;
  if (spineLocation != 4)
    goto LABEL_10;
  if (objc_msgSend(v6, "transitionDirection") == 1)
  {
LABEL_18:
    v8 = 0.0;
    goto LABEL_19;
  }
  spineLocation = self->_spineLocation;
LABEL_10:
  v8 = 4.71238898;
  if (spineLocation != 2)
  {
    if (spineLocation == 8)
    {
      if (!objc_msgSend(v6, "transitionDirection"))
        goto LABEL_19;
      spineLocation = self->_spineLocation;
    }
    v8 = 1.57079633;
    if (spineLocation != 32 && (spineLocation != 8 || objc_msgSend(v6, "transitionDirection") != 1))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPageCurl.m"), 602, CFSTR("Not implemented yet!"));

      goto LABEL_18;
    }
  }
LABEL_19:

  return v8;
}

- (BOOL)_populateFromValue:(double *)a3 toValue:(double *)a4 fromState:(id)a5 forAnimationWithKeyPath:(id)a6
{
  id v11;
  id v12;
  unint64_t spineLocation;
  double Height;
  int64_t v15;
  double v16;
  double v17;
  int64_t v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  BOOL v29;
  void *v31;

  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("filters.curl.inputTime")))
  {
    if (objc_msgSend(v11, "curlType") <= 2)
    {
      if (a3)
        *a3 = 0.0;
      if (a4)
        *a4 = 1.0;
    }
    else
    {
      if (a3)
        *a3 = 1.0;
      if (a4)
        *a4 = 0.0;
    }
    goto LABEL_67;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("filters.curl.inputRadius")))
  {
    spineLocation = self->_spineLocation;
    if (spineLocation <= 0x20 && ((1 << spineLocation) & 0x100000104) != 0)
      Height = CGRectGetHeight(self->_contentRect);
    else
      Height = CGRectGetWidth(self->_contentRect);
    v17 = Height;
    v18 = self->_spineLocation;
    if (v18 == 8 || v18 == 4)
    {
      if (a3)
      {
        if (objc_msgSend(v11, "curlType") == 1)
        {
          v19 = 150.0;
        }
        else
        {
          v21 = objc_msgSend(v11, "curlType");
          v19 = v17 * 0.0203252033;
          if (v21 == 4)
            v19 = 150.0;
        }
        *a3 = v19;
      }
      if (!a4)
        goto LABEL_67;
      v22 = objc_msgSend(v11, "curlType");
      v23 = 1.0;
      if (v22 != 1)
      {
        v24 = objc_msgSend(v11, "curlType", 1.0);
        v23 = v17 * 0.00101626016;
        if (v24 == 4)
          v23 = 1.0;
      }
    }
    else
    {
      if (a3)
      {
        if (objc_msgSend(v11, "curlType") == 1)
          v20 = 0.152439024;
        else
          v20 = dbl_18667A370[objc_msgSend(v11, "curlType") == 4];
        *a3 = v17 * v20;
      }
      if (!a4)
        goto LABEL_67;
      v23 = v17 * 0.304878049;
    }
    goto LABEL_66;
  }
  if (!objc_msgSend(v12, "isEqualToString:", CFSTR("filters.curl.inputAngle")))
    goto LABEL_70;
  v15 = self->_spineLocation;
  v16 = 3.14159265;
  if (v15 != 1)
  {
    if (v15 == 4)
    {
      if (!objc_msgSend(v11, "transitionDirection"))
        goto LABEL_54;
      v15 = self->_spineLocation;
    }
    if (v15 != 3)
    {
      if (v15 == 16)
      {
LABEL_24:
        v16 = 0.0;
        goto LABEL_54;
      }
      if (v15 == 4)
      {
        if (objc_msgSend(v11, "transitionDirection") == 1)
          goto LABEL_24;
        v15 = self->_spineLocation;
      }
      v16 = 4.71238898;
      if (v15 == 2)
        goto LABEL_54;
      if (v15 == 8)
      {
        if (!objc_msgSend(v11, "transitionDirection"))
          goto LABEL_54;
        v15 = self->_spineLocation;
      }
      v16 = 1.57079633;
      if (v15 == 32 || v15 == 8 && objc_msgSend(v11, "transitionDirection") == 1)
        goto LABEL_54;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPageCurl.m"), 640, CFSTR("Not implemented yet!"));

LABEL_70:
      v29 = 0;
      goto LABEL_68;
    }
  }
LABEL_54:
  if (a3)
  {
    v25 = 0.785398163;
    if (self->_spineLocation != 3)
      v25 = 0.0;
    v26 = v16 + v25;
    if (objc_msgSend(v11, "curlType") == 1 || objc_msgSend(v11, "curlType") == 4)
      v27 = dbl_18667A360[v16 > 1.57079633];
    else
      v27 = -0.174532925;
    *a3 = v26 + v27;
  }
  if (!a4)
    goto LABEL_67;
  v28 = 0.785398163;
  if (self->_spineLocation != 3)
    v28 = 0.0;
  v23 = v16 + v28;
LABEL_66:
  *a4 = v23;
LABEL_67:
  v29 = 1;
LABEL_68:

  return v29;
}

- (void)_ensureCurlFilterOnLayer:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "uiHasFilterWithName:", CFSTR("curl")) & 1) == 0)
  {
    v4 = -[_UIPageCurl _newCurlFilter](self, "_newCurlFilter");
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v4, 0);
    objc_msgSend(v6, "setFilters:", v5);

  }
}

- (double)_inputTimeForProgress:(double)a3 distanceToTravel:(double)a4 radius:(double *)a5 minRadius:(double)a6 angle:(double)a7 dAngle:(double)a8 touchLocation:(CGPoint)a9 state:(id)a10
{
  id v13;
  uint64_t v14;
  unint64_t spineLocation;
  uint64_t v16;
  double v17;
  uint64_t v18;
  int v20;
  int v21;
  uint64_t v22;
  double y;
  double x;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat a;
  CGFloat b;
  CGFloat c;
  CGFloat d;
  CGFloat tx;
  CGFloat ty;
  CGFloat v37;
  CGFloat Width;
  double v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  double v45;
  double v46;
  CGFloat MinY;
  double v48;
  double v49;
  float v50;
  __float2 v51;
  float cosval;
  float v53;
  float v54;
  double v55;
  float v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  double v66;
  int64_t v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  float v71;
  __float2 v72;
  double v73;
  double v74;
  float v75;
  double v76;
  float v77;
  __float2 v78;
  double v79;
  double v80;
  float v81;
  double v82;
  double v83;
  float v84;
  float v85;
  double v86;
  float v87;
  float v88;
  double v89;
  double v90;
  double v91;
  double pageDiagonalLength;
  float v93;
  double v94;
  double v95;
  double v96;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v107;
  double v108;
  CGFloat v109;
  CGFloat height;
  CGFloat rect;
  CGFloat recta;
  double rectb;
  double v115;
  CGAffineTransform v116;
  CGAffineTransform v117;
  CGAffineTransform v118;
  CGAffineTransform v119;
  CGAffineTransform v120;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect contentRect;
  CGRect v128;
  CGRect v129;
  CGRect v130;

  v13 = a10;
  v115 = *a5;
  v14 = objc_msgSend(v13, "curlType");
  spineLocation = self->_spineLocation;
  v16 = objc_msgSend(v13, "transitionDirection");
  v17 = -2.0;
  if (v14 < 3)
    v17 = 0.0;
  if ((spineLocation & 1) != 0)
  {
    if (!v16)
    {
LABEL_8:
      v17 = 0.0;
      if (v14 < 3)
        v17 = -2.0;
      goto LABEL_25;
    }
  }
  else
  {
    v18 = (spineLocation >> 4) & 1;
    if (spineLocation == 4)
      LOBYTE(v18) = 1;
    if (!v16 && (v18 & 1) != 0)
      goto LABEL_8;
  }
  if (spineLocation <= 0x20 && ((1 << spineLocation) & 0x100000104) != 0)
  {
    if (v14 >= 3)
      v20 = -1;
    else
      v20 = -3;
    if (v14 < 3)
      v21 = -1;
    else
      v21 = -3;
    if (!v16)
      v21 = v20;
    v17 = (double)v21;
  }
LABEL_25:
  v22 = (uint64_t)v17;
  x = self->_contentRect.origin.x;
  y = self->_contentRect.origin.y;
  height = self->_contentRect.size.height;
  rect = self->_contentRect.size.width;
  if (((uint64_t)v17 & 1) != 0)
  {
    CGAffineTransformMakeTranslation(&t1, x - (x + self->_contentRect.size.width * 0.5), y - (y + self->_contentRect.size.height * 0.5));
    CGAffineTransformMakeRotation(&t2, -1.57079633);
    CGAffineTransformConcat(&v123, &t1, &t2);
    a = v123.a;
    b = v123.b;
    c = v123.c;
    d = v123.d;
    v104 = a7;
    tx = v123.tx;
    ty = v123.ty;
    v124.origin.x = x;
    v124.origin.y = y;
    v124.size.height = height;
    v124.size.width = rect;
    v125 = CGRectApplyAffineTransform(v124, &v123);
    x = v125.origin.x;
    y = v125.origin.y;
    height = v125.size.height;
    rect = v125.size.width;
    CGAffineTransformMakeTranslation(&v120, v125.origin.x + v125.size.width * 0.5 - v125.origin.x, v125.origin.y + v125.size.height * 0.5 - v125.origin.y);
    v119.a = a;
    v119.b = b;
    v119.c = c;
    v119.d = d;
    v119.tx = tx;
    v119.ty = ty;
    a7 = v104;
    CGAffineTransformConcat(&v123, &v119, &v120);
    v25 = v123.a;
    v26 = v123.b;
    v27 = v123.c;
    v28 = v123.d;
    v29 = v123.tx;
    v30 = v123.ty;
  }
  else
  {
    v25 = *MEMORY[0x1E0C9BAA8];
    v26 = *(double *)(MEMORY[0x1E0C9BAA8] + 8);
    v27 = *(double *)(MEMORY[0x1E0C9BAA8] + 16);
    v28 = *(double *)(MEMORY[0x1E0C9BAA8] + 24);
    v29 = *(double *)(MEMORY[0x1E0C9BAA8] + 32);
    v30 = *(double *)(MEMORY[0x1E0C9BAA8] + 40);
  }
  if (v22 <= -2)
  {
    v126.origin.x = x;
    v126.origin.y = y;
    v126.size.height = height;
    v126.size.width = rect;
    v37 = v29;
    Width = CGRectGetWidth(v126);
    CGAffineTransformMakeTranslation(&v117, -Width, 0.0);
    v123.a = v25;
    v123.b = v26;
    v123.c = v27;
    v123.d = v28;
    v123.tx = v37;
    v123.ty = v30;
    CGAffineTransformConcat(&v118, &v123, &v117);
    CGAffineTransformMakeScale(&v116, -1.0, 1.0);
    CGAffineTransformConcat(&v123, &v118, &v116);
    v25 = v123.a;
    v26 = v123.b;
    v27 = v123.c;
    v28 = v123.d;
    v29 = v123.tx;
    v30 = v123.ty;
  }
  if (a8 == 0.0)
  {
    v39 = 0.0;
  }
  else
  {
    v39 = (double)v22 * 1.57079633 + a7;
    if (v39 < 0.0)
      v39 = -v39;
  }
  v105 = v39;
  v102 = a9.y * v27 + a9.x * v25;
  contentRect = self->_contentRect;
  v40 = v30 + a9.y * v28 + a9.x * v26;
  v123.a = v25;
  v123.b = v26;
  v123.c = v27;
  v123.d = v28;
  v107 = v29;
  v123.tx = v29;
  v123.ty = v30;
  v128 = CGRectApplyAffineTransform(contentRect, &v123);
  v41 = v128.origin.x;
  v42 = v128.origin.y;
  v43 = v128.size.width;
  v44 = v128.size.height;
  objc_msgSend(v13, "referenceLocation");
  recta = v44;
  v109 = v42;
  if (v40 < v30 + v26 * v45 + v28 * v46)
  {
    v129.origin.x = v41;
    v129.origin.y = v42;
    v129.size.width = v43;
    v129.size.height = v44;
    MinY = CGRectGetMinY(v129);
    v130.size.height = v44;
    v48 = v40;
    v49 = MinY;
    v130.origin.x = v41;
    v130.origin.y = v42;
    v130.size.width = v43;
    v40 = v49 + CGRectGetMaxY(v130) - v48;
  }
  v101 = v40;
  v108 = v107 + v102;
  if (a8 == 0.0)
  {
    v58 = a4 * 0.5;
    v59 = a3 * a4 - a4 * 0.5;
    v60 = -v59;
    if (v59 >= 0.0)
      v60 = a3 * a4 - a4 * 0.5;
    v61 = (v58 - v60 + v115 * -3.14159265) * 0.5;
    if (v59 >= 0.0)
      v62 = a4 * 0.5;
    else
      v62 = a3 * a4;
    v57 = v62 - v61;
    v103 = a3 * a4 + a3 * a4;
  }
  else
  {
    v50 = v105;
    v51 = __sincosf_stret(v50);
    cosval = v51.__cosval;
    v53 = v105 * 0.5;
    v54 = sinf(v53);
    v55 = v115
        * 6.28318531
        * (v51.__cosval
         + 1.0
         + ((float)((float)(1.0 / v51.__sinval) * (float)(1.0 / v51.__sinval))
          + (float)((float)(1.0 / v51.__sinval) * (float)(1.0 / v51.__sinval)))
         * powf(v54, 6.0))
        + v40 * 8.0 * (float)(cosval * cosval) * v51.__sinval
        - v115 * 8.0 * (float)(v51.__sinval * v51.__sinval);
    v56 = v105 * 4.0;
    v57 = (v108 / v51.__sinval * sinf(v56) + v55) * (float)((float)(1.0 / cosval) * (float)(1.0 / cosval)) * 0.125;
    v103 = 0.0;
    v58 = 0.0;
    v59 = 0.0;
  }
  v63 = v109;
  v64 = v43;
  v65 = v41;
  if (v105 >= 0.0)
    v66 = v105;
  else
    v66 = -v105;
  v67 = self->_spineLocation;
  if (v67 == 8 || v67 == 4)
  {
    v68 = recta;
    v69 = CGRectGetWidth(*(CGRect *)&v65) * 0.5;
  }
  else
  {
    v70 = recta;
    v69 = CGRectGetWidth(*(CGRect *)&v65);
  }
  rectb = v66;
  v71 = v66;
  v72 = __sincosf_stret(v71);
  v73 = v57 * v72.__cosval + v57 * v72.__sinval * tanf(v71);
  v74 = v69 * 4.0;
  if (self->_spineLocation != 3)
    v74 = v69;
  if (v73 > v74)
  {
    v57 = v69 * v72.__cosval;
    if (a8 == 0.0)
    {
      v91 = v59 + v58 + v57 + v57 - v103;
      if (v59 >= 0.0)
        v91 = v57 + v57 - v58 - v59;
      v90 = v91 / 3.14159265;
    }
    else
    {
      v75 = v105 * 4.0;
      v76 = v108 * sinf(v75);
      v77 = v105;
      v78 = __sincosf_stret(v77);
      v79 = 1.0 / v78.__sinval * v76;
      v80 = 1.0 / v78.__cosval;
      v81 = v80;
      v82 = (float)(v81 * v81);
      v83 = v57 * 8.0 - v79 * v82 - v101 * 8.0 * v78.__sinval;
      v84 = v105;
      v85 = tanf(v84);
      v86 = v80 * 3.14159265 + v82 * 3.14159265 - (float)(v85 * v85) * 4.0;
      v87 = v105 * 0.5;
      v88 = sinf(v87);
      v89 = powf(v88, 6.0)
          * 6.28318531
          * (float)((float)(1.0 / v78.__sinval) * (float)(1.0 / v78.__sinval))
          * (float)((float)(1.0 / v78.__cosval) * (float)(1.0 / v78.__cosval))
          + v86;
      v90 = v83 / (v89 + v89);
    }
    if (v90 < a6)
      v90 = a6;
    v115 = v90;
    *a5 = v90;
  }
  pageDiagonalLength = self->_pageDiagonalLength;
  v93 = rectb - self->_pageDiagonalAngle;
  v94 = pageDiagonalLength * cosf(v93);
  v95 = -v94;
  if (v94 >= 0.0)
    v95 = v94;
  v96 = v57 / (v115 + v95);

  return v96;
}

- (double)_distanceToTravelWithCurrentSpineLocation
{
  int64_t spineLocation;
  double Width;
  float v6;
  float Height;

  spineLocation = self->_spineLocation;
  switch(spineLocation)
  {
    case 1:
    case 3:
      goto LABEL_6;
    case 2:
      goto LABEL_5;
    case 4:
      return CGRectGetWidth(self->_contentRect);
    case 5:
    case 6:
    case 7:
      goto LABEL_7;
    case 8:
      return CGRectGetHeight(self->_contentRect);
    default:
      if (spineLocation == 16)
      {
LABEL_6:
        Width = CGRectGetWidth(self->_contentRect);
      }
      else if (spineLocation == 32)
      {
LABEL_5:
        Width = CGRectGetHeight(self->_contentRect);
      }
      else
      {
LABEL_7:
        v6 = CGRectGetWidth(self->_contentRect);
        Height = CGRectGetHeight(self->_contentRect);
        Width = hypotf(v6, Height);
      }
      return Width + Width;
  }
}

- (void)_updatedInputsFromState:(id)a3 forLocation:(CGPoint)a4 time:(double *)a5 radius:(double *)a6 angle:(double *)a7
{
  double y;
  double x;
  id v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat width;
  CGFloat height;
  double MaxX;
  double MinX;
  double v20;
  double MaxY;
  double MinY;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  int64_t spineLocation;
  uint64_t v29;
  uint64_t v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  double v47;
  double v48;
  double v49;
  double v50;
  unint64_t v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  int64_t v57;
  uint64_t v58;
  double v60;
  double v61;
  double v62;
  long double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  long double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  long double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  long double v81;
  double v82;
  double v83;
  double v84;
  double manualPageCurlMaxDAngle;
  double v86;
  double v87;
  int64_t v88;
  double v89;
  BOOL v90;
  int v91;
  double v92;
  double v93;
  double v94;
  double v95;
  int64_t v96;
  unint64_t v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;

  y = a4.y;
  x = a4.x;
  v13 = a3;
  v14 = self->_contentRect.origin.x;
  v15 = self->_contentRect.origin.y;
  width = self->_contentRect.size.width;
  height = self->_contentRect.size.height;
  v111.origin.x = v14;
  v111.origin.y = v15;
  v111.size.width = width;
  v111.size.height = height;
  MaxX = CGRectGetMaxX(v111);
  v112.origin.x = v14;
  v112.origin.y = v15;
  v112.size.width = width;
  v112.size.height = height;
  MinX = CGRectGetMinX(v112);
  if (MinX < x)
    MinX = x;
  if (MaxX <= MinX)
    v20 = MaxX;
  else
    v20 = MinX;
  v113.origin.x = v14;
  v113.origin.y = v15;
  v113.size.width = width;
  v113.size.height = height;
  MaxY = CGRectGetMaxY(v113);
  v114.origin.x = v14;
  v114.origin.y = v15;
  v114.size.width = width;
  v114.size.height = height;
  MinY = CGRectGetMinY(v114);
  if (MinY < y)
    MinY = y;
  if (MaxY <= MinY)
    v23 = MaxY;
  else
    v23 = MinY;
  objc_msgSend(v13, "referenceLocation");
  v25 = v24;
  v27 = v26;
  spineLocation = self->_spineLocation;
  v29 = objc_msgSend(v13, "transitionDirection");
  v30 = v29;
  v32 = self->_contentRect.origin.x;
  v31 = self->_contentRect.origin.y;
  v34 = self->_contentRect.size.width;
  v33 = self->_contentRect.size.height;
  if ((spineLocation & 1) != 0)
  {
    v40 = CGRectGetMinX(self->_contentRect);
    v115.origin.x = v32;
    v115.origin.y = v31;
    v115.size.width = v34;
    v115.size.height = v33;
    v25 = v40 - CGRectGetWidth(v115);
  }
  else
  {
    if (spineLocation == 4)
    {
      v35 = self->_contentRect.origin.x;
      v36 = self->_contentRect.origin.y;
      v37 = self->_contentRect.size.width;
      v38 = self->_contentRect.size.height;
      if (v29)
        v39 = CGRectGetMaxX(*(CGRect *)&v35);
      else
        v39 = CGRectGetMinX(*(CGRect *)&v35);
      v25 = v39;
      goto LABEL_30;
    }
    if ((spineLocation & 0x10) != 0)
    {
      v41 = CGRectGetMaxX(self->_contentRect);
      v116.origin.x = v32;
      v116.origin.y = v31;
      v116.size.width = v34;
      v116.size.height = v33;
      v25 = v41 + CGRectGetWidth(v116);
    }
  }
  if (spineLocation == 3 || (spineLocation & 2) == 0)
  {
    if (spineLocation == 8)
    {
      v43 = v32;
      v44 = v31;
      v45 = v34;
      v46 = v33;
      if (v30)
        v47 = CGRectGetMaxY(*(CGRect *)&v43);
      else
        v47 = CGRectGetMinY(*(CGRect *)&v43);
      v27 = v47;
    }
    else if ((spineLocation & 0x20) != 0)
    {
      v119.origin.x = v32;
      v119.origin.y = v31;
      v119.size.width = v34;
      v119.size.height = v33;
      v48 = CGRectGetMaxY(v119);
      v120.origin.x = v32;
      v120.origin.y = v31;
      v120.size.width = v34;
      v120.size.height = v33;
      v27 = v48 + CGRectGetHeight(v120);
    }
  }
  else
  {
    v117.origin.x = v32;
    v117.origin.y = v31;
    v117.size.width = v34;
    v117.size.height = v33;
    v42 = CGRectGetMinY(v117);
    v118.origin.x = v32;
    v118.origin.y = v31;
    v118.size.width = v34;
    v118.size.height = v33;
    v27 = v42 - CGRectGetHeight(v118);
  }
LABEL_30:
  -[_UIPageCurl _distanceToTravelWithCurrentSpineLocation](self, "_distanceToTravelWithCurrentSpineLocation");
  v50 = v49;
  v51 = self->_spineLocation;
  v107 = v27;
  if (v51 > 0x20)
    goto LABEL_110;
  if (((1 << v51) & 0x1001A) == 0)
  {
    if (((1 << v51) & 0x100000104) != 0)
    {
      v52 = v23 - v27;
      goto LABEL_35;
    }
LABEL_110:
    v53 = sqrt((v25 - v20) * (v25 - v20) + (v27 - v23) * (v27 - v23));
    goto LABEL_38;
  }
  v52 = v20 - v25;
LABEL_35:
  if (v52 < 0.0)
    v52 = -v52;
  v53 = v52 / v50;
LABEL_38:
  v54 = 0.0;
  v55 = fmax(v53, 0.0);
  if (v55 >= 1.0)
    v56 = 0.0;
  else
    v56 = 1.0 - v55;
  if (objc_msgSend(v13, "curlType") != 1 && objc_msgSend(v13, "curlType") != 4)
    v54 = 0.1;
  if (objc_msgSend(v13, "curlType") == 1)
  {
    v57 = self->_spineLocation;
LABEL_52:
    v99 = 1.0;
    goto LABEL_53;
  }
  v58 = objc_msgSend(v13, "curlType");
  v57 = self->_spineLocation;
  if (v58 == 4)
    goto LABEL_52;
  if (v57 == 8 || v57 == 4)
    goto LABEL_52;
  v99 = 0.9;
LABEL_53:
  v106 = v25;
  if (v57 != 4 && (v57 & 0x11) == 0)
  {
    if (v57 == 2 || v57 == 8 && !objc_msgSend(v13, "transitionDirection"))
    {
      v72 = CGRectGetMaxY(self->_contentRect) - v50 * v54;
      if (v23 <= v72)
        v73 = v23;
      else
        v73 = v72;
      objc_msgSend(v13, "referenceLocation", *(_QWORD *)&v99);
      v75 = v74 - v20;
      objc_msgSend(v13, "referenceLocation");
      v77 = atan2(v75, v73 - v76) + 1.57079633;
      if (v77 >= 0.0)
        v66 = v77;
      else
        v66 = v77 + 6.28318531;
    }
    else
    {
      v60 = v50 * v54 + CGRectGetMinY(self->_contentRect);
      if (v23 >= v60)
        v61 = v23;
      else
        v61 = v60;
      objc_msgSend(v13, "referenceLocation", *(_QWORD *)&v99);
      v63 = v20 - v62;
      objc_msgSend(v13, "referenceLocation");
      v65 = atan2(v63, v64 - v61) + 4.71238898;
      if (v65 + -6.28318531 <= 0.0)
        v66 = v65;
      else
        v66 = v65 + -6.28318531;
    }
    goto LABEL_83;
  }
  if (v57 == 1)
    goto LABEL_69;
  if (v57 == 4)
  {
    if (!objc_msgSend(v13, "transitionDirection"))
    {
LABEL_69:
      v67 = CGRectGetMaxX(self->_contentRect) - v50 * v54;
      if (v20 <= v67)
        v68 = v20;
      else
        v68 = v67;
      objc_msgSend(v13, "referenceLocation", *(_QWORD *)&v99);
      v70 = v69 - v23;
      objc_msgSend(v13, "referenceLocation");
      v66 = atan2(v70, v71 - v68) + 3.14159265;
      goto LABEL_83;
    }
    v57 = self->_spineLocation;
  }
  if (v57 == 3)
    goto LABEL_69;
  v78 = v50 * v54 + CGRectGetMinX(self->_contentRect);
  if (v20 >= v78)
    v79 = v20;
  else
    v79 = v78;
  objc_msgSend(v13, "referenceLocation", *(_QWORD *)&v99);
  v81 = v23 - v80;
  objc_msgSend(v13, "referenceLocation");
  v66 = atan2(v81, v79 - v82);
LABEL_83:
  -[_UIPageCurl _baseAngleOffsetForState:](self, "_baseAngleOffsetForState:", v13);
  v84 = v83;
  manualPageCurlMaxDAngle = self->_manualPageCurlMaxDAngle;
  v86 = -manualPageCurlMaxDAngle;
  if (v66 - v84 > -manualPageCurlMaxDAngle)
    v86 = v66 - v84;
  if (manualPageCurlMaxDAngle <= v86)
    v87 = self->_manualPageCurlMaxDAngle;
  else
    v87 = v86;
  v109 = 0.0;
  v110 = 0.0;
  -[_UIPageCurl _fromValue:toValue:fromState:forAnimationWithKeyPath:](self, "_fromValue:toValue:fromState:forAnimationWithKeyPath:", &v110, &v109, v13, CFSTR("filters.curl.inputRadius"));
  objc_msgSend(v13, "curlType");
  v88 = self->_spineLocation;
  v89 = v50 * 0.152439024;
  v90 = v88 == 4 || v88 == 8;
  v91 = v90;
  v92 = 0.25;
  if (v90)
    v92 = 0.5;
  if (v56 >= v92)
  {
    v94 = 0.304878049;
    if (v91)
      v94 = 0.00101626016;
    v93 = v89 + (v56 - v92) / (1.0 - v92) * (v50 * v94 - v89);
  }
  else
  {
    v93 = v110 + v56 / v92 * (v89 - v110);
  }
  if (objc_msgSend(v13, "curlType") == 1 || objc_msgSend(v13, "curlType") == 4)
  {
    if (v109 <= v110)
      v95 = v109;
    else
      v95 = v110;
    v96 = self->_spineLocation;
  }
  else
  {
    v97 = self->_spineLocation;
    if (v97 <= 0x20 && ((1 << v97) & 0x100000104) != 0)
      v98 = CGRectGetHeight(self->_contentRect);
    else
      v98 = CGRectGetWidth(self->_contentRect);
    v96 = self->_spineLocation;
    if (v96 == 8 || v96 == 4)
      v98 = v98 * 0.5;
    v95 = v98 * 0.0879120879;
  }
  v100 = v84 + v87;
  if (v96 == 8 || v96 == 4)
  {
    v101 = sqrt((v106 - v20) * (v106 - v20) + (v107 - v23) * (v107 - v23)) / v50;
    if (v101 <= 0.25)
      v102 = (0.25 - v101) * -4.0 + 1.0;
    else
      v102 = 1.0;
    v95 = v102 * v95;
  }
  v103 = v110;
  if (v110 > v109)
    v103 = v109;
  if (v103 > v95)
    v103 = v95;
  if (v103 < v93)
    v103 = v93;
  if (v50 * 0.2 <= v103)
    v103 = v50 * 0.2;
  v108 = v103;
  -[_UIPageCurl _inputTimeForProgress:distanceToTravel:radius:minRadius:angle:dAngle:touchLocation:state:](self, "_inputTimeForProgress:distanceToTravel:radius:minRadius:angle:dAngle:touchLocation:state:", &v108, v13, v56, v50);
  if (a5)
  {
    if (v54 >= v104)
      v104 = v54;
    if (v105 <= v104)
      v104 = v105;
    *a5 = v104;
  }
  if (a6)
    *a6 = v108;
  if (a7)
    *a7 = v100;

}

- (id)_animationKeyPaths
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("filters.curl.inputTime"), CFSTR("filters.curl.inputRadius"), CFSTR("filters.curl.inputAngle"), 0);
}

- (void)_updateCurlFromState:(id)a3 withTime:(double)a4 radius:(double)a5 angle:(double)a6 addingAnimations:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  char v32;
  double v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  id obj;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a7;
  v14 = objc_alloc(MEMORY[0x1E0C99D20]);
  objc_msgSend(v12, "frontPageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "backPageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v14, "initWithObjects:", v16, v18, 0);

  v38 = v13;
  v20 = objc_msgSend(v13, "count");
  -[_UIPageCurl _animationKeyPaths](self, "_animationKeyPaths");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD28B0], "activate");
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v19;
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v42)
  {
    v21 = v13;
    if (!v20)
      v21 = v37;
    v40 = v21;
    v41 = *(_QWORD *)v51;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v51 != v41)
          objc_enumerationMutation(obj);
        v43 = v22;
        v23 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v22);
        v24 = v40;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v44 = v24;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        if (v25)
        {
          v26 = v25;
          v45 = *(_QWORD *)v47;
          do
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v47 != v45)
                objc_enumerationMutation(v44);
              v28 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
              if (v20)
              {
                objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "keyPath");
                v29 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v29 = v28;
              }
              v30 = v29;
              _UIPageCurlFilterPropertyNameForAnimationKeyPath(v29);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v30, "isEqualToString:", CFSTR("filters.curl.inputTime"));
              v33 = a4;
              if ((v32 & 1) == 0)
              {
                if (objc_msgSend(v30, "isEqualToString:", CFSTR("filters.curl.inputRadius"), a4))
                  v33 = a5;
                else
                  v33 = a6;
              }
              *(float *)&v33 = v33;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              if (v20)
              {
                v35 = v28;
                if (objc_msgSend(v12, "curlState") == 1 || objc_msgSend(v12, "curlState") == 5)
                  objc_msgSend(v35, "setToValue:", v34);
                objc_msgSend(v23, "addAnimation:forKey:", v35, v31);
                if (objc_msgSend(v12, "curlState") == 1
                  || objc_msgSend(v12, "curlState") == 3
                  || objc_msgSend(v12, "curlState") == 5)
                {
                  objc_msgSend(v35, "delegate");
                  v36 = (id)objc_claimAutoreleasedReturnValue();

                  if (v36 == v12)
                    objc_msgSend(v12, "incrementCompletionCount");
                }

              }
              objc_msgSend(v23, "setValue:forKeyPath:", v34, v30);

            }
            v26 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
          }
          while (v26);
        }

        v22 = v43 + 1;
      }
      while (v43 + 1 != v42);
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    }
    while (v42);
  }

}

- (CGPoint)_referenceLocationForInitialLocation:(CGPoint)a3 direction:(int64_t)a4
{
  CGFloat y;
  CGFloat x;
  int64_t spineLocation;
  BOOL v10;
  int v11;
  _BOOL4 v14;
  void *v15;
  void *v16;
  SEL v17;
  _UIPageCurl *v18;
  uint64_t v19;
  double MinY;
  double MinX;
  _BOOL4 v23;
  double v24;
  double v25;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  spineLocation = self->_spineLocation;
  if (spineLocation > 2)
  {
    if ((unint64_t)(spineLocation - 3) >= 2 && spineLocation != 16)
      goto LABEL_29;
    if (a4)
      v10 = 0;
    else
      v10 = spineLocation == 4;
    v11 = v10;
    if (spineLocation != 3 && v11 == 0)
    {
      v14 = a4 == 1 && spineLocation == 4;
      if (spineLocation != 16 && !v14)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        v17 = a2;
        v18 = self;
        v19 = 1022;
        goto LABEL_45;
      }
      MinX = CGRectGetMinX(self->_contentRect);
LABEL_35:
      x = MinX;
      goto LABEL_46;
    }
LABEL_33:
    MinX = CGRectGetMaxX(self->_contentRect);
    goto LABEL_35;
  }
  if (spineLocation == 1)
    goto LABEL_33;
  if (spineLocation != 2)
  {
LABEL_29:
    if (!a4 && spineLocation == 8)
      goto LABEL_31;
    v23 = a4 == 1 && spineLocation == 8;
    if (spineLocation == 32 || v23)
    {
      MinY = CGRectGetMinY(self->_contentRect);
      goto LABEL_32;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = a2;
    v18 = self;
    v19 = 1030;
LABEL_45:
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", v17, v18, CFSTR("_UIPageCurl.m"), v19, CFSTR("Not implemented yet!"));

    goto LABEL_46;
  }
LABEL_31:
  MinY = CGRectGetMaxY(self->_contentRect);
LABEL_32:
  y = MinY;
LABEL_46:
  v24 = x;
  v25 = y;
  result.y = v25;
  result.x = v24;
  return result;
}

- (int64_t)_validatedPageCurlTypeForPageCurlType:(int64_t)a3 inDirection:(int64_t)a4
{
  int64_t spineLocation;

  if (a4)
  {
    if (a4 != 1 || (unint64_t)(self->_spineLocation - 1) >= 3)
      return a3;
    goto LABEL_10;
  }
  spineLocation = self->_spineLocation;
  if (spineLocation == 32 || spineLocation == 16)
  {
LABEL_10:
    if (a3 == 4 || a3 == 1)
      return 4;
    else
      return 3;
  }
  return a3;
}

- (BOOL)_isPreviousCurlCompatibleWithCurlOfType:(int64_t)a3 inDirection:(int64_t)a4
{
  void *v7;
  void *v8;
  char v9;

  -[NSMutableArray lastObject](self->_activeStateQueue, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (self->_manualPageCurlState)
  {
    v9 = 0;
  }
  else if (v7)
  {
    v9 = objc_msgSend(v7, "isCompatibleWithCurlOfType:inDirection:", -[_UIPageCurl _validatedPageCurlTypeForPageCurlType:inDirection:](self, "_validatedPageCurlTypeForPageCurlType:inDirection:", a3, a4), a4);
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)_enqueueCurlOfType:(int64_t)a3 fromLocation:(CGPoint)a4 inDirection:(int64_t)a5 withView:(id)a6 revealingView:(id)a7 completion:(id)a8 finally:(id)a9
{
  double y;
  double x;
  id v18;
  id v19;
  id v20;
  id v21;
  int64_t v22;
  int64_t v23;
  _UIPageCurlState *v24;
  void *v25;
  int v26;
  void *v27;
  double delayBetweenSuccessiveAnimations;
  void *v29;
  double v30;
  double v31;
  double v32;
  dispatch_time_t v33;
  id v34;
  _UIPageCurlState *v35;
  double v36;
  double v37;
  void *v38;
  _QWORD block[5];
  _UIPageCurlState *v40;
  id v41;

  y = a4.y;
  x = a4.x;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  if (v18)
  {
    v22 = -[_UIPageCurl _validatedPageCurlTypeForPageCurlType:inDirection:](self, "_validatedPageCurlTypeForPageCurlType:inDirection:", a3, a5);
    v23 = v22;
    if (v22 == 4 || v22 == 1)
    {
      v24 = -[_UIPageCurlState initWithPageCurl:andCurlType:fromLocation:withReferenceLocation:inDirection:withView:revealingView:completion:finally:]([_UIPageCurlState alloc], "initWithPageCurl:andCurlType:fromLocation:withReferenceLocation:inDirection:withView:revealingView:completion:finally:", self, v22, a5, v18, v19, v20, x, y, x, y, v21);
      if (!v24)
        goto LABEL_15;
    }
    else
    {
      if (-[NSMutableArray count](self->_pendingStateQueue, "count"))
        goto LABEL_15;
      if (self->_manualPageCurlState)
        goto LABEL_15;
      -[_UIPageCurl _referenceLocationForInitialLocation:direction:](self, "_referenceLocationForInitialLocation:direction:", a5, x, y);
      v24 = -[_UIPageCurlState initWithPageCurl:andCurlType:fromLocation:withReferenceLocation:inDirection:withView:revealingView:completion:finally:]([_UIPageCurlState alloc], "initWithPageCurl:andCurlType:fromLocation:withReferenceLocation:inDirection:withView:revealingView:completion:finally:", self, v23, a5, v18, v19, v20, x, y, v36, v37, v21);
      objc_storeStrong((id *)&self->_manualPageCurlState, v24);
      if (!v24)
        goto LABEL_15;
    }
    if (-[NSMutableArray count](self->_activeStateQueue, "count")
      || -[NSMutableArray count](self->_pendingStateQueue, "count"))
    {
      if (!-[NSMutableArray count](self->_pendingStateQueue, "count")
        && -[NSMutableArray count](self->_activeStateQueue, "count")
        && (-[NSMutableArray lastObject](self->_activeStateQueue, "lastObject"),
            v25 = (void *)objc_claimAutoreleasedReturnValue(),
            v26 = objc_msgSend(v25, "isCompatibleWithCurlOfType:inDirection:", -[_UIPageCurlState curlType](v24, "curlType"), -[_UITransitionState effectiveTransitionDirection](v24, "effectiveTransitionDirection")), v25, v26))
      {
        -[NSMutableArray lastObject](self->_activeStateQueue, "lastObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray _ui_enqueue:](self->_activeStateQueue, "_ui_enqueue:", v24);
        delayBetweenSuccessiveAnimations = self->_delayBetweenSuccessiveAnimations;
        objc_msgSend(v27, "beginDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "timeIntervalSinceNow");
        v31 = delayBetweenSuccessiveAnimations + v30;

        v32 = v31 * 1000000000.0;
        if (v31 <= 0.0)
          v32 = 0.0;
        v33 = dispatch_time(0, (uint64_t)v32);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __101___UIPageCurl__enqueueCurlOfType_fromLocation_inDirection_withView_revealingView_completion_finally___block_invoke;
        block[3] = &unk_1E16B47A8;
        block[4] = self;
        v40 = v24;
        v41 = v27;
        v34 = v27;
        v35 = v24;
        dispatch_after(v33, MEMORY[0x1E0C80D38], block);

      }
      else
      {
        if (-[_UIPageCurlState curlType](v24, "curlType") != 1 && -[_UIPageCurlState curlType](v24, "curlType") != 4)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPageCurl.m"), 1082, CFSTR("Attempting to enqueue a manual curl as a pending state"));

        }
        -[NSMutableArray _ui_enqueue:](self->_pendingStateQueue, "_ui_enqueue:", v24);
      }
    }
    else
    {
      -[NSMutableArray _ui_enqueue:](self->_activeStateQueue, "_ui_enqueue:", v24);
      -[_UIPageCurl _beginCurlWithState:previousState:](self, "_beginCurlWithState:previousState:", v24, 0);
    }

  }
LABEL_15:

}

- (void)_cleanupState:(id)a3
{
  objc_msgSend(a3, "cleanup");
}

- (void)_forceCleanupState:(id)a3 finished:(BOOL)a4 completed:(BOOL)a5
{
  objc_msgSend(a3, "cleanupWithFinishedState:completedState:", a4, a5);
}

- (void)_cancelTransitionWithState:(id)a3 invalidatingPageCurl:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v4 = a4;
  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (v4)
      objc_msgSend(v6, "invalidatePageCurl");
    if (objc_msgSend(v7, "curlType") == 1)
    {
      v8 = 1;
    }
    else if (objc_msgSend(v7, "curlType") == 4)
    {
      v8 = 1;
    }
    else
    {
      v8 = 5;
    }
    objc_msgSend(v7, "setCurlState:willComplete:", v8, 0);
    v9 = objc_alloc(MEMORY[0x1E0C99D20]);
    objc_msgSend(v7, "frontPageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v7;
    objc_msgSend(v7, "backPageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v9, "initWithObjects:", v11, v13, 0);

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = v14;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v33 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          -[_UIPageCurl _animationKeyPaths](self, "_animationKeyPaths");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v29;
            do
            {
              for (j = 0; j != v22; ++j)
              {
                if (*(_QWORD *)v29 != v23)
                  objc_enumerationMutation(v20);
                _UIPageCurlFilterPropertyNameForAnimationKeyPath(*(void **)(*((_QWORD *)&v28 + 1) + 8 * j));
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "removeAnimationForKey:", v25);

              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            }
            while (v22);
          }

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v16);
    }

    v7 = v26;
  }

}

- (void)_cancelAllActiveTransitionsAndAbandonCallbacks:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  -[_UIPageCurl _abortManualCurlAtLocation:withSuggestedVelocity:](self, "_abortManualCurlAtLocation:withSuggestedVelocity:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 0.0);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_activeStateQueue;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        -[_UIPageCurl _cancelTransitionWithState:invalidatingPageCurl:](self, "_cancelTransitionWithState:invalidatingPageCurl:", v10, v3, (_QWORD)v11);
        if (v3)
          objc_msgSend(v10, "finally");
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[NSMutableArray removeAllObjects](self->_pendingStateQueue, "removeAllObjects");
}

- (void)_beginCurlWithState:(id)a3 previousState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  UIView *contentView;
  void *v13;
  uint64_t v14;
  UIView *v15;
  double v16;
  double v17;
  double v18;
  long double v19;
  long double v20;
  int64_t spineLocation;
  long double v22;
  long double v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  double *v32;
  double v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  double v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  double v44;
  double v45;
  double v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "frontPageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "backPageView");
    v9 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isActive"))
    {
      objc_msgSend(v7, "frontPageView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v6, "curlType");
      contentView = self->_contentView;
      if (v11 > 2)
        -[UIView insertSubview:aboveSubview:](contentView, "insertSubview:aboveSubview:", v8, v10);
      else
        -[UIView insertSubview:belowSubview:](contentView, "insertSubview:belowSubview:", v8, v10);
      objc_msgSend(v6, "addFrontPageContent");
      if (v9)
      {
        objc_msgSend(v7, "backPageView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v6, "curlType");
        v15 = self->_contentView;
        if (v14 > 2)
          -[UIView insertSubview:belowSubview:](v15, "insertSubview:belowSubview:", v9, v13);
        else
          -[UIView insertSubview:aboveSubview:](v15, "insertSubview:aboveSubview:", v9, v13);
        objc_msgSend(v6, "addBackPageContent");

      }
    }
    else
    {
      -[UIView addSubview:](self->_contentView, "addSubview:", v8);
      objc_msgSend(v6, "addFrontPageContent");
      if (v9)
      {
        -[UIView insertSubview:aboveSubview:](self->_contentView, "insertSubview:aboveSubview:", v9, v8);
        objc_msgSend(v6, "addBackPageContent");
      }
    }
    if (objc_msgSend(v6, "curlState") == 2)
      objc_msgSend(v6, "setCurlState:willComplete:", 3, 0);
    v38 = v7;
    if (objc_msgSend(v6, "curlState", v9) == 3)
      v16 = 0.25;
    else
      v16 = 0.4;
    if (objc_msgSend(v6, "curlType") != 1 && objc_msgSend(v6, "curlType") != 4)
    {
      objc_msgSend(v8, "frame");
      v19 = v17;
      v20 = v18;
      spineLocation = self->_spineLocation;
      if (spineLocation == 4 || (spineLocation & 0x11) != 0)
      {
        v22 = v18;
        v23 = v17;
      }
      else
      {
        v22 = v17;
        v23 = v18;
      }
      self->_pageDiagonalAngle = atan2(v22, v23);
      self->_pageDiagonalLength = hypot(v19, v20);
    }
    v37 = v8;
    -[_UIPageCurl _animationKeyPaths](self, "_animationKeyPaths");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v24, "count"));
    v45 = 0.0;
    v46 = 0.0;
    v44 = 0.0;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v26 = v24;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v41 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          v39 = 0.0;
          if (objc_msgSend(v6, "curlType") == 1 || objc_msgSend(v6, "curlType") == 4)
          {
            if ((objc_msgSend(v31, "isEqualToString:", CFSTR("filters.curl.inputTime")) & 1) != 0)
            {
              v32 = &v46;
            }
            else if (objc_msgSend(v31, "isEqualToString:", CFSTR("filters.curl.inputRadius")))
            {
              v32 = &v45;
            }
            else
            {
              v32 = &v44;
            }
          }
          else
          {
            objc_msgSend(v6, "initialLocation");
            -[_UIPageCurl _updatedInputsFromState:forLocation:time:radius:angle:](self, "_updatedInputsFromState:forLocation:time:radius:angle:", v6, &v46, &v45, &v44);
            v32 = 0;
          }
          -[_UIPageCurl _fromValue:toValue:fromState:forAnimationWithKeyPath:](self, "_fromValue:toValue:fromState:forAnimationWithKeyPath:", &v39, v32, v6, v31);
          HIDWORD(v33) = HIDWORD(v39);
          *(float *)&v33 = v39;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = -[_UIPageCurl _newAnimationForState:withKeyPath:duration:fromValue:](self, "_newAnimationForState:withKeyPath:duration:fromValue:", v6, v31, v34, v16);

          objc_msgSend(v25, "addObject:", v35);
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
      }
      while (v28);
    }

    objc_msgSend(v6, "markBeginDate");
    -[_UIPageCurl _updateCurlFromState:withTime:radius:angle:addingAnimations:](self, "_updateCurlFromState:withTime:radius:angle:addingAnimations:", v6, v25, v46, v45, v44);
    if ((objc_msgSend(v6, "curlType") == 1 || objc_msgSend(v6, "curlType") == 4)
      && (objc_msgSend(v6, "hasPendingAnimations") & 1) == 0)
    {
      -[_UIPageCurl _forceCleanupState:finished:completed:](self, "_forceCleanupState:finished:completed:", v6, 1, 1);
    }

    v7 = v38;
  }

}

- (void)_updateManualCurlToLocation:(CGPoint)a3
{
  _UIPageCurlState *manualPageCurlState;
  double y;
  double x;
  double v7;
  double v8;
  double v9;

  manualPageCurlState = self->_manualPageCurlState;
  if (manualPageCurlState)
  {
    y = a3.y;
    x = a3.x;
    if (-[_UIPageCurlState curlState](manualPageCurlState, "curlState") <= 4)
    {
      v8 = 0.0;
      v9 = 0.0;
      v7 = 0.0;
      -[_UIPageCurl _updatedInputsFromState:forLocation:time:radius:angle:](self, "_updatedInputsFromState:forLocation:time:radius:angle:", self->_manualPageCurlState, &v9, &v8, &v7, x, y);
      -[_UIPageCurl _updateCurlFromState:withTime:radius:angle:addingAnimations:](self, "_updateCurlFromState:withTime:radius:angle:addingAnimations:", self->_manualPageCurlState, 0, v9, v8, v7);
    }
  }
}

- (double)_durationForManualCurlEndAnimationWithSuggestedVelocity:(double)a3 shouldComplete:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  float v23;
  double v24;
  double v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if (a3 == 0.0)
    return 0.25;
  v27 = v12;
  v28 = v5;
  v29 = v4;
  v16 = a4;
  if (a3 < 0.0)
    a3 = -a3;
  v18 = fmin(fmax(a3, 2048.0), 4096.0);
  -[_UIPageCurlState frontPageView](self->_manualPageCurlState, "frontPageView", v15, v14, v13, v27, v9, v8, v7, v6, v28, v29, v10, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "presentationLayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "valueForKeyPath:", CFSTR("filters.curl.inputTime"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "floatValue");
  v24 = v23;

  if (v16)
    v24 = 1.0 - v24;
  if (-[_UIPageCurlState curlType](self->_manualPageCurlState, "curlType") > 2)
    v24 = 1.0 - v24;
  -[_UIPageCurl _distanceToTravelWithCurrentSpineLocation](self, "_distanceToTravelWithCurrentSpineLocation");
  return v25 * v24 / v18;
}

- (void)_endManualCurlAtLocation:(CGPoint)a3 withSuggestedVelocity:(double)a4 shouldComplete:(BOOL)a5
{
  _UIPageCurlState *manualPageCurlState;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  char v16;
  double *v17;
  double *v18;
  int v19;
  int v20;
  _UIPageCurlState *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  _UIPageCurlState *v28;
  _UIPageCurlState *v29;
  uint64_t v30;
  id obj;
  void *v32;
  _BOOL4 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  double v38;
  double v39;
  double v40;
  _BYTE v41[128];
  uint64_t v42;

  v33 = a5;
  v42 = *MEMORY[0x1E0C80C00];
  manualPageCurlState = self->_manualPageCurlState;
  if (manualPageCurlState && -[_UIPageCurlState curlState](manualPageCurlState, "curlState", a3.x, a3.y) <= 4)
  {
    -[_UIPageCurlState setCurlState:willComplete:](self->_manualPageCurlState, "setCurlState:willComplete:", 5, v33);
    v39 = 0.0;
    v40 = 0.0;
    v38 = 0.0;
    -[_UIPageCurl _animationKeyPaths](self, "_animationKeyPaths");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
    -[_UIPageCurl _durationForManualCurlEndAnimationWithSuggestedVelocity:shouldComplete:](self, "_durationForManualCurlEndAnimationWithSuggestedVelocity:shouldComplete:", v33, a4);
    v10 = v9;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v8;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v35;
      v30 = *MEMORY[0x1E0CD3038];
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v35 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("filters.curl.inputTime"), v30);
          if (v33)
          {
            if ((v16 & 1) != 0)
            {
              v17 = 0;
              v18 = &v40;
            }
            else
            {
              v19 = objc_msgSend(v15, "isEqualToString:", CFSTR("filters.curl.inputRadius"));
              v17 = 0;
              if (v19)
                v18 = &v39;
              else
                v18 = &v38;
            }
          }
          else if ((v16 & 1) != 0)
          {
            v18 = 0;
            v17 = &v40;
          }
          else
          {
            v20 = objc_msgSend(v15, "isEqualToString:", CFSTR("filters.curl.inputRadius"));
            v18 = 0;
            if (v20)
              v17 = &v39;
            else
              v17 = &v38;
          }
          -[_UIPageCurl _fromValue:toValue:fromState:forAnimationWithKeyPath:](self, "_fromValue:toValue:fromState:forAnimationWithKeyPath:", v17, v18, self->_manualPageCurlState, v15);
          v21 = self->_manualPageCurlState;
          -[_UIPageCurlState frontPageView](v21, "frontPageView");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "layer");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "presentationLayer");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "valueForKeyPath:", v15);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[_UIPageCurl _newAnimationForState:withKeyPath:duration:fromValue:](self, "_newAnimationForState:withKeyPath:duration:fromValue:", v21, v15, v25, v10);

          if (objc_msgSend(v15, "isEqualToString:", CFSTR("filters.curl.inputAngle")))
          {
            objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v30);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setTimingFunction:", v27);

          }
          objc_msgSend(v32, "addObject:", v26);

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
      }
      while (v12);
    }

    v28 = self->_manualPageCurlState;
    self->_manualPageCurlState = 0;
    v29 = v28;

    -[_UITransitionState markBeginDate](v29, "markBeginDate");
    -[_UIPageCurl _updateCurlFromState:withTime:radius:angle:addingAnimations:](self, "_updateCurlFromState:withTime:radius:angle:addingAnimations:", v29, v32, v40, v39, v38);

  }
}

- (void)_completeManualCurlAtLocation:(CGPoint)a3 withSuggestedVelocity:(double)a4
{
  -[_UIPageCurl _endManualCurlAtLocation:withSuggestedVelocity:shouldComplete:](self, "_endManualCurlAtLocation:withSuggestedVelocity:shouldComplete:", 1, a3.x, a3.y, a4);
}

- (void)_abortManualCurlAtLocation:(CGPoint)a3 withSuggestedVelocity:(double)a4
{
  -[_UIPageCurl _endManualCurlAtLocation:withSuggestedVelocity:shouldComplete:](self, "_endManualCurlAtLocation:withSuggestedVelocity:shouldComplete:", 0, a3.x, a3.y, a4);
}

- (void)_pageCurlAnimationDidStop:(id)a3 withState:(id)a4
{
  id v7;
  id v8;
  NSMutableSet *completedStates;
  void *v10;
  void *v11;
  NSMutableSet *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPageCurl.m"), 1252, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state"));

  }
  if (!-[NSMutableArray count](self->_activeStateQueue, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPageCurl.m"), 1253, CFSTR("Received CA callback for state, but active state queue is empty"));

  }
  if ((objc_msgSend(v8, "hasPendingAnimations") & 1) == 0
    && (objc_msgSend(v8, "curlType") == 1 || objc_msgSend(v8, "curlType") == 4 || objc_msgSend(v8, "curlState") == 5))
  {
    -[NSMutableSet addObject:](self->_completedStates, "addObject:", v8);
    completedStates = self->_completedStates;
    -[NSMutableArray _ui_peek](self->_activeStateQueue, "_ui_peek");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(completedStates) = -[NSMutableSet containsObject:](completedStates, "containsObject:", v10);

    if ((_DWORD)completedStates)
    {
      do
      {
        -[NSMutableArray _ui_dequeue](self->_activeStateQueue, "_ui_dequeue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIPageCurl _cleanupState:](self, "_cleanupState:", v11);
        -[NSMutableSet removeObject:](self->_completedStates, "removeObject:", v11);

        v12 = self->_completedStates;
        -[NSMutableArray _ui_peek](self->_activeStateQueue, "_ui_peek");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v12) = -[NSMutableSet containsObject:](v12, "containsObject:", v13);

      }
      while ((v12 & 1) != 0);
    }
    if (!-[NSMutableArray count](self->_activeStateQueue, "count")
      && -[NSMutableArray count](self->_pendingStateQueue, "count"))
    {
      v21[0] = 0;
      v21[1] = v21;
      v21[2] = 0x3032000000;
      v21[3] = __Block_byref_object_copy__53;
      v21[4] = __Block_byref_object_dispose__53;
      v22 = 0;
      v14 = (void *)-[NSMutableArray copy](self->_pendingStateQueue, "copy");
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __51___UIPageCurl__pageCurlAnimationDidStop_withState___block_invoke;
      v18[3] = &unk_1E16C0ED0;
      v20 = v21;
      v18[4] = self;
      v15 = v14;
      v19 = v15;
      objc_msgSend(v15, "enumerateObjectsUsingBlock:", v18);

      _Block_object_dispose(v21, 8);
    }
  }

}

- (int64_t)_spineLocation
{
  return self->_spineLocation;
}

- (double)_manualPageCurlMaxDAngle
{
  return self->_manualPageCurlMaxDAngle;
}

- (void)_setManualPageCurlMaxDAngle:(double)a3
{
  self->_manualPageCurlMaxDAngle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedStates, 0);
  objc_storeStrong((id *)&self->_activeStateQueue, 0);
  objc_storeStrong((id *)&self->_pendingStateQueue, 0);
  objc_storeStrong((id *)&self->_manualPageCurlState, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
