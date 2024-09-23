@implementation PXPeopleFaceCropFetchOptions

- (PXPeopleFaceCropFetchOptions)initWithPerson:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5
{
  double height;
  double width;
  id v10;
  PXPeopleFaceCropFetchOptions *v11;
  PXPeopleFaceCropFetchOptions *v12;
  void *v14;
  objc_super v15;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleFaceCropFetchOptions.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("person"));

  }
  v15.receiver = self;
  v15.super_class = (Class)PXPeopleFaceCropFetchOptions;
  v11 = -[PXPeopleFaceCropFetchOptions init](&v15, sel_init);
  v12 = v11;
  if (v11)
    -[PXPeopleFaceCropFetchOptions _commonInitWithPerson:face:targetSize:displayScale:](v11, "_commonInitWithPerson:face:targetSize:displayScale:", v10, 0, width, height, a5);

  return v12;
}

- (PXPeopleFaceCropFetchOptions)initWithFace:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5
{
  double height;
  double width;
  id v10;
  PXPeopleFaceCropFetchOptions *v11;
  PXPeopleFaceCropFetchOptions *v12;
  void *v14;
  objc_super v15;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleFaceCropFetchOptions.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("face"));

  }
  v15.receiver = self;
  v15.super_class = (Class)PXPeopleFaceCropFetchOptions;
  v11 = -[PXPeopleFaceCropFetchOptions init](&v15, sel_init);
  v12 = v11;
  if (v11)
    -[PXPeopleFaceCropFetchOptions _commonInitWithPerson:face:targetSize:displayScale:](v11, "_commonInitWithPerson:face:targetSize:displayScale:", 0, v10, width, height, a5);

  return v12;
}

- (PXPeopleFaceCropFetchOptions)initWithPerson:(id)a3 face:(id)a4 targetSize:(CGSize)a5 displayScale:(double)a6
{
  double height;
  double width;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  char v18;
  PXPeopleFaceCropFetchOptions *v19;
  PXPeopleFaceCropFetchOptions *v20;
  void *v22;
  void *v23;
  objc_super v24;
  uint8_t buf[16];

  height = a5.height;
  width = a5.width;
  v12 = a3;
  v13 = a4;
  v14 = v13;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleFaceCropFetchOptions.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("person"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleFaceCropFetchOptions.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("face"));

LABEL_3:
  objc_msgSend(v12, "photoLibrary");
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "photoLibrary");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v15 == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = -[NSObject isEqual:](v15, "isEqual:", v16);

    if ((v18 & 1) != 0)
      goto LABEL_9;
    PXAssertGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "person.photoLibrary and face.photoLibrary are not equal", buf, 2u);
    }
  }

LABEL_9:
  v24.receiver = self;
  v24.super_class = (Class)PXPeopleFaceCropFetchOptions;
  v19 = -[PXPeopleFaceCropFetchOptions init](&v24, sel_init);
  v20 = v19;
  if (v19)
    -[PXPeopleFaceCropFetchOptions _commonInitWithPerson:face:targetSize:displayScale:](v19, "_commonInitWithPerson:face:targetSize:displayScale:", v12, v14, width, height, a6);

  return v20;
}

- (void)_commonInitWithPerson:(id)a3 face:(id)a4 targetSize:(CGSize)a5 displayScale:(double)a6
{
  double height;
  double width;
  PHPerson *v11;
  PHFace *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  PHPerson *person;
  PHPerson *v17;
  PHFace *face;
  uint8_t v19[16];
  uint8_t v20[16];
  uint8_t buf[16];

  height = a5.height;
  width = a5.width;
  v11 = (PHPerson *)a3;
  v12 = (PHFace *)a4;
  if (height <= 0.0)
  {
    PXAssertGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "targetSize.height is not greater than 0", buf, 2u);
    }

  }
  if (width <= 0.0)
  {
    PXAssertGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v20 = 0;
      _os_log_error_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "targetSize.width is not greater than 0", v20, 2u);
    }

  }
  if (a6 < 1.0)
  {
    PXAssertGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      _os_log_error_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "displayScale is < 1", v19, 2u);
    }

  }
  self->_clientTargetSize.width = width;
  self->_clientTargetSize.height = height;
  self->_displayScale = a6;
  self->_targetPixelSize.width = width * a6;
  self->_targetPixelSize.height = height * a6;
  self->_cropFactor = 0;
  self->_cornerStyle = +[PXPeopleFaceCropFetchOptions recommendedCornerStyleForCurrentAppConfiguration](PXPeopleFaceCropFetchOptions, "recommendedCornerStyleForCurrentAppConfiguration");
  +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled");
  self->_wantsFlippedContentsRect = 0;
  person = self->_person;
  self->_person = v11;
  v17 = v11;

  face = self->_face;
  self->_face = v12;

  self->_deliveryMode = 0;
  self->_shouldCacheResult = 1;
}

