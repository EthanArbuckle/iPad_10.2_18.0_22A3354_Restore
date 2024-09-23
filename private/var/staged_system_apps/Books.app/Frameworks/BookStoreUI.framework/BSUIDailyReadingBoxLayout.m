@implementation BSUIDailyReadingBoxLayout

- (BSUIDailyReadingBoxLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  BSUIDailyReadingBoxLayout *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BSUIDailyReadingBoxLayout;
  result = -[BSUIDailyReadingBoxLayout initWithModel:parent:controller:](&v6, "initWithModel:parent:controller:", a3, a4, a5);
  if (result)
    result->_intrinsicContentSize = CGSizeZero;
  return result;
}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BSUIDailyReadingLayerConfig *v18;
  void *v19;
  void *v20;
  _BSUIDailyReadingLayerConfig *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v27[5];
  CGAffineTransform v28;
  CGAffineTransform v29;

  v6 = a4;
  if (a3 < 3)
  {
    v23 = 0;
  }
  else
  {
    -[BSUIDailyReadingBoxLayout renderModelSizeWithContext:](self, "renderModelSizeWithContext:", v6);
    v8 = v7;
    v10 = v9;
    v11 = objc_alloc_init((Class)NSMutableArray);
    -[BSUIDailyReadingBoxLayout computedNaturalSize](self, "computedNaturalSize");
    memset(&v29, 0, sizeof(v29));
    CGAffineTransformMakeTranslation(&v29, v12 * 0.5, v13 * 0.5);
    v28 = v29;
    -[BSUIDailyReadingBoxLayout appendChildRenderModelCompatibleWithKind:context:transform:toModels:](self, "appendChildRenderModelCompatibleWithKind:context:transform:toModels:", 3, v6, &v28, v11);
    v28.a = 0.0;
    *(_QWORD *)&v28.b = &v28;
    *(_QWORD *)&v28.c = 0x3032000000;
    *(_QWORD *)&v28.d = sub_37008;
    *(_QWORD *)&v28.tx = sub_37018;
    *(_QWORD *)&v28.ty = objc_alloc_init((Class)NSMutableArray);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_37020;
    v27[3] = &unk_2E5580;
    v27[4] = &v28;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v27);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingBoxLayout controller](self, "controller"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "manager"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "resourceRegistry"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fileProviderForKind:", CFSTR("mica-provider")));

    v18 = [_BSUIDailyReadingLayerConfig alloc];
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingBoxLayout box](self, "box"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dailyReadingMetrics"));
    v21 = -[_BSUIDailyReadingLayerConfig initWithMetrics:timeTextYOffset:micaFileProvider:](v18, "initWithMetrics:timeTextYOffset:micaFileProvider:", v20, v17, self->_timeTextYOffset);

    v22 = objc_alloc((Class)TUIRenderModelLayer);
    v23 = objc_msgSend(v22, "initWithSubmodels:config:erasableInsets:", *(_QWORD *)(*(_QWORD *)&v28.b + 40), v21, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    objc_msgSend(v23, "setSize:", v8, v10);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingBoxLayout box](self, "box"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "identifier"));
    objc_msgSend(v23, "setIdentifier:", v25);

    _Block_object_dispose(&v28, 8);
  }

  return v23;
}

- (double)computeIntrinsicAspectRatio
{
  double width;
  double result;

  -[BSUIDailyReadingBoxLayout _computeIntrinsicContentSize](self, "_computeIntrinsicContentSize");
  width = self->_intrinsicContentSize.width;
  result = 1.0;
  if (width > 0.0)
    result = self->_intrinsicContentSize.height / width;
  if (result < 0.5)
    return 0.5;
  return result;
}

- (double)_endCapHeight
{
  void *v2;
  void *v3;
  void *v4;
  float v5;
  double v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingBoxLayout box](self, "box"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dailyReadingMetrics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "progressBarWidth"));
  objc_msgSend(v4, "floatValue");
  v6 = v5 * 0.5;

  return v6;
}

- (double)arcRadius
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  double v9;

  -[BSUIDailyReadingBoxLayout _specifiedOrContainingWidth](self, "_specifiedOrContainingWidth");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingBoxLayout box](self, "box"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dailyReadingMetrics"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "progressBarWidth"));
  objc_msgSend(v7, "floatValue");
  v9 = v4 - (float)(v8 + v8);

  return v9 * 0.5;
}

