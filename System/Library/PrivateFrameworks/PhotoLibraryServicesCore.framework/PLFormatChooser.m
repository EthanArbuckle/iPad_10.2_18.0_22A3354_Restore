@implementation PLFormatChooser

uint64_t __47__PLFormatChooser_initWithDeviceConfiguration___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (PLImageFormat)masterThumbnailFormat
{
  return self->_masterThumbnailFormat;
}

void __47__PLFormatChooser_initWithDeviceConfiguration___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "isThumbnail") && (objc_msgSend(v7, "isTable") & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), a2);
    *a4 = 1;
  }

}

void __39__PLFormatChooser_defaultFormatChooser__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  +[PLDeviceConfiguration defaultDeviceConfiguration](PLDeviceConfiguration, "defaultDeviceConfiguration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithDeviceConfiguration:", v4);
  v3 = (void *)defaultFormatChooser_defaultChooser;
  defaultFormatChooser_defaultChooser = v2;

}

- (PLFormatChooser)initWithDeviceConfiguration:(id)a3
{
  id v6;
  PLFormatChooser *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  PLImageFormat *indexSheetUnbakedFormat;
  id *p_indexSheetUnbakedFormat;
  PLImageFormat *largestUncroppedNonJPEGThumbnailFormat;
  id *p_largestUncroppedNonJPEGThumbnailFormat;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  NSArray *supportedDerivativeFormats;
  PLImageFormat *v24;
  void *v25;
  void *v26;
  unsigned __int16 v27;
  void *v28;
  PLImageFormat *v29;
  void *v30;
  void *v31;
  unsigned __int16 v32;
  void *v33;
  PLImageFormat *v34;
  PLImageFormat *fullScreenFormatForCurrentDevice;
  PLImageFormat *v36;
  PLImageFormat *masterThumbnailFormat;
  NSArray *v38;
  PLFormatChooser *v39;
  uint64_t v40;
  uint64_t v41;
  PLImageFormat *posterThumbnailFormat;
  uint64_t v43;
  uint64_t v44;
  PLImageFormat *portraitScrubberThumbnailFormat;
  uint64_t v46;
  uint64_t v47;
  PLImageFormat *landscapeScrubberThumbnailFormat;
  void *v50;
  void *v51;
  id obj;
  PLFormatChooser *v53;
  _QWORD v54[4];
  PLFormatChooser *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  objc_super v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v60.receiver = self;
  v60.super_class = (Class)PLFormatChooser;
  v7 = -[PLFormatChooser init](&v60, sel_init);
  if (v7)
  {
    obj = a3;
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    +[PLThumbnailManagerCore supportedThumbnailFormatIDsForDeviceConfiguration:](PLThumbnailManagerCore, "supportedThumbnailFormatIDsForDeviceConfiguration:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v10);

    objc_msgSend((id)objc_opt_class(), "_suppportedFullSizeFormatIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v11);

    p_indexSheetUnbakedFormat = (id *)&v7->_indexSheetUnbakedFormat;
    indexSheetUnbakedFormat = v7->_indexSheetUnbakedFormat;
    v7->_indexSheetUnbakedFormat = 0;

    v53 = v7;
    p_largestUncroppedNonJPEGThumbnailFormat = (id *)&v7->_largestUncroppedNonJPEGThumbnailFormat;
    largestUncroppedNonJPEGThumbnailFormat = v7->_largestUncroppedNonJPEGThumbnailFormat;
    v7->_largestUncroppedNonJPEGThumbnailFormat = 0;

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v16 = v9;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v57 != v19)
            objc_enumerationMutation(v16);
          +[PLImageFormat formatWithID:](PLImageFormat, "formatWithID:", (unsigned __int16)objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "unsignedIntegerValue"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            objc_msgSend(v8, "insertObject:atIndex:", v21, objc_msgSend(v8, "indexOfObject:inSortedRange:options:usingComparator:", v21, 0, objc_msgSend(v8, "count"), 1024, &__block_literal_global_3020));
            if (objc_msgSend(v21, "isSquare")
              && (!*p_indexSheetUnbakedFormat || objc_msgSend(v21, "compare:") == 1))
            {
              objc_storeStrong(p_indexSheetUnbakedFormat, v21);
            }
            if ((objc_msgSend(v21, "isCropped") & 1) == 0
              && objc_msgSend(v21, "isTable")
              && (!*p_largestUncroppedNonJPEGThumbnailFormat || objc_msgSend(v21, "compare:") == 1))
            {
              objc_storeStrong(p_largestUncroppedNonJPEGThumbnailFormat, v21);
            }
          }

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      }
      while (v18);
    }

    v22 = objc_msgSend(v8, "copy");
    supportedDerivativeFormats = v53->_supportedDerivativeFormats;
    v53->_supportedDerivativeFormats = (NSArray *)v22;

    objc_storeStrong((id *)&v53->_deviceConfiguration, obj);
    objc_msgSend(v6, "logicalScreenSize");
    -[PLFormatChooser derivativeFormatThatFitsSize:contentMode:demoteFactor:srcAspectRatio:desiredImagePixelSize:](v53, "derivativeFormatThatFitsSize:contentMode:demoteFactor:srcAspectRatio:desiredImagePixelSize:", 0, 0);
    v24 = (PLImageFormat *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_suppportedFullSizeFormatIDs");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "lastObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "integerValue");

    if (!v27)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, v53, CFSTR("PLFormatChooser.m"), 171, CFSTR("can't determine largest supported format."));

    }
    +[PLImageFormat formatWithID:](PLImageFormat, "formatWithID:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24 || -[PLImageFormat compare:](v24, "compare:", v28) == 1)
    {
      v29 = v28;

      v24 = v29;
    }
    objc_msgSend((id)objc_opt_class(), "_suppportedFullSizeFormatIDs");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "firstObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "integerValue");

    if (!v32)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, v53, CFSTR("PLFormatChooser.m"), 181, CFSTR("can't determine smallest supported format."));

    }
    +[PLImageFormat formatWithID:](PLImageFormat, "formatWithID:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PLImageFormat compare:](v24, "compare:", v33) == -1)
    {
      v34 = v33;

      v24 = v34;
    }
    fullScreenFormatForCurrentDevice = v53->_fullScreenFormatForCurrentDevice;
    v53->_fullScreenFormatForCurrentDevice = v24;
    v36 = v24;

    v7 = v53;
    masterThumbnailFormat = v53->_masterThumbnailFormat;
    v53->_masterThumbnailFormat = 0;

    v38 = v53->_supportedDerivativeFormats;
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __47__PLFormatChooser_initWithDeviceConfiguration___block_invoke_2;
    v54[3] = &unk_1E37696A8;
    v39 = v53;
    v55 = v39;
    -[NSArray enumerateObjectsWithOptions:usingBlock:](v38, "enumerateObjectsWithOptions:usingBlock:", 2, v54);
    if (-[PLDeviceConfiguration isRetina](v53->_deviceConfiguration, "isRetina"))
      v40 = 3143;
    else
      v40 = 3034;
    +[PLImageFormat formatWithID:](PLImageFormat, "formatWithID:", v40);
    v41 = objc_claimAutoreleasedReturnValue();
    posterThumbnailFormat = v39->_posterThumbnailFormat;
    v39->_posterThumbnailFormat = (PLImageFormat *)v41;

    if (-[PLDeviceConfiguration isRetina](v53->_deviceConfiguration, "isRetina"))
      v43 = 8102;
    else
      v43 = 8002;
    +[PLImageFormat formatWithID:](PLImageFormat, "formatWithID:", v43);
    v44 = objc_claimAutoreleasedReturnValue();
    portraitScrubberThumbnailFormat = v39->_portraitScrubberThumbnailFormat;
    v39->_portraitScrubberThumbnailFormat = (PLImageFormat *)v44;

    if (-[PLDeviceConfiguration isRetina](v53->_deviceConfiguration, "isRetina"))
      v46 = 8101;
    else
      v46 = 8001;
    +[PLImageFormat formatWithID:](PLImageFormat, "formatWithID:", v46);
    v47 = objc_claimAutoreleasedReturnValue();
    landscapeScrubberThumbnailFormat = v39->_landscapeScrubberThumbnailFormat;
    v39->_landscapeScrubberThumbnailFormat = (PLImageFormat *)v47;

  }
  return v7;
}

