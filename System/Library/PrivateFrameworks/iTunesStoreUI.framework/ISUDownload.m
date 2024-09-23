@implementation ISUDownload

+ (id)downloadProperties
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &__Properties, 9);
}

+ (id)downloadExternalProperties
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &__ExternalProperties, 5);
}

+ (void)initialize
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((id)objc_opt_class() == a1)
  {
    v2 = *MEMORY[0x24BEB2348];
    __Properties = *MEMORY[0x24BEB2328];
    qword_255186D90 = v2;
    v3 = *MEMORY[0x24BEB2380];
    qword_255186D98 = *MEMORY[0x24BEB2370];
    qword_255186DA0 = v3;
    v4 = *MEMORY[0x24BEB2410];
    qword_255186DA8 = *MEMORY[0x24BEB2360];
    qword_255186DB0 = v4;
    v5 = *MEMORY[0x24BEB2468];
    qword_255186DB8 = *MEMORY[0x24BEB2420];
    qword_255186DC0 = v5;
    qword_255186DC8 = *MEMORY[0x24BEB2470];
    v6 = *MEMORY[0x24BEB2260];
    __ExternalProperties = *MEMORY[0x24BEB2258];
    qword_255186D68 = v6;
    v7 = *MEMORY[0x24BEB2270];
    qword_255186D70 = *MEMORY[0x24BEB2268];
    qword_255186D78 = v7;
    qword_255186D80 = *MEMORY[0x24BEB2278];
  }
}

- (ISUDownload)initWithManagedDownload:(id)a3
{
  ISUDownload *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ISUDownload;
  v4 = -[ISUDownload init](&v7, sel_init);
  if (v4)
  {
    v4->_download = (SSDownload *)a3;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("com.apple.iTunesStoreUI.ISUDownload.%p"), v4);
    v4->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v5, "UTF8String"), 0);

  }
  return v4;
}

- (void)dealloc
{
  NSObject *dispatchQueue;
  objc_super v4;

  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
    dispatch_release(dispatchQueue);

  v4.receiver = self;
  v4.super_class = (Class)ISUDownload;
  -[ISUDownload dealloc](&v4, sel_dealloc);
}

- (NSString)artistName
{
  NSObject *dispatchQueue;
  NSString *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__44;
  v10 = __Block_byref_object_dispose__44;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __25__ISUDownload_artistName__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __25__ISUDownload_artistName__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "valueForProperty:", __Properties);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (int64_t)bytesDownloaded
{
  NSObject *dispatchQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __30__ISUDownload_bytesDownloaded__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__ISUDownload_bytesDownloaded__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "valueForExternalProperty:", __ExternalProperties), "longLongValue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)bytesTotal
{
  NSObject *dispatchQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __25__ISUDownload_bytesTotal__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __25__ISUDownload_bytesTotal__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "valueForExternalProperty:", qword_255186D68), "longLongValue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)copyLocalizedStatusString
{
  NSString *v3;
  void *v4;
  const __CFString *v5;
  unint64_t v6;
  NSString *v7;
  uint64_t v9;
  uint64_t v10;
  double v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSString *v25;

  v3 = -[ISUDownload phaseIdentifier](self, "phaseIdentifier");
  if (-[NSString isEqualToString:](v3, "isEqualToString:", *MEMORY[0x24BEB2300]))
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = CFSTR("DOWNLOAD_ERROR");
LABEL_11:
    v7 = (NSString *)objc_msgSend(v4, "localizedStringForKey:value:table:", v5, &stru_24DE83F60, 0);
    return v7;
  }
  if (-[ISUDownload isContentRestricted](self, "isContentRestricted"))
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = CFSTR("RESTRICTED");
    goto LABEL_11;
  }
  if (-[NSString isEqualToString:](v3, "isEqualToString:", *MEMORY[0x24BEB2318]))
  {
    v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL;
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    if (v6 == 1)
      v5 = CFSTR("DOWNLOAD_PAUSED");
    else
      v5 = CFSTR("TAP_TO_RESUME");
    goto LABEL_11;
  }
  if (-[NSString isEqualToString:](v3, "isEqualToString:", *MEMORY[0x24BEB2320]))
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = CFSTR("WAITING");
    goto LABEL_11;
  }
  v25 = -[ISUDownload statusDescription](self, "statusDescription");
  if (-[NSString length](v25, "length"))
  {
    v7 = v25;
    return v7;
  }
  if (!-[NSString isEqualToString:](v3, "isEqualToString:", *MEMORY[0x24BEB22F8]))
    goto LABEL_21;
  v9 = -[ISUDownload bytesDownloaded](self, "bytesDownloaded");
  v10 = -[ISUDownload bytesTotal](self, "bytesTotal");
  if (v10 < 1 || v9 <= 0)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = CFSTR("UNKNOWN_PROGRESS");
    goto LABEL_11;
  }
  if (v9 >= (unint64_t)v10)
  {
LABEL_21:
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = CFSTR("PROCESSING_DOWNLOAD");
    goto LABEL_11;
  }
  -[ISUDownload estimatedSecondsRemaining](self, "estimatedSecondsRemaining");
  if (v11 >= 0.0)
  {
    v15 = v11;
    v16 = objc_alloc(MEMORY[0x24BDD17C8]);
    v17 = (void *)objc_msgSend(v16, "initWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("TIME_FORMAT"), &stru_24DE83F60, 0), v15 / 0x3CuLL, v15 % 0x3C);
    v18 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom");
    v19 = objc_alloc(MEMORY[0x24BDD17C8]);
    v20 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    if (v18 == 1)
      v21 = CFSTR("TIME_PROGRESS_LONG");
    else
      v21 = CFSTR("TIME_PROGRESS");
    v22 = objc_msgSend(v20, "localizedStringForKey:value:table:", v21, &stru_24DE83F60, 0);
    v23 = CPFSSizeStrings();
    v24 = (void *)objc_msgSend(v19, "initWithFormat:", v22, v23, CPFSSizeStrings(), v17);

    return v24;
  }
  else
  {
    v12 = objc_alloc(MEMORY[0x24BDD17C8]);
    v13 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("DATA_PROGRESS"), &stru_24DE83F60, 0);
    v14 = CPFSSizeStrings();
    return (id)objc_msgSend(v12, "initWithFormat:", v13, v14, CPFSSizeStrings());
  }
}

