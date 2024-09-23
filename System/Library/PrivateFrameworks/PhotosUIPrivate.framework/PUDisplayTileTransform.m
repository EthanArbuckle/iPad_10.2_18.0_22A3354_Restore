@implementation PUDisplayTileTransform

- (PUDisplayTileTransform)init
{
  PUDisplayTileTransform *result;
  uint64_t v3;
  __int128 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUDisplayTileTransform;
  result = -[PUDisplayTileTransform init](&v5, sel_init);
  if (result)
  {
    v3 = MEMORY[0x1E0C9BAA8];
    v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&result->_affineTransform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&result->_affineTransform.c = v4;
    *(_OWORD *)&result->_affineTransform.tx = *(_OWORD *)(v3 + 32);
    result->__initialScale = 1.0;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  CGAffineTransform transform;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PUDisplayTileTransform hasUserInput](self, "hasUserInput");
  -[PUDisplayTileTransform affineTransform](self, "affineTransform");
  NSStringFromCGAffineTransform(&transform);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; hasUserInput:%i; affineTransform:%@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CGAffineTransform)affineTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].c;
  return self;
}

- (void)_setAffineTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_affineTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_affineTransform.tx = v4;
  *(_OWORD *)&self->_affineTransform.a = v3;
}

- (BOOL)hasUserInput
{
  return self->_hasUserInput;
}

- (void)_setHasUserInput:(BOOL)a3
{
  self->_hasUserInput = a3;
}

- (NSString)userInputOriginIdentifier
{
  return self->_userInputOriginIdentifier;
}

