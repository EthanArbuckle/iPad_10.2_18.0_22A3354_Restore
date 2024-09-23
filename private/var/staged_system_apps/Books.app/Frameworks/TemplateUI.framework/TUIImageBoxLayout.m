@implementation TUIImageBoxLayout

+ (const)_storageDataset
{
  return (const Dataset *)TUIImageLayoutStorageDataset;
}

- (TUIImageBoxLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  TUIImageBoxLayout *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUIImageBoxLayout;
  result = -[TUILayout initWithModel:parent:controller:](&v6, "initWithModel:parent:controller:", a3, a4, a5);
  if (result)
    result->_intrinsicContentSize = CGSizeZero;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[TUIImageResource removeObserver:](self->_intrinsicImageResource, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)TUIImageBoxLayout;
  -[TUIImageBoxLayout dealloc](&v3, "dealloc");
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)specifiedIntrinsicWidth
{
  void *v3;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)objc_msgSend(v3, "intrinsicWidth");

  return v4;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)specifiedIntrinsicHeight
{
  void *v3;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)objc_msgSend(v3, "intrinsicHeight");

  return v4;
}

- (void)imageResourceDidChangeIntrinsicSize:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUITransaction currentOrImplicitTransaction](TUITransaction, "currentOrImplicitTransaction", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transactionCoordinator"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_167B7C;
  v7[3] = &unk_2430D8;
  v7[4] = self;
  objc_msgSend(v6, "scheduleLayoutUpdateWithTransaction:block:", v4, v7);

}

- (id)_newIntrinsicImageResource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "urlString"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "urlString"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "baseURL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", v6, v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "manager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageResourceCache"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
    objc_msgSend(v13, "contentsScale");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageResourceForURL:contentsScale:", v9));
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "resourceKind"));

    if (!v16)
    {
      v14 = 0;
      goto LABEL_6;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "resourceKind"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "resourceInstance"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "resourceOptions"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "intrinsicImageResourceForKind:instance:options:", v11, v13, v19));

    v9 = v17;
  }

LABEL_6:
  objc_msgSend(v14, "loadIntrinsicSize");
  return v14;
}

- (id)_newImageResourcesWithContext:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v43;

  v43 = a3;
  -[TUILayout computedNaturalSize](self, "computedNaturalSize");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v43, "contentsScale");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "manager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageResourceCache"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "urlString"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "urlString"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "baseURL"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageResourceForTemplatedURL:baseURL:naturalSize:contentsScale:", v16, v18, v5, v7, v9));
LABEL_5:

    goto LABEL_6;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "resourceKind"));

  if (v21)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "resourceKind"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "resourceInstance"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "resourceOptions"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "imageResourceForKind:naturalSize:contentsScale:instance:options:", v17, v22, v24, v5, v7, v9));

    goto LABEL_5;
  }
  v19 = 0;
LABEL_6:
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "maskColor"));

  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "maskColor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageResource:tintedWithColor:", v19, v28));

  }
  else
  {
    v29 = v19;
  }
  if ((objc_opt_respondsToSelector(v29, "filterOptions") & 1) != 0)
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "filterOptions"));
  else
    v30 = 0;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "filter"));

  if (v32)
  {
    -[TUILayout computedNaturalSize](self, "computedNaturalSize");
    v34 = v33;
    v36 = v35;
    objc_msgSend(v43, "contentsScale");
    v38 = v37;
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "filter"));
    v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageResource:naturalSize:contentsScale:withFilter:filterOptions:", v29, v40, v30, v34, v36, v38));

    v29 = (void *)v41;
  }

  return v29;
}

- (void)onInvalidateIntrinsicSize
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIImageBoxLayout;
  -[TUILayout onInvalidateIntrinsicSize](&v3, "onInvalidateIntrinsicSize");
  self->_intrinsicContentSize = CGSizeZero;
}

- (void)_computeIntrinsicContentSize
{
  double height;
  CGSize *p_intrinsicContentSize;
  float v6;
  float v7;

  height = CGSizeZero.height;
  p_intrinsicContentSize = &self->_intrinsicContentSize;
  if (CGSizeZero.width == self->_intrinsicContentSize.width && height == self->_intrinsicContentSize.height)
  {
    v6 = COERCE_FLOAT(-[TUIImageBoxLayout specifiedIntrinsicWidth](self, "specifiedIntrinsicWidth", CGSizeZero.width, height));
    v7 = COERCE_FLOAT(-[TUIImageBoxLayout specifiedIntrinsicHeight](self, "specifiedIntrinsicHeight"));
    p_intrinsicContentSize->width = v6;
    p_intrinsicContentSize->height = v7;
    self->_usingPlaceholderIntrinsicSize = 0;
  }
}

