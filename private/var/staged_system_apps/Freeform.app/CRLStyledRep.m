@implementation CRLStyledRep

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  NSString *v18;
  void *v19;
  void *v20;
  CGRect v22;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  v8 = (objc_class *)objc_opt_class(v6, v7);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v14 = (objc_class *)objc_opt_class(v12, v13);
  v15 = NSStringFromClass(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  -[CRLCanvasRep frameInUnscaledCanvas](self, "frameInUnscaledCanvas");
  v18 = NSStringFromCGRect(v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p info=<%@ %p> layout=<%@ %p> frameInUnscaledCanvas=%@>"), v5, self, v10, v11, v16, v17, v19));

  return (NSString *)v20;
}

- (CGRect)clipRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[CRLStyledRep clipRectWithoutEffects](self, "clipRectWithoutEffects");
  -[CRLStyledRep rectWithEffectsAppliedToRect:](self, "rectWithEffectsAppliedToRect:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)p_clipRectInRootForTransform:(CGAffineTransform *)a3 includeShadow:(BOOL)a4
{
  _BOOL8 v4;
  __int128 v7;
  __int128 v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGAffineTransform v13;
  CGRect v14;
  CGRect v15;
  CGRect result;

  v4 = a4;
  -[CRLStyledRep clipRectWithoutEffects](self, "clipRectWithoutEffects");
  v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v13.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v13.c = v7;
  *(_OWORD *)&v13.tx = *(_OWORD *)&a3->tx;
  v15 = CGRectApplyAffineTransform(v14, &v13);
  v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v13.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v13.c = v8;
  *(_OWORD *)&v13.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  -[CRLStyledRep p_rectWithEffectsAppliedToRect:additionalTransform:includeShadow:](self, "p_rectWithEffectsAppliedToRect:additionalTransform:includeShadow:", &v13, v4, v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (double)opacity
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledRep styledLayout](self, "styledLayout"));
  objc_msgSend(v2, "opacity");
  v4 = v3;

  return v4;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return +[NSNull null](NSNull, "null", a3, a4);
}

- (CGRect)rectWithEffectsAppliedToRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "transformInRoot");
  else
    memset(&v22, 0, sizeof(v22));
  CGAffineTransformInvert(&v23, &v22);
  -[CRLStyledRep p_rectWithEffectsAppliedToRect:additionalTransform:includeShadow:](self, "p_rectWithEffectsAppliedToRect:additionalTransform:includeShadow:", &v23, 1, x, y, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)p_rectWithEffectsAppliedToRect:(CGRect)a3 additionalTransform:(CGAffineTransform *)a4 includeShadow:(BOOL)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  __int128 v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _OWORD v24[3];
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a5)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
    v12 = objc_opt_respondsToSelector(v11, "shadow");

    if ((v12 & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledRep shadow](self, "shadow"));
      v14 = v13;
      if (v13 && objc_msgSend(v13, "isEnabled"))
      {
        v15 = *(_OWORD *)&a4->c;
        v24[0] = *(_OWORD *)&a4->a;
        v24[1] = v15;
        v24[2] = *(_OWORD *)&a4->tx;
        objc_msgSend(v14, "shadowBoundsForRect:additionalTransform:", v24, x, y, width, height);
        x = v16;
        y = v17;
        width = v18;
        height = v19;
      }

    }
  }
  v20 = x;
  v21 = y;
  v22 = width;
  v23 = height;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (id)shadow
{
  CRLShadow *v2;
  void *v3;

  if (self->mIsUpdatingShadow)
  {
    v2 = self->mDynamicShadow;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledRep styledInfo](self, "styledInfo"));
    v2 = (CRLShadow *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shadow"));

  }
  return v2;
}

