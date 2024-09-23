@implementation PKStroke

- (double)crl_maximumActualWidth
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  CGFloat y;
  CGFloat x;
  CGFloat width;
  CGFloat height;
  id v32;
  id v33;
  void *v34;
  id v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  CGFloat v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  double v64;
  double v65;
  CGFloat v66;
  double v68;
  CGFloat r1;
  CGFloat v70;
  CGFloat v71;
  _BYTE v72[48];
  _QWORD v73[2];
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKStroke path](self, "path"));
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0x7FFFFFFFFFFFFFFFLL;
    v8 = 0.0;
    v9 = 0.0;
    v10 = 0x7FFFFFFFFFFFFFFFLL;
    v11 = 0.0;
    v12 = 0x7FFFFFFFFFFFFFFFLL;
    v13 = 0.0;
    v14 = 0x7FFFFFFFFFFFFFFFLL;
    v15 = 0.0;
    v16 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v6));
      objc_msgSend(v17, "size");
      if (v18 > v8)
      {
        v7 = v6;
        v8 = v18;
      }
      if (v19 > v9)
      {
        v10 = v6;
        v9 = v19;
      }
      objc_msgSend(v17, "force");
      if (v20 > v11)
      {
        objc_msgSend(v17, "force");
        v11 = v21;
        v12 = v6;
      }
      objc_msgSend(v17, "_edgeWidth");
      if (v22 > v13)
      {
        objc_msgSend(v17, "_edgeWidth");
        v13 = v23;
        v14 = v6;
      }
      objc_msgSend(v17, "_radius2");
      if (v24 > v15)
      {
        objc_msgSend(v17, "_radius2");
        v15 = v25;
        v16 = v6;
      }

      ++v6;
    }
    while (v5 != (id)v6);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
    v27 = v26;
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v26, "addIndex:", v7);
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v27, "addIndex:", v10);
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v27, "addIndex:", v12);
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v27, "addIndex:", v14);
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v27, "addIndex:", v16);
    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
    v32 = objc_msgSend(v27, "firstIndex");
    if (v32 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v33 = v32;
      v68 = CGPointZero.y;
      do
      {
        r1 = height;
        v70 = y;
        v71 = x;
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v33));
        v35 = objc_alloc((Class)PKStrokePoint);
        objc_msgSend(v34, "size");
        v37 = v36;
        v39 = v38;
        objc_msgSend(v34, "opacity");
        v41 = v40;
        objc_msgSend(v34, "force");
        v43 = v42;
        objc_msgSend(v34, "azimuth");
        v45 = v44;
        objc_msgSend(v34, "altitude");
        v47 = v46;
        objc_msgSend(v34, "_edgeWidth");
        v48 = width;
        v50 = v49;
        objc_msgSend(v34, "_radius2");
        v52 = objc_msgSend(v35, "initWithLocation:timeOffset:size:opacity:force:azimuth:altitude:edgeWidth:radius2:", CGPointZero.x, v68, 0.0, v37, v39, v41, v43, v45, v47, v50, v51);
        v53 = objc_alloc((Class)PKStrokePath);
        v73[0] = v52;
        v73[1] = v52;
        v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v73, 2));
        v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        v56 = objc_msgSend(v53, "initWithControlPoints:creationDate:", v54, v55);

        v57 = objc_alloc((Class)PKStroke);
        v58 = (void *)objc_claimAutoreleasedReturnValue(-[PKStroke ink](self, "ink"));
        -[PKStroke transform](self, "transform");
        v59 = objc_msgSend(v57, "initWithInk:strokePath:transform:mask:", v58, v56, v72, 0);

        objc_msgSend(v59, "renderBounds");
        v79.origin.x = v60;
        v79.origin.y = v61;
        v79.size.width = v62;
        v79.size.height = v63;
        v74.origin.y = v70;
        v74.origin.x = v71;
        v74.size.width = v48;
        v74.size.height = r1;
        v75 = CGRectUnion(v74, v79);
        x = v75.origin.x;
        y = v75.origin.y;
        width = v75.size.width;
        height = v75.size.height;
        v33 = objc_msgSend(v27, "indexGreaterThanIndex:", v33);

      }
      while (v33 != (id)0x7FFFFFFFFFFFFFFFLL);
    }
    v76.origin.x = x;
    v76.origin.y = y;
    v76.size.width = width;
    v76.size.height = height;
    v64 = 0.0;
    if (!CGRectIsNull(v76))
    {
      v77.origin.x = x;
      v77.origin.y = y;
      v77.size.width = width;
      v77.size.height = height;
      v65 = CGRectGetWidth(v77);
      v78.origin.x = x;
      v78.origin.y = y;
      v78.size.width = width;
      v78.size.height = height;
      v66 = CGRectGetHeight(v78);
      v64 = sqrt(v65 * v65 + v66 * v66);
    }

  }
  else
  {
    v64 = 0.0;
  }

  return v64;
}

