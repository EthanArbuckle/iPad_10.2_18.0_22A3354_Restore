@implementation STSImageCache

+ (id)sharedCache
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__STSImageCache_sharedCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCache_onceToken != -1)
    dispatch_once(&sharedCache_onceToken, block);
  return (id)sharedCache_SharedCache;
}

void __28__STSImageCache_sharedCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedCache_SharedCache;
  sharedCache_SharedCache = (uint64_t)v0;

}

- (STSImageCache)init
{
  STSImageCache *v2;
  NSOperationQueue *v3;
  NSOperationQueue *operationQueue;
  uint64_t v5;
  NSMutableDictionary *downloadOperationInfos;
  uint64_t v7;
  NSMutableDictionary *cancelledDownloadOperationInfos;
  dispatch_queue_t v9;
  OS_dispatch_queue *queuedOperationsInfoQueue;
  uint64_t v11;
  NSURLCache *urlCache;
  uint64_t v13;
  NSMutableDictionary *staticImageCache;
  uint64_t v15;
  NSMutableDictionary *firstFrameImageCache;
  uint64_t v17;
  NSMutableDictionary *imageInfoCache;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)STSImageCache;
  v2 = -[STSImageCache init](&v20, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_operationQueue, "setMaxConcurrentOperationCount:", 4);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    downloadOperationInfos = v2->_downloadOperationInfos;
    v2->_downloadOperationInfos = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    cancelledDownloadOperationInfos = v2->_cancelledDownloadOperationInfos;
    v2->_cancelledDownloadOperationInfos = (NSMutableDictionary *)v7;

    v9 = dispatch_queue_create("com.apple.siri.parsec.SearchToShareApp.SearchToShareAppExtension.queuedOperationsInfo", 0);
    queuedOperationsInfoQueue = v2->_queuedOperationsInfoQueue;
    v2->_queuedOperationsInfoQueue = (OS_dispatch_queue *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1800]), "initWithMemoryCapacity:diskCapacity:diskPath:", 0, 314572800, CFSTR("STSImageCache.urlcache"));
    urlCache = v2->_urlCache;
    v2->_urlCache = (NSURLCache *)v11;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    staticImageCache = v2->_staticImageCache;
    v2->_staticImageCache = (NSMutableDictionary *)v13;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    firstFrameImageCache = v2->_firstFrameImageCache;
    v2->_firstFrameImageCache = (NSMutableDictionary *)v15;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    imageInfoCache = v2->_imageInfoCache;
    v2->_imageInfoCache = (NSMutableDictionary *)v17;

  }
  return v2;
}

- (id)fetchCachedStaticImageForURL:(id)a3
{
  return -[STSImageCache fetchCachedStaticImageForURL:hasMultipleFrames:](self, "fetchCachedStaticImageForURL:hasMultipleFrames:", a3, 0);
}

