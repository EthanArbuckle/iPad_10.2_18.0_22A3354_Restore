@implementation TPKEligibleContentsMonitoringController

+ (id)_identifierForContext:(id)a3 withPrefix:(id)a4
{
  void *v5;
  id v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a4;
  v7 = (__CFString *)a3;
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = CFSTR("emptyContext");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@%@"), v6, CFSTR("-"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_currentContentIdentifierForContext:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_identifierForContext:withPrefix:", v3, CFSTR("TipKitContent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_eligibleContentsIdentifierForContext:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_identifierForContext:withPrefix:", v3, CFSTR("TipKitEligibleContents"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_legacyIdentifierForContext:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_identifierForContext:withPrefix:", v3, CFSTR("TipKitContent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (TPKEligibleContentsMonitoringController)initWithContext:(id)a3
{
  id v5;
  TPKEligibleContentsMonitoringController *v6;
  id *p_isa;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  TPKEligibleContentsMonitoringController *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  _BOOL4 v29;
  id *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  objc_super v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v37.receiver = self;
  v37.super_class = (Class)TPKEligibleContentsMonitoringController;
  v6 = -[TPKEligibleContentsMonitoringController init](&v37, sel_init);
  p_isa = (id *)&v6->super.isa;
  if (!v6)
    goto LABEL_25;
  objc_storeStrong((id *)&v6->_context, a3);
  if (v5)
  {
    v8 = (void *)objc_opt_class();
    objc_msgSend(p_isa, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_currentContentIdentifierForContext:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEB7D90], "unarchivedObjectOfClass:forKey:", objc_opt_class(), v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = p_isa[2];
    p_isa[2] = (id)v11;

    v13 = p_isa[2];
    if (v13)
    {
      if (objc_msgSend(v13, "state") == 3)
        goto LABEL_9;
      v42[0] = p_isa[2];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 1);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = p_isa[3];
      p_isa[3] = (id)v14;

      v16 = p_isa[2];
      p_isa[2] = 0;
    }
    else
    {
      v18 = (void *)MEMORY[0x24BDBCF20];
      v19 = objc_opt_class();
      objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_opt_class();
      objc_msgSend(p_isa, "context");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_eligibleContentsIdentifierForContext:", v21);
      v22 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEB7D90], "unarchivedObjectOfClasses:forKey:", v16, v22);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = p_isa[3];
      p_isa[3] = (id)v23;

      v10 = (void *)v22;
    }

LABEL_9:
    objc_msgSend(MEMORY[0x24BEB7D20], "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "majorVersion");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "integerValue");

    v28 = p_isa[2];
    if (v28)
    {
      v29 = objc_msgSend(v28, "version") != v27 || objc_msgSend(p_isa[2], "state") == 5;
      v30 = p_isa + 3;
      if (objc_msgSend(p_isa[3], "count"))
      {
LABEL_16:
        objc_msgSend(*v30, "firstObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v31, "version") == v27)
        {
          objc_msgSend(*v30, "firstObject");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "state");

          if (v33 != 5)
            goto LABEL_24;
        }
        else
        {

        }
LABEL_21:
        objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = objc_msgSend(p_isa[2], "version");
          *(_DWORD *)buf = 134218240;
          v39 = v35;
          v40 = 2048;
          v41 = v27;
          _os_log_impl(&dword_248A67000, v34, OS_LOG_TYPE_DEFAULT, "Cached content verion mismatch (found %ld, requires %ld)", buf, 0x16u);
        }

        objc_msgSend(p_isa, "_clearLegacyCachedContent");
        objc_msgSend(p_isa, "clearContents");
        goto LABEL_24;
      }
      if (v29)
        goto LABEL_21;
    }
    else
    {
      v30 = p_isa + 3;
      if (objc_msgSend(p_isa[3], "count"))
        goto LABEL_16;
    }
LABEL_24:

LABEL_25:
    v17 = p_isa;
    goto LABEL_26;
  }
  v17 = 0;
LABEL_26:

  return v17;
}

