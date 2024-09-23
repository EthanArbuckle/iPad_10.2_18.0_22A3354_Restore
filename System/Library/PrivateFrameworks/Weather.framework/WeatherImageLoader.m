@implementation WeatherImageLoader

- (WeatherImageLoader)init
{
  WeatherImageLoader *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  void *v23;
  uint64_t v24;
  CPBitmapStore *store;
  int v26;
  CPBitmapStore *v27;
  id v28;
  void *v29;
  uint64_t v30;
  CPBitmapStore *v31;
  void *v32;
  double v33;
  NSCache *v34;
  NSCache *conditionImagesCache;
  id v37;
  id v38;
  objc_super v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v39.receiver = self;
  v39.super_class = (Class)WeatherImageLoader;
  v2 = -[WeatherImageLoader init](&v39, sel_init);
  if (v2)
  {
    +[WeatherPreferences sharedPreferences](WeatherPreferences, "sharedPreferences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "readDefaultValueForKey:", CFSTR("HasMigratedDataProtectionClassTake2"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    if ((v5 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "userLibraryDirectory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      MigrateDataProtectionClassOfPath(v7);

      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "userCachesDirectory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      MigrateDataProtectionClassOfPath(v9);

      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "userCachesDirectory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("Weather"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      MigrateDataProtectionClassOfPath(v12);

      _WAWeatherIconCachePath();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0;
      objc_msgSend(v14, "removeItemAtPath:error:", v13, &v38);
      v15 = v38;
      WALogForCategory(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v41 = v13;
        v42 = 2112;
        v43 = v15;
        _os_log_impl(&dword_21AAEC000, v16, OS_LOG_TYPE_DEFAULT, "Removed: %@ Error: %@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "userCachesDirectory");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringByAppendingPathComponent:", CFSTR("Weather/Labels"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = 0;
      objc_msgSend(v14, "removeItemAtPath:error:", v19, &v37);
      v20 = v37;
      WALogForCategory(0);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v41 = v19;
        v42 = 2112;
        v43 = v20;
        _os_log_impl(&dword_21AAEC000, v21, OS_LOG_TYPE_DEFAULT, "Removed: %@ Error: %@", buf, 0x16u);
      }

      objc_msgSend(v3, "writeDefaultValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("HasMigratedDataProtectionClassTake2"));
    }
    v22 = objc_alloc(MEMORY[0x24BE04760]);
    _WAWeatherIconCachePath();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "initWithPath:version:", v23, 13);
    store = v2->_store;
    v2->_store = (CPBitmapStore *)v24;

    v26 = -[CPBitmapStore version](v2->_store, "version");
    v27 = v2->_store;
    if (v26 == 13)
    {
      if (-[CPBitmapStore version](v27, "version") != -1)
      {
LABEL_13:
        objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "scale");
        v2->_scale = v33;

        v34 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
        conditionImagesCache = v2->_conditionImagesCache;
        v2->_conditionImagesCache = v34;

        -[NSCache setEvictsObjectsWhenApplicationEntersBackground:](v2->_conditionImagesCache, "setEvictsObjectsWhenApplicationEntersBackground:", 0);
        return v2;
      }
    }
    else
    {
      -[CPBitmapStore purge](v27, "purge");
      v28 = objc_alloc(MEMORY[0x24BE04760]);
      _WAWeatherIconCachePath();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "initWithPath:version:", v29, 13);
      v31 = v2->_store;
      v2->_store = (CPBitmapStore *)v30;

    }
    -[CPBitmapStore setVersion:withOptions:](v2->_store, "setVersion:withOptions:", 13, 0x10000000);
    goto LABEL_13;
  }
  return v2;
}

+ (void)preloadImages
{
  uint64_t i;
  id v3;

  for (i = 0; i != 48; ++i)
    v3 = +[WeatherImageLoader conditionImageWithConditionIndex:](WeatherImageLoader, "conditionImageWithConditionIndex:", i);
}

