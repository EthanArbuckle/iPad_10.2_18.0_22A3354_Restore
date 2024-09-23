@implementation WRDiagnostic

- (id)initWithDict:(void *)a3 backupName:(uint64_t *)a4 error:
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id *v15;
  id v16;
  id *v17;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  objc_super v29;
  uint64_t v30;

  v7 = a2;
  v8 = a3;
  if (!a1)
  {
    v17 = 0;
    goto LABEL_11;
  }
  v30 = 0;
  if (a4)
    *a4 = 0;
  else
    a4 = &v30;
  v29.receiver = a1;
  v29.super_class = (Class)WRDiagnostic;
  v15 = (id *)objc_msgSendSuper2(&v29, sel_init);
  if (!v15)
  {
    WRMakeError(2, CFSTR("Unable to init"), v9, v10, v11, v12, v13, v14, v28);
    goto LABEL_9;
  }
  WRCheckForBadDiagnosticDict(v7);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  *a4 = (uint64_t)v16;
  if (!v16)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("name"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v15[3];
    v15[3] = (id)v19;

    if (v15[3])
    {
LABEL_13:
      if (-[WRDiagnostic applyDict:error:]((uint64_t)v15, v7, a4))
      {
        -[WRDiagnostic validate](v15);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        *a4 = (uint64_t)v27;
        if (!v27)
        {
          v17 = v15;
          goto LABEL_10;
        }
      }
      goto LABEL_7;
    }
    if (*a4)
      goto LABEL_7;
    if (v8)
    {
      objc_storeStrong(v15 + 3, a3);
      goto LABEL_13;
    }
    WRMakeError(7, CFSTR("Mutiple diagnostic dictionaries in array, but no name: %@"), v21, v22, v23, v24, v25, v26, (uint64_t)v7);
LABEL_9:
    v17 = 0;
    *a4 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_7:
  v17 = 0;
LABEL_10:

LABEL_11:
  return v17;
}

