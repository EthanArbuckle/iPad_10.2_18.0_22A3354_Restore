@implementation PFLSegmentationCalculator

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__PFLSegmentationCalculator_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_instance;
}

void __43__PFLSegmentationCalculator_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v1;

}

- (PFLSegmentationCalculator)init
{
  PFLSegmentationCalculator *v2;
  PFLSegmentationCalculator *v3;
  PISegmentationData *segmentationData;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *workQueue;
  dispatch_queue_t v8;
  OS_dispatch_queue *segmentationQueue;
  dispatch_semaphore_t v10;
  OS_dispatch_semaphore *segmentationQueueSema;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PFLSegmentationCalculator;
  v2 = -[PFLSegmentationCalculator init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    segmentationData = v2->_segmentationData;
    v2->_segmentationData = 0;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.photosface.segmentationcalculator.work", v5);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v6;

    v8 = dispatch_queue_create("com.apple.photosface.segmentationcalculator.segmentation", v5);
    segmentationQueue = v3->_segmentationQueue;
    v3->_segmentationQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_semaphore_create(0);
    segmentationQueueSema = v3->_segmentationQueueSema;
    v3->_segmentationQueueSema = (OS_dispatch_semaphore *)v10;

  }
  return v3;
}

- (void)bestSegmentationForAsset:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__PFLSegmentationCalculator_bestSegmentationForAsset_completion___block_invoke;
  block[3] = &unk_251457C58;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(workQueue, block);

}

void __65__PFLSegmentationCalculator_bestSegmentationForAsset_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t (**v3)(_QWORD, _QWORD);
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __65__PFLSegmentationCalculator_bestSegmentationForAsset_completion___block_invoke_2;
  v29[3] = &unk_251457C30;
  v2 = *(id *)(a1 + 48);
  v29[4] = *(_QWORD *)(a1 + 32);
  v30 = v2;
  v3 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x249503418](v29);
  objc_msgSend(MEMORY[0x24BE71CE0], "ensureResources");
  pfl_layout_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    *(_DWORD *)buf = 138412290;
    v32 = v5;
    _os_log_impl(&dword_243C29000, v4, OS_LOG_TYPE_DEFAULT, "PFL: bestSegmentationForAsset DISPATCHED, seg data == %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v28 = 0;
  objc_msgSend(v7, "queue_bestSegmentationForAsset:timePositions:error:", v8, &unk_251459480, &v28);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v28;
  if ((((uint64_t (**)(_QWORD, id))v3)[2](v3, v10) & 1) == 0)
  {
    if (v9)
      objc_msgSend(v6, "addObject:", v9);
    v11 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    v27 = v10;
    objc_msgSend(v11, "queue_bestSegmentationForAsset:timePositions:error:", v12, &unk_251459498, &v27);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v27;

    if ((((uint64_t (**)(_QWORD, id))v3)[2](v3, v14) & 1) != 0)
    {
      v10 = v14;
      v9 = v13;
      goto LABEL_26;
    }
    if (v13)
      objc_msgSend(v6, "addObject:", v13);
    v15 = *(void **)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 40);
    v26 = v14;
    objc_msgSend(v15, "queue_bestSegmentationForAsset:timePositions:error:", v16, &unk_2514594B0, &v26);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v26;

    if ((((uint64_t (**)(_QWORD, id))v3)[2](v3, v10) & 1) != 0)
    {
      v9 = v17;
      goto LABEL_26;
    }
    if (v17)
      objc_msgSend(v6, "addObject:", v17);
    v18 = *(void **)(a1 + 32);
    v19 = *(_QWORD *)(a1 + 40);
    v25 = v10;
    objc_msgSend(v18, "queue_bestSegmentationForAsset:timePositions:error:", v19, &unk_2514594C8, &v25);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v25;

    if ((((uint64_t (**)(_QWORD, id))v3)[2](v3, v20) & 1) != 0)
    {
      v10 = v20;
      goto LABEL_26;
    }
    if (v9)
      objc_msgSend(v6, "addObject:", v9);
    if (objc_msgSend(v6, "count"))
    {
      v10 = v20;
LABEL_23:
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      pfl_layout_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_243C29000, v22, OS_LOG_TYPE_DEFAULT, "PFL: bestSegmentationForAsset DONE", buf, 2u);
      }

      v23 = *(_QWORD *)(a1 + 32);
      v24 = *(void **)(v23 + 8);
      *(_QWORD *)(v23 + 8) = 0;

      objc_msgSend(MEMORY[0x24BE71CE0], "freeResources");
      goto LABEL_26;
    }
    pfl_layout_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      __65__PFLSegmentationCalculator_bestSegmentationForAsset_completion___block_invoke_cold_1(v21);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", 0x251457DA8, 2, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if ((((uint64_t (**)(_QWORD, id))v3)[2](v3, v10) & 1) == 0)
      goto LABEL_23;
  }
