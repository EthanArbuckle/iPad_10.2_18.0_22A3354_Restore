@implementation VKMapSnapshot

- (id)_initWithImages:(id)a3 displayStyles:(id *)a4 displayStylesCount:(unint64_t)a5 scale:(double)a6 camera:(id)a7
{
  double v7;
  double v8;

  LODWORD(v7) = 1.0;
  LODWORD(v8) = 0;
  return -[VKMapSnapshot _initWithImages:displayStyles:displayStylesCount:scale:camera:elevationScale:targetPointElevation:colorSpace:](self, "_initWithImages:displayStyles:displayStylesCount:scale:camera:elevationScale:targetPointElevation:colorSpace:", a3, a4, a5, a7, *MEMORY[0x1E0C9DA10], a6, v7, v8);
}

- (id)_initWithImages:(id)a3 displayStyles:(id *)a4 displayStylesCount:(unint64_t)a5 scale:(double)a6 camera:(id)a7 elevationScale:(float)a8 targetPointElevation:(float)a9 colorSpace:(__CFString *)a10
{
  id v18;
  id v19;
  void *v20;
  VKMapSnapshot *v21;
  VKMapSnapshot *v22;
  VKMapSnapshot *v23;
  size_t v24;
  $6EFE6C6748B912A6EAC8A8E593ED1344 *v25;
  uint64_t v26;
  NSArray *images;
  void *v28;
  unint64_t i;
  void *v30;
  CGImageRef image[2];
  objc_super v33;

  v18 = a3;
  v19 = a7;
  v20 = v19;
  v21 = 0;
  if (v18 && v19 && a6 >= 1.0)
  {
    if (objc_msgSend(v18, "count") == a5)
    {
      v33.receiver = self;
      v33.super_class = (Class)VKMapSnapshot;
      v22 = -[VKMapSnapshot init](&v33, sel_init);
      v23 = v22;
      if (v22)
      {
        v22->_displayStylesCount = a5;
        v24 = 6 * a5;
        v25 = ($6EFE6C6748B912A6EAC8A8E593ED1344 *)malloc_type_malloc(v24, 0x1000040274DC3F3uLL);
        v23->_displayStyles = v25;
        memcpy(v25, a4, v24);
        v26 = objc_msgSend(v18, "copy");
        images = v23->_images;
        v23->_images = (NSArray *)v26;

        if (-[NSArray count](v23->_images, "count"))
        {
          image[0] = 0;
          -[NSArray objectAtIndex:](v23->_images, "objectAtIndex:", 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "getValue:", image);
          CGImageRetain(image[0]);
          v23->_width = CGImageGetWidth(image[0]);
          v23->_height = CGImageGetHeight(image[0]);

          for (i = 1; i < -[NSArray count](v23->_images, "count"); ++i)
          {
            image[0] = 0;
            -[NSArray objectAtIndex:](v23->_images, "objectAtIndex:", i);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "getValue:", image);
            CGImageRetain(image[0]);

          }
        }
        objc_storeStrong((id *)&v23->_vkCamera, a7);
        v23->_scale = a6;
        v23->_elevationScale = a8;
        v23->_targetPointElevation = a9;
        objc_storeStrong((id *)&v23->_colorSpace, a10);
      }
      self = v23;
      v21 = self;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        LOWORD(image[0]) = 0;
        _os_log_fault_impl(&dword_19F029000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: images.count == displayStylesCount", (uint8_t *)image, 2u);
      }
      v21 = 0;
    }
  }

  return v21;
}