- (id)cachedImageForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  CGImage *v8;
  void *v9;

  v4 = a3;
  -[WeatherImageLoader conditionImagesCache](self, "conditionImagesCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = -[CPBitmapStore copyImageForKey:inGroup:](self->_store, "copyImageForKey:inGroup:", v4, &stru_24DD9EDF8);
    if (v7)
    {
      v8 = (CGImage *)v7;
      objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:scale:orientation:", v7, 0, self->_scale);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WeatherImageLoader conditionImagesCache](self, "conditionImagesCache");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v6, v4);

      CGImageRelease(v8);
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (void)setImage:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a3;
  v7 = a4;
  v8 = objc_retainAutorelease(v6);
  if (objc_msgSend(v8, "CGImage"))
    -[CPBitmapStore storeImageForKey:inGroup:opaque:image:](self->_store, "storeImageForKey:inGroup:opaque:image:", v7, &stru_24DD9EDF8, 0, objc_msgSend(objc_retainAutorelease(v8), "CGImage"));

}

+ (id)sharedImageLoader
{
  void *v2;
  WeatherImageLoader *v3;
  void *v4;

  v2 = (void *)sharedImageLoader___sharedImageLoader;
  if (!sharedImageLoader___sharedImageLoader)
  {
    v3 = objc_alloc_init(WeatherImageLoader);
    v4 = (void *)sharedImageLoader___sharedImageLoader;
    sharedImageLoader___sharedImageLoader = (uint64_t)v3;

    v2 = (void *)sharedImageLoader___sharedImageLoader;
  }
  return v2;
}

+ (void)cacheImageIfNecessary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  +[WeatherImageLoader sharedImageLoader](WeatherImageLoader, "sharedImageLoader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cachedImageForKey:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(a1, "conditionImageBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageNamed:inBundle:", v10, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "WAImageLoaderPreCacheImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setImage:forKey:", v9, v10);
  }

}

+ (id)conditionImageWithConditionIndex:(int64_t)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "conditionImageNameWithConditionIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WeatherImageLoader conditionImageNamed:style:](WeatherImageLoader, "conditionImageNamed:style:", v3, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)conditionImageWithConditionIndex:(int64_t)a3 style:(int64_t)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "conditionImageNameWithConditionIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WeatherImageLoader conditionImageNamed:style:](WeatherImageLoader, "conditionImageNamed:style:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)conditionImageNamed:(id)a3 style:(int64_t)a4
{
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  double v9;
  double v10;
  _BOOL4 IsReduceTransparencyEnabled;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v6 = a3;
  v7 = UIAccessibilityDarkerSystemColorsEnabled();
  v8 = 0;
  v9 = 40.0;
  v10 = 0.58;
  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  v12 = 0;
  v13 = 0;
  switch(a4)
  {
    case 0:
      goto LABEL_3;
    case 1:
      v8 = 1;
      v10 = 1.0;
LABEL_3:
      v13 = 0;
      v12 = v8;
      v9 = 60.0;
      v8 = 0;
      break;
    case 2:
      goto LABEL_5;
    case 3:
      v8 = 1;
LABEL_5:
      v13 = v8;
      v8 = v7 | IsReduceTransparencyEnabled;
      v9 = 100.0;
      v12 = v7;
      break;
    case 4:
      break;
    case 5:
      v8 = 0;
      v12 = 0;
      v13 = 1;
      v9 = 40.0;
      break;
    default:
      v12 = 0;
      v13 = 0;
      break;
  }
  objc_msgSend(a1, "conditionImageNamed:size:cloudAligned:stroke:strokeAlpha:lighterColors:", v6, v13, v12, v8, v9, v9, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)conditionImageNamed:(id)a3 size:(CGSize)a4 cloudAligned:(BOOL)a5 stroke:(BOOL)a6 strokeAlpha:(double)a7 lighterColors:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v10;
  _BOOL4 v11;
  double height;
  double width;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v52;
  void *v53;
  _QWORD v54[4];
  id v55;
  id v56;
  uint64_t *v57;
  id v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  BOOL v64;
  BOOL v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;

  v8 = a8;
  v10 = a6;
  v11 = a5;
  height = a4.height;
  width = a4.width;
  v15 = a3;
  WASmallWeatherIconsMap();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "objectForKey:", CFSTR("WeatherMapColors"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "count"))
  {
    v52 = v17;
    v66 = 0;
    v67 = &v66;
    v68 = 0x3032000000;
    v69 = __Block_byref_object_copy__0;
    v70 = __Block_byref_object_dispose__0;
    v19 = (void *)MEMORY[0x24BDF6AC8];
    v20 = (void *)MEMORY[0x24BDD17C8];
    v53 = v18;
    objc_msgSend(v18, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("%@_%@"), v15, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = a1;
    objc_msgSend(a1, "conditionImageBundle");
    v24 = v8;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "imageNamed:inBundle:", v22, v25);
    v71 = (id)objc_claimAutoreleasedReturnValue();

    v26 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", width);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v27;
    v29 = CFSTR("vert");
    if (v11)
      v29 = CFSTR("hor");
    v30 = &stru_24DD9EDF8;
    v31 = CFSTR("-stroke");
    if (!v10)
      v31 = &stru_24DD9EDF8;
    if (v24)
      v30 = CFSTR("l");
    objc_msgSend(v26, "stringWithFormat:", CFSTR("%@-%@-%@%@%@"), v15, v29, v27, v31, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    +[WeatherImageLoader sharedImageLoader](WeatherImageLoader, "sharedImageLoader");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "cachedImageForKey:", v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = v34;
    }
    else
    {
      objc_msgSend((id)v67[5], "size");
      v37 = v36;
      objc_msgSend((id)v67[5], "size");
      v39 = v38;
      objc_msgSend((id)v67[5], "size");
      v41 = v40;
      v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithSize:", width, height);
      v43 = width * 0.125;
      v44 = (width + width * 0.125 * -2.0) / v37;
      v45 = v44 * v39;
      v46 = v44 * v41;
      v47 = (height - v44 * v41) * 0.5;
      v54[0] = MEMORY[0x24BDAC760];
      v54[1] = 3221225472;
      v54[2] = __93__WeatherImageLoader_conditionImageNamed_size_cloudAligned_stroke_strokeAlpha_lighterColors___block_invoke;
      v54[3] = &unk_24DD9D400;
      v64 = v10;
      v55 = v15;
      v58 = v23;
      v59 = a7;
      v60 = v43;
      v61 = v47;
      v62 = v45;
      v63 = v46;
      v56 = v53;
      v57 = &v66;
      v65 = v24;
      objc_msgSend(v42, "imageWithActions:", v54);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "WAImageLoaderPreCacheImage");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      +[WeatherImageLoader sharedImageLoader](WeatherImageLoader, "sharedImageLoader");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setImage:forKey:", v49, v32);

      v35 = v49;
    }
    v17 = v52;

    _Block_object_dispose(&v66, 8);
    v18 = v53;
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

void __93__WeatherImageLoader_conditionImageNamed_size_cloudAligned_stroke_strokeAlpha_lighterColors___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v26 = a2;
  v3 = 0x24BDF6000uLL;
  v4 = 0x24BDD1000uLL;
  if (*(_BYTE *)(a1 + 104))
  {
    v5 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_stroke"), *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "conditionImageBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageNamed:inBundle:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageWithRenderingMode:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, *(double *)(a1 + 64));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "set");

    objc_msgSend(v9, "drawPDFInRect:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = *(id *)(a1 + 40);
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        v16 = v3;
        v17 = *(void **)(v3 + 2760);
        objc_msgSend(*(id *)(v4 + 1992), "stringWithFormat:", CFSTR("%@_%@"), *(_QWORD *)(a1 + 32), v15, v26);
        v18 = v4;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "conditionImageBundle");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "imageNamed:inBundle:", v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "imageWithRenderingMode:", 2);
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v24 = *(void **)(v23 + 40);
        *(_QWORD *)(v23 + 40) = v22;

        v3 = v16;
        v4 = v18;
        objc_msgSend(*(id *)(a1 + 56), "colorForImageColor:lighter:", v15, *(unsigned __int8 *)(a1 + 105));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "set");

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "drawPDFInRect:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v12);
  }

}

