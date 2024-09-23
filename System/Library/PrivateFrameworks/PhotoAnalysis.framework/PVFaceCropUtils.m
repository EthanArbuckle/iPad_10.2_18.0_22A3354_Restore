@implementation PVFaceCropUtils

+ (CGImageMetadata)createOutputMetadataFromDictionary:(id)a3
{
  id v3;
  void *v4;
  CGImageMetadata *Mutable;
  void *v6;
  void *v7;
  const __CFString *v9;
  id v10;
  id v11;
  const __CFString *v12;
  id v13;

  v3 = a3;
  v4 = (void *)MEMORY[0x1D1798448]();
  Mutable = CGImageMetadataCreateMutable();
  if (!CGImageMetadataSetValueWithPath(Mutable, 0, CFSTR("tiff:Orientation"), CFSTR("1")))
  {
    v9 = CFSTR("Could not set output orientation");
    goto LABEL_9;
  }
  if (!CGImageMetadataRegisterNamespaceForPrefix(Mutable, CFSTR("com.apple/PhotoVision/FaceCrop/"), CFSTR("PVFC"), 0))
  {
    v9 = CFSTR("Could not register face crop namespace");
LABEL_9:
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v9, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Could not generate serialized metadata representation"), 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);
  if (!v7)
  {
    v12 = CFSTR("Could not convert metadata representation into serialized format");
    goto LABEL_13;
  }
  if (!CGImageMetadataSetValueWithPath(Mutable, 0, CFSTR("PVFC:PVFC"), v7))
  {
    v12 = CFSTR("Could not set face crop metadata");
LABEL_13:
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v12, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v13);
  }

  objc_autoreleasePoolPop(v4);
  return Mutable;
}

+ (id)newDictionaryPopulatedWithFaceCropDataFromImageData:(id)a3
{
  const __CFData *v3;
  void *v4;
  CGImageSource *v5;
  CGImageSource *v6;
  const CGImageMetadata *v7;
  const CGImageMetadata *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v16;
  id v17;

  v3 = (const __CFData *)a3;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1D1798448]();
    v5 = CGImageSourceCreateWithData(v3, 0);
    v6 = v5;
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Could not create image source"), 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v16);
    }
    v7 = CGImageSourceCopyMetadataAtIndex(v5, 0, 0);
    v8 = v7;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("No meta data exists on image"), 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v17);
    }
    v9 = (__CFString *)CGImageMetadataCopyStringValueWithPath(v7, 0, CFSTR("PVFC:PVFC"));
    v10 = v9;
    if (v9)
    {
      v11 = (void *)MEMORY[0x1E0CB36D8];
      -[__CFString dataUsingEncoding:](v9, "dataUsingEncoding:", 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "JSONObjectWithData:options:error:", v12, 1, 0);
      v13 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }

    CFRelease(v8);
    v14 = (void *)v13;
    if (v6)
      CFRelease(v6);
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)newDictionaryRepresentationOfFaceCropDataFromFaceBox:(CGRect)a3 andCropRegion:(CGRect)a4 andGroupingIdentifier:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  id v13;
  void *v14;
  CFDictionaryRef DictionaryRepresentation;
  CFDictionaryRef v16;
  CGRect v18;
  CGRect v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3.size.height;
  v10 = a3.size.width;
  v11 = a3.origin.y;
  v12 = a3.origin.x;
  v13 = a5;
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setObject:forKey:", &unk_1E8540358, CFSTR("PVFC_VER"));
  v18.origin.x = v12;
  v18.origin.y = v11;
  v18.size.width = v10;
  v18.size.height = v9;
  DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v18);
  objc_msgSend(v14, "setObject:forKey:", DictionaryRepresentation, CFSTR("PVFC_FB"));

  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v16 = CGRectCreateDictionaryRepresentation(v19);
  objc_msgSend(v14, "setObject:forKey:", v16, CFSTR("PVFC_CB"));

  objc_msgSend(v14, "setObject:forKey:", &unk_1E8540358, CFSTR("PVFC_VER"));
  if (v13)
    objc_msgSend(v14, "setObject:forKey:", v13, CFSTR("PVFC_GID"));

  return v14;
}