- (uint64_t)applyDict:(uint64_t *)a3 error:
{
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v60;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v60 = 0;
    if (a3)
      *a3 = 0;
    else
      a3 = &v60;
    v7 = CFSTR("trigger_threshold_duration_sum");
    DictGetNumber(v5, CFSTR("trigger_threshold_duration_sum"), a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "doubleValue");
      if (v16 < 0.0)
        goto LABEL_15;
      *(double *)(a1 + 40) = v16;
    }
    else if (*a3)
    {
      goto LABEL_86;
    }

    v7 = CFSTR("trigger_threshold_duration_union");
    DictGetNumber(v6, CFSTR("trigger_threshold_duration_union"), a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v17;
    if (!v17)
    {
      if (*a3)
        goto LABEL_86;
LABEL_13:

      v7 = CFSTR("trigger_threshold_duration_single");
      DictGetNumber(v6, CFSTR("trigger_threshold_duration_single"), a3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v19;
      if (v19)
      {
        objc_msgSend(v19, "doubleValue");
        if (v20 < 0.0)
          goto LABEL_15;
        *(double *)(a1 + 32) = v20;
      }
      else if (*a3)
      {
        goto LABEL_86;
      }

      DictGetNumber(v6, CFSTR("trigger_threshold_count"), a3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
      {
        *(_DWORD *)(a1 + 16) = objc_msgSend(v21, "unsignedIntValue");
      }
      else if (*a3)
      {
        goto LABEL_27;
      }

      v23 = CFSTR("trigger_event_timeout");
      DictGetNumber(v6, CFSTR("trigger_event_timeout"), a3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v24;
      if (v24)
      {
        if (objc_msgSend(v24, "intValue") && objc_msgSend(v9, "intValue") != 1)
          goto LABEL_59;
        *(_BYTE *)(a1 + 8) = objc_msgSend(v9, "BOOLValue");
      }
      else if (*a3)
      {
        goto LABEL_86;
      }

      v23 = CFSTR("gather_tailspin");
      DictGetNumber(v6, CFSTR("gather_tailspin"), a3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v25;
      if (v25)
      {
        if (objc_msgSend(v25, "intValue") && objc_msgSend(v9, "intValue") != 1)
          goto LABEL_59;
        *(_BYTE *)(a1 + 9) = objc_msgSend(v9, "BOOLValue");
      }
      else if (*a3)
      {
        goto LABEL_86;
      }

      v23 = CFSTR("option_tailspin_includes_oslogs");
      DictGetNumber(v6, CFSTR("option_tailspin_includes_oslogs"), a3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v26;
      if (v26)
      {
        if (objc_msgSend(v26, "intValue") && objc_msgSend(v9, "intValue") != 1)
          goto LABEL_59;
        *(_BYTE *)(a1 + 10) = objc_msgSend(v9, "BOOLValue");
      }
      else if (*a3)
      {
        goto LABEL_86;
      }

      v23 = CFSTR("report_spindump_this_thread");
      DictGetNumber(v6, CFSTR("report_spindump_this_thread"), a3);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v27;
      if (v27)
      {
        if (objc_msgSend(v27, "intValue") && objc_msgSend(v9, "intValue") != 1)
          goto LABEL_59;
        *(_BYTE *)(a1 + 11) = objc_msgSend(v9, "BOOLValue");
      }
      else if (*a3)
      {
        goto LABEL_86;
      }

      DictGetString(v6, CFSTR("report_spindump_thread_name"), a3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v28)
      {
        v30 = (id)objc_msgSend(v28, "length");
        if (v30)
          v30 = v29;
        v31 = *(void **)(a1 + 56);
        *(_QWORD *)(a1 + 56) = v30;

      }
      else if (*a3)
      {
        goto LABEL_27;
      }

      v23 = CFSTR("report_spindump_main_thread");
      DictGetNumber(v6, CFSTR("report_spindump_main_thread"), a3);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v32;
      if (v32)
      {
        if (objc_msgSend(v32, "intValue") && objc_msgSend(v9, "intValue") != 1)
          goto LABEL_59;
        *(_BYTE *)(a1 + 12) = objc_msgSend(v9, "BOOLValue");
      }
      else if (*a3)
      {
        goto LABEL_86;
      }

      v23 = CFSTR("report_spindump_this_dispatchqueue");
      DictGetNumber(v6, CFSTR("report_spindump_this_dispatchqueue"), a3);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v33;
      if (!v33)
      {
        if (*a3)
          goto LABEL_86;
        goto LABEL_61;
      }
      if (!objc_msgSend(v33, "intValue") || objc_msgSend(v9, "intValue") == 1)
      {
        *(_BYTE *)(a1 + 13) = objc_msgSend(v9, "BOOLValue");
LABEL_61:

        DictGetString(v6, CFSTR("report_spindump_dispatchqueue_label"), a3);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v40;
        if (v40)
        {
          v42 = (id)objc_msgSend(v40, "length");
          if (v42)
            v42 = v41;
          v43 = *(void **)(a1 + 64);
          *(_QWORD *)(a1 + 64) = v42;

        }
        else if (*a3)
        {
          goto LABEL_27;
        }

        DictGetString(v6, CFSTR("option_report_other_signpost"), a3);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v44;
        if (v44)
        {
          v46 = (id)objc_msgSend(v44, "length");
          if (v46)
            v46 = v45;
          v47 = *(void **)(a1 + 72);
          *(_QWORD *)(a1 + 72) = v46;

          goto LABEL_69;
        }
        if (!*a3)
        {
LABEL_69:

          DictGetString(v6, CFSTR("option_report_other_processes"), a3);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = v48;
          if (v48)
          {
            v50 = (id)objc_msgSend(v48, "length");
            if (v50)
              v50 = v49;
            v51 = *(void **)(a1 + 80);
            *(_QWORD *)(a1 + 80) = v50;

LABEL_73:
            DictGetNumber(v6, CFSTR("option_report_omit_network_bound_intervals"), a3);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = v52;
            if (v52)
            {
              if (!objc_msgSend(v52, "intValue") || objc_msgSend(v9, "intValue") == 1)
              {
                *(_BYTE *)(a1 + 14) = objc_msgSend(v9, "BOOLValue");
LABEL_84:
                a1 = 1;
                goto LABEL_87;
              }
              objc_msgSend(v9, "intValue");
              WRMakeError(8, CFSTR("Bad BOOL for %@: %d"), v53, v54, v55, v56, v57, v58, (uint64_t)CFSTR("option_report_omit_network_bound_intervals"));
              *a3 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
            }
            else if (!*a3)
            {
              goto LABEL_84;
            }
LABEL_86:
            a1 = 0;
            goto LABEL_87;
          }
          if (!*a3)
            goto LABEL_73;
        }
LABEL_27:
        a1 = 0;
        goto LABEL_88;
      }
LABEL_59:
      objc_msgSend(v9, "intValue");
      WRMakeError(8, CFSTR("Bad BOOL for %@: %d"), v34, v35, v36, v37, v38, v39, (uint64_t)v23);
      goto LABEL_16;
    }
    objc_msgSend(v17, "doubleValue");
    if (v18 >= 0.0)
    {
      *(double *)(a1 + 48) = v18;
      goto LABEL_13;
    }
LABEL_15:
    WRMakeError(8, CFSTR("Bad num for %@: %f"), v10, v11, v12, v13, v14, v15, (uint64_t)v7);
LABEL_16:
    a1 = 0;
    *a3 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
LABEL_87:

  }
LABEL_88:

  return a1;
}

- (id)validate
{
  id v1;
  int v2;
  void *v3;
  int v4;
  int v5;
  int v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  __CFString *v56;
  uint64_t v57;
  id v58;
  id v59;

  v1 = a1;
  if (!a1)
    return v1;
  v2 = objc_msgSend(a1, "reportSpindumpForThisThread");
  objc_msgSend(v1, "reportSpindumpForThreadWithName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v4 = 2;
  else
    v4 = 1;
  if (v3)
    v5 = v4;
  else
    v5 = v2;
  v6 = objc_msgSend(v1, "reportSpindumpForMainThread");
  v7 = v5 + v6 + objc_msgSend(v1, "reportSpindumpForThisDispatchQueue");
  objc_msgSend(v1, "reportSpindumpForDispatchQueueWithLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v15 = v7 + 1;
  else
    v15 = v7;
  if (v15 >= 2)
  {
    v16 = CFSTR("reporting multiple spindumps from a single diagnostic");
LABEL_19:
    WRMakeError(8, v16, v9, v10, v11, v12, v13, v14, v57);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (v15 == 1 && (objc_msgSend(v1, "gatherTailspin") & 1) == 0)
  {
    v16 = CFSTR("reporting spindump, but not gathering tailspin");
    goto LABEL_19;
  }
  objc_msgSend(v1, "reportProcessesWithName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
    goto LABEL_23;
  if (!objc_msgSend(v1, "reportSpindumpForThisThread"))
  {
    if (objc_msgSend(v1, "reportSpindumpForThisDispatchQueue"))
    {
      objc_msgSend(v1, "reportProcessesWithName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      WRMakeError(8, CFSTR("Cannot report spindump for this dispatch queue, but in a specified process %@"), v26, v27, v28, v29, v30, v31, (uint64_t)v18);
      goto LABEL_22;
    }
LABEL_23:
    objc_msgSend(v1, "reportSpindumpForThreadWithName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v32;
    if (v32
      && objc_msgSend(v32, "hasPrefix:", CFSTR("^"))
      && objc_msgSend(v18, "hasSuffix:", CFSTR("$")))
    {
      v59 = 0;
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", v18, 0, &v59);
      v40 = v59;
      if (!v33)
      {
        WRMakeError(8, CFSTR("Invalid thread name regex \"%@\": %@"), v34, v35, v36, v37, v38, v39, (uint64_t)v18);
        goto LABEL_42;
      }

    }
    objc_msgSend(v1, "reportSpindumpForDispatchQueueWithLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v41;
    if (v41
      && objc_msgSend(v41, "hasPrefix:", CFSTR("^"))
      && objc_msgSend(v40, "hasSuffix:", CFSTR("$")))
    {
      v58 = 0;
      v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", v40, 0, &v58);
      v49 = v58;
      if (!v42)
      {
        WRMakeError(8, CFSTR("Invalid dispatch queue label regex \"%@\": %@"), v43, v44, v45, v46, v47, v48, (uint64_t)v40);
        v1 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_43;
      }

    }
    if ((objc_msgSend(v1, "gatherTailspin") & 1) != 0)
    {
      if ((objc_msgSend(v1, "hasTriggerThresholdDurationSum") & 1) != 0
        || (objc_msgSend(v1, "hasTriggerThresholdDurationUnion") & 1) != 0
        || (objc_msgSend(v1, "hasTriggerThresholdDurationSingle") & 1) != 0
        || (objc_msgSend(v1, "hasTriggerThresholdCount") & 1) != 0
        || (objc_msgSend(v1, "triggerEventTimeout") & 1) != 0)
      {
        v1 = 0;
LABEL_43:

        goto LABEL_44;
      }
      v56 = CFSTR("no threshold for diagnostic");
    }
    else
    {
      v56 = CFSTR("no diagnostics enabled");
    }
    WRMakeError(3, v56, v50, v51, v52, v53, v54, v55, v57);
LABEL_42:
    v1 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }
  objc_msgSend(v1, "reportProcessesWithName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  WRMakeError(8, CFSTR("Cannot report spindump for this thread, but in a specified process %@"), v19, v20, v21, v22, v23, v24, (uint64_t)v18);
LABEL_22:
  v1 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:

  return v1;
}

+ (id)diagnosticsWithDict:(void *)a3 backupName:(uint64_t *)a4 error:
{
  id v6;
  id v7;
  id *v8;

  v6 = a3;
  v7 = a2;
  objc_opt_self();
  v8 = -[WRDiagnostic initWithDict:backupName:error:]([WRDiagnostic alloc], v7, v6, a4);

  return v8;
}

- (WRDiagnostic)initWithEncodedDict:(id)a3 error:(id *)a4
{
  return (WRDiagnostic *)-[WRDiagnostic initWithDict:backupName:error:](self, a3, 0, (uint64_t *)a4);
}

- (id)encodedDict
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = objc_alloc(MEMORY[0x24BDBCED8]);
  -[WRDiagnostic name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithObjectsAndKeys:", v4, CFSTR("name"), 0);

  if (-[WRDiagnostic hasTriggerThresholdCount](self, "hasTriggerThresholdCount"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[WRDiagnostic triggerThresholdCount](self, "triggerThresholdCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("trigger_threshold_count"));

  }
  if (-[WRDiagnostic hasTriggerThresholdDurationUnion](self, "hasTriggerThresholdDurationUnion"))
  {
    v7 = (void *)MEMORY[0x24BDD16E0];
    -[WRDiagnostic triggerThresholdDurationUnion](self, "triggerThresholdDurationUnion");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("trigger_threshold_duration_union"));

  }
  if (-[WRDiagnostic hasTriggerThresholdDurationUnion](self, "hasTriggerThresholdDurationUnion"))
  {
    v9 = (void *)MEMORY[0x24BDD16E0];
    -[WRDiagnostic triggerThresholdDurationUnion](self, "triggerThresholdDurationUnion");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("trigger_threshold_duration_union"));

  }
  if (-[WRDiagnostic hasTriggerThresholdDurationSingle](self, "hasTriggerThresholdDurationSingle"))
  {
    v11 = (void *)MEMORY[0x24BDD16E0];
    -[WRDiagnostic triggerThresholdDurationSingle](self, "triggerThresholdDurationSingle");
    objc_msgSend(v11, "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("trigger_threshold_duration_single"));

  }
  if (-[WRDiagnostic triggerEventTimeout](self, "triggerEventTimeout"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("trigger_event_timeout"));
  if (-[WRDiagnostic gatherTailspin](self, "gatherTailspin"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("gather_tailspin"));
  if (-[WRDiagnostic tailspinIncludeOSLogs](self, "tailspinIncludeOSLogs"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("option_tailspin_includes_oslogs"));
  if (-[WRDiagnostic reportSpindumpForThisThread](self, "reportSpindumpForThisThread"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("report_spindump_this_thread"));
  -[WRDiagnostic reportSpindumpForThreadWithName](self, "reportSpindumpForThreadWithName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[WRDiagnostic reportSpindumpForThreadWithName](self, "reportSpindumpForThreadWithName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("report_spindump_thread_name"));

  }
  if (-[WRDiagnostic reportSpindumpForMainThread](self, "reportSpindumpForMainThread"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("report_spindump_main_thread"));
  if (-[WRDiagnostic reportSpindumpForThisDispatchQueue](self, "reportSpindumpForThisDispatchQueue"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("report_spindump_this_dispatchqueue"));
  -[WRDiagnostic reportSpindumpForDispatchQueueWithLabel](self, "reportSpindumpForDispatchQueueWithLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[WRDiagnostic reportSpindumpForDispatchQueueWithLabel](self, "reportSpindumpForDispatchQueueWithLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("report_spindump_dispatchqueue_label"));

  }
  -[WRDiagnostic reportOtherSignpostWithName](self, "reportOtherSignpostWithName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[WRDiagnostic reportOtherSignpostWithName](self, "reportOtherSignpostWithName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("option_report_other_signpost"));

  }
  -[WRDiagnostic reportProcessesWithName](self, "reportProcessesWithName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[WRDiagnostic reportProcessesWithName](self, "reportProcessesWithName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("option_report_other_processes"));

  }
  if (-[WRDiagnostic reportOmittingNetworkBoundIntervals](self, "reportOmittingNetworkBoundIntervals"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("option_report_omit_network_bound_intervals"));
  v21 = (void *)objc_msgSend(v5, "copy");

  return v21;
}

- (BOOL)hasAnySpindumpReports
{
  BOOL v3;
  void *v4;
  void *v6;

  if (-[WRDiagnostic reportSpindumpForThisThread](self, "reportSpindumpForThisThread"))
    return 1;
  -[WRDiagnostic reportSpindumpForThreadWithName](self, "reportSpindumpForThreadWithName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    || -[WRDiagnostic reportSpindumpForMainThread](self, "reportSpindumpForMainThread")
    || -[WRDiagnostic reportSpindumpForThisDispatchQueue](self, "reportSpindumpForThisDispatchQueue"))
  {
    v3 = 1;
  }
  else
  {
    -[WRDiagnostic reportSpindumpForDispatchQueueWithLabel](self, "reportSpindumpForDispatchQueueWithLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v6 != 0;

  }
  return v3;
}

- (id)isValidForWorkflow
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t v10;

  if (a1)
  {
    v1 = a1;
    if (objc_msgSend(a1, "hasTriggerThresholdCount"))
    {
      v8 = CFSTR("diagnostic count threshold is invalid for the workflow");
    }
    else if (objc_msgSend(v1, "hasTriggerThresholdDurationSum"))
    {
      v8 = CFSTR("diagnostic interval sum threshold is invalid for the workflow");
    }
    else
    {
      if (!objc_msgSend(v1, "hasTriggerThresholdDurationUnion"))
      {
        -[WRDiagnostic validate](v1);
        a1 = (void *)objc_claimAutoreleasedReturnValue();
        return a1;
      }
      v8 = CFSTR("diagnostic interval union threshold is invalid for the workflow");
    }
    WRMakeError(8, v8, v2, v3, v4, v5, v6, v7, v10);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)isValidForSignpost
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t v10;

  if (a1)
  {
    v1 = a1;
    if (objc_msgSend(a1, "triggerEventTimeout"))
    {
      v8 = CFSTR("diagnostic event timeout threshold is invalid for signposts");
    }
    else
    {
      if (!objc_msgSend(v1, "reportOmittingNetworkBoundIntervals"))
      {
        -[WRDiagnostic validate](v1);
        a1 = (void *)objc_claimAutoreleasedReturnValue();
        return a1;
      }
      v8 = CFSTR("omitting network bound intervals is invalid for signposts");
    }
    WRMakeError(8, v8, v2, v3, v4, v5, v6, v7, v10);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (id)diagnosticsForWorkflowName:(void *)a3 signpostName:(void *)a4 diagnosticDicts:(char)a5 diagnosticsEnabled:(int)a6 checkForOverrides:(uint64_t *)a7 error:
{
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  _UNKNOWN **v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  id *v35;
  void *v36;
  id v37;
  void *v38;
  int v39;
  uint64_t v40;
  void *v41;
  id v42;
  int v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  const char *v49;
  uint32_t v50;
  id v51;
  int v52;
  NSObject *v53;
  _BOOL4 v54;
  void *v55;
  void *v56;
  NSObject *v57;
  const char *v58;
  uint32_t v59;
  id v60;
  int v61;
  NSObject *v62;
  _BOOL4 v63;
  void *v64;
  void *v65;
  NSObject *v66;
  const char *v67;
  uint32_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  BOOL v74;
  int v75;
  NSObject *v76;
  _BOOL4 v77;
  void *v78;
  NSObject *v79;
  const char *v80;
  uint32_t v81;
  id v82;
  int v83;
  NSObject *v84;
  _BOOL4 v85;
  void *v86;
  void *v87;
  NSObject *v88;
  const char *v89;
  uint32_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  unint64_t v95;
  void *v96;
  id *v97;
  void *v98;
  id v99;
  void *v100;
  id v101;
  id v102;
  int v103;
  NSObject *v104;
  _BOOL4 v105;
  void *v106;
  NSObject *v107;
  const char *v108;
  uint32_t v109;
  id v110;
  int v111;
  NSObject *v112;
  _BOOL4 v113;
  NSObject *v114;
  const char *v115;
  uint32_t v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  id v130;
  int v131;
  uint64_t v132;
  uint64_t v133;
  int v134;
  void *v135;
  uint64_t v137;
  uint64_t *v138;
  void *v139;
  id v140;
  id v141;
  id v142;
  uint64_t v143;
  uint64_t v144;
  id v145;
  uint64_t v146;
  uint64_t v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  uint64_t v156;
  uint8_t buf[4];
  id v158;
  __int16 v159;
  id v160;
  __int16 v161;
  void *v162;
  __int16 v163;
  void *v164;
  __int16 v165;
  void *v166;
  _BYTE v167[128];
  _BYTE v168[128];
  uint64_t v169;

  v169 = *MEMORY[0x24BDAC8D0];
  v141 = a2;
  v11 = a3;
  v12 = a4;
  objc_opt_self();
  v156 = 0;
  if (a7)
    *a7 = 0;
  else
    a7 = &v156;
  if (objc_msgSend(v12, "count") == 1)
  {
    v13 = v141;
    if (v11)
      v13 = v11;
    v14 = v13;
  }
  else
  {
    v14 = 0;
  }
  v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v152 = 0u;
  v153 = 0u;
  v154 = 0u;
  v155 = 0u;
  v16 = v12;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v152, v168, 16);
  v139 = v16;
  v140 = v14;
  if (v17)
  {
    v18 = v17;
    v19 = &off_251BE4000;
    v20 = *(_QWORD *)v153;
    v138 = a7;
    v134 = a6;
    v132 = *(_QWORD *)v153;
    do
    {
      v21 = 0;
      v133 = v18;
      do
      {
        if (*(_QWORD *)v153 != v20)
          objc_enumerationMutation(v16);
        v137 = v21;
        +[WRDiagnostic diagnosticsWithDict:backupName:error:]((uint64_t)v19[11], *(void **)(*((_QWORD *)&v152 + 1) + 8 * v21), v14, a7);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (!v22)
          goto LABEL_112;
        if (v11)
          -[WRDiagnostic isValidForSignpost](v22);
        else
          -[WRDiagnostic isValidForWorkflow](v22);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        *a7 = (uint64_t)v24;
        if (v24)
          goto LABEL_112;
        v150 = 0u;
        v151 = 0u;
        v148 = 0u;
        v149 = 0u;
        v25 = v15;
        v26 = v15;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v148, v167, 16);
        if (!v27)
          goto LABEL_27;
        v28 = v27;
        v29 = *(_QWORD *)v149;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v149 != v29)
              objc_enumerationMutation(v26);
            objc_msgSend(*(id *)(*((_QWORD *)&v148 + 1) + 8 * i), "name");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "name");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v31, "isEqualToString:", v32);

            if (v33)
            {
              objc_msgSend(v23, "name");
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              WRMakeError(8, CFSTR("Multiple diagnostics with name %@"), v118, v119, v120, v121, v122, v123, (uint64_t)v117);
              *v138 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();

              v16 = v139;
              v14 = v140;
              v15 = v25;
LABEL_112:

              v124 = 0;
              goto LABEL_118;
            }
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v148, v167, 16);
        }
        while (v28);
LABEL_27:

        a6 = v134;
        if (!v134)
          goto LABEL_41;
        objc_msgSend(v23, "name");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v147 = 0;
          v35 = (id *)&v147;
          WROverrideDiagnosticForSignpost(v141, v11, v34, &v147);
        }
        else
        {
          v146 = 0;
          v35 = (id *)&v146;
          WROverrideDiagnosticForWorkflow(v141, v34, &v146);
        }
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = *v35;

        if (!v36)
        {
          if (v37)
          {
            v51 = v11;
            v52 = *__error();
            _wrlog();
            v53 = objc_claimAutoreleasedReturnValue();
            v54 = os_log_type_enabled(v53, OS_LOG_TYPE_FAULT);
            if (v11)
            {
              if (v54)
              {
                objc_msgSend(v23, "name");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "description");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v158 = v141;
                v159 = 2114;
                v160 = v11;
                v161 = 2114;
                v162 = v55;
                v163 = 2114;
                v164 = v56;
                v57 = v53;
                v58 = "%{public}@: %{public}@: diagnostic %{public}@: invalid override settings: %{public}@";
                v59 = 42;
                goto LABEL_82;
              }
            }
            else if (v54)
            {
              objc_msgSend(v23, "name");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "description");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v158 = v141;
              v159 = 2114;
              v160 = v55;
              v161 = 2114;
              v162 = v56;
              v57 = v53;
              v58 = "%{public}@: diagnostic %{public}@: invalid override settings: %{public}@";
              v59 = 32;
LABEL_82:
              _os_log_fault_impl(&dword_24A5B4000, v57, OS_LOG_TYPE_FAULT, v58, buf, v59);

              a6 = v134;
            }

            *__error() = v52;
            v23 = 0;
          }
          else
          {
LABEL_41:
            if ((a5 & 1) != 0)
            {
              v36 = 0;
              v37 = 0;
              v15 = v25;
              a7 = v138;
              goto LABEL_71;
            }

            v23 = 0;
            v37 = 0;
          }
          v36 = 0;
          v15 = v25;
          a7 = v138;
          v91 = v133;
          goto LABEL_73;
        }
        v38 = (void *)objc_msgSend(v23, "copy");
        v145 = v37;
        v39 = -[WRDiagnostic applyDict:error:]((uint64_t)v38, v36, (uint64_t *)&v145);
        v130 = v145;

        if (!v39)
        {
          v129 = v38;
          v60 = v11;
          v61 = *__error();
          _wrlog();
          v62 = objc_claimAutoreleasedReturnValue();
          v63 = os_log_type_enabled(v62, OS_LOG_TYPE_FAULT);
          v15 = v25;
          if (v11)
          {
            a7 = v138;
            if (v63)
            {
              objc_msgSend(v23, "name");
              v127 = v36;
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v130, "description");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544386;
              v158 = v141;
              v159 = 2114;
              v160 = v11;
              v161 = 2114;
              v162 = v64;
              v163 = 2114;
              v164 = v65;
              v165 = 2114;
              v166 = v127;
              v66 = v62;
              v67 = "%{public}@: %{public}@: diagnostic %{public}@: invalid override dict: %{public}@\n%{public}@";
              v68 = 52;
              goto LABEL_80;
            }
          }
          else
          {
            a7 = v138;
            if (v63)
            {
              objc_msgSend(v23, "name");
              v127 = v36;
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v130, "description");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v158 = v141;
              v159 = 2114;
              v160 = v64;
              v161 = 2114;
              v162 = v65;
              v163 = 2114;
              v164 = v127;
              v66 = v62;
              v67 = "%{public}@: diagnostic %{public}@: invalid override dict: %{public}@\n%{public}@";
              v68 = 42;
LABEL_80:
              _os_log_fault_impl(&dword_24A5B4000, v66, OS_LOG_TYPE_FAULT, v67, buf, v68);

              a6 = v134;
              v36 = v127;
            }
          }

          *__error() = v61;
          v82 = 0;
LABEL_56:
          v38 = v129;
          v37 = v130;
          goto LABEL_70;
        }
        v15 = v25;
        if (!v11)
        {
          -[WRDiagnostic isValidForWorkflow](v38);
          v69 = objc_claimAutoreleasedReturnValue();

          v41 = (void *)v69;
          a7 = v138;
          if (v69)
            goto LABEL_48;
          v43 = *__error();
          _wrlog();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v23, "name");
            v131 = v43;
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "debugDescription");
            v126 = v36;
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "debugDescription");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v158 = v141;
            v159 = 2114;
            v160 = v45;
            v161 = 2114;
            v162 = v46;
            v163 = 2114;
            v164 = v47;
            v48 = v44;
            v49 = "%{public}@: diagnostic %{public}@: applied override: %{public}@ -> %{public}@";
            v50 = 42;
LABEL_68:
            _os_log_impl(&dword_24A5B4000, v48, OS_LOG_TYPE_INFO, v49, buf, v50);

            a6 = v134;
            v36 = v126;

            v43 = v131;
          }
LABEL_69:

          *__error() = v43;
          v82 = v38;
          v37 = 0;
          goto LABEL_70;
        }
        -[WRDiagnostic isValidForSignpost](v38);
        v40 = objc_claimAutoreleasedReturnValue();

        v41 = (void *)v40;
        a7 = v138;
        if (!v40)
        {
          v42 = v11;
          v43 = *__error();
          _wrlog();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v23, "name");
            v131 = v43;
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "debugDescription");
            v126 = v36;
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "debugDescription");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            v158 = v141;
            v159 = 2114;
            v160 = v11;
            v161 = 2114;
            v162 = v45;
            v163 = 2114;
            v164 = v46;
            v165 = 2114;
            v166 = v47;
            v48 = v44;
            v49 = "%{public}@: %{public}@: diagnostic %{public}@: applied override: %{public}@ -> %{public}@";
            v50 = 52;
            goto LABEL_68;
          }
          goto LABEL_69;
        }
LABEL_48:
        objc_msgSend(v41, "domain");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v129 = v38;
        v130 = v41;
        if (!objc_msgSend(v70, "isEqualToString:", CFSTR("WorkflowResponsivenessError")))
        {

          goto LABEL_58;
        }
        v71 = objc_msgSend(v41, "code");
        v72 = v36;
        v73 = v71;

        v74 = v73 == 3;
        v36 = v72;
        if (v74)
        {
          v75 = *__error();
          _wrlog();
          v76 = objc_claimAutoreleasedReturnValue();
          v77 = os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT);
          if (v11)
          {
            if (v77)
            {
              objc_msgSend(v23, "name");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v158 = v141;
              v159 = 2114;
              v160 = v11;
              v161 = 2114;
              v162 = v78;
              v79 = v76;
              v80 = "%{public}@: %{public}@: diagnostic %{public}@: disabled via override";
              v81 = 32;
              goto LABEL_77;
            }
          }
          else if (v77)
          {
            objc_msgSend(v23, "name");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v158 = v141;
            v159 = 2114;
            v160 = v78;
            v79 = v76;
            v80 = "%{public}@: diagnostic %{public}@: disabled via override";
            v81 = 22;
LABEL_77:
            _os_log_impl(&dword_24A5B4000, v79, OS_LOG_TYPE_DEFAULT, v80, buf, v81);

            v36 = v72;
          }

          v82 = 0;
          *__error() = v75;
          goto LABEL_56;
        }
LABEL_58:
        v83 = *__error();
        _wrlog();
        v84 = objc_claimAutoreleasedReturnValue();
        v85 = os_log_type_enabled(v84, OS_LOG_TYPE_FAULT);
        if (v11)
        {
          v37 = v130;
          if (v85)
          {
            objc_msgSend(v23, "name");
            v128 = v36;
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v130, "description");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            v158 = v141;
            v159 = 2114;
            v160 = v11;
            v161 = 2114;
            v162 = v86;
            v163 = 2114;
            v164 = v87;
            v165 = 2114;
            v166 = v128;
            v88 = v84;
            v89 = "%{public}@: %{public}@: diagnostic %{public}@: invalid override dict: %{public}@\n%{public}@";
            v90 = 52;
            goto LABEL_84;
          }
        }
        else
        {
          v37 = v130;
          if (v85)
          {
            objc_msgSend(v23, "name");
            v128 = v36;
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v130, "description");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v158 = v141;
            v159 = 2114;
            v160 = v86;
            v161 = 2114;
            v162 = v87;
            v163 = 2114;
            v164 = v128;
            v88 = v84;
            v89 = "%{public}@: diagnostic %{public}@: invalid override dict: %{public}@\n%{public}@";
            v90 = 42;
LABEL_84:
            _os_log_fault_impl(&dword_24A5B4000, v88, OS_LOG_TYPE_FAULT, v89, buf, v90);

            v37 = v130;
            v36 = v128;
          }
        }

        v82 = 0;
        *__error() = v83;
        v38 = v129;
