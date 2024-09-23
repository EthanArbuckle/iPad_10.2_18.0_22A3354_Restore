@implementation SSMutableURLRequestProperties

void __61__SSMutableURLRequestProperties_setValue_forHTTPHeaderField___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = (id)objc_msgSend(*(id *)(a1[4] + 96), "mutableCopy");
  if (!v2)
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = a1[5];
  v4 = a1[6];
  v8 = v2;
  if (v3)
    objc_msgSend(v2, "setObject:forKey:", v3, v4);
  else
    objc_msgSend(v2, "removeObjectForKey:", v4);
  v5 = objc_msgSend(v8, "copy");
  v6 = a1[4];
  v7 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v5;

}

uint64_t __66__SSMutableURLRequestProperties_setShouldDisableCellularFallback___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 166) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __55__SSMutableURLRequestProperties_setITunesStoreRequest___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 112) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setValue:(id)a3 forHTTPHeaderField:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__SSMutableURLRequestProperties_setValue_forHTTPHeaderField___block_invoke;
  block[3] = &unk_1E47B87B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(dispatchQueue, block);

}

- (void)setURL:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0C99D20];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithObjects:", v5, 0);

  -[SSMutableURLRequestProperties setURLs:](self, "setURLs:", v6);
}

- (void)setURLs:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SSMutableURLRequestProperties_setURLs___block_invoke;
  block[3] = &unk_1E47B8768;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(dispatchQueue, block);

}

void __47__SSMutableURLRequestProperties_setHTTPMethod___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 104) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 104);
    *(_QWORD *)(v5 + 104) = v4;

  }
}

void __45__SSMutableURLRequestProperties_setHTTPBody___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 80) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 80);
    *(_QWORD *)(v5 + 80) = v4;

  }
}

void __41__SSMutableURLRequestProperties_setURLs___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 208) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 208);
    *(_QWORD *)(v5 + 208) = v4;

  }
}

- (void)setShouldDisableCellularFallback:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__SSMutableURLRequestProperties_setShouldDisableCellularFallback___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setITunesStoreRequest:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__SSMutableURLRequestProperties_setITunesStoreRequest___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setHTTPMethod:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SSMutableURLRequestProperties_setHTTPMethod___block_invoke;
  block[3] = &unk_1E47B8768;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(dispatchQueue, block);

}

- (void)setHTTPBody:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SSMutableURLRequestProperties_setHTTPBody___block_invoke;
  block[3] = &unk_1E47B8768;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(dispatchQueue, block);

}

- (void)setAdditionalMetrics:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SSMutableURLRequestProperties_setAdditionalMetrics___block_invoke;
  block[3] = &unk_1E47B8768;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(dispatchQueue, block);

}

void __54__SSMutableURLRequestProperties_setAdditionalMetrics___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

- (void)setAllowedRetryCount:(int64_t)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__SSMutableURLRequestProperties_setAllowedRetryCount___block_invoke;
  v4[3] = &unk_1E47BA600;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __54__SSMutableURLRequestProperties_setAllowedRetryCount___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 16) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setCachePolicy:(unint64_t)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__SSMutableURLRequestProperties_setCachePolicy___block_invoke;
  v4[3] = &unk_1E47BA600;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __48__SSMutableURLRequestProperties_setCachePolicy___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 32) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setClientIdentifier:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__SSMutableURLRequestProperties_setClientIdentifier___block_invoke;
  block[3] = &unk_1E47B8768;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(dispatchQueue, block);

}

void __53__SSMutableURLRequestProperties_setClientIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 56) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v4;

  }
}

- (void)setExpectedContentLength:(int64_t)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__SSMutableURLRequestProperties_setExpectedContentLength___block_invoke;
  v4[3] = &unk_1E47BA600;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __58__SSMutableURLRequestProperties_setExpectedContentLength___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 72) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setHTTPHeaders:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__SSMutableURLRequestProperties_setHTTPHeaders___block_invoke;
  block[3] = &unk_1E47B8768;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(dispatchQueue, block);

}

void __48__SSMutableURLRequestProperties_setHTTPHeaders___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 96) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 96);
    *(_QWORD *)(v5 + 96) = v4;

  }
}

