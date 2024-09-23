@implementation PBEffectsView

- (double)_rotationAngleForDeviceOrientation:(int64_t)a3
{
  double result;

  result = 1.57079633;
  switch(a3)
  {
    case 1:
      return result;
    case 2:
      result = -1.57079633;
      break;
    case 3:
      result = 3.14159265;
      if ((*((_BYTE *)self + 216) & 8) == 0)
        result = 0.0;
      break;
    case 4:
      result = 3.14159265;
      if ((*((_BYTE *)self + 216) & 8) != 0)
        result = 0.0;
      break;
    default:
      result = 0.0;
      break;
  }
  return result;
}

- (void)_resetFilterDefaultsHonorDeviceOrientation:(id)a3
{
  objc_msgSend(a3, "setDefaults");
  if (objc_msgSend(objc_msgSend(a3, "inputKeys"), "containsObject:", CFSTR("inputOrientation")))
  {
    -[PBEffectsView _rotationAngleForDeviceOrientation:](self, "_rotationAngleForDeviceOrientation:", self->_orientation);
    objc_msgSend(a3, "setValue:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), CFSTR("inputOrientation"));
  }
}

- (PBEffectsView)initWithFrame:(CGRect)a3
{
  return -[PBEffectsView initWithFrame:effectNamed:](self, "initWithFrame:effectNamed:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PBEffectsView)initWithFrame:(CGRect)a3 effectNamed:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  PBEffectsView *v9;
  double v10;
  double v11;
  CALayer *v12;
  double v13;
  UITapGestureRecognizer *v14;
  UITapGestureRecognizer *v15;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)PBEffectsView;
  v9 = -[PBEffectsView initWithFrame:](&v17, "initWithFrame:");
  -[PBEffectsView _initializeImageSizes](v9, "_initializeImageSizes");
  -[PBEffectsView setBackgroundColor:](v9, "setBackgroundColor:", +[UIColor blackColor](UIColor, "blackColor"));
  v9->_orientation = 1;
  v9->_currentMode = a4 == 0;
  v9->_currentEffect = (NSString *)objc_msgSend(a4, "copy");
  -[PBEffectsView _setUpContextWithFilters](v9, "_setUpContextWithFilters");
  v10 = v9->__largeImageSize.width;
  v11 = v9->__largeImageSize.height;
  v9->_directQueue = (_CAImageQueue *)CAImageQueueCreate(v9->__smallImageSize.width, v9->__smallImageSize.height, 4);
  v9->_nineUpQueue = (_CAImageQueue *)CAImageQueueCreate(v10, v11, 4);
  -[PBEffectsView _setUpEffectLayers](v9, "_setUpEffectLayers");
  v12 = +[CALayer layer](CALayer, "layer");
  v9->_opacityToggleLayer = v12;
  -[CALayer setFrame:](v12, "setFrame:", x, y, width, height);
  -[CALayer setZPosition:](v9->_opacityToggleLayer, "setZPosition:", 100.0);
  -[CALayer setBackgroundColor:](v9->_opacityToggleLayer, "setBackgroundColor:", -[UIColor CGColor](+[UIColor blackColor](UIColor, "blackColor"), "CGColor"));
  LODWORD(v13) = 0;
  -[CALayer setOpacity:](v9->_opacityToggleLayer, "setOpacity:", v13);
  objc_msgSend(-[PBEffectsView layer](v9, "layer"), "addSublayer:", v9->_opacityToggleLayer);
  v9->_proxyLayer = objc_opt_new(PBProxyLayer);
  objc_msgSend(-[PBEffectsView layer](v9, "layer"), "addSublayer:", v9->_proxyLayer);

  v14 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v9, "_didTap:");
  v9->_singleTapRecognizer = v14;
  -[UITapGestureRecognizer setDelegate:](v14, "setDelegate:", v9);
  -[PBEffectsView addGestureRecognizer:](v9, "addGestureRecognizer:", v9->_singleTapRecognizer);
  v15 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v9, "_didDoubleTap:");
  v9->_doubleTapRecognizer = v15;
  -[UITapGestureRecognizer setNumberOfTapsRequired:](v15, "setNumberOfTapsRequired:", 2);
  -[UITapGestureRecognizer setDelegate:](v9->_doubleTapRecognizer, "setDelegate:", v9);
  -[UITapGestureRecognizer setEnabled:](v9->_doubleTapRecognizer, "setEnabled:", 0);
  -[PBEffectsView addGestureRecognizer:](v9, "addGestureRecognizer:", v9->_doubleTapRecognizer);
  -[UITapGestureRecognizer requireGestureRecognizerToFail:](v9->_singleTapRecognizer, "requireGestureRecognizerToFail:", v9->_doubleTapRecognizer);
  v9->_pinchRecognizer = (UIPinchGestureRecognizer *)objc_msgSend(objc_alloc((Class)UIPinchGestureRecognizer), "initWithTarget:action:", v9, "_didPinch:");
  v9->_rotationRecognizer = (UIRotationGestureRecognizer *)objc_msgSend(objc_alloc((Class)UIRotationGestureRecognizer), "initWithTarget:action:", v9, "_didRotate:");
  v9->_panRecognizer = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc((Class)UIPanGestureRecognizer), "initWithTarget:action:", v9, "_didPan:");
  if (v9->_currentEffect)
    -[PBEffectsView _displayFullScreenEffect:](v9, "_displayFullScreenEffect:");
  return v9;
}

- (void)layoutSubviews
{
  NSArray *nineUpLayers;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];

  v14.receiver = self;
  v14.super_class = (Class)PBEffectsView;
  -[PBEffectsView layoutSubviews](&v14, "layoutSubviews");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  nineUpLayers = self->_nineUpLayers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](nineUpLayers, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(nineUpLayers);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        v9 = -[PBEffectsView _labelForEffectLayer:](self, "_labelForEffectLayer:", v8);
        objc_msgSend(v8, "frame");
        -[PBEffectsView _updatePositionAndTransformForTextLayer:inFrame:](self, "_updatePositionAndTransformForTextLayer:inFrame:", v9);
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](nineUpLayers, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v5);
  }
}

- (void)dealloc
{
  _CAImageQueue *nineUpQueue;
  _CAImageQueue *directQueue;
  __CVPixelBufferPool *smallPixelBufferPool;
  __CVPixelBufferPool *largePixelBufferPool;
  objc_super v7;

  CAImageQueueInvalidate(self->_nineUpQueue);
  CAImageQueueInvalidate(self->_directQueue);
  nineUpQueue = self->_nineUpQueue;
  if (nineUpQueue)
    CFRelease(nineUpQueue);
  directQueue = self->_directQueue;
  if (directQueue)
    CFRelease(directQueue);
  smallPixelBufferPool = self->_smallPixelBufferPool;
  if (smallPixelBufferPool)
    CFRelease(smallPixelBufferPool);
  largePixelBufferPool = self->_largePixelBufferPool;
  if (largePixelBufferPool)
    CFRelease(largePixelBufferPool);
  v7.receiver = self;
  v7.super_class = (Class)PBEffectsView;
  -[PBEffectsView dealloc](&v7, "dealloc");
}

- (void)_initializeImageSizes
{
  int v3;
  uint64_t v4;
  double height;
  double v6;
  double width;
  double v8;
  double v9;
  int v10;
  double v11;
  double v12;
  __int128 v13;
  int v14;

  v14 = -926344036;
  v13 = xmmword_10002710C;
  v3 = MGIsDeviceOneOfType(&v13, a2);
  height = CGSizeZero.height;
  if (v3)
    v6 = 1280.0;
  else
    v6 = CGSizeZero.height;
  if (v3)
    width = 960.0;
  else
    width = CGSizeZero.width;
  if (width == 0.0 || v6 == 0.0)
  {
    -[PBEffectsView _sampleBuffersSizeForDevicePosition:](self, "_sampleBuffersSizeForDevicePosition:", 2);
    width = v8;
    v6 = v9;
  }
  v14 = -926344036;
  v13 = xmmword_10002710C;
  v10 = MGIsDeviceOneOfType(&v13, v4);
  if (v10)
    v11 = 2048.0;
  else
    v11 = height;
  v12 = 1536.0;
  if (!v10)
    v12 = CGSizeZero.width;
  if (v12 == 0.0 || v11 == 0.0)
    -[PBEffectsView _sampleBuffersSizeForDevicePosition:](self, "_sampleBuffersSizeForDevicePosition:", 1);
  self->__smallImageSize.width = width;
  self->__smallImageSize.height = v6;
  self->__largeImageSize.width = v12;
  self->__largeImageSize.height = v11;
}

