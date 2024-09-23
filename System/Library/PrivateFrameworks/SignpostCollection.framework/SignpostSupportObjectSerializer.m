@implementation SignpostSupportObjectSerializer

- (id)_dataArrayForSignpostSupportObjectArray:(id)a3 errorOut:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v22;
  id v23[2];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[SignpostSupportObjectSerializer redactPrivacySensitiveData](self, "redactPrivacySensitiveData");
  v23[1] = 0;
  _SignpostSupportSerializationDataFromObjectArray();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = v8;
  if (v7)
  {
    v10 = objc_msgSend(v7, "length");
    if (v10 <= -[SignpostSupportObjectSerializer maxBytesSize](self, "maxBytesSize"))
    {
      v24[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (unint64_t)objc_msgSend(v6, "count") >> 1;
      objc_msgSend(v6, "subarrayWithRange:", 0, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v13, "count"))
      {

        v13 = 0;
      }
      v23[0] = v9;
      -[SignpostSupportObjectSerializer _dataArrayForSignpostSupportObjectArray:errorOut:](self, "_dataArrayForSignpostSupportObjectArray:errorOut:", v13, v23);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v23[0];

      if (v14)
      {
        objc_msgSend(v11, "addObjectsFromArray:", v14);
        objc_msgSend(v6, "subarrayWithRange:", v12, objc_msgSend(v6, "count") - v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v15;
        -[SignpostSupportObjectSerializer _dataArrayForSignpostSupportObjectArray:errorOut:](self, "_dataArrayForSignpostSupportObjectArray:errorOut:", v16, &v22);
        v17 = v11;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v22;

        if (v18)
        {
          objc_msgSend(v17, "addObjectsFromArray:", v18);
          v19 = v17;
          v20 = v17;
        }
        else
        {
          v19 = v17;
          v20 = 0;
          if (a4)
            *a4 = (id)objc_msgSend(v9, "copy");
        }

        v11 = v19;
      }
      else
      {
        v20 = 0;
        if (a4)
          *a4 = (id)objc_msgSend(v15, "copy");
        v9 = v15;
      }

    }
  }
  else
  {
    v20 = 0;
    if (a4)
      *a4 = (id)objc_msgSend(v8, "copy");
  }

  return v20;
}

- (SignpostSupportObjectSerializer)init
{
  SignpostSupportObjectSerializer *v2;
  SignpostSupportObjectSerializer *v3;
  uint64_t v4;
  NSMutableArray *outstandingLogMessage;
  uint64_t v6;
  NSMutableArray *outstandingSignpostObjects;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SignpostSupportObjectSerializer;
  v2 = -[SignpostSupportObjectSerializer init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_maxBatchSize = xmmword_212A3F0C0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    outstandingLogMessage = v3->_outstandingLogMessage;
    v3->_outstandingLogMessage = (NSMutableArray *)v4;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    outstandingSignpostObjects = v3->_outstandingSignpostObjects;
    v3->_outstandingSignpostObjects = (NSMutableArray *)v6;

  }
  return v3;
}