- (VKMapSnapshot)initWithCoder:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  CFComparisonResult v17;
  const __CFString *v18;
  const __CFString *v19;
  CFComparisonResult v20;
  CGColorSpaceRef DeviceRGB;
  CGColorSpace *v22;
  id v23;
  const void *v24;
  size_t BytesPerElement;
  size_t BytesPerRow;
  size_t v27;
  CGDataProvider *v28;
  void *v29;
  VKMapSnapshot *v30;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  const __CFData *v39;
  CGDataProvider *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  int v55;
  VKCamera *v56;
  void *v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  const __CFString *theString2;
  id obj;
  id v65;
  id v66;
  __int128 v67;
  uint64_t v68;
  __int128 v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  CGImageRef image[2];
  _OWORD v74[2];
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
  size_t size;
  objc_super v86;
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v86.receiver = self;
  v86.super_class = (Class)VKMapSnapshot;
  v5 = -[VKMapSnapshot init](&v86, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("displayStylesCount"));
    *((_QWORD *)v5 + 9) = v6;
    if (v6)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("colorSpace"));
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)*((_QWORD *)v5 + 12);
      *((_QWORD *)v5 + 12) = v7;

      size = 0;
      v65 = objc_retainAutorelease(v4);
      v9 = (const void *)objc_msgSend(v65, "decodeBytesForKey:returnedLength:", CFSTR("displayStyles"), &size);
      if (size == 6 * *((_QWORD *)v5 + 9))
      {
        v10 = malloc_type_malloc(size, 0xF4B29679uLL);
        *((_QWORD *)v5 + 8) = v10;
        memcpy(v10, v9, size);
        v66 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v11 = objc_alloc(MEMORY[0x1E0C99E60]);
        v12 = objc_opt_class();
        v60 = (void *)objc_msgSend(v11, "initWithObjects:", v12, objc_opt_class(), 0);
        objc_msgSend(v65, "decodeObjectOfClasses:forKey:");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        if (v61)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v30 = 0;
LABEL_41:

            goto LABEL_23;
          }
          v83 = 0u;
          v84 = 0u;
          v81 = 0u;
          v82 = 0u;
          obj = v61;
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v88, 16);
          if (v13)
          {
            v62 = *(_QWORD *)v82;
            theString2 = (const __CFString *)*MEMORY[0x1E0C9DA10];
            v59 = (const __CFString *)*MEMORY[0x1E0C9DA00];
LABEL_8:
            v14 = 0;
            while (1)
            {
              if (*(_QWORD *)v82 != v62)
                objc_enumerationMutation(obj);
              v15 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v14);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_39;
              IOSurfaceSetOwnership();
              *((_QWORD *)v5 + 2) = objc_msgSend(v15, "width");
              *((_QWORD *)v5 + 3) = objc_msgSend(v15, "height");
              if (objc_msgSend(v15, "pixelFormat") != 1111970369)
                goto LABEL_39;
              v16 = (const __CFString *)*((_QWORD *)v5 + 12);
              if (v16
                && ((v17 = CFStringCompare(v16, theString2, 0), v18 = theString2, v17 == kCFCompareEqualTo)
                 || (v19 = (const __CFString *)*((_QWORD *)v5 + 12)) != 0
                 && (v20 = CFStringCompare(v19, v59, 0), v18 = v59, v20 == kCFCompareEqualTo)))
              {
                DeviceRGB = CGColorSpaceCreateWithName(v18);
              }
              else
              {
                DeviceRGB = CGColorSpaceCreateDeviceRGB();
              }
              v22 = DeviceRGB;
              v23 = objc_retainAutorelease(v15);
              v24 = (const void *)objc_msgSend(v23, "baseAddress");
              BytesPerElement = IOSurfaceGetBytesPerElement((IOSurfaceRef)v23);
              BytesPerRow = IOSurfaceGetBytesPerRow((IOSurfaceRef)v23);
              v27 = objc_msgSend(v23, "allocationSize");
              CFRetain(v23);
              v28 = CGDataProviderCreateWithData(v23, v24, v27, (CGDataProviderReleaseDataCallback)releaseIOSurface);
              objc_msgSend(v23, "incrementUseCount");
              image[0] = 0;
              image[0] = CGImageCreate(*((_QWORD *)v5 + 2), *((_QWORD *)v5 + 3), 8uLL, 8 * BytesPerElement, BytesPerRow, v22, 0x2006u, v28, 0, 1, kCGRenderingIntentDefault);
              CGImageSetProperty();
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", image, "^{CGImage=}");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "addObject:", v29);
              CGColorSpaceRelease(v22);
              CGDataProviderRelease(v28);

              if (v13 == ++v14)
              {
                v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v88, 16);
                if (v13)
                  goto LABEL_8;
                break;
              }
            }
          }
        }
        else
        {
          v32 = (void *)MEMORY[0x1E0C99E60];
          v33 = objc_opt_class();
          objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "decodeObjectOfClasses:forKey:", v34, CFSTR("imageDatas"));
          obj = (id)objc_claimAutoreleasedReturnValue();

          if (obj)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_39;
            v79 = 0u;
            v80 = 0u;
            v77 = 0u;
            v78 = 0u;
            v35 = obj;
            v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v77, v87, 16);
            if (v36)
            {
              v37 = *(_QWORD *)v78;
              while (2)
              {
                for (i = 0; i != v36; ++i)
                {
                  if (*(_QWORD *)v78 != v37)
                    objc_enumerationMutation(v35);
                  v39 = *(const __CFData **)(*((_QWORD *)&v77 + 1) + 8 * i);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {

                    goto LABEL_39;
                  }
                  v40 = CGDataProviderCreateWithCFData(v39);
                  image[0] = 0;
                  image[0] = CGImageCreateWithPNGDataProvider(v40, 0, 1, kCGRenderingIntentDefault);
                  CGDataProviderRelease(v40);
                  *((_QWORD *)v5 + 2) = CGImageGetWidth(image[0]);
                  *((_QWORD *)v5 + 3) = CGImageGetHeight(image[0]);
                  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", image, "^{CGImage=}");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v66, "addObject:", v41);

                }
                v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v77, v87, 16);
                if (v36)
                  continue;
                break;
              }
            }

          }
        }

        objc_storeStrong((id *)v5 + 1, v66);
        objc_msgSend(v65, "decodeDoubleForKey:", CFSTR("scale"));
        *((_QWORD *)v5 + 4) = v42;
        objc_msgSend(v65, "decodeDoubleForKey:", CFSTR("targetPointElevation"));
        *((_QWORD *)v5 + 6) = v43;
        v44 = (void *)MEMORY[0x1E0C99E60];
        v45 = objc_opt_class();
        v46 = objc_opt_class();
        objc_msgSend(v44, "setWithObjects:", v45, v46, objc_opt_class(), 0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "decodeObjectOfClasses:forKey:", v47, CFSTR("memoryStats"));
        v48 = objc_claimAutoreleasedReturnValue();
        v49 = (void *)*((_QWORD *)v5 + 10);
        *((_QWORD *)v5 + 10) = v48;

        v50 = (void *)MEMORY[0x1E0C99E60];
        v51 = objc_opt_class();
        objc_msgSend(v50, "setWithObjects:", v51, objc_opt_class(), 0);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "decodeObjectOfClasses:forKey:", v52, CFSTR("elevationRasters"));
        v53 = objc_claimAutoreleasedReturnValue();
        v54 = (void *)*((_QWORD *)v5 + 11);
        *((_QWORD *)v5 + 11) = v53;

        objc_msgSend(v65, "decodeFloatForKey:", CFSTR("elevationScale"));
        *((_DWORD *)v5 + 10) = v55;
        objc_msgSend(v65, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cameraState"));
        obj = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        if (!strcmp((const char *)objc_msgSend(obj, "objCType"), "{VKCameraState={RigidTransform<double, double>={Matrix<double, 3, 1>=[3d]}{Quaternion<double>={Matrix<double, 3, 1>=[3d]}d}}d{Unit<geo::RadianUnitDescription, double>=d}d}"))
        {
          memset(v74, 0, sizeof(v74));
          *(_OWORD *)image = 0u;
          *(_QWORD *)&v75 = 0x3FF0000000000000;
          objc_msgSend(obj, "getValue:", image);
          v56 = -[VKCamera initWithRunLoopController:]([VKCamera alloc], "initWithRunLoopController:", 0);
          v57 = (void *)*((_QWORD *)v5 + 7);
          *((_QWORD *)v5 + 7) = v56;

          v58 = (void *)*((_QWORD *)v5 + 7);
          v67 = *(_OWORD *)image;
          v68 = *(_QWORD *)&v74[0];
          v69 = *(_OWORD *)((char *)v74 + 8);
          v70 = *((_QWORD *)&v74[1] + 1);
          v71 = v75;
          v72 = v76;
          objc_msgSend(v58, "setCameraState:", &v67);
          v30 = (VKMapSnapshot *)v5;
LABEL_40:

          goto LABEL_41;
        }
LABEL_39:
        v30 = 0;
        goto LABEL_40;
      }
    }
  }
  v30 = 0;