LABEL_26:

}

BOOL __65__PFLSegmentationCalculator_bestSegmentationForAsset_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    pfl_layout_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_243C29000, v4, OS_LOG_TYPE_DEFAULT, "PFL: bestSegmentationForAsset DONE with error %@", (uint8_t *)&v8, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 8);
    *(_QWORD *)(v5 + 8) = 0;

    objc_msgSend(MEMORY[0x24BE71CE0], "freeResources");
  }

  return v3 != 0;
}

- (void)bestSegmentationForAsset:(id)a3 timePosition:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *workQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  workQueue = self->_workQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __78__PFLSegmentationCalculator_bestSegmentationForAsset_timePosition_completion___block_invoke;
  v13[3] = &unk_251457C80;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(workQueue, v13);

}

void __78__PFLSegmentationCalculator_bestSegmentationForAsset_timePosition_completion___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE71CE0], "ensureResources");
  pfl_layout_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1[4] + 8);
    *(_DWORD *)buf = 138412290;
    v16 = v3;
    _os_log_impl(&dword_243C29000, v2, OS_LOG_TYPE_DEFAULT, "PFL: bestSegmentationForAsset DISPATCHED, seg data == %@", buf, 0xCu);
  }

  v4 = (void *)a1[4];
  v5 = a1[5];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[7]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v4, "queue_bestSegmentationForAsset:timePositions:error:", v5, v7, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;

  (*(void (**)(void))(a1[6] + 16))();
  pfl_layout_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_243C29000, v10, OS_LOG_TYPE_DEFAULT, "PFL: bestSegmentationForAsset DONE", buf, 2u);
  }

  v11 = a1[4];
  v12 = *(void **)(v11 + 8);
  *(_QWORD *)(v11 + 8) = 0;

  objc_msgSend(MEMORY[0x24BE71CE0], "freeResources");
}