- (id)crl_strokeForTracingWithOutset:(double)a3 shouldIgnoreMask:(BOOL)a4
{
  void *v7;
  char *v8;
  char *v9;
  double v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  char *i;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
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
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  PKStroke *v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  double v57;
  double v58;
  double v59;
  double v60;
  char v61[48];
  double v62[7];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKStroke path](self, "path"));
  v8 = (char *)objc_msgSend(v7, "count");
  if (v8)
  {
    v9 = v8;
    -[PKStroke transform](self, "transform");
    v10 = sub_10007922C(v62);
    if (v10 == 0.0)
    {
      v11 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101234168);
      v12 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF4948(v11, v12);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101234188);
      v13 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE81F0(v13, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PKStroke(CRLAdditions) crl_strokeForTracingWithOutset:shouldIgnoreMask:]"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/PKStroke_CRLAdditions.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 153, 0, "the scale on a PKStroke should not be 0");

      v10 = 1.0;
    }
    v57 = a3;
    v58 = a3 / v10 + a3 / v10;
    v16 = objc_opt_new(NSMutableArray);
    for (i = 0; i != v9; ++i)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", i));
      objc_msgSend(v18, "size");
      v20 = v58 + v19;
      if (v20 < 3.0)
        v20 = 3.0;
      v60 = v20;
      objc_msgSend(v18, "size");
      v22 = v58 + v21;
      if (v58 + v21 < 3.0)
        v22 = 3.0;
      v59 = v22;
      v23 = objc_alloc((Class)PKStrokePoint);
      objc_msgSend(v18, "location");
      v25 = v24;
      v27 = v26;
      objc_msgSend(v18, "timeOffset");
      v29 = v28;
      objc_msgSend(v18, "opacity");
      v31 = v30;
      objc_msgSend(v18, "force");
      v33 = v32;
      objc_msgSend(v18, "azimuth");
      v35 = v34;
      objc_msgSend(v18, "altitude");
      v37 = v36;
      objc_msgSend(v18, "_edgeWidth");
      v39 = v38;
      objc_msgSend(v18, "_radius2");
      v41 = objc_msgSend(v23, "initWithLocation:timeOffset:size:opacity:force:azimuth:altitude:edgeWidth:radius2:", v25, v27, v29, v60, v59, v31, v33, v35, v37, v39, v40);
      -[NSMutableArray addObject:](v16, "addObject:", v41);

    }
    v42 = objc_alloc((Class)PKStrokePath);
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "creationDate"));
    v44 = objc_msgSend(v42, "initWithControlPoints:creationDate:", v16, v43);

    v45 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "UIColor"));

    v47 = objc_msgSend(objc_alloc((Class)PKInk), "initWithInkType:color:", PKInkTypePen, v46);
    if (a4)
    {
      v48 = 0;
      v49 = 0;
    }
    else
    {
      v49 = (id)objc_claimAutoreleasedReturnValue(-[PKStroke mask](self, "mask"));

      if (v49
        && (v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[PKStroke mask](self, "mask"))),
            v52 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", objc_msgSend(v51, "CGPath"))), v51, v49 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "bezierPathByOffsettingPath:joinStyle:", 1, v57)), v52, v49))
      {
        v49 = objc_retainAutorelease(v49);
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:", objc_msgSend(v49, "CGPath")));
      }
      else
      {
        v48 = 0;
      }
    }
    v53 = objc_alloc((Class)PKStroke);
    -[PKStroke transform](self, "transform");
    v54 = objc_msgSend(v53, "initWithInk:strokePath:transform:mask:", v47, v44, v61, v48);
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[PKStroke _renderGroupID](self, "_renderGroupID"));
    objc_msgSend(v54, "_setRenderGroupID:", v55);

    -[PKStroke crl_anchorPointForTexture](self, "crl_anchorPointForTexture");
    v50 = (PKStroke *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "crl_copyWithNewAnchorPointForTexture:"));

  }
  else
  {
    v50 = self;
  }

  return v50;
}

