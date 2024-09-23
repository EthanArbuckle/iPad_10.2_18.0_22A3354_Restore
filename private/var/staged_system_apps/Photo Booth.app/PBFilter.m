@implementation PBFilter

+ (PBFilter)filterWithName:(id)a3
{
  Class v3;
  uint64_t v4;
  objc_class *v5;

  v3 = NSClassFromString((NSString *)a3);
  if (v3
    && (v5 = v3,
        -[objc_class isSubclassOfClass:](v3, "isSubclassOfClass:", objc_opt_class(PBFilter, v4))))
  {
    return (PBFilter *)objc_alloc_init(v5);
  }
  else
  {
    return 0;
  }
}

- (PBFilter)init
{
  PBFilter *v2;
  PBFilter *v3;
  CIFilter *v4;
  CIFilter *v5;
  CIFilter *v6;
  CIFilter *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PBFilter;
  v2 = -[PBFilter init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    -[PBFilter setDefaults](v2, "setDefaults");
    v4 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", -[PBFilter ciFilterName](v3, "ciFilterName"));
    v3->_ciFilter = v4;
    v5 = v4;
    if (-[PBFilter needsWrapMirror](v3, "needsWrapMirror"))
    {
      v6 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIWrapMirror"));
      v3->_wrapMirrorFilter = v6;
      v7 = v6;
    }
  }
  return v3;
}

- (id)ciFilterName
{
  return objc_msgSend(-[PBFilter name](self, "name"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("PB"), CFSTR("CI"));
}

- (id)name
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v2);
}

- (BOOL)needsWrapMirror
{
  return 0;
}

- (void)dealloc
{
  CIFilter *ciFilter;
  CIFilter *wrapMirrorFilter;
  objc_super v5;

  ciFilter = self->_ciFilter;
  if (ciFilter)

  wrapMirrorFilter = self->_wrapMirrorFilter;
  if (wrapMirrorFilter)

  v5.receiver = self;
  v5.super_class = (Class)PBFilter;
  -[PBFilter dealloc](&v5, "dealloc");
}

- (void)setDefaults
{
  CIFilter *ciFilter;
  CIFilter *wrapMirrorFilter;

  ciFilter = self->_ciFilter;
  if (ciFilter)
    -[CIFilter setDefaults](ciFilter, "setDefaults");
  wrapMirrorFilter = self->_wrapMirrorFilter;
  if (wrapMirrorFilter)
    -[CIFilter setDefaults](wrapMirrorFilter, "setDefaults");
}

- (id)createOutputImage:(id)a3 mirrored:(BOOL)a4 size:(CGSize)a5 renderForSave:(BOOL)a6
{
  _BOOL4 v7;
  _BOOL8 v8;
  _BOOL4 v10;
  CIImage *v11;
  unsigned int v12;
  CIImage *v13;
  CIImage *v14;

  if (!self->_ciFilter)
    return a3;
  v7 = a6;
  v8 = a4;
  if (qword_100043508 != -1)
    dispatch_once(&qword_100043508, &stru_100034DD0);
  v10 = dword_100043500 == 180 && v8 && v7;
  v11 = (CIImage *)a3;
  if (v10)
    v11 = (CIImage *)objc_msgSend(a3, "imageByApplyingCGOrientation:", 3);
  v12 = -[PBFilter needsWrapMirror](self, "needsWrapMirror");
  if (v12)
  {
    -[CIFilter setValue:forKey:](self->_wrapMirrorFilter, "setValue:forKey:", v11, CFSTR("inputImage"));
    v11 = -[CIFilter outputImage](self->_wrapMirrorFilter, "outputImage");
  }
  objc_msgSend(a3, "extent");
  -[PBFilter applyParametersToCIFilter:extent:](self, "applyParametersToCIFilter:extent:", v8);
  -[CIFilter setValue:forKey:](self->_ciFilter, "setValue:forKey:", v11, CFSTR("inputImage"));
  v13 = -[CIFilter outputImage](self->_ciFilter, "outputImage");
  v14 = v13;
  if (!v10)
    return v13;
  if (v12)
  {
    objc_msgSend(a3, "extent");
    v14 = -[CIImage imageByCroppingToRect:](v14, "imageByCroppingToRect:");
  }
  return -[CIImage imageByApplyingCGOrientation:](v14, "imageByApplyingCGOrientation:", 3);
}

