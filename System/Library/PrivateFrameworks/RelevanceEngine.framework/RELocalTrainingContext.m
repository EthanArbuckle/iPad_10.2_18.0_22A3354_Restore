@implementation RELocalTrainingContext

void __46___RELocalTrainingContext_initWithConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleInvalidation");

}

void __46___RELocalTrainingContext__handleInvalidation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setExportedObject:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  if (v4)
  {
    (*(void (**)(void))(v4 + 16))();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = 0;

  }
}

void __86___RELocalTrainingContext_performTrainingWithElements_events_interactions_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;

  objc_msgSend(*(id *)(a1 + 32), "relevanceEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trainingManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB0], CFSTR("Training context must be added to a relevance engine before trying to train"), v4, v5, v6, v7, v8, v9, v12);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86___RELocalTrainingContext_performTrainingWithElements_events_interactions_completion___block_invoke_2;
  block[3] = &unk_24CF8C5A8;
  v10 = *(NSObject **)(a1 + 40);
  v14 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  v16 = *(id *)(a1 + 64);
  v17 = v3;
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(id *)(a1 + 72);
  v20 = *(id *)(a1 + 80);
  v11 = v3;
  dispatch_async(v10, block);

}

void __86___RELocalTrainingContext_performTrainingWithElements_events_interactions_completion___block_invoke_2(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  v3 = objc_msgSend(*(id *)(a1 + 40), "count");
  v4 = objc_msgSend(*(id *)(a1 + 48), "count");
  if (v3 >= v4)
    v5 = v4;
  else
    v5 = v3;
  if (v2 >= v5)
    v6 = v5;
  else
    v6 = v2;
  if (v6)
  {
    for (i = 0; i != v6; ++i)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "BOOLValue");

      objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "_performTrainingForPredictionElement:isPositiveEvent:interaction:context:", v8, v10, v11, *(_QWORD *)(a1 + 64));

    }
  }
  dispatch_async(*(dispatch_queue_t *)(a1 + 72), *(dispatch_block_t *)(a1 + 80));
}

uint64_t __67___RELocalTrainingContext_updateRemoteAttribute_forKey_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAttribute:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

@end
