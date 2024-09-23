@implementation TPSContentStatusEventsProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tipStatusController, 0);
}

uint64_t __67__TPSContentStatusEventsProvider__isStatusType_observedInStatuses___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isStatusType:observedInStatus:", *(_QWORD *)(a1 + 48), a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)_isStatusType:(int64_t)a3 observedInStatus:(id)a4
{
  id v5;
  void *v6;
  char v7;
  int v8;

  v5 = a4;
  v6 = v5;
  switch(a3)
  {
    case 1:
      if ((objc_msgSend(v5, "isDesiredOutcomePerformed") & 1) != 0)
        goto LABEL_9;
      goto LABEL_3;
    case 2:
      if ((objc_msgSend(v5, "isDesiredOutcomePerformed") & 1) != 0
        || (objc_msgSend(v6, "isHintDisplayedOnAnyDevice") & 1) != 0)
      {
LABEL_9:
        LOBYTE(v8) = 1;
      }
      else
      {
        v7 = objc_msgSend(v6, "isHintInelgibile");
LABEL_15:
        LOBYTE(v8) = v7;
      }
      break;
    case 3:
      v7 = objc_msgSend(v5, "isHintDisplayedOnAnyDevice");
      goto LABEL_15;
    case 4:
LABEL_3:
      v7 = objc_msgSend(v6, "isHintDisplayed");
      goto LABEL_15;
    case 5:
      if (!objc_msgSend(v5, "isHintDisplayedOnAnyDevice"))
        goto LABEL_6;
      v8 = objc_msgSend(v6, "isHintDisplayed") ^ 1;
      break;
    case 6:
      v7 = objc_msgSend(v5, "isHintDismissed");
      goto LABEL_15;
    case 7:
      v7 = objc_msgSend(v5, "isContentViewed");
      goto LABEL_15;
    case 8:
      v7 = objc_msgSend(v5, "isDesiredOutcomePerformed");
      goto LABEL_15;
    default:
LABEL_6:
      LOBYTE(v8) = 0;
      break;
  }

  return v8;
}

- (void)queryEvents:(id)a3
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  _UNKNOWN **v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  _UNKNOWN **v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  id obj;
  void *context;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v32;
    *(_QWORD *)&v5 = 138412290;
    v28 = v5;
    v8 = &off_1E395A000;
    v9 = 0x1E0C99000;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v32 != v7)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v10);
        context = (void *)MEMORY[0x19AECDDC0]();
        v12 = objc_msgSend(v11, "minObservationCount");
        if (v12 <= objc_msgSend(v11, "currentObservationCount"))
        {
          LOBYTE(v19) = 0;
        }
        else
        {
          v13 = v6;
          v14 = v7;
          v15 = v8;
          v16 = v11;
          v19 = objc_msgSend(v16, "statusType");
          objc_msgSend(v16, "contentID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[TPSTipStatusController statusesForCorrelationIdentifier:](self->_tipStatusController, "statusesForCorrelationIdentifier:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          LODWORD(v19) = -[TPSContentStatusEventsProvider _isStatusType:observedInStatuses:](self, "_isStatusType:observedInStatuses:", v19, v18);
          if ((_DWORD)v19)
          {
            +[TPSLogger default](TPSLogger, "default");
            v19 = objc_claimAutoreleasedReturnValue();
            v8 = v15;
            if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v16, "description");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v28;
              v39 = v20;
              _os_log_impl(&dword_19A906000, (os_log_t)v19, OS_LOG_TYPE_DEFAULT, "Status observed for event: %@", buf, 0xCu);

            }
            LOBYTE(v19) = 1;
          }
          else
          {
            v8 = v15;
          }
          v7 = v14;
          v6 = v13;
          v9 = 0x1E0C99000uLL;
        }
        v21 = objc_alloc_init((Class)v8[185]);
        objc_msgSend(v11, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setIdentifier:", v22);
        objc_msgSend(*(id *)(v9 + 3432), "date");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setResultDate:", v23);

        if ((v19 & 1) != 0)
        {
          v36 = v22;
          objc_msgSend(v21, "resultDate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v24;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObservationMap:", v25);

        }
        else
        {
          objc_msgSend(v21, "setObservationMap:", 0);
        }
        -[TPSEventsProvider delegate](self, "delegate", v28);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "dataProvider:didFinishQueryWithResults:", self, v27);

        objc_autoreleasePoolPop(context);
        ++v10;
      }
      while (v6 != v10);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v6);
  }

}

- (BOOL)_isStatusType:(int64_t)a3 observedInStatuses:(id)a4
{
  id v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v6 = a4;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__TPSContentStatusEventsProvider__isStatusType_observedInStatuses___block_invoke;
  v8[3] = &unk_1E395AF40;
  v8[5] = &v9;
  v8[6] = a3;
  v8[4] = self;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);
  LOBYTE(a3) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return a3;
}

- (TPSContentStatusEventsProvider)init
{
  TPSContentStatusEventsProvider *v2;
  void *v3;
  uint64_t v4;
  TPSTipStatusController *tipStatusController;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSContentStatusEventsProvider;
  v2 = -[TPSContentStatusEventsProvider init](&v7, sel_init);
  if (v2)
  {
    +[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tipStatusController");
    v4 = objc_claimAutoreleasedReturnValue();
    tipStatusController = v2->_tipStatusController;
    v2->_tipStatusController = (TPSTipStatusController *)v4;

  }
  return v2;
}

@end
