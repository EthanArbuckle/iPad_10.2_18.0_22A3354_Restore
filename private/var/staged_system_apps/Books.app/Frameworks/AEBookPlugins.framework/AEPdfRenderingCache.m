@implementation AEPdfRenderingCache

+ (void)purgeCacheForIdentifier:(id)a3
{
  id v4;
  Class v5;
  id v6;

  v4 = a3;
  objc_opt_class(a1);
  v6 = objc_msgSend([v5 alloc], "initWithIdentifier:memorySize:", v4, 0);

  objc_msgSend(v6, "clear");
}

- (id)cachePrefix
{
  return CFSTR("AEPdfRenderingCache");
}

- (id)thumbnailForPage:(int64_t)a3 asset:(id)a4 size:(CGSize)a5 renderingCacheCallbackTarget:(id)a6 renderingCacheCallbackContext:(id)a7 priority:(int64_t)a8 containerBounds:(CGRect)a9
{
  double height;
  double width;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  AEPdfPageRenderingCacheOperation *v31;
  AEPdfPageRenderingCacheOperation *v32;
  AEPdfPageRenderingCacheOperation *v33;
  void *v34;
  id v36;
  void *v37;
  void *v38;

  height = a5.height;
  width = a5.width;
  v16 = a6;
  v17 = a7;
  if ((unint64_t)(a3 - 0x7FFFFFFFFFFFFFFFLL) >= 0x8000000000000002)
  {
    v18 = a4;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "assetID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "url"));

    if (v18)
    {
      v18 = 0;
      if (objc_msgSend(v19, "length"))
      {
        if (v20)
        {
          -[AEPdfRenderingCache scaleAdjustedImageSize:](self, "scaleAdjustedImageSize:", width, floor(height));
          v22 = v21;
          v24 = v23;
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[AEPdfRenderingCache keyPrefixForPage:](self, "keyPrefixForPage:", a3));
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[AEPdfRenderingCache keyForAssetID:prefix:size:](self, "keyForAssetID:prefix:size:", v19, v25, v22, v24));
          v18 = (id)objc_claimAutoreleasedReturnValue(-[AEPdfRenderingCache fetchImageForKey:](self, "fetchImageForKey:", v26));
          if (!v18)
          {
            -[AEPdfRenderingCache primaryImageSize](self, "primaryImageSize");
            -[AEPdfRenderingCache scaleAdjustedImageSize:](self, "scaleAdjustedImageSize:");
            v28 = v27;
            v30 = v29;
            v38 = v26;
            v36 = -[AEPdfRenderingCache selectorForTarget:](self, "selectorForTarget:", v16);
            v31 = (AEPdfPageRenderingCacheOperation *)objc_claimAutoreleasedReturnValue(-[AEPdfRenderingCache findRenderingCacheOperationWithStorageKey:target:selector:context:](self, "findRenderingCacheOperationWithStorageKey:target:selector:context:", v26, v16));
            v32 = v31;
            if (!v31 || -[AEPdfPageRenderingCacheOperation isCancelled](v31, "isCancelled"))
            {
              v37 = v25;
              v33 = objc_alloc_init(AEPdfPageRenderingCacheOperation);

              -[AEPdfPageRenderingCacheOperation setTarget:](v33, "setTarget:", v16);
              -[AEPdfPageRenderingCacheOperation setSelector:](v33, "setSelector:", v36);
              -[AEPdfPageRenderingCacheOperation setContext:](v33, "setContext:", v17);
              -[AEPdfPageRenderingCacheOperation setImageCache:](v33, "setImageCache:", self);
              -[AEPdfPageRenderingCacheOperation setDesiredSize:](v33, "setDesiredSize:", v22, v24);
              -[AEPdfPageRenderingCacheOperation setAssetID:](v33, "setAssetID:", v19);
              -[AEPdfPageRenderingCacheOperation setStorageKey:](v33, "setStorageKey:", v38);
              v34 = (void *)objc_claimAutoreleasedReturnValue(-[AEPdfRenderingCache keyForAssetID:prefix:size:](self, "keyForAssetID:prefix:size:", v19, v37, v28, v30));
              -[AEPdfPageRenderingCacheOperation setMasterImageKey:](v33, "setMasterImageKey:", v34);

              -[AEPdfPageRenderingCacheOperation setSerializeFormat:](v33, "setSerializeFormat:", -[AEPdfRenderingCache serializeFormat](self, "serializeFormat"));
              -[AEPdfPageRenderingCacheOperation setUrl:](v33, "setUrl:", v20);
              -[AEPdfPageRenderingCacheOperation setPageNumber:](v33, "setPageNumber:", a3);
              -[AEPdfPageRenderingCacheOperation setQueuePriority:](v33, "setQueuePriority:", a8);
              -[AEPdfRenderingCache enqueueRenderingCacheOperation:](self, "enqueueRenderingCacheOperation:", v33);
              v32 = v33;
              v25 = v37;
            }

            v26 = v38;
          }

        }
      }
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

@end