- (id)fetchCachedStaticImageForURL:(id)a3 hasMultipleFrames:(BOOL *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  BOOL v9;

  v6 = a3;
  if (v6)
  {
    -[NSMutableDictionary objectForKey:](self->_firstFrameImageCache, "objectForKey:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = 1;
      if (!a4)
        goto LABEL_9;
      goto LABEL_8;
    }
    -[NSMutableDictionary objectForKey:](self->_staticImageCache, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = 0;
  if (a4)
LABEL_8:
    *a4 = v9;
LABEL_9:

  return v8;
}

- (id)fetchCachedImageInfoForURL:(id)a3
{
  if (!a3)
    return 0;
  -[NSMutableDictionary objectForKey:](self->_imageInfoCache, "objectForKey:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)fetchImageWithURL:(id)a3 priority:(int64_t)a4 isSource:(BOOL)a5 begin:(id)a6 progress:(id)a7 completion:(id)a8
{
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v11 = a5;
  v14 = a3;
  v15 = a8;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __79__STSImageCache_fetchImageWithURL_priority_isSource_begin_progress_completion___block_invoke;
  v18[3] = &unk_24E7465E8;
  v18[4] = self;
  v19 = v14;
  v20 = v15;
  v16 = v15;
  v17 = v14;
  -[STSImageCache fetchImageDataWithURL:priority:isSource:begin:progress:completion:](self, "fetchImageDataWithURL:priority:isSource:begin:progress:completion:", v17, a4, v11, a6, a7, v18);

}

void __79__STSImageCache_fetchImageWithURL_priority_isSource_begin_progress_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  unint64_t v11;
  unint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  BOOL v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  BOOL v47;
  id v48;
  _QWORD v49[5];
  id v50;
  id v51;
  BOOL v52;
  _QWORD v53[5];
  id v54;
  id v55;
  _QWORD block[5];
  id v57;
  id v58;
  BOOL v59;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!(v11 | v12))
  {
    v18 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v13, "lowercaseString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "containsString:", CFSTR("gif")) & 1) == 0
    && (objc_msgSend(v16, "containsString:", CFSTR("jpeg")) & 1) == 0
    && !objc_msgSend(v16, "containsString:", CFSTR("png")))
  {
    objc_msgSend(v13, "lowercaseString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "containsString:", CFSTR("mp4"));

    if (v36)
    {
      if (v12)
      {
        if (objc_msgSend(*(id *)(a1 + 32), "_allowImageInfoCaching"))
        {
          v53[0] = MEMORY[0x24BDAC760];
          v53[1] = 3221225472;
          v53[2] = __79__STSImageCache_fetchImageWithURL_priority_isSource_begin_progress_completion___block_invoke_14;
          v53[3] = &unk_24E745DA8;
          v53[4] = *(_QWORD *)(a1 + 32);
          v54 = (id)v12;
          v55 = *(id *)(a1 + 40);
          dispatch_async(MEMORY[0x24BDAC9B8], v53);

        }
        else
        {
          objc_msgSend((id)v12, "frames");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "firstObject");
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          if (v45)
          {
            objc_msgSend((id)v12, "frames");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = (unint64_t)objc_msgSend(v46, "count") > 1;

            v49[0] = MEMORY[0x24BDAC760];
            v49[1] = 3221225472;
            v49[2] = __79__STSImageCache_fetchImageWithURL_priority_isSource_begin_progress_completion___block_invoke_2_15;
            v49[3] = &unk_24E7465C0;
            v52 = v47;
            v49[4] = *(_QWORD *)(a1 + 32);
            v50 = v45;
            v51 = *(id *)(a1 + 40);
            dispatch_async(MEMORY[0x24BDAC9B8], v49);

          }
        }
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      __79__STSImageCache_fetchImageWithURL_priority_isSource_begin_progress_completion___block_invoke_cold_2(a1, v37, v38, v39, v40, v41, v42, v43);
    }
    goto LABEL_18;
  }
  if ((objc_msgSend(v16, "containsString:", CFSTR("jpeg")) & 1) != 0
    || objc_msgSend(v16, "containsString:", CFSTR("png")))
  {
    objc_msgSend(MEMORY[0x24BEBD640], "imageWithData:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sts_nonAlphaImage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      goto LABEL_8;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BEBD640], "agif_animatedImageWithAnimatedGIFData:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
LABEL_16:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __79__STSImageCache_fetchImageWithURL_priority_isSource_begin_progress_completion___block_invoke_cold_1(a1, v27, v28, v29, v30, v31, v32, v33);
LABEL_18:
    v18 = 0;
    goto LABEL_19;
  }
LABEL_8:
  v48 = v14;
  v19 = a1;
  objc_msgSend(v18, "images");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  v22 = v21 > 1;
  if (v21 > 1)
  {
    objc_msgSend(v18, "images");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstObject");
    v24 = (id)objc_claimAutoreleasedReturnValue();

    a1 = v19;
    if (!v24)
      goto LABEL_14;
  }
  else
  {
    v24 = v18;
    a1 = v19;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__STSImageCache_fetchImageWithURL_priority_isSource_begin_progress_completion___block_invoke_2;
  block[3] = &unk_24E7465C0;
  v59 = v22;
  v25 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v57 = v24;
  v58 = v25;
  v26 = v24;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

LABEL_14:
  v14 = v48;
LABEL_19:

LABEL_20:
  v34 = *(_QWORD *)(a1 + 48);
  if (v34)
    (*(void (**)(uint64_t, void *, unint64_t, id, id, id))(v34 + 16))(v34, v18, v12, v13, v14, v15);

}

uint64_t __79__STSImageCache_fetchImageWithURL_priority_isSource_begin_progress_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  v1 = 40;
  if (!*(_BYTE *)(a1 + 56))
    v1 = 32;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v1), "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __79__STSImageCache_fetchImageWithURL_priority_isSource_begin_progress_completion___block_invoke_14(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 48), "setObject:forKey:", a1[5], a1[6]);
}

uint64_t __79__STSImageCache_fetchImageWithURL_priority_isSource_begin_progress_completion___block_invoke_2_15(uint64_t a1)
{
  uint64_t v1;

  v1 = 40;
  if (!*(_BYTE *)(a1 + 56))
    v1 = 32;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v1), "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)fetchImageDataWithURL:(id)a3 priority:(int64_t)a4 isSource:(BOOL)a5 begin:(id)a6 progress:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  STSImageCache *v20;
  id v21;
  id v22;
  id v23;
  int64_t v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v13;
      _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Fetch image data for %@", buf, 0xCu);
    }
    dispatch_get_global_queue(25, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke;
    v18[3] = &unk_24E7467C0;
    v19 = v13;
    v20 = self;
    v21 = v16;
    v24 = a4;
    v22 = v14;
    v23 = v15;
    dispatch_async(v17, v18);

  }
}

void __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  void *v12;
  id v13;
  STSImageDownloadOperation *v14;
  id *v15;
  void *v16;
  void *v17;
  void *v18;
  STSImageDownloadOperation *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  NSObject *v24;
  STSImageDownloadOperation *v25;
  id v26;
  int8x16_t v27;
  int8x16_t v28;
  int8x16_t v29;
  int8x16_t v30;
  _QWORD v31[4];
  STSImageDownloadOperation *v32;
  int8x16_t v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  int8x16_t v38;
  id v39;
  _QWORD v40[4];
  int8x16_t v41;
  _QWORD v42[4];
  int8x16_t v43;
  id v44;
  _QWORD block[5];
  id v46;
  id v47;
  id v48;
  id v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  _QWORD v57[3];

  v57[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1840], "requestWithURL:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v52 = 0;
    v53 = &v52;
    v54 = 0x2020000000;
    v55 = 0;
    v4 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v5 = *(NSObject **)(v3 + 72);
    block[2] = __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_2;
    block[3] = &unk_24E746610;
    v6 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[4] = v3;
    v46 = v4;
    v7 = *(_QWORD *)(a1 + 72);
    v50 = &v52;
    v51 = v7;
    v47 = *(id *)(a1 + 56);
    v48 = *(id *)(a1 + 64);
    v49 = *(id *)(a1 + 48);
    dispatch_sync(v5, block);
    if (!*((_BYTE *)v53 + 24))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "cachedResponseForRequest:", v2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "response");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (v10 = v9, v11 = objc_msgSend(v10, "statusCode") == 200, v10, v11))
      {
        v12 = (void *)MEMORY[0x24BDD1478];
        v42[0] = v6;
        v42[1] = 3221225472;
        v42[2] = __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_3;
        v42[3] = &unk_24E745DA8;
        v27 = *(int8x16_t *)(a1 + 32);
        v13 = (id)v27.i64[0];
        v43 = vextq_s8(v27, v27, 8uLL);
        v44 = v8;
        objc_msgSend(v12, "blockOperationWithBlock:", v42);
        v14 = (STSImageDownloadOperation *)objc_claimAutoreleasedReturnValue();

        v15 = (id *)&v43.i64[1];
      }
      else
      {
        v19 = [STSImageDownloadOperation alloc];
        objc_msgSend(*(id *)(a1 + 40), "_imageSession");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *(_QWORD *)(a1 + 56);
        v40[0] = v6;
        v40[1] = 3221225472;
        v40[2] = __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_2_30;
        v40[3] = &unk_24E7466D0;
        v28 = *(int8x16_t *)(a1 + 32);
        v22 = (id)v28.i64[0];
        v41 = vextq_s8(v28, v28, 8uLL);
        v37[0] = v6;
        v37[1] = 3221225472;
        v37[2] = __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_5;
        v37[3] = &unk_24E746770;
        v29 = *(int8x16_t *)(a1 + 32);
        v23 = (id)v29.i64[0];
        v38 = vextq_s8(v29, v29, 8uLL);
        v39 = v2;
        v14 = -[STSImageDownloadOperation initWithRequest:session:begin:progress:completion:](v19, "initWithRequest:session:begin:progress:completion:", v39, v20, v21, v40, v37);

        v15 = (id *)&v41.i64[1];
      }

      v24 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 72);
      v31[0] = v6;
      v31[1] = 3221225472;
      v31[2] = __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_2_52;
      v31[3] = &unk_24E746798;
      v25 = v14;
      v32 = v25;
      v34 = *(id *)(a1 + 56);
      v35 = *(id *)(a1 + 64);
      v36 = *(id *)(a1 + 48);
      v30 = *(int8x16_t *)(a1 + 32);
      v26 = (id)v30.i64[0];
      v33 = vextq_s8(v30, v30, 8uLL);
      dispatch_sync(v24, v31);
      -[STSImageDownloadOperation setQueuePriority:](v25, "setQueuePriority:", *(_QWORD *)(a1 + 72));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "addOperation:", v25);

    }
    _Block_object_dispose(&v52, 8);
  }
  else if (*(_QWORD *)(a1 + 48))
  {
    v56 = *MEMORY[0x24BDD0FC8];
    STSLocalizedString(CFSTR("ERROR_DESC_INVALID_REQUEST"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("STSErrorDomain"), 3, v17);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1[4] + 56), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v6 = v2;
    objc_msgSend(v2, "operation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isFinished");

    v2 = v6;
    if ((v4 & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 1;
      objc_msgSend(v6, "operation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setQueuePriority:", a1[10]);

      if (a1[6])
        objc_msgSend(v6, "addBegin:");
      if (a1[7])
        objc_msgSend(v6, "addProgress:");
      v2 = v6;
      if (a1[8])
      {
        objc_msgSend(v6, "addCompletion:");
        v2 = v6;
      }
    }
  }

}