- (CGSize)_sampleBuffersSizeForDevicePosition:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIScreen *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  _BOOL4 v25;
  double v26;
  CGSize result;

  -[PBEffectsView _photoSizeForCaptureDevice:](self, "_photoSizeForCaptureDevice:", -[PBEffectsView _captureDeviceWithPosition:](self, "_captureDeviceWithPosition:", a3));
  v4 = v3;
  v6 = v5;
  v7 = +[UIScreen mainScreen](UIScreen, "mainScreen");
  -[UIScreen _referenceBounds](v7, "_referenceBounds");
  v9 = v8;
  v11 = v10;
  -[UIScreen scale](v7, "scale");
  v13 = v12 * v9;
  -[UIScreen scale](v7, "scale");
  v14 = (uint64_t)v13;
  v16 = v11 * v15;
  v17 = 4 * (uint64_t)v13;
  v18 = 3 * (uint64_t)v16;
  if (v17 != v18)
  {
    v19 = v18 + 3;
    if (v18 >= 0)
      v19 = 3 * (uint64_t)v16;
    v20 = v19 >> 2;
    if (v17 < v18)
      v14 = v20;
    v21 = (unsigned __int128)((v14 + 11) * (__int128)0x2AAAAAAAAAAAAAABLL) >> 64;
    v22 = 12 * ((v21 >> 1) + ((unint64_t)v21 >> 63));
    v13 = (double)v22;
    v16 = (double)(4 * (v22 / 3));
  }
  if (v4 <= v6)
    v23 = v6;
  else
    v23 = v4;
  if (v4 <= v6)
    v24 = v4;
  else
    v24 = v6;
  v25 = v24 > v13;
  if (v23 > v16)
    v25 = 1;
  if (v25)
  {
    v23 = v16;
    v26 = v13;
  }
  else
  {
    v26 = v24;
  }
  result.height = v23;
  result.width = v26;
  return result;
}

- (id)_captureDeviceWithPosition:(int64_t)a3
{
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = +[AVCaptureDevice devicesWithMediaType:](AVCaptureDevice, "devicesWithMediaType:", AVMediaTypeVideo, 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(v4);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if (objc_msgSend(v9, "position") == (id)a3)
      return v9;
    if (v6 == (id)++v8)
    {
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (CGSize)_photoSizeForCaptureDevice:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v7[6];
  uint64_t v8;
  int *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  int v15;
  CGSize result;

  v12 = 0;
  v13 = (int *)&v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = 0;
  v9 = (int *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000048E8;
  v7[3] = &unk_100034B30;
  v7[4] = &v12;
  v7[5] = &v8;
  objc_msgSend(objc_msgSend(a3, "formats"), "enumerateObjectsUsingBlock:", v7);
  v3 = (double)v13[6];
  v4 = (double)v9[6];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  v5 = v3;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)_setUpContextWithFilters
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  self->_context = objc_alloc_init(PBContext);
  -[PBEffectsView _createPixelBufferPools](self, "_createPixelBufferPools");
  -[PBContext setSmallPool:](self->_context, "setSmallPool:", self->_smallPixelBufferPool);
  -[PBContext setLargePool:](self->_context, "setLargePool:", self->_largePixelBufferPool);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = -[PBEffectsView _filters](self, "_filters", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[PBContext preloadFilter:](self->_context, "preloadFilter:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (id)_filters
{
  NSArray *filters;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  PBFilter *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  filters = self->_filters;
  if (!filters)
  {
    v4 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("PBThermalFilter"), CFSTR("PBMirrorFilter"), CFSTR("PBXRayFilter"), CFSTR("PBKaleidoscopeFilter"), CFSTR("PBNormalFilter"), CFSTR("PBLightTunnelFilter"), CFSTR("PBSqueezeFilter"), CFSTR("PBTwirlFilter"), CFSTR("PBStretchFilter"), 0);
    filters = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = +[PBFilter filterWithName:](PBFilter, "filterWithName:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8));
          if (v9)
            -[NSArray addObject:](filters, "addObject:", v9);
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }
    self->_filters = filters;
  }
  return filters;
}

- (void)_createPixelBufferPools
{
  const void *IOSurfacePropertiesDictionary;
  __CFDictionary *Mutable;
  __CFDictionary *v5;
  CFStringRef v6;
  __CFArray *v7;
  CFNumberRef v8;
  CFStringRef v9;
  double height;
  double width;
  int v12;
  CFNumberRef v13;
  CFStringRef v14;
  CFNumberRef v15;
  CFStringRef v16;
  CFNumberRef v17;
  CFNumberRef v18;
  CFDictionaryRef v19;
  const __CFDictionary *v20;
  CVReturn v21;
  CVReturn v22;
  int valuePtr;
  int v24;
  uint64_t v25;
  void *values;

  valuePtr = 1111970369;
  IOSurfacePropertiesDictionary = (const void *)FigCreateIOSurfacePropertiesDictionary(self, a2);
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v5 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v6 = kCVPixelBufferIOSurfacePropertiesKey;
  CFDictionaryAddValue(Mutable, kCVPixelBufferIOSurfacePropertiesKey, IOSurfacePropertiesDictionary);
  CFDictionaryAddValue(v5, v6, IOSurfacePropertiesDictionary);
  if (IOSurfacePropertiesDictionary)
    CFRelease(IOSurfacePropertiesDictionary);
  v25 = 0;
  v24 = 0;
  v7 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  v8 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  values = v8;
  CFArrayAppendValue(v7, v8);
  if (v8)
    CFRelease(v8);
  v9 = kCVPixelBufferPixelFormatTypeKey;
  CFDictionaryAddValue(Mutable, kCVPixelBufferPixelFormatTypeKey, v7);
  CFDictionaryAddValue(v5, v9, v7);
  if (v7)
    CFRelease(v7);
  width = self->__largeImageSize.width;
  height = self->__largeImageSize.height;
  v12 = (int)self->__smallImageSize.height;
  HIDWORD(v25) = (int)self->__smallImageSize.width;
  v13 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, (char *)&v25 + 4);
  v14 = kCVPixelBufferWidthKey;
  CFDictionaryAddValue(v5, kCVPixelBufferWidthKey, v13);
  if (v13)
    CFRelease(v13);
  LODWORD(v25) = v12;
  v15 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v25);
  values = v15;
  v16 = kCVPixelBufferHeightKey;
  CFDictionaryAddValue(v5, kCVPixelBufferHeightKey, v15);
  if (v15)
    CFRelease(v15);
  HIDWORD(v25) = (int)width;
  v17 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, (char *)&v25 + 4);
  CFDictionaryAddValue(Mutable, v14, v17);
  if (v17)
    CFRelease(v17);
  LODWORD(v25) = (int)height;
  v18 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v25);
  CFDictionaryAddValue(Mutable, v16, v18);
  if (v18)
    CFRelease(v18);
  v24 = 3;
  values = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v24);
  v19 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&kCVPixelBufferPoolAllocationThresholdKey, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v20 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&kCVPixelBufferPoolMinimumBufferCountKey, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (values)
    CFRelease(values);
  v21 = CVPixelBufferPoolCreate(kCFAllocatorDefault, v20, v5, &self->_smallPixelBufferPool);
  if (v21)
    NSLog(CFSTR("*** There was an error in creating the smaller pixel buffer pool %ld"), v21);
  v22 = CVPixelBufferPoolCreate(kCFAllocatorDefault, v20, Mutable, &self->_largePixelBufferPool);
  if (v22)
    NSLog(CFSTR("*** There was an error in creating the large pixel buffer pool %ld"), v22);
  if (v19)
    CFRelease(v19);
  if (Mutable)
    CFRelease(Mutable);
  if (v5)
    CFRelease(v5);
  if (v20)
    CFRelease(v20);
}

