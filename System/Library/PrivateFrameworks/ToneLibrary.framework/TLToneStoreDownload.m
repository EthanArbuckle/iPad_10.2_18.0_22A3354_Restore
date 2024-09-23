@implementation TLToneStoreDownload

- (TLToneStoreDownload)init
{
  TLToneStoreDownload *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *accessQueueLabel;
  dispatch_queue_t v12;
  OS_dispatch_queue *accessQueue;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *identifier;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)TLToneStoreDownload;
  v2 = -[TLToneStoreDownload init](&v19, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@-%@-%@"), v6, v7, CFSTR("AccessQueue"), v9);
    v10 = objc_claimAutoreleasedReturnValue();
    accessQueueLabel = v2->_accessQueueLabel;
    v2->_accessQueueLabel = (NSString *)v10;

    v12 = dispatch_queue_create(-[NSString UTF8String](v2->_accessQueueLabel, "UTF8String"), 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v12;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("toneStoreDownload:"), "stringByAppendingString:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v16;

  }
  return v2;
}

- (void)dealloc
{
  OS_dispatch_queue *accessQueue;
  NSObject *v4;
  objc_super v5;

  accessQueue = self->_accessQueue;
  self->_accessQueue = 0;
  v4 = accessQueue;

  dispatch_sync(v4, &__block_literal_global_5);
  v5.receiver = self;
  v5.super_class = (Class)TLToneStoreDownload;
  -[TLToneStoreDownload dealloc](&v5, sel_dealloc);
}

- (NSString)name
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__TLToneStoreDownload_name__block_invoke;
  v5[3] = &unk_1E952A6F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __27__TLToneStoreDownload_name__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)_setName:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__TLToneStoreDownload__setName___block_invoke;
  block[3] = &unk_1E952A6A8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

void __32__TLToneStoreDownload__setName___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  BOOL v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v2 = *(void **)(a1 + 40);
  v10 = (unint64_t)*(id *)(*(_QWORD *)(a1 + 32) + 24);
  v3 = v2;
  v4 = (void *)v3;
  if (!(v10 | v3))
    goto LABEL_11;
  if (v10)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (v5)
  {

LABEL_12:
    v8 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v9 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v9 + 24);
    *(_QWORD *)(v9 + 24) = v8;
    goto LABEL_13;
  }
  if (v10 == v3)
  {
LABEL_11:

    v7 = (void *)v10;
LABEL_13:

    return;
  }
  v6 = objc_msgSend((id)v10, "isEqualToString:", v3);

  if ((v6 & 1) == 0)
    goto LABEL_12;
}

- (NSString)albumTitle
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__TLToneStoreDownload_albumTitle__block_invoke;
  v5[3] = &unk_1E952A6F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __33__TLToneStoreDownload_albumTitle__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (void)_setAlbumTitle:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__TLToneStoreDownload__setAlbumTitle___block_invoke;
  block[3] = &unk_1E952A6A8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

void __38__TLToneStoreDownload__setAlbumTitle___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  BOOL v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v2 = *(void **)(a1 + 40);
  v10 = (unint64_t)*(id *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = v2;
  v4 = (void *)v3;
  if (!(v10 | v3))
    goto LABEL_11;
  if (v10)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (v5)
  {

LABEL_12:
    v8 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v9 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v9 + 32);
    *(_QWORD *)(v9 + 32) = v8;
    goto LABEL_13;
  }
  if (v10 == v3)
  {
LABEL_11:

    v7 = (void *)v10;
LABEL_13:

    return;
  }
  v6 = objc_msgSend((id)v10, "isEqualToString:", v3);

  if ((v6 & 1) == 0)
    goto LABEL_12;
}

- (NSString)artistName
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__TLToneStoreDownload_artistName__block_invoke;
  v5[3] = &unk_1E952A6F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __33__TLToneStoreDownload_artistName__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

- (void)_setArtistName:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__TLToneStoreDownload__setArtistName___block_invoke;
  block[3] = &unk_1E952A6A8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