- (double)highestPointOfArcForWidth:(double)a3
{
  double result;
  double v5;

  -[BSUIDailyReadingBoxLayout arcRadius](self, "arcRadius");
  v5 = result - sqrt(result * result - a3 * 0.5 * (a3 * 0.5));
  if (v5 < result)
    return v5;
  return result;
}

- (double)chordLengthAtHeightFromTop:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v9;

  -[BSUIDailyReadingBoxLayout _specifiedOrContainingWidth](self, "_specifiedOrContainingWidth");
  v6 = v5;
  -[BSUIDailyReadingBoxLayout arcRadius](self, "arcRadius");
  if (a3 > 0.0 && v7 > a3)
  {
    v9 = sqrt((v7 + v7) * a3 - a3 * a3);
    return v9 + v9;
  }
  return v6;
}

- (double)maximumDefaultYForLayout
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  double v17;
  double v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingBoxLayout box](self, "box"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dailyReadingMetrics"));
  v5 = objc_msgSend(v4, "useLargeLayoutMode");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingBoxLayout box](self, "box"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dailyReadingMetrics"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "progressBarWidth"));
    objc_msgSend(v8, "floatValue");
    v10 = v9 + 162.0;

  }
  else
  {
    -[BSUIDailyReadingBoxLayout arcRadius](self, "arcRadius");
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingBoxLayout box](self, "box"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dailyReadingMetrics"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "progressBarWidth"));
    objc_msgSend(v15, "floatValue");
    v17 = v12 + v16;

    -[BSUIDailyReadingBoxLayout _endCapHeight](self, "_endCapHeight");
    v10 = v17 + v18 + -1.0;
  }
  return ceil(v10);
}

- (double)minimumTextSeparation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingBoxLayout box](self, "box"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dailyReadingMetrics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "axValue"));
  v6 = objc_msgSend(v5, "integerValue");

  v7 = 10.0;
  if ((unint64_t)v6 >= 5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingBoxLayout box](self, "box"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dailyReadingMetrics"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "axValue"));
    objc_msgSend(v10, "floatValue");
    v7 = v11 * 0.25 * 10.0;

  }
  return v7;
}

- (double)_specifiedOrContainingWidth
{
  double v3;
  double v4;
  float v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  double result;

  -[BSUIDailyReadingBoxLayout containingWidth](self, "containingWidth");
  v4 = v3;
  v5 = COERCE_FLOAT(-[BSUIDailyReadingBoxLayout specifiedWidth](self, "specifiedWidth"));
  if (v4 >= v5)
    v6 = v5;
  else
    v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingBoxLayout box](self, "box"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dailyReadingMetrics"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "arcWidth"));
  objc_msgSend(v9, "floatValue");
  v11 = v10;

  result = v11;
  if (v6 < v11)
    result = v6;
  if (v11 <= 0.0)
    return v6;
  return result;
}

- (void)onInvalidateIntrinsicSize
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BSUIDailyReadingBoxLayout;
  -[BSUIDailyReadingBoxLayout onInvalidateIntrinsicSize](&v3, "onInvalidateIntrinsicSize");
  self->_intrinsicContentSize = CGSizeZero;
}

- (void)_computeIntrinsicContentSize
{
  CGSize *p_intrinsicContentSize;
  double height;
  double v6;
  CGFloat v7;
  CGFloat v8;

  p_intrinsicContentSize = &self->_intrinsicContentSize;
  height = CGSizeZero.height;
  if (CGSizeZero.width == self->_intrinsicContentSize.width && height == self->_intrinsicContentSize.height)
  {
    -[BSUIDailyReadingBoxLayout _specifiedOrContainingWidth](self, "_specifiedOrContainingWidth", CGSizeZero.width, height);
    v7 = v6;
    v8 = COERCE_FLOAT(-[BSUIDailyReadingBoxLayout specifiedHeight](self, "specifiedHeight"));
    p_intrinsicContentSize->width = v7;
    p_intrinsicContentSize->height = v8;
  }
}