- (double)estimatedSecondsRemaining
{
  NSObject *dispatchQueue;
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
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__ISUDownload_estimatedSecondsRemaining__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__ISUDownload_estimatedSecondsRemaining__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "valueForExternalProperty:", qword_255186D70), "doubleValue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (BOOL)isContentRestricted
{
  NSObject *dispatchQueue;
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
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __34__ISUDownload_isContentRestricted__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__ISUDownload_isContentRestricted__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "valueForProperty:", qword_255186D98), "BOOLValue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isPausable
{
  NSObject *dispatchQueue;
  NSString *v4;
  char v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __25__ISUDownload_isPausable__block_invoke;
  v7[3] = &unk_24DE7BE30;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(dispatchQueue, v7);
  if (*((_BYTE *)v9 + 24))
  {
    v4 = -[ISUDownload phaseIdentifier](self, "phaseIdentifier");
    v5 = -[NSString isEqual:](v4, "isEqual:", *MEMORY[0x24BEB22F8]);
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __25__ISUDownload_isPausable__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "valueForProperty:", qword_255186D90), "BOOLValue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isPurchase
{
  NSObject *dispatchQueue;
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
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __25__ISUDownload_isPurchase__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __25__ISUDownload_isPurchase__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "valueForProperty:", qword_255186DA0), "BOOLValue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (SSDownload)managedDownload
{
  NSObject *dispatchQueue;
  SSDownload *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__44;
  v10 = __Block_byref_object_dispose__44;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __30__ISUDownload_managedDownload__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (SSDownload *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __30__ISUDownload_managedDownload__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (double)percentComplete
{
  NSObject *dispatchQueue;
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
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __30__ISUDownload_percentComplete__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__ISUDownload_percentComplete__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "valueForExternalProperty:", qword_255186D78), "doubleValue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (NSString)phaseIdentifier
{
  NSObject *dispatchQueue;
  NSString *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__44;
  v10 = __Block_byref_object_dispose__44;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __30__ISUDownload_phaseIdentifier__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __30__ISUDownload_phaseIdentifier__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "valueForProperty:", qword_255186DA8);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)resetPreorderState
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__ISUDownload_resetPreorderState__block_invoke;
  block[3] = &unk_24DE7AF90;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

uint64_t __33__ISUDownload_resetPreorderState__block_invoke(uint64_t a1)
{
  _QWORD v2[2];

  v2[1] = *MEMORY[0x24BDAC8D0];
  v2[0] = qword_255186DB8;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "resetCachedProperties:count:", v2, 1);
}

- (void)setManagedDownload:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34__ISUDownload_setManagedDownload___block_invoke;
  v4[3] = &unk_24DE7AFB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

_QWORD *__34__ISUDownload_setManagedDownload___block_invoke(_QWORD *result)
{
  void *v1;
  _QWORD *v2;

  v1 = *(void **)(result[4] + 8);
  if (v1 != (void *)result[5])
  {
    v2 = result;

    result = (id)v2[5];
    *(_QWORD *)(v2[4] + 8) = result;
  }
  return result;
}

- (NSString)statusDescription
{
  NSObject *dispatchQueue;
  NSString *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__44;
  v10 = __Block_byref_object_dispose__44;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __32__ISUDownload_statusDescription__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __32__ISUDownload_statusDescription__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "valueForExternalProperty:", qword_255186D80);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSNumber)storeItemIdentifier
{
  NSObject *dispatchQueue;
  NSNumber *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__44;
  v10 = __Block_byref_object_dispose__44;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __34__ISUDownload_storeItemIdentifier__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSNumber *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __34__ISUDownload_storeItemIdentifier__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "valueForProperty:", qword_255186DB0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSNumber)storePreorderIdentifier
{
  NSObject *dispatchQueue;
  NSNumber *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__44;
  v10 = __Block_byref_object_dispose__44;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__ISUDownload_storePreorderIdentifier__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSNumber *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __38__ISUDownload_storePreorderIdentifier__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "valueForProperty:", qword_255186DB8);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSURL)thumbnailImageURL
{
  NSObject *dispatchQueue;
  NSURL *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__44;
  v10 = __Block_byref_object_dispose__44;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __32__ISUDownload_thumbnailImageURL__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = (NSURL *)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7[5]);
  else
    v3 = 0;

  _Block_object_dispose(&v6, 8);
  return v3;
}

id __32__ISUDownload_thumbnailImageURL__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "valueForProperty:", qword_255186DC0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)title
{
  NSObject *dispatchQueue;
  NSString *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__44;
  v10 = __Block_byref_object_dispose__44;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __20__ISUDownload_title__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __20__ISUDownload_title__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "valueForProperty:", qword_255186DC8);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

@end
