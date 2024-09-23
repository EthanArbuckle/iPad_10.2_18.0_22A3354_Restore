@implementation PIFaceObservationCache

- (PIFaceObservationCache)init
{
  PIFaceObservationCache *v2;
  dispatch_group_t v3;
  OS_dispatch_group *group;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PIFaceObservationCache;
  v2 = -[PIFaceObservationCache init](&v9, sel_init);
  v3 = dispatch_group_create();
  group = v2->_group;
  v2->_group = (OS_dispatch_group *)v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create("PIFaceObservationCache", v5);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v6;

  return v2;
}

- (void)submit:(id)a3 response:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  NSObject *queue;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (self->_result)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithResult:", self->_result);
    ((void (**)(_QWORD, void *))v8)[2](v8, v9);

  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__PIFaceObservationCache_submit_response___block_invoke;
    block[3] = &unk_1E5018E10;
    block[4] = self;
    v13 = v7;
    v12 = v6;
    dispatch_async(queue, block);

  }
}

- (id)submitSynchronous:(id)a3 error:(id *)a4
{
  id v6;
  NUFaceDetectionResult *v7;
  NSObject *queue;
  NUFaceDetectionResult *v9;
  _QWORD block[5];
  id v12;
  id *v13;

  v6 = a3;
  v7 = self->_result;
  if (!v7)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__PIFaceObservationCache_submitSynchronous_error___block_invoke;
    block[3] = &unk_1E50159C8;
    block[4] = self;
    v12 = v6;
    v13 = a4;
    dispatch_sync(queue, block);

    v7 = self->_result;
  }
  v9 = v7;

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

void __50__PIFaceObservationCache_submitSynchronous_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  dispatch_group_wait(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 8), 0xFFFFFFFFFFFFFFFFLL);
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    objc_msgSend(*(id *)(a1 + 40), "submitGenericSynchronous:", *(_QWORD *)(a1 + 48));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 24);
    *(_QWORD *)(v3 + 24) = v2;

  }
}

void __42__PIFaceObservationCache_submit_response___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  dispatch_group_wait(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 8), 0xFFFFFFFFFFFFFFFFLL);
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 24))
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithResult:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    dispatch_group_enter(*(dispatch_group_t *)(v2 + 8));
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __42__PIFaceObservationCache_submit_response___block_invoke_2;
    v5[3] = &unk_1E5019E90;
    v3 = *(void **)(a1 + 40);
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = *(id *)(a1 + 48);
    objc_msgSend(v3, "submit:", v5);

  }
}

void __42__PIFaceObservationCache_submit_response___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = 0;
  v3 = a2;
  objc_msgSend(v3, "result:", &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  v6 = v5;
  if (v4 && !v5)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), v4);
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 8));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (id)faceRequestWithRequest:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0D520A8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithRequest:", v4);

  +[PIPipelineFilters sourceFilterNoOrientation](PIPipelineFilters, "sourceFilterNoOrientation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIPipelineFilters applyOrientationFilter](PIPipelineFilters, "applyOrientationFilter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", CFSTR("PIFaceObservationCache-newRequest"));
  v11[0] = v6;
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPipelineFilters:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52218]), "initWithTargetPixelCount:", 762048);
  objc_msgSend(v5, "setScalePolicy:", v9);

  objc_msgSend(v5, "setSampleMode:", 3);
  return v5;
}

@end