- (void)resetInputImage
{
  CIFilter *ciFilter;
  CIFilter *wrapMirrorFilter;

  ciFilter = self->_ciFilter;
  if (ciFilter)
    -[CIFilter setValue:forKey:](ciFilter, "setValue:forKey:", 0, CFSTR("inputImage"));
  wrapMirrorFilter = self->_wrapMirrorFilter;
  if (wrapMirrorFilter)
    -[CIFilter setValue:forKey:](wrapMirrorFilter, "setValue:forKey:", 0, CFSTR("inputImage"));
}

- (id)inputKeys
{
  return objc_msgSend(+[PBFilterClassDescription classDescriptionForClass:](PBFilterClassDescription, "classDescriptionForClass:", objc_opt_class(self, a2)), "inputKeys");
}

- (id)localizedName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self, a2);
  return -[NSBundle localizedStringForKey:value:table:](+[NSBundle mainBundle](NSBundle, "mainBundle"), "localizedStringForKey:value:table:", NSStringFromClass(v2), &stru_100035390, CFSTR("PhotoBoothEffects"));
}

- (id)description
{
  id v3;
  uint64_t v4;
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  id v11;
  id v12;
  const char *v13;
  NSString *v14;
  NSMutableString *v16;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = -[PBFilter inputKeys](self, "inputKeys");
  if (objc_msgSend(v3, "count"))
  {
    v5 = (objc_class *)objc_opt_class(self, v4);
    v16 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("%@ (%p) = { "), NSStringFromClass(v5), self);
    v6 = objc_msgSend(v3, "lastObject");
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v3);
          v11 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          v12 = -[PBFilter valueForKey:](self, "valueForKey:", v11);
          v13 = ", ";
          if (v11 == v6)
            v13 = "";
          v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ = %@%s"), v11, v12, v13);
          if (v14)
            -[NSMutableString appendString:](v16, "appendString:", v14);
        }
        v8 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }
    -[NSMutableString appendString:](v16, "appendString:", CFSTR(" }"));
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)PBFilter;
    return -[PBFilter description](&v17, "description");
  }
  return v16;
}

- (id)ciFilter
{
  return self->_ciFilter;
}

+ (id)defaultValueForKey:(id)a3
{
  objc_class *v4;
  PBFilter *v5;
  PBFilter *v6;
  id v7;

  if (!a1)
    return 0;
  v4 = (objc_class *)objc_opt_class(a1, a2);
  v5 = +[PBFilter filterWithName:](PBFilter, "filterWithName:", NSStringFromClass(v4));
  if (!v5)
    return 0;
  v6 = v5;
  -[PBFilter setDefaults](v5, "setDefaults");
  if (objc_msgSend(-[PBFilter inputKeys](v6, "inputKeys"), "containsObject:", a3))
    v7 = -[PBFilter valueForKey:](v6, "valueForKey:", a3);
  else
    v7 = 0;

  return v7;
}

+ (BOOL)needsDisplayForKey:(id)a3
{
  return a1
      && -[NSSet containsObject:](+[NSSet setWithArray:](NSSet, "setWithArray:", objc_msgSend(+[PBFilterClassDescription classDescriptionForClass:](PBFilterClassDescription, "classDescriptionForClass:", objc_opt_class(a1, a2)), "inputKeys")), "containsObject:", a3);
}

- (BOOL)allowAbsoluteGestures
{
  return 1;
}