void __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  v29 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 72);
  block[2] = __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_24;
  block[3] = &unk_24E746638;
  v5 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[4] = v2;
  v22 = v3;
  v23 = &v24;
  dispatch_sync(v4, block);
  objc_msgSend(*(id *)(a1 + 48), "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "response");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allHeaderFields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("Content-Type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v10, "containsString:", CFSTR("mp4"));

  if ((_DWORD)v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v31 = v11;
      _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Cache Hit for URL: %@", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "_imageInfoWithData:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  v13 = (void *)v25[5];
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_27;
  v17[3] = &unk_24E746660;
  v14 = v6;
  v18 = v14;
  v15 = v12;
  v19 = v15;
  v16 = v9;
  v20 = v16;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v17);

  _Block_object_dispose(&v24, 8);
}

void __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_24(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 56), "objectForKeyedSubscript:", a1[5]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "completionBlocks");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1[4] + 56), "setObject:forKeyedSubscript:", 0, a1[5]);
}

uint64_t __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_27(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a2 + 16))(a2, a1[4], a1[5], a1[6], 0, 0);
}

void __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_2_30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(v5 + 72);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_3_31;
  v8[3] = &unk_24E7466A8;
  v8[4] = v5;
  v9 = v6;
  v10 = a2;
  v11 = a3;
  dispatch_sync(v7, v8);

}