- (BOOL)_hasProcessingBlocks
{
  void *v3;
  BOOL v4;
  void *v5;

  -[SignpostSupportObjectSerializer serializedSignpostEventBlock](self, "serializedSignpostEventBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[SignpostSupportObjectSerializer serializedLogMessageBlock](self, "serializedLogMessageBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (id)_sanityCheckParameters
{
  void *v3;
  const __CFString *v4;

  if (!-[SignpostSupportObjectSerializer maxBatchSize](self, "maxBatchSize"))
  {
    v4 = CFSTR("Invalid maxBatchSize of 0");
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithCode:description:", 2, v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  if (!-[SignpostSupportObjectSerializer maxBytesSize](self, "maxBytesSize"))
  {
    v4 = CFSTR("Invalid maxBytesSize of 0");
    goto LABEL_8;
  }
  if (!-[SignpostSupportObjectSerializer _hasProcessingBlocks](self, "_hasProcessingBlocks"))
  {
    v4 = CFSTR("No processing blocks specified");
    goto LABEL_8;
  }
  v3 = 0;
  return v3;
}

- (BOOL)serializeLogArchiveWithPath:(id)a3 startDate:(id)a4 endDate:(id)a5 errorOut:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  BOOL v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v38;
  id v39;
  void *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  uint64_t *v44;
  id v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  _QWORD v57[5];
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  id location[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[SignpostSupportObjectSerializer _sanityCheckParameters](self, "_sanityCheckParameters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    v39 = v10;
    v16 = objc_alloc_init(MEMORY[0x24BE90690]);
    objc_msgSend(v16, "setDisableGeneratorProcessing:", 1);
    objc_initWeak(location, self);
    v59 = 0;
    v60 = &v59;
    v61 = 0x3032000000;
    v62 = __Block_byref_object_copy__2;
    v63 = __Block_byref_object_dispose__2;
    v64 = 0;
    v17 = MEMORY[0x24BDAC760];
    v57[0] = MEMORY[0x24BDAC760];
    v57[2] = __90__SignpostSupportObjectSerializer_serializeLogArchiveWithPath_startDate_endDate_errorOut___block_invoke;
    v57[3] = &unk_24CE7A570;
    v57[1] = 3221225472;
    objc_copyWeak(&v58, location);
    v57[4] = &v59;
    v40 = (void *)MEMORY[0x212BF815C](v57);
    -[SignpostSupportObjectSerializer serializedSignpostEventBlock](self, "serializedSignpostEventBlock");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v54[0] = v17;
      v54[1] = 3221225472;
      v54[2] = __90__SignpostSupportObjectSerializer_serializeLogArchiveWithPath_startDate_endDate_errorOut___block_invoke_2;
      v54[3] = &unk_24CE7A598;
      objc_copyWeak(&v56, location);
      v19 = v40;
      v55 = v19;
      objc_msgSend(v16, "setEndEventProcessingBlock:", v54);
      v51[0] = v17;
      v51[1] = 3221225472;
      v51[2] = __90__SignpostSupportObjectSerializer_serializeLogArchiveWithPath_startDate_endDate_errorOut___block_invoke_3;
      v51[3] = &unk_24CE7A598;
      objc_copyWeak(&v53, location);
      v52 = v19;
      v20 = (void *)MEMORY[0x212BF815C](v51);
      objc_msgSend(v16, "setBeginEventProcessingBlock:", v20);
      objc_msgSend(v16, "setEmitEventProcessingBlock:", v20);

      objc_destroyWeak(&v53);
      objc_destroyWeak(&v56);
    }
    -[SignpostSupportObjectSerializer serializedLogMessageBlock](self, "serializedLogMessageBlock");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v48[0] = v17;
      v48[1] = 3221225472;
      v48[2] = __90__SignpostSupportObjectSerializer_serializeLogArchiveWithPath_startDate_endDate_errorOut___block_invoke_4;
      v48[3] = &unk_24CE7A5C0;
      objc_copyWeak(&v50, location);
      v49 = v40;
      objc_msgSend(v16, "setLogMessageProcessingBlock:", v48);

      objc_destroyWeak(&v50);
    }
    v46[0] = v17;
    v46[1] = 3221225472;
    v46[2] = __90__SignpostSupportObjectSerializer_serializeLogArchiveWithPath_startDate_endDate_errorOut___block_invoke_5;
    v46[3] = &unk_24CE7A5E8;
    objc_copyWeak(&v47, location);
    v46[4] = &v59;
    v22 = (void *)MEMORY[0x212BF815C](v46);
    v42[0] = v17;
    v42[1] = 3221225472;
    v42[2] = __90__SignpostSupportObjectSerializer_serializeLogArchiveWithPath_startDate_endDate_errorOut___block_invoke_6;
    v42[3] = &unk_24CE7A610;
    v44 = &v59;
    objc_copyWeak(&v45, location);
    v38 = v22;
    v43 = v38;
    objc_msgSend(v16, "setProcessingCompletionBlock:", v42);
    -[SignpostSupportObjectSerializer filterConfiguration](self, "filterConfiguration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "subsystemCategoryFilter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSubsystemCategoryFilter:", v24);

    -[SignpostSupportObjectSerializer filterConfiguration](self, "filterConfiguration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "uniquePidFilter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setUniquePidFilter:", v26);

    -[SignpostSupportObjectSerializer filterConfiguration](self, "filterConfiguration");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "pidFilter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPidFilter:", v28);

    -[SignpostSupportObjectSerializer filterConfiguration](self, "filterConfiguration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "processNameFilter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setProcessNameFilter:", v30);

    objc_msgSend(v16, "subsystemCategoryFilter");
    v31 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v31, "_fixupToSupportFramerateCalculation");

    v41 = 0;
    LOBYTE(v31) = objc_msgSend(v16, "processLogArchiveWithPath:startDate:endDate:errorOut:", v39, v11, v12, &v41);
    v32 = v41;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostSupportObjectSerializer setOutstandingSignpostObjects:](self, "setOutstandingSignpostObjects:", v33);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostSupportObjectSerializer setOutstandingLogMessage:](self, "setOutstandingLogMessage:", v34);

    if ((v31 & 1) != 0)
    {
      v35 = (void *)v60[5];
      if (!v35)
      {
        v15 = 1;
        goto LABEL_18;
      }
      if (a6)
      {
        v36 = (void *)objc_msgSend(v35, "copy");
LABEL_15:
        v15 = 0;
        *a6 = v36;
LABEL_18:

        objc_destroyWeak(&v45);
        objc_destroyWeak(&v47);

        objc_destroyWeak(&v58);
        _Block_object_dispose(&v59, 8);

        objc_destroyWeak(location);
        v10 = v39;
        goto LABEL_19;
      }
    }
    else if (a6)
    {
      v36 = (void *)objc_msgSend(v32, "copy");
      goto LABEL_15;
    }
    v15 = 0;
    goto LABEL_18;
  }
  v15 = 0;
  if (a6)
    *a6 = objc_retainAutorelease(v13);
LABEL_19:

  return v15;
}