- (BOOL)shouldShowShadow
{
  void *v3;
  unsigned __int8 v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledRep styledLayout](self, "styledLayout"));
  v4 = objc_msgSend(v3, "isInvisible");

  if ((v4 & 1) != 0)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)CRLStyledRep;
  return -[CRLCanvasRep shouldShowShadow](&v6, "shouldShowShadow");
}

- (BOOL)isInvisible
{
  return 0;
}

- (void)drawShadowInContext:(CGContext *)a3 withChildren:(BOOL)a4 withDrawableOpacity:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  void *v9;
  void *v10;
  double v11;
  CGFloat x;
  double v13;
  CGFloat y;
  double v15;
  CGFloat width;
  double v17;
  CGFloat height;
  CGImage *v19;
  CGImage *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  CGFloat v55;
  CGAffineTransform *p_transform;
  double v57;
  double v58;
  CGFloat v59;
  CGFloat v60;
  _BYTE v61[48];
  CGAffineTransform v62;
  CGAffineTransform v63;
  CGAffineTransform v64;
  CGAffineTransform v65;
  CGAffineTransform transform;
  CGAffineTransform v67;
  CGAffineTransform v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  v5 = a5;
  v6 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledRep shadow](self, "shadow"));
  v10 = v9;
  if (v9)
  {
    if (objc_msgSend(v9, "isEnabled"))
    {
      if (-[CRLStyledRep shouldShowShadow](self, "shouldShowShadow"))
      {
        objc_msgSend(v10, "boundsInNaturalSpaceForRep:", self);
        x = v11;
        y = v13;
        width = v15;
        height = v17;
        v19 = -[CRLCanvasRep newShadowImageWithSize:unflipped:withChildren:](self, "newShadowImageWithSize:unflipped:withChildren:", 0, v6, v15, v17);
        if (v19)
        {
          v20 = v19;
          CGContextSaveGState(a3);
          objc_msgSend(v10, "opacity");
          v22 = v21;
          if (v5)
          {
            -[CRLStyledRep opacity](self, "opacity");
            v22 = v22 * v23;
          }
          if (v22 < 1.0)
            CGContextSetAlpha(a3, v22);
          if (objc_msgSend(v10, "isDropShadow"))
          {
            objc_msgSend(v10, "offsetDelta");
            v25 = v24;
            v27 = v26;
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledRep styledLayout](self, "styledLayout"));
            v29 = v28;
            if (v28)
              objc_msgSend(v28, "transformInRoot");
            else
              memset(&v67, 0, sizeof(v67));
            CGAffineTransformInvert(&v68, &v67);
            v53 = sub_10006214C((float64x2_t *)&v68, v25, v27);
            v55 = v54;

            v69.origin.x = x;
            v69.origin.y = y;
            v69.size.width = width;
            v69.size.height = height;
            v70 = CGRectOffset(v69, v53, v55);
            x = v70.origin.x;
            y = v70.origin.y;
            width = v70.size.width;
            height = v70.size.height;
            sub_10007942C(0, 1, (uint64_t)&transform, v70.origin.x, v70.origin.y, v70.size.width, v70.size.height);
            p_transform = &transform;
          }
          else
          {
            if (objc_msgSend(v10, "isContactShadow"))
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledRep styledLayout](self, "styledLayout"));
              objc_msgSend(v30, "alignmentFrameInRoot");
              v32 = v31;

              v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledRep styledLayout](self, "styledLayout"));
              objc_msgSend(v33, "alignmentFrameInRoot");
              v35 = v34;
              v37 = v36;

              v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
              v39 = v38;
              if (v38)
                objc_msgSend(v38, "transformInRoot");
              else
                memset(&v64, 0, sizeof(v64));
              CGAffineTransformInvert(&v65, &v64);
              CGContextConcatCTM(a3, &v65);

              CGContextTranslateCTM(a3, v35, v37);
              objc_msgSend(v10, "offset");
              CGContextTranslateCTM(a3, 0.0, v32 + v57);
              CGContextTranslateCTM(a3, 0.0, v32);
              CGContextScaleCTM(a3, 1.0, -1.0);
              goto LABEL_25;
            }
            if (!objc_msgSend(v10, "isCurvedShadow"))
            {
LABEL_25:
              v71.origin.x = x;
              v71.origin.y = y;
              v71.size.width = width;
              v71.size.height = height;
              CGContextDrawImage(a3, v71, v20);
              CGImageRelease(v20);
              CGContextRestoreGState(a3);
              goto LABEL_26;
            }
            v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "geometry"));
            objc_msgSend(v41, "frame");
            v43 = v42;
            v45 = v44;

            v46 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "parent"));

            if (v47)
            {
              v48 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
              objc_msgSend(v48, "frameInRoot");
              v43 = v49;
              v45 = v50;

            }
            v51 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
            v52 = v51;
            if (v51)
              objc_msgSend(v51, "transformInRoot");
            else
              memset(&v62, 0, sizeof(v62));
            CGAffineTransformInvert(&v63, &v62);
            CGContextConcatCTM(a3, &v63);

            CGContextTranslateCTM(a3, v43, v45);
            objc_msgSend(v10, "offsetDelta");
            v59 = v58;
            objc_msgSend(v10, "offsetDelta");
            CGContextTranslateCTM(a3, v59, v60);
            sub_10007942C(0, 1, (uint64_t)v61, x, y, width, height);
            p_transform = (CGAffineTransform *)v61;
          }
          CGContextConcatCTM(a3, p_transform);
          goto LABEL_25;
        }
      }
    }
  }