void __38__TLToneStoreDownload__setArtistName___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  BOOL v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v2 = *(void **)(a1 + 40);
  v10 = (unint64_t)*(id *)(*(_QWORD *)(a1 + 32) + 40);
  v3 = v2;
  v4 = (void *)v3;
  if (!(v10 | v3))
    goto LABEL_11;
  if (v10)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (v5)
  {

LABEL_12:
    v8 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v9 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;
    goto LABEL_13;
  }
  if (v10 == v3)
  {
LABEL_11:

    v7 = (void *)v10;
LABEL_13:

    return;
  }
  v6 = objc_msgSend((id)v10, "isEqualToString:", v3);

  if ((v6 & 1) == 0)
    goto LABEL_12;
}

- (double)duration
{
  NSObject *accessQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__TLToneStoreDownload_duration__block_invoke;
  v5[3] = &unk_1E952A6F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __31__TLToneStoreDownload_duration__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 48);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_setDuration:(double)a3
{
  NSObject *accessQueue;
  _QWORD v4[6];

  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__TLToneStoreDownload__setDuration___block_invoke;
  v4[3] = &unk_1E952AAA0;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_sync(accessQueue, v4);
}

uint64_t __36__TLToneStoreDownload__setDuration___block_invoke(uint64_t result)
{
  uint64_t v1;
  double v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(double *)(result + 40);
  if (llround(*(double *)(v1 + 48) * 8388608.0) != llround(v2 * 8388608.0))
    *(double *)(v1 + 48) = v2;
  return result;
}

- (NSString)genreName
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__TLToneStoreDownload_genreName__block_invoke;
  v5[3] = &unk_1E952A6F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __32__TLToneStoreDownload_genreName__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

- (void)_setGenreName:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__TLToneStoreDownload__setGenreName___block_invoke;
  block[3] = &unk_1E952A6A8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

void __37__TLToneStoreDownload__setGenreName___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  BOOL v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v2 = *(void **)(a1 + 40);
  v10 = (unint64_t)*(id *)(*(_QWORD *)(a1 + 32) + 56);
  v3 = v2;
  v4 = (void *)v3;
  if (!(v10 | v3))
    goto LABEL_11;
  if (v10)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (v5)
  {

LABEL_12:
    v8 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v9 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v9 + 56);
    *(_QWORD *)(v9 + 56) = v8;
    goto LABEL_13;
  }
  if (v10 == v3)
  {
LABEL_11:

    v7 = (void *)v10;
LABEL_13:

    return;
  }
  v6 = objc_msgSend((id)v10, "isEqualToString:", v3);

  if ((v6 & 1) == 0)
    goto LABEL_12;
}

- (BOOL)isRingtone
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__TLToneStoreDownload_isRingtone__block_invoke;
  v5[3] = &unk_1E952A6F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__TLToneStoreDownload_isRingtone__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 64);
  return result;
}

- (void)_setRingtone:(BOOL)a3
{
  NSObject *accessQueue;
  _QWORD v4[5];
  BOOL v5;

  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__TLToneStoreDownload__setRingtone___block_invoke;
  v4[3] = &unk_1E952AAE8;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(accessQueue, v4);
}

uint64_t __36__TLToneStoreDownload__setRingtone___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if ((*(_BYTE *)(v1 + 64) == 0) == (*(_BYTE *)(result + 40) != 0))
    *(_BYTE *)(v1 + 64) = *(_BYTE *)(result + 40);
  return result;
}

- (unint64_t)storeItemIdentifier
{
  NSObject *accessQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__TLToneStoreDownload_storeItemIdentifier__block_invoke;
  v5[3] = &unk_1E952A6F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__TLToneStoreDownload_storeItemIdentifier__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 72);
  return result;
}

- (void)_setStoreItemIdentifier:(unint64_t)a3
{
  NSObject *accessQueue;
  _QWORD v4[6];

  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__TLToneStoreDownload__setStoreItemIdentifier___block_invoke;
  v4[3] = &unk_1E952AAA0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(accessQueue, v4);
}

