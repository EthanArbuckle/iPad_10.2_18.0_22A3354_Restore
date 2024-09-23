@implementation PXStoryCompanionTimelineRequest

+ (id)requestTimelineWithConfiguration:(id)a3 resultHandler:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  NSObject *v10;
  char v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  PXStoryModel *v16;
  PXStoryModel *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  PXStoryModel *v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  id v26;
  id v27;
  id v28;
  id v29;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXStoryCompanionTimelineRequest.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration != nil"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXStoryCompanionTimelineRequest.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultHandler != nil"));

LABEL_3:
  objc_msgSend(v7, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v29 = 0;
  v27 = 0;
  v28 = 0;
  v11 = objc_msgSend(a1, "_transformConfiguration:intoStoryConfiguration:extendedTraitCollection:error:", v7, &v29, &v28, &v27);
  v12 = v29;
  v13 = v28;
  v14 = v27;
  if ((v11 & 1) == 0)
  {
    ((void (**)(_QWORD, _QWORD, id))v9)[2](v9, 0, v14);
    v15 = 0;
    goto LABEL_8;
  }
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXStoryCompanionTimelineRequest.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("storyConfiguration != nil"));

    if (v13)
      goto LABEL_6;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXStoryCompanionTimelineRequest.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extendedTraitCollection != nil"));

    goto LABEL_6;
  }
  if (!v13)
    goto LABEL_12;
LABEL_6:
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PXStoryModel initWithConfiguration:extendedTraitCollection:]([PXStoryModel alloc], "initWithConfiguration:extendedTraitCollection:", v12, v13);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __82__PXStoryCompanionTimelineRequest_requestTimelineWithConfiguration_resultHandler___block_invoke;
  v23[3] = &unk_1E5126120;
  v26 = a1;
  v24 = v16;
  v25 = v9;
  v17 = v16;
  objc_msgSend(a1, "_waitForFinalTimelineWithProgress:model:resultHandler:", v15, v17, v23);

LABEL_8:
  return v15;
}

+ (BOOL)_transformConfiguration:(id)a3 intoStoryConfiguration:(id *)a4 extendedTraitCollection:(id *)a5 error:(id *)a6
{
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  PXStoryConfiguration *v15;
  void *v16;
  PXStoryConfiguration *v17;
  void *v18;
  id v19;
  PXStoryExtendedTraitCollection *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v9 = a3;
  objc_msgSend(v9, "viewportSize");
  v11 = v10;
  v13 = v12;
  v14 = v12 > 0.0 && v10 > 0.0;
  if (!v14)
  {
    PXSizeDescription();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    PXStoryErrorCreateWithCodeDebugFormat(1, CFSTR("invalid viewport size %@"), v23, v24, v25, v26, v27, v28, (uint64_t)v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0;
    v20 = 0;
    if (!a4)
      goto LABEL_9;
    goto LABEL_8;
  }
  v15 = [PXStoryConfiguration alloc];
  objc_msgSend(v9, "assetCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PXStoryConfiguration initWithAssetCollection:](v15, "initWithAssetCollection:", v16);
  objc_msgSend(v9, "queue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PXStoryConfiguration copyWithStoryQueue:](v17, "copyWithStoryQueue:", v18);

  objc_msgSend(v19, "setSongsProducerKind:", objc_msgSend(v9, "songsProducerKind"));
  v20 = -[PXStoryExtendedTraitCollection initWithLayoutReferenceSize:]([PXStoryExtendedTraitCollection alloc], "initWithLayoutReferenceSize:", v11, v13);
  v21 = 0;
  if (a4)
LABEL_8:
    *a4 = objc_retainAutorelease(v19);
LABEL_9:
  if (a5)
    *a5 = objc_retainAutorelease(v20);
  if (a6)
    *a6 = objc_retainAutorelease(v21);

  return v14;
}

+ (void)_waitForFinalTimelineWithProgress:(id)a3 model:(id)a4 resultHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "performChanges:", &__block_literal_global_101547);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __89__PXStoryCompanionTimelineRequest__waitForFinalTimelineWithProgress_model_resultHandler___block_invoke_2;
  v14[3] = &unk_1E5126168;
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v10 = v9;
  v11 = v8;
  v12 = v7;
  v13 = (id)objc_msgSend(v11, "pxStory_enumerateStatesByWatchingChanges:usingBlock:", 0x20000000, v14);

}

+ (id)_createCompanionTimelineFromModel:(id)a3
{
  id v3;
  PXStoryConcreteCompanionTimeline *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  PXStoryConcreteCompanionTimeline *v8;

  v3 = a3;
  v4 = [PXStoryConcreteCompanionTimeline alloc];
  objc_msgSend(v3, "timeline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "colorGradeKind");
  objc_msgSend(v3, "colorGradingRepository");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PXStoryConcreteCompanionTimeline initWithTimeline:colorGradeKind:colorGradingRepository:](v4, "initWithTimeline:colorGradeKind:colorGradingRepository:", v5, v6, v7);
  return v8;
}

uint64_t __89__PXStoryCompanionTimelineRequest__waitForFinalTimelineWithProgress_model_resultHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
    *a4 = 1;
  result = objc_msgSend(*(id *)(a1 + 40), "timelineAttributes");
  if ((result & 2) != 0)
  {
    *a4 = 1;
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  return result;
}

uint64_t __89__PXStoryCompanionTimelineRequest__waitForFinalTimelineWithProgress_model_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setViewMode:", 1);
}

void __82__PXStoryCompanionTimelineRequest_requestTimelineWithConfiguration_resultHandler___block_invoke(uint64_t a1, int a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 48), "_createCompanionTimelineFromModel:", *(_QWORD *)(a1 + 32));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (PXStoryCompanionTimelineRequest)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryCompanionTimelineRequest.m"), 104, CFSTR("%s is not available as initializer"), "-[PXStoryCompanionTimelineRequest init]");

  abort();
}

@end
