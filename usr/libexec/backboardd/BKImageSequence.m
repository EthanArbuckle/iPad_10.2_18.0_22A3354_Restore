@implementation BKImageSequence

- (BKImageSequence)initWithBasename:(id)a3 bundle:(id)a4 imageCount:(int64_t)a5 scale:(double)a6
{
  id v10;
  id v11;
  BKImageSequence *v12;
  BKImageSequence *v13;
  NSString *v14;
  NSString *basename;
  uint64_t v16;
  NSPointerArray *images;
  uint64_t v18;
  NSString *idiomSuffix;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v21.receiver = self;
  v21.super_class = (Class)BKImageSequence;
  v12 = -[BKImageSequence init](&v21, "init");
  v13 = v12;
  if (v12)
  {
    v12->_maximumImageCount = a5;
    v12->_scale = a6;
    v14 = (NSString *)objc_msgSend(v10, "copy");
    basename = v13->_basename;
    v13->_basename = v14;

    objc_storeStrong((id *)&v13->_bundle, a4);
    v16 = objc_claimAutoreleasedReturnValue(+[NSPointerArray pointerArrayWithOptions:](NSPointerArray, "pointerArrayWithOptions:", 0));
    images = v13->_images;
    v13->_images = (NSPointerArray *)v16;

    -[NSPointerArray setCount:](v13->_images, "setCount:", a5);
    v18 = objc_claimAutoreleasedReturnValue(-[BKImageSequence _idiomSuffix](v13, "_idiomSuffix"));
    idiomSuffix = v13->_idiomSuffix;
    v13->_idiomSuffix = (NSString *)v18;

  }
  return v13;
}

- (id)allImages
{
  -[BKImageSequence _loadAllImages](self, "_loadAllImages");
  return -[NSPointerArray allObjects](self->_images, "allObjects");
}

- (CGImage)_createImageForIndex:(unint64_t)a3 basename:(id)a4 scale:(double)a5 idiom:(id)a6 bundle:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  const __CFURL *v18;
  const __CFURL *v19;
  CGImageSourceRef v20;
  CGImageSource *v21;
  id v22;
  NSObject *v23;
  CGImage *ImageAtIndex;
  id v25;
  NSObject *v26;
  void *v28;
  uint8_t buf[4];
  _BYTE v30[24];
  __int16 v31;
  id v32;

  v11 = a4;
  v12 = a6;
  v13 = a7;
  v14 = sub_1000597D0();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v30 = a3;
    *(_WORD *)&v30[4] = 2114;
    *(_QWORD *)&v30[6] = v11;
    *(_WORD *)&v30[14] = 2048;
    *(double *)&v30[16] = a5;
    v31 = 2114;
    v32 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "loading image:%d for basename:%{public}@ scale:%g idiom:%{public}@", buf, 0x26u);
  }

  if (a5 <= 1.0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%d%@%@"), v11, a3, &stru_1000F0F50, v12));
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("@%dx"), (int)a5));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%d%@%@"), v11, a3, v16, v12));

  }
  v18 = (const __CFURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "URLForResource:withExtension:", v17, CFSTR(".png")));
  v19 = v18;
  if (v18 && (v20 = CGImageSourceCreateWithURL(v18, 0)) != 0)
  {
    v21 = v20;
    v22 = sub_1000597D0();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v30 = v17;
      _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Loaded: %{public}@", buf, 0xCu);
    }

    ImageAtIndex = CGImageSourceCreateImageAtIndex(v21, 0, 0);
    CFRelease(v21);
  }
  else
  {
    v25 = sub_1000597D0();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundlePath"));
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)v30 = v17;
      *(_WORD *)&v30[8] = 2114;
      *(_QWORD *)&v30[10] = v28;
      _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Can't find requested image: %{public}@ in %{public}@", buf, 0x16u);

    }
    ImageAtIndex = 0;
  }

  return ImageAtIndex;
}

- (id)_idiomSuffix
{
  return &stru_1000F0F50;
}

- (CGImage)_imageAtIndex:(int64_t)a3
{
  CGImage *v5;
  id v6;
  NSObject *v7;
  NSString *basename;
  double scale;
  void *v12;
  NSString *v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  uint8_t buf[4];
  _BYTE v20[28];
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;

  if (self->_maximumImageCount <= a3)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("imageIndex < _maximumImageCount")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v13 = NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v16 = (objc_class *)objc_opt_class(self, v15);
      v17 = NSStringFromClass(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      *(_DWORD *)buf = 138544642;
      *(_QWORD *)v20 = v14;
      *(_WORD *)&v20[8] = 2114;
      *(_QWORD *)&v20[10] = v18;
      *(_WORD *)&v20[18] = 2048;
      *(_QWORD *)&v20[20] = self;
      v21 = 2114;
      v22 = CFSTR("BKImageSequence.m");
      v23 = 1024;
      v24 = 116;
      v25 = 2114;
      v26 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
    __break(0);
    JUMPOUT(0x100046518);
  }
  v5 = -[NSPointerArray pointerAtIndex:](self->_images, "pointerAtIndex:");
  if (!v5)
  {
    v5 = -[BKImageSequence _createImageForIndex:basename:scale:idiom:bundle:](self, "_createImageForIndex:basename:scale:idiom:bundle:", a3, self->_basename, self->_idiomSuffix, self->_bundle, self->_scale);
    if (v5
      || -[NSString length](self->_idiomSuffix, "length")
      && (v5 = -[BKImageSequence _createImageForIndex:basename:scale:idiom:bundle:](self, "_createImageForIndex:basename:scale:idiom:bundle:", a3, self->_basename, &stru_1000F0F50, self->_bundle, self->_scale)) != 0)
    {
      -[NSPointerArray replacePointerAtIndex:withPointer:](self->_images, "replacePointerAtIndex:withPointer:", a3, v5);
      CGImageRelease(v5);
    }
    else
    {
      v6 = sub_1000597D0();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        basename = self->_basename;
        scale = self->_scale;
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v20 = &index;
        *(_WORD *)&v20[4] = 2114;
        *(_QWORD *)&v20[6] = basename;
        *(_WORD *)&v20[14] = 2048;
        *(double *)&v20[16] = scale;
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "missing image index:%d basename:%{public}@ scale:%g", buf, 0x1Cu);
      }

      return 0;
    }
  }
  return v5;
}

- (void)_loadAllImages
{
  int64_t v3;

  if (self->_maximumImageCount >= 1)
  {
    v3 = 0;
    do
      -[BKImageSequence _imageAtIndex:](self, "_imageAtIndex:", v3++);
    while (v3 < self->_maximumImageCount);
  }
}

- (int64_t)maximumImageCount
{
  return self->_maximumImageCount;
}

- (double)scale
{
  return self->_scale;
}

- (NSPointerArray)images
{
  return self->_images;
}

- (void)setImages:(id)a3
{
  objc_storeStrong((id *)&self->_images, a3);
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
  objc_storeStrong((id *)&self->_bundle, a3);
}

- (NSString)basename
{
  return self->_basename;
}

- (void)setBasename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)idiomSuffix
{
  return self->_idiomSuffix;
}

- (void)setIdiomSuffix:(id)a3
{
  objc_storeStrong((id *)&self->_idiomSuffix, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idiomSuffix, 0);
  objc_storeStrong((id *)&self->_basename, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_images, 0);
}

@end