LABEL_26:

}

- (void)drawInContext:(CGContext *)a3
{
  void *v5;
  unsigned __int8 v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledRep styledLayout](self, "styledLayout"));
  v6 = objc_msgSend(v5, "isInvisible");

  if ((v6 & 1) == 0)
  {
    -[CRLStyledRep drawShadowInContext:withChildren:withDrawableOpacity:](self, "drawShadowInContext:withChildren:withDrawableOpacity:", a3, 1, 1);
    -[CRLStyledRep drawInContextWithoutEffects:withContent:strokeDrawOptions:withOpacity:forAlphaOnly:drawChildren:keepingChildrenPassingTest:](self, "drawInContextWithoutEffects:withContent:strokeDrawOptions:withOpacity:forAlphaOnly:drawChildren:keepingChildrenPassingTest:", a3, 1, 7, 1, 0, 0, 0);
  }
}

- (void)drawInContextWithoutEffects:(CGContext *)a3 withContent:(BOOL)a4 strokeDrawOptions:(unint64_t)a5 withOpacity:(BOOL)a6 forAlphaOnly:(BOOL)a7 drawChildren:(BOOL)a8 keepingChildrenPassingTest:(id)a9
{
  id v10;
  unsigned int v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  char *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  objc_class *v24;
  NSString *v25;
  void *v26;
  uint64_t v27;
  objc_class *v28;
  NSString *v29;
  void *v30;
  void *v31;
  id v32;
  uint8_t buf[4];
  unsigned int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  void *v42;

  v10 = a9;
  v11 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123C1D8);
  v12 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v13 = v12;
    v15 = (objc_class *)objc_opt_class(self, v14);
    v16 = NSStringFromClass(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    *(_DWORD *)buf = 67110146;
    v34 = v11;
    v35 = 2082;
    v36 = "-[CRLStyledRep drawInContextWithoutEffects:withContent:strokeDrawOptions:withOpacity:forAlphaOnly:drawChildren"
          ":keepingChildrenPassingTest:]";
    v37 = 2082;
    v38 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLStyledRep.m";
    v39 = 1024;
    v40 = 201;
    v41 = 2114;
    v42 = v17;
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123C1F8);
  v18 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v19 = v18;
    v20 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v34 = v11;
    v35 = 2114;
    v36 = v20;
    _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStyledRep drawInContextWithoutEffects:withContent:strokeDrawOptions:withOpacity:forAlphaOnly:drawChildren:keepingChildrenPassingTest:]"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLStyledRep.m"));
  v24 = (objc_class *)objc_opt_class(self, v23);
  v25 = NSStringFromClass(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 201, 0, "Abstract method not overridden by %{public}@", v26);

  v28 = (objc_class *)objc_opt_class(self, v27);
  v29 = NSStringFromClass(v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v30, "-[CRLStyledRep drawInContextWithoutEffects:withContent:strokeDrawOptions:withOpacity:forAlphaOnly:drawChildren:keepingChildrenPassingTest:]"));
  v32 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v31, 0));

  objc_exception_throw(v32);
}