- (BOOL)areFetchParametersEqualtoFetchParametersOfOptions:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;
  double v14;
  int64_t v15;
  int64_t v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  id v21;
  id v22;
  void *v23;
  char v24;
  id v25;
  id v26;
  void *v27;
  char v28;
  int v29;
  _BOOL4 v31;

  v4 = a3;
  -[PXPeopleFaceCropFetchOptions clientTargetSize](self, "clientTargetSize");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "clientTargetSize");
  if (v6 != v10 || v8 != v9)
    goto LABEL_19;
  -[PXPeopleFaceCropFetchOptions displayScale](self, "displayScale");
  v13 = v12;
  objc_msgSend(v4, "displayScale");
  if (v13 != v14)
    goto LABEL_19;
  v15 = -[PXPeopleFaceCropFetchOptions cropFactor](self, "cropFactor");
  if (v15 != objc_msgSend(v4, "cropFactor"))
    goto LABEL_19;
  v16 = -[PXPeopleFaceCropFetchOptions cornerStyle](self, "cornerStyle");
  if (v16 != objc_msgSend(v4, "cornerStyle"))
    goto LABEL_19;
  -[PXPeopleFaceCropFetchOptions person](self, "person");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "person");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (v17 == v18)
  {

  }
  else
  {
    v19 = v18;
    v20 = objc_msgSend(v17, "isEqual:", v18);

    if ((v20 & 1) == 0)
      goto LABEL_19;
  }
  -[PXPeopleFaceCropFetchOptions face](self, "face");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "face");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (v21 == v22)
  {

  }
  else
  {
    v23 = v22;
    v24 = objc_msgSend(v21, "isEqual:", v22);

    if ((v24 & 1) == 0)
      goto LABEL_19;
  }
  -[PXPeopleFaceCropFetchOptions asset](self, "asset");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asset");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  if (v25 == v26)
  {

    goto LABEL_22;
  }
  v27 = v26;
  v28 = objc_msgSend(v25, "isEqual:", v26);

  if ((v28 & 1) != 0)
  {
LABEL_22:
    v31 = -[PXPeopleFaceCropFetchOptions wantsFlippedContentsRect](self, "wantsFlippedContentsRect");
    v29 = v31 ^ objc_msgSend(v4, "wantsFlippedContentsRect") ^ 1;
    goto LABEL_20;
  }
LABEL_19:
  LOBYTE(v29) = 0;
LABEL_20:

  return v29;
}

- (PHPhotoLibrary)photoLibrary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PXPeopleFaceCropFetchOptions person](self, "person");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PXPeopleFaceCropFetchOptions face](self, "face");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (PHPhotoLibrary *)v5;
}