LABEL_23:

  return v30;
}

- (id)imageSurfaceAtIndex:(unint64_t)a3
{
  void *v3;
  void *Property;
  void *v5;
  id v6;
  uint64_t v8;

  v8 = 0;
  -[NSArray objectAtIndex:](self->_images, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getValue:", &v8);

  Property = (void *)CGImageGetProperty();
  v5 = Property;
  if (Property)
    v6 = Property;
  return v5;
}

- (id)imageSurfaces
{
  void *v3;
  unint64_t i;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_images, "count"));
  for (i = 0; i < -[NSArray count](self->_images, "count"); ++i)
  {
    -[VKMapSnapshot imageSurfaceAtIndex:](self, "imageSurfaceAtIndex:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDictionary *memoryStats;
  void *v6;
  void *v7;
  VKCamera *vkCamera;
  void *v9;
  double v10;
  NSArray *elevationRasters;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v4 = a3;
  objc_msgSend(v4, "encodeBytes:length:forKey:", self->_displayStyles, 6 * self->_displayStylesCount, CFSTR("displayStyles"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_displayStylesCount, CFSTR("displayStylesCount"));
  memoryStats = self->_memoryStats;
  if (memoryStats)
    objc_msgSend(v4, "encodeObject:forKey:", memoryStats, CFSTR("memoryStats"));
  -[VKMapSnapshot imageSurfaces](self, "imageSurfaces");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("imageSurfaces"));
  }
  else
  {
    -[VKMapSnapshot imageDataInFormat:](self, "imageDataInFormat:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("imageDatas"));

  }
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("scale"), self->_scale);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("targetPointElevation"), self->_targetPointElevation);
  vkCamera = self->_vkCamera;
  if (vkCamera)
  {
    -[VKCamera cameraState](vkCamera, "cameraState");
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v12 = 0u;
  }
  objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", &v12, "{VKCameraState={RigidTransform<double, double>={Matrix<double, 3, 1>=[3d]}{Quaternion<double>={Matrix<double, 3, 1>=[3d]}d}}d{Unit<geo::RadianUnitDescription, double>=d}d}");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("cameraState"));

  elevationRasters = self->_elevationRasters;
  if (elevationRasters)
    objc_msgSend(v4, "encodeObject:forKey:", elevationRasters, CFSTR("elevationRasters"));
  *(float *)&v10 = self->_elevationScale;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("elevationScale"), v10, v12, v13, v14, v15, v16);
  objc_msgSend(v4, "encodeObject:forKey:", self->_colorSpace, CFSTR("colorSpace"));

}