+ (id)_suppportedFullSizeFormatIDs
{
  return &unk_1E378FF60;
}

- (id)derivativeFormatThatFitsSize:(CGSize)a3 contentMode:(int64_t)a4 demoteFactor:(double)a5 srcAspectRatio:(double)a6 desiredImagePixelSize:(CGSize *)a7
{
  double height;
  double width;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  id v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  height = a3.height;
  width = a3.width;
  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_desiredImageSizeForRequestedViewSizeInPixels:isAspectFill:srcAspectRatio:", a4 == 1, a3.width, a3.height, a6);
  v16 = v14;
  v17 = v15;
  if (a7)
  {
    a7->width = v14;
    a7->height = v15;
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = self->_supportedDerivativeFormats;
  v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v23, "_isAcceptableForViewSize:contentMode:sourceAspectRatio:desiredImageSize:demoteFactor:", a4, width, height, a6, v16, v17, a5, (_QWORD)v26))
        {
          v24 = v23;
          goto LABEL_13;
        }
      }
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v20)
        continue;
      break;
    }
  }
  v24 = 0;
LABEL_13:

  return v24;
}

+ (CGSize)_desiredImageSizeForRequestedViewSizeInPixels:(CGSize)a3 isAspectFill:(BOOL)a4 srcAspectRatio:(double)a5
{
  double v5;
  double v6;
  double v7;
  CGSize result;

  v5 = a3.width / a3.height;
  if (a3.height <= 0.0)
    v5 = 1.0;
  if (!a4)
  {
    if (v5 <= a5)
      goto LABEL_5;
LABEL_7:
    a3.width = a3.height * a5;
    goto LABEL_8;
  }
  if (v5 <= a5)
    goto LABEL_7;
LABEL_5:
  a3.height = a3.width / a5;
LABEL_8:
  v6 = round(a3.width);
  v7 = round(a3.height);
  result.height = v7;
  result.width = v6;
  return result;
}