- (void)resetAllEffects
{
  NSArray *filters;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  filters = self->_filters;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](filters, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(filters);
        -[PBEffectsView _resetFilterDefaultsHonorDeviceOrientation:](self, "_resetFilterDefaultsHonorDeviceOrientation:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i));
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](filters, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (void)resetCurrentEffect
{
  id v3;
  void *v4;
  PBFilter *v5;
  PBFilter *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  void *v17;
  CABasicAnimation *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *k;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[5];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];

  v3 = -[PBEffectsView _filterWithName:](self, "_filterWithName:", self->_currentEffect);
  if (v3)
  {
    v4 = v3;
    if (objc_msgSend(objc_msgSend(v3, "inputKeys"), "count"))
    {
      v5 = +[PBFilter filterWithName:](PBFilter, "filterWithName:", objc_msgSend(v4, "name"));
      if (v5)
      {
        v6 = v5;
        -[PBEffectsView _resetFilterDefaultsHonorDeviceOrientation:](self, "_resetFilterDefaultsHonorDeviceOrientation:", v5);
        +[CATransaction begin](CATransaction, "begin");
        +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v7 = objc_msgSend(v4, "inputKeys");
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(_QWORD *)v35 != v10)
                objc_enumerationMutation(v7);
              -[PBProxyLayer setValue:forKey:](self->_proxyLayer, "setValue:forKey:", objc_msgSend(v4, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i)), *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i));
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
          }
          while (v9);
        }
        +[CATransaction commit](CATransaction, "commit");
        +[CATransaction begin](CATransaction, "begin");
        +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:", 0.5);
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_100005538;
        v33[3] = &unk_100034A48;
        v33[4] = self;
        +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v33);
        -[PBEffectsView setAnimating:](self, "setAnimating:", 1);
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v24 = v4;
        v12 = objc_msgSend(v4, "inputKeys");
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v30;
          do
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(_QWORD *)v30 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)j);
              if ((objc_msgSend(v17, "isEqualToString:", CFSTR("inputOrientation")) & 1) == 0)
              {
                v18 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", v17);
                -[CABasicAnimation setFromValue:](v18, "setFromValue:", objc_msgSend(v24, "valueForKey:", v17));
                -[CABasicAnimation setToValue:](v18, "setToValue:", -[PBFilter valueForKey:](v6, "valueForKey:", v17));
                -[CABasicAnimation setDuration:](v18, "setDuration:", 0.5);
                -[CABasicAnimation setTimingFunction:](v18, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionDefault));
                -[PBProxyLayer addAnimation:forKey:](self->_proxyLayer, "addAnimation:forKey:", v18, v17);
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
          }
          while (v14);
        }
        +[CATransaction commit](CATransaction, "commit");
        +[CATransaction begin](CATransaction, "begin");
        +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v19 = -[PBFilter inputKeys](v6, "inputKeys");
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v38, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v26;
          do
          {
            for (k = 0; k != v21; k = (char *)k + 1)
            {
              if (*(_QWORD *)v26 != v22)
                objc_enumerationMutation(v19);
              -[PBProxyLayer setValue:forKey:](self->_proxyLayer, "setValue:forKey:", -[PBFilter valueForKey:](v6, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)k)), *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)k));
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v38, 16);
          }
          while (v21);
        }
        +[CATransaction commit](CATransaction, "commit");
        -[PBEffectsView _resetFilterDefaultsHonorDeviceOrientation:](self, "_resetFilterDefaultsHonorDeviceOrientation:", v24);
      }
      else
      {
        -[PBEffectsView _resetFilterDefaultsHonorDeviceOrientation:](self, "_resetFilterDefaultsHonorDeviceOrientation:", v4);
      }
    }
  }
}

- (void)updateEffectsForCameraToggle
{
  NSArray *filters;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  double v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  filters = self->_filters;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](filters, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(filters);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(objc_msgSend(v7, "inputKeys"), "containsObject:", CFSTR("inputOrientation")))
        {
          objc_msgSend(objc_msgSend(v7, "valueForKey:", CFSTR("inputOrientation")), "doubleValue");
          objc_msgSend(v7, "setValue:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 3.14159265 - v8), CFSTR("inputOrientation"));
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](filters, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
}

- (id)_filterWithName:(id)a3
{
  NSArray *filters;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (!a3)
    return 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  filters = self->_filters;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](filters, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_4:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(filters);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend(objc_msgSend(v9, "name"), "isEqualToString:", a3) & 1) != 0)
      return v9;
    if (v6 == (id)++v8)
    {
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](filters, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v9 = 0;
      if (v6)
        goto LABEL_4;
      return v9;
    }
  }
}

- (id)_layerWithEffectName:(id)a3
{
  NSArray *nineUpLayers;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (!a3)
    return 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  nineUpLayers = self->_nineUpLayers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](nineUpLayers, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_4:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(nineUpLayers);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend(objc_msgSend(v9, "name"), "isEqualToString:", a3) & 1) != 0)
      return v9;
    if (v6 == (id)++v8)
    {
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](nineUpLayers, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v9 = 0;
      if (v6)
        goto LABEL_4;
      return v9;
    }
  }
}