void __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_3_31(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  __int128 v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "progressBlocks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_4;
  v4[3] = &__block_descriptor_48_e23_v32__0___v__qq_8Q16_B24l;
  v5 = *(_OWORD *)(a1 + 48);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);

}

uint64_t __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  double Current;
  void *v32;
  double v33;
  NSObject *v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  _QWORD v68[4];
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  _QWORD v76[4];
  id v77;
  _QWORD block[4];
  id v79;
  uint64_t v80;
  id v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  uint64_t v89;
  void *v90;
  uint8_t buf[4];
  void *v92;
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v67 = a4;
  v11 = a5;
  v83 = 0;
  v84 = &v83;
  v85 = 0x3032000000;
  v86 = __Block_byref_object_copy__2;
  v87 = __Block_byref_object_dispose__2;
  v88 = 0;
  v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
  v13 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_6;
  block[3] = &unk_24E7466F8;
  v14 = v11;
  v15 = *(_QWORD *)(a1 + 32);
  v79 = v14;
  v80 = v15;
  v81 = *(id *)(a1 + 40);
  v82 = &v83;
  dispatch_sync(v12, block);
  v16 = v9;
  v17 = v16;
  if (v10 && objc_msgSend(v16, "statusCode") == 200)
  {
    objc_msgSend(v17, "allHeaderFields");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", CFSTR("Content-Type"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v10);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1498]), "initWithResponse:data:", v17, v64);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "storeCachedResponse:forRequest:", v63, *(_QWORD *)(a1 + 48));
    objc_msgSend(v65, "lowercaseString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "containsString:", CFSTR("mp4"));

    if (v20)
    {
      NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "firstObject");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_alloc(MEMORY[0x24BDD17C8]);
      v22 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "UUIDString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("%@.mp4"), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "stringByAppendingPathComponent:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = (void *)objc_msgSend(v21, "initWithString:", v26);

      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "write file", buf, 2u);
      }
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v66);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v14;
      objc_msgSend(v27, "moveItemAtURL:toURL:error:", v10, v28, &v75);
      v29 = v75;

      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "finished writing file", buf, 2u);
      }
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v66);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "start MP4Processing", buf, 2u);
      }
      Current = CFAbsoluteTimeGetCurrent();
      objc_msgSend(*(id *)(a1 + 32), "_imageInfoUsingAVAssetReaderWithFileURL:", v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = CFAbsoluteTimeGetCurrent();
      v34 = MEMORY[0x24BDACB70];
      v35 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v33 - Current);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v92 = v36;
        _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "elapsedTimeMP4Processing %@", buf, 0xCu);

      }
      if (!v32 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_5_cold_1(a1 + 40, v37, v38, v39, v40, v41, v42, v43);
      objc_msgSend(v27, "removeItemAtPath:error:", v66, 0);

      v44 = 0;
    }
    else
    {
      NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "firstObject");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_alloc(MEMORY[0x24BDD17C8]);
      v49 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "UUIDString");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "stringWithFormat:", CFSTR("%@"), v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "stringByAppendingPathComponent:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = (void *)objc_msgSend(v48, "initWithString:", v53);

      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v66);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v14;
      LODWORD(v50) = objc_msgSend(v27, "moveItemAtURL:toURL:error:", v10, v54, &v74);
      v29 = v74;

      if ((_DWORD)v50)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v66);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v44, "length"))
        {
          v89 = *MEMORY[0x24BDD0FC8];
          STSLocalizedString(CFSTR("ERROR_DESC_IMAGE_DATA_UNAVAILABLE"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = v55;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          v57 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("STSErrorDomain"), 5, v56);
          v29 = (id)v57;
        }
      }
      else
      {
        v44 = 0;
      }
      objc_msgSend(v27, "removeItemAtPath:error:", v66, 0);
      v32 = 0;
    }

    v58 = (void *)v84[5];
    v68[0] = MEMORY[0x24BDAC760];
    v68[1] = 3221225472;
    v68[2] = __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_50;
    v68[3] = &unk_24E746748;
    v47 = v44;
    v69 = v47;
    v59 = v32;
    v70 = v59;
    v60 = v65;
    v71 = v60;
    v72 = v67;
    v46 = v29;
    v73 = v46;
    objc_msgSend(v58, "enumerateObjectsUsingBlock:", v68);

  }
  else
  {
    v45 = (void *)v84[5];
    v76[0] = v13;
    v76[1] = 3221225472;
    v76[2] = __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_7;
    v76[3] = &unk_24E746720;
    v46 = v14;
    v77 = v46;
    objc_msgSend(v45, "enumerateObjectsUsingBlock:", v76);
    v47 = v77;
  }

  _Block_object_dispose(&v83, 8);
}

