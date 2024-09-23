@implementation PKServicePaymentTransactionImageGenerator

- (PKServicePaymentTransactionImageGenerator)initWithPassKitServicesXPCService:(id)a3
{
  id v5;
  PKServicePaymentTransactionImageGenerator *v6;
  PKServicePaymentTransactionImageGenerator *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *mappedFilesIndices;
  NSMutableDictionary *v10;
  NSMutableDictionary *keysHitCounts;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKServicePaymentTransactionImageGenerator;
  v6 = -[PKServicePaymentTransactionImageGenerator init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_xpcService, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mappedFilesIndices = v7->_mappedFilesIndices;
    v7->_mappedFilesIndices = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    keysHitCounts = v7->_keysHitCounts;
    v7->_keysHitCounts = v10;

  }
  return v7;
}

- (PKServicePaymentTransactionImageGenerator)init
{

  return 0;
}

- (void)dealloc
{
  NSMutableDictionary *mappedFilesIndices;
  objc_super v4;
  _QWORD v5[5];

  mappedFilesIndices = self->_mappedFilesIndices;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__PKServicePaymentTransactionImageGenerator_dealloc__block_invoke;
  v5[3] = &unk_24DBBFF50;
  v5[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mappedFilesIndices, "enumerateKeysAndObjectsUsingBlock:", v5);
  v4.receiver = self;
  v4.super_class = (Class)PKServicePaymentTransactionImageGenerator;
  -[PKServicePaymentTransactionImageGenerator dealloc](&v4, sel_dealloc);
}

uint64_t __52__PKServicePaymentTransactionImageGenerator_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "unsignedIntegerValue");
  if (result != 0x7FFFFFFFFFFFFFFFLL)
    return objc_msgSend(*(id *)(a1 + 32), "_cleanMappedFile:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16 * result + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16 * result + 40));
  return result;
}

- (id)cachedImageDataForKey:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  _BOOL4 v14;
  void *v15;
  NSMutableDictionary *keysHitCounts;
  void *v17;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_mappedFilesIndices, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "unsignedIntegerValue");
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = 0;
    }
    else
    {
      v10 = (char *)self + 16 * v8;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", *((_QWORD *)v10 + 4), *((_QWORD *)v10 + 5));
      v11 = self->_nextKeyToEvict;
      v12 = (NSString *)v4;
      v13 = v12;
      if (v11 == v12)
      {

      }
      else
      {
        if (!v12 || !v11)
        {

          goto LABEL_13;
        }
        v14 = -[NSString isEqualToString:](v11, "isEqualToString:", v12);

        if (!v14)
          goto LABEL_13;
      }
      -[PKServicePaymentTransactionImageGenerator _updateNextKeyToEvict](self, "_updateNextKeyToEvict");
    }
LABEL_13:
    -[NSMutableDictionary objectForKey:](self->_keysHitCounts, "objectForKey:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    keysHitCounts = self->_keysHitCounts;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v15, "unsignedIntegerValue") + 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](keysHitCounts, "setObject:forKey:", v17, v4);

    goto LABEL_14;
  }
  v9 = 0;