- (unint64_t)_indexOfEffectLayer:(id)a3
{
  id v3;

  v3 = -[CALayer valueForKey:](self->_gridSelectedEffectLayer, "valueForKey:", CFSTR("cellIndex"));
  if (v3)
    return (unint64_t)objc_msgSend(v3, "unsignedIntegerValue");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_labelForEffectLayer:(id)a3
{
  id v4;
  NSArray *effectsLabels;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = objc_msgSend(a3, "name");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  effectsLabels = self->_effectsLabels;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](effectsLabels, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = *(_QWORD *)v13;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v8)
      objc_enumerationMutation(effectsLabels);
    v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
    if ((objc_msgSend(objc_msgSend(v10, "name"), "isEqualToString:", v4) & 1) != 0)
      return v10;
    if (v7 == (id)++v9)
    {
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](effectsLabels, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)_setCurrentMode:(int64_t)a3
{
  int64_t currentMode;

  if (self->_currentMode != a3)
  {
    self->_currentMode = a3;
    -[NSUserDefaults setInteger:forKey:](+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"), "setInteger:forKey:", self->_currentMode, CFSTR("Current Effect Mode"));
    currentMode = self->_currentMode;
    if (currentMode == 1)
    {
      -[PBEffectsView _removeEffectGestureRecognizers](self, "_removeEffectGestureRecognizers");
    }
    else if (!currentMode)
    {
      -[PBEffectsView _addEffectGestureRecognizers](self, "_addEffectGestureRecognizers");
    }
    if ((objc_opt_respondsToSelector(self->_delegate, "effectsViewDidChangeMode:") & 1) != 0)
      objc_msgSend(self->_delegate, "effectsViewDidChangeMode:", self);
  }
}

- (void)_setCurrentEffect:(id)a3
{
  NSString *currentEffect;
  NSString *v6;
  NSUserDefaults *v7;

  currentEffect = self->_currentEffect;
  if (currentEffect != a3)
  {
    if (currentEffect)
    {
      if ((objc_msgSend(a3, "isEqualToString:") & 1) != 0)
        return;
      v6 = self->_currentEffect;
    }
    else
    {
      v6 = 0;
    }

    self->_currentEffect = (NSString *)objc_msgSend(a3, "copy");
    v7 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
    -[NSUserDefaults setObject:forKey:](v7, "setObject:forKey:", self->_currentEffect, CFSTR("Current Effect"));
    -[NSUserDefaults synchronize](v7, "synchronize");
  }
}

- (id)_currentEffect
{
  return self->_currentEffect;
}

- (CGRect)_bottomSafeAreaInsetRectForOrientation:(int64_t)a3
{
  double v5;
  double v6;
  double width;
  double v8;
  double y;
  double x;
  double height;
  CGRect result;

  -[PBEffectsView safeAreaInsets](self, "safeAreaInsets");
  v6 = v5;
  -[PBEffectsView frame](self, "frame");
  switch(a3)
  {
    case 0:
    case 1:
      y = v8 - v6;
      x = 0.0;
      height = v6;
      break;
    case 2:
      y = 0.0;
      height = v6;
      goto LABEL_6;
    case 3:
      y = 0.0;
      height = width;
      width = v6;
LABEL_6:
      x = 0.0;
      break;
    case 4:
      x = v8 - v6;
      y = 0.0;
      height = width;
      width = v6;
      break;
    default:
      x = CGRectZero.origin.x;
      y = CGRectZero.origin.y;
      width = CGRectZero.size.width;
      height = CGRectZero.size.height;
      break;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_updatePositionAndTransformForTextLayer:(id)a3 inFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  int64_t orientation;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CATransform3D v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  orientation = self->_orientation;
  -[PBEffectsView _bottomSafeAreaInsetRectForOrientation:](self, "_bottomSafeAreaInsetRectForOrientation:", orientation);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(a3, "setPosition:", UIRectGetCenter(x, y, width, height));
  sub_100005CD4(orientation, &v18, x, y, width, height, v11, v13, v15, v17);
  objc_msgSend(a3, "setTransform:", &v18);
}

- (CGRect)_normalizedAspectFillContentsRectForContentsSize:(CGSize)a3 viewSize:(CGSize)a4
{
  double height;
  double v5;
  double v6;
  double v7;
  double v8;
  double width;
  double v10;
  double v11;
  CGRect result;

  height = a4.height;
  v5 = a3.height;
  v6 = 0.0;
  v7 = 1.0;
  if (a3.width == 0.0 || v5 == 0.0 || (v8 = a4.width, a4.width == 0.0))
  {
    v10 = 1.0;
    v11 = 0.0;
  }
  else
  {
    width = a3.width;
    v10 = 1.0;
    v11 = 0.0;
    if (height != 0.0)
    {
      if (width * height >= v5 * v8)
        v7 = 1.0;
      else
        v7 = width * height / (v5 * v8);
      if (width * height >= v5 * v8)
        v10 = v5 * v8 / (width * height);
      else
        v10 = 1.0;
      v11 = (1.0 - v10) * 0.5;
      v6 = (1.0 - v7) * 0.5;
    }
  }
  result.size.height = v7;
  result.size.width = v10;
  result.origin.y = v6;
  result.origin.x = v11;
  return result;
}

- (CGSize)_effectiveRenderSizeForAspectFillViewSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PBEffectsView _normalizedAspectFillContentsRectForContentsSize:viewSize:](self, "_normalizedAspectFillContentsRectForContentsSize:viewSize:", 3.0, 4.0, a3.width, a3.height);
  v7 = v6;
  v9 = UIRoundToViewScale(self, width / v8);
  v10 = UIRoundToViewScale(self, height / v7);
  v11 = v9;
  result.height = v10;
  result.width = v11;
  return result;
}

- (CGPoint)_effectiveLocationForLocationInView:(CGPoint)a3 inAspectFillViewSize:(CGSize)a4
{
  double height;
  double width;
  double y;
  double x;
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
  CGPoint result;

  height = a4.height;
  width = a4.width;
  y = a3.y;
  x = a3.x;
  -[PBEffectsView _normalizedAspectFillContentsRectForContentsSize:viewSize:](self, "_normalizedAspectFillContentsRectForContentsSize:viewSize:", 3.0, 4.0);
  v10 = v9;
  v12 = v11;
  -[PBEffectsView _effectiveRenderSizeForAspectFillViewSize:](self, "_effectiveRenderSizeForAspectFillViewSize:", width, height);
  v14 = v13;
  v16 = UIRoundToViewScale(self, x + v10 * v15);
  v17 = UIRoundToViewScale(self, y + v12 * v14);
  v18 = v16;
  result.y = v17;
  result.x = v18;
  return result;
}

- (void)_setUpEffectLayers
{
  NSMutableArray *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  NSArray *p_super;
  id v23;
  id v24;
  CALayer *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CATextLayer *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  NSMutableArray *v45;
  double v46;
  uint64_t v47;

  v45 = objc_opt_new(NSMutableArray);
  v3 = objc_opt_new(NSMutableArray);
  -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
  v44 = v4;
  -[UIScreen _referenceBounds](+[UIScreen mainScreen](UIScreen, "mainScreen"), "_referenceBounds");
  v6 = v5;
  v8 = v7;
  v9 = -[PBEffectsView layer](self, "layer");
  -[PBEffectsView _normalizedAspectFillContentsRectForContentsSize:viewSize:](self, "_normalizedAspectFillContentsRectForContentsSize:viewSize:", self->__largeImageSize.width, self->__largeImageSize.height, v6, v8);
  v14 = 0;
  v15 = 0;
  if (v10 == 0.0)
  {
    v12 = v12 + -0.00300000003;
    v16 = 0.00150000001;
  }
  else
  {
    v16 = v10;
  }
  v17 = v13 + -0.00300000003;
  if (v11 == 0.0)
    v11 = 0.00150000001;
  else
    v17 = v13;
  v40 = v11;
  v18 = v12 * 0.333333343;
  v19 = v17 * 0.333333343;
  v43 = CGPointZero.y + -5.0;
  v42 = v17 * 0.333333343;
  do
  {
    v20 = 0;
    v41 = v15;
    v46 = (float)((float)(2 - v15) * 0.33333) + v40 * 0.333333343;
    v47 = v14;
    do
    {
      v21 = v14 + v20;
      p_super = &v3->super;
      v23 = -[NSArray objectAtIndex:](self->_filters, "objectAtIndex:", v14 + v20);
      v24 = objc_msgSend(v23, "name");
      v25 = objc_opt_new(CALayer);
      -[CALayer setFrame:](v25, "setFrame:", sub_1000064AC(v21));
      -[CALayer setZPosition:](v25, "setZPosition:", 10.0);
      -[CALayer setContents:](v25, "setContents:", self->_nineUpQueue);
      -[CALayer setContentsRect:](v25, "setContentsRect:", (float)((float)(int)v20 * 0.33333) + v16 * 0.333333343, v46, v18, v19);
      -[CALayer setName:](v25, "setName:", v24);
      -[CALayer setValue:forKey:](v25, "setValue:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v21), CFSTR("cellIndex"));
      objc_msgSend(v9, "addSublayer:", v25);
      -[NSMutableArray addObject:](v45, "addObject:", v25);
      -[CALayer frame](v25, "frame");
      v27 = v26;
      v29 = v28;
      v31 = v30;
      v33 = v32;
      v34 = objc_opt_new(CATextLayer);
      -[CATextLayer setZPosition:](v34, "setZPosition:", 20.0);
      -[CATextLayer setFont:](v34, "setFont:", +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 24.0));
      -[CATextLayer setFontSize:](v34, "setFontSize:", 24.0);
      -[CATextLayer setName:](v34, "setName:", v24);
      v35 = v23;
      v3 = (NSMutableArray *)p_super;
      -[CATextLayer setString:](v34, "setString:", objc_msgSend(v35, "localizedName"));
      -[CATextLayer setAlignmentMode:](v34, "setAlignmentMode:", kCAAlignmentCenter);
      -[CATextLayer setForegroundColor:](v34, "setForegroundColor:", -[UIColor CGColor](+[UIColor whiteColor](UIColor, "whiteColor"), "CGColor"));
      LODWORD(v36) = 1060320051;
      -[CATextLayer setShadowOpacity:](v34, "setShadowOpacity:", v36);
      -[CATextLayer setShadowOffset:](v34, "setShadowOffset:", 0.0, 3.0);
      -[CATextLayer setShadowRadius:](v34, "setShadowRadius:", 4.5);
      -[CATextLayer setContentsScale:](v34, "setContentsScale:", v44);
      -[CATextLayer setRasterizationScale:](v34, "setRasterizationScale:", v44);
      -[CATextLayer setShouldRasterize:](v34, "setShouldRasterize:", 1);
      -[CATextLayer preferredFrameSize](v34, "preferredFrameSize");
      -[CATextLayer setBounds:](v34, "setBounds:", CGPointZero.x, v43, v38, v37 + 20.0);
      v39 = v33;
      v19 = v42;
      -[PBEffectsView _updatePositionAndTransformForTextLayer:inFrame:](self, "_updatePositionAndTransformForTextLayer:inFrame:", v34, v27, v29, v31, v39);
      objc_msgSend(v9, "addSublayer:", v34);
      -[NSArray addObject:](p_super, "addObject:", v34);

      v14 = v47;
      ++v20;
    }
    while (v20 != 3);
    v15 = v41 + 1;
    v14 = v47 + 3;
  }
  while (v41 != 2);
  self->_nineUpLayers = &v45->super;
  self->_effectsLabels = p_super;
}

- (id)_effectLayerAtLocation:(CGPoint)a3
{
  double y;
  double x;
  id v6;
  NSArray *nineUpLayers;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  y = a3.y;
  x = a3.x;
  v6 = -[PBEffectsView layer](self, "layer");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  nineUpLayers = self->_nineUpLayers;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](nineUpLayers, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v8)
    return 0;
  v9 = v8;
  v10 = *(_QWORD *)v15;
LABEL_3:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v15 != v10)
      objc_enumerationMutation(nineUpLayers);
    v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
    objc_msgSend(v6, "convertPoint:toLayer:", v12, x, y);
    if ((objc_msgSend(v12, "containsPoint:") & 1) != 0)
      return v12;
    if (v9 == (id)++v11)
    {
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](nineUpLayers, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)toggleEffectsMode:(id)a3
{
  int64_t currentMode;

  currentMode = self->_currentMode;
  if (currentMode)
  {
    if (currentMode == 1)
      -[PBEffectsView _displayFullScreenMode](self, "_displayFullScreenMode", a3);
  }
  else
  {
    -[PBEffectsView _displayGridViewMode](self, "_displayGridViewMode", a3);
  }
}

- (void)_displayFullScreenMode
{
  id v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double Center;
  double y;
  _QWORD v15[6];

  if ((objc_opt_respondsToSelector(self->_delegate, "effectsView:willChangeMode:toMode:") & 1) != 0)
    objc_msgSend(self->_delegate, "effectsView:willChangeMode:toMode:", self, 1, 0);
  v3 = -[PBEffectsView _labelForEffectLayer:](self, "_labelForEffectLayer:", self->_gridSelectedEffectLayer);
  -[UIApplication beginIgnoringInteractionEvents](+[UIApplication sharedApplication](UIApplication, "sharedApplication"), "beginIgnoringInteractionEvents");
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:", 0.25);
  +[CATransaction setAnimationTimingFunction:](CATransaction, "setAnimationTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
  v4 = +[PhotoBoothApplication testingAnimationDelegate](PhotoBoothApplication, "testingAnimationDelegate");
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100006898;
  v15[3] = &unk_100034AE8;
  v15[4] = v4;
  v15[5] = self;
  +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v15);
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  -[CALayer setZPosition:](self->_opacityToggleLayer, "setZPosition:", 100.0);
  -[CALayer setZPosition:](self->_gridSelectedEffectLayer, "setZPosition:", 110.0);
  objc_msgSend(v3, "setZPosition:", 120.0);
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 0);
  +[CATransaction commit](CATransaction, "commit");
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:", 0.0833333333);
  LODWORD(v5) = 0;
  objc_msgSend(v3, "setOpacity:", v5);
  +[CATransaction commit](CATransaction, "commit");
  LODWORD(v6) = 1.0;
  -[CALayer setOpacity:](self->_opacityToggleLayer, "setOpacity:", v6);
  objc_msgSend(-[PBEffectsView layer](self, "layer"), "bounds");
  v8 = v7;
  v10 = v9;
  Center = UIRectGetCenter(v11, v12, v7, v9);
  y = CGPointZero.y;
  -[CALayer setPosition:](self->_gridSelectedEffectLayer, "setPosition:", Center);
  -[CALayer setBounds:](self->_gridSelectedEffectLayer, "setBounds:", CGPointZero.x, y, v8, v10);
  +[CATransaction commit](CATransaction, "commit");
  objc_msgSend(v4, "animationDidStart");
}