void __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_6(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)a1[4];
  if (v2 && objc_msgSend(v2, "code") == -999)
    v3 = 64;
  else
    v3 = 56;
  objc_msgSend(*(id *)(a1[5] + v3), "objectForKeyedSubscript:", a1[6]);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[5] + v3), "setObject:forKeyedSubscript:", 0, a1[6]);
  objc_msgSend(v7, "completionBlocks");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[7] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  if (!v4)
  {
    v9 = *MEMORY[0x24BDD0FC8];
    STSLocalizedString(CFSTR("ERROR_DESC_COULD_NOT_DOWNLOAD"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("STSErrorDomain"), 4, v6);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Download error. %@", (uint8_t *)&v7, 0xCu);
  }
  (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, id))v3 + 2))(v3, 0, 0, 0, 0, v4);

}

uint64_t __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_50(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a2 + 16))(a2, a1[4], a1[5], a1[6], a1[7], a1[8]);
}

void __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_2_52(_QWORD *a1)
{
  STSDownloadOperationInfo *v2;

  v2 = -[STSDownloadOperationInfo initWithOperation:begin:progress:completion:]([STSDownloadOperationInfo alloc], "initWithOperation:begin:progress:completion:", a1[4], a1[7], a1[8], a1[9]);
  objc_msgSend(*(id *)(a1[5] + 56), "setObject:forKeyedSubscript:", v2, a1[6]);

}

- (void)setPriority:(int64_t)a3 forQueuedDownloadWithURL:(id)a4
{
  id v6;
  void *v7;
  NSObject *queuedOperationsInfoQueue;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    queuedOperationsInfoQueue = self->_queuedOperationsInfoQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__STSImageCache_setPriority_forQueuedDownloadWithURL___block_invoke;
    block[3] = &unk_24E745E48;
    block[4] = self;
    v10 = v6;
    v11 = a3;
    dispatch_async(queuedOperationsInfoQueue, block);

  }
}

void __54__STSImageCache_setPriority_forQueuedDownloadWithURL___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1[4] + 56), "objectForKeyedSubscript:", a1[5]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "operation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setQueuePriority:", a1[6]);

}