+ (id)newDictionaryWithCGImageSourceOptions
{
  uint64_t v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CBD2B8];
  v4[0] = *MEMORY[0x1E0CBD240];
  v4[1] = v2;
  v5[0] = MEMORY[0x1E0C9AAA0];
  v5[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)newFaceCropFromCGImageSource:(const CGImageSource *)a3 withFaceRect:(CGRect)a4 groupingIdentifier:(id)a5 error:(id *)a6
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  unint64_t v12;
  unint64_t v13;
  double v15;
  double v16;
  double v17;
  double RectWithAllIntegers;
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
  double v29;
  double v30;
  CGImage *OrientedCroppedAndScaledImageFromCGImageSource;
  id v32;
  CGImageMetadata *v33;
  __CFData *v34;
  CGImageDestination *v35;
  const __CFString *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  double v44;
  void *context;
  size_t v46;
  size_t v47;
  int v48;
  uint64_t v49;
  _QWORD v50[2];
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v50[1] = *MEMORY[0x1E0C80C00];
  v11 = a5;
  context = (void *)MEMORY[0x1D1798448]();
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("unexpected nil image source"), 0);
    v38 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v38);
  }
  v48 = -1;
  v46 = 0;
  v47 = 0;
  if ((getImagePropertiesFromCGImageSource(a3, &v48, &v47, &v46) & 1) == 0)
  {
    v37 = CFSTR("invalid image source");
LABEL_29:
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v37, 0);
    v39 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v39);
  }
  if (!(unint64_t)(width + 0.5) || !(unint64_t)(height + 0.5))
  {
    v37 = CFSTR("zero dimensioned face rect submitted");
    goto LABEL_29;
  }
  v12 = v47;
  if (x < 0.0 || y < 0.0)
  {
    v13 = v46;
LABEL_14:
    v54.size.width = (double)v47;
    v54.size.height = (double)v13;
    v54.origin.x = 0.0;
    v54.origin.y = 0.0;
    v51.origin.x = x;
    v51.origin.y = y;
    v51.size.width = width;
    v51.size.height = height;
    v52 = CGRectIntersection(v51, v54);
    x = v52.origin.x;
    width = v52.size.width;
    v13 = v46;
    v12 = v47;
    goto LABEL_15;
  }
  v13 = v46;
  if (v47 < (unint64_t)(width + x + 0.5) || v46 < (unint64_t)(height + y + 0.5))
    goto LABEL_14;
LABEL_15:
  v53.origin.x = makeRectWithAllIntegers(x + width * 0.5 - (width + width) * 0.5);
  v55.size.width = (double)v12;
  v55.size.height = (double)v13;
  v55.origin.x = 0.0;
  v55.origin.y = 0.0;
  *(_QWORD *)&v15 = (unint64_t)CGRectIntersection(v53, v55);
  RectWithAllIntegers = makeRectWithAllIntegers(v15);
  v20 = v19;
  v21 = v16;
  v22 = v17;
  if (v16 >= v17)
    v23 = v16;
  else
    v23 = v17;
  if (v23 <= 256.0)
    v24 = 1.0;
  else
    v24 = 256.0 / v23;
  v44 = makeRectWithAllIntegers((x - RectWithAllIntegers) * v24);
  v26 = v25;
  v28 = v27;
  v30 = v29;
  OrientedCroppedAndScaledImageFromCGImageSource = createOrientedCroppedAndScaledImageFromCGImageSource(a3, RectWithAllIntegers, v20, v21, v22, v24);
  if (!OrientedCroppedAndScaledImageFromCGImageSource)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("could not create cropped face crop image"), 0);
    v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v40);
  }
  v32 = +[PVFaceCropUtils newDictionaryRepresentationOfFaceCropDataFromFaceBox:andCropRegion:andGroupingIdentifier:](PVFaceCropUtils, "newDictionaryRepresentationOfFaceCropDataFromFaceBox:andCropRegion:andGroupingIdentifier:", v11, v44, v26, v28, v30, RectWithAllIntegers, v20, v21, v22);
  v33 = +[PVFaceCropUtils createOutputMetadataFromDictionary:](PVFaceCropUtils, "createOutputMetadataFromDictionary:", v32);
  if (!v33)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("could not create face crop metadata"), 0);
    v41 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v41);
  }
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v34 = (__CFData *)objc_claimAutoreleasedReturnValue();
  v35 = CGImageDestinationCreateWithData(v34, CFSTR("public.jpeg"), 1uLL, 0);
  if (!v35)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("could not create face crop data"), 0);
    v42 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v42);
  }
  v49 = *MEMORY[0x1E0CBC780];
  v50[0] = &unk_1E8540300;
  CGImageDestinationAddImageAndMetadata(v35, OrientedCroppedAndScaledImageFromCGImageSource, v33, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1));
  if (!CGImageDestinationFinalize(v35))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("could not write face crop data"), 0);
    v43 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v43);
  }

  CGImageRelease(OrientedCroppedAndScaledImageFromCGImageSource);
  CFRelease(v33);
  CFRelease(v35);
  objc_autoreleasePoolPop(context);

  return v34;
}