- (id)contents
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  -[TPKEligibleContentsMonitoringController currentContent](self, "currentContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TPKEligibleContentsMonitoringController currentContent](self, "currentContent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    -[TPKEligibleContentsMonitoringController eligibleContents](self, "eligibleContents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[TPKEligibleContentsMonitoringController eligibleContents](self, "eligibleContents");
      return (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
}

- (void)updateCurrentContentCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[TPKEligibleContentsMonitoringController setCurrentContent:](self, "setCurrentContent:", v4);
  v5 = (void *)objc_opt_class();
  -[TPKEligibleContentsMonitoringController context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_currentContentIdentifierForContext:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEB7D90], "archivedDataWithRootObject:forKey:", v4, v7);
}

- (void)updateEligibleContentsCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[TPKEligibleContentsMonitoringController setEligibleContents:](self, "setEligibleContents:", v4);
  v5 = (void *)objc_opt_class();
  -[TPKEligibleContentsMonitoringController context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_eligibleContentsIdentifierForContext:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEB7D90], "archivedDataWithRootObject:forKey:", v4, v7);
}

- (id)clientContextMatchingResultsForContents:(id)a3 clientContextKeys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  TPKEligibleContentsMonitoringController *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void (**v16)(void *, uint64_t, void *);
  void *v17;
  char v18;
  char v19;
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
  void *v31;
  uint64_t v32;
  void *v33;
  void *v35;
  id obj;
  void *v37;
  _QWORD aBlock[5];
  id v39;
  id v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPKEligibleContentsMonitoringController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self;
  v35 = v7;
  objc_msgSend(v8, "eligibleContentsMonitoringController:clientContextMapForKeys:", self, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v6;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v43;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v14);
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 3221225472;
        aBlock[2] = __101__TPKEligibleContentsMonitoringController_clientContextMatchingResultsForContents_clientContextKeys___block_invoke;
        aBlock[3] = &unk_2519C0088;
        aBlock[4] = v9;
        v39 = v10;
        v40 = v37;
        v41 = v15;
        v16 = (void (**)(void *, uint64_t, void *))_Block_copy(aBlock);
        objc_msgSend(v15, "monitoringEvents");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v15, "monitoringEventOptionsForCurrentState");
        v19 = v18;
        if ((v18 & 8) != 0)
        {
          objc_msgSend(v17, "restartTrackingTriggerEventMap");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "clientContextEventsForMap:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v16[2](v16, 8, v23);

          if ((v19 & 1) == 0)
          {
LABEL_8:
            if ((v19 & 2) == 0)
              goto LABEL_9;
            goto LABEL_17;
          }
        }
        else if ((v18 & 1) == 0)
        {
          goto LABEL_8;
        }
        objc_msgSend(v17, "initialDisplayEventMap");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "clientContextEventsForMap:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v16[2](v16, 1, v25);

        if ((v19 & 2) == 0)
        {
LABEL_9:
          if ((v19 & 4) == 0)
            goto LABEL_10;
          goto LABEL_18;
        }
LABEL_17:
        objc_msgSend(v17, "displayEventMap");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "clientContextEventsForMap:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v16[2](v16, 2, v27);

        if ((v19 & 4) == 0)
        {
LABEL_10:
          if ((v19 & 0x10) == 0)
            goto LABEL_11;
          goto LABEL_19;
        }
LABEL_18:
        objc_msgSend(v17, "restartTrackingDisplayEventMap");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "clientContextEventsForMap:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v16[2](v16, 4, v29);

        if ((v19 & 0x10) == 0)
        {
LABEL_11:
          if ((v19 & 0x20) == 0)
            goto LABEL_13;
LABEL_12:
          objc_msgSend(v17, "desiredOutcomeEventMap");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "clientContextEventsForMap:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v16[2](v16, 32, v21);

          goto LABEL_13;
        }
LABEL_19:
        objc_msgSend(v17, "dismissalEventMap");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "clientContextEventsForMap:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v16[2](v16, 16, v31);

        if ((v19 & 0x20) != 0)
          goto LABEL_12;