- (NSString)cacheKey
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v9;

  -[PXPeopleFaceCropFetchOptions person](self, "person");
  v4 = objc_claimAutoreleasedReturnValue();
  -[PXPeopleFaceCropFetchOptions face](self, "face");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!(v4 | v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleFaceCropFetchOptions.m"), 112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("person || face"));

  }
  objc_msgSend((id)v4, "localIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
  {
    objc_msgSend((id)v5, "localIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }

  return (NSString *)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6;
  void *v7;
  void *v8;
  PXPeopleFaceCropFetchOptions *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  PXPeopleFaceCropFetchOptions *v17;
  void *v18;
  PXPeopleFaceCropFetchOptions *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  void *v26;
  PXPeopleFaceCropFetchOptions *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v35;

  -[PXPeopleFaceCropFetchOptions person](self, "person");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6
    && (v7 = (void *)v6,
        -[PXPeopleFaceCropFetchOptions face](self, "face"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    v9 = +[PXPeopleFaceCropFetchOptions allocWithZone:](PXPeopleFaceCropFetchOptions, "allocWithZone:", a3);
    -[PXPeopleFaceCropFetchOptions person](self, "person");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleFaceCropFetchOptions face](self, "face");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleFaceCropFetchOptions clientTargetSize](self, "clientTargetSize");
    v13 = v12;
    v15 = v14;
    -[PXPeopleFaceCropFetchOptions displayScale](self, "displayScale");
    v17 = -[PXPeopleFaceCropFetchOptions initWithPerson:face:targetSize:displayScale:](v9, "initWithPerson:face:targetSize:displayScale:", v10, v11, v13, v15, v16);

  }
  else
  {
    -[PXPeopleFaceCropFetchOptions person](self, "person");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = +[PXPeopleFaceCropFetchOptions allocWithZone:](PXPeopleFaceCropFetchOptions, "allocWithZone:", a3);
      -[PXPeopleFaceCropFetchOptions person](self, "person");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPeopleFaceCropFetchOptions clientTargetSize](self, "clientTargetSize");
      v21 = v20;
      v23 = v22;
      -[PXPeopleFaceCropFetchOptions displayScale](self, "displayScale");
      v25 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:](v19, "initWithPerson:targetSize:displayScale:", v10, v21, v23, v24);
    }
    else
    {
      -[PXPeopleFaceCropFetchOptions face](self, "face");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleFaceCropFetchOptions.m"), 130, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
      v27 = +[PXPeopleFaceCropFetchOptions allocWithZone:](PXPeopleFaceCropFetchOptions, "allocWithZone:", a3);
      -[PXPeopleFaceCropFetchOptions face](self, "face");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPeopleFaceCropFetchOptions clientTargetSize](self, "clientTargetSize");
      v29 = v28;
      v31 = v30;
      -[PXPeopleFaceCropFetchOptions displayScale](self, "displayScale");
      v25 = -[PXPeopleFaceCropFetchOptions initWithFace:targetSize:displayScale:](v27, "initWithFace:targetSize:displayScale:", v10, v29, v31, v32);
    }
    v17 = (PXPeopleFaceCropFetchOptions *)v25;
  }

  -[PXPeopleFaceCropFetchOptions setCropFactor:](v17, "setCropFactor:", -[PXPeopleFaceCropFetchOptions cropFactor](self, "cropFactor"));
  -[PXPeopleFaceCropFetchOptions setCornerStyle:](v17, "setCornerStyle:", -[PXPeopleFaceCropFetchOptions cornerStyle](self, "cornerStyle"));
  -[PXPeopleFaceCropFetchOptions setWantsFlippedContentsRect:](v17, "setWantsFlippedContentsRect:", -[PXPeopleFaceCropFetchOptions wantsFlippedContentsRect](self, "wantsFlippedContentsRect"));
  -[PXPeopleFaceCropFetchOptions asset](self, "asset");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleFaceCropFetchOptions setAsset:](v17, "setAsset:", v33);

  -[PXPeopleFaceCropFetchOptions setDeliveryMode:](v17, "setDeliveryMode:", -[PXPeopleFaceCropFetchOptions deliveryMode](self, "deliveryMode"));
  -[PXPeopleFaceCropFetchOptions setIsSynchronous:](v17, "setIsSynchronous:", -[PXPeopleFaceCropFetchOptions isSynchronous](self, "isSynchronous"));
  -[PXPeopleFaceCropFetchOptions setShouldCacheResult:](v17, "setShouldCacheResult:", -[PXPeopleFaceCropFetchOptions shouldCacheResult](self, "shouldCacheResult"));
  -[PXPeopleFaceCropFetchOptions setWantsSmallFaceRect:](v17, "setWantsSmallFaceRect:", -[PXPeopleFaceCropFetchOptions wantsSmallFaceRect](self, "wantsSmallFaceRect"));
  -[PXPeopleFaceCropFetchOptions setUseLowMemoryMode:](v17, "setUseLowMemoryMode:", -[PXPeopleFaceCropFetchOptions useLowMemoryMode](self, "useLowMemoryMode"));
  return v17;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  objc_super v27;
  CGSize v28;

  v27.receiver = self;
  v27.super_class = (Class)PXPeopleFaceCropFetchOptions;
  -[PXPeopleFaceCropFetchOptions description](&v27, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[PXPeopleFaceCropFetchOptions person](self, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(":\nperson: %@,\n"), v6);

  -[PXPeopleFaceCropFetchOptions face](self, "face");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("face: %@,\n"), v8);

  -[PXPeopleFaceCropFetchOptions clientTargetSize](self, "clientTargetSize");
  NSStringFromCGSize(v28);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("targetSize: %@,\n"), v9);
  -[PXPeopleFaceCropFetchOptions displayScale](self, "displayScale");
  objc_msgSend(v4, "appendFormat:", CFSTR("displayScale: %f,\n"), v10);
  if (-[PXPeopleFaceCropFetchOptions wantsFlippedContentsRect](self, "wantsFlippedContentsRect"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  v12 = v11;
  objc_msgSend(v4, "appendFormat:", CFSTR("wantsFlippedContentsRect: %@\n"), v12);

  -[PXPeopleFaceCropFetchOptions asset](self, "asset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("asset: %@,\n"), v14);

  +[PXPeopleFaceCropFetchOptions _cropFactorStringForCropFactor:](PXPeopleFaceCropFetchOptions, "_cropFactorStringForCropFactor:", -[PXPeopleFaceCropFetchOptions cropFactor](self, "cropFactor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("cropFactor: %@,\n"), v15);

  +[PXPeopleFaceCropFetchOptions _cornerStyleStringForCornerStyle:](PXPeopleFaceCropFetchOptions, "_cornerStyleStringForCornerStyle:", -[PXPeopleFaceCropFetchOptions cornerStyle](self, "cornerStyle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("cornerStyle: %@,\n"), v16);

  +[PXPeopleFaceCropFetchOptions _deliveryModeStringForDeliveryMode:](PXPeopleFaceCropFetchOptions, "_deliveryModeStringForDeliveryMode:", -[PXPeopleFaceCropFetchOptions deliveryMode](self, "deliveryMode"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("deliveryMode: %@,\n"), v17);

  if (-[PXPeopleFaceCropFetchOptions isSynchronous](self, "isSynchronous"))
    v18 = CFSTR("YES");
  else
    v18 = CFSTR("NO");
  v19 = v18;
  objc_msgSend(v4, "appendFormat:", CFSTR("isSynchronous: %@,\n"), v19);

  if (-[PXPeopleFaceCropFetchOptions shouldCacheResult](self, "shouldCacheResult"))
    v20 = CFSTR("YES");
  else
    v20 = CFSTR("NO");
  v21 = v20;
  objc_msgSend(v4, "appendFormat:", CFSTR("cacheResult: %@\n"), v21);

  if (-[PXPeopleFaceCropFetchOptions wantsSmallFaceRect](self, "wantsSmallFaceRect"))
    v22 = CFSTR("YES");
  else
    v22 = CFSTR("NO");
  v23 = v22;
  objc_msgSend(v4, "appendFormat:", CFSTR("wantsSmallFaceRect: %@\n"), v23);

  if (-[PXPeopleFaceCropFetchOptions useLowMemoryMode](self, "useLowMemoryMode"))
    v24 = CFSTR("YES");
  else
    v24 = CFSTR("NO");
  v25 = v24;
  objc_msgSend(v4, "appendFormat:", CFSTR("useLowMemoryMode: %@\n"), v25);

  return v4;
}

- (PHPerson)person
{
  return self->_person;
}

- (PHFace)face
{
  return self->_face;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (CGSize)targetPixelSize
{
  double width;
  double height;
  CGSize result;

  width = self->_targetPixelSize.width;
  height = self->_targetPixelSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (int64_t)cropFactor
{
  return self->_cropFactor;
}

- (void)setCropFactor:(int64_t)a3
{
  self->_cropFactor = a3;
}

- (int64_t)cornerStyle
{
  return self->_cornerStyle;
}

- (void)setCornerStyle:(int64_t)a3
{
  self->_cornerStyle = a3;
}

- (BOOL)wantsFlippedContentsRect
{
  return self->_wantsFlippedContentsRect;
}

- (void)setWantsFlippedContentsRect:(BOOL)a3
{
  self->_wantsFlippedContentsRect = a3;
}

- (int64_t)deliveryMode
{
  return self->_deliveryMode;
}

- (void)setDeliveryMode:(int64_t)a3
{
  self->_deliveryMode = a3;
}

- (BOOL)isSynchronous
{
  return self->_isSynchronous;
}

- (void)setIsSynchronous:(BOOL)a3
{
  self->_isSynchronous = a3;
}

- (BOOL)shouldCacheResult
{
  return self->_shouldCacheResult;
}

- (void)setShouldCacheResult:(BOOL)a3
{
  self->_shouldCacheResult = a3;
}

- (BOOL)wantsSmallFaceRect
{
  return self->_wantsSmallFaceRect;
}

- (void)setWantsSmallFaceRect:(BOOL)a3
{
  self->_wantsSmallFaceRect = a3;
}

- (BOOL)useLowMemoryMode
{
  return self->_useLowMemoryMode;
}

- (void)setUseLowMemoryMode:(BOOL)a3
{
  self->_useLowMemoryMode = a3;
}

- (CGSize)clientTargetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_clientTargetSize.width;
  height = self->_clientTargetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_face, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

+ (int64_t)recommendedCornerStyleForCurrentAppConfiguration
{
  if (+[PXPeopleFaceCropFetchOptions shouldUseLemonadeRoundedCorners](PXPeopleFaceCropFetchOptions, "shouldUseLemonadeRoundedCorners"))
  {
    return 1;
  }
  else
  {
    return 2;
  }
}

+ (BOOL)shouldUseLemonadeRoundedCorners
{
  return +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled");
}

+ (id)_cropFactorStringForCropFactor:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 0;
  else
    return off_1E5125898[a3];
}

+ (id)_cornerStyleStringForCornerStyle:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 0;
  else
    return off_1E51258B8[a3];
}

+ (id)_deliveryModeStringForDeliveryMode:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 0;
  else
    return off_1E51258D0[a3];
}

@end
