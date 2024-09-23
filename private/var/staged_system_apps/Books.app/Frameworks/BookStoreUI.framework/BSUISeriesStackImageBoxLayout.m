@implementation BSUISeriesStackImageBoxLayout

- (void)computeLayout
{
  double v3;
  double v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  char *v16;
  double v17;
  double width;
  double v19;
  float v20;
  float v21;
  double v22;
  double v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  float v29;
  void *v30;
  float v31;
  double v32;
  double v33;
  double v34;
  double height;
  uint64_t v36;
  double v37;
  double v38;

  -[BSUISeriesStackImageBoxLayout computeWidth](self, "computeWidth");
  v4 = v3;
  v5 = objc_opt_class(BSUISeriesStackImageBox);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUISeriesStackImageBoxLayout box](self, "box"));
  v7 = TUIDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filter"));
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "resourceOptions"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("filter")));

  }
  if (objc_msgSend(v11, "isEqualToString:", BCUCoverEffectsIdentifierSeriesStackHorizontal))
  {
    if (v4 <= 50.0)
      v13 = 26.0;
    else
      v13 = 52.0;
    if (v4 <= 50.0)
      v14 = 50.0;
    else
      v14 = 97.0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "coverURLStrings"));
    v16 = (char *)objc_msgSend(v15, "count");

    if (v16 == (_BYTE *)&dword_0 + 1)
      v17 = v13;
    else
      v17 = v14;
    width = fmax(v17, v4);
    v19 = width;
    if (v16 != (_BYTE *)&dword_0 + 1)
      v19 = v13 / v14 * width;
    v20 = COERCE_FLOAT(objc_msgSend(v8, "intrinsicHeight"));
    LODWORD(v21) = objc_msgSend(v8, "intrinsicWidth");
    if (v20 <= 0.0 || (*(float *)&v22 = v21, v21 <= 0.0))
      objc_msgSend(v8, "maxAspectRatio", v22);
    else
      v23 = v20 / v21;
    v33 = v19 * v23;
    v34 = 40.0;
    if (v4 > 50.0)
      v34 = 81.0;
    height = fmin(v34, v33);
  }
  else
  {
    v24 = objc_msgSend(v11, "isEqualToString:", BCUCoverEffectsIdentifierSeriesStackDiagonal);
    if ((_DWORD)v24)
    {
      width = fmax(v4, 69.0);
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "resourceInstance"));
      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "metadataForIdentifier:", v26));

      if (v27)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject intrinsicAspectRatio](v27, "intrinsicAspectRatio"));
        objc_msgSend(v28, "floatValue");
        if (v29 <= 0.0)
        {
          objc_msgSend(v8, "maxAspectRatio");
          v32 = v38;
        }
        else
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject intrinsicAspectRatio](v27, "intrinsicAspectRatio"));
          objc_msgSend(v30, "floatValue");
          v32 = v31;

        }
      }
      else
      {
        objc_msgSend(v8, "maxAspectRatio");
        v32 = v37;
      }
      height = fmax(width * v32, 1.0);
    }
    else
    {
      v36 = BSUITemplateLog(v24);
      v27 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_238E50((uint64_t)v11, v27);
      width = CGSizeZero.width;
      height = CGSizeZero.height;
    }

  }
  -[BSUISeriesStackImageBoxLayout setComputedNaturalSize:](self, "setComputedNaturalSize:", width, height);

}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  BSUISeriesStackImageLayerConfig *v17;
  double v18;
  double v19;
  unsigned __int8 v20;
  unsigned __int8 v21;
  void *v22;
  BSUISeriesStackImageLayerConfig *v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  id v30;
  uint64_t v32;
  id v33;

  v5 = a4;
  v33 = -[BSUISeriesStackImageBoxLayout _newImageResourcesWithContext:](self, "_newImageResourcesWithContext:", v5);
  v6 = objc_opt_class(BSUISeriesStackImageBox);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUISeriesStackImageBoxLayout box](self, "box"));
  v8 = TUIDynamicCast(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  objc_msgSend(v9, "cornerRadius");
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fallbackColor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentsGravity"));
  objc_msgSend(v9, "opacity");
  v15 = v14;
  v16 = objc_msgSend(v9, "crossfadesContents");
  v17 = [BSUISeriesStackImageLayerConfig alloc];
  objc_msgSend(v5, "contentsScale");
  v19 = v18;
  v20 = objc_msgSend(v9, "continuousCorners");
  v21 = objc_msgSend(v9, "shouldRasterize");
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "blendMode"));
  BYTE1(v32) = v21;
  LOBYTE(v32) = v20;
  v23 = -[BSUISeriesStackImageLayerConfig initWithContentsScale:resource:load:cornerRadius:fallbackColor:contentsGravity:hflip:crossfadesContents:opacity:continuousCorners:shouldRasterize:blendMode:](v17, "initWithContentsScale:resource:load:cornerRadius:fallbackColor:contentsGravity:hflip:crossfadesContents:opacity:continuousCorners:shouldRasterize:blendMode:", v33, 2, v12, v13, 0, v16, v19, v11, v15, v32, v22);

  v24 = objc_msgSend(objc_alloc((Class)TUIRenderModelLayer), "initWithSubmodels:config:erasableInsets:", 0, v23, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  -[BSUISeriesStackImageBoxLayout renderModelSizeWithContext:](self, "renderModelSizeWithContext:", v5);
  v26 = v25;
  v28 = v27;

  objc_msgSend(v24, "setSize:", v26, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  objc_msgSend(v24, "setIdentifier:", v29);

  v30 = v24;
  return v30;
}

- (id)_newImageResourcesWithContext:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *i;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  char *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  unsigned int v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  char *v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];

  v4 = a3;
  -[BSUISeriesStackImageBoxLayout renderModelSizeWithContext:](self, "renderModelSizeWithContext:", v4);
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "contentsScale");
  v10 = v9;
  v11 = (char *)-[BSUISeriesStackImageBoxLayout computedLayoutDirection](self, "computedLayoutDirection");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSUISeriesStackImageBoxLayout controller](self, "controller"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "manager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "imageResourceCache"));

  v15 = objc_opt_class(BSUISeriesStackImageBox);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BSUISeriesStackImageBoxLayout box](self, "box"));
  v17 = TUIDynamicCast(v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "coverURLStrings"));
  if (v19)
  {
    v55 = v11;
    v56 = v4;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "coverURLStrings"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v20, "count")));

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "coverURLStrings"));
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    if (v23)
    {
      v4 = v23;
      v24 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(_QWORD *)v58 != v24)
            objc_enumerationMutation(v22);
          v26 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "baseURL"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageResourceForTemplatedURL:baseURL:naturalSize:contentsScale:", v26, v27, v8, v8, v10));
          objc_msgSend(v21, "addObject:", v28);

        }
        v4 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
      }
      while (v4);
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "coverURLStrings"));
    if (objc_msgSend(v29, "count") == (char *)&dword_0 + 1)
    {
      v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "coverFilters"));
      v30 = (char *)objc_msgSend(v4, "count");

      if (v30 == (_BYTE *)&dword_0 + 1)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "coverURLStrings"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectAtIndexedSubscript:", 0));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "baseURL"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageResourceForTemplatedURL:baseURL:naturalSize:contentsScale:", v32, v33, v8, v8, v10));

        v35 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "coverFilters"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectAtIndexedSubscript:", 0));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageResource:naturalSize:contentsScale:withFilter:filterOptions:", v34, v36, &__NSDictionary0__struct, v8, v8, v10));