- (void)_layoutToBaseOfControlIfPossible
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;

  v25 = (id)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingBoxLayout box](self, "box"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "dailyReadingMetrics"));
  if ((objc_msgSend(v3, "iconMode") & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingBoxLayout children](self, "children"));
    v5 = objc_msgSend(v4, "count");

    if ((unint64_t)v5 < 3)
      return;
    v6 = objc_opt_class(TUILayout);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingBoxLayout children](self, "children"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", 0));
    v9 = BUDynamicCast(v6, v8);
    v25 = (id)objc_claimAutoreleasedReturnValue(v9);

    v10 = objc_opt_class(TUILayout);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingBoxLayout children](self, "children"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", 1));
    v13 = BUDynamicCast(v10, v12);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v13);

    v14 = objc_opt_class(TUILayout);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingBoxLayout children](self, "children"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndex:", 2));
    v17 = BUDynamicCast(v14, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    objc_msgSend(v18, "computedOrigin");
    v20 = v19;
    objc_msgSend(v18, "computedNaturalSize");
    v22 = v20 + v21;
    -[BSUIDailyReadingBoxLayout maximumDefaultYForLayout](self, "maximumDefaultYForLayout");
    if (v22 < v23)
    {
      v24 = v23 - v22;
      objc_msgSend(v25, "computedOrigin");
      objc_msgSend(v25, "setComputedOrigin:");
      objc_msgSend(v3, "computedOrigin");
      objc_msgSend(v3, "setComputedOrigin:");
      objc_msgSend(v18, "computedOrigin");
      objc_msgSend(v18, "setComputedOrigin:");
      self->_timeTextYOffset = v24 + self->_timeTextYOffset;
    }

  }
}

- (double)_layoutAndComputeIntrinsicHeight
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  int *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  unsigned int v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  float v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  float v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  unsigned int v38;
  float v39;
  int v40;
  float v41;
  int v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  uint64_t v53;
  unsigned int v54;
  float v55;
  int v56;
  float v57;
  int v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  uint64_t v76;
  double v77;
  unsigned int v78;
  float v79;
  int v80;
  float v81;
  int v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  CGRect v92;

  -[BSUIDailyReadingBoxLayout _specifiedOrContainingWidth](self, "_specifiedOrContainingWidth");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingBoxLayout box](self, "box"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dailyReadingMetrics"));
  if ((objc_msgSend(v6, "iconMode") & 1) != 0)
  {
LABEL_68:

    return v4;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingBoxLayout children](self, "children"));
  v8 = (int *)objc_msgSend(v7, "count");

  if (v8 == &dword_4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingBoxLayout box](self, "box"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dailyReadingMetrics"));
    v11 = objc_msgSend(v10, "isAX");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingBoxLayout box](self, "box"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dailyReadingMetrics"));
    v14 = objc_msgSend(v13, "useNarrowLayoutMode");

    -[BSUIDailyReadingBoxLayout minimumTextSeparation](self, "minimumTextSeparation");
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingBoxLayout children](self, "children"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndex:", 0));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "box"));
    objc_msgSend(v5, "invalidateLayout");
    objc_msgSend(v5, "validateLayout");
    -[BSUIDailyReadingBoxLayout arcRadius](self, "arcRadius");
    v20 = v19;
    -[BSUIDailyReadingBoxLayout highestPointOfArcForWidth:](self, "highestPointOfArcForWidth:", COERCE_FLOAT(objc_msgSend(v5, "computedWidth")));
    v22 = v21;
    if (v14)
      v23 = 10.0;
    else
      v23 = 15.0;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingBoxLayout box](self, "box"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "dailyReadingMetrics"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "progressBarWidth"));
    objc_msgSend(v26, "floatValue");
    v28 = v22 + v23 + v27;

    if (v28 > v20)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingBoxLayout box](self, "box"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "dailyReadingMetrics"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "progressBarWidth"));
      objc_msgSend(v31, "floatValue");
      v28 = v20 + v32 + 10.0;

    }
    v33 = 4286578687;
    -[BSUIDailyReadingBoxLayout chordLengthAtHeightFromTop:](self, "chordLengthAtHeightFromTop:", v28);
    v35 = v34;
    objc_msgSend(v18, "setAllowShrinkToFit:", 1);
    v36 = v35 * 0.5;
    v37 = 4286578687;
    if (v35 > -3.40282347e38)
    {
      v37 = 2139095039;
      if (v35 < 3.40282347e38)
      {
        *(float *)&v38 = v35;
        v37 = v38;
      }
    }
    if (v36 <= -3.40282347e38)
    {
      *(float *)&v40 = -3.4028e38;
    }
    else
    {
      if (v36 < 3.40282347e38)
      {
        v39 = v36;
        goto LABEL_17;
      }
      *(float *)&v40 = 3.4028e38;
    }
    v39 = *(float *)&v40;