- (id)crl_strokeByAppendingTransform:(CGAffineTransform *)a3
{
  __int128 v5;
  __int128 v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  CGAffineTransform v16;
  CGAffineTransform t1;
  CGAffineTransform v18;

  v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v18.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v18.c = v5;
  *(_OWORD *)&v18.tx = *(_OWORD *)&a3->tx;
  if (CGAffineTransformIsIdentity(&v18))
    return -[PKStroke copy](self, "copy");
  memset(&v18, 0, sizeof(v18));
  -[PKStroke transform](self, "transform");
  v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v16.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v16.c = v7;
  *(_OWORD *)&v16.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v18, &t1, &v16);
  v8 = objc_alloc((Class)PKStroke);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKStroke ink](self, "ink"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PKStroke path](self, "path"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PKStroke mask](self, "mask"));
  v12 = -[PKStroke randomSeed](self, "randomSeed");
  v16 = v18;
  v13 = objc_msgSend(v8, "initWithInk:strokePath:transform:mask:randomSeed:", v9, v10, &v16, v11, v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PKStroke _renderGroupID](self, "_renderGroupID"));
  objc_msgSend(v13, "_setRenderGroupID:", v14);

  objc_msgSend(v13, "_setFlags:", -[PKStroke _flags](self, "_flags"));
  -[PKStroke crl_anchorPointForTexture](self, "crl_anchorPointForTexture");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "crl_copyWithNewAnchorPointForTexture:"));

  return v15;
}

+ (id)crl_strokePathsExcludingNonMaskedPathRangesForPKStroke:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  double v13;
  unint64_t v14;
  double v15;
  unint64_t v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "maskedPathRanges"));
  v24 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "lowerBound");
        v14 = vcvtpd_u64_f64(v13);
        objc_msgSend(v12, "upperBound");
        v16 = (unint64_t)v15;
        v17 = objc_alloc_init((Class)NSMutableArray);
        while (v14 <= v16)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v14));
          objc_msgSend(v17, "addObject:", v18);

          ++v14;
        }
        if (objc_msgSend(v17, "count"))
        {
          v19 = objc_alloc((Class)PKStrokePath);
          v20 = objc_msgSend(v17, "copy");
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "creationDate"));
          v22 = objc_msgSend(v19, "initWithControlPoints:creationDate:", v20, v21);

          objc_msgSend(v4, "addObject:", v22);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

  return v4;
}

- (id)crl_copyWithNewAnchorPointForTexture:(CGPoint)a3
{
  double y;
  double x;
  id v6;

  y = a3.y;
  x = a3.x;
  if ((objc_opt_respondsToSelector(self, "copyWithNewAnchorPointForTexture:") & 1) != 0)
    v6 = -[PKStroke copyWithNewAnchorPointForTexture:](self, "copyWithNewAnchorPointForTexture:", x, y);
  else
    v6 = -[PKStroke copy](self, "copy");
  return v6;
}

- (CGPoint)crl_anchorPointForTexture
{
  double x;
  double y;
  CGPoint result;

  if ((objc_opt_respondsToSelector(self, "_anchorPointForTexture") & 1) != 0)
  {
    -[PKStroke _anchorPointForTexture](self, "_anchorPointForTexture");
  }
  else
  {
    x = CGPointZero.x;
    y = CGPointZero.y;
  }
  result.y = y;
  result.x = x;
  return result;
}

@end