- (void)renderWithContext:(id)a3 inputSize:(CGSize)a4 outputRect:(CGRect)a5 mirrored:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  double y;
  double x;
  double v11;
  double v12;
  uint64_t v15;
  uint64_t v16;
  __CVBuffer *v17;
  id v18;
  size_t v19;
  id v20;
  float v21;
  float v22;
  id v23;
  id v24;
  __CVBuffer *v25;
  id v26;
  id v27;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform v41;
  CGAffineTransform v42;
  CGAffineTransform v43;
  CGAffineTransform v44;
  CGAffineTransform v45;
  CGAffineTransform v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  CGAffineTransform v49;
  CGAffineTransform v50;
  CGAffineTransform v51;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v54;

  v6 = a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4.height;
  v12 = a4.width;
  v15 = objc_opt_class(a3, a2);
  if (v15 == objc_opt_class(PBCoreImageContext, v16))
  {
    v17 = (__CVBuffer *)objc_msgSend(a3, "inputPixelBuffer");
    objc_sync_enter(self);
    v18 = objc_msgSend(a3, "inputTexture");
    v19 = CVPixelBufferGetWidth(v17);
    v20 = -[PBFilter createOutputImage:mirrored:size:renderForSave:](self, "createOutputImage:mirrored:size:renderForSave:", +[CIImage imageWithTexture:size:flipped:colorSpace:](CIImage, "imageWithTexture:size:flipped:colorSpace:", v18, 1, 0, (double)v19, (double)CVPixelBufferGetHeight(v17)), v6, objc_msgSend(a3, "renderForSave"), v12, v11);
    -[PBFilter resetInputImage](self, "resetInputImage");
    objc_sync_exit(self);
    if (objc_msgSend(a3, "renderForSave"))
    {
      objc_msgSend(objc_msgSend(a3, "ciContext"), "render:toCVPixelBuffer:bounds:colorSpace:", v20, objc_msgSend(a3, "outputPixelBuffer"), 0, x, y, width, height);
    }
    else
    {
      if (objc_msgSend(a3, "render9Up"))
      {
        v33 = *(_OWORD *)&CGAffineTransformIdentity.c;
        *(_OWORD *)&v54.a = *(_OWORD *)&CGAffineTransformIdentity.a;
        v31 = *(_OWORD *)&v54.a;
        *(_OWORD *)&v54.c = v33;
        *(_OWORD *)&v54.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
        v29 = *(_OWORD *)&v54.tx;
        CGAffineTransformMakeScale(&t2, -1.0, 1.0);
        *(_OWORD *)&t1.a = v31;
        *(_OWORD *)&t1.c = v33;
        *(_OWORD *)&t1.tx = v29;
        CGAffineTransformConcat(&v54, &t1, &t2);
        CGAffineTransformMakeTranslation(&v51, v12, 0.0);
        v50 = v54;
        CGAffineTransformConcat(&t1, &v50, &v51);
        v54 = t1;
        if (v6)
        {
          CGAffineTransformMakeScale(&v49, 1.0, -1.0);
          v50 = v54;
          CGAffineTransformConcat(&t1, &v50, &v49);
          v54 = t1;
          CGAffineTransformMakeTranslation(&v48, 0.0, v11);
          v50 = v54;
          CGAffineTransformConcat(&t1, &v50, &v48);
          v54 = t1;
        }
        CGAffineTransformMakeTranslation(&v47, v12 * -0.5, v11 * -0.5);
        v50 = v54;
        CGAffineTransformConcat(&t1, &v50, &v47);
        v54 = t1;
        CGAffineTransformMakeRotation(&v46, -1.57079633);
        v50 = v54;
        CGAffineTransformConcat(&t1, &v50, &v46);
        v54 = t1;
        CGAffineTransformMakeTranslation(&v45, v11 * 0.5, v12 * 0.5);
        v50 = v54;
        CGAffineTransformConcat(&t1, &v50, &v45);
        v54 = t1;
        v21 = height / v12;
        v22 = width / v11;
        CGAffineTransformMakeScale(&v44, v21, v22);
        v50 = v54;
        CGAffineTransformConcat(&t1, &v50, &v44);
        v54 = t1;
        objc_msgSend(a3, "outputSize");
        CGAffineTransformMakeTranslation(&v43, x, y);
        v50 = v54;
        CGAffineTransformConcat(&t1, &v50, &v43);
        v54 = t1;
        v23 = objc_msgSend(objc_msgSend(v20, "imageByApplyingTransform:", &t1), "imageByCroppingToRect:", x, y, width, height);
      }
      else
      {
        v34 = *(_OWORD *)&CGAffineTransformIdentity.c;
        *(_OWORD *)&v54.a = *(_OWORD *)&CGAffineTransformIdentity.a;
        v32 = *(_OWORD *)&v54.a;
        *(_OWORD *)&v54.c = v34;
        *(_OWORD *)&v54.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
        v30 = *(_OWORD *)&v54.tx;
        CGAffineTransformMakeScale(&v42, -1.0, 1.0);
        *(_OWORD *)&t1.a = v32;
        *(_OWORD *)&t1.c = v34;
        *(_OWORD *)&t1.tx = v30;
        CGAffineTransformConcat(&v54, &t1, &v42);
        CGAffineTransformMakeTranslation(&v41, v12, 0.0);
        v50 = v54;
        CGAffineTransformConcat(&t1, &v50, &v41);
        v54 = t1;
        if (v6)
        {
          CGAffineTransformMakeScale(&v40, 1.0, -1.0);
          v50 = v54;
          CGAffineTransformConcat(&t1, &v50, &v40);
          v54 = t1;
          CGAffineTransformMakeTranslation(&v39, 0.0, v11);
          v50 = v54;
          CGAffineTransformConcat(&t1, &v50, &v39);
          v54 = t1;
        }
        CGAffineTransformMakeTranslation(&v38, v12 * -0.5, v11 * -0.5);
        v50 = v54;
        CGAffineTransformConcat(&t1, &v50, &v38);
        v54 = t1;
        CGAffineTransformMakeRotation(&v37, -1.57079633);
        v50 = v54;
        CGAffineTransformConcat(&t1, &v50, &v37);
        v54 = t1;
        CGAffineTransformMakeTranslation(&v36, v11 * 0.5, v12 * 0.5);
        v50 = v54;
        CGAffineTransformConcat(&t1, &v50, &v36);
        v54 = t1;
        if (width != v11 || height != v12)
        {
          CGAffineTransformMakeScale(&v35, width / v11, height / v12);
          v50 = v54;
          CGAffineTransformConcat(&t1, &v50, &v35);
          v54 = t1;
        }
        t1 = v54;
        v23 = objc_msgSend(v20, "imageByApplyingTransform:", &t1, v30, v32, v34);
      }
      v24 = v23;
      v25 = (__CVBuffer *)objc_msgSend(a3, "outputPixelBuffer", v29, v31, v33);
      v26 = objc_msgSend(a3, "ciContext");
      v27 = objc_msgSend(a3, "outputTexture");
      v28 = (double)CVPixelBufferGetWidth(v25);
      objc_msgSend(v26, "render:toTexture:bounds:colorSpace:", v24, v27, 0, 0.0, 0.0, v28, (double)CVPixelBufferGetHeight(v25));
    }
  }
}

