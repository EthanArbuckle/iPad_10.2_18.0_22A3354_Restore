@implementation EspressoWrapper

+ (id)cache
{
  if (qword_2544D9CC8 != -1)
    dispatch_once(&qword_2544D9CC8, &unk_251C8FA40);
  return (id)qword_2544D9CD0;
}

- (EspressoWrapper)initWithPath:(id)a3
{
  NSString *v4;
  EspressoWrapper *v5;
  NSString *path;
  NSString *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  const char *v10;
  uint64_t v11;
  objc_super v13;

  v4 = (NSString *)a3;
  v13.receiver = self;
  v13.super_class = (Class)EspressoWrapper;
  v5 = -[EspressoWrapper init](&v13, sel_init);
  path = v5->_path;
  v5->_path = v4;
  v7 = v4;

  v8 = dispatch_queue_create("EspressoWrapper", 0);
  queue = v5->_queue;
  v5->_queue = (OS_dispatch_queue *)v8;

  objc_msgSend_buildAsync(v5, v10, v11);
  return v5;
}

+ (id)cachedEspressoWrapper:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  id v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;

  v4 = a3;
  objc_msgSend_cache(a1, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v7, v8, (uint64_t)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = objc_alloc((Class)a1);
    v9 = (void *)objc_msgSend_initWithPath_(v10, v11, (uint64_t)v4);
    if (v9)
    {
      objc_msgSend_cache(a1, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v14, v15, (uint64_t)v9, v4);

    }
  }

  return v9;
}

+ (void)clearCache
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  id v5;

  objc_msgSend_cache(a1, a2, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v5, v3, v4);

}

+ (id)pathFromBaseName:(id)a3
{
  id v3;
  Class v4;
  SEL v5;
  const char *v6;
  uint64_t v7;
  void (*v8)(Class, SEL, id, uint64_t);
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = NSClassFromString(CFSTR("BWEspressoInferenceAdapter"));
  v5 = NSSelectorFromString(CFSTR("espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:"));
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (v8 = (void (*)(Class, SEL, id, uint64_t))objc_msgSend_methodForSelector_(v4, v6, (uint64_t)v5)) == 0
    || (v8(v4, v5, v3, 1),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_path(v9, v10, v11),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        !v12))
  {
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_contentsOfDirectoryAtPath_error_(v13, v14, (uint64_t)CFSTR("/System/Library/ImagingNetworks"), 0);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v24, v28, 16);
    if (v17)
    {
      v19 = v17;
      v20 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v15);
          v22 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (objc_msgSend_hasPrefix_(v22, v18, (uint64_t)v3)
            && (objc_msgSend_hasSuffix_(v22, v18, (uint64_t)CFSTR(".espresso.net")) & 1) != 0)
          {
            objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v18, (uint64_t)CFSTR("/System/Library/ImagingNetworks/%@"), v22);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_15;
          }
        }
        v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v24, v28, 16);
        if (v19)
          continue;
        break;
      }
    }
    v12 = 0;
LABEL_15:

  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  espresso_plan_destroy();
  espresso_context_destroy();
  self->_ctx = 0;
  self->_plan = 0;
  v3.receiver = self;
  v3.super_class = (Class)EspressoWrapper;
  -[EspressoWrapper dealloc](&v3, sel_dealloc);
}

- (int)planIdx
{
  return self->_planIdx;
}

- (void)setPlanIdx:(int)a3
{
  self->_planIdx = a3;
}

- (BOOL)built
{
  return self->_built;
}

- (void)setBuilt:(BOOL)a3
{
  self->_built = a3;
}

- (void)plan
{
  return self->_plan;
}

- (void)setPlan:(void *)a3
{
  self->_plan = a3;
}

- (void)ctx
{
  return self->_ctx;
}

- (void)setCtx:(void *)a3
{
  self->_ctx = a3;
}

- (id)CIImageProcessorDigestObject
{
  return self->_path;
}

- (void)buildAsync
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_24B6D92B4;
  block[3] = &unk_251C8F0C0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)buildWait
{
  dispatch_sync((dispatch_queue_t)self->_queue, &unk_251C8FA60);
  return self->_built;
}

- (int)bind:(const char *)a3 buffer:(__CVBuffer *)a4
{
  const char *v5;
  uint64_t v6;

  if (!self->_built)
    return -1;
  objc_msgSend_plan(self, a2, (uint64_t)a3);
  objc_msgSend_planIdx(self, v5, v6);
  return espresso_network_bind_cvpixelbuffer();
}

- (BOOL)hasBlob:(const char *)a3
{
  const char *v4;
  uint64_t v5;

  if (!self->_built)
    return 0;
  objc_msgSend_plan(self, a2, (uint64_t)a3);
  objc_msgSend_planIdx(self, v4, v5);
  return espresso_network_query_blob_shape() == 0;
}

- (int)execute
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;

  if (!self->_built)
    return -1;
  objc_msgSend_plan(self, a2, v2);
  objc_msgSend_planIdx(self, v4, v5);
  return espresso_plan_execute_sync();
}

- (int)executeAsync:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  const char *v7;
  uint64_t v8;
  dispatch_queue_t v9;
  int v10;
  id v12;

  v6 = a3;
  if (self->_built)
  {
    objc_msgSend_plan(self, v4, v5);
    objc_msgSend_planIdx(self, v7, v8);
    v9 = dispatch_queue_create(0, 0);
    v12 = v6;
    v10 = espresso_plan_submit();

  }
  else
  {
    v10 = -1;
  }

  return v10;
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
