@implementation PUCropAspect

- (PUCropAspect)initWithWidth:(double)a3 height:(double)a4
{
  void *v7;
  void *v8;
  void *v9;
  PUCropAspect *v10;
  void *v12;

  PULocalizedString(CFSTR("PHOTOEDIT_CROP_ASPECT_RATIO_TEMPLATE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromInteger();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromInteger();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PUStringWithValidatedFormat();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PUCropAspect _initWithWidth:height:localizedName:](self, "_initWithWidth:height:localizedName:", v9, a3, a4, v8, v12);
  return v10;
}

- (PUCropAspect)init
{
  return -[PUCropAspect initWithWidth:height:](self, "initWithWidth:height:", 1.0, 1.0);
}

- (id)_initWithWidth:(double)a3 height:(double)a4 localizedName:(id)a5
{
  id v9;
  void *v10;
  PUCropAspect *v11;
  uint64_t v12;
  NSString *localizedName;
  void *v15;
  void *v16;
  objc_super v17;

  v9 = a5;
  v10 = v9;
  if (a3 < 0.0 || a4 < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCropAspect.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("width >= 0 && height >= 0"));

    if (v10)
      goto LABEL_4;
  }
  else if (v9)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCropAspect.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name != nil"));

LABEL_4:
  v17.receiver = self;
  v17.super_class = (Class)PUCropAspect;
  v11 = -[PUCropAspect init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    localizedName = v11->_localizedName;
    v11->_localizedName = (NSString *)v12;

    v11->_width = a3;
    v11->_height = a4;
    v11->_allowOrientationChange = a3 != a4;
  }

  return v11;
}

- (BOOL)isFreeformCrop
{
  double v3;
  double v5;

  -[PUCropAspect width](self, "width");
  if (v3 == 0.0)
    return 1;
  -[PUCropAspect height](self, "height");
  return v5 == 0.0;
}

- (double)ratio
{
  BOOL v3;
  double result;
  double v5;
  double v6;
  double v7;

  v3 = -[PUCropAspect isFreeformCrop](self, "isFreeformCrop");
  result = 1.0;
  if (!v3)
  {
    -[PUCropAspect width](self, "width", 1.0);
    v6 = v5;
    -[PUCropAspect height](self, "height");
    return v6 / v7;
  }
  return result;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_width);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PUCropAspect *v4;
  BOOL v5;

  v4 = (PUCropAspect *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[PUCropAspect isEqualToCropAspect:](self, "isEqualToCropAspect:", v4);
  }

  return v5;
}