LABEL_13:

        ++v14;
      }
      while (v12 != v14);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      v12 = v32;
    }
    while (v32);
  }

  v33 = (void *)objc_msgSend(v37, "copy");
  return v33;
}

void __101__TPKEligibleContentsMonitoringController_clientContextMatchingResultsForContents_clientContextKeys___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "count")
    && objc_msgSend(*(id *)(a1 + 32), "conditionsMatchForClientContextEvents:clientContextMap:", v8, *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v6 | a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v7, *(_QWORD *)(a1 + 56));

  }
}

- (void)didDisplayContent:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[TPKEligibleContentsMonitoringController currentContent](self, "currentContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if (v6)
  {
    -[TPKEligibleContentsMonitoringController currentContent](self, "currentContent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "state");

    if (v8 != 4)
    {
      -[TPKEligibleContentsMonitoringController currentContent](self, "currentContent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "updateState:", 4);

      -[TPKEligibleContentsMonitoringController currentContent](self, "currentContent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPKEligibleContentsMonitoringController updateCurrentContentCache:](self, "updateCurrentContentCache:", v10);

      -[TPKEligibleContentsMonitoringController updateRegistrableEventsForCallbackIfNeeded](self, "updateRegistrableEventsForCallbackIfNeeded");
    }
    -[TPKEligibleContentsMonitoringController currentContent](self, "currentContent");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "incrementDisplaycount");

  }
}

- (void)manualDismissContent:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  -[TPKEligibleContentsMonitoringController currentContent](self, "currentContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if (v6)
    -[TPKEligibleContentsMonitoringController clearContents](self, "clearContents");
}

- (void)updateEligibilityWithContents:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v27 = a3;
  -[TPKEligibleContentsMonitoringController eligibleContents](self, "eligibleContents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v27;
  v6 = objc_msgSend(v4, "isEqual:", v27);

  if ((v6 & 1) != 0)
    goto LABEL_24;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy_;
  v47 = __Block_byref_object_dispose_;
  v48 = 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v27, "count"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v27)
    goto LABEL_20;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v7 = v27;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  if (!v8)
    goto LABEL_17;
  v9 = *(_QWORD *)v40;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v40 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
      objc_msgSend(v11, "identifier", v25);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPKEligibleContentsMonitoringController currentContent](self, "currentContent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v12, "isEqualToString:", v14);

      if (v15)
      {
        -[TPKEligibleContentsMonitoringController currentContent](self, "currentContent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[TPKEligibleContentsMonitoringController eligibleContents](self, "eligibleContents");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "indexOfObject:", v11);

        if (v18 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v16 = 0;
          goto LABEL_15;
        }
        -[TPKEligibleContentsMonitoringController eligibleContents](self, "eligibleContents");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndexedSubscript:", v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if (v16)
      {
        objc_msgSend(v11, "updateState:", objc_msgSend(v16, "state"));
        objc_msgSend(v11, "updateDisplayCount:", objc_msgSend(v16, "displayCount"));
      }
LABEL_15:

    }
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  }
  while (v8);
LABEL_17:

  -[TPKEligibleContentsMonitoringController clientContextKeysForCurrentStateInContents:](self, "clientContextKeysForCurrentStateInContents:", v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPKEligibleContentsMonitoringController clientContextMatchingResultsForContents:clientContextKeys:](self, "clientContextMatchingResultsForContents:clientContextKeys:", v7, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v38 = (id)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __73__TPKEligibleContentsMonitoringController_updateEligibilityWithContents___block_invoke;
  v28[3] = &unk_2519C00B0;
  v22 = v21;
  v29 = v22;
  v31 = &v33;
  v32 = &v43;
  v30 = v25;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v28);
  if (objc_msgSend((id)v34[5], "count"))
  {
    -[TPKEligibleContentsMonitoringController delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "eligibleContentsMonitoringController:restartTrackingForContents:", self, v34[5]);

  }
  _Block_object_dispose(&v33, 8);

LABEL_20:
  if (v44[5])
  {
    -[TPKEligibleContentsMonitoringController updateCurrentContentCache:](self, "updateCurrentContentCache:");
  }
  else
  {
    v24 = (void *)objc_msgSend(v25, "copy");
    -[TPKEligibleContentsMonitoringController updateEligibleContentsCache:](self, "updateEligibleContentsCache:", v24);

  }
  -[TPKEligibleContentsMonitoringController updateRegistrableEventsForCallbackIfNeeded](self, "updateRegistrableEventsForCallbackIfNeeded", v25);

  _Block_object_dispose(&v43, 8);
  v5 = v27;
LABEL_24:

}

void __73__TPKEligibleContentsMonitoringController_updateEligibilityWithContents___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v7 = a2;
  objc_msgSend(v7, "monitoringEvents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  v17 = v7;
  v11 = objc_msgSend(v17, "state");
  if (v11 == 2)
  {
    v15 = 2;
    if (!objc_msgSend(v8, "hasRegistrableContextualEventsForEventOptions:", 2))
      v15 = 3;
    if (objc_msgSend(v8, "hasClientContextKeysForEventOptions:", 2))
    {
      v12 = v17;
      goto LABEL_25;
    }
  }
  else
  {
    if (v11 != 1)
    {
      v12 = v17;
      v13 = v17;
      if (v11)
        goto LABEL_28;
      if ((v10 & 8) != 0)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v17);

        v12 = v17;
        v13 = 0;
        goto LABEL_28;
      }
      objc_msgSend(v8, "initialDisplayEventMap");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 && (v10 & 1) == 0)
      {
        v15 = 1;
        if (!v17)
          goto LABEL_30;
        goto LABEL_22;
      }
      objc_msgSend(v8, "displayEventMap");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v17;
      v13 = v17;
      if (!v16)
      {
LABEL_28:
        objc_msgSend(v12, "updateState:", 3);
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
        *a4 = 1;
        goto LABEL_29;
      }
LABEL_25:
      v13 = v12;
      if ((v10 & 2) == 0)
      {
        v15 = 2;
        if (!v12)
          goto LABEL_30;
        goto LABEL_22;
      }
      goto LABEL_28;
    }
    if (objc_msgSend(v8, "hasRegistrableContextualEventsForEventOptions:", 1))
      v15 = 1;
    else
      v15 = 3;
    if (objc_msgSend(v8, "hasClientContextKeysForEventOptions:", 1))
    {
      v12 = v17;
      v13 = v17;
      if ((v10 & 1) == 0)
      {
        v15 = 1;
        if (!v17)
          goto LABEL_30;
        goto LABEL_22;
      }
      goto LABEL_28;
    }
  }
  v12 = v17;
  v13 = v17;
  if (v15 == 3)
    goto LABEL_28;
  if (v17)
  {
LABEL_22:
    objc_msgSend(v17, "updateState:", v15);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v17);
    v13 = v17;
