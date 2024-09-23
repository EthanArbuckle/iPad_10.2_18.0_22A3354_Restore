@implementation SignpostSupportObjectExtractor(AllFileReading)

- (uint64_t)processFileWithPath:()AllFileReading startDate:endDate:errorsOut:
{
  id v10;
  id v11;
  id v12;
  int v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v22;
  id v23;
  id v24;
  _QWORD v25[2];
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    v23 = 0;
    v13 = objc_msgSend(a1, "processLogArchiveWithPath:startDate:endDate:errorOut:", v10, v11, v12, &v23);
    v14 = v23;
    v15 = v14;
    if (v13)
    {
      if (a6)
        *a6 = 0;
      v16 = 1;
      goto LABEL_22;
    }
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithCode:description:", 4, CFSTR("Unknown error"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v22 = 0;
    v16 = objc_msgSend(a1, "processTraceFileWithPath:startDate:endDate:errorOut:", v10, v11, v12, &v22);
    v18 = v22;
    v19 = v18;
    if ((_DWORD)v16)
    {
      if (!a6)
      {
LABEL_21:

        goto LABEL_22;
      }
      v20 = 0;
    }
    else
    {
      if (!v18)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithCode:description:", 4, CFSTR("Unknown error"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (!a6)
        goto LABEL_21;
      v25[0] = v15;
      v25[1] = v19;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    *a6 = v20;
    goto LABEL_21;
  }
  v24 = 0;
  v16 = objc_msgSend(a1, "processLogArchiveWithPath:startDate:endDate:errorOut:", 0, v11, v12, &v24);
  v17 = v24;
  v15 = v17;
  if (a6 && (v16 & 1) == 0)
  {
    if (!v17)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithCode:description:", 4, CFSTR("Unknown error"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v26[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_22:

  return v16;
}

+ (BOOL)getDataSourceDateRange:()AllFileReading earliestDateOut:latestDateOut:errorsOut:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  _BOOL8 v26;
  void *v27;
  void *v28;
  int *v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  int *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v48[6];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  _QWORD v61[4];

  v61[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BE60C78], "localStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      goto LABEL_4;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Bad input file: %@"), v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithCode:description:", 12, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BE60C78], "storeWithArchiveURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_8:
    v13 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not read file: %@"), v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithCode:description:", 5, v14);
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v12 = (id)v15;

    goto LABEL_11;
  }
LABEL_4:
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__1;
  v59 = __Block_byref_object_dispose__1;
  v60 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__1;
  v53 = __Block_byref_object_dispose__1;
  v54 = 0;
  v48[0] = MEMORY[0x24BDAC760];
  v48[1] = 3221225472;
  v48[2] = ___dateRangeFromLogArchiveSource_block_invoke;
  v48[3] = &unk_24CE7A548;
  v48[4] = &v49;
  v48[5] = &v55;
  objc_msgSend(v10, "prepareWithCompletionHandler:", v48);
  v11 = (void *)v56[5];
  if (v11)
  {
    v12 = v11;
  }
  else
  {
    objc_msgSend((id)v50[5], "oldestDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30 == 0;

    if (v31)
    {
      v43 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not determine earliest date from data source: %@"), v8);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "errorWithCode:description:", 5, v44);
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend((id)v50[5], "newestDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32 == 0;

      if (v33)
      {
        v45 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not determine latest date from data source: %@"), v8);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "errorWithCode:description:", 5, v46);
        v12 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend((id)v50[5], "oldestDate");
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v50[5], "newestDate");
        v12 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(&v55, 8);
LABEL_11:

  if (v12)
  {
    v17 = objc_retainAutorelease(v8);
    objc_msgSend(v17, "UTF8String");
    v18 = ktrace_file_open();
    if (v18)
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BECDF30]), "initWithKtraceFile:", v18);
      if (v19)
      {
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE60C60]), "initWithDataSourceDelegate:", v19);
        v21 = v20;
        if (v20)
        {
          objc_msgSend(v20, "firstDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22
            || (objc_msgSend(v21, "lastDate"),
                v23 = (void *)objc_claimAutoreleasedReturnValue(),
                v24 = v23 == 0,
                v23,
                v22,
                v24))
          {
            ktrace_file_close();
            v37 = (void *)MEMORY[0x24BDD1540];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not determine date range for file: %@"), v17);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "errorWithCode:description:", 7, v38);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_msgSend(v21, "firstDate");
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "lastDate");
            v25 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          ktrace_file_close();
          v39 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to instantiate deserializing stream for file: %@"), v17);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "errorWithCode:description:", 7, v40);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = 0;
        }
      }
      else
      {
        ktrace_file_close();
        v34 = (void *)MEMORY[0x24BDD1540];
        v35 = (void *)MEMORY[0x24BDD17C8];
        v36 = __error();
        objc_msgSend(v35, "stringWithFormat:", CFSTR("Could not open trace file '%@' due to error: %s"), v17, strerror(*v36));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "errorWithCode:description:", 7, v21);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v27 = (void *)MEMORY[0x24BDD1540];
      v28 = (void *)MEMORY[0x24BDD17C8];
      v29 = __error();
      objc_msgSend(v28, "stringWithFormat:", CFSTR("Could not open trace file '%@' due to error: %s"), v17, strerror(*v29));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithCode:description:", 7, v19);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v26 = v25 == 0;
    if (v25)
    {
      if (a6)
      {
        v61[0] = v12;
        v61[1] = v25;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v61, 2);
        v41 = (id)objc_claimAutoreleasedReturnValue();
LABEL_34:
        *a6 = v41;
      }
    }
    else if (a6)
    {
      v41 = 0;
      goto LABEL_34;
    }

    goto LABEL_36;
  }
  if (a6)
    *a6 = 0;
  v26 = 1;
LABEL_36:

  return v26;
}

@end