- (void)drawInContextWithoutEffects:(CGContext *)a3
{
  -[CRLStyledRep drawInContextWithoutEffects:withContent:strokeDrawOptions:withOpacity:forAlphaOnly:drawChildren:keepingChildrenPassingTest:](self, "drawInContextWithoutEffects:withContent:strokeDrawOptions:withOpacity:forAlphaOnly:drawChildren:keepingChildrenPassingTest:", a3, 1, 7, 0, 0, 1, 0);
}

- (void)drawInContextWithoutEffectsOrChildren:(CGContext *)a3
{
  -[CRLStyledRep drawInContextWithoutEffects:withContent:strokeDrawOptions:withOpacity:forAlphaOnly:drawChildren:keepingChildrenPassingTest:](self, "drawInContextWithoutEffects:withContent:strokeDrawOptions:withOpacity:forAlphaOnly:drawChildren:keepingChildrenPassingTest:", a3, 1, 7, 0, 0, 0, 0);
}

- (void)drawInContextWithoutEffectsForAlphaOnly:(CGContext *)a3
{
  -[CRLStyledRep drawInContextWithoutEffects:withContent:strokeDrawOptions:withOpacity:forAlphaOnly:drawChildren:keepingChildrenPassingTest:](self, "drawInContextWithoutEffects:withContent:strokeDrawOptions:withOpacity:forAlphaOnly:drawChildren:keepingChildrenPassingTest:", a3, 1, 7, 0, 1, 1, 0);
}

- (void)drawInContextWithoutEffectsOrChildrenForAlphaOnly:(CGContext *)a3
{
  -[CRLStyledRep drawInContextWithoutEffects:withContent:strokeDrawOptions:withOpacity:forAlphaOnly:drawChildren:keepingChildrenPassingTest:](self, "drawInContextWithoutEffects:withContent:strokeDrawOptions:withOpacity:forAlphaOnly:drawChildren:keepingChildrenPassingTest:", a3, 1, 7, 0, 1, 0, 0);
}

- (void)setNeedsDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLStyledRep;
  -[CRLCanvasRep setNeedsDisplay](&v3, "setNeedsDisplay");
  -[CRLCanvasRep invalidateShadowRenderable](self, "invalidateShadowRenderable");
}

- (void)processChangedProperty:(unint64_t)a3
{
  void *v5;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLStyledRep;
  -[CRLCanvasRep processChangedProperty:](&v7, "processChangedProperty:");
  if (a3 == 17)
  {
    v6.receiver = self;
    v6.super_class = (Class)CRLStyledRep;
    -[CRLCanvasRep setNeedsDisplay](&v6, "setNeedsDisplay");
  }
  else
  {
    if (a3 != 16)
      return;
    if (self->mIsUpdatingShadow)
      -[CRLCanvasRep invalidateShadowRenderable](self, "invalidateShadowRenderable");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v5, "canvasInvalidatedForRep:", self);

}