- (void)dealloc
{
  $6EFE6C6748B912A6EAC8A8E593ED1344 *displayStyles;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;
  CGImageRef image;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  displayStyles = self->_displayStyles;
  if (displayStyles)
    free(displayStyles);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_images;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        image = 0;
        objc_msgSend(v8, "getValue:", &image);
        CGImageRelease(image);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)VKMapSnapshot;
  -[VKMapSnapshot dealloc](&v9, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)VKMapSnapshot;
  -[VKMapSnapshot description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ size: (%zu, %zu)"), v4, self->_width, self->_height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGPoint)pointForCoordinate:(id)a3
{
  double var1;
  double var0;
  double v6;
  long double v7;
  double v8;
  __int128 v9;
  NSArray *elevationRasters;
  NSArray *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  int v18;
  double v19;
  float v20;
  float v21;
  float v24;
  double v25;
  double v26;
  float64x2_t *v27;
  double *p_scale;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v36;
  float64x2_t v37;
  double v38;
  __int128 v39;
  double v40;
  double v41;
  double v42;
  double v43[2];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;
  CGPoint result;

  var1 = a3.var1;
  var0 = a3.var0;
  v49 = *MEMORY[0x1E0C80C00];
  v6 = *(double *)-[VKCamera position](self->_vkCamera, "position");
  v7 = tan(var0 * 0.00872664626 + 0.785398163);
  v8 = var1 * 0.00277777778;
  v42 = v8 + 0.5;
  v41 = log(v7) * 0.159154943 + 0.5;
  elevationRasters = self->_elevationRasters;
  if (elevationRasters)
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v11 = elevationRasters;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    v13 = 0.0;
    if (v12)
    {
      v14 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v45 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          v17 = objc_msgSend(v16, "tile");
          v18 = 1 << *(_BYTE *)(v17 + 1);
          v19 = -1.0 / (double)v18;
          v20 = (v42 + v19 * (double)*(int *)(v17 + 8)) * (double)v18;
          v21 = (v41 + v19 * (double)(v18 + ~*(_DWORD *)(v17 + 4))) * (double)v18;
          v43[0] = v20;
          v43[1] = v21;
          objc_msgSend(v16, "tile");
          -[VKCamera position](self->_vkCamera, "position");
          if (v20 >= 0.0 && v20 <= 1.0 && v21 >= 0.0 && v21 <= 1.0)
          {
            objc_msgSend(v16, "getElevationAtPoint:", v43);
            v13 = v24;
            goto LABEL_22;
          }
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      }
      while (v12);
    }
LABEL_22:

    *(double *)&v9 = (v13 - self->_targetPointElevation) * (0.0000000249532021 * self->_elevationScale);
  }
  else
  {
    *(_QWORD *)&v9 = 0;
  }
  v39 = v9;
  if (v8 > v6)
  {
    v25 = -0.5;
LABEL_27:
    v26 = v8 + v25;
    v42 = v26;
    goto LABEL_28;
  }
  v26 = v8 + 1.0;
  if (v8 + 1.0 < v6)
  {
    v25 = 1.5;
    goto LABEL_27;
  }
