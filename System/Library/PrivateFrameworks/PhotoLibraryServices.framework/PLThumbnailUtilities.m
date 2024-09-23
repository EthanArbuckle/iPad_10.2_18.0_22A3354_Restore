@implementation PLThumbnailUtilities

+ (int)_bytesPerRowForSpecification:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = *MEMORY[0x1E0D74C90];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D74FD0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v4) = objc_msgSend(v7, "intValue");
  objc_msgSend(MEMORY[0x1E0D73238], "formatWithID:", (unsigned __int16)v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v8, "tableFormatBytesPerRowForWidth:", v6);

  return (int)v4;
}

+ (int)_requiredDataLengthForSpecification:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  int v7;

  v4 = *MEMORY[0x1E0D74C88];
  v5 = a3;
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  LODWORD(a1) = objc_msgSend(a1, "_bytesPerRowForSpecification:", v5);
  return (_DWORD)a1 * v7;
}

+ (id)_destinationDataFromSpecification:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0C99DF0];
  v5 = a3;
  v6 = [v4 alloc];
  LODWORD(a1) = objc_msgSend(a1, "_requiredDataLengthForSpecification:", v5);

  return (id)objc_msgSend(v6, "initWithLength:", (int)a1);
}

+ (id)_destinationDataArrayFromSpecifications:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "_destinationDataFromSpecification:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

+ (BOOL)_validateSpecification:(id)a3 destinationData:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;

  v6 = a3;
  v7 = v6;
  if (a4)
  {
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D74C90]);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D74C88]);
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)v10;
        objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D74C80]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v13 = *a4;
          v14 = *a4;
          if (v13)
          {
            v15 = v14;
            a4 = (id *)objc_msgSend(v14, "length");

            LOBYTE(a4) = (unint64_t)a4 >= (int)objc_msgSend(a1, "_requiredDataLengthForSpecification:", v7);
          }
          else
          {
            objc_msgSend(a1, "_destinationDataFromSpecification:", v7);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            LOBYTE(a4) = 1;
          }
          goto LABEL_9;
        }
      }
      else
      {

      }
    }
    LOBYTE(a4) = 0;
  }
LABEL_9:

  return (char)a4;
}

+ (BOOL)_validateSpecifications:(id)a3 destinationData:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  unint64_t v29;
  int v30;
  BOOL v31;
  id *v33;
  id v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!a4)
    goto LABEL_21;
  v8 = objc_msgSend(v6, "count");
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v10)
  {
    v11 = v10;
    v33 = a4;
    v34 = a1;
    v35 = v7;
    v12 = *(_QWORD *)v37;
    v13 = *MEMORY[0x1E0D74C90];
    v14 = *MEMORY[0x1E0D74C88];
    v15 = *MEMORY[0x1E0D74C80];
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v37 != v12)
          objc_enumerationMutation(v9);
        v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v17, "objectForKey:", v13);
        v18 = objc_claimAutoreleasedReturnValue();
        if (!v18)
          goto LABEL_23;
        v19 = (void *)v18;
        objc_msgSend(v17, "objectForKey:", v14);
        v20 = objc_claimAutoreleasedReturnValue();
        if (!v20)
        {

LABEL_23:
          v31 = 0;
          v7 = v35;
          goto LABEL_24;
        }
        v21 = (void *)v20;
        objc_msgSend(v17, "objectForKey:", v15);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
          goto LABEL_23;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v11)
        continue;
      break;
    }

    a1 = v34;
    v7 = v35;
    a4 = v33;
    goto LABEL_14;
  }

  if (!v8)
  {
LABEL_21:
    v31 = 0;
    goto LABEL_25;
  }
