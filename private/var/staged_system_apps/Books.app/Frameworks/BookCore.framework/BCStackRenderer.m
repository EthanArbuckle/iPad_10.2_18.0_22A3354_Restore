@implementation BCStackRenderer

- (BCStackRenderer)init
{
  BCStackRenderer *v2;
  BCStackRenderer *v3;
  uint64_t v4;
  NSMutableArray *renderOperations;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BCStackRenderer;
  v2 = -[BCStackRenderer init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_accessLock._os_unfair_lock_opaque = 0;
    v4 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    renderOperations = v3->_renderOperations;
    v3->_renderOperations = (NSMutableArray *)v4;

  }
  return v3;
}

- (id)_bookFilter:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BCCoverEffects sharedInstance](BCCoverEffects, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bookCoverEffectFilters"));

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier", (_QWORD)v14));
        v12 = objc_msgSend(v11, "isEqualToString:", v3);

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)_seriesFilter:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BCCoverEffects sharedInstance](BCCoverEffects, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "seriesCoverEffectFilters"));

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier", (_QWORD)v14));
        v12 = objc_msgSend(v11, "isEqualToString:", v3);

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)renderStackFromSource:(id)a3 forRequest:(id)a4 onQueue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  BCStackRenderer *v26;
  id v27;
  id v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BCStackRenderer seriesDecomposer](self, "seriesDecomposer"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_129D54;
  v22[3] = &unk_291D28;
  v23 = v11;
  v24 = v12;
  v25 = v10;
  v26 = self;
  v27 = v14;
  v28 = v13;
  v17 = v14;
  v18 = v10;
  v19 = v12;
  v20 = v13;
  v21 = v11;
  objc_msgSend(v15, "assetIDsAndOptionsForBooksInSeries:completion:", v16, v22);

}

- (void)_renderStackFromSource:(id)a3 images:(id)a4 forRequest:(id)a5 onQueue:(id)a6 withCompletion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  int v17;
  int v18;
  uint64_t v19;
  id v20;
  void *i;
  void *v22;
  uint64_t v23;
  unsigned int v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  BOOL v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  __int16 v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  id v42;
  unsigned __int8 v43;
  id *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  NSMutableArray *v53;
  void *v54;
  NSMutableArray *v55;
  int v56;
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  id v62;
  __int16 v63;
  __int16 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v55 = objc_opt_new(NSMutableArray);
  v53 = objc_opt_new(NSMutableArray);
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v16 = v12;
  v54 = v16;
  v58 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
  if (v58)
  {
    v49 = v15;
    v50 = v14;
    v51 = v11;
    v52 = v13;
    v17 = 0;
    v18 = 0;
    v19 = *(_QWORD *)v66;
    v20 = &stru_B8 + 24;
    do
    {
      for (i = 0; i != v58; i = (char *)i + 1)
      {
        if (*(_QWORD *)v66 != v19)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i);
        v23 = (objc_msgSend(v22, "processingOptions", v49, v50, v51, v52) >> 7) & 1;
        v24 = objc_msgSend(v22, "processingOptions");
        v25 = v24;
        v26 = (v24 >> 6) & 1;
        if ((objc_msgSend(v22, "processingOptions") & 8) != 0)
          v27 = 2;
        else
          v27 = 1;
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[BCUCoverEffects effectIdentifierWithRTL:style:content:nightMode:](BCUCoverEffects, "effectIdentifierWithRTL:style:content:nightMode:", v23, v27, 1, v26));
        v29 = objc_claimAutoreleasedReturnValue(-[BCStackRenderer _bookFilter:](self, "_bookFilter:", v28));
        v30 = (void *)v29;
        if (v22)
          v31 = v29 == 0;
        else
          v31 = 1;
        if (!v31)
        {
          v56 = v17;
          v32 = v20;
          v33 = v19;
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "image"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", objc_msgSend(v34, "CGImage")));
          -[NSMutableArray addObject:](v55, "addObject:", v35);

          v16 = v54;
          v19 = v33;
          v20 = v32;
          v17 = v56;
          -[NSMutableArray addObject:](v53, "addObject:", v30);
        }
        if (objc_msgSend(v22, "quality") < (unsigned __int16)v20)
          v20 = objc_msgSend(v22, "quality");
        v18 |= objc_msgSend(v22, "isGeneric");
        v17 |= v25 & 0x40;

      }
      v58 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
    }
    while (v58);

    if ((v18 & 1) != 0)
      v36 = 2;
    else
      v36 = (__int16)v20;
    v11 = v51;
    v13 = v52;
    v15 = v49;
    v14 = v50;
  }
  else
  {

    LOWORD(v17) = 0;
    v36 = 208;
  }
  v37 = mainScreenScaleFactor();
  objc_msgSend(v11, "imageSize");
  v39 = v38;
  v41 = v40;
  v42 = BCUCoverEffectsIdentifierSeriesStackDiagonal;
  if ((objc_msgSend(v13, "processingOptions") & 0x1000) != 0)
  {
    v43 = objc_msgSend(v13, "processingOptions");
    v44 = (id *)&BCUCoverEffectsIdentifierSeriesStackHorizontalRTL;
    if ((v43 & 0x80) == 0)
      v44 = (id *)&BCUCoverEffectsIdentifierSeriesStackHorizontal;
    v45 = *v44;

    v42 = v45;
  }
  v59[1] = 3221225472;
  v59[0] = _NSConcreteStackBlock;
  v59[2] = sub_12ACD4;
  v59[3] = &unk_291D78;
  v60 = v14;
  v61 = v11;
  v63 = v17;
  v64 = v36;
  v62 = v15;
  v46 = v15;
  v47 = v11;
  v48 = v14;
  -[BCStackRenderer _applySeriesFilter:toImages:filters:size:completion:](self, "_applySeriesFilter:toImages:filters:size:completion:", v42, v55, v53, v59, v39 / v37, v41 / v37);

}

