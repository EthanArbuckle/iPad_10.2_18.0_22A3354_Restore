@implementation SignpostSupportObjectExtractor(TraceReading)

- (uint64_t)_processTraceUsingKtraceLoggingDataSource:()TraceReading startDate:endDate:errorOut:
{
  id v10;
  id v11;
  objc_class *v12;
  id v13;
  void *v14;
  uint64_t v15;

  v10 = a4;
  v11 = a5;
  v12 = (objc_class *)MEMORY[0x24BE60C60];
  v13 = a3;
  v14 = (void *)objc_msgSend([v12 alloc], "initWithDataSourceDelegate:", v13);

  if (v14)
  {
    v15 = objc_msgSend(a1, "_processLogEventStream:startDate:endDate:errorOut:", v14, v10, v11, a6);
  }
  else if (a6)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithCode:description:", 8, CFSTR("Failed to instantiate deserializing stream"));
    v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (uint64_t)_processTraceFileWithPath:()TraceReading startDate:endDate:errorOut:
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int *v19;
  void *v20;
  char v21;
  void *v22;
  BOOL v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v28;
  void *v29;
  uint64_t v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(a1, "_processingStarting");
  if ((objc_msgSend(a1, "_hasProcessingBlock") & 1) == 0)
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithCode:description:", 8, CFSTR("No processing blocks specified"));
      v16 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
LABEL_12:
    v16 = 0;
    goto LABEL_17;
  }
  if (a6)
    *a6 = 0;
  v13 = objc_retainAutorelease(v10);
  objc_msgSend(v13, "UTF8String");
  v14 = ktrace_file_open();
  if (!v14)
  {
    if (a6)
    {
      v17 = (void *)MEMORY[0x24BDD1540];
      v18 = (void *)MEMORY[0x24BDD17C8];
      v19 = __error();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("Could not open trace file '%@' due to error: %s"), v13, strerror(*v19));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithCode:description:", 7, v20);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(a1, "finishProcessingSerializedData");
    goto LABEL_12;
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BECDF30]), "initWithKtraceFile:", v14);
  if (v15)
  {
    v16 = objc_msgSend(a1, "_processTraceUsingKtraceLoggingDataSource:startDate:endDate:errorOut:", v15, v11, v12, a6);
    ktrace_file_close();
  }
  else
  {
    v21 = objc_msgSend(a1, "_hasSignpostProcessingBlock");
    objc_msgSend(a1, "logMessageProcessingBlock");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22 != 0;

    v28 = MEMORY[0x24BDAC760];
    LOBYTE(v30) = v21;
    BYTE1(v30) = v23;
    v29 = a1;
    v24 = ktrace_file_iterate();
    ktrace_file_close();
    objc_msgSend(a1, "finishProcessingSerializedData");
    v16 = v24 == 0;
    if (a6 && v24)
    {
      v25 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not process trace file '%@' due to error: %s"), v13, strerror(v24), v28, 3221225472, __101__SignpostSupportObjectExtractor_TraceReading___processTraceFileWithPath_startDate_endDate_errorOut___block_invoke, &unk_24CE7A6F8, v29, v30);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithCode:description:", 7, v26);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

LABEL_17:
  return v16;
}

- (uint64_t)processTraceFileWithPath:()TraceReading errorOut:
{
  return objc_msgSend(a1, "_processTraceFileWithPath:startDate:endDate:errorOut:", a3, 0, 0, a4);
}

- (uint64_t)processTraceFileWithPath:()TraceReading startDate:endDate:errorOut:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v11 && v12 && objc_msgSend(v11, "compare:", v12) == 1)
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithCode:description:", 8, CFSTR("Start date > end date"));
      v14 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = objc_msgSend(a1, "_processTraceFileWithPath:startDate:endDate:errorOut:", v10, v11, v13, a6);
  }

  return v14;
}

@end