- (void)_displayGridViewMode
{
  _QWORD aBlock[5];

  *((_BYTE *)self + 216) |= 1u;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1000069A0;
  aBlock[3] = &unk_100034A48;
  aBlock[4] = self;
  self->_didRenderBlock = _Block_copy(aBlock);
}

- (void)_displayFullScreenEffect:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CALayer *v13;
  double v14;
  id v15;

  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  -[PBEffectsView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = -[PBEffectsView _layerWithEffectName:](self, "_layerWithEffectName:", a3);
  -[CALayer setZPosition:](v13, "setZPosition:", 110.0);
  LODWORD(v14) = 0;
  -[CALayer setOpacity:](self->_opacityToggleLayer, "setOpacity:", v14);
  *((_BYTE *)self + 216) |= 1u;
  -[CALayer setPosition:](v13, "setPosition:", v10 * 0.5, v12 * 0.5);
  -[CALayer setBounds:](v13, "setBounds:", v6, v8, v10, v12);
  self->_gridSelectedEffectLayer = v13;
  v15 = -[PBEffectsView _fullScreenEffectLayer](self, "_fullScreenEffectLayer");
  objc_msgSend(v15, "setZPosition:", 200.0);
  objc_msgSend(-[PBEffectsView layer](self, "layer"), "addSublayer:", v15);
  +[CATransaction commit](CATransaction, "commit");
  -[PBEffectsView _addEffectGestureRecognizers](self, "_addEffectGestureRecognizers");
  -[PBEffectsView _setCurrentMode:](self, "_setCurrentMode:", 0);
}

- (void)_setImageQueueDimensions:(id)a3
{
  int var1;
  double width;
  double height;
  int var0;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  var1 = a3.var1;
  width = self->__smallImageSize.width;
  height = self->__smallImageSize.height;
  if (a3.var0 >= a3.var1)
    var0 = a3.var1;
  else
    var0 = a3.var0;
  if (a3.var0 > a3.var1)
    var1 = a3.var0;
  if (var0 != (int)width || var1 != (int)height)
  {
    height = self->__largeImageSize.height;
    width = self->__largeImageSize.width;
  }
  v8 = width;
  v9 = height;
  v10 = self->__largeImageSize.width;
  v11 = self->__largeImageSize.height;
  CAImageQueueFlush(self->_directQueue, a2);
  CAImageQueueFlush(self->_nineUpQueue, v12);
  CAImageQueueSetSize(self->_directQueue, v8, v9);
  CAImageQueueSetSize(self->_nineUpQueue, v10, v11);
}

- (void)renderViewWithInputBuffer:(opaqueCMSampleBuffer *)a3
{
  const opaqueCMFormatDescription *FormatDescription;
  CMVideoDimensions Dimensions;
  NSArray *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  id v16;
  id v17;
  int64_t currentMode;
  int64_t v20;
  void (**didRenderBlock)(void);
  CVImageBufferRef ImageBuffer;
  uint64_t v23;
  NSArray *v24;
  NSArray *obj;
  uint64_t v26;
  id v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];

  v24 = -[PBEffectsView _filters](self, "_filters");
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  Dimensions = CMVideoFormatDescriptionGetDimensions(FormatDescription);
  if ((*((_BYTE *)self + 216) & 2) == 0)
  {
    *((_BYTE *)self + 216) |= 2u;
    -[PBEffectsView _setImageQueueDimensions:](self, "_setImageQueueDimensions:", Dimensions);
  }
  if (-[PBEffectsView isAnimating](self, "isAnimating", ImageBuffer))
  {
    v7 = v24;
    if (!self->_currentMode)
      v7 = +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", -[PBEffectsView _filterWithName:](self, "_filterWithName:", self->_currentEffect));
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v7;
    v27 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v27)
    {
      v26 = *(_QWORD *)v34;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v34 != v26)
            objc_enumerationMutation(obj);
          v28 = v8;
          v9 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v8);
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v10 = objc_msgSend(v9, "inputKeys");
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v30;
            do
            {
              for (i = 0; i != v12; i = (char *)i + 1)
              {
                if (*(_QWORD *)v30 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
                v16 = objc_msgSend(-[PBProxyLayer presentationLayer](self->_proxyLayer, "presentationLayer"), "valueForKey:", v15);
                v17 = v16;
                currentMode = self->_currentMode;
                if (!currentMode)
                {
                  if (!v16)
                    continue;
LABEL_25:
                  objc_msgSend(v9, "setValue:forKey:", v17, v15);
                  continue;
                }
                if (currentMode == 1
                  && objc_msgSend(v15, "isEqualToString:", CFSTR("inputOrientation"))
                  && v17 != 0)
                {
                  goto LABEL_25;
                }
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            }
            while (v12);
          }
          v8 = v28 + 1;
        }
        while ((id)(v28 + 1) != v27);
        v27 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v27);
    }
  }
  v20 = self->_currentMode;
  if (v20)
  {
    if (v20 != 1)
      goto LABEL_36;
  }
  else
  {
    -[PBContext setOutputImageQueue:](self->_context, "setOutputImageQueue:", self->_directQueue);
    -[PBContext renderFilter:inputPixelBuffer:mirrored:](self->_context, "renderFilter:inputPixelBuffer:mirrored:", -[PBEffectsView _filterWithName:](self, "_filterWithName:", self->_currentEffect), v23, (*((unsigned __int8 *)self + 216) >> 3) & 1);
    if ((*((_BYTE *)self + 216) & 1) == 0)
      goto LABEL_36;
    *((_BYTE *)self + 216) &= ~1u;
  }
  -[PBContext setOutputImageQueue:](self->_context, "setOutputImageQueue:", self->_nineUpQueue);
  -[PBContext renderNineUp:inputPixelBuffer:mirrored:](self->_context, "renderNineUp:inputPixelBuffer:mirrored:", v24, v23, (*((unsigned __int8 *)self + 216) >> 3) & 1);
LABEL_36:
  didRenderBlock = (void (**)(void))self->_didRenderBlock;
  if (didRenderBlock)
  {
    didRenderBlock[2]();

    self->_didRenderBlock = 0;
  }
}

- (__CVBuffer)createRenderedCVPixelBufferWithBuffer:(__CVBuffer *)a3
{
  if (self->_currentMode)
    return 0;
  else
    return (__CVBuffer *)objc_msgSend(+[PBContext openGLContext:](PBContext, "openGLContext:", +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), kCIContextPriorityRequestLow)), "createCVPixelBufferForFilter:inputPixelBuffer:mirrored:", -[PBEffectsView currentFilter](self, "currentFilter"), a3, (*((unsigned __int8 *)self + 216) >> 3) & 1);
}

- (void)disableUpdate
{
  int toggleAnimationCount;
  id v4;
  id v5;
  id v6;
  UIView *v7;
  id v8;
  id v9;

  toggleAnimationCount = self->_toggleAnimationCount;
  self->_toggleAnimationCount = toggleAnimationCount + 1;
  if (!toggleAnimationCount)
  {
    v4 = objc_alloc((Class)UIView);
    -[PBEffectsView frame](self, "frame");
    v5 = objc_msgSend(v4, "initWithFrame:");
    v6 = objc_alloc((Class)UISnapshotView);
    -[PBEffectsView frame](self, "frame");
    v7 = (UIView *)objc_msgSend(v6, "initWithFrame:");
    -[UIView setEdgeAntialiasingEnabled:](v7, "setEdgeAntialiasingEnabled:", 0);
    -[UIView captureSnapshotOfView:withSnapshotType:](v7, "captureSnapshotOfView:withSnapshotType:", -[PBEffectsView window](self, "window"), 1);
    objc_msgSend(v5, "bounds");
    -[UIView setFrame:](v7, "setFrame:");
    objc_msgSend(v5, "bounds");
    -[PBEffectsView setFrame:](self, "setFrame:");
    v8 = objc_alloc((Class)UIView);
    -[UIView bounds](v7, "bounds");
    v9 = objc_msgSend(v8, "initWithFrame:");
    objc_msgSend(v9, "setBackgroundColor:", +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.5));
    objc_msgSend(-[PBEffectsView superview](self, "superview"), "insertSubview:aboveSubview:", v5, self);
    objc_msgSend(v5, "addSubview:", self);
    objc_msgSend(v5, "addSubview:", v7);
    -[UIView addSubview:](v7, "addSubview:", v9);

    self->_snapshotView = v7;
  }
}