LABEL_14:
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (void)setCachedImageData:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  size_t v9;
  os_unfair_lock_s *p_lock;
  void *v11;
  void *v12;
  id v13;
  const char *v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  unint64_t v19;
  char *v20;
  void *v21;
  NSMutableDictionary *mappedFilesIndices;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "length");
  if (v6)
  {
    v9 = v8;
    if (v8)
    {
      p_lock = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      PKTemporaryItemURLWithExtension();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URLByStandardizingPath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!self->_hasSetupTempDir)
      {
        PKTemporaryItemPrepareDirectory();
        self->_hasSetupTempDir = 1;
      }
      objc_msgSend(v6, "writeToURL:atomically:", v12, 1);
      v13 = objc_retainAutorelease(v12);
      v14 = (const char *)objc_msgSend(v13, "fileSystemRepresentation");
      v15 = open(v14, 6, 384);
      if (v15 < 0)
      {
        PKLogFacilityTypeGetObject();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v7;
          _os_log_impl(&dword_219BFC000, v24, OS_LOG_TYPE_DEFAULT, "Failed to open file for %@", buf, 0xCu);
        }

      }
      else
      {
        v16 = v15;
        v17 = mmap(0, v9, 1, 2, v15, 0);
        if (v17 == (void *)-1)
        {
          PKLogFacilityTypeGetObject();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v27 = v7;
            _os_log_impl(&dword_219BFC000, v25, OS_LOG_TYPE_DEFAULT, "Failed to mmap %@", buf, 0xCu);
          }

        }
        else
        {
          v18 = v17;
          v19 = -[PKServicePaymentTransactionImageGenerator _nextIndexToUseAndEvictIfNeeded](self, "_nextIndexToUseAndEvictIfNeeded");
          v20 = (char *)self + 16 * v19;
          *((_QWORD *)v20 + 4) = v18;
          *((_QWORD *)v20 + 5) = v9;
          -[NSMutableDictionary objectForKey:](self->_keysHitCounts, "objectForKey:", v7);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v21)
            -[NSMutableDictionary setObject:forKey:](self->_keysHitCounts, "setObject:forKey:", &unk_24DBC05D8, v7);
          mappedFilesIndices = self->_mappedFilesIndices;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v19);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](mappedFilesIndices, "setObject:forKey:", v23, v7);

          if (!self->_nextKeyToEvict || self->_evictionHitCount)
          {
            self->_evictionHitCount = 0;
            objc_storeStrong((id *)&self->_nextKeyToEvict, a4);
          }

          p_lock = &self->_lock;
        }
        close(v16);
      }
      unlink(v14);
      os_unfair_lock_unlock(p_lock);

    }
  }

}

- (unint64_t)_nextIndexToUseAndEvictIfNeeded
{
  void *v3;
  unint64_t v4;
  void *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSString *nextKeyToEvict;
  int v12;
  NSString *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)-[NSMutableDictionary count](self->_mappedFilesIndices, "count") < 0x32)
    return -[NSMutableDictionary count](self->_mappedFilesIndices, "count");
  if (!self->_nextKeyToEvict)
    return 0;
  -[NSMutableDictionary objectForKey:](self->_mappedFilesIndices, "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  -[NSMutableDictionary objectForKey:](self->_keysHitCounts, "objectForKey:", self->_nextKeyToEvict);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (char *)self + 16 * v4;
  v7 = *((_QWORD *)v6 + 4);
  v8 = *((_QWORD *)v6 + 5);
  PKLogFacilityTypeGetObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    nextKeyToEvict = self->_nextKeyToEvict;
    v12 = 138412546;
    v13 = nextKeyToEvict;
    v14 = 2048;
    v15 = objc_msgSend(v5, "unsignedIntegerValue");
    _os_log_impl(&dword_219BFC000, v9, OS_LOG_TYPE_DEFAULT, "Evicting %@ from cache with hit count %lu", (uint8_t *)&v12, 0x16u);
  }

  -[PKServicePaymentTransactionImageGenerator _cleanMappedFile:](self, "_cleanMappedFile:", v7, v8);
  -[NSMutableDictionary setObject:forKey:](self->_mappedFilesIndices, "setObject:forKey:", &unk_24DBC05F0, self->_nextKeyToEvict);
  -[PKServicePaymentTransactionImageGenerator _updateNextKeyToEvict](self, "_updateNextKeyToEvict");

  return v4;
}

- (void)_updateNextKeyToEvict
{
  NSMutableDictionary *mappedFilesIndices;
  _QWORD v4[7];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  mappedFilesIndices = self->_mappedFilesIndices;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __66__PKServicePaymentTransactionImageGenerator__updateNextKeyToEvict__block_invoke;
  v4[3] = &unk_24DBBFF78;
  v4[4] = self;
  v4[5] = &v11;
  v4[6] = &v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mappedFilesIndices, "enumerateKeysAndObjectsUsingBlock:", v4);
  objc_storeStrong((id *)&self->_nextKeyToEvict, (id)v6[5]);
  self->_evictionHitCount = v12[3];
  _Block_object_dispose(&v5, 8);

  _Block_object_dispose(&v11, 8);
}

void __66__PKServicePaymentTransactionImageGenerator__updateNextKeyToEvict__block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  void *v8;
  unint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  if (objc_msgSend(a3, "unsignedIntegerValue") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    v10 = *(_QWORD *)(a1[5] + 8);
    if (v9 <= *(_QWORD *)(a1[4] + 840))
    {
      *(_QWORD *)(v10 + 24) = v9;
      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
      *a4 = 1;
    }
    else if (*(_QWORD *)(v10 + 24) - 1 >= v9)
    {
      *(_QWORD *)(v10 + 24) = v9;
      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    }
  }

}