- (PLImageFormat)largestUncroppedNonJPEGThumbnailFormat
{
  return self->_largestUncroppedNonJPEGThumbnailFormat;
}

+ (id)defaultFormatChooser
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PLFormatChooser_defaultFormatChooser__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultFormatChooser_onceToken != -1)
    dispatch_once(&defaultFormatChooser_onceToken, block);
  return (id)defaultFormatChooser_defaultChooser;
}

- (id)_bestFormatWithSize:(CGSize)a3 specificVersionType:(int64_t)a4 contentMode:(int64_t)a5 demoteFactor:(double)a6 srcAspectRatio:(double)a7 hasAdjustmentsHandler:(id)a8 desiredImagePixelSize:(CGSize *)a9
{
  double height;
  double width;
  id v17;
  void *v18;
  _BOOL8 v19;
  unint64_t v20;
  int v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;

  height = a3.height;
  width = a3.width;
  v17 = a8;
  v18 = v17;
  v19 = height == -1.0 && width == -1.0;
  v20 = a4 - 3;
  LOBYTE(v21) = 1;
  if (a4)
    v22 = 0;
  else
    v22 = v19;
  if (v20 > 0xFFFFFFFFFFFFFFFDLL)
    v22 = 1;
  if (v17 && v22)
    v21 = (*((uint64_t (**)(id))v17 + 2))(v17) ^ 1;
  if (((a4 == 0) & v21) != 0)
    v23 = (void *)v19;
  else
    v23 = (void *)a4;
  v24 = a4 == 3 || v19;
  if (v20 < 0xFFFFFFFFFFFFFFFELL)
    LOBYTE(v21) = 1;
  if (v24 == 1 || (v21 & 1) == 0)
  {
    if (a9)
    {
      a9->width = width;
      a9->height = height;
    }
    __143__PLFormatChooser__bestFormatWithSize_specificVersionType_contentMode_demoteFactor_srcAspectRatio_hasAdjustmentsHandler_desiredImagePixelSize___block_invoke(v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PLFormatChooser derivativeFormatThatFitsSize:contentMode:demoteFactor:srcAspectRatio:desiredImagePixelSize:](self, "derivativeFormatThatFitsSize:contentMode:demoteFactor:srcAspectRatio:desiredImagePixelSize:", a5, a9, width, height, a6, a7);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      v27 = v25;
    }
    else
    {
      __143__PLFormatChooser__bestFormatWithSize_specificVersionType_contentMode_demoteFactor_srcAspectRatio_hasAdjustmentsHandler_desiredImagePixelSize___block_invoke(v23);
      v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    v28 = v27;

  }
  return v28;
}