- (void)_setUserInputOriginIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CGSize)transformPadding
{
  double width;
  double height;
  CGSize result;

  width = self->_transformPadding.width;
  height = self->_transformPadding.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setTransformPadding:(CGSize)a3
{
  self->_transformPadding = a3;
}

- (double)_initialScale
{
  return self->__initialScale;
}

- (void)_setInitialScale:(double)a3
{
  self->__initialScale = a3;
}

- (CGSize)_initialSize
{
  double width;
  double height;
  CGSize result;

  width = self->__initialSize.width;
  height = self->__initialSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setInitialSize:(CGSize)a3
{
  self->__initialSize = a3;
}

- (CGSize)_displaySize
{
  double width;
  double height;
  CGSize result;

  width = self->__displaySize.width;
  height = self->__displaySize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setDisplaySize:(CGSize)a3
{
  self->__displaySize = a3;
}

- (BOOL)isZoomedOut
{
  return self->_isZoomedOut;
}

- (void)_setZoomedOut:(BOOL)a3
{
  self->_isZoomedOut = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInputOriginIdentifier, 0);
}

- (PUModelTileTransform)modelTileTransform
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
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
  double v22;
  BOOL v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  PUModelTileTransform *v33;
  void *v34;
  PUModelTileTransform *v35;
  void *v37;
  _BYTE v38[48];
  double v39;
  __int128 v40;

  if (!-[PUDisplayTileTransform hasUserInput](self, "hasUserInput"))
    return -[PUModelTileTransform initWithNoUserInput]([PUModelTileTransform alloc], "initWithNoUserInput");
  v40 = *MEMORY[0x1E0C9D538];
  v39 = 1.0;
  -[PUDisplayTileTransform affineTransform](self, "affineTransform");
  PUDecomposeTransform((uint64_t)v38, &v40, &v39, 0, 0);
  -[PUDisplayTileTransform _initialScale](self, "_initialScale");
  v5 = v4;
  if (v4 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUDisplayTileTransform.m"), 226, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("initialScale != 0.0"));

  }
  v6 = v39 / v5;
  -[PUDisplayTileTransform _displaySize](self, "_displaySize");
  v8 = v7;
  v10 = v9;
  -[PUDisplayTileTransform transformPadding](self, "transformPadding");
  v12 = v11;
  v14 = v13;
  -[PUDisplayTileTransform _initialSize](self, "_initialSize");
  v17 = v16 * v6;
  v18 = v15 * v6 - v8;
  v19 = 0.0;
  v20 = v12 + fmax(v18, 0.0);
  if (v12 > 0.0)
    v18 = v20;
  v21 = v18 * 0.5;
  v22 = *(double *)&v40 + v18 * 0.5;
  if (*(double *)&v40 >= -(v18 * 0.5))
    v22 = 0.0;
  v23 = v21 < *(double *)&v40;
  v24 = *(double *)&v40 - v21;
  if (!v23)
    v24 = v22;
  if (v18 > 0.0)
    v25 = v24;
  else
    v25 = *(double *)&v40;
  v26 = fmax(fmin(*(double *)&v40 / v18, 0.5), -0.5);
  v27 = v17 - v10;
  v28 = v14 + fmax(v17 - v10, 0.0);
  if (v14 > 0.0)
    v27 = v28;
  v29 = v27 * 0.5;
  if (*((double *)&v40 + 1) < -(v27 * 0.5))
    v19 = v27 * 0.5 + *((double *)&v40 + 1);
  if (v29 < *((double *)&v40 + 1))
    v30 = *((double *)&v40 + 1) - v29;
  else
    v30 = v19;
  if (v27 > 0.0)
    v31 = v30;
  else
    v31 = *((double *)&v40 + 1);
  v32 = fmax(fmin(*((double *)&v40 + 1) / v27, 0.5), -0.5);
  v33 = [PUModelTileTransform alloc];
  -[PUDisplayTileTransform userInputOriginIdentifier](self, "userInputOriginIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[PUModelTileTransform initWithNormalizedTranslation:overscroll:scale:userInputOriginIdentifier:isZoomedOut:](v33, "initWithNormalizedTranslation:overscroll:scale:userInputOriginIdentifier:isZoomedOut:", v34, -[PUDisplayTileTransform isZoomedOut](self, "isZoomedOut"), v26, v32, v25, v31, v6);

  return v35;
}

- (id)newDisplayTileTransformWithUserAffineTransform:(CGAffineTransform *)a3 userInputOriginIdentifier:(id)a4 isZoomedOut:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  PUDisplayTileTransform *v9;
  __int128 v10;
  _OWORD v12[3];

  v5 = a5;
  v8 = a4;
  v9 = objc_alloc_init(PUDisplayTileTransform);
  -[PUDisplayTileTransform _setHasUserInput:](v9, "_setHasUserInput:", 1);
  v10 = *(_OWORD *)&a3->c;
  v12[0] = *(_OWORD *)&a3->a;
  v12[1] = v10;
  v12[2] = *(_OWORD *)&a3->tx;
  -[PUDisplayTileTransform _setAffineTransform:](v9, "_setAffineTransform:", v12);
  -[PUDisplayTileTransform _initialScale](self, "_initialScale");
  -[PUDisplayTileTransform _setInitialScale:](v9, "_setInitialScale:");
  -[PUDisplayTileTransform _initialSize](self, "_initialSize");
  -[PUDisplayTileTransform _setInitialSize:](v9, "_setInitialSize:");
  -[PUDisplayTileTransform _displaySize](self, "_displaySize");
  -[PUDisplayTileTransform _setDisplaySize:](v9, "_setDisplaySize:");
  -[PUDisplayTileTransform _setUserInputOriginIdentifier:](v9, "_setUserInputOriginIdentifier:", v8);

  -[PUDisplayTileTransform transformPadding](self, "transformPadding");
  -[PUDisplayTileTransform _setTransformPadding:](v9, "_setTransformPadding:");
  -[PUDisplayTileTransform _setZoomedOut:](v9, "_setZoomedOut:", v5);
  return v9;
}

+ (id)displayTileTransformWithModelTileTransform:(id)a3 initialScale:(double)a4 initialSize:(CGSize)a5 displaySize:(CGSize)a6 secondaryDisplayTileTransform:(id)a7
{
  double width;
  double v9;
  double v10;
  id v14;
  id v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
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
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  __int128 v60;
  PUDisplayTileTransform *v61;
  void *v62;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double height;
  CGAffineTransform v81;
  CGAffineTransform v82;
  CGAffineTransform v83;

  height = a6.height;
  width = a6.width;
  v9 = a5.height;
  v10 = a5.width;
  v14 = a3;
  v15 = a7;
  v77 = a4;
  if (a4 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUDisplayTileTransform.m"), 126, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("initialScale != 0.0f"));

  }
  v16 = objc_msgSend(v14, "hasUserInput");
  objc_msgSend(v14, "normalizedTranslation");
  v75 = v17;
  v76 = v18;
  objc_msgSend(v14, "scale");
  v79 = v19;
  objc_msgSend(v14, "overscroll");
  v22 = *MEMORY[0x1E0C9D820];
  v23 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v78 = v10;
  if (v15)
  {
    v72 = v20;
    v73 = v21;
    objc_msgSend(v15, "modelTileTransform");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_initialSize");
    v74 = v9;
    v26 = v25;
    v28 = v27;
    objc_msgSend(v15, "_displaySize");
    v30 = v29;
    v32 = v31;
    objc_msgSend(v24, "scale");
    v68 = v28 * v33;
    v70 = v26 * v33;
    v66 = fmin(fmax(width / v10, height / v74), fmax(v30 / v26, v32 / v28));
    +[PUAirPlaySettings sharedInstance](PUAirPlaySettings, "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "minimumZoomForScrollPadding");
    v36 = v35;
    objc_msgSend(v34, "maximumZoomForScrollPadding");
    v38 = fmax(v36, fmin(v37, v66));
    v39 = v26 * v38 - v30;
    v40 = v28 * v38 - v32;
    if (v70 - v30 < v39)
      v39 = v70 - v30;
    if (v68 - v32 < v40)
      v40 = v68 - v32;
    v69 = v40;
    v71 = v39;
    v41 = fmin(width / v30, height / v32);
    v65 = height - v32 * v41;
    v67 = width - v30 * v41;
    objc_msgSend(v24, "scale");
    v43 = v26 * v42;
    v9 = v74;
    v44 = v28 * v42;
    v45 = v43 - v30;
    v46 = v22 + fmax(v45, 0.0);
    if (v22 > 0.0)
      v45 = v46;
    v47 = v44 - v32;
    v48 = v23 + fmax(v47, 0.0);
    v49 = v78 * v79 - width;
    v50 = fmax(v49, 0.0);
    v51 = v22 + v50;
    if (v22 <= 0.0)
      v51 = v78 * v79 - width;
    if (v23 > 0.0)
      v47 = v48;
    v52 = v74 * v79 - height;
    v53 = fmax(v52, 0.0);
    v54 = v23 + v53;
    if (v23 <= 0.0)
      v54 = v74 * v79 - height;
    if (v22 >= v51)
      v55 = v22;
    else
      v55 = v51;
    if (v23 >= v54)
      v54 = v23;
    v56 = v45 - v55;
    v57 = v47 - v54;
    if (v56 >= v67 - v55)
      v56 = v67 - v55;
    if (v57 >= v65 - v54)
      v57 = v65 - v54;
    if (v71 - v55 < v56)
      v56 = v71 - v55;
    if (v69 - v54 < v57)
      v57 = v69 - v54;
    if (v22 < v56)
      v22 = v56;
    if (v23 < v57)
      v23 = v57;

    v20 = v72;
    v21 = v73;
  }
  else
  {
    v49 = v10 * v79 - width;
    v50 = fmax(v49, 0.0);
    v52 = v9 * v79 - height;
    v53 = fmax(v52, 0.0);
  }
  if (v22 <= 0.0)
    v58 = v49;
  else
    v58 = v22 + v50;
  if (v23 <= 0.0)
    v59 = v52;
  else
    v59 = v23 + v53;
  if (v58 > 0.0)
    v20 = v20 + v58 * v75;
  if (v59 > 0.0)
    v21 = v21 + v59 * v76;
  v60 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v83.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v83.c = v60;
  *(_OWORD *)&v83.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v82.a = *(_OWORD *)&v83.a;
  *(_OWORD *)&v82.c = v60;
  *(_OWORD *)&v82.tx = *(_OWORD *)&v83.tx;
  CGAffineTransformTranslate(&v83, &v82, v20, v21);
  v81 = v83;
  CGAffineTransformScale(&v82, &v81, v79 * v77, v79 * v77);
  v83 = v82;
  v61 = objc_alloc_init(PUDisplayTileTransform);
  -[PUDisplayTileTransform _setHasUserInput:](v61, "_setHasUserInput:", v16);
  v82 = v83;
  -[PUDisplayTileTransform _setAffineTransform:](v61, "_setAffineTransform:", &v82);
  -[PUDisplayTileTransform _setInitialScale:](v61, "_setInitialScale:", v77);
  -[PUDisplayTileTransform _setInitialSize:](v61, "_setInitialSize:", v78, v9);
  -[PUDisplayTileTransform _setDisplaySize:](v61, "_setDisplaySize:", width, height);
  objc_msgSend(v14, "userInputOriginIdentifier");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUDisplayTileTransform _setUserInputOriginIdentifier:](v61, "_setUserInputOriginIdentifier:", v62);

  -[PUDisplayTileTransform _setTransformPadding:](v61, "_setTransformPadding:", v22, v23);
  return v61;
}

@end