+ (id)newFaceCropFromImageURL:(id)a3 withFaceRect:(CGRect)a4 groupingIdentifier:(id)a5 error:(id *)a6
{
  double height;
  double width;
  double y;
  double x;
  const __CFURL *v12;
  id v13;
  void *v14;
  const __CFDictionary *v15;
  CGImageSourceRef v16;
  id v17;
  id v18;
  const __CFString *v20;
  id v21;
  id v22;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = (const __CFURL *)a3;
  v13 = a5;
  v14 = (void *)MEMORY[0x1D1798448]();
  if (!v12)
  {
    v20 = CFSTR("image url is nil");
    goto LABEL_9;
  }
  v15 = +[PVFaceCropUtils newDictionaryWithCGImageSourceOptions](PVFaceCropUtils, "newDictionaryWithCGImageSourceOptions");
  v16 = CGImageSourceCreateWithURL(v12, v15);

  if (!v16)
  {
    v20 = CFSTR("Could not create image source from URL");
LABEL_9:
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v20, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v22 = 0;
  v17 = +[PVFaceCropUtils newFaceCropFromCGImageSource:withFaceRect:groupingIdentifier:error:](PVFaceCropUtils, "newFaceCropFromCGImageSource:withFaceRect:groupingIdentifier:error:", v16, v13, &v22, x, y, width, height);
  v18 = v22;
  CFRelease(v16);
  objc_autoreleasePoolPop(v14);
  if (a6 && v18)
    *a6 = objc_retainAutorelease(v18);

  return v17;
}

+ (id)newFaceCropFromImageData:(id)a3 withFaceRect:(CGRect)a4 groupingIdentifier:(id)a5 error:(id *)a6
{
  double height;
  double width;
  double y;
  double x;
  const __CFData *v12;
  id v13;
  void *v14;
  const __CFDictionary *v15;
  CGImageSourceRef v16;
  id v17;
  id v18;
  const __CFString *v20;
  id v21;
  id v22;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = (const __CFData *)a3;
  v13 = a5;
  v14 = (void *)MEMORY[0x1D1798448]();
  if (!v12)
  {
    v20 = CFSTR("image data is nil");
    goto LABEL_9;
  }
  v15 = +[PVFaceCropUtils newDictionaryWithCGImageSourceOptions](PVFaceCropUtils, "newDictionaryWithCGImageSourceOptions");
  v16 = CGImageSourceCreateWithData(v12, v15);

  if (!v16)
  {
    v20 = CFSTR("Could not create image source from data");
LABEL_9:
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v20, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v22 = 0;
  v17 = +[PVFaceCropUtils newFaceCropFromCGImageSource:withFaceRect:groupingIdentifier:error:](PVFaceCropUtils, "newFaceCropFromCGImageSource:withFaceRect:groupingIdentifier:error:", v16, v13, &v22, x, y, width, height);
  v18 = v22;
  CFRelease(v16);
  objc_autoreleasePoolPop(v14);
  if (a6 && v18)
    *a6 = objc_retainAutorelease(v18);

  return v17;
}

+ (BOOL)isValidFaceCrop:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  BOOL v12;

  v4 = a3;
  v5 = (void *)MEMORY[0x1D1798448]();
  v6 = +[PVFaceCropUtils newDictionaryPopulatedWithFaceCropDataFromImageData:](PVFaceCropUtils, "newDictionaryPopulatedWithFaceCropDataFromImageData:", v4);
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PVFC_VER"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToNumber:", &unk_1E8540358);
    if ((v9 & 1) != 0
      || (objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PVFC_VER")),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqualToNumber:", &unk_1E8540370)))
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PVFC_FB"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PVFC_CB"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11 != 0;

      }
      else
      {
        v12 = 0;
      }

      if ((v9 & 1) != 0)
        goto LABEL_12;
    }
    else
    {
      v12 = 0;
    }