LABEL_14:
  v23 = *a4;
  if (v23)
  {
    v24 = v23;
    v25 = objc_msgSend(v9, "count");
    if (v25 == objc_msgSend(v24, "count"))
    {
      if (objc_msgSend(v9, "count"))
      {
        v26 = 0;
        do
        {
          objc_msgSend(v24, "objectAtIndex:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndex:", v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v27, "length");
          v30 = objc_msgSend(a1, "_requiredDataLengthForSpecification:", v28);

          v31 = v29 >= v30;
          if (v29 < v30)
            break;
          ++v26;
          v31 = 1;
        }
        while (v26 < objc_msgSend(v9, "count"));
      }
      else
      {
        v31 = 1;
      }
    }
    else
    {
      v31 = 0;
    }
    v9 = v24;
  }
  else
  {
    objc_msgSend(a1, "_destinationDataArrayFromSpecifications:", v9);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v31 = 1;
  }
LABEL_24:

LABEL_25:
  return v31;
}

+ (BOOL)performHWCascadingDownscaleTo5551OnIOSurface:(__IOSurface *)a3 withSpecifications:(id)a4 destinationData:(id *)a5 usingContext:(id)a6
{
  id v10;
  id v11;
  int v12;
  char v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _DWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v30;
  __IOSurface *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;

  v10 = a4;
  v11 = a6;
  v12 = objc_msgSend(a1, "_validateSpecifications:destinationData:", v10, a5);
  v13 = 0;
  if (!v12 || !a3 || !v11)
    goto LABEL_16;
  v14 = *a5;
  v15 = objc_msgSend(v10, "count");
  v16 = v15 << 32;
  v17 = malloc_type_malloc(8 * (int)v15, 0x100004000313F17uLL);
  v18 = malloc_type_malloc(4 * (int)v15, 0x100004052888210uLL);
  if (v15 << 32)
  {
    v30 = v15;
    v31 = a3;
    v32 = v14;
    v33 = v11;
    v19 = 0;
    v35 = *MEMORY[0x1E0D74C90];
    v34 = *MEMORY[0x1E0D74C88];
    v20 = *MEMORY[0x1E0D74C80];
    if ((unint64_t)(v16 >> 32) <= 1)
      v21 = 1;
    else
      v21 = v16 >> 32;
    v22 = v17;
    do
    {
      objc_msgSend(v10, "objectAtIndex:", v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKey:", v35);
      v24 = v10;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "intValue");
      objc_msgSend(v23, "objectForKey:", v34);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "intValue");
      v27 = PLSizeMake();

      v10 = v24;
      v22[v19] = v27;
      objc_msgSend(v23, "objectForKey:", v20);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v18[v19] = objc_msgSend(v28, "intValue");

      ++v19;
    }
    while (v21 != v19);
    v14 = v32;
    v11 = v33;
    v17 = v22;
    v13 = objc_msgSend(v33, "downscaleImageSurface:destinationCount:sizes:cropModes:pixelFormat:bytesPerRowAlignment:destinationData:", v31, v30, v22, v18, 892679473, 16, v32);
    goto LABEL_12;
  }
  v13 = objc_msgSend(v11, "downscaleImageSurface:destinationCount:sizes:cropModes:pixelFormat:bytesPerRowAlignment:destinationData:", a3, v15, v17, v18, 892679473, 16, v14);
  if (v17)
LABEL_12:
    free(v17);
  if (v18)
    free(v18);

LABEL_16:
  return v13;
}