- (void)_cleanMappedFile:(id)a3
{
  munmap(a3.var0, a3.var1);
}

- (void)imageDataForTransaction:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;
  _QWORD *v25;
  _QWORD *v26;
  CGFloat v27;
  CGFloat v28;
  _QWORD v29[4];
  id v30;
  id v31;
  PKServicePaymentTransactionImageGenerator *v32;
  _QWORD *v33;
  _QWORD *v34;
  CGFloat v35;
  CGFloat v36;
  _QWORD v37[4];
  id v38;
  PKServicePaymentTransactionImageGenerator *v39;
  _QWORD *v40;
  _QWORD *v41;
  CGFloat v42;
  CGFloat v43;
  _QWORD v44[5];
  id v45;
  _QWORD v46[5];
  id v47;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = a5;
  if (v10)
  {
    objc_msgSend(v9, "merchant");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logoImageURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x3032000000;
    v46[3] = __Block_byref_object_copy_;
    v46[4] = __Block_byref_object_dispose_;
    v47 = 0;
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x3032000000;
    v44[3] = __Block_byref_object_copy_;
    v44[4] = __Block_byref_object_dispose_;
    v45 = 0;
    v13 = objc_alloc_init(MEMORY[0x24BE6EA18]);
    v14 = MEMORY[0x24BDAC760];
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __85__PKServicePaymentTransactionImageGenerator_imageDataForTransaction_size_completion___block_invoke;
    v37[3] = &unk_24DBBFFF0;
    v15 = v12;
    v42 = width;
    v43 = height;
    v38 = v15;
    v39 = self;
    v40 = v44;
    v41 = v46;
    objc_msgSend(v13, "addOperation:", v37);
    v29[0] = v14;
    v29[1] = 3221225472;
    v29[2] = __85__PKServicePaymentTransactionImageGenerator_imageDataForTransaction_size_completion___block_invoke_4;
    v29[3] = &unk_24DBC0018;
    v16 = v9;
    v30 = v16;
    v33 = v44;
    v17 = v11;
    v35 = width;
    v36 = height;
    v34 = v46;
    v31 = v17;
    v32 = self;
    objc_msgSend(v13, "addOperation:", v29);
    v23[0] = v14;
    v23[1] = 3221225472;
    v23[2] = __85__PKServicePaymentTransactionImageGenerator_imageDataForTransaction_size_completion___block_invoke_5;
    v23[3] = &unk_24DBC0068;
    v23[4] = self;
    v27 = width;
    v28 = height;
    v24 = v16;
    v25 = v44;
    v26 = v46;
    objc_msgSend(v13, "addOperation:", v23);
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v14;
    v20[1] = 3221225472;
    v20[2] = __85__PKServicePaymentTransactionImageGenerator_imageDataForTransaction_size_completion___block_invoke_7;
    v20[3] = &unk_24DBC0090;
    v21 = v10;
    v22 = v46;
    v19 = (id)objc_msgSend(v13, "evaluateWithInput:completion:", v18, v20);

    _Block_object_dispose(v44, 8);
    _Block_object_dispose(v46, 8);

  }
}

void __85__PKServicePaymentTransactionImageGenerator_imageDataForTransaction_size_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void (**v7)(id, id, uint64_t);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  void (**v19)(_QWORD, _QWORD);
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  void (**v27)(_QWORD, _QWORD);
  void (**v28)(id, id, uint64_t);
  uint64_t v29;
  _QWORD v30[4];
  __int128 v31;
  __int128 v32;

  v6 = a3;
  v7 = a4;
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    objc_msgSend(v8, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f-%.2f"), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@-%@"), v9, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    objc_msgSend(*(id *)(a1 + 40), "cachedImageDataForKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = v15;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v15);
      v7[2](v7, v6, 1);
    }
    else
    {
      v17 = MEMORY[0x24BDAC760];
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __85__PKServicePaymentTransactionImageGenerator_imageDataForTransaction_size_completion___block_invoke_2;
      v30[3] = &unk_24DBBFFA0;
      v18 = *(_OWORD *)(a1 + 64);
      v31 = *(_OWORD *)(a1 + 40);
      v32 = v18;
      v19 = (void (**)(_QWORD, _QWORD))MEMORY[0x220731D60](v30);
      objc_msgSend(MEMORY[0x24BE6EBC8], "sharedImageAssetDownloader");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "cachedDataForURL:", *(_QWORD *)(a1 + 32));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        ((void (**)(_QWORD, void *))v19)[2](v19, v16);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v23 = *(void **)(v22 + 40);
        *(_QWORD *)(v22 + 40) = v21;

        v7[2](v7, v6, 1);
      }
      else
      {
        v24 = *(_QWORD *)(a1 + 32);
        v25[0] = v17;
        v25[1] = 3221225472;
        v25[2] = __85__PKServicePaymentTransactionImageGenerator_imageDataForTransaction_size_completion___block_invoke_3;
        v25[3] = &unk_24DBBFFC8;
        v29 = *(_QWORD *)(a1 + 56);
        v27 = v19;
        v28 = v7;
        v26 = v6;
        objc_msgSend(v20, "downloadFromUrl:completionHandler:", v24, v25);

      }
    }

  }
  else
  {
    v7[2](v7, v6, 0);
  }

}