- (void)cancelQueuedDownloadForURL:(id)a3
{
  id v4;
  void *v5;
  NSObject *queuedOperationsInfoQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queuedOperationsInfoQueue = self->_queuedOperationsInfoQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __44__STSImageCache_cancelQueuedDownloadForURL___block_invoke;
    v7[3] = &unk_24E745D30;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queuedOperationsInfoQueue, v7);

  }
}

void __44__STSImageCache_cancelQueuedDownloadForURL___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "operation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (void)cancelAllDownloads
{
  NSObject *queuedOperationsInfoQueue;
  _QWORD block[5];

  queuedOperationsInfoQueue = self->_queuedOperationsInfoQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__STSImageCache_cancelAllDownloads__block_invoke;
  block[3] = &unk_24E7457A8;
  block[4] = self;
  dispatch_sync(queuedOperationsInfoQueue, block);
  -[NSOperationQueue cancelAllOperations](self->_operationQueue, "cancelAllOperations");
}

uint64_t __35__STSImageCache_cancelAllDownloads__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __35__STSImageCache_cancelAllDownloads__block_invoke_2;
  v5[3] = &unk_24E7467E8;
  v5[4] = v2;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeAllObjects");
}

uint64_t __35__STSImageCache_cancelAllDownloads__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKey:", a3, a2);
}

- (void)clearInMemoryCache
{
  -[NSMutableDictionary removeAllObjects](self->_firstFrameImageCache, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_staticImageCache, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_imageInfoCache, "removeAllObjects");
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queuedOperationsInfoQueue;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD block[4];
  id v17;
  STSImageCache *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__2;
    v24 = __Block_byref_object_dispose__2;
    v25 = 0;
    queuedOperationsInfoQueue = self->_queuedOperationsInfoQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__STSImageCache_URLSession_task_didCompleteWithError___block_invoke;
    block[3] = &unk_24E746638;
    v12 = v9;
    v17 = v12;
    v18 = self;
    v19 = &v20;
    dispatch_sync(queuedOperationsInfoQueue, block);
    v13 = (void *)v21[5];
    objc_msgSend(v12, "response");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_timingData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "completedWithResponse:location:timingData:error:", v14, 0, v15, v10);

    _Block_object_dispose(&v20, 8);
  }

}

void __54__STSImageCache_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "originalRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "objectForKeyedSubscript:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "objectForKeyedSubscript:", v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "operation");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queuedOperationsInfoQueue;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD block[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  v24 = 0;
  queuedOperationsInfoQueue = self->_queuedOperationsInfoQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__STSImageCache_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke;
  block[3] = &unk_24E746638;
  block[4] = self;
  v12 = v9;
  v17 = v12;
  v18 = &v19;
  dispatch_sync(queuedOperationsInfoQueue, block);
  v13 = (void *)v20[5];
  objc_msgSend(v12, "response");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_timingData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "completedWithResponse:location:timingData:error:", v14, v10, v15, 0);

  _Block_object_dispose(&v19, 8);
}

