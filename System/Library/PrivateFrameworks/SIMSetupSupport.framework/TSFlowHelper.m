@implementation TSFlowHelper

+ (id)unregisteredSelectedPlanItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  id v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[TSIDSSubscriptionSelector activeIMessageSlots](TSIDSSubscriptionSelector, "activeIMessageSlots");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "count"))
  {
    v25 = 0uLL;
    v26 = 0uLL;
    v23 = 0uLL;
    v24 = 0uLL;
    v21 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if ((objc_msgSend(v11, "isInstalling", v21) & 1) == 0)
          {
            if (!objc_msgSend(v11, "isSelected"))
              continue;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "_slotForPlanItem:", v11));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v22, "containsObject:", v12);

            if ((v13 & 1) != 0)
              continue;
          }
          objc_msgSend(v5, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v8);
    }

    _TSLogDomain();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      +[TSFlowHelper unregisteredSelectedPlanItems:].cold.1();
    v4 = v21;
  }
  else
  {
    v29 = 0uLL;
    v30 = 0uLL;
    v27 = 0uLL;
    v28 = 0uLL;
    v14 = v4;
    v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v28 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
          if (objc_msgSend(v19, "isSelected"))
            objc_msgSend(v5, "addObject:", v19);
        }
        v16 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v16);
    }
  }

  return v5;
}

+ (void)registerIMessageWithPlanItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "_slotForPlanItem:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  +[TSIDSSubscriptionSelector registerSlotsForIMessage:](TSIDSSubscriptionSelector, "registerSlotsForIMessage:", v5);
  _TSLogDomain();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    +[TSFlowHelper registerIMessageWithPlanItems:].cold.1();

}

+ (BOOL)hasTransferablePlanWithSameCarrierName:(id)a3 transferablePlans:(id)a4 inBuddy:(BOOL)a5 matchingSODACarrierWebsheetTransferPlanIndex:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  uint64_t v25;
  BOOL v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v30;
  const __CFString *v31;
  _BOOL4 v32;
  void *v33;
  id v34;
  char *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  const char *v45;
  _BYTE v46[128];
  uint64_t v47;

  v7 = a5;
  v47 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (!v9
    || (objc_msgSend(v9, "plans"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "count"),
        v12,
        !v13))
  {
    v26 = 0;
    goto LABEL_27;
  }
  objc_msgSend(v9, "plans");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "carrierName");
  v35 = (char *)objc_claimAutoreleasedReturnValue();

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v16 = v10;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (!v17)
  {
    v26 = 0;
    goto LABEL_26;
  }
  v18 = v17;
  v32 = v7;
  v33 = v11;
  v34 = v10;
  v19 = *(_QWORD *)v37;
  while (2)
  {
    for (i = 0; i != v18; ++i)
    {
      if (*(_QWORD *)v37 != v19)
        objc_enumerationMutation(v16);
      v21 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("planItem"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "carrierName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = +[TSUtilities isCaseInsensitiveEqual:withString:](TSUtilities, "isCaseInsensitiveEqual:withString:", v35, v23);

      if (v24)
      {
        v25 = objc_msgSend(v16, "indexOfObject:", v21);
        if (objc_msgSend(v22, "isAccountMemberTransferablePlan"))
        {
          _TSLogDomain();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v41 = "+[TSFlowHelper hasTransferablePlanWithSameCarrierName:transferablePlans:inBuddy:matchingSODACarrierWeb"
                  "sheetTransferPlanIndex:]";
            _os_log_impl(&dword_21B647000, v27, OS_LOG_TYPE_DEFAULT, "Account member has a transferrable plan with a SODA tether @%s", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v25);
          v28 = objc_claimAutoreleasedReturnValue();
          v11 = v33;
          objc_msgSend(v33, "addObject:", v28);
          v26 = 0;
        }
        else
        {
          if (!objc_msgSend(v22, "isOneClickTransferablePlan"))
          {
            if (!objc_msgSend(v22, "isWebsheetTransferablePlan"))
              goto LABEL_12;
            _TSLogDomain();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              v31 = CFSTR("post buddy");
              if (v32)
                v31 = CFSTR("in buddy");
              *(_DWORD *)buf = 138412802;
              v41 = v35;
              v42 = 2112;
              v43 = (const char *)v31;
              v44 = 2080;
              v45 = "+[TSFlowHelper hasTransferablePlanWithSameCarrierName:transferablePlans:inBuddy:matchingSODACarrierW"
                    "ebsheetTransferPlanIndex:]";
              _os_log_impl(&dword_21B647000, v30, OS_LOG_TYPE_DEFAULT, "Websheet transferrable plan exists with same carrier name [%@] %@ @%s", buf, 0x20u);
            }

            v10 = v34;
            if (!v32)
            {
              v26 = 1;
              v11 = v33;
              goto LABEL_25;
            }
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v25);
            v28 = objc_claimAutoreleasedReturnValue();
            v11 = v33;
            objc_msgSend(v33, "addObject:", v28);
            v26 = 0;
LABEL_24:

LABEL_25:
            goto LABEL_26;
          }
          _TSLogDomain();
          v28 = objc_claimAutoreleasedReturnValue();
          v11 = v33;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v41 = v35;
            v42 = 2080;
            v43 = "+[TSFlowHelper hasTransferablePlanWithSameCarrierName:transferablePlans:inBuddy:matchingSODACarrierWeb"
                  "sheetTransferPlanIndex:]";
            _os_log_impl(&dword_21B647000, v28, OS_LOG_TYPE_DEFAULT, "One click transferrable plan exists with same carrier name [%@] @%s", buf, 0x16u);
          }
          v26 = 1;
        }
        v10 = v34;
        goto LABEL_24;
      }