uint64_t __47__TLToneStoreDownload__setStoreItemIdentifier___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(v1 + 72) != v2)
    *(_QWORD *)(v1 + 72) = v2;
  return result;
}

- (float)downloadProgress
{
  NSObject *accessQueue;
  float v3;
  _QWORD v5[6];
  uint64_t v6;
  float *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = (float *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__TLToneStoreDownload_downloadProgress__block_invoke;
  v5[3] = &unk_1E952A6F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __39__TLToneStoreDownload_downloadProgress__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(a1 + 32) + 80);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_setDownloadProgress:(float)a3
{
  NSObject *accessQueue;
  _QWORD v4[5];
  float v5;

  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__TLToneStoreDownload__setDownloadProgress___block_invoke;
  v4[3] = &unk_1E952B5F8;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(accessQueue, v4);
}

uint64_t __44__TLToneStoreDownload__setDownloadProgress___block_invoke(uint64_t result)
{
  uint64_t v1;
  float v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(float *)(result + 40);
  if (llroundf(*(float *)(v1 + 80) * 8388600.0) != llroundf(v2 * 8388600.0))
    *(float *)(v1 + 80) = v2;
  return result;
}

- (NSString)toneIdentifier
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__TLToneStoreDownload_toneIdentifier__block_invoke;
  v5[3] = &unk_1E952A6F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __37__TLToneStoreDownload_toneIdentifier__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 88));
}

- (void)_setToneIdentifier:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__TLToneStoreDownload__setToneIdentifier___block_invoke;
  block[3] = &unk_1E952A6A8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

void __42__TLToneStoreDownload__setToneIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  BOOL v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v2 = *(void **)(a1 + 40);
  v10 = (unint64_t)*(id *)(*(_QWORD *)(a1 + 32) + 88);
  v3 = v2;
  v4 = (void *)v3;
  if (!(v10 | v3))
    goto LABEL_11;
  if (v10)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (v5)
  {

LABEL_12:
    v8 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v9 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v9 + 88);
    *(_QWORD *)(v9 + 88) = v8;
    goto LABEL_13;
  }
  if (v10 == v3)
  {
LABEL_11:

    v7 = (void *)v10;
LABEL_13:

    return;
  }
  v6 = objc_msgSend((id)v10, "isEqualToString:", v3);

  if ((v6 & 1) == 0)
    goto LABEL_12;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  NSObject *accessQueue;
  id v8;
  id v9;
  _QWORD block[4];
  id v12;
  TLToneStoreDownload *v13;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__TLToneStoreDownload_description__block_invoke;
  block[3] = &unk_1E952A6A8;
  v8 = v6;
  v12 = v8;
  v13 = self;
  dispatch_sync(accessQueue, block);
  objc_msgSend(v8, "appendString:", CFSTR(">"));
  v9 = v8;

  return v9;
}

uint64_t __34__TLToneStoreDownload_description__block_invoke(uint64_t a1)
{
  uint64_t v2;
  __CFString **v3;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("; storeItemIdentifier = %llu"),
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72));
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v2 + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("; name = \"%@\"), *(_QWORD *)(v2 + 24));
    v2 = *(_QWORD *)(a1 + 40);
  }
  if (*(_QWORD *)(v2 + 32))
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("; albumTitle = \"%@\"), *(_QWORD *)(v2 + 32));
    v2 = *(_QWORD *)(a1 + 40);
  }
  if (*(_QWORD *)(v2 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("; artistName = \"%@\"), *(_QWORD *)(v2 + 40));
    v2 = *(_QWORD *)(a1 + 40);
  }
  if (*(_QWORD *)(v2 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("; genreName = \"%@\"), *(_QWORD *)(v2 + 56));
    v2 = *(_QWORD *)(a1 + 40);
  }
  if (*(_BYTE *)(v2 + 64))
    v3 = kToneMediaKindRingtone;
  else
    v3 = kToneMediaKindAlertTone;
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("; mediaKind = %@"), *v3);
  result = objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("; downloadProgress = %f"),
             *(float *)(*(_QWORD *)(a1 + 40) + 80));
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 88))
    return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("; toneIdentifier = \"%@\"),
             *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88));
  return result;
}