- (CGPoint)adjustedInputPoint:(CGPoint)result mirrored:(BOOL)a4
{
  if (!a4)
    result.y = 1.0 - result.y;
  return result;
}

- (float)adjustedInputRotation:(float)result mirrored:(BOOL)a4
{
  if (!a4)
    return -result;
  return result;
}

- (float)floatValueForKeyIfSupported:(id)a3
{
  float result;

  if (!objc_msgSend(-[PBFilter inputKeys](self, "inputKeys"), "containsObject:", a3))
    return NAN;
  objc_msgSend(-[PBFilter valueForKey:](self, "valueForKey:", a3), "floatValue");
  return result;
}

- (void)setFloatValue:(float)a3 forKeyIfSupported:(id)a4
{
  double v7;

  if (objc_msgSend(-[PBFilter inputKeys](self, "inputKeys"), "containsObject:", a4))
  {
    *(float *)&v7 = a3;
    -[PBFilter setValue:forKey:](self, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7), a4);
  }
}

- (CGPoint)pointValueForKeyIfSupported:(id)a3
{
  double v5;
  double v6;
  CGPoint result;

  if (objc_msgSend(-[PBFilter inputKeys](self, "inputKeys"), "containsObject:", a3))
  {
    objc_msgSend(-[PBFilter valueForKey:](self, "valueForKey:", a3), "pointValue");
  }
  else
  {
    v5 = NAN;
    v6 = NAN;
  }
  result.y = v6;
  result.x = v5;
  return result;
}

- (void)setPointValue:(CGPoint)a3 forKeyIfSupported:(id)a4
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (objc_msgSend(-[PBFilter inputKeys](self, "inputKeys"), "containsObject:", a4))
    -[PBFilter setValue:forKey:](self, "setValue:forKey:", +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", x, y), a4);
}