- (double)constrainComputedWidth:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  objc_msgSend(v5, "maxAspectRatio");
  v7 = v6;

  -[TUIImageBoxLayout computeIntrinsicAspectRatio](self, "computeIntrinsicAspectRatio");
  if (v8 > v7)
    return v7 * (a3 / v8);
  return a3;
}

- (double)constrainComputedHeight:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  objc_msgSend(v5, "maxAspectRatio");
  v7 = v6;

  -[TUIImageBoxLayout computeIntrinsicAspectRatio](self, "computeIntrinsicAspectRatio");
  if (v8 > v7)
    return v8 * a3 / v7;
  return a3;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  double width;
  unsigned int v5;
  uint64_t v7;

  -[TUIImageBoxLayout _computeIntrinsicContentSize](self, "_computeIntrinsicContentSize");
  width = self->_intrinsicContentSize.width;
  if (width <= -3.40282347e38)
  {
    v7 = 4286578687;
  }
  else
  {
    if (width < 3.40282347e38)
    {
      *(float *)&v5 = width;
      return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v5 | 0x7FC0000000000000);
    }
    v7 = 2139095039;
  }
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v7 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight
{
  double height;
  unsigned int v5;
  uint64_t v7;

  -[TUIImageBoxLayout _computeIntrinsicContentSize](self, "_computeIntrinsicContentSize");
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
      return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v5 | 0x7FC0000000000000);
    }
    v7 = 2139095039;
  }
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v7 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)validatedIntrinsicWidthConsideringSpecified
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  BOOL v9;
  float v10;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v11;
  unint64_t v12;

  v4 = -[TUILayout specifiedWidth](self, "specifiedWidth");
  v6 = v5;
  if ((v5 & 0x6000000000000) == 0x2000000000000)
  {
    -[TUILayout computeDerivedWidth](self, "computeDerivedWidth");
    if (v7 <= -3.40282347e38)
    {
      v8 = 4286578687;
    }
    else
    {
      v8 = 2139095039;
      v9 = v7 < 3.40282347e38;
      v10 = v7;
      if (v9)
        v8 = LODWORD(v10);
    }
    v4 = v8 | v4 & 0xFFFFFFFF00000000;
    v6 &= 0xFFE8FFFFFFFFFFFFLL;
  }
  v11 = -[TUILayout validatedIntrinsicWidth](self, "validatedIntrinsicWidth");
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUILengthCombineSpecifiedAndIntrinsic(v4, v6, (uint64_t)v11, v12);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)validatedIntrinsicHeightConsideringSpecified
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  BOOL v9;
  float v10;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v11;
  unint64_t v12;

  v4 = -[TUILayout specifiedWidth](self, "specifiedWidth");
  v6 = v5;
  if ((v5 & 0x6000000000000) == 0x2000000000000)
  {
    -[TUILayout computeDerivedHeight](self, "computeDerivedHeight");
    if (v7 <= -3.40282347e38)
    {
      v8 = 4286578687;
    }
    else
    {
      v8 = 2139095039;
      v9 = v7 < 3.40282347e38;
      v10 = v7;
      if (v9)
        v8 = LODWORD(v10);
    }
    v4 = v8 | v4 & 0xFFFFFFFF00000000;
    v6 &= 0xFFE8FFFFFFFFFFFFLL;
  }
  v11 = -[TUILayout validatedIntrinsicHeight](self, "validatedIntrinsicHeight");
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUILengthCombineSpecifiedAndIntrinsic(v4, v6, (uint64_t)v11, v12);
}

- (double)computeIntrinsicAspectRatio
{
  double width;
  double result;

  -[TUIImageBoxLayout _computeIntrinsicContentSize](self, "_computeIntrinsicContentSize");
  width = self->_intrinsicContentSize.width;
  result = 1.0;
  if (width > 0.0)
    return self->_intrinsicContentSize.height / width;
  return result;
}