- (BOOL)isEqual:(id)a3
{
  TLToneStoreDownload *v4;
  TLToneStoreDownload *v5;
  NSObject *accessQueue;
  char v7;
  _QWORD block[4];
  TLToneStoreDownload *v10;
  TLToneStoreDownload *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  BOOL v16;

  v4 = (TLToneStoreDownload *)a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = self == v4;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      *((_BYTE *)v14 + 24) = 1;
      accessQueue = self->_accessQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __31__TLToneStoreDownload_isEqual___block_invoke;
      block[3] = &unk_1E952B360;
      v11 = self;
      v12 = &v13;
      v10 = v5;
      dispatch_sync(accessQueue, block);

    }
  }
  v7 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __31__TLToneStoreDownload_isEqual___block_invoke(int8x16_t *a1)
{
  NSObject *v1;
  id v2;
  int8x16_t v3;
  _QWORD block[4];
  int8x16_t v5;
  uint64_t v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__TLToneStoreDownload_isEqual___block_invoke_2;
  block[3] = &unk_1E952A770;
  v6 = a1[3].i64[0];
  v3 = a1[2];
  v1 = *(NSObject **)(v3.i64[0] + 8);
  v2 = (id)v3.i64[0];
  v5 = vextq_s8(v3, v3, 8uLL);
  dispatch_sync(v1, block);

}

void __31__TLToneStoreDownload_isEqual___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  BOOL v9;
  char v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  BOOL v16;
  char v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  char v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  char v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  void *v37;
  unint64_t v38;
  unint64_t v39;
  void *v40;
  char v41;

  v2 = *(_QWORD *)(a1[6] + 8);
  v3 = *(_BYTE *)(v2 + 24);
  if (v3)
    v3 = *(_QWORD *)(a1[4] + 72) == *(_QWORD *)(a1[5] + 72);
  *(_BYTE *)(v2 + 24) = v3;
  v4 = *(_QWORD *)(a1[6] + 8);
  if (!*(_BYTE *)(v4 + 24))
  {
    v10 = 0;
    goto LABEL_16;
  }
  v5 = *(void **)(a1[5] + 24);
  v6 = (unint64_t)*(id *)(a1[4] + 24);
  v7 = v5;
  v8 = (void *)v7;
  if (!(v6 | v7))
    goto LABEL_14;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    if (v6 != v7)
    {
      v10 = objc_msgSend((id)v6, "isEqualToString:", v7);
      goto LABEL_15;
    }
LABEL_14:
    v10 = 1;
    goto LABEL_15;
  }
  v10 = 0;
LABEL_15:

  v4 = *(_QWORD *)(a1[6] + 8);
LABEL_16:
  *(_BYTE *)(v4 + 24) = v10;
  v11 = *(_QWORD *)(a1[6] + 8);
  if (!*(_BYTE *)(v11 + 24))
  {
    v17 = 0;
    goto LABEL_29;
  }
  v12 = *(void **)(a1[5] + 32);
  v13 = (unint64_t)*(id *)(a1[4] + 32);
  v14 = v12;
  v15 = (void *)v14;
  if (!(v13 | v14))
    goto LABEL_27;
  if (v13)
    v16 = v14 == 0;
  else
    v16 = 1;
  if (!v16)
  {
    if (v13 != v14)
    {
      v17 = objc_msgSend((id)v13, "isEqualToString:", v14);
      goto LABEL_28;
    }
LABEL_27:
    v17 = 1;
    goto LABEL_28;
  }
  v17 = 0;
LABEL_28:

  v11 = *(_QWORD *)(a1[6] + 8);