- (void)flipAppearance:(BOOL)a3
{
  _BOOL4 v3;
  const CATransitionSubtype *v5;
  const CATransitionSubtype *v6;
  CATransitionSubtype v7;
  id v8;
  _QWORD v9[5];

  if (self->_snapshotView)
  {
    v3 = a3;
    -[PBEffectsView updateEffectsForCameraToggle](self, "updateEffectsForCameraToggle");
    switch(self->_orientation)
    {
      case 0:
      case 4:
        v5 = &kCATransitionFromBottom;
        v6 = &kCATransitionFromTop;
        goto LABEL_8;
      case 1:
        v5 = &kCATransitionFromRight;
        v6 = &kCATransitionFromLeft;
        goto LABEL_8;
      case 2:
        v5 = &kCATransitionFromLeft;
        v6 = &kCATransitionFromRight;
        goto LABEL_8;
      case 3:
        v5 = &kCATransitionFromTop;
        v6 = &kCATransitionFromBottom;
LABEL_8:
        if (!v3)
          v5 = v6;
        v7 = *v5;
        break;
      default:
        v7 = 0;
        break;
    }
    v8 = +[CATransition animation](CATransition, "animation");
    objc_msgSend(v8, "setType:", CFSTR("oglFlip"));
    objc_msgSend(v8, "setTransitionFlags:", 1);
    objc_msgSend(v8, "setSubtype:", v7);
    objc_msgSend(v8, "setDuration:", 0.4);
    objc_msgSend(v8, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
    objc_msgSend(v8, "setDelegate:", +[PhotoBoothApplication testingAnimationDelegate](PhotoBoothApplication, "testingAnimationDelegate"));
    +[CATransaction begin](CATransaction, "begin");
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100007540;
    v9[3] = &unk_100034A48;
    v9[4] = self;
    +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v9);
    -[UIView setAlpha:](self->_snapshotView, "setAlpha:", 0.0);
    -[CALayer addAnimation:forKey:](-[UIView layer](-[UIView superview](self->_snapshotView, "superview"), "layer"), "addAnimation:forKey:", v8, CFSTR("Flip Animation"));
    +[CATransaction commit](CATransaction, "commit");
  }
}

- (void)enableUpdate
{
  int toggleAnimationCount;
  BOOL v3;
  int v4;
  UIView *v6;

  toggleAnimationCount = self->_toggleAnimationCount;
  v3 = __OFSUB__(toggleAnimationCount, 1);
  v4 = toggleAnimationCount - 1;
  if (v4 < 0 == v3)
  {
    self->_toggleAnimationCount = v4;
    if (!v4)
    {
      v6 = -[UIView superview](self->_snapshotView, "superview");
      -[UIView insertSubview:aboveSubview:](-[UIView superview](v6, "superview"), "insertSubview:aboveSubview:", self, v6);
      -[UIView removeFromSuperview](v6, "removeFromSuperview");
      self->_snapshotView = 0;
    }
  }
}

- (void)_didTapOnLayerInGridView:(id)a3
{
  if (a3)
  {
    self->_gridSelectedEffectLayer = (CALayer *)a3;
    -[PBEffectsView _setCurrentEffect:](self, "_setCurrentEffect:", objc_msgSend(a3, "name"));
    -[PBEffectsView toggleEffectsMode:](self, "toggleEffectsMode:", self);
  }
}

- (void)_didTap:(id)a3
{
  int64_t currentMode;

  currentMode = self->_currentMode;
  if (currentMode == 1)
  {
    objc_msgSend(a3, "locationInView:", self);
    -[PBEffectsView _didTapOnLayerInGridView:](self, "_didTapOnLayerInGridView:", -[PBEffectsView _effectLayerAtLocation:](self, "_effectLayerAtLocation:"));
  }
  else if (!currentMode)
  {
    -[PBEffectsView _tapEffectLayer:](self, "_tapEffectLayer:", a3);
  }
}

- (void)ppt_simulateEffectLayerTap:(id)a3
{
  if (self->_currentMode == 1)
    -[PBEffectsView _didTapOnLayerInGridView:](self, "_didTapOnLayerInGridView:", -[PBEffectsView _layerWithEffectName:](self, "_layerWithEffectName:", a3));
}

- (void)_tapEffectLayer:(id)a3
{
  id v5;
  void *v6;
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
  PBFilter *v23;
  PBFilter *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  CABasicAnimation *v35;
  id v36;
  _QWORD v37[5];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];

  v5 = -[PBEffectsView _filterWithName:](self, "_filterWithName:", self->_currentEffect);
  if (v5)
  {
    v6 = v5;
    if (objc_msgSend(a3, "state") == (id)3)
    {
      if (objc_msgSend(objc_msgSend(v6, "inputKeys"), "containsObject:", CFSTR("inputPoint")))
      {
        objc_msgSend(a3, "locationInView:", self);
        v8 = v7;
        v10 = v9;
        -[PBEffectsView bounds](self, "bounds");
        v12 = v11;
        v14 = v13;
        -[PBEffectsView _effectiveRenderSizeForAspectFillViewSize:](self, "_effectiveRenderSizeForAspectFillViewSize:", v11, v13);
        v16 = v15;
        v18 = v17;
        -[PBEffectsView _effectiveLocationForLocationInView:inAspectFillViewSize:](self, "_effectiveLocationForLocationInView:inAspectFillViewSize:", v8, v10, v12, v14);
        v20 = v19;
        v22 = v21;
        v23 = +[PBFilter filterWithName:](PBFilter, "filterWithName:", objc_msgSend(v6, "name"));
        if (v23)
        {
          v24 = v23;
          v25 = objc_msgSend(v6, "dictionaryWithValuesForKeys:", objc_msgSend(v6, "inputKeys"));
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          v45 = 0u;
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v43;
            do
            {
              v29 = 0;
              do
              {
                if (*(_QWORD *)v43 != v28)
                  objc_enumerationMutation(v25);
                -[PBFilter setValue:forKey:](v24, "setValue:forKey:", objc_msgSend(v25, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)v29)), *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)v29));
                v29 = (char *)v29 + 1;
              }
              while (v27 != v29);
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
            }
            while (v27);
          }
          -[PBFilter handleTapGesture:viewSize:mirror:](v24, "handleTapGesture:viewSize:mirror:", (*((unsigned __int8 *)self + 216) >> 3) & 1, v20, v22, v16, v18);
          v36 = -[PBFilter valueForKey:](v24, "valueForKey:", CFSTR("inputPoint"));
          +[CATransaction begin](CATransaction, "begin");
          +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
          v40 = 0u;
          v41 = 0u;
          v38 = 0u;
          v39 = 0u;
          v30 = objc_msgSend(v6, "inputKeys");
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
          if (v31)
          {
            v32 = v31;
            v33 = *(_QWORD *)v39;
            do
            {
              v34 = 0;
              do
              {
                if (*(_QWORD *)v39 != v33)
                  objc_enumerationMutation(v30);
                -[PBProxyLayer setValue:forKey:](self->_proxyLayer, "setValue:forKey:", objc_msgSend(v6, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v34)), *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v34));
                v34 = (char *)v34 + 1;
              }
              while (v32 != v34);
              v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
            }
            while (v32);
          }
          +[CATransaction commit](CATransaction, "commit");
          +[CATransaction begin](CATransaction, "begin");
          +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:", 0.5);
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472;
          v37[2] = sub_100007B4C;
          v37[3] = &unk_100034A48;
          v37[4] = self;
          +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v37);
          -[PBEffectsView setAnimating:](self, "setAnimating:", 1);
          v35 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("inputPoint"));
          -[CABasicAnimation setFromValue:](v35, "setFromValue:", objc_msgSend(v6, "valueForKey:", CFSTR("inputPoint")));
          -[CABasicAnimation setToValue:](v35, "setToValue:", v36);
          -[CABasicAnimation setTimingFunction:](v35, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionDefault));
          -[CABasicAnimation setDuration:](v35, "setDuration:", 0.5);
          -[PBProxyLayer addAnimation:forKey:](self->_proxyLayer, "addAnimation:forKey:", v35, CFSTR("inputPoint"));
          +[CATransaction commit](CATransaction, "commit");
          +[CATransaction begin](CATransaction, "begin");
          +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
          objc_msgSend(v6, "setValue:forKey:", v36, CFSTR("inputPoint"));
          -[PBProxyLayer setValue:forKey:](self->_proxyLayer, "setValue:forKey:", v36, CFSTR("inputPoint"));
          +[CATransaction commit](CATransaction, "commit");
        }
        else
        {
          objc_msgSend(v6, "handleTapGesture:viewSize:mirror:", (*((unsigned __int8 *)self + 216) >> 3) & 1, v20, v22, v16, v18);
        }
      }
    }
  }
}

- (void)_didDoubleTap:(id)a3
{
  if (!self->_currentMode)
    -[PBEffectsView resetCurrentEffect](self, "resetCurrentEffect", a3);
}