+ (id)colorForImageColor:(id)a3 lighter:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  int v11;
  void *v12;

  v4 = a4;
  v5 = a3;
  if (objc_msgSend(v5, "containsString:", CFSTR("white")))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v5, "containsString:", CFSTR("blue")))
    {
      v7 = (void *)MEMORY[0x24BDF6950];
      v8 = 0.352941176;
      v9 = 0.784313725;
      v10 = 0.980392157;
    }
    else if (objc_msgSend(v5, "containsString:", CFSTR("yellow")))
    {
      v7 = (void *)MEMORY[0x24BDF6950];
      if (v4)
      {
        v8 = 0.984313725;
        v9 = 0.91372549;
        v10 = 0.380392157;
      }
      else
      {
        v8 = 0.996078431;
        v9 = 0.843137255;
        v10 = 0.192156863;
      }
    }
    else
    {
      v11 = objc_msgSend(v5, "containsString:", CFSTR("red"));
      v7 = (void *)MEMORY[0x24BDF6950];
      if (!v11)
      {
        objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      v9 = 0.22745098;
      v10 = 0.184313725;
      v8 = 1.0;
    }
    objc_msgSend(v7, "colorWithRed:green:blue:alpha:", v8, v9, v10, 1.0);
    v6 = objc_claimAutoreleasedReturnValue();
  }
LABEL_12:
  v12 = (void *)v6;

  return v12;
}

+ (id)cachedImageNamed:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  +[WeatherImageLoader sharedImageLoader](WeatherImageLoader, "sharedImageLoader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cachedImageForKey:", v5);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v6 && !v8)
  {
    v6[2](v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:forKey:", v9, v5);
  }

  return v9;
}

+ (id)conditionImageNameWithConditionIndex:(int64_t)a3
{
  int64_t v3;

  v3 = 44;
  if ((unint64_t)a3 <= 0x2F)
    v3 = a3;
  return *(&smallWeatherIcons + v3);
}

- (CPBitmapStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (NSCache)conditionImagesCache
{
  return self->_conditionImagesCache;
}

- (void)setConditionImagesCache:(id)a3
{
  objc_storeStrong((id *)&self->_conditionImagesCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditionImagesCache, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end