- (void)handleTapGesture:(CGPoint)a3 viewSize:(CGSize)a4 mirror:(BOOL)a5
{
  double height;
  double width;
  double y;
  double x;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  BOOL v15;
  float v16;
  double v17;

  height = a4.height;
  width = a4.width;
  y = a3.y;
  x = a3.x;
  if (-[PBFilter allowAbsoluteGestures](self, "allowAbsoluteGestures", a5)
    && objc_msgSend(-[PBFilter inputKeys](self, "inputKeys"), "containsObject:", CFSTR("inputPoint")))
  {
    v10 = x / width;
    v11 = y / height;
    v12 = 1.0;
    v13 = 1.0 - v10;
    if (v11 <= 1.0)
      v14 = y / height;
    else
      v14 = 1.0;
    v15 = v11 < 0.0;
    v16 = 0.0;
    if (v15)
      v14 = 0.0;
    v17 = v14;
    if (v13 <= 1.0)
      v12 = v13;
    if (v13 >= 0.0)
      v16 = v12;
    -[PBFilter setValue:forKey:](self, "setValue:forKey:", +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", v17, v16), CFSTR("inputPoint"));
  }
}

- (void)handleGestureAtLocations:(CGPoint *)a3 count:(int)a4 translation:(CGPoint)a5 viewSize:(CGSize)a6 stateBegan:(BOOL)a7 mirror:(BOOL)a8
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  int v21;
  double v22;
  double v23;
  long double v24;
  long double v25;
  double v26;
  double v27;
  float v28;
  float v29;
  double v30;
  double Current;
  double v32;
  double v33;
  double v34;
  double v35;
  int v36;
  int v37;
  int v38;
  uint64_t v39;
  int v40;
  int v41;
  int v42;
  char v43;
  int v44;
  float v45;
  float v46;
  double v47;
  double v48;
  double v49;
  float v50;
  float v51;
  float v52;
  float v53;
  double v54;
  float v55;
  float v56;
  float v57;
  double v58;
  float v59;
  double v60;
  float v61;
  float v62;
  BOOL v63;
  double v64;
  float v65;
  float v66;
  double v67;
  double v68;
  double v69;
  int v70;
  double v71;
  float v72;
  float v73;
  float v74;
  double v75;
  double v76;
  float v77;
  float v78;

  height = a6.height;
  width = a6.width;
  y = a5.y;
  x = a5.x;
  v16 = -[PBFilter inputKeys](self, "inputKeys", a3, *(_QWORD *)&a4, a7, a8);
  if (a4 < 1)
  {
    v21 = 0;
    v20 = CGPointZero.x;
    v19 = CGPointZero.y;
    goto LABEL_5;
  }
  v17 = a3->x;
  v18 = a3->y;
  if (a4 == 1)
  {
    v19 = a3->y;
    v20 = a3->x;
    v21 = 0;
LABEL_5:
    v77 = 0.0;
    v78 = NAN;
    goto LABEL_7;
  }
  v75 = height;
  v76 = width;
  v22 = a3[1].x;
  v23 = a3[1].y;
  v24 = v17 - v22;
  v25 = v18 - v23;
  v26 = a3->x;
  v27 = a3->y;
  v28 = atan2(v18 - v23, v17 - v22);
  v78 = v28;
  v29 = hypot(v24, v25);
  v77 = v29;
  v20 = (v26 + v22) * 0.5;
  v30 = v27 + v23;
  height = v75;
  width = v76;
  v19 = v30 * 0.5;
  v21 = 1;
LABEL_7:
  Current = CFAbsoluteTimeGetCurrent();
  v32 = x / width;
  v33 = y / height;
  if (a7)
  {
    dword_100043524 = a4;
    dword_100043520 = 0;
    -[PBFilter pointValueForKeyIfSupported:](self, "pointValueForKeyIfSupported:", CFSTR("inputPoint"));
    *(float *)&v34 = v34;
    dword_100043528 = LODWORD(v34);
    *(float *)&v34 = v35;
    dword_10004352C = LODWORD(v34);
    -[PBFilter floatValueForKeyIfSupported:](self, "floatValueForKeyIfSupported:", CFSTR("inputH"));
    dword_100043530 = v36;
    -[PBFilter floatValueForKeyIfSupported:](self, "floatValueForKeyIfSupported:", CFSTR("inputV"));
    dword_100043534 = v37;
    -[PBFilter floatValueForKeyIfSupported:](self, "floatValueForKeyIfSupported:", CFSTR("inputAngle"));
    dword_10004331C = v38;
    v39 = 0;
    if (v21)
    {
      -[PBFilter floatValueForKeyIfSupported:](self, "floatValueForKeyIfSupported:", CFSTR("inputAmount"));
      dword_100043538 = v40;
      dword_10004353C = LODWORD(v77);
    }
LABEL_19:
    qword_100043518 = v39;
    goto LABEL_20;
  }
  v41 = dword_100043524;
  if (dword_100043524 <= a4)
    v41 = a4;
  dword_100043524 = v41;
  v42 = dword_100043520;
  if (dword_100043520 < 2)
    v43 = v21;
  else
    v43 = 0;
  if ((v43 & 1) != 0)
  {
    -[PBFilter floatValueForKeyIfSupported:](self, "floatValueForKeyIfSupported:", CFSTR("inputAmount"));
    dword_100043538 = v44;
    dword_10004353C = LODWORD(v77);
    v42 = dword_100043520;
  }
  if (a4 <= 1)
  {
    v39 = *(_QWORD *)&Current;
    if (v42 == 2)
      goto LABEL_19;
  }
LABEL_20:
  v45 = v32;
  v46 = v33;
  if (objc_msgSend(v16, "containsObject:", CFSTR("inputPoint")))
  {
    if (!-[PBFilter allowAbsoluteGestures](self, "allowAbsoluteGestures"))
    {
      if (a4 < 1)
        goto LABEL_66;
      v56 = *(float *)&dword_10004352C - v45;
      LODWORD(v48) = 1.0;
      if ((float)(*(float *)&dword_100043528 + v46) <= 1.0)
        *(float *)&v49 = *(float *)&dword_100043528 + v46;
      else
        *(float *)&v49 = 1.0;
      if ((float)(*(float *)&dword_100043528 + v46) >= 0.0)
        v57 = *(float *)&v49;
      else
        v57 = 0.0;
      v58 = v57;
      if (v56 <= 1.0)
        *(float *)&v48 = *(float *)&dword_10004352C - v45;
      if (v56 >= 0.0)
        v59 = *(float *)&v48;
      else
        v59 = 0.0;
      -[PBFilter setPointValue:forKeyIfSupported:](self, "setPointValue:forKeyIfSupported:", CFSTR("inputPoint"), v58, v59, v48, v49);
LABEL_52:
      if (objc_msgSend(v16, "containsObject:", CFSTR("inputH"), v47))
      {
        v61 = *(float *)&dword_100043530 + (float)(v45 * 2.0);
        v62 = 1.0;
        if (v61 <= 1.0)
          v62 = *(float *)&dword_100043530 + (float)(v45 * 2.0);
        v63 = v61 < 0.0;
        LODWORD(v60) = 0;
        if (!v63)
          *(float *)&v60 = v62;
        -[PBFilter setValue:forKey:](self, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v60), CFSTR("inputH"));
      }
      if (objc_msgSend(v16, "containsObject:", CFSTR("inputV")))
      {
        v65 = *(float *)&dword_100043534 + (float)(v46 * 2.0);
        v66 = 1.0;
        if (v65 <= 1.0)
          v66 = *(float *)&dword_100043534 + (float)(v46 * 2.0);
        v63 = v65 < 0.0;
        LODWORD(v64) = 0;
        if (!v63)
          *(float *)&v64 = v66;
        -[PBFilter setValue:forKey:](self, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v64), CFSTR("inputV"));
      }
      if (objc_msgSend(v16, "containsObject:", CFSTR("inputAngle")))
      {
        v67 = *(float *)&dword_10004331C + v45 * 6.0;
        *(float *)&v67 = v67;
        -[PBFilter setValue:forKey:](self, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v67), CFSTR("inputAngle"));
      }
      goto LABEL_66;
    }
    if ((v21 & 1) == 0)
    {
      if (a4 <= 0)
      {
        objc_msgSend(v16, "containsObject:", CFSTR("inputAmount"));
        v21 = 0;
        goto LABEL_74;
      }
      v47 = Current - *(double *)&qword_100043518;
      if (Current - *(double *)&qword_100043518 <= 0.0500000007)
        goto LABEL_52;
    }
    v50 = v19 / height;
    v51 = v20 / width;
    LODWORD(v48) = 1.0;
    v52 = 1.0 - v51;
    if (v50 <= 1.0)
      *(float *)&v49 = v19 / height;
    else
      *(float *)&v49 = 1.0;
    if (v50 >= 0.0)
      v53 = *(float *)&v49;
    else
      v53 = 0.0;
    v54 = v53;
    if (v52 <= 1.0)
      *(float *)&v48 = v52;
    if (v52 >= 0.0)
      v55 = *(float *)&v48;
    else
      v55 = 0.0;
    -[PBFilter setPointValue:forKeyIfSupported:](self, "setPointValue:forKeyIfSupported:", CFSTR("inputPoint"), v54, v55, v48, v49);
  }
  if (a4 >= 1)
    goto LABEL_52;