- (void)_didRotate:(id)a3
{
  id v5;
  double v6;
  float v7;
  _BOOL8 v8;
  double v9;

  v5 = -[PBEffectsView _filterWithName:](self, "_filterWithName:", self->_currentEffect);
  objc_msgSend(a3, "rotation");
  v7 = v6;
  v8 = objc_msgSend(a3, "state") == (id)1;
  *(float *)&v9 = v7;
  objc_msgSend(v5, "handleRotateGesture:stateBegan:mirror:", v8, (*((unsigned __int8 *)self + 216) >> 3) & 1, v9);
}

- (void)_didPan:(id)a3
{
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;

  v5 = -[PBEffectsView _filterWithName:](self, "_filterWithName:", self->_currentEffect);
  v6 = (uint64_t)objc_msgSend(a3, "numberOfTouches");
  -[PBEffectsView bounds](self, "bounds");
  -[PBEffectsView _effectiveRenderSizeForAspectFillViewSize:](self, "_effectiveRenderSizeForAspectFillViewSize:", v7, v8);
  v10 = v9;
  v12 = v11;
  v19 = 0u;
  v20 = 0u;
  if (v6 >= 1)
  {
    objc_msgSend(a3, "locationOfTouch:inView:", 0, self, v19, v20);
    -[PBEffectsView _effectiveLocationForLocationInView:inAspectFillViewSize:](self, "_effectiveLocationForLocationInView:inAspectFillViewSize:");
    *(_QWORD *)&v19 = v13;
    *((_QWORD *)&v19 + 1) = v14;
    if (v6 != 1)
    {
      objc_msgSend(a3, "locationOfTouch:inView:", 1, self, v19);
      -[PBEffectsView _effectiveLocationForLocationInView:inAspectFillViewSize:](self, "_effectiveLocationForLocationInView:inAspectFillViewSize:");
      *(_QWORD *)&v20 = v15;
      *((_QWORD *)&v20 + 1) = v16;
    }
  }
  if ((char *)objc_msgSend(a3, "state", v19, v20) - 1 <= (char *)1)
  {
    objc_msgSend(a3, "translationInView:", self);
    objc_msgSend(v5, "handleGestureAtLocations:count:translation:viewSize:stateBegan:mirror:", &v19, v6, objc_msgSend(a3, "state") == (id)1, (*((unsigned __int8 *)self + 216) >> 3) & 1, v17, v18, v10, v12);
  }
}

- (void)_addEffectGestureRecognizers
{
  -[PBEffectsView addGestureRecognizer:](self, "addGestureRecognizer:", self->_panRecognizer);
  -[UIPanGestureRecognizer setDelegate:](self->_panRecognizer, "setDelegate:", self);
  -[UITapGestureRecognizer setEnabled:](self->_doubleTapRecognizer, "setEnabled:", 1);
}

- (void)_removeEffectGestureRecognizers
{
  -[PBEffectsView removeGestureRecognizer:](self, "removeGestureRecognizer:", self->_pinchRecognizer);
  -[UIPinchGestureRecognizer setDelegate:](self->_pinchRecognizer, "setDelegate:", 0);
  -[PBEffectsView removeGestureRecognizer:](self, "removeGestureRecognizer:", self->_rotationRecognizer);
  -[UIRotationGestureRecognizer setDelegate:](self->_rotationRecognizer, "setDelegate:", 0);
  -[PBEffectsView removeGestureRecognizer:](self, "removeGestureRecognizer:", self->_panRecognizer);
  -[UIPanGestureRecognizer setDelegate:](self->_panRecognizer, "setDelegate:", 0);
  -[UITapGestureRecognizer setEnabled:](self->_doubleTapRecognizer, "setEnabled:", 0);
}

- (PBFilter)currentFilter
{
  return (PBFilter *)-[PBEffectsView _filterWithName:](self, "_filterWithName:", self->_currentEffect);
}

- (BOOL)hasShakeMotion
{
  return (*((unsigned __int8 *)self + 216) >> 2) & 1;
}

- (void)setMirrorFilterRendering:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 216) = *((_BYTE *)self + 216) & 0xF7 | v3;
}

- (BOOL)mirrorFilterRendering
{
  return (*((unsigned __int8 *)self + 216) >> 3) & 1;
}

- (void)_rotateFiltersUsingOrientation:(int64_t)a3 duration:(double)a4
{
  double v7;
  double v8;
  int64_t v9;
  id v10;
  NSArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  id v16;
  NSNumber *v17;
  NSArray *filters;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *k;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  NSNumber *v32;
  double v33;
  double v34;
  double v35;
  unsigned int v36;
  int v37;
  BOOL v38;
  int v39;
  int v40;
  int v41;
  unsigned int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  signed int v47;
  float *v48;
  double v49;
  float *v50;
  double v51;
  NSNumber *v52;
  PBFilter *v53;
  PBFilter *v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  void *m;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  void *n;
  CABasicAnimation *v65;
  CAMediaTimingFunctionName v66;
  uint64_t v67;
  id v68;
  NSNumber *v69;
  uint64_t v70;
  NSNumber *v71;
  id v72;
  _QWORD v73[7];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];

  v72 = +[NSMutableArray array](NSMutableArray, "array");
  -[PBEffectsView _rotationAngleForDeviceOrientation:](self, "_rotationAngleForDeviceOrientation:", a3);
  v8 = v7;
  v9 = -[PBEffectsView mode](self, "mode");
  if (v9 == 1)
  {
    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    filters = self->_filters;
    v19 = -[NSArray countByEnumeratingWithState:objects:count:](filters, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v91;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v91 != v21)
            objc_enumerationMutation(filters);
          v23 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(objc_msgSend(v23, "inputKeys"), "containsObject:", CFSTR("inputOrientation")))
            objc_msgSend(v72, "addObject:", v23);
        }
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](filters, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
      }
      while (v20);
    }
  }
  else if (!v9)
  {
    v10 = -[PBEffectsView _filterWithName:](self, "_filterWithName:", self->_currentEffect);
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v11 = self->_filters;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v94, v103, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v95;
      do
      {
        for (j = 0; j != v13; j = (char *)j + 1)
        {
          if (*(_QWORD *)v95 != v14)
            objc_enumerationMutation(v11);
          v16 = *(id *)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)j);
          if (objc_msgSend(objc_msgSend(v16, "inputKeys"), "containsObject:", CFSTR("inputOrientation")))
          {
            v17 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8);
            if (v16 == v10)
              objc_msgSend(v72, "addObject:", v10);
            else
              objc_msgSend(v16, "setValue:forKey:", v17, CFSTR("inputOrientation"));
          }
        }
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v94, v103, 16);
      }
      while (v13);
    }
  }
  if (a4 == 0.0)
  {
    v88 = 0uLL;
    v89 = 0uLL;
    v86 = 0uLL;
    v87 = 0uLL;
    v24 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v86, v101, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v87;
      do
      {
        for (k = 0; k != v25; k = (char *)k + 1)
        {
          if (*(_QWORD *)v87 != v26)
            objc_enumerationMutation(v72);
          objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * (_QWORD)k), "setValue:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8), CFSTR("inputOrientation"));
        }
        v25 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v86, v101, 16);
      }
      while (v25);
    }
  }
  else
  {
    v84 = 0uLL;
    v85 = 0uLL;
    v82 = 0uLL;
    v83 = 0uLL;
    v28 = v72;
    v68 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v82, v100, 16);
    if (v68)
    {
      v66 = kCAMediaTimingFunctionDefault;
      v67 = *(_QWORD *)v83;
      while (2)
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v83 != v67)
            objc_enumerationMutation(v28);
          v30 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v29);
          v31 = objc_msgSend(v30, "valueForKey:", CFSTR("inputOrientation"), v66);
          v32 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8);
          objc_msgSend(v31, "doubleValue");
          v34 = v33;
          -[NSNumber doubleValue](v32, "doubleValue");
          v36 = llround(v34 / 1.57079633);
          v37 = v36 & 3;
          v39 = -v36;
          v38 = v39 < 0;
          v40 = v39 & 3;
          if (v38)
            v41 = v37;
          else
            v41 = -v40;
          v42 = llround(v35 / 1.57079633);
          v43 = v42 & 3;
          v44 = -v42;
          v38 = v44 < 0;
          v45 = v44 & 3;
          if (v38)
            v46 = v43;
          else
            v46 = -v45;
          v47 = v46 + ((3 - v46) & 0xFFFFFFFC) + 4 * (v41 + ((3 - v41) & 0x3FFFFFFC));
          v48 = (float *)&unk_10002700C;
          if ((*((_BYTE *)self + 216) & 8) == 0)
            v48 = (float *)&unk_10002708C;
          v49 = v48[v47];
          v50 = (float *)&unk_10002704C;
          if ((*((_BYTE *)self + 216) & 8) == 0)
            v50 = (float *)&unk_1000270CC;
          v51 = v50[v47];
          v52 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v49);
          v71 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v51);
          v53 = +[PBFilter filterWithName:](PBFilter, "filterWithName:", objc_msgSend(v30, "name"));
          if (!v53)
          {
            objc_msgSend(v30, "setValue:forKey:", v71, CFSTR("inputOrientation"));
            return;
          }
          v54 = v53;
          v69 = v52;
          v70 = v29;
          -[PBEffectsView _resetFilterDefaultsHonorDeviceOrientation:](self, "_resetFilterDefaultsHonorDeviceOrientation:", v53);
          v80 = 0u;
          v81 = 0u;
          v79 = 0u;
          v78 = 0u;
          v55 = objc_msgSend(v30, "inputKeys");
          v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v78, v99, 16);
          if (v56)
          {
            v57 = v56;
            v58 = *(_QWORD *)v79;
            do
            {
              for (m = 0; m != v57; m = (char *)m + 1)
              {
                if (*(_QWORD *)v79 != v58)
                  objc_enumerationMutation(v55);
                -[PBFilter setValue:forKey:](v54, "setValue:forKey:", objc_msgSend(v30, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)m)), *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)m));
              }
              v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v78, v99, 16);
            }
            while (v57);
          }
          -[PBFilter setValue:forKey:](v54, "setValue:forKey:", v71, CFSTR("inputOrientation"));
          +[CATransaction begin](CATransaction, "begin");
          +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
          v76 = 0u;
          v77 = 0u;
          v74 = 0u;
          v75 = 0u;
          v60 = objc_msgSend(v30, "inputKeys");
          v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v74, v98, 16);
          if (v61)
          {
            v62 = v61;
            v63 = *(_QWORD *)v75;
            do
            {
              for (n = 0; n != v62; n = (char *)n + 1)
              {
                if (*(_QWORD *)v75 != v63)
                  objc_enumerationMutation(v60);
                -[PBProxyLayer setValue:forKey:](self->_proxyLayer, "setValue:forKey:", objc_msgSend(v30, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)n)), *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)n));
              }
              v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v74, v98, 16);
            }
            while (v62);
            v28 = v72;
          }
          -[PBProxyLayer setValue:forKey:](self->_proxyLayer, "setValue:forKey:", v69, CFSTR("inputOrientation"));
          +[CATransaction commit](CATransaction, "commit");
          +[CATransaction begin](CATransaction, "begin");
          +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:", a4);
          v73[0] = _NSConcreteStackBlock;
          v73[1] = 3221225472;
          v73[2] = sub_100008664;
          v73[3] = &unk_100034A98;
          v73[4] = v30;
          v73[5] = v71;
          v73[6] = self;
          +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v73);
          -[PBEffectsView setAnimating:](self, "setAnimating:", 1);
          v65 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("inputOrientation"));
          -[CABasicAnimation setFromValue:](v65, "setFromValue:", v69);
          -[CABasicAnimation setToValue:](v65, "setToValue:", v71);
          -[CABasicAnimation setDuration:](v65, "setDuration:", a4);
          -[CABasicAnimation setTimingFunction:](v65, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", v66));
          -[PBProxyLayer addAnimation:forKey:](self->_proxyLayer, "addAnimation:forKey:", v65, CFSTR("inputOrientation"));
          +[CATransaction commit](CATransaction, "commit");
          +[CATransaction begin](CATransaction, "begin");
          +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
          -[PBProxyLayer setValue:forKey:](self->_proxyLayer, "setValue:forKey:", -[PBFilter valueForKey:](v54, "valueForKey:", CFSTR("inputOrientation")), CFSTR("inputOrientation"));
          +[CATransaction commit](CATransaction, "commit");
          v29 = v70 + 1;
        }
        while ((id)(v70 + 1) != v68);
        v68 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v82, v100, 16);
        if (v68)
          continue;
        break;
      }
    }
  }
}