- (void)setMachineDataStyle:(int64_t)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__SSMutableURLRequestProperties_setMachineDataStyle___block_invoke;
  v4[3] = &unk_1E47BA600;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __53__SSMutableURLRequestProperties_setMachineDataStyle___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 136) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setNetworkServiceType:(unint64_t)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__SSMutableURLRequestProperties_setNetworkServiceType___block_invoke;
  v4[3] = &unk_1E47BA600;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __55__SSMutableURLRequestProperties_setNetworkServiceType___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 144) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setRequestParameters:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SSMutableURLRequestProperties_setRequestParameters___block_invoke;
  block[3] = &unk_1E47B8768;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(dispatchQueue, block);

}

void __54__SSMutableURLRequestProperties_setRequestParameters___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 152) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 152);
    *(_QWORD *)(v5 + 152) = v4;

  }
}

- (void)setShouldDisableCellular:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__SSMutableURLRequestProperties_setShouldDisableCellular___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __58__SSMutableURLRequestProperties_setShouldDisableCellular___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 165) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setShouldDisableReversePush:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__SSMutableURLRequestProperties_setShouldDisableReversePush___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __61__SSMutableURLRequestProperties_setShouldDisableReversePush___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 167) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setShouldDisableReversePushSampling:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__SSMutableURLRequestProperties_setShouldDisableReversePushSampling___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __69__SSMutableURLRequestProperties_setShouldDisableReversePushSampling___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 168) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setTimeoutInterval:(double)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__SSMutableURLRequestProperties_setTimeoutInterval___block_invoke;
  v4[3] = &unk_1E47BA600;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

double __52__SSMutableURLRequestProperties_setTimeoutInterval___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 176) = result;
  return result;
}

- (void)setURLBagKey:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SSMutableURLRequestProperties_setURLBagKey___block_invoke;
  block[3] = &unk_1E47B8768;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(dispatchQueue, block);

}

void __46__SSMutableURLRequestProperties_setURLBagKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 184) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 184);
    *(_QWORD *)(v5 + 184) = v4;

  }
}

- (void)setUserAgentComponents:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SSMutableURLRequestProperties_setUserAgentComponents___block_invoke;
  block[3] = &unk_1E47B8768;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(dispatchQueue, block);

}

void __56__SSMutableURLRequestProperties_setUserAgentComponents___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 216) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 216);
    *(_QWORD *)(v5 + 216) = v4;

  }
}

- (void)setValue:(id)a3 forRequestParameter:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SSMutableURLRequestProperties_setValue_forRequestParameter___block_invoke;
  block[3] = &unk_1E47B87B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(dispatchQueue, block);

}

void __62__SSMutableURLRequestProperties_setValue_forRequestParameter___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = (id)objc_msgSend(*(id *)(a1[4] + 152), "mutableCopy");
  if (!v2)
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = a1[5];
  v4 = a1[6];
  v8 = v2;
  if (v3)
    objc_msgSend(v2, "setObject:forKey:", v3, v4);
  else
    objc_msgSend(v2, "removeObjectForKey:", v4);
  v5 = objc_msgSend(v8, "copy");
  v6 = a1[4];
  v7 = *(void **)(v6 + 152);
  *(_QWORD *)(v6 + 152) = v5;

}

- (void)setAllowsBootstrapCellularData:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__SSMutableURLRequestProperties_setAllowsBootstrapCellularData___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __64__SSMutableURLRequestProperties_setAllowsBootstrapCellularData___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 24) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setHTTPBodyStream:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SSMutableURLRequestProperties_setHTTPBodyStream___block_invoke;
  block[3] = &unk_1E47B8768;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(dispatchQueue, block);

}

void __51__SSMutableURLRequestProperties_setHTTPBodyStream___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id *v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = *(void **)(v2 + 88);
  v4 = (id *)(v2 + 88);
  if (v5 != v3)
    objc_storeStrong(v4, v3);
}