LABEL_66:
  if ((v21 & objc_msgSend(v16, "containsObject:", CFSTR("inputAmount"))) == 1)
  {
    if (-[PBFilter allowAbsoluteGestures](self, "allowAbsoluteGestures"))
    {
      if (width >= height)
        v69 = height;
      else
        v69 = width;
      v68 = v77 / v69;
      *(float *)&v68 = v68;
    }
    else
    {
      *(float *)&v68 = (float)(v77 * *(float *)&dword_100043538) / *(float *)&dword_10004353C;
    }
    -[PBFilter setValue:forKey:](self, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v68), CFSTR("inputAmount"));
    v21 = 1;
  }
LABEL_74:
  if (objc_msgSend(v16, "containsObject:", CFSTR("inputRotation")))
  {
    v70 = dword_100043520 > 1 ? v21 : 0;
    if (v70 == 1)
    {
      objc_msgSend(-[PBFilter valueForKey:](self, "valueForKey:", CFSTR("inputRotation")), "floatValue");
      v72 = v78 - *(float *)&dword_100043318;
      if ((float)(v78 - *(float *)&dword_100043318) < -3.14159265)
      {
        v73 = (float)(v78 - *(float *)&dword_100043318) + 6.28318531;
        v72 = v73;
      }
      if (v72 > 3.14159265)
      {
        v74 = v72 + -6.28318531;
        v72 = v74;
      }
      *(float *)&v71 = *(float *)&v71 + v72;
      -[PBFilter setValue:forKey:](self, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v71), CFSTR("inputRotation"));
    }
  }
  dword_100043520 = a4;
  dword_100043318 = LODWORD(v78);
}