uint64_t __90__SignpostSupportObjectSerializer_serializeLogArchiveWithPath_startDate_endDate_errorOut___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  unsigned int (**v8)(id, _QWORD);
  id WeakRetained;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id obj;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "addObject:", a2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10 = objc_msgSend(v7, "count");
  if (v10 >= objc_msgSend(WeakRetained, "maxBatchSize"))
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    obj = *(id *)(v12 + 40);
    objc_msgSend(WeakRetained, "_dataArrayForSignpostSupportObjectArray:errorOut:", v7, &obj);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v12 + 40), obj);
    if (v13)
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v21;
        while (2)
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v21 != v17)
              objc_enumerationMutation(v14);
            if (!v8[2](v8, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v18)))
            {

              goto LABEL_14;
            }
            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
          if (v16)
            continue;
          break;
        }
      }

      objc_msgSend(v7, "removeAllObjects", (_QWORD)v20);
      v11 = 1;
    }
    else
    {
LABEL_14:
      v11 = 0;
    }

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

uint64_t __90__SignpostSupportObjectSerializer_serializeLogArchiveWithPath_startDate_endDate_errorOut___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  if ((objc_msgSend(v3, "isSyntheticIntervalEvent") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "outstandingSignpostObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "serializedSignpostEventBlock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (*(uint64_t (**)(uint64_t, id, void *, void *))(v6 + 16))(v6, v3, v7, v8);

  }
  return v4;
}

uint64_t __90__SignpostSupportObjectSerializer_serializeLogArchiveWithPath_startDate_endDate_errorOut___block_invoke_3(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "outstandingSignpostObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "serializedSignpostEventBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (*(uint64_t (**)(uint64_t, id, void *, void *))(v6 + 16))(v6, v4, v7, v8);

  return v9;
}

uint64_t __90__SignpostSupportObjectSerializer_serializeLogArchiveWithPath_startDate_endDate_errorOut___block_invoke_4(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "outstandingLogMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "serializedLogMessageBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (*(uint64_t (**)(uint64_t, id, void *, void *))(v6 + 16))(v6, v4, v7, v8);

  return v9;
}