- (BOOL)isEqualToCropAspect:(id)a3
{
  id v4;
  char v5;
  BOOL v6;
  void *v7;
  void *v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v4 = a3;
  if (!-[PUCropAspect isFreeformCrop](self, "isFreeformCrop")
    || (v5 = objc_msgSend(v4, "isFreeformCrop"), v6 = 1, v4) && (v5 & 1) == 0)
  {
    -[PUCropAspect localizedName](self, "localizedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if (v9
      && (-[PUCropAspect height](self, "height"),
          v11 = v10,
          objc_msgSend(v4, "height"),
          vabdd_f64(v11, v12) < 2.22044605e-16))
    {
      -[PUCropAspect width](self, "width");
      v14 = v13;
      objc_msgSend(v4, "width");
      v6 = vabdd_f64(v14, v15) < 2.22044605e-16;
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (BOOL)isEquivalentToCropAspect:(id)a3
{
  id v4;
  char v5;
  BOOL v6;
  double v7;
  double v8;
  double v9;

  v4 = a3;
  if (!-[PUCropAspect isFreeformCrop](self, "isFreeformCrop")
    || (v5 = objc_msgSend(v4, "isFreeformCrop"), v6 = 1, v4) && (v5 & 1) == 0)
  {
    if (-[PUCropAspect isFreeformCrop](self, "isFreeformCrop") || (objc_msgSend(v4, "isFreeformCrop") & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      -[PUCropAspect ratio](self, "ratio");
      v8 = v7;
      objc_msgSend(v4, "ratio");
      v6 = vabdd_f64(v8, v9) < 0.01;
    }
  }

  return v6;
}

- (double)widthForHeight:(double)a3
{
  double v4;

  -[PUCropAspect ratio](self, "ratio");
  return v4 * a3;
}

- (double)heightForWidth:(double)a3
{
  double v4;

  -[PUCropAspect ratio](self, "ratio");
  return a3 / v4;
}

- (CGRect)constrainRect:(CGRect)a3 boundingRect:(CGRect)a4 boundingAngle:(double)a5 minSize:(CGSize)a6
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double (**v16)(double, double, double, double);
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  float64x2_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGAffineTransform v45;
  _QWORD aBlock[7];
  CGAffineTransform v47;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v50;
  CGAffineTransform v51;
  double v52;
  double v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v43 = a3.size.height;
  v40 = a3.size.width;
  if (v52 >= a4.size.width || v53 >= a4.size.height)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", *(_QWORD *)&a6.width, *(_QWORD *)&a6.height, v53);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCropAspect.m"), 160, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("minSize.width < boundingRect.size.width && minSize.height < boundingRect.size.height"));

  }
  PLRectGetCenter();
  v13 = v12;
  v15 = v14;
  memset(&v51, 0, sizeof(v51));
  CGAffineTransformMakeTranslation(&v51, -v12, -v14);
  CGAffineTransformMakeRotation(&t2, a5);
  t1 = v51;
  CGAffineTransformConcat(&v50, &t1, &t2);
  v51 = v50;
  CGAffineTransformMakeTranslation(&v47, v13, v15);
  t1 = v51;
  CGAffineTransformConcat(&v50, &t1, &v47);
  v51 = v50;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PUCropAspect_constrainRect_boundingRect_boundingAngle_minSize___block_invoke;
  aBlock[3] = &unk_1E589DE30;
  *(double *)&aBlock[5] = v52;
  *(double *)&aBlock[6] = v53;
  aBlock[4] = self;
  v16 = (double (**)(double, double, double, double))_Block_copy(aBlock);
  v17 = v16[2](width, height, width, height);
  v19 = v18;
  v50 = v51;
  v54.origin.x = x;
  v54.origin.y = y;
  v54.size.width = v17;
  v54.size.height = v19;
  v55 = CGRectApplyAffineTransform(v54, &v50);
  v55.origin.x = fmin(width / v55.size.width, height / v55.size.height);
  v20 = ((double (*)(double (**)(double, double, double, double), double, double, double, double))v16[2])(v16, v40, v43, v17 * v55.origin.x, v19 * v55.origin.x);
  v22 = v21;
  PLRectGetCenter();
  v44 = v51.tx + v23 * v51.c + v51.a * v24;
  v41 = v51.ty + v23 * v51.d + v51.b * v24;
  v38 = v20;
  v25 = v22 * v51.c + v51.a * v20;
  v26 = v22 * v51.d + v51.b * v20;
  v56.origin.x = x;
  v56.origin.y = y;
  v56.size.width = width;
  v56.size.height = height;
  v39 = CGRectGetMinX(v56) + v25 * 0.5;
  v57.origin.x = x;
  v57.origin.y = y;
  v57.size.width = width;
  v57.size.height = height;
  v27 = CGRectGetMinY(v57) + v26 * 0.5;
  v58.origin.x = x;
  v58.origin.y = y;
  v58.size.width = width;
  v58.size.height = height;
  v28 = CGRectGetMaxX(v58) + v25 * -0.5;
  v59.origin.x = x;
  v59.origin.y = y;
  v59.size.width = width;
  v59.size.height = height;
  v42 = fmax(v27, fmin(v41, CGRectGetMaxY(v59) + v26 * -0.5));
  v50 = v51;
  CGAffineTransformInvert(&v45, &v50);
  v29 = vaddq_f64(*(float64x2_t *)&v45.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v45.c, v42), *(float64x2_t *)&v45.a, fmax(v39, fmin(v44, v28))));
  v30 = v29.f64[0] + v38 * -0.5;
  v31 = v29.f64[1] + v22 * -0.5;

  v32 = v30;
  v33 = v31;
  v34 = v38;
  v35 = v22;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (id)inverseAspect
{
  double v3;
  double v4;
  double v5;

  -[PUCropAspect height](self, "height");
  v4 = v3;
  -[PUCropAspect width](self, "width");
  return -[PUCropAspect initWithWidth:height:]([PUCropAspect alloc], "initWithWidth:height:", v4, v5);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PUCropAspect localizedName](self, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCropAspect width](self, "width");
  v7 = v6;
  -[PUCropAspect height](self, "height");
  v9 = v8;
  v10 = -[PUCropAspect isFreeformCrop](self, "isFreeformCrop");
  v11 = 0;
  if (!v10)
    -[PUCropAspect ratio](self, "ratio", 0.0);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: '%@' width: %f height: %f ratio: %f>"), v4, self, v5, v7, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (double)width
{
  return self->_width;
}