- (void)handlePanGesture:(CGPoint)a3 viewSize:(CGSize)a4 stateBegan:(BOOL)a5 mirror:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  int v14;
  int v15;
  int v16;
  float v17;
  float v18;
  float v19;
  double v20;
  double v21;
  float v22;
  float v23;
  double v24;
  float v25;
  double v26;
  float v27;
  float v28;
  BOOL v29;
  double v30;
  float v31;
  float v32;
  double v33;

  v6 = a6;
  v7 = a5;
  v9 = a3.x / a4.width;
  v10 = a3.y / a4.height;
  v11 = -[PBFilter inputKeys](self, "inputKeys");
  if (v7)
  {
    -[PBFilter pointValueForKeyIfSupported:](self, "pointValueForKeyIfSupported:", CFSTR("inputPoint"));
    *(float *)&v12 = v12;
    dword_100043320 = LODWORD(v12);
    *(float *)&v12 = v13;
    dword_100043324 = LODWORD(v12);
    -[PBFilter floatValueForKeyIfSupported:](self, "floatValueForKeyIfSupported:", CFSTR("inputH"));
    dword_100043328 = v14;
    -[PBFilter floatValueForKeyIfSupported:](self, "floatValueForKeyIfSupported:", CFSTR("inputV"));
    dword_10004332C = v15;
    -[PBFilter floatValueForKeyIfSupported:](self, "floatValueForKeyIfSupported:", CFSTR("inputAngle"));
    dword_100043540 = v16;
  }
  v17 = v9;
  v18 = v10;
  if (objc_msgSend(v11, "containsObject:", CFSTR("inputPoint")))
  {
    v19 = *(float *)&dword_100043320 + v18;
    v20 = v17;
    v21 = -1.0;
    if (v6)
      v21 = 1.0;
    v22 = *(float *)&dword_100043324 + v20 * v21;
    LODWORD(v20) = 1.0;
    if (v19 <= 1.0)
      *(float *)&v21 = *(float *)&dword_100043320 + v18;
    else
      *(float *)&v21 = 1.0;
    if (v19 >= 0.0)
      v23 = *(float *)&v21;
    else
      v23 = 0.0;
    v24 = v23;
    if (v22 <= 1.0)
      *(float *)&v20 = v22;
    if (v22 >= 0.0)
      v25 = *(float *)&v20;
    else
      v25 = 0.0;
    -[PBFilter setValue:forKey:](self, "setValue:forKey:", +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", v24, v25, v20, v21), CFSTR("inputPoint"));
  }
  if (objc_msgSend(v11, "containsObject:", CFSTR("inputH")))
  {
    v27 = *(float *)&dword_100043328 + (float)(v17 * 2.0);
    v28 = 1.0;
    if (v27 <= 1.0)
      v28 = *(float *)&dword_100043328 + (float)(v17 * 2.0);
    v29 = v27 < 0.0;
    LODWORD(v26) = 0;
    if (!v29)
      *(float *)&v26 = v28;
    -[PBFilter setValue:forKey:](self, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v26), CFSTR("inputH"));
  }
  if (objc_msgSend(v11, "containsObject:", CFSTR("inputV")))
  {
    v31 = *(float *)&dword_10004332C + (float)(v18 * 2.0);
    v32 = 1.0;
    if (v31 <= 1.0)
      v32 = *(float *)&dword_10004332C + (float)(v18 * 2.0);
    v29 = v31 < 0.0;
    LODWORD(v30) = 0;
    if (!v29)
      *(float *)&v30 = v32;
    -[PBFilter setValue:forKey:](self, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v30), CFSTR("inputV"));
  }
  if (objc_msgSend(v11, "containsObject:", CFSTR("inputAngle")))
  {
    *(float *)&v33 = *(float *)&dword_100043540 + (float)(v17 * 2.0);
    -[PBFilter setValue:forKey:](self, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v33), CFSTR("inputAngle"));
  }
}