LABEL_70:

        v23 = v82;
LABEL_71:
        v91 = v133;
        if (v23)
          objc_msgSend(v26, "addObject:", v23);
LABEL_73:

        v21 = v137 + 1;
        v16 = v139;
        v14 = v140;
        v19 = &off_251BE4000;
        v20 = v132;
      }
      while (v137 + 1 != v91);
      v92 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v152, v168, 16);
      v18 = v92;
    }
    while (v92);
  }
  v93 = v15;

  if (!a6)
    goto LABEL_114;
  v94 = 1;
  v95 = 0x24BDD1000uLL;
  while (1)
  {
    v96 = (void *)objc_msgSend(objc_alloc(*(Class *)(v95 + 1992)), "initWithFormat:", CFSTR("%u"), v94);
    if (v11)
    {
      v144 = 0;
      v97 = (id *)&v144;
      WROverrideDiagnosticForSignpost(v141, v11, v96, &v144);
    }
    else
    {
      v143 = 0;
      v97 = (id *)&v143;
      WROverrideDiagnosticForWorkflow(v141, v96, &v143);
    }
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = *v97;
    v100 = v99;
    if (!v98)
      break;
    v142 = v99;
    +[WRDiagnostic diagnosticsWithDict:backupName:error:]((uint64_t)WRDiagnostic, v98, v96, (uint64_t *)&v142);
    v101 = (id)objc_claimAutoreleasedReturnValue();
    v102 = v142;

    if (!v101)
    {
      v110 = v11;
      v111 = *__error();
      _wrlog();
      v112 = objc_claimAutoreleasedReturnValue();
      v113 = os_log_type_enabled(v112, OS_LOG_TYPE_FAULT);
      if (v11)
      {
        if (v113)
        {
          objc_msgSend(v102, "description");
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v158 = v141;
          v159 = 2114;
          v160 = v11;
          v161 = 2114;
          v162 = v96;
          v163 = 2114;
          v164 = v135;
          v165 = 2114;
          v166 = v98;
          v114 = v112;
          v115 = "%{public}@: %{public}@: diagnostic %{public}@: invalid new dict: %{public}@\n%{public}@";
          v116 = 52;
          goto LABEL_110;
        }
      }
      else if (v113)
      {
        objc_msgSend(v102, "description");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v158 = v141;
        v159 = 2114;
        v160 = v96;
        v161 = 2114;
        v162 = v135;
        v163 = 2114;
        v164 = v98;
        v114 = v112;
        v115 = "%{public}@: diagnostic %{public}@: invalid new dict: %{public}@\n%{public}@";
        v116 = 42;
LABEL_110:
        _os_log_fault_impl(&dword_24A5B4000, v114, OS_LOG_TYPE_FAULT, v115, buf, v116);

      }
      *__error() = v111;

      v95 = 0x24BDD1000;
      goto LABEL_105;
    }
    objc_msgSend(v93, "addObject:", v101);
LABEL_105:

    v94 = (v94 + 1);
    if ((_DWORD)v94 == 100)
      goto LABEL_114;
  }
  if (v99)
  {
    v101 = v11;
    v103 = *__error();
    _wrlog();
    v104 = objc_claimAutoreleasedReturnValue();
    v105 = os_log_type_enabled(v104, OS_LOG_TYPE_FAULT);
    if (v11)
    {
      if (v105)
      {
        objc_msgSend(v100, "description");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v158 = v141;
        v159 = 2114;
        v160 = v11;
        v161 = 2114;
        v162 = v96;
        v163 = 2114;
        v164 = v106;
        v107 = v104;
        v108 = "%{public}@: %{public}@: diagnostic %{public}@: invalid new settings: %{public}@";
        v109 = 42;
LABEL_108:
        _os_log_fault_impl(&dword_24A5B4000, v107, OS_LOG_TYPE_FAULT, v108, buf, v109);

        v95 = 0x24BDD1000;
      }
    }
    else if (v105)
    {
      objc_msgSend(v100, "description");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v158 = v141;
      v159 = 2114;
      v160 = v96;
      v161 = 2114;
      v162 = v106;
      v107 = v104;
      v108 = "%{public}@: diagnostic %{public}@: invalid new settings: %{public}@";
      v109 = 32;
      goto LABEL_108;
    }

    *__error() = v103;
    v102 = v100;
    goto LABEL_105;
  }