LABEL_29:

  }
LABEL_30:

}

- (void)invalidateClientContextIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  const char *v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t v22[16];
  _QWORD v23[4];
  id v24;
  TPKEligibleContentsMonitoringController *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x24BDAC8D0];
  -[TPKEligibleContentsMonitoringController contents](self, "contents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
    goto LABEL_36;
  -[TPKEligibleContentsMonitoringController clientContextKeysForCurrentStateInContents:](self, "clientContextKeysForCurrentStateInContents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPKEligibleContentsMonitoringController clientContextMatchingResultsForContents:clientContextKeys:](self, "clientContextMatchingResultsForContents:clientContextKeys:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy_;
  v48 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v49 = (id)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy_;
  v42 = __Block_byref_object_dispose_;
  v43 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __74__TPKEligibleContentsMonitoringController_invalidateClientContextIfNeeded__block_invoke;
  v23[3] = &unk_2519C00D8;
  v6 = v5;
  v26 = &v44;
  v27 = &v34;
  v28 = &v30;
  v29 = &v38;
  v24 = v6;
  v25 = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v23);
  if (v39[5])
  {
    if (v35[3] == 3)
    {
      -[TPKEligibleContentsMonitoringController currentContent](self, "currentContent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7 == 0;

      if (!v8)
      {
        objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v22 = 0;
          v10 = "Abnormal status in current content, don't update.";
LABEL_17:
          _os_log_impl(&dword_248A67000, v9, OS_LOG_TYPE_DEFAULT, v10, v22, 2u);
          goto LABEL_18;
        }
        goto LABEL_18;
      }
      v11 = (id)v39[5];
    }
    else
    {
      if (!v31[3])
      {
        -[TPKEligibleContentsMonitoringController eligibleContents](self, "eligibleContents");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v12 = v3;
          v11 = 0;
LABEL_20:
          v13 = 0;
          goto LABEL_23;
        }
        v17 = (id)v39[5];
LABEL_19:
        v11 = v17;
        v12 = 0;
        goto LABEL_20;
      }
      -[TPKEligibleContentsMonitoringController currentContent](self, "currentContent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqual:", v39[5]);

      if (!v15)
      {
        objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v22 = 0;
          v10 = "Abnormal status in eligible contents array, don't update.";
          goto LABEL_17;
        }
LABEL_18:

        -[TPKEligibleContentsMonitoringController currentContent](self, "currentContent");
        v17 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
      if (v31[3] == 8)
      {
        v50[0] = v39[5];
        v13 = 1;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 1);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v11 = 0;
LABEL_23:
        -[TPKEligibleContentsMonitoringController updateCurrentContentCache:](self, "updateCurrentContentCache:", v11, *(_QWORD *)v22);
        -[TPKEligibleContentsMonitoringController updateEligibleContentsCache:](self, "updateEligibleContentsCache:", v12);
        goto LABEL_24;
      }
      v11 = 0;
    }
    v12 = 0;
    v13 = 1;
    goto LABEL_23;
  }
  v11 = 0;
  v12 = 0;
  v13 = 0;