- (void)handlePinchGesture:(float)a3 stateBegan:(BOOL)a4
{
  double v7;
  float v8;
  float v9;
  BOOL v10;

  if (objc_msgSend(-[PBFilter inputKeys](self, "inputKeys"), "containsObject:", CFSTR("inputAmount")))
  {
    if (a4)
    {
      dword_100043544 = LODWORD(a3);
      objc_msgSend(-[PBFilter valueForKey:](self, "valueForKey:", CFSTR("inputAmount")), "floatValue");
      dword_100043548 = LODWORD(v7);
    }
    else
    {
      LODWORD(v7) = dword_100043548;
    }
    v8 = (float)(*(float *)&v7 * a3) / *(float *)&dword_100043544;
    v9 = 1.0;
    if (v8 <= 1.0)
      v9 = v8;
    v10 = v8 < 0.0;
    LODWORD(v7) = 0;
    if (!v10)
      *(float *)&v7 = v9;
    -[PBFilter setValue:forKey:](self, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7), CFSTR("inputAmount"));
  }
}

- (void)handleRotateGesture:(float)a3 stateBegan:(BOOL)a4 mirror:(BOOL)a5
{
  int v8;
  double v9;

  if (objc_msgSend(-[PBFilter inputKeys](self, "inputKeys", a4, a5), "containsObject:", CFSTR("inputRotation")))
  {
    if (a4)
    {
      dword_10004354C = LODWORD(a3);
      objc_msgSend(-[PBFilter valueForKey:](self, "valueForKey:", CFSTR("inputRotation")), "floatValue");
      dword_100043550 = v8;
    }
    else
    {
      v8 = dword_100043550;
    }
    v9 = *(float *)&v8 - (float)(a3 - *(float *)&dword_10004354C);
    *(float *)&v9 = v9;
    -[PBFilter setValue:forKey:](self, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v9), CFSTR("inputRotation"));
  }
}

@end