- (id)queue_bestSegmentationForAsset:(id)a3 timePositions:(id)a4 error:(id *)a5
{
  NSObject *v7;
  double v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *segmentationQueue;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  float v20;
  float v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  PFLLayoutConfiguration *v27;
  int v28;
  double v29;
  double v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  uint64_t v42;
  id obj;
  uint64_t v44;
  id v46;
  uint64_t v47;
  _QWORD block[6];
  id v49;
  _BYTE *v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  double v63;
  __int16 v64;
  double v65;
  __int16 v66;
  void *v67;
  _BYTE v68[24];
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v46 = a3;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = a4;
  v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
  if (v47)
  {
    v7 = 0;
    v44 = *(_QWORD *)v59;
    v42 = *MEMORY[0x24BE724B8];
    v8 = -1.0;
LABEL_3:
    v9 = 0;
    while (1)
    {
      v10 = v7;
      if (*(_QWORD *)v59 != v44)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v9);
      *(_QWORD *)v68 = 0;
      *(_QWORD *)&v68[8] = v68;
      *(_QWORD *)&v68[16] = 0x3032000000;
      v69 = __Block_byref_object_copy__0;
      v70 = __Block_byref_object_dispose__0;
      v71 = 0;
      v52 = 0;
      v53 = &v52;
      v54 = 0x3032000000;
      v55 = __Block_byref_object_copy__0;
      v56 = __Block_byref_object_dispose__0;
      v57 = 0;
      segmentationQueue = self->_segmentationQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __80__PFLSegmentationCalculator_queue_bestSegmentationForAsset_timePositions_error___block_invoke;
      block[3] = &unk_251457CD0;
      block[4] = v11;
      block[5] = self;
      v13 = v46;
      v49 = v13;
      v50 = v68;
      v51 = &v52;
      dispatch_async(segmentationQueue, block);
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_segmentationQueueSema, 0xFFFFFFFFFFFFFFFFLL);
      pfl_layout_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v63 = *(double *)&v11;
        _os_log_impl(&dword_243C29000, v14, OS_LOG_TYPE_DEFAULT, "PFL: queue_bestSegmentationForAsset DONE SEGMENTING for %@", buf, 0xCu);
      }

      v15 = (void *)v53[5];
      if (v15)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v15);
        pfl_layout_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_243C29000, v16, OS_LOG_TYPE_DEFAULT, "PFL: queue_bestSegmentationForAsset ALL DONE with an error; returning nil layout",
            buf,
            2u);
        }
      }
      else
      {
        pfl_layout_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          -[PISegmentationData scores](self->_segmentationData, "scores");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v42);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "floatValue");
          v21 = v20;
          objc_msgSend(*(id *)(*(_QWORD *)&v68[8] + 40), "visibleRect");
          _rectAsString(v22, v23, v24, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v63 = *(double *)&v11;
          v64 = 2048;
          v65 = v21;
          v66 = 2112;
          v67 = v26;
          _os_log_impl(&dword_243C29000, v17, OS_LOG_TYPE_DEFAULT, "PFL: queue_bestSegmentationForAsset: score for %@ == %.2f, crop == %@", buf, 0x20u);

        }
        if (!self->_segmentationData)
          goto LABEL_21;
        v27 = [PFLLayoutConfiguration alloc];
        v28 = objc_msgSend(v11, "intValue");
        v16 = -[PFLLayoutConfiguration initWithAsset:timePosition:segmentationData:coreLayout:](v27, "initWithAsset:timePosition:segmentationData:coreLayout:", v13, v28, self->_segmentationData, *(_QWORD *)(*(_QWORD *)&v68[8] + 40));
        -[NSObject cropScore](v16, "cropScore");
        if (v29 > v8)
        {
          v16 = v16;

          -[NSObject cropScore](v16, "cropScore");
          v8 = v30;
          pfl_layout_log();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v63 = v8;
            v64 = 2112;
            v65 = *(double *)&v11;
            _os_log_impl(&dword_243C29000, v31, OS_LOG_TYPE_DEFAULT, "PFL: queue_bestSegmentationForAsset: top score is now %.2f (%@)", buf, 0x16u);
          }

          v10 = v16;
        }
      }

LABEL_21:
      _Block_object_dispose(&v52, 8);

      _Block_object_dispose(v68, 8);
      if (v15)
      {

        v32 = 0;
        goto LABEL_30;
      }
      ++v9;
      v7 = v10;
      if (v47 == v9)
      {
        v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
        v7 = v10;
        if (v47)
          goto LABEL_3;
        goto LABEL_27;
      }
    }
  }
  v7 = 0;
LABEL_27:
  v33 = v7;

  pfl_layout_log();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = -[NSObject timePosition](v33, "timePosition");
    -[NSObject visibleRect](v33, "visibleRect");
    _rectAsString(v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v68 = 134218242;
    *(_QWORD *)&v68[4] = v35;
    *(_WORD *)&v68[12] = 2112;
    *(_QWORD *)&v68[14] = v40;
    _os_log_impl(&dword_243C29000, v34, OS_LOG_TYPE_DEFAULT, "PFL: queue_bestSegmentationForAsset ALL DONE; winner == %ld (%@)",
      v68,
      0x16u);

  }
  v10 = v33;
  v32 = v10;
LABEL_30:

  return v32;
}

void __80__PFLSegmentationCalculator_queue_bestSegmentationForAsset_timePositions_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  __int128 v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  pfl_layout_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_DWORD *)buf = 138412546;
    v17 = v3;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_243C29000, v2, OS_LOG_TYPE_DEFAULT, "PFL: queue_bestSegmentationForAsset START SEGMENTING for %@, seg data == %@", buf, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v7 = objc_msgSend(*(id *)(a1 + 32), "intValue");
  v12[0] = MEMORY[0x24BDAC760];
  v12[2] = __80__PFLSegmentationCalculator_queue_bestSegmentationForAsset_timePositions_error___block_invoke_244;
  v12[3] = &unk_251457CA8;
  v8 = *(void **)(a1 + 48);
  v12[4] = *(_QWORD *)(a1 + 40);
  v9 = v7;
  v12[1] = 3221225472;
  v15 = *(_OWORD *)(a1 + 56);
  v10 = v8;
  v11 = *(_QWORD *)(a1 + 32);
  v13 = v10;
  v14 = v11;
  objc_msgSend(v6, "_queue_segmentationForAsset:timePosition:completion:", v5, v9, v12);

}