LABEL_114:
  v15 = v93;
  if (objc_msgSend(v93, "count"))
  {
    objc_msgSend(v93, "sortUsingComparator:", &__block_literal_global_3);
    v124 = (void *)objc_msgSend(v93, "copy");
  }
  else
  {
    v124 = 0;
  }
  v16 = v139;
  v14 = v140;
LABEL_118:

  return v124;
}

uint64_t __115__WRDiagnostic_diagnosticsForWorkflowName_signpostName_diagnosticDicts_diagnosticsEnabled_checkForOverrides_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WRDiagnostic *v4;
  uint64_t v5;
  NSString *name;
  uint64_t v7;
  NSString *reportSpindumpForThreadWithName;
  uint64_t v9;
  NSString *reportSpindumpForDispatchQueueWithLabel;
  uint64_t v11;
  NSString *reportOtherSignpostWithName;
  uint64_t v13;
  NSString *reportProcessesWithName;

  v4 = -[WRDiagnostic init](+[WRDiagnostic allocWithZone:](WRDiagnostic, "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_name, "copy");
  name = v4->_name;
  v4->_name = (NSString *)v5;

  v4->_triggerThresholdDurationSum = self->_triggerThresholdDurationSum;
  v4->_triggerThresholdDurationUnion = self->_triggerThresholdDurationUnion;
  v4->_triggerThresholdDurationSingle = self->_triggerThresholdDurationSingle;
  v4->_triggerThresholdCount = self->_triggerThresholdCount;
  v4->_triggerEventTimeout = self->_triggerEventTimeout;
  v4->_gatherTailspin = self->_gatherTailspin;
  v4->_tailspinIncludeOSLogs = self->_tailspinIncludeOSLogs;
  v4->_reportSpindumpForThisThread = self->_reportSpindumpForThisThread;
  v7 = -[NSString copy](self->_reportSpindumpForThreadWithName, "copy");
  reportSpindumpForThreadWithName = v4->_reportSpindumpForThreadWithName;
  v4->_reportSpindumpForThreadWithName = (NSString *)v7;

  v4->_reportSpindumpForMainThread = self->_reportSpindumpForMainThread;
  v4->_reportSpindumpForThisDispatchQueue = self->_reportSpindumpForThisDispatchQueue;
  v9 = -[NSString copy](self->_reportSpindumpForDispatchQueueWithLabel, "copy");
  reportSpindumpForDispatchQueueWithLabel = v4->_reportSpindumpForDispatchQueueWithLabel;
  v4->_reportSpindumpForDispatchQueueWithLabel = (NSString *)v9;

  v11 = -[NSString copy](self->_reportOtherSignpostWithName, "copy");
  reportOtherSignpostWithName = v4->_reportOtherSignpostWithName;
  v4->_reportOtherSignpostWithName = (NSString *)v11;

  v13 = -[NSString copy](self->_reportProcessesWithName, "copy");
  reportProcessesWithName = v4->_reportProcessesWithName;
  v4->_reportProcessesWithName = (NSString *)v13;

  v4->_reportOmittingNetworkBoundIntervals = self->_reportOmittingNetworkBoundIntervals;
  return v4;
}

- (BOOL)hasTriggerThresholdDurationSum
{
  double v2;

  -[WRDiagnostic triggerThresholdDurationSum](self, "triggerThresholdDurationSum");
  return v2 != 0.0;
}

- (BOOL)hasTriggerThresholdDurationUnion
{
  double v2;

  -[WRDiagnostic triggerThresholdDurationUnion](self, "triggerThresholdDurationUnion");
  return v2 != 0.0;
}

- (BOOL)hasTriggerThresholdDurationSingle
{
  double v2;

  -[WRDiagnostic triggerThresholdDurationSingle](self, "triggerThresholdDurationSingle");
  return v2 != 0.0;
}

- (BOOL)hasTriggerThresholdCount
{
  return -[WRDiagnostic triggerThresholdCount](self, "triggerThresholdCount") != 0;
}

- (id)debugDescription
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("name:%@\ntriggerThresholdDurationSum:%f\ntriggerThresholdDurationUnion:%f\ntriggerThresholdDurationSingle:%f\ntriggerThresholdCount:%u\ntriggerEventTimeout:%u\ngatherTailspin:%u\ntailspinIncludeOSLogs:%u\nreportSpindumpForThisThread:%u\nreportSpindumpForThreadWithName:%@\nreportSpindumpForMainThread:%u\nreportSpindumpForThisDispatchQueue:%u\nreportSpindumpForDispatchQueueWithLabel:%@\nreportOtherSignpostWithName:%@\nreportProcessesWithName:%@\nreportOmittingNetworkBoundIntervals:%u\n"), self->_name, *(_QWORD *)&self->_triggerThresholdDurationSum, *(_QWORD *)&self->_triggerThresholdDurationUnion, *(_QWORD *)&self->_triggerThresholdDurationSingle, self->_triggerThresholdCount, self->_triggerEventTimeout, self->_gatherTailspin, self->_tailspinIncludeOSLogs, self->_reportSpindumpForThisThread, self->_reportSpindumpForThreadWithName, self->_reportSpindumpForMainThread, self->_reportSpindumpForThisDispatchQueue, self->_reportSpindumpForDispatchQueueWithLabel, self->_reportOtherSignpostWithName, self->_reportProcessesWithName, self->_reportOmittingNetworkBoundIntervals);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  WRDiagnostic *v6;
  WRDiagnostic *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unsigned int v17;
  _BOOL4 v18;
  _BOOL4 v19;
  _BOOL4 v20;
  _BOOL4 v21;
  _BOOL4 v22;
  _BOOL4 v23;
  _BOOL4 v24;
  char v25;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  char v58;
  void *v59;
  void *v60;
  void *v61;

  v6 = (WRDiagnostic *)a3;
  if (self == v6)
  {
    v25 = 1;
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v25 = 0;
    goto LABEL_18;
  }
  v7 = v6;
  -[WRDiagnostic triggerThresholdDurationSum](self, "triggerThresholdDurationSum");
  v9 = v8;
  -[WRDiagnostic triggerThresholdDurationSum](v7, "triggerThresholdDurationSum");
  if (v9 == v10)
  {
    -[WRDiagnostic triggerThresholdDurationUnion](self, "triggerThresholdDurationUnion");
    v12 = v11;
    -[WRDiagnostic triggerThresholdDurationUnion](v7, "triggerThresholdDurationUnion");
    if (v12 == v13)
    {
      -[WRDiagnostic triggerThresholdDurationSingle](self, "triggerThresholdDurationSingle");
      v15 = v14;
      -[WRDiagnostic triggerThresholdDurationSingle](v7, "triggerThresholdDurationSingle");
      if (v15 == v16)
      {
        v17 = -[WRDiagnostic triggerThresholdCount](self, "triggerThresholdCount");
        if (v17 == -[WRDiagnostic triggerThresholdCount](v7, "triggerThresholdCount"))
        {
          v18 = -[WRDiagnostic triggerEventTimeout](self, "triggerEventTimeout");
          if (v18 == -[WRDiagnostic triggerEventTimeout](v7, "triggerEventTimeout"))
          {
            v19 = -[WRDiagnostic gatherTailspin](self, "gatherTailspin");
            if (v19 == -[WRDiagnostic gatherTailspin](v7, "gatherTailspin"))
            {
              v20 = -[WRDiagnostic tailspinIncludeOSLogs](self, "tailspinIncludeOSLogs");
              if (v20 == -[WRDiagnostic tailspinIncludeOSLogs](v7, "tailspinIncludeOSLogs"))
              {
                v21 = -[WRDiagnostic reportSpindumpForThisThread](self, "reportSpindumpForThisThread");
                if (v21 == -[WRDiagnostic reportSpindumpForThisThread](v7, "reportSpindumpForThisThread"))
                {
                  v22 = -[WRDiagnostic reportSpindumpForMainThread](self, "reportSpindumpForMainThread");
                  if (v22 == -[WRDiagnostic reportSpindumpForMainThread](v7, "reportSpindumpForMainThread"))
                  {
                    v23 = -[WRDiagnostic reportSpindumpForThisDispatchQueue](self, "reportSpindumpForThisDispatchQueue");
                    if (v23 == -[WRDiagnostic reportSpindumpForThisDispatchQueue](v7, "reportSpindumpForThisDispatchQueue"))
                    {
                      v24 = -[WRDiagnostic reportOmittingNetworkBoundIntervals](self, "reportOmittingNetworkBoundIntervals");
                      if (v24 == -[WRDiagnostic reportOmittingNetworkBoundIntervals](v7, "reportOmittingNetworkBoundIntervals"))
                      {
                        -[WRDiagnostic name](self, "name");
                        v27 = (void *)objc_claimAutoreleasedReturnValue();
                        -[WRDiagnostic name](v7, "name");
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        if (!objc_msgSend(v27, "isEqualToString:", v28))
                        {
                          v25 = 0;
LABEL_68:

                          goto LABEL_15;
                        }
                        -[WRDiagnostic reportSpindumpForThreadWithName](self, "reportSpindumpForThreadWithName");
                        v29 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v29
                          || (-[WRDiagnostic reportSpindumpForThreadWithName](v7, "reportSpindumpForThreadWithName"),
                              (v61 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                        {
                          -[WRDiagnostic reportSpindumpForThreadWithName](self, "reportSpindumpForThreadWithName");
                          v30 = objc_claimAutoreleasedReturnValue();
                          if (!v30)
                            goto LABEL_64;
                          v3 = (void *)v30;
                          -[WRDiagnostic reportSpindumpForThreadWithName](v7, "reportSpindumpForThreadWithName");
                          v31 = objc_claimAutoreleasedReturnValue();
                          if (!v31)
                          {
LABEL_63:

                            goto LABEL_64;
                          }
                          v4 = (void *)v31;
                          -[WRDiagnostic reportSpindumpForThreadWithName](self, "reportSpindumpForThreadWithName");
                          v32 = (void *)objc_claimAutoreleasedReturnValue();
                          -[WRDiagnostic reportSpindumpForThreadWithName](v7, "reportSpindumpForThreadWithName");
                          v59 = (void *)objc_claimAutoreleasedReturnValue();
                          v60 = v32;
                          if ((objc_msgSend(v32, "isEqualToString:") & 1) == 0)
                          {
LABEL_62:

                            goto LABEL_63;
                          }
                          v58 = 1;
                        }
                        else
                        {
                          v61 = 0;
                          v58 = 0;
                        }
                        -[WRDiagnostic reportSpindumpForDispatchQueueWithLabel](self, "reportSpindumpForDispatchQueueWithLabel");
                        v33 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v33
                          || (-[WRDiagnostic reportSpindumpForDispatchQueueWithLabel](v7, "reportSpindumpForDispatchQueueWithLabel"), (v56 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                        {
                          -[WRDiagnostic reportSpindumpForDispatchQueueWithLabel](self, "reportSpindumpForDispatchQueueWithLabel");
                          v57 = (void *)objc_claimAutoreleasedReturnValue();
                          if (!v57)
                          {
                            v25 = 0;
LABEL_83:
                            if (!v33)

                            if ((v58 & 1) != 0)
                            {

                            }
                            goto LABEL_65;
                          }
                          -[WRDiagnostic reportSpindumpForDispatchQueueWithLabel](v7, "reportSpindumpForDispatchQueueWithLabel");
                          v55 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v55)
                          {
                            -[WRDiagnostic reportSpindumpForDispatchQueueWithLabel](self, "reportSpindumpForDispatchQueueWithLabel");
                            v34 = (void *)objc_claimAutoreleasedReturnValue();
                            -[WRDiagnostic reportSpindumpForDispatchQueueWithLabel](v7, "reportSpindumpForDispatchQueueWithLabel");
                            v52 = (void *)objc_claimAutoreleasedReturnValue();
                            v53 = v34;
                            if ((objc_msgSend(v34, "isEqualToString:") & 1) != 0)
                            {
                              v51 = 1;
                              goto LABEL_39;
                            }

                          }
                          if (!v33)
                          {

                            goto LABEL_61;
                          }
LABEL_60:

LABEL_61:
                          if ((v58 & 1) != 0)
                            goto LABEL_62;
LABEL_64:
                          v25 = 0;
LABEL_65:
                          if (!v29)

                          goto LABEL_68;
                        }
                        v56 = 0;
                        v51 = 0;
LABEL_39:
                        -[WRDiagnostic reportOtherSignpostWithName](self, "reportOtherSignpostWithName");
                        v54 = objc_claimAutoreleasedReturnValue();
                        if (!v54)
                        {
                          -[WRDiagnostic reportOtherSignpostWithName](v7, "reportOtherSignpostWithName");
                          v48 = (void *)objc_claimAutoreleasedReturnValue();
                          if (!v48)
                          {
                            v48 = 0;
                            v44 = 0;
                            goto LABEL_50;
                          }
                        }
                        -[WRDiagnostic reportOtherSignpostWithName](self, "reportOtherSignpostWithName");
                        v50 = (void *)objc_claimAutoreleasedReturnValue();
                        if (!v50)
                        {
                          v25 = 0;
                          goto LABEL_77;
                        }
                        -[WRDiagnostic reportOtherSignpostWithName](v7, "reportOtherSignpostWithName");
                        v49 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v49)
                        {
                          -[WRDiagnostic reportOtherSignpostWithName](self, "reportOtherSignpostWithName");
                          v35 = (void *)objc_claimAutoreleasedReturnValue();
                          -[WRDiagnostic reportOtherSignpostWithName](v7, "reportOtherSignpostWithName");
                          v45 = (void *)objc_claimAutoreleasedReturnValue();
                          v46 = v35;
                          if ((objc_msgSend(v35, "isEqualToString:") & 1) != 0)
                          {
                            v44 = 1;
LABEL_50:
                            -[WRDiagnostic reportProcessesWithName](self, "reportProcessesWithName");
                            v47 = objc_claimAutoreleasedReturnValue();
                            if (!v47)
                            {
                              -[WRDiagnostic reportProcessesWithName](v7, "reportProcessesWithName");
                              v42 = objc_claimAutoreleasedReturnValue();
                              if (!v42)
                              {
                                v42 = 0;
                                v25 = 1;
                                goto LABEL_74;
                              }
                            }
                            -[WRDiagnostic reportProcessesWithName](self, "reportProcessesWithName");
                            v43 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v43)
                            {
                              -[WRDiagnostic reportProcessesWithName](v7, "reportProcessesWithName");
                              v41 = (void *)objc_claimAutoreleasedReturnValue();
                              if (v41)
                              {
                                -[WRDiagnostic reportProcessesWithName](self, "reportProcessesWithName");
                                v40 = (void *)objc_claimAutoreleasedReturnValue();
                                -[WRDiagnostic reportProcessesWithName](v7, "reportProcessesWithName");
                                v37 = (void *)objc_claimAutoreleasedReturnValue();
                                v25 = objc_msgSend(v40, "isEqualToString:", v37);

                                goto LABEL_71;
                              }

                            }
                            v25 = 0;
LABEL_71:
                            if (v47)
                            {
                              v38 = (void *)v47;
LABEL_75:

                              if ((v44 & 1) == 0)
                              {
                                if (!v54)
                                {
                                  v39 = v48;
LABEL_81:

                                  if ((v51 & 1) != 0)
                                  {

                                  }
                                  goto LABEL_83;
                                }
LABEL_80:
                                v39 = (void *)v54;
                                goto LABEL_81;
                              }

LABEL_77:
                              if (!v54)

                              goto LABEL_80;
                            }
LABEL_74:
                            v38 = (void *)v42;
                            goto LABEL_75;
                          }

                        }
                        if (v54)
                          v36 = (void *)v54;
                        else
                          v36 = v48;

                        if ((v51 & 1) != 0)
                        {

                        }
                        if (!v33)

                        goto LABEL_60;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v25 = 0;
LABEL_15:

LABEL_18:
  return v25;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WRDiagnostic name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (double)triggerThresholdDurationSingle
{
  return self->_triggerThresholdDurationSingle;
}

- (BOOL)triggerEventTimeout
{
  return self->_triggerEventTimeout;
}

- (double)triggerThresholdDurationSum
{
  return self->_triggerThresholdDurationSum;
}

- (double)triggerThresholdDurationUnion
{
  return self->_triggerThresholdDurationUnion;
}

- (unsigned)triggerThresholdCount
{
  return self->_triggerThresholdCount;
}

- (BOOL)gatherTailspin
{
  return self->_gatherTailspin;
}

- (BOOL)tailspinIncludeOSLogs
{
  return self->_tailspinIncludeOSLogs;
}

- (BOOL)reportSpindumpForThisThread
{
  return self->_reportSpindumpForThisThread;
}

- (NSString)reportSpindumpForThreadWithName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)reportSpindumpForMainThread
{
  return self->_reportSpindumpForMainThread;
}

- (BOOL)reportSpindumpForThisDispatchQueue
{
  return self->_reportSpindumpForThisDispatchQueue;
}

- (NSString)reportSpindumpForDispatchQueueWithLabel
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)reportOtherSignpostWithName
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)reportProcessesWithName
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (BOOL)reportOmittingNetworkBoundIntervals
{
  return self->_reportOmittingNetworkBoundIntervals;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportProcessesWithName, 0);
  objc_storeStrong((id *)&self->_reportOtherSignpostWithName, 0);
  objc_storeStrong((id *)&self->_reportSpindumpForDispatchQueueWithLabel, 0);
  objc_storeStrong((id *)&self->_reportSpindumpForThreadWithName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