LABEL_24:
  if (objc_msgSend((id)v45[5], "count"))
  {
    if ((v13 & 1) == 0)
    {
      -[TPKEligibleContentsMonitoringController eligibleContents](self, "eligibleContents");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v18, "mutableCopy");

      objc_msgSend(v19, "removeObjectsInArray:", v45[5]);
      if (!objc_msgSend(v19, "count"))
      {

        v19 = 0;
      }
      -[TPKEligibleContentsMonitoringController updateEligibleContentsCache:](self, "updateEligibleContentsCache:", v19);

    }
    -[TPKEligibleContentsMonitoringController delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "eligibleContentsMonitoringController:restartTrackingForContents:", self, v45[5]);

  }
  -[TPKEligibleContentsMonitoringController updateRegistrableEventsForCallbackIfNeeded](self, "updateRegistrableEventsForCallbackIfNeeded");
  if (v13)
  {
    if (v31[3])
    {
      -[TPKEligibleContentsMonitoringController delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "eligibleContentsMonitoringController:shouldDismissContent:reason:", self, v39[5], v31[3]);
    }
    else
    {
      -[TPKEligibleContentsMonitoringController delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "eligibleContentsMonitoringController:shouldDisplayContent:animated:", self, v39[5], 0);
    }

  }
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
LABEL_36:

}