uint64_t __90__SignpostSupportObjectSerializer_serializeLogArchiveWithPath_startDate_endDate_errorOut___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  unsigned int (**v6)(id, _QWORD);
  id WeakRetained;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id obj;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5 && objc_msgSend(v5, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    obj = *(id *)(v8 + 40);
    objc_msgSend(WeakRetained, "_dataArrayForSignpostSupportObjectArray:errorOut:", v5, &obj);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v8 + 40), obj);

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    {
      v10 = 0;
    }
    else
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v11 = v9;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v18;
        while (2)
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v18 != v14)
              objc_enumerationMutation(v11);
            if (!v6[2](v6, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15)))
            {
              v10 = 0;
              goto LABEL_16;
            }
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
          if (v13)
            continue;
          break;
        }
      }
      v10 = 1;
LABEL_16:

    }
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

void __90__SignpostSupportObjectSerializer_serializeLogArchiveWithPath_startDate_endDate_errorOut___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id WeakRetained;

  if (a2)
  {
    v3 = objc_msgSend(a2, "copy");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "serializedLogMessageBlock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_5;
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "outstandingLogMessage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "serializedLogMessageBlock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = (*(uint64_t (**)(uint64_t, void *, void *))(v7 + 16))(v7, v8, v9);

    if ((_DWORD)v7)
    {
LABEL_5:
      objc_msgSend(WeakRetained, "serializedSignpostEventBlock");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = *(_QWORD *)(a1 + 32);
        objc_msgSend(WeakRetained, "outstandingSignpostObjects");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "serializedSignpostEventBlock");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, void *))(v11 + 16))(v11, v12, v13);

      }
    }
    v5 = WeakRetained;
  }

}

- (BOOL)serializeNotificationsWithIntervalTimeoutInSeconds:(unint64_t)a3 errorOut:(id *)a4
{
  return 0;
}

- (unint64_t)maxBatchSize
{
  return self->_maxBatchSize;
}

- (void)setMaxBatchSize:(unint64_t)a3
{
  self->_maxBatchSize = a3;
}

- (unint64_t)maxBytesSize
{
  return self->_maxBytesSize;
}

- (void)setMaxBytesSize:(unint64_t)a3
{
  self->_maxBytesSize = a3;
}

- (id)serializedSignpostEventBlock
{
  return self->_serializedSignpostEventBlock;
}

- (void)setSerializedSignpostEventBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)serializedLogMessageBlock
{
  return self->_serializedLogMessageBlock;
}

- (void)setSerializedLogMessageBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)redactPrivacySensitiveData
{
  return self->_redactPrivacySensitiveData;
}

- (void)setRedactPrivacySensitiveData:(BOOL)a3
{
  self->_redactPrivacySensitiveData = a3;
}

- (SignpostSerializationFilterConfiguration)filterConfiguration
{
  return self->_filterConfiguration;
}

- (void)setFilterConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_filterConfiguration, a3);
}

- (NSMutableArray)outstandingSignpostObjects
{
  return self->_outstandingSignpostObjects;
}

- (void)setOutstandingSignpostObjects:(id)a3
{
  objc_storeStrong((id *)&self->_outstandingSignpostObjects, a3);
}

- (NSMutableArray)outstandingLogMessage
{
  return self->_outstandingLogMessage;
}

- (void)setOutstandingLogMessage:(id)a3
{
  objc_storeStrong((id *)&self->_outstandingLogMessage, a3);
}

- (SignpostSupportObjectExtractor)extractor
{
  return self->_extractor;
}

- (void)setExtractor:(id)a3
{
  objc_storeStrong((id *)&self->_extractor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractor, 0);
  objc_storeStrong((id *)&self->_outstandingLogMessage, 0);
  objc_storeStrong((id *)&self->_outstandingSignpostObjects, 0);
  objc_storeStrong((id *)&self->_filterConfiguration, 0);
  objc_storeStrong(&self->_serializedLogMessageBlock, 0);
  objc_storeStrong(&self->_serializedSignpostEventBlock, 0);
}

@end