- (void)setOrientation:(int64_t)a3 duration:(double)a4
{
  int64_t v5;
  PBEffectsView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *i;
  void *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  NSValue *v28;
  NSValue *v29;
  CAKeyframeAnimation *v30;
  double v31;
  NSNumber *v32;
  double v33;
  NSNumber *v34;
  double v35;
  CAKeyframeAnimation *v36;
  double v37;
  NSNumber *v38;
  double v39;
  PBEffectsView *v40;
  int64_t v41;
  NSNumber *v42;
  double v43;
  id v44;
  id v45;
  double v46;
  NSArray *obj;
  uint64_t v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  id v54;
  id v55;
  CATransform3D v56;
  CATransform3D v57;
  CATransform3D v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];

  if (self->_orientation != a3)
  {
    v5 = a3;
    v6 = self;
    -[PBEffectsView _rotateFiltersUsingOrientation:duration:](self, "_rotateFiltersUsingOrientation:duration:");
    -[PBEffectsView _bottomSafeAreaInsetRectForOrientation:](v6, "_bottomSafeAreaInsetRectForOrientation:", v6->_orientation);
    v52 = v8;
    v53 = v7;
    v50 = v10;
    v51 = v9;
    -[PBEffectsView _bottomSafeAreaInsetRectForOrientation:](v6, "_bottomSafeAreaInsetRectForOrientation:", v5);
    v49 = v11;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    +[CATransaction begin](CATransaction, "begin");
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    obj = v6->_nineUpLayers;
    v54 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
    if (v54)
    {
      v48 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v54; i = (char *)i + 1)
        {
          if (*(_QWORD *)v60 != v48)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i);
          v55 = -[PBEffectsView _labelForEffectLayer:](v6, "_labelForEffectLayer:", v19);
          objc_msgSend(v19, "frame");
          v21 = v20;
          v23 = v22;
          v25 = v24;
          v27 = v26;
          memset(&v58, 0, sizeof(v58));
          sub_100005CD4(v6->_orientation, &v58, v20, v22, v24, v26, v53, v52, v51, v50);
          memset(&v57, 0, sizeof(v57));
          sub_100005CD4(v5, &v57, v21, v23, v25, v27, v49, v13, v15, v17);
          v56 = v58;
          v28 = +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v56);
          v56 = v57;
          v29 = +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v56);
          v30 = +[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("transform"));
          -[CAKeyframeAnimation setCalculationMode:](v30, "setCalculationMode:", kCAAnimationDiscrete);
          -[CAKeyframeAnimation setValues:](v30, "setValues:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v28, v29, 0));
          LODWORD(v31) = 0.5;
          v32 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v31);
          LODWORD(v33) = 0.5;
          v34 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v33);
          LODWORD(v35) = 1.0;
          -[CAKeyframeAnimation setKeyTimes:](v30, "setKeyTimes:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v32, v34, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v35), 0));
          v36 = +[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("opacity"));
          LODWORD(v37) = 1.0;
          v38 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v37);
          LODWORD(v39) = 0;
          v40 = v6;
          v41 = v5;
          v42 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v39);
          LODWORD(v43) = 1.0;
          -[CAKeyframeAnimation setValues:](v36, "setValues:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v38, v42, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v43), 0));
          v44 = +[CAAnimationGroup animation](CAAnimationGroup, "animation");
          objc_msgSend(v44, "setAnimations:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v30, v36, 0));
          objc_msgSend(v44, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
          objc_msgSend(v44, "setDuration:", a4);
          +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 0);
          v45 = v44;
          v5 = v41;
          v6 = v40;
          objc_msgSend(v55, "addAnimation:forKey:", v45, CFSTR("orientation animation"));
          +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
          LODWORD(v46) = 1.0;
          objc_msgSend(v55, "setOpacity:", v46);
          v56 = v57;
          objc_msgSend(v55, "setTransform:", &v56);
          +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 0);
        }
        v54 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
      }
      while (v54);
    }
    +[CATransaction commit](CATransaction, "commit");
    v6->_orientation = v5;
  }
}

- (id)_fullScreenEffectLayer
{
  id result;
  uint64_t v4;
  CALayer *fullScreenEffectLayer;
  _CAImageQueue *directQueue;

  result = self->_fullScreenEffectLayer;
  if (!result)
  {
    fullScreenEffectLayer = objc_opt_new(CALayer);
    self->_fullScreenEffectLayer = fullScreenEffectLayer;
    directQueue = self->_directQueue;
    if (directQueue)
    {
      CAImageQueueFlush(directQueue, v4);
      fullScreenEffectLayer = self->_fullScreenEffectLayer;
    }
    objc_msgSend(-[PBEffectsView layer](self, "layer"), "bounds");
    -[CALayer setFrame:](fullScreenEffectLayer, "setFrame:");
    -[CALayer setContents:](self->_fullScreenEffectLayer, "setContents:", self->_directQueue);
    -[CALayer setContentsGravity:](self->_fullScreenEffectLayer, "setContentsGravity:", kCAGravityResizeAspectFill);
    return self->_fullScreenEffectLayer;
  }
  return result;
}

- (void)resetQueueDimensions
{
  *((_BYTE *)self + 216) &= ~2u;
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_isAnimating = a3;
}

- (int64_t)mode
{
  return self->_currentMode;
}

- (NSString)currentEffect
{
  return self->_currentEffect;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (CGSize)_smallImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->__smallImageSize.width;
  height = self->__smallImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)_largeImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->__largeImageSize.width;
  height = self->__largeImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