void __80__PFLSegmentationCalculator_queue_bestSegmentationForAsset_timePositions_error___block_invoke_244(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  objc_storeStrong((id *)(a1[4] + 8), a2);
  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a3);
  objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), a4);
  if (*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40))
  {
    pfl_layout_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __80__PFLSegmentationCalculator_queue_bestSegmentationForAsset_timePositions_error___block_invoke_244_cold_1((uint64_t)a1, (uint64_t)(a1 + 8), v11);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1[4] + 32));

}

- (void)_queue_segmentationForAsset:(id)a3 timePosition:(unint64_t)a4 completion:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  void *v24;
  void *v25;
  PFLLayoutProvider *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  PISegmentationData *segmentationData;
  PFLJetsamInfoInterval *v32;
  void *v33;
  id v34;
  PFLLayoutProvider *v35;
  PFLJetsamInfoInterval *v36;
  _QWORD v37[4];
  PFLJetsamInfoInterval *v38;
  PFLLayoutProvider *v39;
  id v40;
  _QWORD v41[2];
  _QWORD v42[3];

  v42[2] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = (objc_class *)MEMORY[0x24BDE36B8];
  v10 = a3;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithPhotoAsset:", v10);

  PFCRectForTimePosition();
  v16 = flipYNormalizedRect(v12, v13, v14, v15);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = objc_alloc(MEMORY[0x24BE72410]);
  v24 = (void *)objc_msgSend(v23, "initWithScreenSize:timeRect:inactiveTimeRect:parallaxPadding:", *MEMORY[0x24BE723C0], *(double *)(MEMORY[0x24BE723C0] + 8), v16, v18, v20, v22, *(_QWORD *)&v16, *(_QWORD *)&v18, *(_QWORD *)&v20, *(_QWORD *)&v22, *MEMORY[0x24BDBF148], *(_QWORD *)(MEMORY[0x24BDBF148] + 8));
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE72480]), "initWithPortraitConfiguration:landscapeConfiguration:", v24, 0);
  v26 = -[PFLLayoutProvider initWithTimePosition:]([PFLLayoutProvider alloc], "initWithTimePosition:", a4);
  v27 = (void *)MEMORY[0x24BDBCED8];
  v28 = *MEMORY[0x24BE71E58];
  v41[0] = *MEMORY[0x24BE71E60];
  v41[1] = v28;
  v42[0] = v26;
  v42[1] = v25;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "dictionaryWithDictionary:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  segmentationData = self->_segmentationData;
  if (segmentationData)
    objc_msgSend(v30, "setObject:forKeyedSubscript:", segmentationData, *MEMORY[0x24BE71E68]);
  v32 = -[PFLJetsamInfoInterval initWithLabel:]([PFLJetsamInfoInterval alloc], "initWithLabel:", CFSTR("loadSegmentationForAsset"));
  v33 = (void *)MEMORY[0x24BE71CE0];
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __81__PFLSegmentationCalculator__queue_segmentationForAsset_timePosition_completion___block_invoke;
  v37[3] = &unk_251457CF8;
  v38 = v32;
  v39 = v26;
  v40 = v8;
  v34 = v8;
  v35 = v26;
  v36 = v32;
  objc_msgSend(v33, "loadSegmentationDataForAsset:options:completion:", v11, v30, v37);

}

void __81__PFLSegmentationCalculator__queue_segmentationForAsset_timePosition_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "logCurrentInterval");
  v6 = objc_msgSend(*(id *)(a1 + 40), "resultsAreValid");
  v7 = 0;
  if (v8 && v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "watchLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentationQueueSema, 0);
  objc_storeStrong((id *)&self->_segmentationQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_segmentationData, 0);
}

void __65__PFLSegmentationCalculator_bestSegmentationForAsset_completion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_243C29000, log, OS_LOG_TYPE_ERROR, "PFL: no segmentation errors, but no layouts were generated either!", v1, 2u);
}

void __80__PFLSegmentationCalculator_queue_bestSegmentationForAsset_timePositions_error___block_invoke_244_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a2 + 8) + 40);
  v6 = 138412802;
  v7 = v3;
  v8 = 2112;
  v9 = v4;
  v10 = 2112;
  v11 = v5;
  _os_log_error_impl(&dword_243C29000, log, OS_LOG_TYPE_ERROR, "segmentation error for asset %@, time position %@, error %@", (uint8_t *)&v6, 0x20u);
}

@end