void __74__TPKEligibleContentsMonitoringController_invalidateClientContextIfNeeded__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  id *v26;
  uint64_t v27;
  void *v28;
  int v29;
  NSObject *v30;
  uint8_t v31[16];
  uint8_t v32[16];
  uint8_t v33[16];
  uint8_t v34[16];
  uint8_t buf[16];

  v7 = a2;
  objc_msgSend(v7, "monitoringEvents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  switch(objc_msgSend(v7, "state"))
  {
    case 0:
      if ((v10 & 8) == 0)
      {
        objc_msgSend(v8, "initialDisplayEventMap");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 && (v10 & 1) == 0)
        {
          v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v13 = 1;
          goto LABEL_34;
        }
        objc_msgSend(v8, "displayEventMap");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        if (v22 && (v10 & 2) == 0)
        {
          v13 = 2;
          goto LABEL_34;
        }
        goto LABEL_12;
      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v7);
      goto LABEL_35;
    case 1:
      objc_msgSend(v8, "initialDisplayEventMap");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14 || (v10 & 1) != 0)
        goto LABEL_11;
      goto LABEL_35;
    case 2:
      objc_msgSend(v8, "displayEventMap");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15 || (v10 & 2) != 0)
      {
LABEL_11:
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
LABEL_12:
        v13 = 3;
        goto LABEL_34;
      }
      goto LABEL_35;
    case 4:
      if ((v10 & 0x20) != 0)
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 5;
        objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_248A67000, v16, OS_LOG_TYPE_DEFAULT, "Desired outcome performed.", buf, 2u);
        }

        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 6;
        if ((v10 & 0x10) == 0)
        {
LABEL_15:
          if ((v10 & 4) == 0)
            goto LABEL_35;
          goto LABEL_24;
        }
      }
      else if ((v10 & 0x10) == 0)
      {
        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_248A67000, v17, OS_LOG_TYPE_DEFAULT, "Dismissal event performed.", v34, 2u);
      }

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 5;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 7;
      if ((v10 & 4) == 0)
        goto LABEL_35;
LABEL_24:
      objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_248A67000, v18, OS_LOG_TYPE_DEFAULT, "Restart tracking event performed.", v33, 2u);
      }

      objc_msgSend(v7, "monitoringEvents");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "displayEventMap");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

      if (v21)
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 2;
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v13 = 8;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v32 = 0;
          _os_log_impl(&dword_248A67000, v23, OS_LOG_TYPE_DEFAULT, "No displayEvents found to restart tracking.", v32, 2u);
        }

        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 5;
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v13 = 7;
      }
LABEL_34:
      *(_QWORD *)(v12 + 24) = v13;
LABEL_35:
      v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      if (v24 && v24 != objc_msgSend(v7, "state"))
      {
        objc_msgSend(v7, "updateState:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
        v25 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v27 = *(_QWORD *)(v25 + 40);
        v26 = (id *)(v25 + 40);
        if (!v27)
          objc_storeStrong(v26, a2);
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
        {
          objc_msgSend(*(id *)(a1 + 40), "currentContent");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "isEqual:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

          if (v29)
          {
            *a4 = 1;
          }
          else
          {
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
            objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v31 = 0;
              _os_log_impl(&dword_248A67000, v30, OS_LOG_TYPE_DEFAULT, "Abnormal status in eligible contents array.", v31, 2u);
            }

          }
        }
      }

      return;
    default:
      goto LABEL_35;
  }
}

- (void)clearContents
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_248A67000, v3, OS_LOG_TYPE_DEFAULT, "Clearing all cached contents", v6, 2u);
  }

  -[TPKEligibleContentsMonitoringController currentContent](self, "currentContent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else
  {
    -[TPKEligibleContentsMonitoringController eligibleContents](self, "eligibleContents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      return;
  }
  -[TPKEligibleContentsMonitoringController updateCurrentContentCache:](self, "updateCurrentContentCache:", 0);
  -[TPKEligibleContentsMonitoringController updateEligibleContentsCache:](self, "updateEligibleContentsCache:", 0);
  -[TPKEligibleContentsMonitoringController updateRegistrableEventsForCallbackIfNeeded](self, "updateRegistrableEventsForCallbackIfNeeded");
}

- (void)_clearLegacyCachedContent
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_opt_class();
  -[TPKEligibleContentsMonitoringController context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_legacyIdentifierForContext:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEB7D90], "archivedDataWithRootObject:forKey:", 0, v5);
}

