@implementation SignpostSupportObjectExtractor(LogArchiveReading)

- (uint64_t)processLogArchiveWithPath:()LogArchiveReading startDate:endDate:errorOut:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((objc_msgSend(a1, "_hasProcessingBlock") & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "_eventSourceForPath:errorOut:", v10, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if (v10
        || (objc_msgSend(a1, "logMessageProcessingBlock"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v14,
            v14))
      {
        v15 = objc_msgSend(objc_alloc(MEMORY[0x24BE60C80]), "initWithSource:", v13);
      }
      else
      {
        v15 = objc_msgSend(objc_alloc(MEMORY[0x24BE60C80]), "initWithSource:skipNonSignpostFiles:", v13, 1);
      }
      v16 = (void *)v15;
      v17 = objc_msgSend(a1, "_processLogEventStream:startDate:endDate:errorOut:", v15, v11, v12, a6);

    }
    else
    {
      v17 = 0;
    }

  }
  else if (a6)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithCode:description:", 8, CFSTR("No processing blocks specified"));
    v17 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)_eventSourceForPath:()LogArchiveReading errorOut:
{
  __CFString *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  id v12;
  void *v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  id v22;

  v5 = a3;
  if (!v5)
    goto LABEL_9;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v7 = objc_msgSend(v6, "checkResourceIsReachableAndReturnError:", &v22);
  v8 = v22;
  v9 = v8;
  if ((v7 & 1) != 0)
  {

    if (v6)
    {
      objc_msgSend(MEMORY[0x24BE60C78], "storeWithArchiveURL:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_5;
LABEL_10:
      objc_msgSend(v9, "setUpgradeConfirmationHandler:", &__block_literal_global);
      v16 = 0;
      v17 = &v16;
      v18 = 0x3032000000;
      v19 = __Block_byref_object_copy__0;
      v20 = __Block_byref_object_dispose__0;
      v21 = 0;
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __82__SignpostSupportObjectExtractor_LogArchiveReading___eventSourceForPath_errorOut___block_invoke_9;
      v15[3] = &unk_24CE7A520;
      v15[4] = &v16;
      v15[5] = a4;
      objc_msgSend(v9, "prepareWithCompletionHandler:", v15);
      v12 = (id)v17[5];
      _Block_object_dispose(&v16, 8);

      goto LABEL_17;
    }
LABEL_9:
    objc_msgSend(MEMORY[0x24BE60C78], "localStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    if (!v9)
    {
LABEL_5:
      if (a4)
      {
        v10 = (void *)MEMORY[0x24BDD1540];
        v11 = CFSTR("Local Store");
        if (v5)
          v11 = v5;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not create OSLogEventStore for path: %@"), v11);
        goto LABEL_15;
      }
LABEL_16:
      v12 = 0;
      goto LABEL_17;
    }
    goto LABEL_10;
  }
  if (!a4)
    goto LABEL_16;
  if (!v8)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown error opening file: %@"), v5);
LABEL_15:
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithCode:description:", 4, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }
  v12 = 0;
  *a4 = (id)objc_msgSend(v8, "copy");
LABEL_17:

  return v12;
}

+ (BOOL)dateRangeOfLogArchiveWithPath:()LogArchiveReading startDateOut:endDateOut:errorOut:
{
  id v9;
  _BOOL8 v10;
  void *v11;
  void *v12;

  v9 = a3;
  if (a6)
    *a6 = 0;
  if (a4 | a5)
  {
    objc_msgSend((id)objc_opt_class(), "_eventSourceForPath:errorOut:", v9, a6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v10 = v11 != 0;
    if (v11)
    {
      if (a4)
      {
        objc_msgSend(v11, "oldestDate");
        *(_QWORD *)a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (a5)
      {
        objc_msgSend(v12, "newestDate");
        *(_QWORD *)a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

@end