- (BOOL)shouldHideSelectionHighlightDueToRectangularPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "i_wrapPath"));

  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123C218);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E001B4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123C238);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE8358(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStyledRep shouldHideSelectionHighlightDueToRectangularPath]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLStyledRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 253, 0, "invalid nil value for '%{public}s'", "wrapPath");

  }
  if ((objc_msgSend(v4, "isRectangular") & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    v10 = objc_opt_class(CRLScalarPathSource, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledRep pathSourceForSelectionHighlightBehavior](self, "pathSourceForSelectionHighlightBehavior"));
    v12 = sub_100221D0C(v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    v9 = 0;
    if (v13)
    {
      if (!objc_msgSend(v13, "type"))
      {
        if (!objc_msgSend(v13, "shouldShowKnob")
          || (objc_msgSend(v13, "scalar"),
              v16 = v15,
              v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas")),
              objc_msgSend(v17, "viewScale"),
              v19 = v16 * v18,
              v17,
              v19 < 10.0))
        {
          v9 = 1;
        }
      }
    }

  }
  return v9;
}

- (BOOL)shouldShowSelectionHighlight
{
  objc_super v4;

  if (-[CRLStyledRep shouldHideSelectionHighlightDueToRectangularPath](self, "shouldHideSelectionHighlightDueToRectangularPath"))
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLStyledRep;
  return -[CRLCanvasRep shouldShowSelectionHighlight](&v4, "shouldShowSelectionHighlight");
}

- (id)pathSourceForSelectionHighlightBehavior
{
  return 0;
}

- (void)dynamicShadowChangeDidBegin
{
  void *v3;
  CRLShadow *v4;
  CRLShadow *mDynamicShadow;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledRep styledInfo](self, "styledInfo"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shadow"));

  v4 = (CRLShadow *)objc_msgSend(v6, "copy");
  mDynamicShadow = self->mDynamicShadow;
  self->mDynamicShadow = v4;

  self->mIsUpdatingShadow = 1;
}

- (void)dynamicShadowUpdateToValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CRLShadow *v8;
  CRLShadow *mDynamicShadow;

  v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123C258);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E00250();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123C278);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE8358(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStyledRep dynamicShadowUpdateToValue:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLStyledRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 292, 0, "invalid nil value for '%{public}s'", "shadow");

  }
  v8 = (CRLShadow *)objc_msgSend(v4, "copy");
  mDynamicShadow = self->mDynamicShadow;
  self->mDynamicShadow = v8;

  -[CRLStyledRep processChangedProperty:](self, "processChangedProperty:", 16);
}

- (void)dynamicShadowChangeDidEnd
{
  CRLShadow *mDynamicShadow;

  self->mIsUpdatingShadow = 0;
  mDynamicShadow = self->mDynamicShadow;
  self->mDynamicShadow = 0;

}

- (id)cursorAtPoint:(CGPoint)a3 forKnob:(id)a4 withCursorPlatformObject:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  objc_super v20;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  v10 = a5;
  if ((unint64_t)objc_msgSend(v9, "tag") < 0xC || (unint64_t)objc_msgSend(v9, "tag") > 0x10)
  {
    v20.receiver = self;
    v20.super_class = (Class)CRLStyledRep;
    v17 = -[CRLCanvasRep cursorAtPoint:forKnob:withCursorPlatformObject:](&v20, "cursorAtPoint:forKnob:withCursorPlatformObject:", v9, v10, x, y);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  }
  else
  {
    v12 = objc_opt_class(CRLScalarPathSource, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledRep pathSourceForSelectionHighlightBehavior](self, "pathSourceForSelectionHighlightBehavior"));
    v14 = sub_100221D0C(v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    if (v15 && !objc_msgSend(v15, "type"))
    {
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "resizeCursor"));
    }
    else
    {
      objc_msgSend(v9, "cursorActiveScaledRect");
      v16 = objc_claimAutoreleasedReturnValue(+[CRLCursor moveCursorWithActiveScaledRect:](CRLCursor, "moveCursorWithActiveScaledRect:"));
    }
    v18 = (void *)v16;

  }
  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDynamicShadow, 0);
}

@end