- (id)clientContextKeysForCurrentStateInContents:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "monitoringEventOptionsForCurrentState", (_QWORD)v16);
        objc_msgSend(v10, "monitoringEvents");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "clientContextKeysForEventOptions:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v4, "addObjectsFromArray:", v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)conditionsMatchForClientContextEvents:(id)a3 clientContextMap:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  BOOL v23;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v32;
    v25 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        objc_msgSend(v12, "conditions", v25);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v28;
          v26 = v9;
          while (2)
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v28 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
              objc_msgSend(v18, "key");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "objectForKeyedSubscript:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              if (v20)
              {
                objc_msgSend(v18, "value");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v21, "isEqual:", v20);

                if (v22)
                  continue;
              }

              v23 = 0;
              goto LABEL_20;
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            v10 = v25;
            v9 = v26;
            if (v15)
              continue;
            break;
          }
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      v23 = 1;
    }
    while (v9);
  }
  else
  {
    v23 = 1;
  }
LABEL_20:

  return v23;
}

- (void)updateRegistrableEventsForCallbackIfNeeded
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[TPKEligibleContentsMonitoringController deregisterAllEventsForCallback](self, "deregisterAllEventsForCallback");
  -[TPKEligibleContentsMonitoringController contents](self, "contents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v19;
    *(_QWORD *)&v5 = 138412290;
    v17 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "monitoringEventOptionsForCurrentState", v17);
        objc_msgSend(v9, "monitoringEvents");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "registrableContextualEventsForEventOptions:type:", v10, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "count"))
        {
          objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            v23 = v3;
            _os_log_impl(&dword_248A67000, v13, OS_LOG_TYPE_DEFAULT, "Registering duet callback for events for contents: %@", buf, 0xCu);
          }

        }
        objc_msgSend(v9, "monitoringEvents");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "registrableContextualEventsForEventOptions:type:", v10, 3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v15, "count"))
        {
          objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            v23 = v3;
            _os_log_impl(&dword_248A67000, v16, OS_LOG_TYPE_DEFAULT, "Registering biome callback for events for contents: %@", buf, 0xCu);
          }

        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v6);
  }

}

- (void)dataProvider:(id)a3 didReceiveCallbackWithResult:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  TPKEligibleContentsMonitoringController *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v7;
    _os_log_impl(&dword_248A67000, v8, OS_LOG_TYPE_DEFAULT, "didReceiveCallbackWithResult: %@", buf, 0xCu);
  }

  -[TPKEligibleContentsMonitoringController contents](self, "contents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __85__TPKEligibleContentsMonitoringController_dataProvider_didReceiveCallbackWithResult___block_invoke;
  v11[3] = &unk_2519C0150;
  v10 = v7;
  v12 = v10;
  v13 = self;
  objc_copyWeak(&v14, (id *)buf);
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v11);
  objc_destroyWeak(&v14);

  objc_destroyWeak((id *)buf);
}