+ (BOOL)_performSWDownscaleTo5551OnSourceImage:(CGImage *)a3 withSourceDimensions:(id)a4 withSpecification:(id)a5 destinationData:(id)a6 imageRect:(CGRect *)a7 bytesPerRow:(int *)a8
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  int v26;
  CGColorSpace *DeviceRGB;
  CGContext *v28;
  BOOL v29;
  CGContext *v30;
  CGRect v32;

  v13 = a5;
  v14 = a6;
  if (a3)
  {
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0D74C90]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "intValue");
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0D74C88]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "intValue");
    v17 = PLSizeMake();

    PLRectByCenteringAndScalingDimensionsToFitDimensions();
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v26 = objc_msgSend(a1, "_bytesPerRowForSpecification:", v13);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v28 = CGBitmapContextCreate((void *)objc_msgSend(objc_retainAutorelease(v14), "mutableBytes"), (int)v17, v17 >> 32, 5uLL, v26, DeviceRGB, 0x1006u);
    v29 = v28 != 0;
    if (v28)
    {
      v30 = v28;
      v32.origin.x = v19;
      v32.origin.y = v21;
      v32.size.width = v23;
      v32.size.height = v25;
      CGContextDrawImage(v28, v32, a3);
      CGContextRelease(v30);
    }
    CGColorSpaceRelease(DeviceRGB);
    if (a7)
    {
      a7->origin.x = v19;
      a7->origin.y = v21;
      a7->size.width = v23;
      a7->size.height = v25;
    }
    if (a8)
      *a8 = v26;
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

+ (BOOL)performSWDownscaleTo5551OnImage:(CGImage *)a3 withSpecification:(id)a4 destinationData:(id *)a5 imageRect:(CGRect *)a6 bytesPerRow:(int *)a7
{
  id v12;
  id v13;
  char v14;

  v12 = a4;
  if (objc_msgSend(a1, "_validateSpecification:destinationData:", v12, a5))
  {
    v13 = *a5;
    CGImageGetWidth(a3);
    CGImageGetHeight(a3);
    v14 = objc_msgSend(a1, "_performSWDownscaleTo5551OnSourceImage:withSourceDimensions:withSpecification:destinationData:imageRect:bytesPerRow:", a3, PLSizeMake(), v12, v13, a6, a7);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (BOOL)performSWCascadingDownscaleTo5551OnImage:(CGImage *)a3 withSpecifications:(id)a4 destinationData:(id *)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  CGImage *SquareCroppedImage;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  CGImage *v19;
  uint64_t v20;
  void *v21;
  int v22;
  id v24;
  uint64_t v25;
  id obj;
  CGImageRef image;
  uint64_t v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v29 = a1;
  if (objc_msgSend(a1, "_validateSpecifications:destinationData:", v8, a5))
  {
    v30 = *a5;
    CGImageGetWidth(a3);
    CGImageGetHeight(a3);
    v25 = PLSizeMake();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v8;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v9)
    {
      v10 = v9;
      v24 = v8;
      SquareCroppedImage = 0;
      v12 = 0;
      v13 = 0;
      image = a3;
      v28 = *(_QWORD *)v32;
      v14 = *MEMORY[0x1E0D74C80];
LABEL_4:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v32 != v28)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v15);
        objc_msgSend(v16, "objectForKey:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "intValue");

        if (v18 == 2)
        {
          v19 = SquareCroppedImage;
          v20 = v12;
          if (!SquareCroppedImage)
          {
            SquareCroppedImage = PLThumbnailCreateSquareCroppedImage(image);
            CGImageGetWidth(SquareCroppedImage);
            CGImageGetHeight(SquareCroppedImage);
            v12 = PLSizeMake();
            v19 = SquareCroppedImage;
            v20 = v12;
          }
        }
        else
        {
          v19 = image;
          v20 = v25;
        }
        objc_msgSend(v30, "objectAtIndex:", v13 + v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v29, "_performSWDownscaleTo5551OnSourceImage:withSourceDimensions:withSpecification:destinationData:imageRect:bytesPerRow:", v19, v20, v16, v21, 0, 0);

        if (!v22)
          break;
        if (v10 == ++v15)
        {
          v13 += v15;
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
          if (v10)
            goto LABEL_4;
          LOBYTE(v22) = 1;
          break;
        }
      }
      v8 = v24;
    }
    else
    {
      SquareCroppedImage = 0;
      LOBYTE(v22) = 1;
    }

    CGImageRelease(SquareCroppedImage);
  }
  else
  {
    LOBYTE(v22) = 0;
  }

  return v22;
}

@end