void __67__STSImageCache_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(*(id *)(a1 + 40), "originalRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "operation");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  id v11;
  id v12;
  NSObject *queuedOperationsInfoQueue;
  id v14;
  _QWORD block[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v11 = a3;
  v12 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2;
  v22 = __Block_byref_object_dispose__2;
  v23 = 0;
  queuedOperationsInfoQueue = self->_queuedOperationsInfoQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __98__STSImageCache_URLSession_downloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite___block_invoke;
  block[3] = &unk_24E746638;
  block[4] = self;
  v14 = v12;
  v16 = v14;
  v17 = &v18;
  dispatch_sync(queuedOperationsInfoQueue, block);
  objc_msgSend((id)v19[5], "updateProgressWithTotalBytesWritten:totalBytesExpectedToWrite:", a6, a7);

  _Block_object_dispose(&v18, 8);
}

void __98__STSImageCache_URLSession_downloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(*(id *)(a1 + 40), "originalRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "operation");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)_imageSession
{
  NSURLSession *imageSession;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSURLSession *v11;
  NSURLSession *v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  imageSession = self->_imageSession;
  if (!imageSession)
  {
    objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDD17C8];
    v6 = (void *)MGCopyAnswer();
    v7 = (void *)MGCopyAnswer();
    v8 = (void *)MGCopyAnswer();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@; %@ %@"), CFSTR("Messages/1.0"), v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = CFSTR("User-Agent");
    v15[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHTTPAdditionalHeaders:", v10);

    objc_msgSend(v4, "setURLCache:", self->_urlCache);
    objc_msgSend(v4, "setHTTPCookieAcceptPolicy:", 1);
    objc_msgSend(v4, "setHTTPMaximumConnectionsPerHost:", 4);
    objc_msgSend(v4, "setTimeoutIntervalForResource:", 60.0);
    objc_msgSend(v4, "setTimeoutIntervalForRequest:", 15.0);
    objc_msgSend(v4, "set_connectionCacheCellPurgeTimeout:", 10.0);
    objc_msgSend(v4, "set_timingDataOptions:", 9);
    objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:delegate:delegateQueue:", v4, self, 0);
    v11 = (NSURLSession *)objc_claimAutoreleasedReturnValue();
    v12 = self->_imageSession;
    self->_imageSession = v11;

    imageSession = self->_imageSession;
  }
  return imageSession;
}

- (id)_imageInfoUsingAVAssetReaderWithFileURL:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  const void *v15;
  void *v16;
  uint64_t v17;
  STSAnimatedImageInfo *v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL8 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  int v47;
  int v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDB2378], "assetWithURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB23B8]), "initWithAsset:error:", v4, &v49);
  v6 = v49;
  if (v5)
  {
    objc_msgSend(v4, "tracksWithMediaType:", *MEMORY[0x24BDB1D50]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      v44 = v6;
      objc_msgSend(v7, "objectAtIndex:", 0);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend(v9, "setObject:forKey:", &unk_24E757620, *MEMORY[0x24BDC56B8]);
      v45 = v9;
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB23D0]), "initWithTrack:outputSettings:", v8, v9);
      objc_msgSend(v5, "addOutput:", v10);
      if ((objc_msgSend(v5, "startReading") & 1) == 0)
      {
        objc_msgSend(v5, "error");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v51 = v11;
          _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Calling AVAssetReader failed with error: %@", buf, 0xCu);
        }

      }
      v40 = v8;
      v42 = v7;
      v12 = (void *)objc_opt_new();
      if (objc_msgSend(v5, "status") == 1)
      {
        v13 = MEMORY[0x24BDACB70];
        do
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2217E8000, v13, OS_LOG_TYPE_DEFAULT, "AVAssetReaderStatusReading", buf, 2u);
          }
          v14 = objc_msgSend(v10, "copyNextSampleBuffer", v40, v42);
          if (!v14)
            break;
          v15 = (const void *)v14;
          -[STSImageCache _imageFromSampleBuffer:](self, "_imageFromSampleBuffer:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            objc_msgSend(v12, "addObject:", v16);
          CFRelease(v15);

        }
        while (objc_msgSend(v5, "status") == 1);
      }
      v17 = objc_msgSend(v5, "status", v40, v42);
      objc_msgSend(v5, "cancelReading");
      if (objc_msgSend(v12, "count"))
      {
        v18 = objc_alloc_init(STSAnimatedImageInfo);
        if (v4)
        {
          objc_msgSend(v4, "duration");
          v6 = v44;
          if (v48)
          {
            objc_msgSend(v4, "duration");
            v19 = (double)v47;
          }
          else
          {
            v19 = 600.0;
          }
          v35 = v41;
          v7 = v43;
          objc_msgSend(v4, "duration");
          v36 = (double)v46 / v19;
        }
        else
        {
          v36 = 0.0;
          v7 = v43;
          v6 = v44;
          v35 = v41;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v51 = v37;
          v52 = 2112;
          v53 = v38;
          _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "DLS duration %@ numFrames %@", buf, 0x16u);

        }
        -[STSAnimatedImageInfo setDuration:](v18, "setDuration:", v36);
        -[STSAnimatedImageInfo setFrames:](v18, "setFrames:", v12);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[STSImageCache _imageInfoUsingAVAssetReaderWithFileURL:].cold.3(v17);
        v18 = 0;
        v7 = v43;
        v6 = v44;
        v35 = v41;
      }

    }
    else
    {
      v27 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v27)
        -[STSImageCache _imageInfoUsingAVAssetReaderWithFileURL:].cold.2(v27, v28, v29, v30, v31, v32, v33, v34);
      v18 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[STSImageCache _imageInfoUsingAVAssetReaderWithFileURL:].cold.1((uint64_t)v6, v20, v21, v22, v23, v24, v25, v26);
    v18 = 0;
  }

  return v18;
}