LABEL_28:
  v27 = -[VKCamera scaledViewProjectionMatrix](self->_vkCamera, "scaledViewProjectionMatrix", v26, v39);
  p_scale = &self->_scale;
  v29 = vld1q_dup_f64(p_scale);
  v30 = vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v27[6], *v27, v42), v27[2], v41), v27[4], v40), 0.5 / (v27[7].f64[1] + v27[1].f64[1] * v42 + v27[3].f64[1] * v41 + v27[5].f64[1] * v40));
  __asm { FMOV            V3.2D, #0.5 }
  *(_QWORD *)&v36.f64[0] = *(_OWORD *)&vaddq_f64(v30, _Q3);
  v36.f64[1] = vsubq_f64(_Q3, v30).f64[1];
  v37 = vdivq_f64(vmulq_f64(v36, vcvtq_f64_u64(*(uint64x2_t *)&self->_width)), v29);
  v38 = v37.f64[1];
  result.x = v37.f64[0];
  result.y = v38;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinateForPoint:(CGPoint)a3
{
  VKCamera *vkCamera;
  double v5;
  double v6;
  long double v7;
  long double v8;
  long double v9;
  long double v10;
  double v11;
  double v12;
  double v13;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  vkCamera = self->_vkCamera;
  if (vkCamera)
  {
    -[VKCamera groundPointFromScreenPoint:](vkCamera, "groundPointFromScreenPoint:", self->_scale * a3.x / (double)self->_width, 1.0 - self->_scale * a3.y / (double)self->_height);
    v5 = v13 * 6.28318531 + -3.14159265;
    v6 = v12 * 6.28318531;
  }
  else
  {
    v6 = 0.0;
    v5 = -3.14159265;
  }
  v7 = exp(v5);
  v8 = atan(v7) * 114.591559 + -90.0;
  v9 = fmod(v6, 6.28318531);
  v10 = fmod(v9 + 6.28318531, 6.28318531) * 57.2957795 + -180.0;
  v11 = v8;
  result.var1 = v10;
  result.var0 = v11;
  return result;
}

- (id)imageDataInFormat:(unint64_t)a3
{
  NSArray **p_images;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  __CFData *v12;
  CGImageDestination *v13;
  CGImageRef image;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  p_images = &self->_images;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_images, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = *p_images;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    if (a3)
      v9 = CFSTR("public.png");
    else
      v9 = CFSTR("public.jpeg");
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        image = 0;
        objc_msgSend(v11, "getValue:", &image);
        v12 = (__CFData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
        v13 = CGImageDestinationCreateWithData(v12, v9, 1uLL, 0);
        CGImageDestinationAddImage(v13, image, 0);
        CGImageDestinationFinalize(v13);
        CFRelease(v13);
        objc_msgSend(v5, "addObject:", v12);

        ++v10;
      }
      while (v7 != v10);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v5;
}

- (void)enumerateImagesWithBlock:(id)a3
{
  unint64_t v3;
  void (**v5)(id, unint64_t, _QWORD);
  uint64_t v6;
  unint64_t v7;
  $6EFE6C6748B912A6EAC8A8E593ED1344 *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v5 = (void (**)(id, unint64_t, _QWORD))a3;
  if (self->_displayStylesCount)
  {
    v6 = 0;
    v7 = 0;
    do
    {
      v8 = &self->_displayStyles[v6];
      v9 = *(unsigned __int16 *)&v8->var4;
      v10 = *(unsigned int *)&v8->var0;
      -[NSArray objectAtIndexedSubscript:](self->_images, "objectAtIndexedSubscript:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      objc_msgSend(v11, "getValue:", &v12);
      v3 = v3 & 0xFFFF000000000000 | (v10 | (v9 << 32)) & 0xFFFFFFFFFFFFLL;
      v5[2](v5, v3, v12);

      ++v7;
      ++v6;
    }
    while (v7 < self->_displayStylesCount);
  }

}

- (NSArray)images
{
  return self->_images;
}

- (double)scale
{
  return self->_scale;
}

- (NSDictionary)memoryStats
{
  return self->_memoryStats;
}

- (void)setMemoryStats:(id)a3
{
  objc_storeStrong((id *)&self->_memoryStats, a3);
}

- (NSArray)elevationRasters
{
  return self->_elevationRasters;
}

- (void)setElevationRasters:(id)a3
{
  objc_storeStrong((id *)&self->_elevationRasters, a3);
}

- (NSString)colorSpace
{
  return self->_colorSpace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_elevationRasters, 0);
  objc_storeStrong((id *)&self->_memoryStats, 0);
  objc_storeStrong((id *)&self->_vkCamera, 0);
  objc_storeStrong((id *)&self->_images, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
