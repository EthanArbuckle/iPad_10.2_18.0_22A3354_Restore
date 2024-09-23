@implementation WFAutomationsSortForUI

uint64_t __WFAutomationsSortForUI_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  BOOL v26;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "trigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trigger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(id *)(a1 + 32);
  v10 = objc_msgSend(v9, "indexOfObject:", objc_opt_class());
  v11 = objc_msgSend(v9, "indexOfObject:", objc_opt_class());

  if (v10 == v11)
  {

    objc_msgSend(v5, "trigger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "trigger");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v5, "trigger");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "trigger");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v7, "event");
        v16 = objc_msgSend(v8, "event");
        if (!(v15 | v16) || v15 == 1 && v16 == 1)
        {
          v17 = objc_msgSend(v7, "timeOffset");
          v18 = objc_msgSend(v8, "timeOffset");
          v19 = -1;
          if (v17 >= v18)
            v19 = 1;
          if (v17 == v18)
            v20 = 0;
          else
            v20 = v19;
          goto LABEL_23;
        }
        if (!v15 && v16)
          goto LABEL_26;
        v26 = v15 != 0;
        v28 = v15 == 1 && v16 != 1;
        if (v16)
          v26 = v28;
        if (v26)
        {
          v20 = 1;
          goto LABEL_23;
        }
        if (v16 == 1 && v15 != 1)
        {
LABEL_26:
          v20 = -1;
          goto LABEL_23;
        }
        objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "time");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "dateFromComponents:", v29);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "time");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "dateFromComponents:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = objc_msgSend(v24, "compare:", v31);
LABEL_22:

        goto LABEL_23;
      }
    }
    else
    {

    }
    objc_msgSend(v5, "trigger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedDescriptionWithConfigurationSummary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trigger");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedDescriptionWithConfigurationSummary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v8, "localizedStandardCompare:", v24);
    goto LABEL_22;
  }
  v21 = -1;
  if (v10 < v11)
    v22 = -1;
  else
    v22 = 1;
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    v21 = v22;
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    v20 = 1;
  else
    v20 = v21;
LABEL_23:

  return v20;
}

@end