LABEL_29:
  *(_BYTE *)(v11 + 24) = v17;
  v18 = *(_QWORD *)(a1[6] + 8);
  if (*(_BYTE *)(v18 + 24))
  {
    v19 = *(void **)(a1[5] + 40);
    v20 = (unint64_t)*(id *)(a1[4] + 40);
    v21 = v19;
    v22 = (void *)v21;
    if (!(v20 | v21))
      goto LABEL_36;
    v23 = 0;
    if (!v20 || !v21)
      goto LABEL_37;
    if (v20 == v21)
LABEL_36:
      v23 = 1;
    else
      v23 = objc_msgSend((id)v20, "isEqualToString:", v21);
LABEL_37:

    v18 = *(_QWORD *)(a1[6] + 8);
    goto LABEL_38;
  }
  v23 = 0;
LABEL_38:
  *(_BYTE *)(v18 + 24) = v23;
  v24 = *(_QWORD *)(a1[6] + 8);
  v25 = *(_BYTE *)(v24 + 24);
  if (v25)
    v25 = llround(*(double *)(a1[4] + 48)) == llround(*(double *)(a1[5] + 48));
  *(_BYTE *)(v24 + 24) = v25;
  v26 = *(_QWORD *)(a1[6] + 8);
  if (!*(_BYTE *)(v26 + 24))
  {
    v31 = 0;
    goto LABEL_49;
  }
  v27 = *(void **)(a1[5] + 56);
  v28 = (unint64_t)*(id *)(a1[4] + 56);
  v29 = v27;
  v30 = (void *)v29;
  if (!(v28 | v29))
    goto LABEL_47;
  v31 = 0;
  if (!v28 || !v29)
    goto LABEL_48;
  if (v28 == v29)
LABEL_47:
    v31 = 1;
  else
    v31 = objc_msgSend((id)v28, "isEqualToString:", v29);
LABEL_48:

  v26 = *(_QWORD *)(a1[6] + 8);
LABEL_49:
  *(_BYTE *)(v26 + 24) = v31;
  v32 = *(_QWORD *)(a1[6] + 8);
  v33 = *(_BYTE *)(v32 + 24);
  if (v33)
    v33 = (*(_BYTE *)(a1[4] + 64) == 0) ^ (*(_BYTE *)(a1[5] + 64) != 0);
  *(_BYTE *)(v32 + 24) = v33;
  v34 = *(_QWORD *)(a1[6] + 8);
  v35 = *(_BYTE *)(v34 + 24);
  if (v35)
    v35 = llroundf(*(float *)(a1[4] + 80) / 0.01) == llroundf(*(float *)(a1[5] + 80) / 0.01);
  *(_BYTE *)(v34 + 24) = v35;
  v36 = *(_QWORD *)(a1[6] + 8);
  if (*(_BYTE *)(v36 + 24))
  {
    v37 = *(void **)(a1[5] + 88);
    v38 = (unint64_t)*(id *)(a1[4] + 88);
    v39 = v37;
    v40 = (void *)v39;
    if (!(v38 | v39))
      goto LABEL_60;
    v41 = 0;
    if (!v38 || !v39)
      goto LABEL_61;
    if (v38 == v39)
LABEL_60:
      v41 = 1;
    else
      v41 = objc_msgSend((id)v38, "isEqualToString:", v39);
LABEL_61:

    v36 = *(_QWORD *)(a1[6] + 8);
    goto LABEL_62;
  }
  v41 = 0;
LABEL_62:
  *(_BYTE *)(v36 + 24) = v41;
}

- (unint64_t)hash
{
  NSObject *accessQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__TLToneStoreDownload_hash__block_invoke;
  v5[3] = &unk_1E952A6F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __27__TLToneStoreDownload_hash__block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^= *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^= objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "hash");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^= objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "hash");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^= objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "hash");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^= llround(*(double *)(*(_QWORD *)(a1 + 32) + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^= objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "hash");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^= *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 64);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^= llroundf(*(float *)(*(_QWORD *)(a1 + 32) + 80) / 0.01);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "hash");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^= result;
  return result;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_toneIdentifier, 0);
  objc_storeStrong((id *)&self->_genreName, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_albumTitle, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_accessQueueLabel, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