void __85__TPKEligibleContentsMonitoringController_dataProvider_didReceiveCallbackWithResult___block_invoke(id *a1, void *a2, uint64_t a3, char *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char v12;
  id *v13;
  id *v14;
  NSObject *v15;
  _QWORD *v16;
  void *v17;
  int v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _BOOL4 v26;
  id v27;
  id v28;
  _QWORD v29[4];
  _QWORD v30[2];
  id v31[2];
  uint8_t buf[16];
  _QWORD v33[4];
  id v34;
  id v35;

  v6 = a2;
  objc_msgSend(a1[4], "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "monitoringEventOptionsMatchedWithRegistrableEventIdentifier:", v7);

  if (v8)
  {
    v9 = objc_msgSend(v6, "state");
    if ((unint64_t)(v9 - 1) < 2)
    {
      objc_msgSend(a1[5], "currentContent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        if (objc_msgSend(v6, "state") != 1 || (v8 & 1) == 0)
        {
          v11 = objc_msgSend(v6, "state");
          v12 = 0;
          if (v11 != 2 || (v8 & 2) == 0)
            goto LABEL_31;
        }
        v33[0] = MEMORY[0x24BDAC760];
        v33[1] = 3221225472;
        v33[2] = __85__TPKEligibleContentsMonitoringController_dataProvider_didReceiveCallbackWithResult___block_invoke_2;
        v33[3] = &unk_2519C0100;
        v13 = &v35;
        objc_copyWeak(&v35, a1 + 6);
        v14 = &v34;
        v34 = v6;
        v15 = MEMORY[0x24BDAC9B8];
        v16 = v33;
        goto LABEL_30;
      }
LABEL_14:
      v12 = 0;
LABEL_31:
      *a4 = v12;
      goto LABEL_32;
    }
    if (v9 != 4)
      goto LABEL_14;
    objc_msgSend(a1[5], "currentContent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v6, "isEqual:", v17);

    if (!v18)
      goto LABEL_14;
    if ((v8 & 0x20) != 0)
    {
      objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_248A67000, v19, OS_LOG_TYPE_DEFAULT, "Desired outcome performed.", buf, 2u);
      }
      v20 = 5;
      v21 = 6;
      goto LABEL_29;
    }
    if ((v8 & 0x10) != 0)
    {
      objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v22 = "Dismissal event performed.";
LABEL_20:
        _os_log_impl(&dword_248A67000, v19, OS_LOG_TYPE_DEFAULT, v22, buf, 2u);
      }
    }
    else
    {
      if ((v8 & 4) == 0)
        goto LABEL_14;
      objc_msgSend(v6, "monitoringEvents");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "displayEventMap");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count");

      objc_msgSend(MEMORY[0x24BEB7D68], "tipkit");
      v19 = objc_claimAutoreleasedReturnValue();
      v26 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      if (v25)
      {
        if (v26)
        {
          *(_WORD *)buf = 0;
          v20 = 2;
          _os_log_impl(&dword_248A67000, v19, OS_LOG_TYPE_DEFAULT, "Restart tracking event performed.", buf, 2u);
        }
        else
        {
          v20 = 2;
        }
        v21 = 8;
        goto LABEL_29;
      }
      if (v26)
      {
        *(_WORD *)buf = 0;
        v22 = "No displayEvents found to restart tracking.";
        goto LABEL_20;
      }
    }
    v20 = 5;
    v21 = 7;
LABEL_29:

    objc_msgSend(v6, "updateState:", v20);
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __85__TPKEligibleContentsMonitoringController_dataProvider_didReceiveCallbackWithResult___block_invoke_22;
    v29[3] = &unk_2519C0128;
    v13 = v31;
    objc_copyWeak(v31, a1 + 6);
    v14 = (id *)v30;
    v27 = v6;
    v31[1] = (id)v21;
    v28 = a1[5];
    v30[0] = v27;
    v30[1] = v28;
    v15 = MEMORY[0x24BDAC9B8];
    v16 = v29;
LABEL_30:
    dispatch_async(v15, v16);

    objc_destroyWeak(v13);
    v12 = 1;
    goto LABEL_31;
  }
LABEL_32:

}

void __85__TPKEligibleContentsMonitoringController_dataProvider_didReceiveCallbackWithResult___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "updateState:", 3);
  objc_msgSend(WeakRetained, "updateCurrentContentCache:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateEligibleContentsCache:", 0);
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eligibleContentsMonitoringController:shouldDisplayContent:animated:", WeakRetained, *(_QWORD *)(a1 + 32), 1);

}

void __85__TPKEligibleContentsMonitoringController_dataProvider_didReceiveCallbackWithResult___block_invoke_22(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eligibleContentsMonitoringController:shouldDismissContent:reason:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 40), "updateCurrentContentCache:", 0);
  if (*(_QWORD *)(a1 + 56) == 8)
  {
    v5[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "updateEligibleContentsCache:", v4);

  }
  objc_msgSend(*(id *)(a1 + 40), "updateRegistrableEventsForCallbackIfNeeded");

}

- (TPKEligibleContentsMonitoringControllerDelegate)delegate
{
  return (TPKEligibleContentsMonitoringControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TPKContent)currentContent
{
  return self->_currentContent;
}

- (void)setCurrentContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)eligibleContents
{
  return self->_eligibleContents;
}

- (void)setEligibleContents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_eligibleContents, 0);
  objc_storeStrong((id *)&self->_currentContent, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