LABEL_17:
    if (v35 <= -3.40282347e38)
    {
      *(float *)&v42 = -3.4028e38;
    }
    else
    {
      if (v35 < 3.40282347e38)
      {
        v41 = v35;
LABEL_23:
        objc_msgSend(v18, "setWidth:", v37 | ((unint64_t)LODWORD(v39) << 32), LODWORD(v41) | 0xF000000000000);
        objc_msgSend(v5, "computedNaturalSize");
        objc_msgSend(v5, "setComputedNaturalSize:", v35);
        objc_msgSend(v5, "invalidateLayout");
        objc_msgSend(v5, "validateLayout");
        objc_msgSend(v5, "computedNaturalSize");
        v44 = v43;
        v45 = v4 * 0.5;
        objc_msgSend(v5, "setComputedOrigin:", floor(v4 * 0.5 - v46 * 0.5), floor(v28));
        v47 = v28 + v44;

        v48 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingBoxLayout children](self, "children"));
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectAtIndex:", 1));

        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "box"));
        objc_msgSend(v6, "invalidateLayout");
        objc_msgSend(v6, "validateLayout");
        -[BSUIDailyReadingBoxLayout chordLengthAtHeightFromTop:](self, "chordLengthAtHeightFromTop:", v28 + v44);
        v51 = v50;
        objc_msgSend(v49, "setAllowShrinkToFit:", 1);
        objc_msgSend(v49, "setMaxLines:", 1);
        v52 = v51 * 0.5;
        v53 = 4286578687;
        if (v51 > -3.40282347e38)
        {
          v53 = 2139095039;
          if (v51 < 3.40282347e38)
          {
            *(float *)&v54 = v51;
            v53 = v54;
          }
        }
        if (v52 <= -3.40282347e38)
        {
          *(float *)&v56 = -3.4028e38;
        }
        else
        {
          if (v52 < 3.40282347e38)
          {
            v55 = v52;
            goto LABEL_32;
          }
          *(float *)&v56 = 3.4028e38;
        }
        v55 = *(float *)&v56;
LABEL_32:
        if (v51 <= -3.40282347e38)
        {
          *(float *)&v58 = -3.4028e38;
        }
        else
        {
          if (v51 < 3.40282347e38)
          {
            v57 = v51;
            goto LABEL_38;
          }
          *(float *)&v58 = 3.4028e38;
        }
        v57 = *(float *)&v58;
LABEL_38:
        objc_msgSend(v49, "setWidth:", v53 | ((unint64_t)LODWORD(v55) << 32), LODWORD(v57) | 0xF000000000000);
        objc_msgSend(v6, "computedNaturalSize");
        if (v59 > v51)
          v59 = v51;
        objc_msgSend(v6, "setComputedNaturalSize:", v59);
        objc_msgSend(v6, "invalidateLayout");
        objc_msgSend(v6, "validateLayout");
        objc_msgSend(v6, "computedNaturalSize");
        v61 = v60;
        v63 = v45 - v62 * 0.5;
        v64 = v16 + v60;
        v65 = 57.0;
        if (!v14)
          v65 = 66.0;
        v66 = v65 - v61;
        if (v64 >= 66.0)
          v67 = v16;
        else
          v67 = v66;
        v68 = v47 + v67;
        v69 = floor(v47 + v67);
        objc_msgSend(v6, "setComputedOrigin:", floor(v63), v69);
        self->_timeTextYOffset = v69;
        v70 = v61 + v68;

        v71 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingBoxLayout children](self, "children"));
        v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectAtIndex:", 2));

        v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "box"));
        objc_msgSend(v72, "invalidateLayout");
        objc_msgSend(v72, "validateLayout");
        -[BSUIDailyReadingBoxLayout chordLengthAtHeightFromTop:](self, "chordLengthAtHeightFromTop:", v61 + v68);
        v75 = v74;
        if (v11)
          v76 = 2;
        else
          v76 = 1;
        objc_msgSend(v73, "setMaxLines:", v76);
        v77 = v75 * 0.5;
        if (v75 > -3.40282347e38)
        {
          v33 = 2139095039;
          if (v75 < 3.40282347e38)
          {
            *(float *)&v78 = v75;
            v33 = v78;
          }
        }
        if (v77 <= -3.40282347e38)
        {
          *(float *)&v80 = -3.4028e38;
        }
        else
        {
          if (v77 < 3.40282347e38)
          {
            v79 = v77;
            goto LABEL_57;
          }
          *(float *)&v80 = 3.4028e38;
        }
        v79 = *(float *)&v80;