- (void)_applySeriesFilter:(id)a3 toImages:(id)a4 filters:(id)a5 size:(CGSize)a6 completion:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  double v20;
  id v21;
  os_unfair_lock_s *p_accessLock;
  id v23;
  id v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[4];
  id v31;

  height = a6.height;
  width = a6.width;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BCStackRenderer _seriesFilter:](self, "_seriesFilter:", a3));
  v17 = objc_msgSend(v13, "count");
  v18 = objc_msgSend(v14, "count");
  if (v16 && v17 && v18 == v17)
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_12B10C;
    v30[3] = &unk_291DA0;
    v31 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v13, "count"));
    v19 = v31;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v30);
    v20 = mainScreenScaleFactor();
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_12B13C;
    v28[3] = &unk_291DC8;
    v28[4] = self;
    v29 = v15;
    v21 = objc_msgSend(v16, "newOperationWithImages:filters:size:contentsScale:waitForCPUSynchronization:completion:", v19, v14, 1, v28, width, height, v20);
    objc_msgSend(v21, "start");
    p_accessLock = &self->_accessLock;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_12B320;
    v26[3] = &unk_28B808;
    v26[4] = self;
    v27 = v21;
    v23 = v21;
    os_unfair_lock_lock(p_accessLock);
    sub_12B320((uint64_t)v26);
    os_unfair_lock_unlock(p_accessLock);

  }
  else
  {
    v24 = objc_retainBlock(v15);
    v25 = v24;
    if (v24)
      (*((void (**)(id, _QWORD, _QWORD))v24 + 2))(v24, 0, 0);

  }
}

- (BCImageFetching)imageRepository
{
  return self->imageRepository;
}

- (void)setImageRepository:(id)a3
{
  self->imageRepository = (BCImageFetching *)a3;
}

- (BCSeriesStackDecomposing)seriesDecomposer
{
  return self->seriesDecomposer;
}

- (void)setSeriesDecomposer:(id)a3
{
  self->seriesDecomposer = (BCSeriesStackDecomposing *)a3;
}

- (NSMutableArray)renderOperations
{
  return self->_renderOperations;
}

- (void)setRenderOperations:(id)a3
{
  objc_storeStrong((id *)&self->_renderOperations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderOperations, 0);
}

@end