LABEL_12:
    goto LABEL_13;
  }
  v12 = 0;
LABEL_13:

  objc_autoreleasePoolPop(v5);
  return v12;
}

+ (CGRect)faceBoundsFromFaceCrop:(id)a3 error:(id *)a4
{
  id v4;
  CGSize v5;
  void *v6;
  id v7;
  void *v8;
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  double x;
  double y;
  double width;
  double height;
  id v15;
  CGRect rect;
  CGRect result;

  v4 = a3;
  v5 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  rect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  rect.size = v5;
  v6 = (void *)MEMORY[0x1D1798448]();
  v7 = +[PVFaceCropUtils newDictionaryPopulatedWithFaceCropDataFromImageData:](PVFaceCropUtils, "newDictionaryPopulatedWithFaceCropDataFromImageData:", v4);
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("invalid face crop supplied"), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PVFC_FB"));
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    CGRectMakeWithDictionaryRepresentation(v9, &rect);

  objc_autoreleasePoolPop(v6);
  x = rect.origin.x;
  y = rect.origin.y;
  width = rect.size.width;
  height = rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

+ (CGRect)cropBoundsInOriginalImageFromFaceCrop:(id)a3 error:(id *)a4
{
  id v4;
  CGSize v5;
  void *v6;
  id v7;
  void *v8;
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  double x;
  double y;
  double width;
  double height;
  id v15;
  CGRect rect;
  CGRect result;

  v4 = a3;
  v5 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  rect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  rect.size = v5;
  v6 = (void *)MEMORY[0x1D1798448]();
  v7 = +[PVFaceCropUtils newDictionaryPopulatedWithFaceCropDataFromImageData:](PVFaceCropUtils, "newDictionaryPopulatedWithFaceCropDataFromImageData:", v4);
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("invalid face crop supplied"), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PVFC_CB"));
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    CGRectMakeWithDictionaryRepresentation(v9, &rect);

  objc_autoreleasePoolPop(v6);
  x = rect.origin.x;
  y = rect.origin.y;
  width = rect.size.width;
  height = rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

+ (id)groupingIdentifierFromFaceCrop:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1D1798448]();
  v6 = +[PVFaceCropUtils newDictionaryPopulatedWithFaceCropDataFromImageData:](PVFaceCropUtils, "newDictionaryPopulatedWithFaceCropDataFromImageData:", v4);
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("invalid face crop supplied"), 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PVFC_GID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  return v8;
}

+ (CGSize)faceCropDimensionsFromFaceCrop:(id)a3 error:(id *)a4
{
  const __CFData *v5;
  void *v6;
  const __CFDictionary *v7;
  CGImageSource *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  const __CFString *v13;
  id v14;
  id v15;
  size_t v16;
  size_t v17;
  int v18;
  CGSize result;

  v5 = (const __CFData *)a3;
  v6 = (void *)MEMORY[0x1D1798448]();
  if ((objc_msgSend(a1, "isValidFaceCrop:", v5) & 1) == 0)
  {
    v13 = CFSTR("the supplied data is not a facecrop");
    goto LABEL_7;
  }
  v7 = +[PVFaceCropUtils newDictionaryWithCGImageSourceOptions](PVFaceCropUtils, "newDictionaryWithCGImageSourceOptions");
  v8 = CGImageSourceCreateWithData(v5, v7);

  if (!v8)
  {
    v13 = CFSTR("could not create an image source");
LABEL_7:
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v13, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
  }
  v18 = -1;
  v16 = 0;
  v17 = 0;
  if ((getImagePropertiesFromCGImageSource(v8, &v18, &v17, &v16) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Could not retrieve image properties"), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  v9 = (double)v17;
  v10 = (double)v16;
  CFRelease(v8);
  objc_autoreleasePoolPop(v6);

  v11 = v9;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

@end