- (double)height
{
  return self->_height;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (BOOL)allowOrientationChange
{
  return self->_allowOrientationChange;
}

- (void)setAllowOrientationChange:(BOOL)a3
{
  self->_allowOrientationChange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);
}

double __65__PUCropAspect_constrainRect_boundingRect_boundingAngle_minSize___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  _BOOL4 v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BOOL4 v14;

  v8 = a3 > a5 || a2 > a4;
  if (v8)
    a2 = a4;
  v9 = fmax(a2, *(double *)(a1 + 40));
  if (v8)
    v10 = a5;
  else
    v10 = a3;
  objc_msgSend(*(id *)(a1 + 32), "widthForHeight:", fmax(v10, *(double *)(a1 + 48)));
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "heightForWidth:", v9);
  v14 = v13 <= a5 && v13 >= *(double *)(a1 + 48);
  if (v12 <= a4 && v12 >= *(double *)(a1 + 40) && v14)
    return fmax(v9, v12);
  if (v14)
    return v9;
  return v12;
}

+ (id)allAspectsWithOriginalSize:(CGSize)a3 currentSize:(CGSize)a4
{
  double height;
  double width;
  double v6;
  double v7;
  void *v9;
  BOOL v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  unint64_t v35;
  unint64_t v36;
  void *v37;
  void *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  height = a4.height;
  width = a4.width;
  v6 = a3.height;
  v7 = a3.width;
  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v7)
    v10 = (unint64_t)v6 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    objc_msgSend(a1, "originalAspectForWidth:height:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v11);

  }
  v12 = objc_alloc((Class)a1);
  PULocalizedString(CFSTR("PHOTOEDIT_CROP_ASPECT_RATIO_FREEFORM"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "_initWithWidth:height:localizedName:", v13, 0.0, 0.0);
  objc_msgSend(v9, "addObject:", v14);

  v15 = objc_alloc((Class)a1);
  PULocalizedString(CFSTR("PHOTOEDIT_CROP_ASPECT_RATIO_SQUARE"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "_initWithWidth:height:localizedName:", v16, 1.0, 1.0);
  objc_msgSend(v9, "addObject:", v17);

  v18 = (void *)MGCopyAnswer();
  if ((objc_msgSend(v18, "isEqualToString:", CFSTR("iPad")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    v21 = v20;
    v23 = v22;

    v24 = objc_alloc((Class)a1);
    PULocalizedString(CFSTR("PHOTOEDIT_CROP_ASPECT_WALLPAPER"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "_initWithWidth:height:localizedName:", v25, v21, v23);

    objc_msgSend(v26, "setAllowOrientationChange:", 0);
    objc_msgSend(v9, "addObject:", v26);

  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v27 = objc_msgSend(&unk_1E59B9DA8, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v41 != v29)
          objc_enumerationMutation(&unk_1E59B9DA8);
        v31 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "unsignedIntegerValue");

        objc_msgSend(v31, "objectAtIndexedSubscript:", 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "unsignedIntegerValue");

        if (width >= height)
          v36 = v35;
        else
          v36 = v33;
        if (width >= height)
          v35 = v33;
        v37 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithWidth:height:", (double)v36, (double)v35);
        objc_msgSend(v9, "addObject:", v37);

      }
      v28 = objc_msgSend(&unk_1E59B9DA8, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v28);
  }
  v38 = (void *)objc_msgSend(v9, "copy");

  return v38;
}

+ (id)originalAspectForWidth:(unint64_t)a3 height:(unint64_t)a4
{
  void *v7;
  void *v8;

  PULocalizedString(CFSTR("PHOTOEDIT_CROP_ASPECT_RATIO_ORIGINAL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithWidth:height:localizedName:", v7, (double)a3, (double)a4);

  return v8;
}

@end