id __85__PKServicePaymentTransactionImageGenerator_imageDataForTransaction_size_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  v4 = (void *)MEMORY[0x220731C64]();
  v5 = objc_alloc(MEMORY[0x24BE6EB60]);
  PKScreenScale();
  v6 = (void *)objc_msgSend(v5, "initWithData:scale:", v3);
  objc_msgSend(MEMORY[0x24BE6EB68], "constraintsWithMaxSize:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resizedImageWithConstraints:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "imageData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(*(id *)(a1 + 32), "setCachedImageData:forKey:", v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  objc_autoreleasePoolPop(v4);
  return v9;
}

uint64_t __85__PKServicePaymentTransactionImageGenerator_imageDataForTransaction_size_completion___block_invoke_3(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t (*v8)(void);

  if (!a2 || a4)
  {
    v8 = *(uint64_t (**)(void))(a1[6] + 16);
  }
  else
  {
    (*(void (**)(void))(a1[5] + 16))();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[7] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v8 = *(uint64_t (**)(void))(a1[6] + 16);
  }
  return v8();
}

void __85__PKServicePaymentTransactionImageGenerator_imageDataForTransaction_size_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void (**v6)(id, id);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = a4;
  v7 = objc_msgSend(MEMORY[0x24BE6ED90], "iconTypeForTransaction:ignoreLogoURL:", *(_QWORD *)(a1 + 32), 1);
  if (v7)
  {
    if (v7 == 1)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(*(id *)(a1 + 32), "transitType"));
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v7 != 2)
        goto LABEL_8;
      objc_msgSend(MEMORY[0x24BE6ED90], "staticIconNameForTransaction:", *(_QWORD *)(a1 + 32));
      v8 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

LABEL_8:
  v11 = (void *)MEMORY[0x24BDD17C8];
  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f-%.2f"), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@-%@"), v12, v13);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "cachedImageDataForKey:");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

  }
  v6[2](v6, v20);

}

void __85__PKServicePaymentTransactionImageGenerator_imageDataForTransaction_size_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  __int128 v18;

  v6 = a3;
  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(v8 + 8);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __85__PKServicePaymentTransactionImageGenerator_imageDataForTransaction_size_completion___block_invoke_6;
  v15[3] = &unk_24DBC0040;
  v18 = *(_OWORD *)(a1 + 48);
  v16 = v6;
  v17 = v7;
  v15[4] = v8;
  v11 = *(double *)(a1 + 64);
  v12 = *(double *)(a1 + 72);
  v13 = v6;
  v14 = v7;
  objc_msgSend(v10, "imageDataForTransaction:size:completion:", v9, v15, v11, v12);

}

void __85__PKServicePaymentTransactionImageGenerator_imageDataForTransaction_size_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  if (v3 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    objc_msgSend(*(id *)(a1 + 32), "setCachedImageData:forKey:", v3);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;
  v6 = v3;

  (*(void (**)(_QWORD, _QWORD, BOOL))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) != 0);
}

uint64_t __85__PKServicePaymentTransactionImageGenerator_imageDataForTransaction_size_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextKeyToEvict, 0);
  objc_storeStrong((id *)&self->_keysHitCounts, 0);
  objc_storeStrong((id *)&self->_mappedFilesIndices, 0);
  objc_storeStrong((id *)&self->_xpcService, 0);
}

@end