LABEL_17:

LABEL_25:
        v4 = v56;
        goto LABEL_26;
      }
    }
    else
    {

    }
    if (v55 == (_BYTE *)&dword_0 + 2
      && (v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "filter")),
          objc_msgSend(v4, "isEqualToString:", BCUCoverEffectsIdentifierSeriesStackHorizontal)))
    {
      v35 = BCUCoverEffectsIdentifierSeriesStackHorizontalRTL;
    }
    else
    {
      v35 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "filter"));
      if (v55 != (_BYTE *)&dword_0 + 2)
      {
LABEL_24:
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "coverFilters"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageResourceForImageResources:filters:imageSetFilter:naturalSize:contentsScale:", v21, v36, v35, v6, v8, v10));
        goto LABEL_25;
      }
    }

    goto LABEL_24;
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[BSUISeriesStackImageBoxLayout box](self, "box"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "resourceKind"));

  if (v39)
  {
    v56 = v4;
    v40 = objc_opt_class(NSDictionary);
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[BSUISeriesStackImageBoxLayout box](self, "box"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "resourceOptions"));
    v43 = BUDynamicCast(v40, v42);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v43);

    if (v11 == (_BYTE *)&dword_0 + 2)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("filter")));
      v45 = objc_msgSend(v44, "isEqualToString:", BCUCoverEffectsIdentifierSeriesStackHorizontal);

      if (v45)
      {
        v46 = objc_msgSend(v21, "mutableCopy");
        objc_msgSend(v46, "setObject:forKeyedSubscript:", BCUCoverEffectsIdentifierSeriesStackHorizontalRTL, CFSTR("filter"));
        v47 = objc_msgSend(v46, "copy");

        v21 = v47;
      }
    }
    v35 = (id)objc_claimAutoreleasedReturnValue(-[BSUISeriesStackImageBoxLayout controller](self, "controller"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[BSUISeriesStackImageBoxLayout box](self, "box"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "resourceKind"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[BSUISeriesStackImageBoxLayout box](self, "box"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "resourceInstance"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "imageResourceForKind:naturalSize:contentsScale:instance:options:", v34, v49, v21, v6, v8, v10));

    goto LABEL_17;
  }
  v37 = 0;
LABEL_26:
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[BSUISeriesStackImageBoxLayout box](self, "box"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "maskColor"));

  if (v51)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "maskColor"));
    v53 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageResource:tintedWithColor:", v37, v52));

    v37 = (void *)v53;
  }

  return v37;
}

@end