- (id)_nextLargestAcceptableFormatForFormat:(id)a3
{
  id v5;
  NSArray *supportedDerivativeFormats;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[5];
  uint64_t v14;
  id *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  v14 = 0;
  v15 = (id *)&v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3012;
  v18 = __Block_byref_object_dispose__3013;
  v19 = 0;
  if (objc_msgSend(v5, "formatID") == 9998)
  {
    objc_storeStrong(v15 + 5, a3);
    supportedDerivativeFormats = self->_supportedDerivativeFormats;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__PLFormatChooser__nextLargestAcceptableFormatForFormat___block_invoke;
    v13[3] = &unk_1E37696D0;
    v13[4] = &v14;
    -[NSArray enumerateObjectsWithOptions:usingBlock:](supportedDerivativeFormats, "enumerateObjectsWithOptions:usingBlock:", 2, v13);
  }
  else
  {
    v7 = -[NSArray indexOfObject:](self->_supportedDerivativeFormats, "indexOfObject:", v5);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_storeStrong(v15 + 5, a3);
      if (v7 >= 1)
      {
        v8 = v7 + 1;
        while (1)
        {
          -[NSArray objectAtIndexedSubscript:](self->_supportedDerivativeFormats, "objectAtIndexedSubscript:", v8 - 2);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v5, "_canDegradeToFormat:", v9))
            break;

          if ((unint64_t)--v8 <= 1)
            goto LABEL_10;
        }
        v10 = v15[5];
        v15[5] = v9;

      }
    }
  }
LABEL_10:
  v11 = v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

- (id)_standardDegradedFormatFallingBackFromFormat:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = -[PLDeviceConfiguration shouldUseNanoThumbnailFormats](self->_deviceConfiguration, "shouldUseNanoThumbnailFormats");
  v6 = v4;
  v7 = v6;
  if (!v5)
  {
    -[PLFormatChooser _nextLargestAcceptableFormatForFormat:](self, "_nextLargestAcceptableFormatForFormat:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v7 = v6;
    if (v8)
    {
      v7 = v8;

    }
  }

  return v7;
}

- (id)_fastestDegradedFormatFallingBackFromFormat:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  if (-[PLDeviceConfiguration shouldUseNanoThumbnailFormats](self->_deviceConfiguration, "shouldUseNanoThumbnailFormats"))
  {
    v5 = v4;
  }
  else
  {
    -[PLFormatChooser _nextLargestAcceptableFormatForFormat:](self, "_nextLargestAcceptableFormatForFormat:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = v4;
    if (!v6)
      goto LABEL_11;
    v9 = objc_msgSend(v6, "isTable");
    v8 = v7;
    if ((v9 & 1) != 0)
      goto LABEL_11;
    v10 = -[NSArray indexOfObject:](self->_supportedDerivativeFormats, "indexOfObject:", v7);
    v8 = v7;
    if (v10 < 1)
      goto LABEL_11;
    v11 = v10 + 1;
    while (1)
    {
      -[NSArray objectAtIndexedSubscript:](self->_supportedDerivativeFormats, "objectAtIndexedSubscript:", v11 - 2);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "_canDegradeToFormat:", v5))
      {
        if ((objc_msgSend(v5, "isTable") & 1) != 0)
          break;
      }

      if ((unint64_t)--v11 <= 1)
      {
        v8 = v7;
        goto LABEL_11;
      }
    }
    v8 = v7;
    if (!v5)