- (id)_imageFromSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  __CVBuffer *ImageBuffer;
  void *BaseAddress;
  size_t BytesPerRow;
  size_t Width;
  size_t Height;
  CGColorSpace *DeviceRGB;
  CGContext *v9;
  CGImage *Image;
  void *v11;
  void *v12;
  void *v13;

  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  CVPixelBufferLockBaseAddress(ImageBuffer, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(ImageBuffer);
  BytesPerRow = CVPixelBufferGetBytesPerRow(ImageBuffer);
  Width = CVPixelBufferGetWidth(ImageBuffer);
  Height = CVPixelBufferGetHeight(ImageBuffer);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v9 = CGBitmapContextCreate(BaseAddress, Width, Height, 8uLL, BytesPerRow, DeviceRGB, 0x2006u);
  Image = CGBitmapContextCreateImage(v9);
  CVPixelBufferUnlockBaseAddress(ImageBuffer, 0);
  CGContextRelease(v9);
  CGColorSpaceRelease(DeviceRGB);
  v11 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scale");
  objc_msgSend(v11, "imageWithCGImage:scale:orientation:", Image, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  CGImageRelease(Image);
  return v13;
}

- (id)_imageInfoWithData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  double Current;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _BOOL8 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD1580];
  v5 = a3;
  objc_msgSend(v4, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BDD17C8]);
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@.mp4"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v9, "initWithString:", v14);

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v15;
    _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "video file %@", buf, 0xCu);
  }
  v16 = objc_msgSend(v5, "writeToFile:atomically:", v15, 1);

  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "start MP4Processing", buf, 2u);
    }
    Current = CFAbsoluteTimeGetCurrent();
    -[STSImageCache _imageInfoUsingAVAssetReaderWithFileURL:](self, "_imageInfoUsingAVAssetReaderWithFileURL:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (!v19
      || (objc_msgSend(v19, "frames"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v22 = objc_msgSend(v21, "count"),
          v21,
          !v22))
    {
      v23 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v23)
        -[STSImageCache _imageInfoWithData:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);
    }
    v31 = CFAbsoluteTimeGetCurrent();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v31 - Current);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v42 = v32;
      _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "end MP4Processing (duration %@)", buf, 0xCu);

    }
    objc_msgSend(v6, "removeItemAtPath:error:", v15, 0);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[STSImageCache _imageInfoWithData:].cold.2((uint64_t)v15, v33, v34, v35, v36, v37, v38, v39);
    v20 = 0;
  }

  return v20;
}

- (BOOL)_allowImageInfoCaching
{
  return 0;
}

- (UIImage)searchProviderImage
{
  return self->_searchProviderImage;
}

- (void)setSearchProviderImage:(id)a3
{
  objc_storeStrong((id *)&self->_searchProviderImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchProviderImage, 0);
  objc_storeStrong((id *)&self->_queuedOperationsInfoQueue, 0);
  objc_storeStrong((id *)&self->_cancelledDownloadOperationInfos, 0);
  objc_storeStrong((id *)&self->_downloadOperationInfos, 0);
  objc_storeStrong((id *)&self->_imageInfoCache, 0);
  objc_storeStrong((id *)&self->_firstFrameImageCache, 0);
  objc_storeStrong((id *)&self->_staticImageCache, 0);
  objc_storeStrong((id *)&self->_urlCache, 0);
  objc_storeStrong((id *)&self->_imageSession, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

void __79__STSImageCache_fetchImageWithURL_priority_isSource_begin_progress_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2217E8000, MEMORY[0x24BDACB70], a3, "Failed to create animated image for URL: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __79__STSImageCache_fetchImageWithURL_priority_isSource_begin_progress_completion___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2217E8000, MEMORY[0x24BDACB70], a3, "Unsupport content-type returned: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __83__STSImageCache_fetchImageDataWithURL_priority_isSource_begin_progress_completion___block_invoke_5_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2217E8000, MEMORY[0x24BDACB70], a3, "Failed to create image info for URL: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_imageInfoUsingAVAssetReaderWithFileURL:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2217E8000, MEMORY[0x24BDACB70], a3, "Failed to create AVAssetReader: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_imageInfoUsingAVAssetReaderWithFileURL:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_2217E8000, MEMORY[0x24BDACB70], a3, "No valid tracks for video asset", a5, a6, a7, a8, 0);
}

- (void)_imageInfoUsingAVAssetReaderWithFileURL:(uint64_t)a1 .cold.3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_2217E8000, MEMORY[0x24BDACB70], v2, "Could not create frames for video asset, final reader status: %@", v3, v4, v5, v6, 2u);

}

- (void)_imageInfoWithData:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_2217E8000, MEMORY[0x24BDACB70], a3, "Failed to create image info for data", a5, a6, a7, a8, 0);
}

- (void)_imageInfoWithData:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2217E8000, MEMORY[0x24BDACB70], a3, "Failed to write temp mp4 file to: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