- (void)setKBSyncType:(int64_t)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__SSMutableURLRequestProperties_setKBSyncType___block_invoke;
  v4[3] = &unk_1E47BA600;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __47__SSMutableURLRequestProperties_setKBSyncType___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 120) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setLargeDownload:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__SSMutableURLRequestProperties_setLargeDownload___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __50__SSMutableURLRequestProperties_setLargeDownload___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 128) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setMultiPartFormDataWithDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v12 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("multipart/form-data; boundary=%@"),
                     v6);
      v8 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __68__SSMutableURLRequestProperties_setMultiPartFormDataWithDictionary___block_invoke;
      v13[3] = &unk_1E47BC418;
      v14 = v8;
      v9 = v6;
      v15 = v9;
      v10 = v8;
      objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v13);
      objc_msgSend(v10, "appendFormat:", CFSTR("--%@--"), v9);
      objc_msgSend(v10, "dataUsingEncoding:", 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSMutableURLRequestProperties setHTTPBody:](self, "setHTTPBody:", v11);

      -[SSMutableURLRequestProperties setHTTPMethod:](self, "setHTTPMethod:", CFSTR("POST"));
      -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:](self, "setValue:forHTTPHeaderField:", v7, CFSTR("Content-Type"));

    }
  }

}

void __68__SSMutableURLRequestProperties_setMultiPartFormDataWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = a3;
  v7 = a2;
  objc_msgSend(v5, "appendFormat:", CFSTR("--%@\r\n"), v6);
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("Content-Disposition: form-data; name=\"%@\"\r\n\r\n"), v7);

  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@\r\n"), v8);
}

- (void)setRequiresCellularDataNetwork:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__SSMutableURLRequestProperties_setRequiresCellularDataNetwork___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __64__SSMutableURLRequestProperties_setRequiresCellularDataNetwork___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 160) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setRequiresExtendedValidationCertificates:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__SSMutableURLRequestProperties_setRequiresExtendedValidationCertificates___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __75__SSMutableURLRequestProperties_setRequiresExtendedValidationCertificates___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 161) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setRequiresExternal:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__SSMutableURLRequestProperties_setRequiresExternal___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __53__SSMutableURLRequestProperties_setRequiresExternal___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 162) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setRequiresHTTPS:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__SSMutableURLRequestProperties_setRequiresHTTPS___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __50__SSMutableURLRequestProperties_setRequiresHTTPS___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 163) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setShouldAddKBSyncData:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__SSMutableURLRequestProperties_setShouldAddKBSyncData___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __56__SSMutableURLRequestProperties_setShouldAddKBSyncData___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 120) = *(unsigned __int8 *)(result + 40);
  return result;
}

- (void)setShouldDecodeResponse:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__SSMutableURLRequestProperties_setShouldDecodeResponse___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __57__SSMutableURLRequestProperties_setShouldDecodeResponse___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 164) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setShouldProcessProtocol:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__SSMutableURLRequestProperties_setShouldProcessProtocol___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __58__SSMutableURLRequestProperties_setShouldProcessProtocol___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 169) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setShouldSendSecureToken:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__SSMutableURLRequestProperties_setShouldSendSecureToken___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __58__SSMutableURLRequestProperties_setShouldSendSecureToken___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 170) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setShouldSetCookies:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__SSMutableURLRequestProperties_setShouldSetCookies___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __53__SSMutableURLRequestProperties_setShouldSetCookies___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 171) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setClientAuditBundleIdentifier:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__SSMutableURLRequestProperties_setClientAuditBundleIdentifier___block_invoke;
  block[3] = &unk_1E47B8768;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(dispatchQueue, block);

}

void __64__SSMutableURLRequestProperties_setClientAuditBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 40) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

- (void)setClientAuditTokenData:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD block[4];
  id v8;
  SSMutableURLRequestProperties *v9;

  v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__SSMutableURLRequestProperties_setClientAuditTokenData___block_invoke;
  block[3] = &unk_1E47B8768;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(dispatchQueue, block);

}

void __57__SSMutableURLRequestProperties_setClientAuditTokenData___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id *v3;
  void *v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(v2 + 48);
  v3 = (id *)(v2 + 48);
  if (v1 != v4)
    objc_storeStrong(v3, v1);
}

- (void)setURLBagType:(int64_t)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__SSMutableURLRequestProperties_setURLBagType___block_invoke;
  v4[3] = &unk_1E47BA600;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __47__SSMutableURLRequestProperties_setURLBagType___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 192) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setURLBagURLBlock:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SSMutableURLRequestProperties_setURLBagURLBlock___block_invoke;
  block[3] = &unk_1E47B8AC0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(dispatchQueue, block);

}

void __51__SSMutableURLRequestProperties_setURLBagURLBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 200) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 200);
    *(_QWORD *)(v5 + 200) = v4;

  }
}

@end
