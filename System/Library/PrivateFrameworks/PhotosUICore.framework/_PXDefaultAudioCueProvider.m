@implementation _PXDefaultAudioCueProvider

- (_PXDefaultAudioCueProvider)init
{
  _PXDefaultAudioCueProvider *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *providersByCatalog;
  uint64_t v5;
  OS_dispatch_queue *stateQueue;
  os_log_t v7;
  OS_os_log *log;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_PXDefaultAudioCueProvider;
  v2 = -[_PXDefaultAudioCueProvider init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    providersByCatalog = v2->_providersByCatalog;
    v2->_providersByCatalog = v3;

    px_dispatch_queue_create_serial();
    v5 = objc_claimAutoreleasedReturnValue();
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v5;

    v7 = os_log_create((const char *)*MEMORY[0x1E0D744D8], (const char *)objc_msgSend(CFSTR("PXAudioCueProvider"), "UTF8String"));
    log = v2->_log;
    v2->_log = (OS_os_log *)v7;

  }
  return v2;
}

- (id)requestCuesForAudioAsset:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  os_signpost_id_t v9;
  OS_os_log *v10;
  NSObject *v11;
  OS_os_log *v12;
  id v13;
  OS_os_log *v14;
  void *v15;
  _QWORD v17[4];
  OS_os_log *v18;
  id v19;
  os_signpost_id_t v20;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  -[_PXDefaultAudioCueProvider _cueProviderForCatalog:](self, "_cueProviderForCatalog:", objc_msgSend(v7, "catalog"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_make_with_pointer((os_log_t)self->_log, v8);
  v10 = self->_log;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "requestAudioCues", ", buf, 2u);
  }

  v12 = self->_log;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __69___PXDefaultAudioCueProvider_requestCuesForAudioAsset_resultHandler___block_invoke;
  v17[3] = &unk_1E51370A0;
  v19 = v6;
  v20 = v9;
  v18 = v12;
  v13 = v6;
  v14 = v12;
  objc_msgSend(v8, "requestCuesForAudioAsset:resultHandler:", v7, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_cueProviderForCatalog:(int64_t)a3
{
  NSObject *stateQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__213488;
  v11 = __Block_byref_object_dispose__213489;
  v12 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53___PXDefaultAudioCueProvider__cueProviderForCatalog___block_invoke;
  block[3] = &unk_1E5141AE0;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(stateQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_providersByCatalog, 0);
}

@end