LABEL_57:
        if (v75 <= -3.40282347e38)
        {
          *(float *)&v82 = -3.4028e38;
        }
        else
        {
          if (v75 < 3.40282347e38)
          {
            v81 = v75;
LABEL_63:
            objc_msgSend(v73, "setWidth:", v33 | ((unint64_t)LODWORD(v79) << 32), LODWORD(v81) | 0xF000000000000);
            objc_msgSend(v72, "computedNaturalSize");
            objc_msgSend(v72, "setComputedNaturalSize:", v75);
            objc_msgSend(v72, "invalidateLayout");
            objc_msgSend(v72, "validateLayout");
            objc_msgSend(v72, "computedNaturalSize");
            v84 = v45 + v83 * -0.5;
            v86 = v16 + v85;
            v87 = 24.0 - v85;
            if (v86 >= 24.0)
              v87 = v16;
            objc_msgSend(v72, "setComputedOrigin:", floor(v84), floor(v70 + v87));

            -[BSUIDailyReadingBoxLayout maximumDefaultYForLayout](self, "maximumDefaultYForLayout");
            v89 = v88;
            objc_msgSend(v72, "computedFrame");
            v90 = ceil(CGRectGetMaxY(v92));
            if (v90 < v89)
              v90 = v89;
            v4 = v16 + v90;

            goto LABEL_68;
          }
          *(float *)&v82 = 3.4028e38;
        }
        v81 = *(float *)&v82;
        goto LABEL_63;
      }
      *(float *)&v42 = 3.4028e38;
    }
    v41 = *(float *)&v42;
    goto LABEL_23;
  }
  return v4;
}

- ($C9FAB8CAB2AF31EF60403A04CE35D411)computeIntrinsicHeight
{
  double height;
  unsigned int v5;
  uint64_t v7;

  -[BSUIDailyReadingBoxLayout _computeIntrinsicContentSize](self, "_computeIntrinsicContentSize");
  height = self->_intrinsicContentSize.height;
  if (height <= -3.40282347e38)
  {
    v7 = 4286578687;
  }
  else
  {
    if (height < 3.40282347e38)
    {
      *(float *)&v5 = height;
      return ($C9FAB8CAB2AF31EF60403A04CE35D411 *)(v5 | 0x7FC0000000000000);
    }
    v7 = 2139095039;
  }
  return ($C9FAB8CAB2AF31EF60403A04CE35D411 *)(v7 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
}

- (void)computeLayout
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double width;
  double height;
  objc_super v12;

  -[BSUIDailyReadingBoxLayout _specifiedOrContainingWidth](self, "_specifiedOrContainingWidth");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingBoxLayout box](self, "box", 350.0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dailyReadingMetrics"));
  objc_msgSend(v6, "setUseLargeLayoutMode:", v4 >= 350.0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingBoxLayout box](self, "box", 256.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dailyReadingMetrics"));
  objc_msgSend(v8, "setUseNarrowLayoutMode:", v4 <= 256.0);

  v12.receiver = self;
  v12.super_class = (Class)BSUIDailyReadingBoxLayout;
  -[BSUIDailyReadingBoxLayout computeLayout](&v12, "computeLayout");
  width = CGSizeZero.width;
  height = CGSizeZero.height;
  if (CGSizeZero.width == self->_intrinsicContentSize.width && height == self->_intrinsicContentSize.height)
    -[BSUIDailyReadingBoxLayout _layoutAndComputeIntrinsicHeight](self, "_layoutAndComputeIntrinsicHeight", CGSizeZero.width, height);
  -[BSUIDailyReadingBoxLayout _layoutToBaseOfControlIfPossible](self, "_layoutToBaseOfControlIfPossible", width, height);
}

- (BOOL)validatesAllChildren
{
  return 0;
}

@end