LABEL_12:

    }
    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    if (v18)
      continue;
    break;
  }
  v26 = 0;
  v10 = v34;
  v11 = v33;
LABEL_26:

LABEL_27:
  return v26;
}

+ (id)getAccountMemberTransferablePlanWithSameCarrierName:(id)a3 transferablePlans:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  const char *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "plans");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v26 = v5;
      objc_msgSend(v5, "plans");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "carrierName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v25 = v6;
      v12 = v6;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v29 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("planItem"), v25);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "carrierName");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v11, "caseInsensitiveCompare:", v19);

            if (!v20)
            {
              v21 = objc_msgSend(v12, "indexOfObject:", v17);
              if (objc_msgSend(v18, "isAccountMemberTransferablePlan"))
              {
                _TSLogDomain();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  v33 = "+[TSFlowHelper getAccountMemberTransferablePlanWithSameCarrierName:transferablePlans:]";
                  _os_log_impl(&dword_21B647000, v22, OS_LOG_TYPE_DEFAULT, "Account member has a transferrable plan with a SODA tether @%s", buf, 0xCu);
                }

                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v21);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "addObject:", v23);

              }
            }

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        }
        while (v14);
      }

      v6 = v25;
      v5 = v26;
    }
  }

  return v27;
}

+ (int64_t)_slotForPlanItem:(id)a3
{
  void *v3;
  int v4;

  objc_msgSend(a3, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if (v4 >= 0)
    return 1;
  else
    return 2;
}

+ (BOOL)handleStartOverAgainstNoPlan:(id)a3 navigationController:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  TSCellularPlanIntroViewController *v10;
  TSSubFlowViewController *v11;
  void *v12;
  TSSubFlowViewController *v13;
  TSCellularPlanIntroViewController *v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  _QWORD v19[4];
  TSSubFlowViewController *v20;
  id v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = (TSCellularPlanIntroViewController *)v7;
    if (-[TSCellularPlanIntroViewController entryPoint](v10, "entryPoint") == 2)
    {
      v11 = [TSSubFlowViewController alloc];
      v22[0] = CFSTR("FlowTypeKey");
      v22[1] = CFSTR("IsFirstViewKey");
      v23[0] = &unk_24DF238A8;
      v23[1] = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[TSSubFlowViewController initWithOptions:navigationController:](v11, "initWithOptions:navigationController:", v12, v8);

      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __77__TSFlowHelper_handleStartOverAgainstNoPlan_navigationController_completion___block_invoke;
      v19[3] = &unk_24DEF3988;
      v20 = v13;
      v21 = v9;
      v14 = v13;
      -[TSCellularPlanIntroViewController prepare:](v14, "prepare:", v19);

    }
    else
    {
      if (-[TSCellularPlanIntroViewController entryPoint](v10, "entryPoint") != 1)
      {
        (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
        goto LABEL_16;
      }
      v16 = _os_feature_enabled_impl();
      if (+[TSUtilities isPad](TSUtilities, "isPad"))
        v16 = _os_feature_enabled_impl();
      v14 = -[TSCellularPlanIntroViewController initWithShowTransferOption:requireDelayBluetoothConnection:]([TSCellularPlanIntroViewController alloc], "initWithShowTransferOption:requireDelayBluetoothConnection:", v16, 0);
      (*((void (**)(id, TSCellularPlanIntroViewController *))v9 + 2))(v9, v14);
    }

LABEL_16:
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v7, "entryPoint") != 1)
    {
LABEL_17:
      v17 = 1;
      goto LABEL_18;
    }
    v15 = _os_feature_enabled_impl();
    if (+[TSUtilities isPad](TSUtilities, "isPad"))
      v15 = _os_feature_enabled_impl();
    v10 = -[TSCellularPlanIntroViewController initWithShowTransferOption:requireDelayBluetoothConnection:]([TSCellularPlanIntroViewController alloc], "initWithShowTransferOption:requireDelayBluetoothConnection:", v15, 0);
    (*((void (**)(id, TSCellularPlanIntroViewController *))v9 + 2))(v9, v10);
    goto LABEL_16;
  }
  v17 = 0;
LABEL_18:

  return v17;
}

uint64_t __77__TSFlowHelper_handleStartOverAgainstNoPlan_navigationController_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (id)sortIndexesInDescending:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "sortUsingComparator:", &__block_literal_global_23);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

uint64_t __40__TSFlowHelper_sortIndexesInDescending___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(a2, "unsignedIntegerValue");
  v6 = objc_msgSend(v4, "unsignedIntegerValue");

  if (v5 <= v6)
    v7 = 0;
  else
    v7 = -1;
  if (v5 < v6)
    return 1;
  else
    return v7;
}

+ (void)unregisteredSelectedPlanItems:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_21B647000, v0, v1, "[Db] %@ @%s", v2, v3, v4, v5, v6);
}

+ (void)registerIMessageWithPlanItems:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_21B647000, v0, v1, "[Db] %@ @%s", v2, v3, v4, v5, v6);
}

@end