LABEL_11:
      v5 = v8;

  }
  return v5;
}

- (void)chooseFormatsForSize:(CGSize)a3 specificVersionType:(int64_t)a4 contentMode:(int64_t)a5 demoteFactor:(double)a6 srcAspectRatio:(double)a7 degradedFormatPolicy:(int64_t)a8 hasAdjustmentsHandler:(id)a9 desiredImagePixelSize:(CGSize *)a10 bestFormat:(id *)a11 degradedFormat:(id *)a12
{
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;

  -[PLFormatChooser _bestFormatWithSize:specificVersionType:contentMode:demoteFactor:srcAspectRatio:hasAdjustmentsHandler:desiredImagePixelSize:](self, "_bestFormatWithSize:specificVersionType:contentMode:demoteFactor:srcAspectRatio:hasAdjustmentsHandler:desiredImagePixelSize:", a4, a5, a9, a10, a3.width, a3.height, a6, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  v22 = v15;
  if (a11)
  {
    v17 = objc_retainAutorelease(v15);
    v16 = v22;
    *a11 = v17;
  }
  if (a12)
  {
    -[PLFormatChooser _standardDegradedFormatFallingBackFromFormat:](self, "_standardDegradedFormatFallingBackFromFormat:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a8 == 1)
    {
      -[PLFormatChooser _fastestDegradedFormatFallingBackFromFormat:](self, "_fastestDegradedFormatFallingBackFromFormat:", v18);
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = v18;
    }
    v21 = objc_retainAutorelease(v20);
    *a12 = v21;

    v16 = v22;
  }

}

- (CGSize)posterThumbnailSize
{
  double v2;
  double v3;
  CGSize result;

  -[PLImageFormat size](self->_posterThumbnailFormat, "size");
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSArray)supportedDerivativeFormats
{
  return self->_supportedDerivativeFormats;
}

- (PLImageFormat)fullScreenFormatForCurrentDevice
{
  return self->_fullScreenFormatForCurrentDevice;
}

- (PLImageFormat)indexSheetUnbakedFormat
{
  return self->_indexSheetUnbakedFormat;
}

- (PLImageFormat)portraitScrubberThumbnailFormat
{
  return self->_portraitScrubberThumbnailFormat;
}

- (PLImageFormat)landscapeScrubberThumbnailFormat
{
  return self->_landscapeScrubberThumbnailFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_landscapeScrubberThumbnailFormat, 0);
  objc_storeStrong((id *)&self->_portraitScrubberThumbnailFormat, 0);
  objc_storeStrong((id *)&self->_masterThumbnailFormat, 0);
  objc_storeStrong((id *)&self->_largestUncroppedNonJPEGThumbnailFormat, 0);
  objc_storeStrong((id *)&self->_indexSheetUnbakedFormat, 0);
  objc_storeStrong((id *)&self->_fullScreenFormatForCurrentDevice, 0);
  objc_storeStrong((id *)&self->_supportedDerivativeFormats, 0);
  objc_storeStrong((id *)&self->_posterThumbnailFormat, 0);
  objc_storeStrong((id *)&self->_deviceConfiguration, 0);
}

void __57__PLFormatChooser__nextLargestAcceptableFormatForFormat___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if ((objc_msgSend(v7, "isSquare") & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

id __143__PLFormatChooser__bestFormatWithSize_specificVersionType_contentMode_demoteFactor_srcAspectRatio_hasAdjustmentsHandler_desiredImagePixelSize___block_invoke(void *a1)
{
  uint64_t v1;
  uint64_t v2;

  if ((unint64_t)a1 <= 3)
  {
    +[PLImageFormat formatWithID:](PLImageFormat, "formatWithID:", (unsigned __int16)(0x270D2710270F270EuLL >> (16 * a1)), v1, v2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

@end