- (void)computeLayout
{
  double v3;
  double v4;
  double v5;

  -[TUILayout computeWidth](self, "computeWidth");
  v4 = v3;
  -[TUILayout computeHeight](self, "computeHeight");
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", fmax(v4, 1.0), fmax(v5, 1.0));
}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  double v6;
  double v7;
  TUIRenderModelLayer *v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  TUIImageLayerConfig *v26;
  double v27;
  double v28;
  void *v29;
  unsigned __int8 v30;
  void *v31;
  unsigned __int8 v32;
  void *v33;
  void *v34;
  TUIImageLayerConfig *v35;
  void *v36;
  void *v37;
  uint64_t v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;

  v44 = a4;
  -[TUILayout renderModelSizeWithContext:](self, "renderModelSizeWithContext:");
  if (a3 - 1 >= 2)
  {
    v9 = v6;
    v10 = v7;
    if (self->_usingPlaceholderIntrinsicSize)
      v11 = 0;
    else
      v11 = -[TUIImageBoxLayout _newImageResourcesWithContext:](self, "_newImageResourcesWithContext:", v44);
    v41 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "url"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v14 = TUIResourceLoadForURL(v12, (uint64_t)objc_msgSend(v13, "load"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    objc_msgSend(v15, "cornerRadius");
    v17 = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "fallbackColor"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "contentsGravity"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    objc_msgSend(v20, "opacity");
    v22 = v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    if (objc_msgSend(v23, "hflipForRTL"))
      v40 = (char *)-[TUILayout computedLayoutDirection](self, "computedLayoutDirection") == (char *)&dword_0 + 2;
    else
      v40 = 0;

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v25 = objc_msgSend(v24, "crossfadesContents");

    v26 = [TUIImageLayerConfig alloc];
    objc_msgSend(v44, "contentsScale");
    v28 = v27;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v30 = objc_msgSend(v29, "continuousCorners");
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v32 = objc_msgSend(v31, "shouldRasterize");
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "blendMode"));
    BYTE1(v39) = v32;
    LOBYTE(v39) = v30;
    v35 = -[TUIImageLayerConfig initWithContentsScale:resource:load:cornerRadius:fallbackColor:contentsGravity:hflip:crossfadesContents:opacity:continuousCorners:shouldRasterize:blendMode:](v26, "initWithContentsScale:resource:load:cornerRadius:fallbackColor:contentsGravity:hflip:crossfadesContents:opacity:continuousCorners:shouldRasterize:blendMode:", v41, v14, v43, v42, v40, v25, v28, v17, v22, v39, v34);

    v8 = -[TUIRenderModelLayer initWithSubmodels:config:erasableInsets:]([TUIRenderModelLayer alloc], "initWithSubmodels:config:erasableInsets:", 0, v35, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    -[TUIRenderModelLayer setSize:](v8, "setSize:", v9, v10);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "identifier"));
    -[TUIRenderModelLayer setIdentifier:](v8, "setIdentifier:", v37);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CGRect)computedErasableBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CGRect result;

  -[TUILayout computedBounds](self, "computedBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "filter"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "manager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "filterRegistry"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "imageFilterWithIdentifier:", v12));

  }
  else
  {
    v16 = 0;
  }
  if (objc_msgSend(v16, "supportsOptions"))
  {
    -[TUILayout computedNaturalSize](self, "computedNaturalSize");
    v18 = v17;
    v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
    objc_msgSend(v21, "contentsScale");
    v23 = v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "urlString"));

    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "manager"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "imageResourceCache"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "urlString"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "baseURL"));
      v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "imageResourceForTemplatedURL:baseURL:naturalSize:contentsScale:", v30, v32, v18, v20, v23));
    }
    else
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "resourceKind"));

      if (!v46)
      {
        v47 = 0;
        goto LABEL_12;
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "resourceKind"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "resourceInstance"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "resourceOptions"));
      v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "imageResourceForKind:naturalSize:contentsScale:instance:options:", v28, v30, v32, v18, v20, v23));
    }
    v47 = (void *)v33;

LABEL_12:
    if ((objc_opt_respondsToSelector(v47, "filterOptions") & 1) != 0)
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "filterOptions"));
    else
      v48 = 0;
    objc_msgSend(v16, "insetsForSize:contentsScale:options:", v48, v18, v20, v23);
    v4 = v4 - v49;
    v6 = v6 - v50;
    v8 = v8 + v49 + v51;
    v10 = v10 + v50 + v52;

    goto LABEL_16;
  }
  if (v16)
  {
    -[TUILayout computedNaturalSize](self, "computedNaturalSize");
    v35 = v34;
    v37 = v36;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
    objc_msgSend(v38, "contentsScale");
    v40 = v39;

    objc_msgSend(v16, "insetsForSize:contentsScale:options:", 0, v35, v37, v40);
    v4 = v4 - v41;
    v6 = v6 - v42;
    v8 = v8 + v41 + v43;
    v10 = v10 + v42 + v44;
  }
LABEL_16:

  v53 = v4;
  v54 = v6;
  v55 = v8;
  v56 = v10;
  result.size.height = v56;
  result.size.width = v55;
  result.origin.y = v54;
  result.origin.x = v53;
  return result;
}

- (TUIImageResource)intrinsicImageResource
{
  return self->_intrinsicImageResource;
}

- (void)setIntrinsicImageResource:(id)a3
{
  objc_storeStrong((id *)&self->_intrinsicImageResource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intrinsicImageResource, 0);
}

@end
