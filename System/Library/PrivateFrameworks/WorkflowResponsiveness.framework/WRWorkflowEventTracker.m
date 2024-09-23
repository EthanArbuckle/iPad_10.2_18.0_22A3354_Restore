@implementation WRWorkflowEventTracker

- (id)initForReadbackWithWorkflow:(id)a3 eventCompletionCallback:(id)a4
{
  id v6;
  id v7;
  id *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  unint64_t v22;
  id Property;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  unint64_t v28;

  v6 = a3;
  v7 = a4;
  v8 = -[WRWorkflowEventTracker initWithWorkflow:]((id *)&self->super.isa, v6);
  if (v8)
  {
    v9 = MEMORY[0x24BD14614](v7);
    v10 = v8[17];
    v8[17] = (id)v9;

    v11 = objc_alloc(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v6, "allSignposts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithCapacity:", objc_msgSend(v12, "count"));
    v14 = v8[12];
    v8[12] = (id)v13;

    v15 = objc_alloc(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v6, "endSignpostGroups");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithCapacity:", objc_msgSend(v16, "count"));
    v18 = v8[18];
    v8[18] = (id)v17;

    objc_msgSend(v6, "endSignpostGroups");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (v20)
    {
      v22 = 0;
      do
      {
        Property = objc_getProperty(v8, v21, 144, 1);
        v24 = (void *)MEMORY[0x24BDBCEF8];
        v25 = Property;
        objc_msgSend(v24, "null");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v26);

        ++v22;
        objc_msgSend(v6, "endSignpostGroups");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "count");

      }
      while (v22 < v28);
    }
  }

  return v8;
}

- (id)initWithWorkflow:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)WRWorkflowEventTracker;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

- (id)candidateEndSignpostTrackers
{
  if (result)
    return objc_getProperty(result, a2, 144, 1);
  return result;
}

- (id)initForLiveStreamingWithWorkflow:(id)a3 timeoutQueue:(id)a4 eventCompletionCallback:(id)a5
{
  id v9;
  id *v10;
  id *v11;

  v9 = a4;
  v10 = -[WRWorkflowEventTracker initForReadbackWithWorkflow:eventCompletionCallback:](self, "initForReadbackWithWorkflow:eventCompletionCallback:", a3, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong(v10 + 14, a4);

  return v11;
}

- (BOOL)inMiddleOfEvent
{
  void *v2;
  BOOL v3;

  -[WRWorkflowEventTracker eventStart](self, "eventStart");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSArray)allSignpostTrackers
{
  if (self)
    self = (WRWorkflowEventTracker *)objc_getProperty(self, a2, 96, 1);
  return (NSArray *)(id)-[WRWorkflowEventTracker copy](self, "copy");
}

- (id)allSignpostTrackersMutable
{
  if (result)
    return objc_getProperty(result, a2, 96, 1);
  return result;
}

- (void)reset
{
  const char *v3;
  id Property;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[WRWorkflowEventTracker reportErrorsAndResetAtMachContNs:date:](self, 0, 0);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  if (self)
    Property = objc_getProperty(self, v3, 104, 1);
  else
    Property = 0;
  v5 = Property;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[WRWorkflowEventTracker reportErrorsAndResetAtMachContNs:date:](*(void **)(*((_QWORD *)&v10 + 1) + 8 * v9++), 0, 0);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)reportErrorsAndResetAtMachContNs:(void *)a3 date:
{
  id v5;
  const char *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  double v22;
  unint64_t v23;
  WRTimestampAndThread *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __CFString *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;

  v5 = a3;
  if (a1)
  {
    if (!objc_msgSend(a1, "inMiddleOfEvent"))
    {
LABEL_18:
      -[WRWorkflowEventTracker resetWithoutReportingErrors](a1, v6);
      goto LABEL_19;
    }
    objc_msgSend(a1, "workflow");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");

    objc_msgSend(a1, "eventIdentifier");
    objc_msgSend(a1, "eventIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *__error();
    _wrlog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (v8)
    {
      if (v11)
        -[WRWorkflowEventTracker reportErrorsAndResetAtMachContNs:date:].cold.2();
    }
    else if (v11)
    {
      -[WRWorkflowEventTracker reportErrorsAndResetAtMachContNs:date:].cold.1(a1);
    }

    *__error() = v9;
    if (!a2 || !v5)
    {
      WRMakeError(5, CFSTR("Workflow event incomplete"), v12, v13, v14, v15, v16, v17, v44);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[WRWorkflowEventTracker handleError:atEndTime:]((uint64_t)a1, v34, 0);
LABEL_17:

      goto LABEL_18;
    }
    objc_msgSend(a1, "workflow");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "hasMaximumEventDuration") & 1) != 0)
    {
      objc_msgSend(a1, "eventStart");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "machContTimeNs");
      objc_msgSend(a1, "workflow");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "maximumEventDuration");
      v23 = v20 + (unint64_t)(v22 * 1000000000.0);

      if (v23 <= (unint64_t)a2)
      {
        v24 = [WRTimestampAndThread alloc];
        objc_msgSend(a1, "eventStart");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "machContTimeNs");
        objc_msgSend(a1, "workflow");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "maximumEventDuration");
        v29 = (void *)(v26 + (unint64_t)(v28 * 1000000000.0));
        objc_msgSend(a1, "eventStart");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "date");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "workflow");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "maximumEventDuration");
        objc_msgSend(v31, "dateByAddingTimeInterval:");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = -[WRTimestampAndThread initWithPID:threadID:machContTimeNs:date:]((id *)&v24->super.isa, -1, 0, v29, v33);

        v41 = CFSTR("Workflow event timed out");
        v42 = 4;
LABEL_16:
        WRMakeError(v42, v41, v35, v36, v37, v38, v39, v40, v44);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[WRWorkflowEventTracker handleError:atEndTime:]((uint64_t)a1, v43, v34);

        goto LABEL_17;
      }
    }
    else
    {

    }
    v34 = -[WRTimestampAndThread initWithPID:threadID:machContTimeNs:date:]((id *)[WRTimestampAndThread alloc], -1, 0, a2, v5);
    v41 = CFSTR("Workflow event incomplete");
    v42 = 5;
    goto LABEL_16;
  }
LABEL_19:

}

- (id)concurrentEvents
{
  if (result)
    return objc_getProperty(result, a2, 104, 1);
  return result;
}

- (uint64_t)handleError:(void *)a3 atEndTime:
{
  void *v4;
  id v5;
  SEL v6;
  SEL v7;
  SEL v8;
  uint64_t (**Property)(id, void *);

  if (result)
  {
    v4 = (void *)result;
    v5 = a3;
    objc_setProperty_atomic(v4, v6, a2, 56);
    objc_setProperty_atomic(v4, v7, v5, 40);

    Property = (uint64_t (**)(id, void *))objc_getProperty(v4, v8, 136, 1);
    return Property[2](Property, v4);
  }
  return result;
}

- (void)resetWithoutReportingErrors
{
  const char *v3;
  NSObject *Property;
  SEL v5;
  SEL v6;
  SEL v7;
  SEL v8;
  SEL v9;
  SEL v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  unint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  SEL v27;
  SEL v28;

  if (a1)
  {
    if (objc_getProperty(a1, a2, 120, 1))
    {
      Property = objc_getProperty(a1, v3, 120, 1);
      dispatch_source_cancel(Property);
      objc_setProperty_atomic(a1, v5, 0, 120);
    }
    objc_setProperty_atomic(a1, v3, 0, 24);
    objc_setProperty_atomic(a1, v6, 0, 32);
    objc_setProperty_atomic(a1, v7, 0, 40);
    objc_setProperty_atomic(a1, v8, 0, 48);
    objc_setProperty_atomic(a1, v9, 0, 56);
    objc_msgSend(objc_getProperty(a1, v10, 144, 1), "removeAllObjects");
    objc_msgSend(a1, "workflow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endSignpostGroups");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      v15 = 0;
      do
      {
        v16 = objc_getProperty(a1, v14, 144, 1);
        v17 = (void *)MEMORY[0x24BDBCEF8];
        v18 = v16;
        objc_msgSend(v17, "null");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v19);

        ++v15;
        objc_msgSend(a1, "workflow");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "endSignpostGroups");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "count");

      }
      while (v15 < v22);
    }
    v23 = objc_alloc(MEMORY[0x24BDBCEB8]);
    objc_msgSend(a1, "workflow");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "allSignposts");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v23, "initWithCapacity:", objc_msgSend(v25, "count"));
    objc_setProperty_atomic(a1, v27, v26, 96);

    objc_setProperty_atomic(a1, v28, 0, 128);
  }
}

- (id)timeoutSource
{
  if (result)
    return objc_getProperty(result, a2, 120, 1);
  return result;
}

- (void)setTimeoutSource:(void *)a1
{
  if (a1)
    objc_setProperty_atomic(a1, newValue, newValue, 120);
}

- (void)setEventStart:(void *)a1
{
  if (a1)
    objc_setProperty_atomic(a1, newValue, newValue, 24);
}

- (void)setAllSignpostTrackersMutable:(void *)a1
{
  if (a1)
    objc_setProperty_atomic(a1, newValue, newValue, 96);
}

- (void)setOpenIndividuatedIntervalsWithFieldNameMatchingAnEndSignpostFromBeforeEventStart:(void *)a1
{
  if (a1)
    objc_setProperty_atomic(a1, newValue, newValue, 128);
}

- (id)valueForFieldName:(void *)a3 inSignpostObject:
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  id v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint8_t v46;
  uint64_t v47;
  void *v48;
  _BYTE buf[24];
  uint64_t v50;
  _BYTE v51[24];
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v52 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = 0;
  if (a1 && v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v6;
      -[WRWorkflowEventTracker valueForFieldName:inSignpostEvent:](a1, v5, v8);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        objc_msgSend(v8, "name");

        objc_msgSend(a1, "workflow");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "name");

        objc_msgSend(a1, "eventIdentifier");
        objc_msgSend(a1, "eventIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = *__error();
        _wrlog();
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = os_log_type_enabled(v12, OS_LOG_TYPE_FAULT);
        if (v10)
        {
          if (v13)
          {
            objc_msgSend(a1, "workflow");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "name");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "eventIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "name");
            v17 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            *(_QWORD *)&buf[4] = v15;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v16;
            *(_WORD *)&buf[22] = 2114;
            v50 = (uint64_t)v17;
            *(_WORD *)v51 = 2114;
            *(_QWORD *)&v51[2] = v5;
            *(_WORD *)&v51[10] = 2112;
            *(_QWORD *)&v51[12] = 0;
            _os_log_fault_impl(&dword_24A5B4000, v12, OS_LOG_TYPE_FAULT, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: No field value", buf, 0x34u);

          }
        }
        else if (v13)
        {
          objc_msgSend(a1, "workflow");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "name");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "name");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = v41;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v42;
          *(_WORD *)&buf[22] = 2114;
          v50 = (uint64_t)v5;
          strcpy(v51, "@\b");
          v51[3] = 0;
          *(_WORD *)&v51[4] = 0;
          *(_DWORD *)&v51[6] = 0;
          _os_log_fault_impl(&dword_24A5B4000, v12, OS_LOG_TYPE_FAULT, "%{public}@: %{public}@: %{public}@->%@: No field value", buf, 0x2Au);

        }
        *__error() = v11;
      }
LABEL_29:

      goto LABEL_30;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "beginEvent");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[WRWorkflowEventTracker valueForFieldName:inSignpostEvent:](a1, v5, v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v7 = v18;
      }
      else
      {
        objc_msgSend(v6, "endEvent");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[WRWorkflowEventTracker valueForFieldName:inSignpostEvent:](a1, v5, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v30)
        {
          objc_msgSend(v6, "name");

          objc_msgSend(a1, "workflow");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "name");

          objc_msgSend(a1, "eventIdentifier");
          objc_msgSend(a1, "eventIdentifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v33 = *__error();
          _wrlog();
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = os_log_type_enabled(v34, OS_LOG_TYPE_FAULT);
          if (v32)
          {
            if (v35)
            {
              objc_msgSend(a1, "workflow");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "name");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "eventIdentifier");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "name");
              v38 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544386;
              *(_QWORD *)&buf[4] = v36;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v37;
              *(_WORD *)&buf[22] = 2114;
              v50 = (uint64_t)v38;
              *(_WORD *)v51 = 2114;
              *(_QWORD *)&v51[2] = v5;
              *(_WORD *)&v51[10] = 2112;
              *(_QWORD *)&v51[12] = 0;
              _os_log_fault_impl(&dword_24A5B4000, v34, OS_LOG_TYPE_FAULT, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: No field value", buf, 0x34u);

            }
          }
          else if (v35)
          {
            objc_msgSend(a1, "workflow");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "name");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "name");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            *(_QWORD *)&buf[4] = v44;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v45;
            *(_WORD *)&buf[22] = 2114;
            v50 = (uint64_t)v5;
            strcpy(v51, "@\b");
            v51[3] = 0;
            *(_WORD *)&v51[4] = 0;
            *(_DWORD *)&v51[6] = 0;
            _os_log_fault_impl(&dword_24A5B4000, v34, OS_LOG_TYPE_FAULT, "%{public}@: %{public}@: %{public}@->%@: No field value", buf, 0x2Au);

          }
          *__error() = v33;
        }
        v7 = v30;

      }
      goto LABEL_29;
    }
    objc_msgSend(a1, "workflow");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "name");

    objc_msgSend(a1, "eventIdentifier");
    objc_msgSend(a1, "eventIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = *__error();
    _wrlog();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_FAULT);
    if (v20)
    {
      if (v23)
        -[WRWorkflowEventTracker valueForFieldName:inSignpostObject:].cold.2((uint64_t)a1, (uint64_t)v6, (uint64_t)v22, v24, v25, v26, v27, v28, v46, v47, *(uint64_t *)buf, *(uint64_t *)&buf[8], *(uint64_t *)&buf[16], v50, *(uint64_t *)v51, *(uint64_t *)&v51[8], *(uint64_t *)&v51[16], v52, v53,
          v54,
          v55,
          v56);
    }
    else if (v23)
    {
      -[WRWorkflowEventTracker valueForFieldName:inSignpostObject:].cold.1();
    }

    v7 = 0;
    *__error() = v21;
  }
LABEL_30:

  return v7;
}

- (id)valueForFieldName:(void *)a3 inSignpostEvent:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  id obj;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  uint64_t v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = 0;
  if (a1 && v5)
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    objc_msgSend(v6, "metadataSegments");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
    if (v9)
    {
      v10 = v9;
      v40 = a1;
      v41 = v7;
      v43 = v5;
      v11 = *(_QWORD *)v49;
      while (1)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v49 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          objc_msgSend(v13, "placeholderTokens", v40);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v62, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v45;
LABEL_10:
            v18 = 0;
            while (1)
            {
              if (*(_QWORD *)v45 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v18);
              if ((objc_msgSend(v19, "hasPrefix:", CFSTR("name=")) & 1) != 0)
                break;
              if (v16 == ++v18)
              {
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v62, 16);
                if (v16)
                  goto LABEL_10;
                goto LABEL_16;
              }
            }
            v20 = PlaceholderNameMatches(v19, v43);

            if (!v20)
              continue;
            objc_msgSend(v13, "argument");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = v41;
            v5 = v43;
            -[WRWorkflowEventTracker checkForNonPublicField:fieldName:messageArgument:]((uint64_t)v40, v41, v43, v21);
            v22 = objc_msgSend(v21, "type");
            switch(v22)
            {
              case 3:
                objc_msgSend(v21, "argumentObject");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "stringValue");
                v8 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_38;
              case 2:
                objc_msgSend(v41, "name");

                objc_msgSend(v40, "workflow");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "name");

                objc_msgSend(v40, "eventIdentifier");
                objc_msgSend(v40, "eventIdentifier");
                v25 = (void *)objc_claimAutoreleasedReturnValue();

                v26 = *__error();
                _wrlog();
                v27 = objc_claimAutoreleasedReturnValue();
                v28 = os_log_type_enabled(v27, OS_LOG_TYPE_FAULT);
                if (v25)
                {
                  if (v28)
                  {
                    objc_msgSend(v40, "workflow");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "name");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v40, "eventIdentifier");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v41, "name");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138544386;
                    v53 = v30;
                    v54 = 2114;
                    v55 = v31;
                    v56 = 2114;
                    v57 = v32;
                    v58 = 2114;
                    v59 = v43;
                    v60 = 2112;
                    v61 = 0;
                    _os_log_fault_impl(&dword_24A5B4000, v27, OS_LOG_TYPE_FAULT, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: metadata is data type", buf, 0x34u);
                    goto LABEL_33;
                  }
LABEL_37:

                  v8 = 0;
                  *__error() = v26;
                  goto LABEL_38;
                }
                if (!v28)
                  goto LABEL_37;
                objc_msgSend(v40, "workflow");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "name");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "name");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v53 = v37;
                v54 = 2114;
                v55 = v38;
                v56 = 2114;
                v57 = v43;
                v58 = 2112;
                v59 = 0;
                _os_log_fault_impl(&dword_24A5B4000, v27, OS_LOG_TYPE_FAULT, "%{public}@: %{public}@: %{public}@->%@: metadata is data type", buf, 0x2Au);
                break;
              case 1:
                objc_msgSend(v21, "argumentObject");
                v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_38:

                goto LABEL_39;
              default:
                objc_msgSend(v41, "name");

                objc_msgSend(v40, "workflow");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "name");

                objc_msgSend(v40, "eventIdentifier");
                objc_msgSend(v40, "eventIdentifier");
                v34 = (void *)objc_claimAutoreleasedReturnValue();

                v26 = *__error();
                _wrlog();
                v27 = objc_claimAutoreleasedReturnValue();
                v35 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
                if (v34)
                {
                  if (v35)
                  {
                    objc_msgSend(v40, "workflow");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "name");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v40, "eventIdentifier");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v41, "name");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138544386;
                    v53 = v30;
                    v54 = 2114;
                    v55 = v31;
                    v56 = 2114;
                    v57 = v32;
                    v58 = 2114;
                    v59 = v43;
                    v60 = 2112;
                    v61 = 0;
                    _os_log_error_impl(&dword_24A5B4000, v27, OS_LOG_TYPE_ERROR, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: found missing individuation identifier", buf, 0x34u);
LABEL_33:

                    v5 = v43;
                  }
                  goto LABEL_37;
                }
                if (!v35)
                  goto LABEL_37;
                objc_msgSend(v40, "workflow");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "name");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "name");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v53 = v37;
                v54 = 2114;
                v55 = v38;
                v56 = 2114;
                v57 = v43;
                v58 = 2112;
                v59 = 0;
                _os_log_error_impl(&dword_24A5B4000, v27, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: %{public}@->%@: found missing individuation identifier", buf, 0x2Au);
                break;
            }

            goto LABEL_37;
          }
LABEL_16:

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
        if (!v10)
        {
          v8 = 0;
          v5 = v43;
          v7 = v41;
          goto LABEL_39;
        }
      }
    }
    v8 = 0;
LABEL_39:

  }
  return v8;
}

- (id)individuationIdentifierForSignpostObject:(void *)a3 individuationFieldName:
{
  if (a1)
  {
    -[WRWorkflowEventTracker valueForFieldName:inSignpostObject:](a1, a3, a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)checkForNonPublicField:(void *)a3 fieldName:(void *)a4 messageArgument:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (a1 && v8 && *(_QWORD *)(a1 + 88) && objc_msgSend(v8, "privacyLevel") != 2)
  {
    v10 = *(void **)(a1 + 88);
    objc_msgSend(v15, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v13 = *(void **)(a1 + 88);
      objc_msgSend(v15, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

    }
    if ((objc_msgSend(v12, "containsObject:", v7) & 1) == 0)
      objc_msgSend(v12, "addObject:", v7);

  }
}

- (id)individuationIdentifierForSignpostEvent:(void *)a3 individuationFieldName:
{
  if (a1)
  {
    -[WRWorkflowEventTracker valueForFieldName:inSignpostEvent:](a1, a3, a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)trackerForWRSignpost:(void *)a3 individuationIdentifier:
{
  id v5;
  const char *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id *v17;
  SEL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v7 = a3;
  if (a1)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = objc_getProperty(a1, v6, 96, 1);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v12);
        objc_msgSend(v13, "signpost", (_QWORD)v20);
        v14 = (id)objc_claimAutoreleasedReturnValue();

        if (v14 == v5)
          break;
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v10)
            goto LABEL_4;
          goto LABEL_17;
        }
      }
      objc_msgSend(v13, "individuationIdentifier");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      if ((id)v15 == v7 || v7 && v15 && (objc_msgSend(v7, "isEqualToString:", v15) & 1) != 0)
      {
        v17 = v13;

        goto LABEL_18;
      }

    }
LABEL_17:

    v17 = -[WRSignpostTracker initWithSignpost:individuationIdentifier:]((id *)[WRSignpostTracker alloc], v5, v7);
    objc_msgSend(objc_getProperty(a1, v18, 96, 1), "addObject:", v17);
  }
  else
  {
    v17 = 0;
  }
LABEL_18:

  return v17;
}

- (uint64_t)haveAnyEndSignpostsWithIndividuationFieldName:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(a1, "workflow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endSignpostGroups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v26;
      v20 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v26 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v11 = v10;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v22;
            while (2)
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v22 != v14)
                  objc_enumerationMutation(v11);
                objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "individuationFieldName");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend(v16, "isEqualToString:", v3);

                if (v17)
                {

                  v18 = 1;
                  goto LABEL_20;
                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
              if (v13)
                continue;
              break;
            }
          }

          v8 = v20;
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        v18 = 0;
      }
      while (v7);
    }
    else
    {
      v18 = 0;
    }
LABEL_20:

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)sawIndividuationFieldName:(void *)a3 withIndividuationIdentifier:
{
  __CFString *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  const char *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  _BOOL4 v25;
  __CFString *v26;
  const char *ClassName;
  os_log_t v28;
  SEL v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  _BOOL4 v34;
  NSObject *v35;
  __CFString *v36;
  void *v37;
  __CFString *v38;
  __CFString *v39;
  os_log_t v40;
  NSObject *v41;
  __CFString *v42;
  NSObject *v43;
  const char *v44;
  uint32_t v45;
  void *v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  os_log_t loga;
  NSObject *logb;
  os_log_t logc;
  os_log_t log;
  NSObject *v56;
  int v57;
  NSObject *v58;
  __CFString *v59;
  unint64_t v60;
  id obj;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  os_log_t v67;
  __int16 v68;
  const __CFString *v69;
  __int16 v70;
  const __CFString *v71;
  __int16 v72;
  __CFString *v73;
  __int16 v74;
  __CFString *v75;
  __int16 v76;
  void *v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v59 = a3;
  if (a1)
  {
    objc_msgSend(a1, "workflow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endSignpostGroups");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v7, "count"))
      goto LABEL_44;
    v8 = 0;
    v50 = v7;
    while (1)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      obj = v9;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
      if (!v10)
        goto LABEL_43;
      v11 = v10;
      v12 = *(_QWORD *)v63;
      v60 = v8;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v63 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v13);
          objc_msgSend(v14, "individuationFieldName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v5);

          if (v16)
          {
            objc_msgSend(objc_getProperty(a1, v17, 144, 1), "objectAtIndexedSubscript:", v8);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              goto LABEL_37;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v19 = v18;
              goto LABEL_20;
            }
            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18 != v20)
            {
              objc_msgSend(a1, "workflow");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "name");

              objc_msgSend(a1, "eventIdentifier");
              objc_msgSend(a1, "eventIdentifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              v23 = *__error();
              _wrlog();
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = os_log_type_enabled(v24, OS_LOG_TYPE_FAULT);
              if (v22)
              {
                if (v25)
                {
                  objc_msgSend(a1, "workflow");
                  loga = (os_log_t)objc_claimAutoreleasedReturnValue();
                  -[NSObject name](loga, "name");
                  v56 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(a1, "eventIdentifier");
                  v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  ClassName = object_getClassName(v18);
                  *(_DWORD *)buf = 138543874;
                  v67 = v56;
                  v68 = 2114;
                  v69 = v26;
                  v70 = 2080;
                  v71 = (const __CFString *)ClassName;
                  _os_log_fault_impl(&dword_24A5B4000, v24, OS_LOG_TYPE_FAULT, "%{public}@<%{public}@>: candidateEndSignpostTracker is bad class %s", buf, 0x20u);

                  v28 = loga;
                  goto LABEL_41;
                }
              }
              else if (v25)
              {
                objc_msgSend(a1, "workflow");
                v58 = objc_claimAutoreleasedReturnValue();
                -[NSObject name](v58, "name");
                v47 = objc_claimAutoreleasedReturnValue();
                v48 = object_getClassName(v18);
                *(_DWORD *)buf = 138543618;
                v67 = v47;
                v68 = 2080;
                v69 = (const __CFString *)v48;
                _os_log_fault_impl(&dword_24A5B4000, v24, OS_LOG_TYPE_FAULT, "%{public}@: candidateEndSignpostTracker is bad class %s", buf, 0x16u);

                v28 = v58;
LABEL_41:

              }
              *__error() = v23;
            }
            v19 = objc_alloc_init(MEMORY[0x24BDBCED8]);
            objc_msgSend(objc_getProperty(a1, v29, 144, 1), "setObject:atIndexedSubscript:", v19, v60);
LABEL_20:
            objc_msgSend(v19, "objectForKeyedSubscript:", v59);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            if (v30)
              goto LABEL_36;
            objc_msgSend(a1, "workflow");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "name");

            objc_msgSend(a1, "eventIdentifier");
            objc_msgSend(a1, "eventIdentifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            v57 = *__error();
            _wrlog();
            v33 = objc_claimAutoreleasedReturnValue();
            v34 = os_log_type_enabled(v33, OS_LOG_TYPE_INFO);
            if (v5)
            {
              if (v32)
              {
                if (v34)
                {
                  objc_msgSend(a1, "workflow");
                  v51 = objc_claimAutoreleasedReturnValue();
                  -[NSObject name](v51, "name");
                  v35 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(a1, "eventIdentifier");
                  logb = v33;
                  v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "name");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544642;
                  v67 = v35;
                  v68 = 2114;
                  v69 = v36;
                  v70 = 2114;
                  v71 = CFSTR("<signpost>");
                  v72 = 2114;
                  v73 = v5;
                  v74 = 2112;
                  v75 = v59;
                  v76 = 2112;
                  v77 = v37;
                  _os_log_impl(&dword_24A5B4000, logb, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: Saw new individuation identifier needed for end signpost %@", buf, 0x3Eu);

                  v33 = logb;
                  goto LABEL_28;
                }
LABEL_35:

                *__error() = v57;
                objc_msgSend(MEMORY[0x24BDBCEF8], "null");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "setObject:forKeyedSubscript:", v46, v59);

LABEL_36:
                v8 = v60;
LABEL_37:

                goto LABEL_38;
              }
              if (!v34)
                goto LABEL_35;
              objc_msgSend(a1, "workflow");
              log = (os_log_t)objc_claimAutoreleasedReturnValue();
              -[NSObject name](log, "name");
              v41 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "name");
              v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544386;
              v67 = v41;
              v68 = 2114;
              v69 = CFSTR("<signpost>");
              v70 = 2114;
              v71 = v5;
              v72 = 2112;
              v73 = v59;
              v74 = 2112;
              v75 = v42;
              v43 = v33;
              v44 = "%{public}@: %{public}@: %{public}@->%@: Saw new individuation identifier needed for end signpost %@";
              v45 = 52;
LABEL_33:
              _os_log_impl(&dword_24A5B4000, v43, OS_LOG_TYPE_INFO, v44, buf, v45);

              v40 = log;
            }
            else
            {
              if (!v32)
              {
                if (!v34)
                  goto LABEL_35;
                objc_msgSend(a1, "workflow");
                log = (os_log_t)objc_claimAutoreleasedReturnValue();
                -[NSObject name](log, "name");
                v41 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "name");
                v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v67 = v41;
                v68 = 2114;
                v69 = CFSTR("<signpost>");
                v70 = 2112;
                v71 = v42;
                v43 = v33;
                v44 = "%{public}@: %{public}@: Saw new individuation identifier needed for end signpost %@";
                v45 = 32;
                goto LABEL_33;
              }
              if (!v34)
                goto LABEL_35;
              objc_msgSend(a1, "workflow");
              v51 = objc_claimAutoreleasedReturnValue();
              -[NSObject name](v51, "name");
              logc = (os_log_t)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "eventIdentifier");
              v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "name");
              v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v67 = logc;
              v68 = 2114;
              v69 = v38;
              v70 = 2114;
              v71 = CFSTR("<signpost>");
              v72 = 2112;
              v73 = v39;
              _os_log_impl(&dword_24A5B4000, v33, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: Saw new individuation identifier needed for end signpost %@", buf, 0x2Au);

LABEL_28:
              v40 = v51;
            }

            goto LABEL_35;
          }
LABEL_38:
          ++v13;
        }
        while (v11 != v13);
        v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
        v11 = v49;
      }
      while (v49);
LABEL_43:

      ++v8;
      v7 = v50;
      if (v8 >= objc_msgSend(v50, "count"))
      {
LABEL_44:

        break;
      }
    }
  }

}

- (void)applySignpost:(void *)a3 toSignpostTracker:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  void *v26;
  unint64_t v27;
  id i;
  const char *v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  WRTimestampAndThread *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  id *v40;
  const char *v41;
  id v42;
  const char *v43;
  void *v44;
  void *v45;
  ptrdiff_t v46;
  void *v47;
  void *v48;
  int v49;
  NSObject *v50;
  _BOOL4 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  int v59;
  NSObject *v60;
  _BOOL4 v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id Property;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  _BOOL4 v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  os_log_t v80;
  void *v81;
  void *v82;
  _BOOL4 v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  id *v91;
  WRTimestampAndThread *v92;
  void *v93;
  void *v94;
  WRTimestampAndThread *v95;
  void *v96;
  void *v97;
  id *v98;
  const char *v99;
  id *v100;
  id v101;
  const char *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  __int128 v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  NSObject *v116;
  void *v117;
  os_log_t log;
  NSObject *logb;
  os_log_t loga;
  uint64_t v121;
  int v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  int v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  uint64_t v131;
  void *v132;
  void *v133;
  uint64_t v134;
  void *v135;
  int v136;
  uint64_t v137;
  uint64_t v138;
  void (*v139)(uint64_t, void *);
  void *v140;
  id v141;
  void *v142;
  uint8_t buf[4];
  void *v144;
  __int16 v145;
  void *v146;
  __int16 v147;
  _BYTE v148[50];
  __int16 v149;
  void *v150;
  uint64_t v151;

  v151 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    v137 = MEMORY[0x24BDAC760];
    v138 = 3221225472;
    v139 = __58__WRWorkflowEventTracker_applySignpost_toSignpostTracker___block_invoke;
    v140 = &unk_251BE4558;
    v8 = v6;
    v141 = v8;
    v142 = a1;
    v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x24BD14614](&v137);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v5;
      if (objc_msgSend(v10, "isSyntheticIntervalEvent"))
      {
        objc_msgSend(v8, "signpost");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "individuationFieldName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          objc_msgSend(v10, "name");

          objc_msgSend(a1, "workflow");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "name");

          objc_msgSend(a1, "eventIdentifier");
          objc_msgSend(a1, "eventIdentifier");
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          v59 = *__error();
          _wrlog();
          v60 = objc_claimAutoreleasedReturnValue();
          v61 = os_log_type_enabled(v60, OS_LOG_TYPE_FAULT);
          if (v58)
          {
            if (v61)
              -[WRWorkflowEventTracker applySignpost:toSignpostTracker:].cold.2((uint64_t)a1, (uint64_t)v10, (uint64_t)v60, v62, v63, v64, v65, v66, v111, v115, (uint64_t)log, v121, v123, v125, v127, v131, v134, v137, v138,
                (uint64_t)v139,
                (uint64_t)v140);
          }
          else if (v61)
          {
            -[WRWorkflowEventTracker applySignpost:toSignpostTracker:].cold.1();
          }

          *__error() = v59;
          goto LABEL_66;
        }
        objc_msgSend(v8, "signpost");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "individuationFieldName");

        objc_msgSend(v8, "individuationIdentifier");
        objc_msgSend(v10, "name");

        objc_msgSend(a1, "workflow");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "name");

        objc_msgSend(a1, "eventIdentifier");
        objc_msgSend(a1, "eventIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = *__error();
        _wrlog();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = os_log_type_enabled(v17, OS_LOG_TYPE_FAULT);
        if (v15)
        {
          if (v18)
          {
            objc_msgSend(a1, "workflow");
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v135, "name");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "eventIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "name");
            v128 = v7;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "signpost");
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v132, "individuationFieldName");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "individuationIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            v144 = v19;
            v145 = 2114;
            v146 = v20;
            v147 = 2114;
            *(_QWORD *)v148 = v21;
            *(_WORD *)&v148[8] = 2114;
            *(_QWORD *)&v148[10] = v22;
            *(_WORD *)&v148[18] = 2112;
            *(_QWORD *)&v148[20] = v23;
            _os_log_fault_impl(&dword_24A5B4000, v17, OS_LOG_TYPE_FAULT, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: Handling synthetic event as SignpostEvent, not SignpostInterval", buf, 0x34u);

            v7 = v128;
LABEL_85:

          }
        }
        else if (v18)
        {
          objc_msgSend(a1, "workflow");
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v135, "name");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "name");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "signpost");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "individuationFieldName");
          v130 = v7;
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "individuationIdentifier");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v144 = v106;
          v145 = 2114;
          v146 = v107;
          v147 = 2114;
          *(_QWORD *)v148 = v109;
          *(_WORD *)&v148[8] = 2112;
          *(_QWORD *)&v148[10] = v110;
          _os_log_fault_impl(&dword_24A5B4000, v17, OS_LOG_TYPE_FAULT, "%{public}@: %{public}@: %{public}@->%@: Handling synthetic event as SignpostEvent, not SignpostInterval", buf, 0x2Au);

          v7 = v130;
          goto LABEL_85;
        }

        *__error() = v16;
        goto LABEL_66;
      }
      ((void (**)(_QWORD, id))v9)[2](v9, v10);
      v35 = [WRTimestampAndThread alloc];
      v36 = objc_msgSend(v10, "processID");
      v37 = (void *)objc_msgSend(v10, "threadID");
      v38 = (void *)objc_msgSend(v10, "endNanoseconds");
      objc_msgSend(v10, "endDate");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = -[WRTimestampAndThread initWithPID:threadID:machContTimeNs:date:]((id *)&v35->super.isa, v36, v37, v38, v39);

      if (objc_msgSend(v10, "eventType"))
      {
        if (v8)
        {
          v42 = objc_getProperty(v8, v41, 48, 1);
          if (v42)
            goto LABEL_36;
        }
        v42 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        if (!v8)
          goto LABEL_36;
        v44 = v8;
        v45 = v42;
        v46 = 48;
      }
      else
      {
        if (v8)
        {
          v42 = objc_getProperty(v8, v41, 48, 1);
          if (v42)
            goto LABEL_36;
        }
        v42 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        if (!v8)
          goto LABEL_36;
        v44 = v8;
        v45 = v42;
        v46 = 56;
      }
      objc_setProperty_atomic(v44, v43, v45, v46);
LABEL_36:
      -[WRTimestampAndThread insertIntoSortedArray:]((uint64_t)v40, v42);

LABEL_66:
LABEL_80:

      goto LABEL_81;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(a1, "workflow");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "name");

      objc_msgSend(a1, "eventIdentifier");
      objc_msgSend(a1, "eventIdentifier");
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      v49 = *__error();
      _wrlog();
      v50 = objc_claimAutoreleasedReturnValue();
      v51 = os_log_type_enabled(v50, OS_LOG_TYPE_FAULT);
      if (v48)
      {
        if (v51)
          -[WRWorkflowEventTracker valueForFieldName:inSignpostObject:].cold.2((uint64_t)a1, (uint64_t)v5, (uint64_t)v50, v52, v53, v54, v55, v56, v111, *((uint64_t *)&v111 + 1), v115, (uint64_t)log, v121, v123, v125, v127, v131, v134, v137,
            v138,
            (uint64_t)v139,
            (uint64_t)v140);
      }
      else if (v51)
      {
        -[WRWorkflowEventTracker valueForFieldName:inSignpostObject:].cold.1();
      }

      *__error() = v49;
      goto LABEL_80;
    }
    objc_msgSend(v5, "beginEvent");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endEvent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    if (!v8)
      goto LABEL_17;
LABEL_10:
    for (i = objc_getProperty(v8, v25, 56, 1); ; i = 0)
    {
      if (v27 >= objc_msgSend(i, "count"))
      {
        v31 = 0;
        goto LABEL_43;
      }
      v30 = v8 ? objc_getProperty(v8, v29, 56, 1) : 0;
      objc_msgSend(v30, "objectAtIndexedSubscript:", v27);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "machContTimeNs");
      if (v32 == objc_msgSend(v24, "startNanoseconds"))
      {
        v33 = objc_msgSend(v31, "threadID");
        if (v33 == objc_msgSend(v24, "threadID"))
          break;
      }

      ++v27;
      if (v8)
        goto LABEL_10;
LABEL_17:
      ;
    }
    if (v8)
      Property = objc_getProperty(v8, v34, 56, 1);
    else
      Property = 0;
    objc_msgSend(Property, "removeObjectAtIndex:", v27);
LABEL_43:
    if ((objc_msgSend(v24, "isSyntheticIntervalEvent") & 1) == 0 && !v31)
      ((void (**)(_QWORD, void *))v9)[2](v9, v24);
    ((void (**)(_QWORD, void *))v9)[2](v9, v26);
    v126 = objc_msgSend(v24, "processID");
    v124 = (void *)objc_msgSend(v24, "threadID");
    v136 = objc_msgSend(v26, "processID");
    v133 = (void *)objc_msgSend(v26, "threadID");
    v129 = v7;
    if ((objc_msgSend(v24, "overridesBeginTime") & 1) == 0 && !objc_msgSend(v26, "overridesBeginTime"))
    {
      if ((objc_msgSend(v24, "overridesEndTime") & 1) != 0 || objc_msgSend(v26, "overridesEndTime"))
      {
        v133 = 0;
        v136 = -1;
      }
      goto LABEL_72;
    }
    if ((objc_msgSend(v24, "overridesEndTime") & 1) == 0 && !objc_msgSend(v26, "overridesEndTime"))
    {
      v124 = 0;
      v126 = -1;
LABEL_72:
      if (v31)
      {
        v91 = v31;
      }
      else
      {
        v92 = [WRTimestampAndThread alloc];
        v93 = (void *)objc_msgSend(v24, "startNanoseconds");
        objc_msgSend(v24, "beginDate");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = -[WRTimestampAndThread initWithPID:threadID:machContTimeNs:date:]((id *)&v92->super.isa, v126, v124, v93, v94);

      }
      v95 = [WRTimestampAndThread alloc];
      v96 = (void *)objc_msgSend(v5, "endNanoseconds");
      objc_msgSend(v5, "endDate");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = -[WRTimestampAndThread initWithPID:threadID:machContTimeNs:date:]((id *)&v95->super.isa, v136, v133, v96, v97);

      v100 = -[WRIntervalAndThreads initWithStart:end:]((id *)[WRIntervalAndThreads alloc], v91, v98);
      if (!v8 || (v101 = objc_getProperty(v8, v99, 40, 1)) == 0)
      {
        v101 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        if (v8)
          objc_setProperty_atomic(v8, v102, v101, 40);
      }
      -[WRIntervalAndThreads insertIntoSortedArray:]((uint64_t)v100, v101);

      v7 = v129;
      goto LABEL_80;
    }
    objc_msgSend(v8, "signpost");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "individuationFieldName");
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    if (v69)
    {
      objc_msgSend(v8, "signpost");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "individuationFieldName");

      objc_msgSend(v8, "individuationIdentifier");
      objc_msgSend(v26, "name");

      objc_msgSend(a1, "workflow");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "name");

      objc_msgSend(a1, "eventIdentifier");
      objc_msgSend(a1, "eventIdentifier");
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      v122 = *__error();
      _wrlog();
      v73 = objc_claimAutoreleasedReturnValue();
      v74 = os_log_type_enabled(v73, OS_LOG_TYPE_INFO);
      if (v72)
      {
        if (v74)
        {
          objc_msgSend(a1, "workflow");
          v116 = objc_claimAutoreleasedReturnValue();
          -[NSObject name](v116, "name");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "eventIdentifier");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "name");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "signpost");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "individuationFieldName");
          logb = v73;
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "individuationIdentifier");
          v78 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138545410;
          v144 = v112;
          v145 = 2114;
          v146 = v75;
          v147 = 2114;
          *(_QWORD *)v148 = v76;
          *(_WORD *)&v148[8] = 2114;
          *(_QWORD *)&v148[10] = v77;
          *(_WORD *)&v148[18] = 2112;
          *(_QWORD *)&v148[20] = v78;
          v79 = (void *)v78;
          *(_WORD *)&v148[28] = 1024;
          *(_DWORD *)&v148[30] = v126;
          *(_WORD *)&v148[34] = 2048;
          *(_QWORD *)&v148[36] = v124;
          *(_WORD *)&v148[44] = 1024;
          *(_DWORD *)&v148[46] = v136;
          v149 = 2048;
          v150 = v133;
          _os_log_impl(&dword_24A5B4000, logb, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: Both begin and end times are overridden - assuming they occurred on [%d] thread 0x%#llx and [%d] thread 0x%#llx", buf, 0x54u);

          v73 = logb;
          v80 = v116;
LABEL_70:

        }
LABEL_71:

        *__error() = v122;
        goto LABEL_72;
      }
      if (!v74)
        goto LABEL_71;
      objc_msgSend(a1, "workflow");
      loga = (os_log_t)objc_claimAutoreleasedReturnValue();
      -[NSObject name](loga, "name");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "name");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "signpost");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "individuationFieldName");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "individuationIdentifier");
      v89 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545154;
      v144 = v114;
      v145 = 2114;
      v146 = v87;
      v147 = 2114;
      *(_QWORD *)v148 = v88;
      *(_WORD *)&v148[8] = 2112;
      *(_QWORD *)&v148[10] = v89;
      v90 = (void *)v89;
      *(_WORD *)&v148[18] = 1024;
      *(_DWORD *)&v148[20] = v126;
      *(_WORD *)&v148[24] = 2048;
      *(_QWORD *)&v148[26] = v124;
      *(_WORD *)&v148[34] = 1024;
      *(_DWORD *)&v148[36] = v136;
      *(_WORD *)&v148[40] = 2048;
      *(_QWORD *)&v148[42] = v133;
      _os_log_impl(&dword_24A5B4000, v73, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: %{public}@->%@: Both begin and end times are overridden - assuming they occurred on [%d] thread 0x%#llx and [%d] thread 0x%#llx", buf, 0x4Au);

    }
    else
    {
      objc_msgSend(v26, "name");

      objc_msgSend(a1, "workflow");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "name");

      objc_msgSend(a1, "eventIdentifier");
      objc_msgSend(a1, "eventIdentifier");
      v82 = (void *)objc_claimAutoreleasedReturnValue();

      v122 = *__error();
      _wrlog();
      v73 = objc_claimAutoreleasedReturnValue();
      v83 = os_log_type_enabled(v73, OS_LOG_TYPE_INFO);
      if (!v82)
      {
        if (v83)
        {
          objc_msgSend(a1, "workflow");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "name");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "name");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v144 = v104;
          v145 = 2114;
          v146 = v105;
          v147 = 1024;
          *(_DWORD *)v148 = v126;
          *(_WORD *)&v148[4] = 2048;
          *(_QWORD *)&v148[6] = v124;
          *(_WORD *)&v148[14] = 1024;
          *(_DWORD *)&v148[16] = v136;
          *(_WORD *)&v148[20] = 2048;
          *(_QWORD *)&v148[22] = v133;
          _os_log_impl(&dword_24A5B4000, v73, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: Both begin and end times are overridden - assuming they occurred on [%d] thread 0x%#llx and [%d] thread 0x%#llx", buf, 0x36u);

        }
        goto LABEL_71;
      }
      if (!v83)
        goto LABEL_71;
      objc_msgSend(a1, "workflow");
      loga = (os_log_t)objc_claimAutoreleasedReturnValue();
      -[NSObject name](loga, "name");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "eventIdentifier");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "name");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      v144 = v84;
      v145 = 2114;
      v146 = v85;
      v147 = 2114;
      *(_QWORD *)v148 = v86;
      *(_WORD *)&v148[8] = 1024;
      *(_DWORD *)&v148[10] = v126;
      *(_WORD *)&v148[14] = 2048;
      *(_QWORD *)&v148[16] = v124;
      *(_WORD *)&v148[24] = 1024;
      *(_DWORD *)&v148[26] = v136;
      *(_WORD *)&v148[30] = 2048;
      *(_QWORD *)&v148[32] = v133;
      _os_log_impl(&dword_24A5B4000, v73, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: Both begin and end times are overridden - assuming they occurred on [%d] thread 0x%#llx and [%d] thread 0x%#llx", buf, 0x40u);

    }
    v80 = loga;
    goto LABEL_70;
  }
LABEL_81:

}

void __58__WRWorkflowEventTracker_applySignpost_toSignpostTracker___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  __int128 v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  char *v26;
  char *v27;
  char v28;
  uint64_t v29;
  id v30;
  void *v31;
  const char *v32;
  id Property;
  const char *v34;
  id v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  NSObject *v44;
  _BOOL4 v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  os_log_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  NSObject *v60;
  _BOOL4 v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  _BOOL4 v71;
  os_log_t v72;
  unsigned int v73;
  int v74;
  void *v75;
  void *v76;
  _BOOL4 v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  char *v82;
  BOOL v83;
  _BYTE *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  _BOOL4 v92;
  void *v93;
  NSObject *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  _BOOL4 v99;
  void *v100;
  NSObject *v101;
  void *v102;
  void *v103;
  const char *v104;
  id v105;
  NSObject *v106;
  void *v107;
  void *v108;
  void *v109;
  NSObject *v110;
  void *v111;
  __int128 v112;
  void *v113;
  NSObject *v114;
  void *v115;
  void *v116;
  NSObject *v117;
  NSObject *logb;
  os_log_t log;
  os_log_t logc;
  os_log_t logd;
  os_log_t loga;
  int v123;
  NSObject *v124;
  int v125;
  int v126;
  int v127;
  NSObject *v128;
  void *v129;
  uint64_t v130;
  id obj;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  uint8_t buf[4];
  os_log_t v148;
  __int16 v149;
  void *v150;
  __int16 v151;
  id v152;
  __int16 v153;
  id v154;
  __int16 v155;
  id v156;
  __int16 v157;
  id v158;
  __int16 v159;
  void *v160;
  _BYTE v161[128];
  _BYTE v162[128];
  _BYTE v163[128];
  uint64_t v164;

  v164 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "signpost");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "environmentFieldNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v132 = v5;
    v129 = v3;
    v130 = a1;
    v145 = 0u;
    v146 = 0u;
    v143 = 0u;
    v144 = 0u;
    objc_msgSend(v3, "metadataSegments");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v134 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v143, v163, 16);
    if (!v134)
      goto LABEL_112;
    v133 = *(_QWORD *)v144;
    *(_QWORD *)&v6 = 138543874;
    v112 = v6;
    while (1)
    {
      for (i = 0; i != v134; ++i)
      {
        if (*(_QWORD *)v144 != v133)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * i);
        v139 = 0u;
        v140 = 0u;
        v141 = 0u;
        v142 = 0u;
        objc_msgSend(v8, "placeholderTokens", v112);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v139, v162, 16);
        if (!v10)
          goto LABEL_25;
        v11 = v10;
        v12 = *(_QWORD *)v140;
LABEL_9:
        v13 = 0;
        while (1)
        {
          if (*(_QWORD *)v140 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * v13);
          if (objc_msgSend(v14, "hasPrefix:", CFSTR("name=")))
            break;
          if (v11 == ++v13)
          {
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v139, v162, 16);
            if (!v11)
            {
LABEL_25:

              goto LABEL_26;
            }
            goto LABEL_9;
          }
        }
        v137 = 0u;
        v138 = 0u;
        v135 = 0u;
        v136 = 0u;
        v15 = v132;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v135, v161, 16);
        if (!v16)
          goto LABEL_24;
        v17 = v16;
        v18 = *(_QWORD *)v136;
LABEL_18:
        v19 = 0;
        while (1)
        {
          if (*(_QWORD *)v136 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * v19);
          if (PlaceholderNameMatches(v14, v20))
            break;
          if (v17 == ++v19)
          {
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v135, v161, 16);
            if (!v17)
            {
LABEL_24:

              goto LABEL_25;
            }
            goto LABEL_18;
          }
        }
        v30 = v20;

        if (v30)
          goto LABEL_38;
LABEL_26:
        objc_msgSend(v8, "stringPrefix");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v21)
          continue;
        v22 = v21;
        v23 = objc_msgSend(v22, "length");
        v24 = objc_retainAutorelease(v22);
        v25 = objc_msgSend(v24, "UTF8String");
        if (!v25)
          goto LABEL_77;
        v26 = (char *)v25;
        v27 = (char *)(v25 + v23 - 1);
        if (*v27 != 61)
          goto LABEL_77;
        if (v23 == 1)
        {
          v73 = 61;
          v26 = v27;
          v29 = MEMORY[0x24BDAC740];
          goto LABEL_63;
        }
        v28 = 61;
        v29 = MEMORY[0x24BDAC740];
        while (2)
        {
          if ((v28 & 0x80) == 0)
          {
            if ((*(_DWORD *)(v29 + 4 * v28 + 60) & 0x4000) != 0)
              break;
            goto LABEL_35;
          }
          if (!__maskrune(v28, 0x4000uLL))
          {
LABEL_35:
            if (v23 == 2)
              goto LABEL_62;
            v28 = v26[v23-- - 2];
            continue;
          }
          break;
        }
        v26 = &v26[v23 - 1];
LABEL_62:
        v73 = *v26;
        if ((v73 & 0x80000000) != 0)
          v74 = __maskrune(v73, 0x4000uLL);
        else
LABEL_63:
          v74 = *(_DWORD *)(v29 + 4 * v73 + 60) & 0x4000;
        if (v74)
          v82 = v26 + 1;
        else
          v82 = v26;
        v83 = v27 > v82;
        v84 = (_BYTE *)(v27 - v82);
        if (!v83)
        {
LABEL_77:
          v31 = 0;
          v30 = v24;
          goto LABEL_108;
        }
        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v82, v84, 4);

        if (!v31)
          goto LABEL_109;
        v85 = objc_msgSend(v132, "indexOfObject:", v31);
        if (v85 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_109;
        objc_msgSend(v132, "objectAtIndexedSubscript:", v85);
        v30 = (id)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
LABEL_38:
          objc_msgSend(v8, "argument");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[WRWorkflowEventTracker checkForNonPublicField:fieldName:messageArgument:](*(_QWORD *)(v130 + 40), v129, v30, v31);
          Property = *(id *)(v130 + 32);
          if (Property)
            Property = objc_getProperty(Property, v32, 32, 1);
          if (!Property)
          {
            v35 = objc_alloc_init(MEMORY[0x24BDBCED8]);
            v36 = *(void **)(v130 + 32);
            if (v36)
              objc_setProperty_atomic(v36, v34, v35, 32);

          }
          v37 = objc_msgSend(v31, "type");
          if (v37 != 3)
          {
            if (v37 == 2)
            {
              objc_msgSend(*(id *)(v130 + 32), "signpost");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "individuationFieldName");
              v55 = (void *)objc_claimAutoreleasedReturnValue();

              if (v55)
              {
                objc_msgSend(*(id *)(v130 + 32), "signpost");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "individuationFieldName");

                objc_msgSend(*(id *)(v130 + 32), "individuationIdentifier");
                objc_msgSend(v129, "name");

                objc_msgSend(*(id *)(v130 + 40), "workflow");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "name");

                objc_msgSend(*(id *)(v130 + 40), "eventIdentifier");
                objc_msgSend(*(id *)(v130 + 40), "eventIdentifier");
                v58 = (void *)objc_claimAutoreleasedReturnValue();

                v59 = *__error();
                _wrlog();
                v60 = objc_claimAutoreleasedReturnValue();
                v61 = os_log_type_enabled(v60, OS_LOG_TYPE_FAULT);
                if (v58)
                {
                  if (v61)
                  {
                    objc_msgSend(*(id *)(v130 + 40), "workflow");
                    log = (os_log_t)objc_claimAutoreleasedReturnValue();
                    -[NSObject name](log, "name");
                    v124 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(*(id *)(v130 + 40), "eventIdentifier");
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v129, "name");
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(*(id *)(v130 + 32), "signpost");
                    v116 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v116, "individuationFieldName");
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(*(id *)(v130 + 32), "individuationIdentifier");
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138544642;
                    v148 = v124;
                    v149 = 2114;
                    v150 = v62;
                    v151 = 2114;
                    v152 = v63;
                    v153 = 2114;
                    v154 = v64;
                    v155 = 2112;
                    v156 = v65;
                    v157 = 2114;
                    v158 = v30;
                    _os_log_fault_impl(&dword_24A5B4000, v60, OS_LOG_TYPE_FAULT, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: contained environment %{public}@ not a number/string", buf, 0x3Eu);
                    goto LABEL_59;
                  }
                  goto LABEL_105;
                }
                if (!v61)
                  goto LABEL_105;
                objc_msgSend(*(id *)(v130 + 40), "workflow");
                v128 = objc_claimAutoreleasedReturnValue();
                -[NSObject name](v128, "name");
                v106 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v129, "name");
                v107 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v130 + 32), "signpost");
                loga = (os_log_t)objc_claimAutoreleasedReturnValue();
                -[NSObject individuationFieldName](loga, "individuationFieldName");
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v130 + 32), "individuationIdentifier");
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544386;
                v148 = v106;
                v149 = 2114;
                v150 = v107;
                v151 = 2114;
                v152 = v108;
                v153 = 2112;
                v154 = v109;
                v155 = 2114;
                v156 = v30;
                _os_log_fault_impl(&dword_24A5B4000, v60, OS_LOG_TYPE_FAULT, "%{public}@: %{public}@: %{public}@->%@: contained environment %{public}@ not a number/string", buf, 0x34u);
                goto LABEL_97;
              }
              objc_msgSend(v129, "name");

              objc_msgSend(*(id *)(v130 + 40), "workflow");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "name");

              objc_msgSend(*(id *)(v130 + 40), "eventIdentifier");
              objc_msgSend(*(id *)(v130 + 40), "eventIdentifier");
              v91 = (void *)objc_claimAutoreleasedReturnValue();

              v59 = *__error();
              _wrlog();
              v60 = objc_claimAutoreleasedReturnValue();
              v92 = os_log_type_enabled(v60, OS_LOG_TYPE_FAULT);
              if (v91)
              {
                if (!v92)
                  goto LABEL_105;
                objc_msgSend(*(id *)(v130 + 40), "workflow");
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v93, "name");
                v94 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v130 + 40), "eventIdentifier");
                v95 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v129, "name");
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v148 = v94;
                v149 = 2114;
                v150 = v95;
                v151 = 2114;
                v152 = v96;
                v153 = 2114;
                v154 = v30;
                _os_log_fault_impl(&dword_24A5B4000, v60, OS_LOG_TYPE_FAULT, "%{public}@<%{public}@>: %{public}@: contained environment %{public}@ not a number/string", buf, 0x2Au);
                goto LABEL_87;
              }
              if (!v92)
                goto LABEL_105;
              objc_msgSend(*(id *)(v130 + 40), "workflow");
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v93, "name");
              v110 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v129, "name");
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v112;
              v148 = v110;
              v149 = 2114;
              v150 = v111;
              v151 = 2114;
              v152 = v30;
              _os_log_fault_impl(&dword_24A5B4000, v60, OS_LOG_TYPE_FAULT, "%{public}@: %{public}@: contained environment %{public}@ not a number/string", buf, 0x20u);
            }
            else
            {
              if (v37 == 1)
                goto LABEL_47;
              objc_msgSend(*(id *)(v130 + 32), "signpost");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "individuationFieldName");
              v67 = (void *)objc_claimAutoreleasedReturnValue();

              if (v67)
              {
                objc_msgSend(*(id *)(v130 + 32), "signpost");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "individuationFieldName");

                objc_msgSend(*(id *)(v130 + 32), "individuationIdentifier");
                objc_msgSend(v129, "name");

                objc_msgSend(*(id *)(v130 + 40), "workflow");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v69, "name");

                objc_msgSend(*(id *)(v130 + 40), "eventIdentifier");
                objc_msgSend(*(id *)(v130 + 40), "eventIdentifier");
                v70 = (void *)objc_claimAutoreleasedReturnValue();

                v59 = *__error();
                _wrlog();
                v60 = objc_claimAutoreleasedReturnValue();
                v71 = os_log_type_enabled(v60, OS_LOG_TYPE_ERROR);
                if (v70)
                {
                  if (v71)
                  {
                    objc_msgSend(*(id *)(v130 + 40), "workflow");
                    log = (os_log_t)objc_claimAutoreleasedReturnValue();
                    -[NSObject name](log, "name");
                    v124 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(*(id *)(v130 + 40), "eventIdentifier");
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v129, "name");
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(*(id *)(v130 + 32), "signpost");
                    v116 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v116, "individuationFieldName");
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(*(id *)(v130 + 32), "individuationIdentifier");
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138544642;
                    v148 = v124;
                    v149 = 2114;
                    v150 = v62;
                    v151 = 2114;
                    v152 = v63;
                    v153 = 2114;
                    v154 = v64;
                    v155 = 2112;
                    v156 = v65;
                    v157 = 2114;
                    v158 = v30;
                    _os_log_error_impl(&dword_24A5B4000, v60, OS_LOG_TYPE_ERROR, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: missing environment %{public}@", buf, 0x3Eu);
LABEL_59:

                    v72 = log;
LABEL_98:

                  }
LABEL_105:

                  *__error() = v59;
                  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
                  v24 = (id)objc_claimAutoreleasedReturnValue();
                  v105 = *(id *)(v130 + 32);
                  if (v105)
LABEL_106:
                    v105 = objc_getProperty(v105, v104, 32, 1);
LABEL_107:
                  objc_msgSend(v105, "setObject:forKeyedSubscript:", v24, v30);
LABEL_108:

                  v24 = v30;
LABEL_109:

                  continue;
                }
                if (!v71)
                  goto LABEL_105;
                objc_msgSend(*(id *)(v130 + 40), "workflow");
                v128 = objc_claimAutoreleasedReturnValue();
                -[NSObject name](v128, "name");
                v106 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v129, "name");
                v107 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v130 + 32), "signpost");
                loga = (os_log_t)objc_claimAutoreleasedReturnValue();
                -[NSObject individuationFieldName](loga, "individuationFieldName");
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v130 + 32), "individuationIdentifier");
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544386;
                v148 = v106;
                v149 = 2114;
                v150 = v107;
                v151 = 2114;
                v152 = v108;
                v153 = 2112;
                v154 = v109;
                v155 = 2114;
                v156 = v30;
                _os_log_error_impl(&dword_24A5B4000, v60, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: %{public}@->%@: missing environment %{public}@", buf, 0x34u);
LABEL_97:

                v72 = v128;
                goto LABEL_98;
              }
              objc_msgSend(v129, "name");

              objc_msgSend(*(id *)(v130 + 40), "workflow");
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v97, "name");

              objc_msgSend(*(id *)(v130 + 40), "eventIdentifier");
              objc_msgSend(*(id *)(v130 + 40), "eventIdentifier");
              v98 = (void *)objc_claimAutoreleasedReturnValue();

              v59 = *__error();
              _wrlog();
              v60 = objc_claimAutoreleasedReturnValue();
              v99 = os_log_type_enabled(v60, OS_LOG_TYPE_ERROR);
              if (v98)
              {
                if (!v99)
                  goto LABEL_105;
                objc_msgSend(*(id *)(v130 + 40), "workflow");
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v93, "name");
                v94 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v130 + 40), "eventIdentifier");
                v95 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v129, "name");
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v148 = v94;
                v149 = 2114;
                v150 = v95;
                v151 = 2114;
                v152 = v96;
                v153 = 2114;
                v154 = v30;
                _os_log_error_impl(&dword_24A5B4000, v60, OS_LOG_TYPE_ERROR, "%{public}@<%{public}@>: %{public}@: missing environment %{public}@", buf, 0x2Au);
LABEL_87:

LABEL_104:
                goto LABEL_105;
              }
              if (!v99)
                goto LABEL_105;
              objc_msgSend(*(id *)(v130 + 40), "workflow");
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v93, "name");
              v110 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v129, "name");
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v112;
              v148 = v110;
              v149 = 2114;
              v150 = v111;
              v151 = 2114;
              v152 = v30;
              _os_log_error_impl(&dword_24A5B4000, v60, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: missing environment %{public}@", buf, 0x20u);
            }

            goto LABEL_104;
          }
LABEL_47:
          objc_msgSend(*(id *)(v130 + 32), "signpost");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "individuationFieldName");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v39)
          {
            objc_msgSend(*(id *)(v130 + 32), "signpost");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "individuationFieldName");

            objc_msgSend(*(id *)(v130 + 32), "individuationIdentifier");
            objc_msgSend(v129, "name");

            objc_msgSend(*(id *)(v130 + 40), "workflow");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "name");

            objc_msgSend(*(id *)(v130 + 40), "eventIdentifier");
            objc_msgSend(*(id *)(v130 + 40), "eventIdentifier");
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            v43 = *__error();
            _wrlog();
            v44 = objc_claimAutoreleasedReturnValue();
            v45 = os_log_type_enabled(v44, OS_LOG_TYPE_INFO);
            if (v42)
            {
              if (v45)
              {
                objc_msgSend(*(id *)(v130 + 40), "workflow");
                v114 = objc_claimAutoreleasedReturnValue();
                -[NSObject name](v114, "name");
                v46 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v130 + 40), "eventIdentifier");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v129, "name");
                logb = v44;
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v130 + 32), "signpost");
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v113, "individuationFieldName");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v130 + 32), "individuationIdentifier");
                v123 = v43;
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "argumentObject");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544898;
                v148 = v46;
                v149 = 2114;
                v150 = v47;
                v151 = 2114;
                v152 = v48;
                v153 = 2114;
                v154 = v49;
                v155 = 2112;
                v156 = v50;
                v157 = 2114;
                v158 = v30;
                v159 = 2114;
                v160 = v51;
                _os_log_impl(&dword_24A5B4000, logb, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: contained environment %{public}@->%{public}@", buf, 0x48u);

                v43 = v123;
                v52 = v130;

                v44 = logb;
                v53 = v114;
                goto LABEL_80;
              }
LABEL_90:
              v52 = v130;
              goto LABEL_91;
            }
            if (!v45)
              goto LABEL_90;
            v52 = v130;
            objc_msgSend(*(id *)(v130 + 40), "workflow");
            v117 = objc_claimAutoreleasedReturnValue();
            -[NSObject name](v117, "name");
            logd = (os_log_t)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v129, "name");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v130 + 32), "signpost");
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v115, "individuationFieldName");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v130 + 32), "individuationIdentifier");
            v126 = v43;
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "argumentObject");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            v148 = logd;
            v149 = 2114;
            v150 = v86;
            v151 = 2114;
            v152 = v87;
            v153 = 2112;
            v154 = v88;
            v155 = 2114;
            v156 = v30;
            v157 = 2114;
            v158 = v89;
            _os_log_impl(&dword_24A5B4000, v44, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: %{public}@->%@: contained environment %{public}@->%{public}@", buf, 0x3Eu);

            v43 = v126;
            v53 = v117;
          }
          else
          {
            objc_msgSend(v129, "name");

            objc_msgSend(*(id *)(v130 + 40), "workflow");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "name");

            objc_msgSend(*(id *)(v130 + 40), "eventIdentifier");
            objc_msgSend(*(id *)(v130 + 40), "eventIdentifier");
            v76 = (void *)objc_claimAutoreleasedReturnValue();

            v43 = *__error();
            _wrlog();
            v44 = objc_claimAutoreleasedReturnValue();
            v77 = os_log_type_enabled(v44, OS_LOG_TYPE_INFO);
            if (!v76)
            {
              if (!v77)
                goto LABEL_90;
              v52 = v130;
              objc_msgSend(*(id *)(v130 + 40), "workflow");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v100, "name");
              v101 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v129, "name");
              v127 = v43;
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "argumentObject");
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v148 = v101;
              v149 = 2114;
              v150 = v102;
              v151 = 2114;
              v152 = v30;
              v153 = 2114;
              v154 = v103;
              _os_log_impl(&dword_24A5B4000, v44, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: contained environment %{public}@->%{public}@", buf, 0x2Au);

              v43 = v127;
LABEL_91:

              *__error() = v43;
              objc_msgSend(v31, "argumentObject");
              v24 = (id)objc_claimAutoreleasedReturnValue();
              v105 = *(id *)(v52 + 32);
              if (v105)
                goto LABEL_106;
              goto LABEL_107;
            }
            if (!v77)
              goto LABEL_90;
            v52 = v130;
            objc_msgSend(*(id *)(v130 + 40), "workflow");
            logc = (os_log_t)objc_claimAutoreleasedReturnValue();
            -[NSObject name](logc, "name");
            v78 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v130 + 40), "eventIdentifier");
            v125 = v43;
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v129, "name");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "argumentObject");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            v148 = v78;
            v149 = 2114;
            v150 = v79;
            v151 = 2114;
            v152 = v80;
            v153 = 2114;
            v154 = v30;
            v155 = 2114;
            v156 = v81;
            _os_log_impl(&dword_24A5B4000, v44, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: contained environment %{public}@->%{public}@", buf, 0x34u);

            v43 = v125;
            v53 = logc;
          }
LABEL_80:

          goto LABEL_91;
        }
      }
      v134 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v143, v163, 16);
      if (!v134)
      {
LABEL_112:

        v3 = v129;
        v5 = v132;
        break;
      }
    }
  }

}

- (id)eventCompletionCallback
{
  if (result)
    return objc_getProperty(result, a2, 136, 1);
  return result;
}

- (void)doneHandlingSignpostsWithEndTimeMachContNs:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id *v18;
  const char *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BYTE v30[12];
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (-[WRWorkflowEventTracker inMiddleOfEvent](self, "inMiddleOfEvent"))
  {
    -[WRWorkflowEventTracker workflow](self, "workflow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "hasMaximumEventDuration") & 1) != 0)
    {
      -[WRWorkflowEventTracker workflow](self, "workflow");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "maximumEventDuration");
      v8 = v7;
      -[WRWorkflowEventTracker eventStart](self, "eventStart");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = ((double)a3 + (double)(unint64_t)objc_msgSend(v9, "machContTimeNs")) / 1000000000.0;

      if (v8 < v10)
      {
        WRMakeError(4, CFSTR("Workflow event timed out"), v11, v12, v13, v14, v15, v16, *(uint64_t *)v30);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[WRTimestampAndThread initWithPID:threadID:machContTimeNs:date:]((id *)[WRTimestampAndThread alloc], -1, 0, (void *)a3, 0);
        -[WRWorkflowEventTracker handleError:atEndTime:]((uint64_t)self, v17, v18);

        -[WRWorkflowEventTracker resetWithoutReportingErrors](self, v19);
        return;
      }
    }
    else
    {

    }
    -[WRWorkflowEventTracker workflow](self, "workflow");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "name");

    -[WRWorkflowEventTracker eventIdentifier](self, "eventIdentifier");
    -[WRWorkflowEventTracker eventIdentifier](self, "eventIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = *__error();
    _wrlog();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v21)
    {
      if (v24)
      {
        -[WRWorkflowEventTracker workflow](self, "workflow");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "name");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[WRWorkflowEventTracker eventIdentifier](self, "eventIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v30 = 138543618;
        *(_QWORD *)&v30[4] = v26;
        v31 = 2114;
        v32 = v27;
        _os_log_impl(&dword_24A5B4000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@<%{public}@>: Incomplete event when done handling signposts, ignoring", v30, 0x16u);

      }
    }
    else if (v24)
    {
      -[WRWorkflowEventTracker workflow](self, "workflow");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "name");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v30 = 138543362;
      *(_QWORD *)&v30[4] = v29;
      _os_log_impl(&dword_24A5B4000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: Incomplete event when done handling signposts, ignoring", v30, 0xCu);

    }
    *__error() = v22;
  }
}

- (id)newConcurrentEventWithIdentifier:(void *)a1
{
  const char *v3;
  id v4;
  id Property;
  WRWorkflowEventTracker *v6;
  const char *v7;
  void *v8;
  id v9;
  SEL v10;
  id v11;
  const char *v12;
  const char *v13;
  void *v14;
  SEL v15;

  v4 = a2;
  if (a1)
  {
    Property = objc_getProperty(a1, v3, 112, 1);
    v6 = [WRWorkflowEventTracker alloc];
    objc_msgSend(a1, "workflow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (Property)
    {
      v9 = objc_getProperty(a1, v7, 112, 1);
      v11 = -[WRWorkflowEventTracker initForLiveStreamingWithWorkflow:timeoutQueue:eventCompletionCallback:](v6, "initForLiveStreamingWithWorkflow:timeoutQueue:eventCompletionCallback:", v8, v9, objc_getProperty(a1, v10, 136, 1));

    }
    else
    {
      v11 = -[WRWorkflowEventTracker initForReadbackWithWorkflow:eventCompletionCallback:](v6, "initForReadbackWithWorkflow:eventCompletionCallback:", v8, objc_getProperty(a1, v7, 136, 1));
    }

    if (v11)
      objc_setProperty_atomic(v11, v12, v4, 16);
    if (objc_getProperty(a1, v12, 104, 1))
    {
      objc_msgSend(objc_getProperty(a1, v13, 104, 1), "addObject:", v11);
    }
    else
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v11, 0);
      objc_setProperty_atomic(a1, v15, v14, 104);

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)timeoutQueue
{
  if (result)
    return objc_getProperty(result, a2, 112, 1);
  return result;
}

- (void)setEventIdentifier:(void *)a1
{
  if (a1)
    objc_setProperty_atomic(a1, newValue, newValue, 16);
}

- (void)setConcurrentEvents:(void *)a1
{
  if (a1)
    objc_setProperty_atomic(a1, newValue, newValue, 104);
}

- (BOOL)handleSignpost:(id)a3
{
  id v4;
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id *v12;
  int v13;
  void *v14;
  const char *v15;
  const char *v16;
  void *v17;
  id Property;
  __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  NSObject *v29;
  void *v30;
  void *v31;
  BOOL v32;
  int v33;
  const char *v34;
  id v35;
  void *v36;
  void *v37;
  int v38;
  NSObject *v39;
  _BOOL4 v40;
  id v41;
  void *v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  char v50;
  const char *v51;
  id v52;
  void *v53;
  void *v54;
  int v55;
  NSObject *v56;
  _BOOL4 v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  id v61;
  uint64_t v62;
  const char *v63;
  int v64;
  char v65;
  id *v66;
  id v67;
  void *v68;
  int v69;
  NSObject *v70;
  char v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  int v76;
  NSObject *v77;
  _BOOL4 v78;
  char v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  int v84;
  void *v85;
  int v86;
  void *v87;
  void *v88;
  id *v89;
  void *v90;
  int v91;
  NSObject *v92;
  id v93;
  int v94;
  uint64_t v95;
  const char *v96;
  WRWorkflowEventTracker *v97;
  id v98;
  id v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  id v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  SEL v111;
  void *v112;
  int v113;
  NSObject *v114;
  void *v115;
  void *v116;
  void *v117;
  SEL v118;
  __CFString *v119;
  SEL v120;
  id v121;
  uint64_t v122;
  void *v123;
  void *v124;
  int v125;
  NSObject *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  const char *v138;
  const char *v139;
  id v140;
  uint64_t v141;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  __CFString *v148;
  void *v149;
  void *v150;
  __CFString *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  const char *v158;
  void *v159;
  __int128 v160;
  uint64_t v161;
  _QWORD *v162;
  __int128 v163;
  uint64_t v164;
  void *v165;
  void *v166;
  uint64_t v167;
  id *v168;
  void *v169;
  WRTimestampAndThread *v170;
  void *v171;
  WRWorkflowEventTracker *selfa;
  WROpenIndividuatedSignpostInterval *selfb;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  _BYTE v186[128];
  uint8_t v187[128];
  uint8_t buf[4];
  void *v189;
  __int16 v190;
  uint64_t v191;
  __int16 v192;
  __CFString *v193;
  __int16 v194;
  id v195;
  __int16 v196;
  uint64_t v197;
  uint8_t v198[4];
  _QWORD v199[2];
  _BYTE v200[128];
  uint64_t v201;

  v201 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = objc_msgSend(v5, "isSyntheticIntervalEvent");
  -[WRWorkflowEventTracker workflow](self, "workflow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WRWorkflow wrsignpostForSignpostObject:](v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WRWorkflowEventTracker workflow](self, "workflow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "workflowSupportsConcurrentEvents");

    if ((v10 & 1) != 0)
    {
      v171 = v8;
      HIDWORD(v167) = v6;
      if (v5)
      {
        objc_msgSend(v8, "individuationFieldName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11 || objc_msgSend(v5, "eventType"))
          goto LABEL_9;
        -[WRWorkflowEventTracker workflow](self, "workflow");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "startSignposts");
        v81 = v8;
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v82, "indexOfObjectIdenticalTo:", v81) != 0x7FFFFFFFFFFFFFFFLL)
        {
          v89 = 0;
          goto LABEL_121;
        }
        objc_msgSend(v81, "individuationFieldName");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = -[WRWorkflowEventTracker haveAnyEndSignpostsWithIndividuationFieldName:](self, v83);

        if (v84)
        {
          objc_msgSend(v81, "individuationFieldName");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          -[WRWorkflowEventTracker individuationIdentifierForSignpostEvent:individuationFieldName:](self, v5, v85);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v8 = v81;
          if (!v11)
          {
LABEL_9:
            v12 = 0;
LABEL_10:

            goto LABEL_17;
          }
          selfb = [WROpenIndividuatedSignpostInterval alloc];
          v170 = [WRTimestampAndThread alloc];
          v86 = objc_msgSend(v5, "processID");
          v87 = (void *)objc_msgSend(v5, "threadID");
          v88 = (void *)objc_msgSend(v5, "startNanoseconds");
          objc_msgSend(v5, "beginDate");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = -[WRTimestampAndThread initWithPID:threadID:machContTimeNs:date:]((id *)&v170->super.isa, v86, v87, v88, v80);
          v89 = -[WROpenIndividuatedSignpostInterval initWithSignpost:individuationIdentifier:timestampAndThread:]((id *)&selfb->super.isa, v81, v11, v82);
LABEL_121:

          v8 = v171;
          v12 = v89;
          goto LABEL_10;
        }
        v12 = 0;
        v8 = v81;
      }
      else
      {
        v12 = 0;
      }
LABEL_17:
      objc_msgSend(v8, "eventIdentifierFieldName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v168 = v12;
      v169 = v4;
      selfa = self;
      if (v14)
      {

        goto LABEL_20;
      }
      if ((objc_msgSend(v8, "eventIdentifierIsSignpostID") & 1) != 0)
      {
LABEL_20:
        -[WRWorkflowEventTracker eventIdentifierForSignpostObject:wrSignopst:](self, v4, v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v176 = 0u;
          v177 = 0u;
          v174 = 0u;
          v175 = 0u;
          if (self)
            Property = objc_getProperty(self, v16, 104, 1);
          else
            Property = 0;
          v19 = (__CFString *)objc_msgSend(Property, "copy");
          v20 = -[__CFString countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v174, v186, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v175;
            while (2)
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(_QWORD *)v175 != v22)
                  objc_enumerationMutation(v19);
                v24 = *(void **)(*((_QWORD *)&v174 + 1) + 8 * i);
                objc_msgSend(v24, "eventIdentifier");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v25, "isEqualToString:", v17);

                if (v26)
                {
                  v4 = v169;
                  v33 = -[WRWorkflowEventTracker handleSignpost:wrsignpost:](v24, v169, v171);
                  if ((objc_msgSend(v24, "inMiddleOfEvent") & 1) == 0)
                  {
                    v35 = v24 ? objc_getProperty(v24, v34, 128, 1) : 0;
                    if (!objc_msgSend(v35, "count"))
                    {
                      -[WRWorkflowEventTracker workflow](selfa, "workflow");
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v36, "name");

                      objc_msgSend(v24, "eventIdentifier");
                      objc_msgSend(v24, "eventIdentifier");
                      v37 = (void *)objc_claimAutoreleasedReturnValue();

                      v38 = *__error();
                      _wrlog();
                      v39 = objc_claimAutoreleasedReturnValue();
                      v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG);
                      if (v37)
                      {
                        if (v40)
                          -[WRWorkflowEventTracker handleSignpost:].cold.5();
                      }
                      else if (v40)
                      {
                        -[WRWorkflowEventTracker handleSignpost:].cold.4(selfa, v39);
                      }

                      *__error() = v38;
                      if (selfa)
                        v140 = objc_getProperty(selfa, v139, 104, 1);
                      else
                        v140 = 0;
                      objc_msgSend(v140, "removeObjectIdenticalTo:", v24);
                    }
                  }
                  if ((v167 & 0x100000000) == 0)
                  {
                    v141 = 72;
                    if (v33)
                      v141 = 64;
                    ++*(Class *)((char *)&selfa->super.isa + v141);
                  }
                  goto LABEL_150;
                }
              }
              v21 = -[__CFString countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v174, v186, 16);
              if (v21)
                continue;
              break;
            }
          }

          v4 = v169;
          objc_msgSend(v169, "name");

          -[WRWorkflowEventTracker workflow](selfa, "workflow");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "name");

          v28 = *__error();
          _wrlog();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            -[WRWorkflowEventTracker workflow](selfa, "workflow");
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v146, "name");
            v147 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v169, "name");
            v148 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v189 = v147;
            v190 = 2114;
            v191 = (uint64_t)v17;
            v192 = 2114;
            v193 = v148;
            _os_log_debug_impl(&dword_24A5B4000, v29, OS_LOG_TYPE_DEBUG, "%{public}@<%{public}@>: %{public}@: No concurrent event with event identifier", buf, 0x20u);

            v4 = v169;
          }

          *__error() = v28;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[WRWorkflowEventTracker workflow](selfa, "workflow");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "startSignposts");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = v171;
            v32 = objc_msgSend(v31, "indexOfObjectIdenticalTo:", v171) != 0x7FFFFFFFFFFFFFFFLL;

            v4 = v169;
          }
          else
          {
            v32 = 0;
            v8 = v171;
          }
          if (v32 || v168)
          {
            objc_msgSend(v4, "name");

            -[WRWorkflowEventTracker workflow](selfa, "workflow");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "name");

            v91 = *__error();
            _wrlog();
            v92 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
            {
              -[WRWorkflowEventTracker workflow](selfa, "workflow");
              v149 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v149, "name");
              v150 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v169, "name");
              v151 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v189 = v150;
              v190 = 2114;
              v191 = (uint64_t)v17;
              v192 = 2114;
              v193 = v151;
              _os_log_debug_impl(&dword_24A5B4000, v92, OS_LOG_TYPE_DEBUG, "%{public}@<%{public}@>: %{public}@: Allocating new concurrent event", buf, 0x20u);

              v8 = v171;
              v4 = v169;

            }
            *__error() = v91;
            v93 = -[WRWorkflowEventTracker newConcurrentEventWithIdentifier:](selfa, v17);
            v94 = -[WRWorkflowEventTracker handleSignpost:wrsignpost:](v93, v4, v8);
            if ((v167 & 0x100000000) == 0)
            {
              v95 = 72;
              if (v94)
                v95 = 64;
              ++*(Class *)((char *)&selfa->super.isa + v95);
            }

          }
          else if ((v167 & 0x100000000) == 0)
          {
            ++selfa->_numOutsideSignposts;
          }
          goto LABEL_151;
        }
        if ((objc_msgSend(v8, "eventIdentifierIsSignpostID") & 1) != 0)
        {
          v19 = CFSTR("signpost id");
        }
        else
        {
          objc_msgSend(v8, "eventIdentifierFieldName");
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (!v19)
          {
            v67 = v5;
            objc_msgSend(v4, "name");

            -[WRWorkflowEventTracker workflow](selfa, "workflow");
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v123, "name");

            v69 = *__error();
            _wrlog();
            v70 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              -[WRWorkflowEventTracker handleSignpost:].cold.2();
            v19 = 0;
            v71 = 1;
LABEL_76:

            *__error() = v69;
            -[WRWorkflowEventTracker workflow](selfa, "workflow");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "startSignposts");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v74 = objc_msgSend(v73, "indexOfObjectIdenticalTo:", v171);

            v4 = v169;
            objc_msgSend(v169, "name");

            -[WRWorkflowEventTracker workflow](selfa, "workflow");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "name");

            v76 = *__error();
            _wrlog();
            v77 = objc_claimAutoreleasedReturnValue();
            v78 = os_log_type_enabled(v77, OS_LOG_TYPE_ERROR);
            if (v74 == 0x7FFFFFFFFFFFFFFFLL)
            {
              if ((v71 & 1) != 0)
              {
                if (v78)
                  -[WRWorkflowEventTracker handleSignpost:].cold.1();
              }
              else if (v78)
              {
                -[WRWorkflowEventTracker workflow](selfa, "workflow");
                v152 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v152, "name");
                v153 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v169, "name");
                v154 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v189 = v153;
                v190 = 2114;
                v191 = (uint64_t)v154;
                v192 = 2114;
                v193 = v19;
                v194 = 2112;
                v195 = 0;
                _os_log_error_impl(&dword_24A5B4000, v77, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: %{public}@->%@: Unable to get event identifier for start signpost, throwing out all current events in case they were incomplete events", buf, 0x2Au);

                v4 = v169;
              }

              *__error() = v76;
              v178 = 0u;
              v179 = 0u;
              v180 = 0u;
              v181 = 0u;
              v5 = v67;
              v97 = selfa;
              if (selfa)
                v98 = objc_getProperty(selfa, v96, 104, 1);
              else
                v98 = 0;
              v99 = v98;
              v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v178, v187, 16);
              if (v100)
              {
                v102 = v100;
                v103 = *(_QWORD *)v179;
                do
                {
                  v104 = 0;
                  do
                  {
                    if (*(_QWORD *)v179 != v103)
                      objc_enumerationMutation(v99);
                    v105 = *(void **)(*((_QWORD *)&v178 + 1) + 8 * v104);
                    -[WRWorkflowEventTracker resetWithoutReportingErrors](v105, v101);
                    if (selfa)
                      v107 = objc_getProperty(selfa, v106, 104, 1);
                    else
                      v107 = 0;
                    objc_msgSend(v107, "removeObjectIdenticalTo:", v105);
                    ++v104;
                  }
                  while (v102 != v104);
                  v108 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v178, v187, 16);
                  v102 = v108;
                }
                while (v108);
              }

              if ((v167 & 0x100000000) != 0)
                goto LABEL_150;
            }
            else
            {
              v79 = BYTE4(v167);
              if ((v71 & 1) != 0)
              {
                if (v78)
                  -[WRWorkflowEventTracker handleSignpost:].cold.2();
              }
              else if (v78)
              {
                -[WRWorkflowEventTracker workflow](selfa, "workflow");
                v155 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v155, "name");
                v156 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v169, "name");
                v157 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v189 = v156;
                v190 = 2114;
                v191 = (uint64_t)v157;
                v192 = 2114;
                v193 = v19;
                v194 = 2112;
                v195 = 0;
                _os_log_error_impl(&dword_24A5B4000, v77, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: %{public}@->%@: Unable to get event identifier, ignoring signpost", buf, 0x2Au);

                v79 = BYTE4(v167);
                v4 = v169;

              }
              *__error() = v76;
              v5 = v67;
              v97 = selfa;
              if ((v79 & 1) != 0)
                goto LABEL_150;
            }
            ++v97->_numOutsideSignposts;
LABEL_150:

            v8 = v171;
LABEL_151:

            v66 = v168;
LABEL_152:

            goto LABEL_153;
          }
        }
        v67 = v5;
        objc_msgSend(v4, "name");

        -[WRWorkflowEventTracker workflow](selfa, "workflow");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "name");

        v69 = *__error();
        _wrlog();
        v70 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          -[WRWorkflowEventTracker workflow](selfa, "workflow");
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v143, "name");
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v169, "name");
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v189 = v144;
          v190 = 2114;
          v191 = (uint64_t)v145;
          v192 = 2114;
          v193 = v19;
          v194 = 2112;
          v195 = 0;
          _os_log_error_impl(&dword_24A5B4000, v70, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: %{public}@->%@: Unable to get event identifier, ignoring signpost", buf, 0x2Au);

        }
        v71 = 0;
        goto LABEL_76;
      }
      v184 = 0u;
      v185 = 0u;
      v182 = 0u;
      v183 = 0u;
      if (self)
        v41 = objc_getProperty(self, v15, 104, 1);
      else
        v41 = 0;
      v42 = (void *)objc_msgSend(v41, "copy");
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v182, v200, 16);
      if (v43)
      {
        v45 = v43;
        v46 = 0;
        v47 = *(_QWORD *)v183;
        v161 = (uint64_t)v5;
        v162 = v199;
        *(_QWORD *)&v44 = 138543618;
        v163 = v44;
        do
        {
          v48 = 0;
          do
          {
            if (*(_QWORD *)v183 != v47)
              objc_enumerationMutation(v42);
            v49 = *(void **)(*((_QWORD *)&v182 + 1) + 8 * v48);
            v50 = -[WRWorkflowEventTracker handleSignpost:wrsignpost:](v49, v4, v8);
            if ((objc_msgSend(v49, "inMiddleOfEvent") & 1) == 0)
            {
              v52 = v49 ? objc_getProperty(v49, v51, 128, 1) : 0;
              if (!objc_msgSend(v52, "count"))
              {
                -[WRWorkflowEventTracker workflow](self, "workflow");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "name");

                objc_msgSend(v49, "eventIdentifier");
                objc_msgSend(v49, "eventIdentifier");
                v54 = (void *)objc_claimAutoreleasedReturnValue();

                v55 = *__error();
                _wrlog();
                v56 = objc_claimAutoreleasedReturnValue();
                v57 = os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG);
                if (v54)
                {
                  if (v57)
                  {
                    -[WRWorkflowEventTracker workflow](selfa, "workflow");
                    v166 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v166, "name");
                    v165 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v49, "eventIdentifier");
                    v58 = objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = v163;
                    v189 = v165;
                    v190 = 2114;
                    v191 = v58;
                    v59 = (void *)v58;
                    _os_log_debug_impl(&dword_24A5B4000, v56, OS_LOG_TYPE_DEBUG, "%{public}@<%{public}@>: concurrent workflow done", buf, 0x16u);

                  }
                }
                else if (v57)
                {
                  -[WRWorkflowEventTracker handleSignpost:].cold.8(v198, selfa, v199, v56);
                }

                *__error() = v55;
                self = selfa;
                if (selfa)
                  v61 = objc_getProperty(selfa, v60, 104, 1);
                else
                  v61 = 0;
                v4 = v169;
                v8 = v171;
                objc_msgSend(v61, "removeObjectIdenticalTo:", v49);
              }
            }
            v46 |= v50;
            ++v48;
          }
          while (v45 != v48);
          v62 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v182, v200, 16);
          v45 = v62;
        }
        while (v62);

        v5 = (id)v161;
        if ((v46 & 1) != 0)
        {
          v64 = 1;
          v65 = BYTE4(v167);
          v66 = v168;
          if (!v168)
          {
LABEL_161:
            if ((v65 & 1) != 0)
              goto LABEL_152;
            if (v64)
            {
              ++self->_numHandledSignposts;
              goto LABEL_152;
            }
LABEL_164:
            ++self->_numOutsideSignposts;
            goto LABEL_152;
          }
LABEL_138:
          if (self && objc_getProperty(self, v63, 128, 1))
          {
            objc_msgSend(objc_getProperty(self, v138, 128, 1), "addObject:", v66);
          }
          else
          {
            v159 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v66, 0);
            if (self)
              objc_setProperty_atomic(self, v158, v159, 128);

          }
          goto LABEL_161;
        }
      }
      else
      {

      }
      v65 = BYTE4(v167);
      v66 = v168;
      if (!v168)
      {
        objc_msgSend(v4, "name");

        -[WRWorkflowEventTracker workflow](self, "workflow");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "name");

        v125 = *__error();
        _wrlog();
        v126 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v126, OS_LOG_TYPE_DEBUG))
          -[WRWorkflowEventTracker handleSignpost:].cold.6((uint64_t)self, (uint64_t)v4, (uint64_t)v126, v127, v128, v129, v130, v131, v160, v161, (uint64_t)v162, v163, *((uint64_t *)&v163 + 1), v164, (uint64_t)v165, (uint64_t)v166, v167, 0, (uint64_t)v169,
            (uint64_t)v171,
            (uint64_t)selfa);

        *__error() = v125;
        if ((v65 & 1) != 0)
          goto LABEL_152;
        goto LABEL_164;
      }
      objc_msgSend(objc_getProperty(v168, v63, 8, 1), "individuationFieldName");
      v109 = (void *)objc_claimAutoreleasedReturnValue();

      if (v109)
      {
        objc_msgSend(objc_getProperty(v168, v110, 8, 1), "individuationFieldName");

        objc_getProperty(v168, v111, 16, 1);
        objc_msgSend(v4, "name");

        -[WRWorkflowEventTracker workflow](self, "workflow");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "name");

        v113 = *__error();
        _wrlog();
        v114 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v114, OS_LOG_TYPE_DEBUG))
        {
          -[WRWorkflowEventTracker workflow](self, "workflow");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "name");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "name");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(objc_getProperty(v168, v118, 8, 1), "individuationFieldName");
          v119 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v121 = objc_getProperty(v168, v120, 16, 1);
          v122 = objc_msgSend(v169, "startMachContinuousTime");
          *(_DWORD *)buf = 138544386;
          v189 = v116;
          v190 = 2114;
          v191 = (uint64_t)v117;
          v192 = 2114;
          v193 = v119;
          v194 = 2112;
          v195 = v121;
          v4 = v169;
          v196 = 2048;
          v197 = v122;
          _os_log_debug_impl(&dword_24A5B4000, v114, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@: %{public}@->%@: outside any workflow event (%llu)", buf, 0x34u);

          v65 = BYTE4(v167);
          v8 = v171;

        }
      }
      else
      {
        objc_msgSend(v4, "name");

        -[WRWorkflowEventTracker workflow](self, "workflow");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "name");

        v113 = *__error();
        _wrlog();
        v114 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v114, OS_LOG_TYPE_DEBUG))
          -[WRWorkflowEventTracker handleSignpost:].cold.6((uint64_t)self, (uint64_t)v4, (uint64_t)v114, v133, v134, v135, v136, v137, v160, v161, (uint64_t)v162, v163, *((uint64_t *)&v163 + 1), v164, (uint64_t)v165, (uint64_t)v166, v167, (uint64_t)v168, (uint64_t)v169,
            (uint64_t)v171,
            (uint64_t)selfa);
      }

      v64 = 0;
      *__error() = v113;
      goto LABEL_138;
    }
    v13 = -[WRWorkflowEventTracker handleSignpost:wrsignpost:](self, v4, v8);
    if ((v6 & 1) == 0)
    {
      if (v13)
        ++self->_numHandledSignposts;
      else
        ++self->_numOutsideSignposts;
    }
  }
  else if ((v6 & 1) == 0)
  {
    ++self->_numUnhandledSignposts;
  }
LABEL_153:

  return v8 != 0;
}

- (uint64_t)handleSignpost:(void *)a3 wrsignpost:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  WROpenIndividuatedSignpostInterval *v14;
  WRTimestampAndThread *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  id *v20;
  id *v21;
  SEL v22;
  const char *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  _BOOL4 v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  SEL v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id Property;
  const char *v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  BOOL v59;
  int v60;
  NSObject *v61;
  _BOOL4 v62;
  const char *v63;
  void *v64;
  id v65;
  const char *v66;
  double v67;
  double v68;
  const char *v69;
  void *v70;
  id v71;
  const char *v72;
  void *v73;
  double v74;
  uint64_t v75;
  SEL v76;
  WRTimestampAndThread *v77;
  int v78;
  void *v79;
  void *v80;
  void *v81;
  id *v82;
  SEL v83;
  SEL v84;
  NSObject *v85;
  void *v86;
  int v87;
  uint64_t v88;
  NSObject *v89;
  void *v90;
  double v91;
  double v92;
  double v93;
  _BOOL4 v94;
  void *v95;
  double v96;
  double v97;
  dispatch_time_t v98;
  double v99;
  SEL v100;
  char v101;
  uint64_t v102;
  unint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  SEL v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  void *v113;
  id v114;
  const char *v115;
  id v116;
  const char *v117;
  SEL v118;
  uint64_t v119;
  BOOL v120;
  void *v121;
  void *v122;
  int v123;
  NSObject *v124;
  _BOOL4 v125;
  void *v126;
  void *v127;
  void *v128;
  double v129;
  unint64_t v130;
  void *v131;
  unint64_t v132;
  uint64_t v133;
  void *v134;
  unint64_t v135;
  void *v136;
  unint64_t v137;
  unint64_t v138;
  unint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  void *v143;
  void *v144;
  double v145;
  unint64_t v146;
  void *v147;
  unint64_t v148;
  double v149;
  void *v150;
  unint64_t v151;
  void *v152;
  unint64_t v153;
  unint64_t v154;
  unint64_t v155;
  uint64_t v156;
  double v157;
  void *v158;
  void *v159;
  void *v160;
  unint64_t v161;
  void *v162;
  unint64_t v163;
  double v164;
  void *v165;
  unint64_t v166;
  void *v167;
  unint64_t v168;
  unint64_t v169;
  unint64_t v170;
  double v171;
  uint64_t v172;
  void *v173;
  void *v174;
  void *v175;
  unint64_t v176;
  void *v177;
  unint64_t v178;
  double v179;
  void *v180;
  unint64_t v181;
  void *v182;
  unint64_t v183;
  unint64_t v184;
  unint64_t v185;
  double v186;
  uint64_t v187;
  const char *v188;
  const char *v189;
  __int128 v190;
  char v191;
  unint64_t v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  BOOL v197;
  double v198;
  void *v199;
  void *v200;
  int v201;
  NSObject *v202;
  _BOOL4 v203;
  void *v204;
  void *v205;
  void *v206;
  double v207;
  void *v208;
  BOOL v209;
  void *v210;
  void *v211;
  int v212;
  NSObject *v213;
  _BOOL4 v214;
  void *v215;
  void *v216;
  void *v217;
  double v218;
  const char *v219;
  void *v220;
  void *v221;
  void *v222;
  double v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  double v230;
  const char *v231;
  void *v232;
  void *v233;
  void *v234;
  SEL v235;
  void *v236;
  void *v237;
  void *v238;
  const char *v239;
  SEL v240;
  id v241;
  uint64_t v242;
  void *v243;
  void *v244;
  int v245;
  NSObject *v246;
  void *v247;
  void *v248;
  int v249;
  NSObject *v250;
  void *v251;
  void *v252;
  void *v253;
  double v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  double v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  SEL v269;
  id v270;
  SEL v271;
  void *v272;
  void *v273;
  void *v274;
  double v275;
  double v276;
  void *v277;
  void *v278;
  void *v279;
  double v280;
  double v281;
  void *v282;
  void *v283;
  void *v284;
  double v285;
  uint64_t v286;
  void *v287;
  void *v288;
  void *v289;
  double v290;
  void *v291;
  void *v292;
  void *v293;
  const char *v294;
  void *v295;
  void *v296;
  int v297;
  NSObject *v298;
  _BOOL4 v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  void *v305;
  void *v306;
  void *v307;
  double v308;
  void *v309;
  void *v310;
  void *v311;
  const char *v312;
  void *v314;
  void *v315;
  int v316;
  NSObject *v317;
  _BOOL4 v318;
  void *v319;
  void *v320;
  void *v321;
  double v322;
  unint64_t v323;
  void *v324;
  unint64_t v325;
  uint64_t v326;
  void *v327;
  void *v328;
  void *v329;
  double v330;
  unint64_t v331;
  void *v332;
  unint64_t v333;
  double v334;
  void *v335;
  void *v336;
  void *v337;
  unint64_t v338;
  void *v339;
  unint64_t v340;
  double v341;
  void *v342;
  SEL v343;
  void *v344;
  void *v345;
  void *v346;
  unint64_t v347;
  void *v348;
  unint64_t v349;
  double v350;
  int v351;
  void *v352;
  void *v353;
  void *v354;
  WRTimestampAndThread *v355;
  void *v356;
  void *v357;
  id *v358;
  SEL v359;
  void *v360;
  SEL v361;
  SEL v362;
  void (**v363)(id, void *);
  const char *v364;
  __int128 v365;
  __int128 v366;
  __int128 v367;
  __int128 v368;
  __int128 v369;
  __int128 v370;
  uint64_t v371;
  double v372;
  id newValue;
  void *v374;
  void *v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  char v380;
  void *v381;
  void *v382;
  void *v383;
  id obj;
  double obja;
  id self;
  double selfa;
  _QWORD v388[4];
  id v389;
  uint64_t *v390;
  uint64_t v391;
  double *v392;
  uint64_t v393;
  uint64_t (*v394)(uint64_t, uint64_t);
  void (*v395)(uint64_t);
  id v396;
  _QWORD handler[6];
  __int128 v398;
  __int128 v399;
  __int128 v400;
  __int128 v401;
  uint8_t buf[4];
  double v403;
  __int16 v404;
  void *v405;
  __int16 v406;
  double v407;
  __int16 v408;
  double v409;
  __int16 v410;
  double v411;
  __int16 v412;
  double v413;
  __int16 v414;
  double v415;
  __int16 v416;
  double v417;
  __int16 v418;
  uint64_t v419;
  __int16 v420;
  uint64_t v421;
  _BYTE v422[128];
  uint64_t v423;

  v423 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  newValue = a3;
  v374 = v5;
  if (!a1)
    goto LABEL_68;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_69;
  v372 = COERCE_DOUBLE(v5);
  self = a1;
  objc_msgSend(a1, "workflow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startSignposts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObjectIdenticalTo:", newValue);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!objc_msgSend(*(id *)&v372, "eventType") && (objc_msgSend(self, "inMiddleOfEvent") & 1) == 0)
    {
      objc_msgSend(newValue, "individuationFieldName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(newValue, "individuationFieldName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[WRWorkflowEventTracker haveAnyEndSignpostsWithIndividuationFieldName:](self, v10);

        if (v11)
        {
          objc_msgSend(newValue, "individuationFieldName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[WRWorkflowEventTracker individuationIdentifierForSignpostEvent:individuationFieldName:](self, *(void **)&v372, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            v14 = [WROpenIndividuatedSignpostInterval alloc];
            v15 = [WRTimestampAndThread alloc];
            v16 = objc_msgSend(*(id *)&v372, "processID");
            v17 = (void *)objc_msgSend(*(id *)&v372, "threadID");
            v18 = (void *)objc_msgSend(*(id *)&v372, "startNanoseconds");
            objc_msgSend(*(id *)&v372, "beginDate");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = -[WRTimestampAndThread initWithPID:threadID:machContTimeNs:date:]((id *)&v15->super.isa, v16, v17, v18, v19);
            v21 = -[WROpenIndividuatedSignpostInterval initWithSignpost:individuationIdentifier:timestampAndThread:]((id *)&v14->super.isa, newValue, v13, v20);

            if (objc_getProperty(self, v22, 128, 1))
            {
              objc_msgSend(objc_getProperty(self, v23, 128, 1), "addObject:", v21);
            }
            else
            {
              *(_QWORD *)&v365 = 0;
              v342 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v21);
              objc_setProperty_atomic(self, v343, v342, 128);

            }
          }

        }
      }
    }
  }
  else
  {
    v24 = objc_msgSend(self, "inMiddleOfEvent");
    objc_msgSend(*(id *)&v372, "name");

    objc_msgSend(self, "workflow");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "name");

    objc_msgSend(self, "eventIdentifier");
    objc_msgSend(self, "eventIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = *__error();
    _wrlog();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v24)
    {
      v30 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
      if (v26)
      {
        if (v30)
          -[WRWorkflowEventTracker handleSignpost:wrsignpost:].cold.4(self, *(void **)&v372, v29);
      }
      else if (v30)
      {
        -[WRWorkflowEventTracker handleSignpost:wrsignpost:].cold.3(self, *(void **)&v372, v29);
      }
    }
    else
    {
      v31 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
      if (v26)
      {
        if (v31)
        {
          objc_msgSend(self, "workflow");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "name");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(self, "eventIdentifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)&v372, "name");
          v35 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          objc_msgSend(*(id *)&v372, "beginDate");
          v36 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 138544386;
          v403 = *(double *)&v33;
          v404 = 2114;
          v405 = v34;
          v406 = 2114;
          v407 = v35;
          v408 = 2112;
          v409 = v36;
          v410 = 2048;
          v411 = COERCE_DOUBLE(objc_msgSend(*(id *)&v372, "startMachContinuousTime"));
          _os_log_impl(&dword_24A5B4000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@<%{public}@>: %{public}@: event start @ %@ (%llu)", buf, 0x34u);

        }
      }
      else if (v31)
      {
        objc_msgSend(self, "workflow");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "name");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)&v372, "name");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)&v372, "beginDate");
        v40 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 138544130;
        v403 = *(double *)&v38;
        v404 = 2114;
        v405 = v39;
        v406 = 2112;
        v407 = v40;
        v408 = 2048;
        v409 = COERCE_DOUBLE(objc_msgSend(*(id *)&v372, "startMachContinuousTime"));
        _os_log_impl(&dword_24A5B4000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: event start @ %@ (%llu)", buf, 0x2Au);

      }
    }

    *__error() = v27;
    v42 = objc_getProperty(self, v41, 128, 1);
    v43 = (void *)objc_msgSend(*(id *)&v372, "timeRecordedNanoseconds");
    objc_msgSend(*(id *)&v372, "beginDate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "dateByAddingTimeInterval:", ((double)(unint64_t)objc_msgSend(*(id *)&v372, "timeRecordedNanoseconds")- (double)(unint64_t)objc_msgSend(*(id *)&v372, "startNanoseconds"))/ 1000000000.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[WRWorkflowEventTracker reportErrorsAndResetAtMachContNs:date:](self, v43, v45);

    v400 = 0u;
    v401 = 0u;
    v398 = 0u;
    v399 = 0u;
    obj = v42;
    v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v398, v422, 16);
    if (v47)
    {
      v49 = *(_QWORD *)v399;
      *(_QWORD *)&v48 = 138543874;
      v369 = v48;
      *(_QWORD *)&v48 = 138544130;
      v370 = v48;
      do
      {
        v50 = 0;
        do
        {
          if (*(_QWORD *)v399 != v49)
            objc_enumerationMutation(obj);
          v51 = *(void **)(*((_QWORD *)&v398 + 1) + 8 * v50);
          if (v51)
            Property = objc_getProperty(*(id *)(*((_QWORD *)&v398 + 1) + 8 * v50), v46, 8, 1);
          else
            Property = 0;
          objc_msgSend(Property, "individuationFieldName");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if (v54)
          {
            if (v51)
              v55 = objc_getProperty(v51, v53, 16, 1);
            else
              v55 = 0;
            -[WRWorkflowEventTracker sawIndividuationFieldName:withIndividuationIdentifier:](self, v54, v55);
          }
          else
          {
            if (v51)
              v56 = objc_getProperty(v51, v53, 8, 1);
            else
              v56 = 0;
            objc_msgSend(v56, "name");

            objc_msgSend(self, "workflow");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "name");

            objc_msgSend(self, "eventIdentifier");
            objc_msgSend(self, "eventIdentifier");
            v58 = (void *)objc_claimAutoreleasedReturnValue();

            v59 = v58 == 0;
            v60 = *__error();
            _wrlog();
            v61 = objc_claimAutoreleasedReturnValue();
            v62 = os_log_type_enabled(v61, OS_LOG_TYPE_FAULT);
            if (v59)
            {
              if (v62)
              {
                objc_msgSend(self, "workflow");
                v382 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v382, "name");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                if (v51)
                  v71 = objc_getProperty(v51, v69, 8, 1);
                else
                  v71 = 0;
                objc_msgSend(v71, "name");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                if (v51)
                  v74 = COERCE_DOUBLE(objc_getProperty(v51, v72, 16, 1));
                else
                  v74 = 0.0;
                *(_DWORD *)buf = v369;
                v403 = *(double *)&v70;
                v404 = 2114;
                v405 = v73;
                v406 = 2112;
                v407 = v74;
                _os_log_fault_impl(&dword_24A5B4000, v61, OS_LOG_TYPE_FAULT, "%{public}@: %{public}@: No indivudation field name for identifier %@", buf, 0x20u);

              }
            }
            else if (v62)
            {
              objc_msgSend(self, "workflow");
              v381 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v381, "name");
              v375 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(self, "eventIdentifier");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              if (v51)
                v65 = objc_getProperty(v51, v63, 8, 1);
              else
                v65 = 0;
              objc_msgSend(v65, "name");
              v67 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
              if (v51)
                v68 = COERCE_DOUBLE(objc_getProperty(v51, v66, 16, 1));
              else
                v68 = 0.0;
              *(_DWORD *)buf = v370;
              v403 = *(double *)&v375;
              v404 = 2114;
              v405 = v64;
              v406 = 2114;
              v407 = v67;
              v408 = 2112;
              v409 = v68;
              _os_log_fault_impl(&dword_24A5B4000, v61, OS_LOG_TYPE_FAULT, "%{public}@<%{public}@>: %{public}@: No indivudation field name for identifier %@", buf, 0x2Au);

            }
            *__error() = v60;
          }

          ++v50;
        }
        while (v47 != v50);
        v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v398, v422, 16);
        v47 = v75;
      }
      while (v75);
    }

    objc_setProperty_atomic(self, v76, newValue, 32);
    v77 = [WRTimestampAndThread alloc];
    v78 = objc_msgSend(*(id *)&v372, "processID");
    v79 = (void *)objc_msgSend(*(id *)&v372, "threadID");
    v80 = (void *)objc_msgSend(*(id *)&v372, "startNanoseconds");
    objc_msgSend(*(id *)&v372, "beginDate");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = -[WRTimestampAndThread initWithPID:threadID:machContTimeNs:date:]((id *)&v77->super.isa, v78, v79, v80, v81);
    objc_setProperty_atomic(self, v83, v82, 24);

    v85 = objc_getProperty(self, v84, 112, 1);
    if (v85)
    {
      objc_msgSend(self, "workflow");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = objc_msgSend(v86, "hasMaximumEventDuration");

      if (v87)
      {
        v88 = objc_msgSend(*(id *)&v372, "startNanoseconds");
        v89 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v85);
        objc_msgSend(self, "workflow");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "maximumEventDuration");
        v92 = v91;

        v93 = v92 / 100.0;
        v94 = v93 < 1.0;
        objc_msgSend(self, "workflow");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "maximumEventDuration");
        v96 = v93 * 1000000000.0;
        v98 = dispatch_time(0, (unint64_t)(v97 * 1000000000.0));
        if (v94)
          v99 = 1000000000.0;
        else
          v99 = v96;
        dispatch_source_set_timer(v89, v98, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)v99);

        handler[0] = MEMORY[0x24BDAC760];
        handler[1] = 3221225472;
        handler[2] = __52__WRWorkflowEventTracker_handleSignpost_wrsignpost___block_invoke;
        handler[3] = &unk_251BE4580;
        handler[4] = self;
        handler[5] = v88;
        dispatch_source_set_event_handler(v89, handler);
        dispatch_activate(v89);
        objc_setProperty_atomic(self, v100, v89, 120);

      }
    }

  }
  v101 = objc_msgSend(*(id *)&v372, "isSyntheticIntervalEvent");

  a1 = self;
  if ((v101 & 1) != 0)
  {
LABEL_68:
    v102 = 0;
  }
  else
  {
LABEL_69:
    objc_msgSend(newValue, "individuationFieldName");
    selfa = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    -[WRWorkflowEventTracker individuationIdentifierForSignpostObject:individuationFieldName:](a1, v374, *(void **)&selfa);
    obja = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    -[WRWorkflowEventTracker trackerForWRSignpost:individuationIdentifier:](a1, newValue, *(void **)&obja);
    v383 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1, "inMiddleOfEvent")
      && (v103 = objc_msgSend(v374, "endNanoseconds"),
          objc_msgSend(a1, "eventStart"),
          v104 = (void *)objc_claimAutoreleasedReturnValue(),
          LODWORD(v103) = v103 < objc_msgSend(v104, "machContTimeNs"),
          v104,
          !(_DWORD)v103))
    {
      if (selfa != 0.0 && obja != 0.0)
        -[WRWorkflowEventTracker sawIndividuationFieldName:withIndividuationIdentifier:](a1, *(void **)&selfa, *(void **)&obja);
      v119 = objc_msgSend(v374, "startNanoseconds");
      v120 = v119 == objc_msgSend(v374, "endNanoseconds");
      objc_msgSend(v374, "name");

      objc_msgSend(a1, "workflow");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "name");

      objc_msgSend(a1, "eventIdentifier");
      objc_msgSend(a1, "eventIdentifier");
      v122 = (void *)objc_claimAutoreleasedReturnValue();

      v123 = *__error();
      _wrlog();
      v124 = objc_claimAutoreleasedReturnValue();
      v125 = os_log_type_enabled(v124, OS_LOG_TYPE_INFO);
      if (v120)
      {
        if (selfa == 0.0)
        {
          if (v122)
          {
            if (v125)
            {
              objc_msgSend(a1, "workflow");
              v142 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v142, "name");
              v143 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "eventIdentifier");
              v144 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v374, "name");
              v145 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
              v146 = objc_msgSend(v374, "startNanoseconds");
              objc_msgSend(a1, "eventStart");
              v147 = (void *)objc_claimAutoreleasedReturnValue();
              v148 = objc_msgSend(v147, "machContTimeNs");
              v149 = COERCE_DOUBLE(objc_msgSend(v374, "startMachContinuousTime"));
              *(_DWORD *)buf = 138544386;
              v403 = *(double *)&v143;
              v404 = 2114;
              v405 = v144;
              v406 = 2114;
              v407 = v145;
              v408 = 2048;
              v409 = ((double)v146 - (double)v148) / 1000000000.0;
              v410 = 2048;
              v411 = v149;
              _os_log_impl(&dword_24A5B4000, v124, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: event middle %+.3fs @%llu", buf, 0x34u);

            }
          }
          else if (v125)
          {
            objc_msgSend(a1, "workflow");
            v173 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v173, "name");
            v174 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v374, "name");
            v175 = (void *)objc_claimAutoreleasedReturnValue();
            v176 = objc_msgSend(v374, "startNanoseconds");
            objc_msgSend(a1, "eventStart");
            v177 = (void *)objc_claimAutoreleasedReturnValue();
            v178 = objc_msgSend(v177, "machContTimeNs");
            v179 = COERCE_DOUBLE(objc_msgSend(v374, "startMachContinuousTime"));
            *(_DWORD *)buf = 138544130;
            v403 = *(double *)&v174;
            v404 = 2114;
            v405 = v175;
            v406 = 2048;
            v407 = ((double)v176 - (double)v178) / 1000000000.0;
            v408 = 2048;
            v409 = v179;
            _os_log_impl(&dword_24A5B4000, v124, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: event middle %+.3fs @%llu", buf, 0x2Au);

          }
        }
        else if (v122)
        {
          if (v125)
          {
            objc_msgSend(a1, "workflow");
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v126, "name");
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "eventIdentifier");
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v374, "name");
            v129 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            v130 = objc_msgSend(v374, "startNanoseconds");
            objc_msgSend(a1, "eventStart");
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            v132 = objc_msgSend(v131, "machContTimeNs");
            *(double *)&v133 = COERCE_DOUBLE(objc_msgSend(v374, "startMachContinuousTime"));
            *(_DWORD *)buf = 138544898;
            v403 = *(double *)&v127;
            v404 = 2114;
            v405 = v128;
            v406 = 2114;
            v407 = v129;
            v408 = 2114;
            v409 = selfa;
            v410 = 2112;
            v411 = obja;
            v412 = 2048;
            v413 = ((double)v130 - (double)v132) / 1000000000.0;
            v414 = 2048;
            v415 = *(double *)&v133;
            _os_log_impl(&dword_24A5B4000, v124, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: event middle %+.3fs @%llu", buf, 0x48u);

          }
        }
        else if (v125)
        {
          objc_msgSend(a1, "workflow");
          v158 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v158, "name");
          v159 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v374, "name");
          v160 = (void *)objc_claimAutoreleasedReturnValue();
          v161 = objc_msgSend(v374, "startNanoseconds");
          objc_msgSend(a1, "eventStart");
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          v163 = objc_msgSend(v162, "machContTimeNs");
          v164 = COERCE_DOUBLE(objc_msgSend(v374, "startMachContinuousTime"));
          *(_DWORD *)buf = 138544642;
          v403 = *(double *)&v159;
          v404 = 2114;
          v405 = v160;
          v406 = 2114;
          v407 = selfa;
          v408 = 2112;
          v409 = obja;
          v410 = 2048;
          v411 = ((double)v161 - (double)v163) / 1000000000.0;
          v412 = 2048;
          v413 = v164;
          _os_log_impl(&dword_24A5B4000, v124, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: %{public}@->%@: event middle %+.3fs @%llu", buf, 0x3Eu);

        }
      }
      else if (selfa == 0.0)
      {
        if (v122)
        {
          if (v125)
          {
            objc_msgSend(a1, "workflow");
            v150 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v150, "name");
            v372 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            objc_msgSend(a1, "eventIdentifier");
            *(_QWORD *)&v370 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v374, "name");
            *(_QWORD *)&v369 = objc_claimAutoreleasedReturnValue();
            *(_QWORD *)&v368 = objc_msgSend(v374, "startNanoseconds");
            objc_msgSend(a1, "eventStart");
            v377 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)&v367 = objc_msgSend(v377, "machContTimeNs");
            v151 = objc_msgSend(v374, "endNanoseconds");
            objc_msgSend(a1, "eventStart");
            v152 = (void *)objc_claimAutoreleasedReturnValue();
            v153 = objc_msgSend(v152, "machContTimeNs");
            v154 = objc_msgSend(v374, "endNanoseconds");
            v155 = objc_msgSend(v374, "startNanoseconds");
            *(double *)&v156 = COERCE_DOUBLE(objc_msgSend(v374, "startMachContinuousTime"));
            v157 = COERCE_DOUBLE(objc_msgSend(v374, "endMachContinuousTime"));
            *(_DWORD *)buf = 138545154;
            v403 = v372;
            v404 = 2114;
            v405 = (void *)v370;
            v406 = 2114;
            v407 = *(double *)&v369;
            v408 = 2048;
            v409 = ((double)(unint64_t)v368 - (double)(unint64_t)v367) / 1000000000.0;
            v410 = 2048;
            v411 = ((double)v151 - (double)v153) / 1000000000.0;
            v412 = 2048;
            v413 = ((double)v154 - (double)v155) / 1000000000.0;
            v414 = 2048;
            v415 = *(double *)&v156;
            v416 = 2048;
            v417 = v157;
            _os_log_impl(&dword_24A5B4000, v124, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: event middle %+.3fs - %+.3fs (%.3fs) @%llu-%llu", buf, 0x52u);

          }
        }
        else if (v125)
        {
          objc_msgSend(a1, "workflow");
          v180 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v180, "name");
          v372 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          objc_msgSend(v374, "name");
          *(_QWORD *)&v370 = objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&v369 = objc_msgSend(v374, "startNanoseconds");
          objc_msgSend(a1, "eventStart");
          v379 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&v368 = objc_msgSend(v379, "machContTimeNs");
          v181 = objc_msgSend(v374, "endNanoseconds");
          objc_msgSend(a1, "eventStart");
          v182 = (void *)objc_claimAutoreleasedReturnValue();
          v183 = objc_msgSend(v182, "machContTimeNs");
          v184 = objc_msgSend(v374, "endNanoseconds");
          v185 = objc_msgSend(v374, "startNanoseconds");
          v186 = COERCE_DOUBLE(objc_msgSend(v374, "startMachContinuousTime"));
          *(double *)&v187 = COERCE_DOUBLE(objc_msgSend(v374, "endMachContinuousTime"));
          *(_DWORD *)buf = 138544898;
          v403 = v372;
          v404 = 2114;
          v405 = (void *)v370;
          v406 = 2048;
          v407 = ((double)(unint64_t)v369 - (double)(unint64_t)v368) / 1000000000.0;
          v408 = 2048;
          v409 = ((double)v181 - (double)v183) / 1000000000.0;
          v410 = 2048;
          v411 = ((double)v184 - (double)v185) / 1000000000.0;
          v412 = 2048;
          v413 = v186;
          v414 = 2048;
          v415 = *(double *)&v187;
          _os_log_impl(&dword_24A5B4000, v124, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: event middle %+.3fs - %+.3fs (%.3fs) @%llu-%llu", buf, 0x48u);

        }
      }
      else if (v122)
      {
        if (v125)
        {
          objc_msgSend(a1, "workflow");
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v134, "name");
          *(_QWORD *)&v369 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "eventIdentifier");
          *(_QWORD *)&v370 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v374, "name");
          v372 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          *(_QWORD *)&v368 = objc_msgSend(v374, "startNanoseconds");
          objc_msgSend(a1, "eventStart");
          v376 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&v367 = objc_msgSend(v376, "machContTimeNs");
          v135 = objc_msgSend(v374, "endNanoseconds");
          objc_msgSend(a1, "eventStart");
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          v137 = objc_msgSend(v136, "machContTimeNs");
          v138 = objc_msgSend(v374, "endNanoseconds");
          v139 = objc_msgSend(v374, "startNanoseconds");
          v140 = objc_msgSend(v374, "startMachContinuousTime");
          v141 = objc_msgSend(v374, "endMachContinuousTime");
          *(_DWORD *)buf = 138545666;
          v403 = *(double *)&v369;
          v404 = 2114;
          v405 = (void *)v370;
          v406 = 2114;
          v407 = v372;
          v408 = 2114;
          v409 = selfa;
          v410 = 2112;
          v411 = obja;
          v412 = 2048;
          v413 = ((double)(unint64_t)v368 - (double)(unint64_t)v367) / 1000000000.0;
          v414 = 2048;
          v415 = ((double)v135 - (double)v137) / 1000000000.0;
          v416 = 2048;
          v417 = ((double)v138 - (double)v139) / 1000000000.0;
          v418 = 2048;
          v419 = v140;
          v420 = 2048;
          v421 = v141;
          _os_log_impl(&dword_24A5B4000, v124, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: event middle %+.3fs - %+.3fs (%.3fs) @%llu-%llu", buf, 0x66u);

        }
      }
      else if (v125)
      {
        objc_msgSend(a1, "workflow");
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v165, "name");
        v372 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        objc_msgSend(v374, "name");
        *(_QWORD *)&v370 = objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v369 = objc_msgSend(v374, "startNanoseconds");
        objc_msgSend(a1, "eventStart");
        v378 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v368 = objc_msgSend(v378, "machContTimeNs");
        v166 = objc_msgSend(v374, "endNanoseconds");
        objc_msgSend(a1, "eventStart");
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        v168 = objc_msgSend(v167, "machContTimeNs");
        v169 = objc_msgSend(v374, "endNanoseconds");
        v170 = objc_msgSend(v374, "startNanoseconds");
        v171 = COERCE_DOUBLE(objc_msgSend(v374, "startMachContinuousTime"));
        v172 = objc_msgSend(v374, "endMachContinuousTime");
        *(_DWORD *)buf = 138545410;
        v403 = v372;
        v404 = 2114;
        v405 = (void *)v370;
        v406 = 2114;
        v407 = selfa;
        v408 = 2112;
        v409 = obja;
        v410 = 2048;
        v411 = ((double)(unint64_t)v369 - (double)(unint64_t)v368) / 1000000000.0;
        v412 = 2048;
        v413 = ((double)v166 - (double)v168) / 1000000000.0;
        v414 = 2048;
        v415 = ((double)v169 - (double)v170) / 1000000000.0;
        v416 = 2048;
        v417 = v171;
        v418 = 2048;
        v419 = v172;
        _os_log_impl(&dword_24A5B4000, v124, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: %{public}@->%@: event middle %+.3fs - %+.3fs (%.3fs) @%llu-%llu", buf, 0x5Cu);

      }
      *__error() = v123;
      -[WRWorkflowEventTracker applySignpost:toSignpostTracker:](a1, v374, v383);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v374, "eventType"))
      {
        if (objc_msgSend(objc_getProperty(a1, v188, 144, 1), "count"))
        {
          v380 = 0;
          v191 = 0;
          v192 = 0;
          *(_QWORD *)&v190 = 138544130;
          v369 = v190;
          *(_QWORD *)&v190 = 138544386;
          v370 = v190;
          *(_QWORD *)&v190 = 138543618;
          v367 = v190;
          *(_QWORD *)&v190 = 138543874;
          v368 = v190;
          *(_QWORD *)&v190 = 138544642;
          v366 = v190;
          do
          {
            objc_msgSend(objc_getProperty(a1, v189, 144, 1), "objectAtIndexedSubscript:", v192);
            v193 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if ((v191 & 1) != 0)
                goto LABEL_190;
              objc_msgSend(a1, "workflow");
              v194 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v194, "endSignpostGroups");
              v195 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v195, "objectAtIndexedSubscript:", v192);
              v196 = (void *)objc_claimAutoreleasedReturnValue();
              v197 = objc_msgSend(v196, "indexOfObjectIdenticalTo:", newValue) == 0x7FFFFFFFFFFFFFFFLL;

              if (v197)
              {
                v191 = 0;
                v380 = 1;
              }
              else
              {
                if (obja == 0.0)
                {
                  objc_msgSend(newValue, "name");

                  objc_msgSend(a1, "workflow");
                  v199 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v199, "name");

                  objc_msgSend(a1, "eventIdentifier");
                  objc_msgSend(a1, "eventIdentifier");
                  v200 = (void *)objc_claimAutoreleasedReturnValue();

                  v201 = *__error();
                  _wrlog();
                  v202 = objc_claimAutoreleasedReturnValue();
                  v203 = os_log_type_enabled(v202, OS_LOG_TYPE_INFO);
                  if (selfa == 0.0)
                  {
                    if (v200)
                    {
                      if (v203)
                      {
                        objc_msgSend(a1, "workflow");
                        v220 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v220, "name");
                        v221 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(a1, "eventIdentifier");
                        v222 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(newValue, "name");
                        v223 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                        *(_DWORD *)buf = v368;
                        v403 = *(double *)&v221;
                        v404 = 2114;
                        v405 = v222;
                        v406 = 2114;
                        v407 = v223;
                        _os_log_impl(&dword_24A5B4000, v202, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: End signpost group candidate", buf, 0x20u);

                      }
                    }
                    else if (v203)
                    {
                      objc_msgSend(a1, "workflow");
                      v232 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v232, "name");
                      v233 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(newValue, "name");
                      v234 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = v367;
                      v403 = *(double *)&v233;
                      v404 = 2114;
                      v405 = v234;
                      _os_log_impl(&dword_24A5B4000, v202, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: End signpost group candidate", buf, 0x16u);

                    }
                  }
                  else if (v200)
                  {
                    if (v203)
                    {
                      objc_msgSend(a1, "workflow");
                      v204 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v204, "name");
                      v205 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(a1, "eventIdentifier");
                      v206 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(newValue, "name");
                      v207 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                      *(_DWORD *)buf = v370;
                      v403 = *(double *)&v205;
                      v404 = 2114;
                      v405 = v206;
                      v406 = 2114;
                      v407 = v207;
                      v408 = 2114;
                      v409 = selfa;
                      v410 = 2112;
                      v411 = 0.0;
                      _os_log_impl(&dword_24A5B4000, v202, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: End signpost group candidate", buf, 0x34u);

                    }
                  }
                  else if (v203)
                  {
                    objc_msgSend(a1, "workflow");
                    v224 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v224, "name");
                    v225 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(newValue, "name");
                    v226 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = v369;
                    v403 = *(double *)&v225;
                    v404 = 2114;
                    v405 = v226;
                    v406 = 2114;
                    v407 = selfa;
                    v408 = 2112;
                    v409 = 0.0;
                    _os_log_impl(&dword_24A5B4000, v202, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: %{public}@->%@: End signpost group candidate", buf, 0x2Au);

                  }
                  *__error() = v201;
                  objc_msgSend(objc_getProperty(a1, v235, 144, 1), "setObject:atIndexedSubscript:", v383, v192);
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v198 = COERCE_DOUBLE(v193);
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
                    v208 = (void *)objc_claimAutoreleasedReturnValue();
                    v209 = v193 == v208;

                    if (!v209)
                    {
                      objc_msgSend(newValue, "name");

                      objc_msgSend(a1, "workflow");
                      v210 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v210, "name");

                      objc_msgSend(a1, "eventIdentifier");
                      objc_msgSend(a1, "eventIdentifier");
                      v211 = (void *)objc_claimAutoreleasedReturnValue();

                      v212 = *__error();
                      _wrlog();
                      v213 = objc_claimAutoreleasedReturnValue();
                      v214 = os_log_type_enabled(v213, OS_LOG_TYPE_FAULT);
                      if (selfa == 0.0)
                      {
                        if (v211)
                        {
                          if (v214)
                          {
                            objc_msgSend(a1, "workflow");
                            v227 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v227, "name");
                            v228 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(a1, "eventIdentifier");
                            v229 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(newValue, "name");
                            v230 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                            *(double *)&v231 = COERCE_DOUBLE(object_getClassName(v193));
                            *(_DWORD *)buf = v369;
                            v403 = *(double *)&v228;
                            v404 = 2114;
                            v405 = v229;
                            v406 = 2114;
                            v407 = v230;
                            v408 = 2080;
                            v409 = *(double *)&v231;
                            _os_log_fault_impl(&dword_24A5B4000, v213, OS_LOG_TYPE_FAULT, "%{public}@<%{public}@>: %{public}@: candidateEndSignpostTracker is bad class %s", buf, 0x2Au);

                          }
                        }
                        else if (v214)
                        {
                          objc_msgSend(a1, "workflow");
                          v291 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v291, "name");
                          v292 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(newValue, "name");
                          v293 = (void *)objc_claimAutoreleasedReturnValue();
                          *(double *)&v294 = COERCE_DOUBLE(object_getClassName(v193));
                          *(_DWORD *)buf = v368;
                          v403 = *(double *)&v292;
                          v404 = 2114;
                          v405 = v293;
                          v406 = 2080;
                          v407 = *(double *)&v294;
                          _os_log_fault_impl(&dword_24A5B4000, v213, OS_LOG_TYPE_FAULT, "%{public}@: %{public}@: candidateEndSignpostTracker is bad class %s", buf, 0x20u);

                        }
                      }
                      else if (v211)
                      {
                        if (v214)
                        {
                          objc_msgSend(a1, "workflow");
                          v215 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v215, "name");
                          v216 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(a1, "eventIdentifier");
                          v217 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(newValue, "name");
                          v218 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                          *(double *)&v219 = COERCE_DOUBLE(object_getClassName(v193));
                          *(_DWORD *)buf = v366;
                          v403 = *(double *)&v216;
                          v404 = 2114;
                          v405 = v217;
                          v406 = 2114;
                          v407 = v218;
                          v408 = 2114;
                          v409 = selfa;
                          v410 = 2112;
                          v411 = obja;
                          v412 = 2080;
                          v413 = *(double *)&v219;
                          _os_log_fault_impl(&dword_24A5B4000, v213, OS_LOG_TYPE_FAULT, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: candidateEndSignpostTracker is bad class %s", buf, 0x3Eu);

                        }
                      }
                      else if (v214)
                      {
                        objc_msgSend(a1, "workflow");
                        v236 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v236, "name");
                        v237 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(newValue, "name");
                        v238 = (void *)objc_claimAutoreleasedReturnValue();
                        *(double *)&v239 = COERCE_DOUBLE(object_getClassName(v193));
                        *(_DWORD *)buf = v370;
                        v403 = *(double *)&v237;
                        v404 = 2114;
                        v405 = v238;
                        v406 = 2114;
                        v407 = selfa;
                        v408 = 2112;
                        v409 = obja;
                        v410 = 2080;
                        v411 = *(double *)&v239;
                        _os_log_fault_impl(&dword_24A5B4000, v213, OS_LOG_TYPE_FAULT, "%{public}@: %{public}@: %{public}@->%@: candidateEndSignpostTracker is bad class %s", buf, 0x34u);

                      }
                      *__error() = v212;
                    }
                    v198 = COERCE_DOUBLE(objc_alloc_init(MEMORY[0x24BDBCED8]));
                    objc_msgSend(objc_getProperty(a1, v240, 144, 1), "setObject:atIndexedSubscript:", *(_QWORD *)&v198, v192);
                  }
                  v391 = 0;
                  v392 = (double *)&v391;
                  v393 = 0x3032000000;
                  v394 = __Block_byref_object_copy_;
                  v395 = __Block_byref_object_dispose_;
                  v396 = 0;
                  v388[0] = MEMORY[0x24BDAC760];
                  v388[1] = 3221225472;
                  v388[2] = __52__WRWorkflowEventTracker_handleSignpost_wrsignpost___block_invoke_167;
                  v388[3] = &unk_251BE45A8;
                  v241 = *(id *)&obja;
                  v389 = v241;
                  v390 = &v391;
                  v372 = v198;
                  objc_msgSend(*(id *)&v198, "enumerateKeysAndObjectsUsingBlock:", v388);
                  v242 = *((_QWORD *)v392 + 5);
                  if (v242)
                  {
                    objc_msgSend(*(id *)&v198, "setObject:forKeyedSubscript:", v383, v241);
                    if (selfa == 0.0)
                    {
                      objc_msgSend(newValue, "name");

                      objc_msgSend(a1, "workflow");
                      v255 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v255, "name");

                      objc_msgSend(a1, "eventIdentifier");
                      objc_msgSend(a1, "eventIdentifier");
                      v256 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v256)
                      {
                        v245 = *__error();
                        _wrlog();
                        v246 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v246, OS_LOG_TYPE_DEBUG))
                        {
                          objc_msgSend(a1, "workflow");
                          v277 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v277, "name");
                          v278 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(a1, "eventIdentifier");
                          v279 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(newValue, "name");
                          v280 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                          v281 = v392[5];
                          *(_DWORD *)buf = v369;
                          v403 = *(double *)&v278;
                          v404 = 2114;
                          v405 = v279;
                          v406 = 2114;
                          v407 = v280;
                          v408 = 2112;
                          v409 = v281;
                          _os_log_debug_impl(&dword_24A5B4000, v246, OS_LOG_TYPE_DEBUG, "%{public}@<%{public}@>: %{public}@: End signpost with individuation, still needs %@", buf, 0x2Au);

                        }
                      }
                      else
                      {
                        v245 = *__error();
                        _wrlog();
                        v246 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v246, OS_LOG_TYPE_DEBUG))
                        {
                          v286 = v242;
                          objc_msgSend(a1, "workflow");
                          v287 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v287, "name");
                          v288 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(newValue, "name");
                          v289 = (void *)objc_claimAutoreleasedReturnValue();
                          v290 = v392[5];
                          *(_DWORD *)buf = v368;
                          v403 = *(double *)&v288;
                          v404 = 2114;
                          v405 = v289;
                          v406 = 2112;
                          v407 = v290;
                          _os_log_debug_impl(&dword_24A5B4000, v246, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@: End signpost with individuation, still needs %@", buf, 0x20u);

                          v242 = v286;
                        }
                      }
                    }
                    else
                    {
                      objc_msgSend(newValue, "name");

                      objc_msgSend(a1, "workflow");
                      v243 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v243, "name");

                      objc_msgSend(a1, "eventIdentifier");
                      objc_msgSend(a1, "eventIdentifier");
                      v244 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v244)
                      {
                        v245 = *__error();
                        _wrlog();
                        v246 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v246, OS_LOG_TYPE_DEBUG))
                        {
                          objc_msgSend(a1, "workflow");
                          v272 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v272, "name");
                          v273 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(a1, "eventIdentifier");
                          v274 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(newValue, "name");
                          v275 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                          v276 = v392[5];
                          *(_DWORD *)buf = v366;
                          v403 = *(double *)&v273;
                          v404 = 2114;
                          v405 = v274;
                          v406 = 2114;
                          v407 = v275;
                          v408 = 2114;
                          v409 = selfa;
                          v410 = 2112;
                          v411 = obja;
                          v412 = 2112;
                          v413 = v276;
                          _os_log_debug_impl(&dword_24A5B4000, v246, OS_LOG_TYPE_DEBUG, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: End signpost with individuation, still needs %@", buf, 0x3Eu);

                        }
                      }
                      else
                      {
                        v245 = *__error();
                        _wrlog();
                        v246 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v246, OS_LOG_TYPE_DEBUG))
                        {
                          objc_msgSend(a1, "workflow");
                          v282 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v282, "name");
                          v283 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(newValue, "name");
                          v284 = (void *)objc_claimAutoreleasedReturnValue();
                          v285 = v392[5];
                          *(_DWORD *)buf = v370;
                          v403 = *(double *)&v283;
                          v404 = 2114;
                          v405 = v284;
                          v406 = 2114;
                          v407 = selfa;
                          v408 = 2112;
                          v409 = obja;
                          v410 = 2112;
                          v411 = v285;
                          _os_log_debug_impl(&dword_24A5B4000, v246, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@: %{public}@->%@: End signpost with individuation, still needs %@", buf, 0x34u);

                        }
                      }
                    }

                    *__error() = v245;
                    v380 = 1;
                  }
                  else
                  {
                    if (selfa == 0.0)
                    {
                      objc_msgSend(newValue, "name");

                      objc_msgSend(a1, "workflow");
                      v257 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v257, "name");

                      objc_msgSend(a1, "eventIdentifier");
                      objc_msgSend(a1, "eventIdentifier");
                      v258 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v258)
                      {
                        v249 = *__error();
                        _wrlog();
                        v250 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v250, OS_LOG_TYPE_INFO))
                        {
                          objc_msgSend(a1, "workflow");
                          v259 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v259, "name");
                          v260 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(a1, "eventIdentifier");
                          v261 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(newValue, "name");
                          v262 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                          *(_DWORD *)buf = v368;
                          v403 = *(double *)&v260;
                          v404 = 2114;
                          v405 = v261;
                          v406 = 2114;
                          v407 = v262;
                          _os_log_impl(&dword_24A5B4000, v250, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: End signpost with individuation, set as candidate for group", buf, 0x20u);

                          v242 = 0;
                        }
                      }
                      else
                      {
                        v249 = *__error();
                        _wrlog();
                        v250 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v250, OS_LOG_TYPE_INFO))
                        {
                          objc_msgSend(a1, "workflow");
                          v266 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v266, "name");
                          v267 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(newValue, "name");
                          v268 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = v367;
                          v403 = *(double *)&v267;
                          v404 = 2114;
                          v405 = v268;
                          _os_log_impl(&dword_24A5B4000, v250, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: End signpost with individuation, set as candidate for group", buf, 0x16u);

                          v242 = 0;
                        }
                      }
                    }
                    else
                    {
                      objc_msgSend(newValue, "name");

                      objc_msgSend(a1, "workflow");
                      v247 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v247, "name");

                      objc_msgSend(a1, "eventIdentifier");
                      objc_msgSend(a1, "eventIdentifier");
                      v248 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v248)
                      {
                        v249 = *__error();
                        _wrlog();
                        v250 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v250, OS_LOG_TYPE_INFO))
                        {
                          objc_msgSend(a1, "workflow");
                          v251 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v251, "name");
                          v252 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(a1, "eventIdentifier");
                          v253 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(newValue, "name");
                          v254 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                          *(_DWORD *)buf = v370;
                          v403 = *(double *)&v252;
                          v404 = 2114;
                          v405 = v253;
                          v406 = 2114;
                          v407 = v254;
                          v408 = 2114;
                          v409 = selfa;
                          v410 = 2112;
                          v411 = obja;
                          _os_log_impl(&dword_24A5B4000, v250, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: End signpost with individuation, set as candidate for group", buf, 0x34u);

                          v242 = 0;
                        }
                      }
                      else
                      {
                        v249 = *__error();
                        _wrlog();
                        v250 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v250, OS_LOG_TYPE_INFO))
                        {
                          objc_msgSend(a1, "workflow");
                          v263 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v263, "name");
                          v264 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(newValue, "name");
                          v265 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = v369;
                          v403 = *(double *)&v264;
                          v404 = 2114;
                          v405 = v265;
                          v406 = 2114;
                          v407 = selfa;
                          v408 = 2112;
                          v409 = obja;
                          _os_log_impl(&dword_24A5B4000, v250, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: %{public}@->%@: End signpost with individuation, set as candidate for group", buf, 0x2Au);

                          v242 = 0;
                        }
                      }
                    }

                    *__error() = v249;
                    v270 = objc_getProperty(a1, v269, 144, 1);
                    objc_msgSend(v270, "setObject:atIndexedSubscript:", v383, v192);

                  }
                  _Block_object_dispose(&v391, 8);

                  if (v242)
                  {

                    if ((v380 & 1) != 0)
                      goto LABEL_199;
                    goto LABEL_203;
                  }
                }
                if ((v380 & 1) != 0)
                {
LABEL_190:

                  goto LABEL_199;
                }
                v380 = 0;
                v191 = 1;
              }
            }

            ++v192;
          }
          while (v192 < objc_msgSend(objc_getProperty(a1, v271, 144, 1), "count"));
          if ((v380 & 1) != 0)
            goto LABEL_199;
          if ((v191 & 1) != 0)
          {
LABEL_203:
            objc_msgSend(v374, "name");

            objc_msgSend(a1, "workflow");
            v314 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v314, "name");

            objc_msgSend(a1, "eventIdentifier");
            objc_msgSend(a1, "eventIdentifier");
            v315 = (void *)objc_claimAutoreleasedReturnValue();

            v316 = *__error();
            _wrlog();
            v317 = objc_claimAutoreleasedReturnValue();
            v318 = os_log_type_enabled(v317, OS_LOG_TYPE_DEFAULT);
            if (selfa == 0.0)
            {
              if (v315)
              {
                if (v318)
                {
                  objc_msgSend(a1, "workflow");
                  v327 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v327, "name");
                  v328 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(a1, "eventIdentifier");
                  v329 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v374, "name");
                  v330 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                  v331 = objc_msgSend(v374, "endNanoseconds");
                  objc_msgSend(a1, "eventStart");
                  v332 = (void *)objc_claimAutoreleasedReturnValue();
                  v333 = objc_msgSend(v332, "machContTimeNs");
                  v334 = COERCE_DOUBLE(objc_msgSend(v374, "endMachContinuousTime"));
                  *(_DWORD *)buf = v370;
                  v403 = *(double *)&v328;
                  v404 = 2114;
                  v405 = v329;
                  v406 = 2114;
                  v407 = v330;
                  v408 = 2048;
                  v409 = ((double)v331 - (double)v333) / 1000000000.0;
                  v410 = 2048;
                  v411 = v334;
                  _os_log_impl(&dword_24A5B4000, v317, OS_LOG_TYPE_DEFAULT, "%{public}@<%{public}@>: %{public}@: event end %+.3fs @%llu", buf, 0x34u);

                }
              }
              else if (v318)
              {
                objc_msgSend(a1, "workflow");
                v344 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v344, "name");
                v345 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v374, "name");
                v346 = (void *)objc_claimAutoreleasedReturnValue();
                v347 = objc_msgSend(v374, "endNanoseconds");
                objc_msgSend(a1, "eventStart");
                v348 = (void *)objc_claimAutoreleasedReturnValue();
                v349 = objc_msgSend(v348, "machContTimeNs");
                v350 = COERCE_DOUBLE(objc_msgSend(v374, "endMachContinuousTime"));
                *(_DWORD *)buf = v369;
                v403 = *(double *)&v345;
                v404 = 2114;
                v405 = v346;
                v406 = 2048;
                v407 = ((double)v347 - (double)v349) / 1000000000.0;
                v408 = 2048;
                v409 = v350;
                _os_log_impl(&dword_24A5B4000, v317, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: event end %+.3fs @%llu", buf, 0x2Au);

              }
            }
            else if (v315)
            {
              if (v318)
              {
                objc_msgSend(a1, "workflow");
                v319 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v319, "name");
                v320 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(a1, "eventIdentifier");
                v321 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v374, "name");
                v322 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                v323 = objc_msgSend(v374, "endNanoseconds");
                objc_msgSend(a1, "eventStart");
                v324 = (void *)objc_claimAutoreleasedReturnValue();
                v325 = objc_msgSend(v324, "machContTimeNs");
                *(double *)&v326 = COERCE_DOUBLE(objc_msgSend(v374, "endMachContinuousTime"));
                *(_DWORD *)buf = 138544898;
                v403 = *(double *)&v320;
                v404 = 2114;
                v405 = v321;
                v406 = 2114;
                v407 = v322;
                v408 = 2114;
                v409 = selfa;
                v410 = 2112;
                v411 = obja;
                v412 = 2048;
                v413 = ((double)v323 - (double)v325) / 1000000000.0;
                v414 = 2048;
                v415 = *(double *)&v326;
                _os_log_impl(&dword_24A5B4000, v317, OS_LOG_TYPE_DEFAULT, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: event end %+.3fs @%llu", buf, 0x48u);

              }
            }
            else if (v318)
            {
              objc_msgSend(a1, "workflow");
              v335 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v335, "name");
              v336 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v374, "name");
              v337 = (void *)objc_claimAutoreleasedReturnValue();
              v338 = objc_msgSend(v374, "endNanoseconds");
              objc_msgSend(a1, "eventStart");
              v339 = (void *)objc_claimAutoreleasedReturnValue();
              v340 = objc_msgSend(v339, "machContTimeNs");
              v341 = COERCE_DOUBLE(objc_msgSend(v374, "endMachContinuousTime"));
              *(_DWORD *)buf = v366;
              v403 = *(double *)&v336;
              v404 = 2114;
              v405 = v337;
              v406 = 2114;
              v407 = selfa;
              v408 = 2112;
              v409 = obja;
              v410 = 2048;
              v411 = ((double)v338 - (double)v340) / 1000000000.0;
              v412 = 2048;
              v413 = v341;
              _os_log_impl(&dword_24A5B4000, v317, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: %{public}@->%@: event end %+.3fs @%llu", buf, 0x3Eu);

            }
            *__error() = v316;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v351 = objc_msgSend(v374, "processID");
              v352 = (void *)objc_msgSend(v374, "threadID");
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v374, "endEvent");
                v353 = (void *)objc_claimAutoreleasedReturnValue();
                v351 = objc_msgSend(v353, "processID");

                objc_msgSend(v374, "endEvent");
                v354 = (void *)objc_claimAutoreleasedReturnValue();
                v352 = (void *)objc_msgSend(v354, "threadID");

              }
              else
              {
                v352 = 0;
                v351 = -1;
              }
            }
            v355 = [WRTimestampAndThread alloc];
            v356 = (void *)objc_msgSend(v374, "endNanoseconds");
            objc_msgSend(v374, "endDate");
            v357 = (void *)objc_claimAutoreleasedReturnValue();
            v358 = -[WRTimestampAndThread initWithPID:threadID:machContTimeNs:date:]((id *)&v355->super.isa, v351, v352, v356, v357);
            objc_setProperty_atomic(a1, v359, v358, 40);

            objc_msgSend(v383, "signpost");
            v360 = (void *)objc_claimAutoreleasedReturnValue();
            objc_setProperty_atomic(a1, v361, v360, 48);

            v363 = (void (**)(id, void *))objc_getProperty(a1, v362, 136, 1);
            v363[2](v363, a1);
            -[WRWorkflowEventTracker resetWithoutReportingErrors](a1, v364);
            goto LABEL_199;
          }
        }
        objc_msgSend(v374, "name");

        objc_msgSend(a1, "workflow");
        v295 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v295, "name");

        objc_msgSend(a1, "eventIdentifier");
        objc_msgSend(a1, "eventIdentifier");
        v296 = (void *)objc_claimAutoreleasedReturnValue();

        v297 = *__error();
        _wrlog();
        v298 = objc_claimAutoreleasedReturnValue();
        v299 = os_log_type_enabled(v298, OS_LOG_TYPE_FAULT);
        if (selfa == 0.0)
        {
          if (v296)
          {
            if (v299)
              -[WRWorkflowEventTracker handleSignpost:wrsignpost:].cold.2((uint64_t)a1, (uint64_t)v374, (uint64_t)v298, v300, v301, v302, v303, v304, v365, v366, *((uint64_t *)&v366 + 1), v367, *((uint64_t *)&v367 + 1), v368, *((uint64_t *)&v368 + 1), v369, *((uint64_t *)&v369 + 1), v370, *((uint64_t *)&v370 + 1),
                v371,
                *(uint64_t *)&v372);
          }
          else if (v299)
          {
            -[WRWorkflowEventTracker handleSignpost:wrsignpost:].cold.1(a1, v374, v298);
          }
        }
        else if (v296)
        {
          if (v299)
          {
            objc_msgSend(a1, "workflow");
            v305 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v305, "name");
            v306 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "eventIdentifier");
            v307 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v374, "name");
            v308 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            *(_DWORD *)buf = 138544386;
            v403 = *(double *)&v306;
            v404 = 2114;
            v405 = v307;
            v406 = 2114;
            v407 = v308;
            v408 = 2114;
            v409 = selfa;
            v410 = 2112;
            v411 = obja;
            _os_log_fault_impl(&dword_24A5B4000, v298, OS_LOG_TYPE_FAULT, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: No missing end signposts, but didn't find an end signpost tracker", buf, 0x34u);

          }
        }
        else if (v299)
        {
          objc_msgSend(a1, "workflow");
          v309 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v309, "name");
          v310 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v374, "name");
          v311 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v403 = *(double *)&v310;
          v404 = 2114;
          v405 = v311;
          v406 = 2114;
          v407 = selfa;
          v408 = 2112;
          v409 = obja;
          _os_log_fault_impl(&dword_24A5B4000, v298, OS_LOG_TYPE_FAULT, "%{public}@: %{public}@: %{public}@->%@: No missing end signposts, but didn't find an end signpost tracker", buf, 0x2Au);

        }
        *__error() = v297;
        -[WRWorkflowEventTracker resetWithoutReportingErrors](a1, v312);
      }
LABEL_199:
      v102 = 1;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v105 = objc_msgSend(v374, "startNanoseconds");
        objc_msgSend(v374, "beginEvent");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        v107 = objc_msgSend(v106, "threadID");

        if (objc_msgSend(objc_getProperty(a1, v108, 128, 1), "count"))
        {
          v110 = 0;
          while (1)
          {
            objc_msgSend(objc_getProperty(a1, v109, 128, 1), "objectAtIndexedSubscript:", v110);
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            v113 = v111;
            v114 = v111 ? objc_getProperty(v111, v112, 24, 1) : 0;
            if (objc_msgSend(v114, "machContTimeNs") == v105)
            {
              v116 = v113 ? objc_getProperty(v113, v115, 24, 1) : 0;
              if (objc_msgSend(v116, "threadID") == v107)
                break;
            }

            if (++v110 >= (unint64_t)objc_msgSend(objc_getProperty(a1, v118, 128, 1), "count"))
              goto LABEL_97;
          }
          objc_msgSend(objc_getProperty(a1, v117, 128, 1), "removeObjectAtIndex:", v110);

        }
      }
LABEL_97:
      v102 = 0;
    }

  }
  return v102;
}

- (id)openIndividuatedIntervalsWithFieldNameMatchingAnEndSignpostFromBeforeEventStart
{
  if (result)
    return objc_getProperty(result, a2, 128, 1);
  return result;
}

void __52__WRWorkflowEventTracker_handleSignpost_wrsignpost___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "eventStart");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "machContTimeNs");
  v4 = *(_QWORD *)(a1 + 40);

  if (v3 == v4)
  {
    mach_get_times();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSince1970:", (double)0);
    if (WRMachTimebaseForLiveMachine_once != -1)
      dispatch_once(&WRMachTimebaseForLiveMachine_once, &__block_literal_global_417);
    v6 = 0;
    if ((_DWORD)WRMachTimebaseForLiveMachine_timebase && HIDWORD(WRMachTimebaseForLiveMachine_timebase))
    {
      v6 = 0;
      if ((_DWORD)WRMachTimebaseForLiveMachine_timebase != HIDWORD(WRMachTimebaseForLiveMachine_timebase))
        v6 = (void *)__udivti3();
    }
    -[WRWorkflowEventTracker reportErrorsAndResetAtMachContNs:date:](*(void **)(a1 + 32), v6, v5);

  }
}

void __52__WRWorkflowEventTracker_handleSignpost_wrsignpost___block_invoke_167(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  id v9;
  char v10;
  id v11;

  v11 = a2;
  v8 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 == v8)
  {
    v10 = objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if ((v10 & 1) == 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }
  }
  else
  {

  }
}

- (void)fillInNonDiagnosticSignpost:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  const char *v40;
  NSObject *v41;
  uint32_t v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  const char *v50;
  NSObject *v51;
  uint32_t v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  double v76;
  __int16 v77;
  double v78;
  __int16 v79;
  double v80;
  __int16 v81;
  double v82;
  __int16 v83;
  double v84;
  __int16 v85;
  double v86;
  __int16 v87;
  uint64_t v88;
  __int16 v89;
  uint64_t v90;
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "workflow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WRWorkflow wrsignpostForSignpostObject:](v4, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_35;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v3, "isSyntheticIntervalEvent") & 1) != 0)
      goto LABEL_35;
    objc_msgSend(v5, "individuationFieldName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WRWorkflowEventTracker individuationIdentifierForSignpostObject:individuationFieldName:](a1, v3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WRWorkflowEventTracker trackerForWRSignpost:individuationIdentifier:](a1, v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v3, "startNanoseconds");
    v10 = objc_msgSend(v3, "endNanoseconds");
    objc_msgSend(v3, "name");

    objc_msgSend(a1, "workflow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");

    objc_msgSend(a1, "eventIdentifier");
    objc_msgSend(a1, "eventIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v70 = *__error();
    _wrlog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v9 == v10)
    {
      if (v6)
      {
        if (v12)
        {
          if (v14)
          {
            objc_msgSend(a1, "workflow");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "name");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "eventIdentifier");
            v68 = v7;
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "name");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = (double)(unint64_t)objc_msgSend(v3, "startNanoseconds");
            objc_msgSend(a1, "eventStart");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544898;
            v72 = v15;
            v73 = 2114;
            v74 = v16;
            v75 = 2114;
            v76 = *(double *)&v17;
            v77 = 2114;
            v78 = *(double *)&v6;
            v79 = 2112;
            v80 = *(double *)&v68;
            v81 = 2048;
            v82 = (v18 - (double)(unint64_t)objc_msgSend(v19, "machContTimeNs")) / 1000000000.0;
            v83 = 2048;
            v84 = COERCE_DOUBLE(objc_msgSend(v3, "startMachContinuousTime"));
            _os_log_impl(&dword_24A5B4000, v13, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: fill non-diagnostic signposts: event middle %+.3fs @%llu", buf, 0x48u);

            v7 = v68;
            v20 = v64;
LABEL_33:

          }
LABEL_34:

          *__error() = v70;
          -[WRWorkflowEventTracker applySignpost:toSignpostTracker:](a1, v3, v8);

LABEL_35:
          goto LABEL_36;
        }
        if (!v14)
          goto LABEL_34;
        objc_msgSend(a1, "workflow");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "name");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (double)(unint64_t)objc_msgSend(v3, "startNanoseconds");
        objc_msgSend(a1, "eventStart");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v72 = v21;
        v73 = 2114;
        v74 = v32;
        v75 = 2114;
        v76 = *(double *)&v6;
        v77 = 2112;
        v78 = *(double *)&v7;
        v79 = 2048;
        v80 = (v39 - (double)(unint64_t)objc_msgSend(v33, "machContTimeNs")) / 1000000000.0;
        v81 = 2048;
        v82 = COERCE_DOUBLE(objc_msgSend(v3, "startMachContinuousTime"));
        v40 = "%{public}@: %{public}@: %{public}@->%@: fill non-diagnostic signposts: event middle %+.3fs @%llu";
        v41 = v13;
        v42 = 62;
      }
      else
      {
        if (v12)
        {
          if (!v14)
            goto LABEL_34;
          objc_msgSend(a1, "workflow");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "name");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "eventIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "name");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (double)(unint64_t)objc_msgSend(v3, "startNanoseconds");
          objc_msgSend(a1, "eventStart");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v72 = v28;
          v73 = 2114;
          v74 = v29;
          v75 = 2114;
          v76 = *(double *)&v30;
          v77 = 2048;
          v78 = (v31 - (double)(unint64_t)objc_msgSend(v65, "machContTimeNs")) / 1000000000.0;
          v79 = 2048;
          v80 = COERCE_DOUBLE(objc_msgSend(v3, "startMachContinuousTime"));
          _os_log_impl(&dword_24A5B4000, v13, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: fill non-diagnostic signposts: event middle %+.3fs @%llu", buf, 0x34u);

LABEL_32:
          v20 = v69;
          goto LABEL_33;
        }
        if (!v14)
          goto LABEL_34;
        objc_msgSend(a1, "workflow");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "name");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = (double)(unint64_t)objc_msgSend(v3, "startNanoseconds");
        objc_msgSend(a1, "eventStart");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v72 = v21;
        v73 = 2114;
        v74 = v32;
        v75 = 2048;
        v76 = (v53 - (double)(unint64_t)objc_msgSend(v33, "machContTimeNs")) / 1000000000.0;
        v77 = 2048;
        v78 = COERCE_DOUBLE(objc_msgSend(v3, "startMachContinuousTime"));
        v40 = "%{public}@: %{public}@: fill non-diagnostic signposts: event middle %+.3fs @%llu";
        v41 = v13;
        v42 = 42;
      }
      _os_log_impl(&dword_24A5B4000, v41, OS_LOG_TYPE_INFO, v40, buf, v42);
      goto LABEL_27;
    }
    if (v6)
    {
      if (v12)
      {
        if (!v14)
          goto LABEL_34;
        objc_msgSend(a1, "workflow");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "eventIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "name");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (double)(unint64_t)objc_msgSend(v3, "startNanoseconds");
        objc_msgSend(a1, "eventStart");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (v23 - (double)(unint64_t)objc_msgSend(v61, "machContTimeNs")) / 1000000000.0;
        v25 = (double)(unint64_t)objc_msgSend(v3, "endNanoseconds");
        objc_msgSend(a1, "eventStart");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (v25 - (double)(unint64_t)objc_msgSend(v59, "machContTimeNs")) / 1000000000.0;
        v27 = (double)(unint64_t)objc_msgSend(v3, "endNanoseconds");
        *(_DWORD *)buf = 138545666;
        v72 = v21;
        v73 = 2114;
        v74 = v22;
        v75 = 2114;
        v76 = *(double *)&v60;
        v77 = 2114;
        v78 = *(double *)&v6;
        v79 = 2112;
        v80 = *(double *)&v7;
        v81 = 2048;
        v82 = v24;
        v83 = 2048;
        v84 = v26;
        v85 = 2048;
        v86 = (v27 - (double)(unint64_t)objc_msgSend(v3, "startNanoseconds")) / 1000000000.0;
        v87 = 2048;
        v88 = objc_msgSend(v3, "startMachContinuousTime");
        v89 = 2048;
        v90 = objc_msgSend(v3, "endMachContinuousTime");
        _os_log_impl(&dword_24A5B4000, v13, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: %{public}@->%@: fill non-diagnostic signposts: event middle %+.3fs - %+.3fs (%.3fs) @%llu-%llu", buf, 0x66u);

        goto LABEL_28;
      }
      if (!v14)
        goto LABEL_34;
      objc_msgSend(a1, "workflow");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "name");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "name");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (double)(unint64_t)objc_msgSend(v3, "startNanoseconds");
      objc_msgSend(a1, "eventStart");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (v45 - (double)(unint64_t)objc_msgSend(v67, "machContTimeNs")) / 1000000000.0;
      v47 = (double)(unint64_t)objc_msgSend(v3, "endNanoseconds");
      objc_msgSend(a1, "eventStart");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (v47 - (double)(unint64_t)objc_msgSend(v63, "machContTimeNs")) / 1000000000.0;
      v49 = (double)(unint64_t)objc_msgSend(v3, "endNanoseconds");
      *(_DWORD *)buf = 138545410;
      v72 = v43;
      v73 = 2114;
      v74 = v44;
      v75 = 2114;
      v76 = *(double *)&v6;
      v77 = 2112;
      v78 = *(double *)&v7;
      v79 = 2048;
      v80 = v46;
      v81 = 2048;
      v82 = v48;
      v83 = 2048;
      v84 = (v49 - (double)(unint64_t)objc_msgSend(v3, "startNanoseconds")) / 1000000000.0;
      v85 = 2048;
      v86 = COERCE_DOUBLE(objc_msgSend(v3, "startMachContinuousTime"));
      v87 = 2048;
      v88 = objc_msgSend(v3, "endMachContinuousTime");
      v50 = "%{public}@: %{public}@: %{public}@->%@: fill non-diagnostic signposts: event middle %+.3fs - %+.3fs (%.3fs) @%llu-%llu";
      v51 = v13;
      v52 = 92;
    }
    else
    {
      if (v12)
      {
        if (!v14)
          goto LABEL_34;
        objc_msgSend(a1, "workflow");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "eventIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "name");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (double)(unint64_t)objc_msgSend(v3, "startNanoseconds");
        objc_msgSend(a1, "eventStart");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (v34 - (double)(unint64_t)objc_msgSend(v66, "machContTimeNs")) / 1000000000.0;
        v36 = (double)(unint64_t)objc_msgSend(v3, "endNanoseconds");
        objc_msgSend(a1, "eventStart");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (v36 - (double)(unint64_t)objc_msgSend(v62, "machContTimeNs")) / 1000000000.0;
        v38 = (double)(unint64_t)objc_msgSend(v3, "endNanoseconds");
        *(_DWORD *)buf = 138545154;
        v72 = v21;
        v73 = 2114;
        v74 = v32;
        v75 = 2114;
        v76 = *(double *)&v33;
        v77 = 2048;
        v78 = v35;
        v79 = 2048;
        v80 = v37;
        v81 = 2048;
        v82 = (v38 - (double)(unint64_t)objc_msgSend(v3, "startNanoseconds")) / 1000000000.0;
        v83 = 2048;
        v84 = COERCE_DOUBLE(objc_msgSend(v3, "startMachContinuousTime"));
        v85 = 2048;
        v86 = COERCE_DOUBLE(objc_msgSend(v3, "endMachContinuousTime"));
        _os_log_impl(&dword_24A5B4000, v13, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: %{public}@: fill non-diagnostic signposts: event middle %+.3fs - %+.3fs (%.3fs) @%llu-%llu", buf, 0x52u);

LABEL_27:
LABEL_28:

        goto LABEL_32;
      }
      if (!v14)
        goto LABEL_34;
      objc_msgSend(a1, "workflow");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "name");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "name");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (double)(unint64_t)objc_msgSend(v3, "startNanoseconds");
      objc_msgSend(a1, "eventStart");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = (v54 - (double)(unint64_t)objc_msgSend(v67, "machContTimeNs")) / 1000000000.0;
      v56 = (double)(unint64_t)objc_msgSend(v3, "endNanoseconds");
      objc_msgSend(a1, "eventStart");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = (v56 - (double)(unint64_t)objc_msgSend(v63, "machContTimeNs")) / 1000000000.0;
      v58 = (double)(unint64_t)objc_msgSend(v3, "endNanoseconds");
      *(_DWORD *)buf = 138544898;
      v72 = v43;
      v73 = 2114;
      v74 = v44;
      v75 = 2048;
      v76 = v55;
      v77 = 2048;
      v78 = v57;
      v79 = 2048;
      v80 = (v58 - (double)(unint64_t)objc_msgSend(v3, "startNanoseconds")) / 1000000000.0;
      v81 = 2048;
      v82 = COERCE_DOUBLE(objc_msgSend(v3, "startMachContinuousTime"));
      v83 = 2048;
      v84 = COERCE_DOUBLE(objc_msgSend(v3, "endMachContinuousTime"));
      v50 = "%{public}@: %{public}@: fill non-diagnostic signposts: event middle %+.3fs - %+.3fs (%.3fs) @%llu-%llu";
      v51 = v13;
      v52 = 72;
    }
    _os_log_impl(&dword_24A5B4000, v51, OS_LOG_TYPE_INFO, v50, buf, v52);

    goto LABEL_32;
  }
LABEL_36:

}

- (NSMutableDictionary)environment
{
  const char *v3;
  id v4;
  id Property;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  if (self)
    Property = objc_getProperty(self, v3, 96, 1);
  else
    Property = 0;
  v6 = Property;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    v10 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "environment");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = v10;
        v15[1] = 3221225472;
        v15[2] = __37__WRWorkflowEventTracker_environment__block_invoke;
        v15[3] = &unk_251BE45D0;
        v15[4] = v12;
        v16 = v4;
        objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v15);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  return (NSMutableDictionary *)v4;
}

void __37__WRWorkflowEventTracker_environment__block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (objc_class *)MEMORY[0x24BDD17C8];
  v6 = a3;
  v7 = a2;
  v8 = [v5 alloc];
  objc_msgSend(*(id *)(a1 + 32), "signpost");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v8, "initWithFormat:", CFSTR("%@_%@"), v10, v7);

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v11);
}

- (id)diagnosticsExceedingThresholds
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(a1, "workflow");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "workflowDiagnostics");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v27 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (objc_msgSend(v8, "hasTriggerThresholdDurationSingle"))
          {
            objc_msgSend(a1, "eventEnd");
            v9 = objc_claimAutoreleasedReturnValue();
            if (v9)
            {
              v10 = (void *)v9;
              objc_msgSend(a1, "eventStart");
              v11 = objc_claimAutoreleasedReturnValue();
              if (v11)
              {
                v12 = (void *)v11;
                objc_msgSend(a1, "error");
                v13 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v13)
                {
                  if (objc_msgSend(v8, "reportOmittingNetworkBoundIntervals"))
                  {
                    objc_msgSend(a1, "stats");
                    v14 = (double)0;
                  }
                  else
                  {
                    objc_msgSend(a1, "eventEnd");
                    v15 = (void *)objc_claimAutoreleasedReturnValue();
                    v16 = (double)(unint64_t)objc_msgSend(v15, "machContTimeNs");
                    objc_msgSend(a1, "eventStart");
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    v14 = v16 - (double)(unint64_t)objc_msgSend(v17, "machContTimeNs");

                  }
                  objc_msgSend(v8, "triggerThresholdDurationSingle");
                  if (v18 <= v14 / 1000000000.0)
                  {
                    v23 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                    objc_msgSend(v23, "addObject:", v8);
                    goto LABEL_27;
                  }
                }
              }
              else
              {

              }
            }
          }
          if (objc_msgSend(v8, "triggerEventTimeout"))
          {
            objc_msgSend(a1, "error");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v19;
            if (v19)
            {
              objc_msgSend(v19, "domain");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v21, "isEqualToString:", CFSTR("WorkflowResponsivenessError")) & 1) != 0)
              {
                v22 = objc_msgSend(v20, "code");

                if (v22 == 4)
                {
                  v23 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                  objc_msgSend(v23, "addObject:", v8);

                  goto LABEL_27;
                }
              }
              else
              {

              }
            }

          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v5)
          continue;
        break;
      }
    }
    v23 = 0;
LABEL_27:

    v24 = (void *)objc_msgSend(v23, "copy");
  }
  else
  {
    v24 = 0;
  }
  return v24;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[WRWorkflowEventTracker workflow](self, "workflow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Tracker for %@"), v5);

  return v6;
}

+ (id)tailspinDirectory
{
  objc_opt_self();
  if (tailspinDirectory_onceToken != -1)
    dispatch_once(&tailspinDirectory_onceToken, &__block_literal_global_171);
  return (id)tailspinDirectory_url;
}

void __43__WRWorkflowEventTracker_tailspinDirectory__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:isDirectory:", CFSTR("/private/var/db/WorkflowResponsiveness/Tailspins"), 1);
  v1 = (void *)tailspinDirectory_url;
  tailspinDirectory_url = v0;

}

+ (void)makeTailspinDirectory
{
  objc_opt_self();
  if (makeTailspinDirectory_onceToken != -1)
    dispatch_once(&makeTailspinDirectory_onceToken, &__block_literal_global_175);
}

void __47__WRWorkflowEventTracker_makeTailspinDirectory__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  const char *v4;
  void *v5;
  char v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  int v13;
  int v14;
  int v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  +[WRWorkflowEventTracker tailspinDirectory]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v1)
  {
    v7 = *__error();
    _wrlog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      __47__WRWorkflowEventTracker_makeTailspinDirectory__block_invoke_cold_1();
    goto LABEL_11;
  }
  v2 = objc_retainAutorelease(v0);
  v3 = objc_msgSend(v2, "fileSystemRepresentation");
  if (!v3)
  {
    v7 = *__error();
    _wrlog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      __47__WRWorkflowEventTracker_makeTailspinDirectory__block_invoke_cold_2();
    goto LABEL_11;
  }
  v4 = (const char *)v3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v1);

  if ((v6 & 1) == 0)
  {
    if (geteuid())
    {
      v7 = *__error();
      _wrlog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        __47__WRWorkflowEventTracker_makeTailspinDirectory__block_invoke_cold_7();
LABEL_11:

      *__error() = v7;
      goto LABEL_12;
    }
    v25 = *MEMORY[0x24BDD0CC8];
    v26[0] = &unk_251BE8B90;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v11 = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v2, 1, v9, &v24);
    v12 = v24;

    if ((v11 & 1) != 0)
    {
      v13 = open(v4, 0);
      if (v13 == -1)
      {
        v21 = *__error();
        _wrlog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          __47__WRWorkflowEventTracker_makeTailspinDirectory__block_invoke_cold_3();

        *__error() = v21;
      }
      else
      {
        v14 = v13;
        v23 = 73797;
        v15 = ffsctl(v13, 0xC0084A44uLL, &v23, 0);
        v16 = *__error();
        _wrlog();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v15)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
            __47__WRWorkflowEventTracker_makeTailspinDirectory__block_invoke_cold_5();
        }
        else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          __47__WRWorkflowEventTracker_makeTailspinDirectory__block_invoke_cold_4();
        }

        *__error() = v16;
        close(v14);
      }
    }
    else
    {
      v19 = *__error();
      _wrlog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        __47__WRWorkflowEventTracker_makeTailspinDirectory__block_invoke_cold_6();

      *__error() = v19;
    }

  }
LABEL_12:

}

+ (void)cleanupWorkflowResponsivenessDiagnosticsDirectory
{
  void *v3;
  id v4;

  +[WRWorkflowEventTracker tailspinDirectory]();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[WRWorkflowEventTracker cleanupDirectory:ofFilesWithSuffix:olderThan:](259200.0, (uint64_t)a1, v4, CFSTR("tailspin"));
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:isDirectory:", CFSTR("/private/var/db/WorkflowResponsiveness"), 1);
  +[WRWorkflowEventTracker cleanupDirectory:ofFilesWithSuffix:olderThan:](259200.0, (uint64_t)a1, v3, CFSTR("tailspin"));

}

+ (void)cleanupDirectory:(void *)a3 ofFilesWithSuffix:(void *)a4 olderThan:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  int v24;
  NSObject *v25;
  NSObject *v26;
  const char *v27;
  uint32_t v28;
  char v29;
  double v30;
  double v31;
  _BOOL4 v32;
  NSObject *v33;
  const char *v34;
  NSObject *v35;
  const char *v36;
  char v37;
  id v38;
  uint64_t v39;
  int v40;
  NSObject *v41;
  int v42;
  NSObject *v43;
  int v44;
  NSObject *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  id obj;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  id v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  _QWORD v70[3];
  _BYTE v71[128];
  _QWORD v72[5];

  v72[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v50 = a4;
  objc_opt_self();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "fileExistsAtPath:", v7) & 1) != 0)
    {
      v53 = *MEMORY[0x24BDBCC98];
      v54 = *MEMORY[0x24BDBCCD0];
      v72[0] = *MEMORY[0x24BDBCCD0];
      v72[1] = v53;
      v9 = *MEMORY[0x24BDBCBF0];
      v72[2] = *MEMORY[0x24BDBCBF0];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v72, 3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v6, v10, 5, &__block_literal_global_184);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v49 = v8;
        v47 = v7;
        v48 = v6;
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v46 = v11;
        obj = v11;
        v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
        if (!v55)
          goto LABEL_43;
        v52 = *(_QWORD *)v59;
        v12 = -a1;
        while (1)
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v59 != v52)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v13);
            v70[0] = v54;
            v70[1] = v53;
            v70[2] = v9;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v70, 3);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = 0;
            objc_msgSend(v14, "resourceValuesForKeys:error:", v15, &v57);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v57;

            objc_msgSend(v16, "objectForKeyedSubscript:", v54);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKeyedSubscript:", v53);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKeyedSubscript:", v9);
            v20 = objc_claimAutoreleasedReturnValue();
            v21 = (void *)v20;
            if (v18)
              v22 = v19 == 0;
            else
              v22 = 1;
            if (v22 || v20 == 0)
            {
              v24 = *__error();
              _wrlog();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138413058;
                v63 = v14;
                v64 = 2112;
                v65 = v18;
                v66 = 2112;
                v67 = v19;
                v68 = 2112;
                v69 = v21;
                v26 = v25;
                v27 = "WR cleanup: Unable to get info about %@: filename:%@ isRegularFile:%@ creationDate:%@";
                v28 = 42;
LABEL_19:
                _os_log_error_impl(&dword_24A5B4000, v26, OS_LOG_TYPE_ERROR, v27, buf, v28);
              }
            }
            else
            {
              v29 = objc_msgSend(v19, "BOOLValue");
              if ((v29 & 1) != 0)
              {
                if ((objc_msgSend(v18, "hasSuffix:", v50) & 1) != 0)
                {
                  objc_msgSend(v21, "timeIntervalSinceNow");
                  v31 = v30;
                  v24 = *__error();
                  _wrlog();
                  v25 = objc_claimAutoreleasedReturnValue();
                  v32 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
                  if (v31 <= v12)
                  {
                    if (v32)
                    {
                      *(_DWORD *)buf = 138543618;
                      v63 = v14;
                      v64 = 2114;
                      v65 = v21;
                      _os_log_impl(&dword_24A5B4000, v25, OS_LOG_TYPE_INFO, "WR cleanup: %{public}@ created at %{public}@, removing", buf, 0x16u);
                    }

                    *__error() = v24;
                    v56 = 0;
                    v37 = objc_msgSend(v49, "removeItemAtURL:error:", v14, &v56);
                    v38 = v56;
                    v17 = v38;
                    if ((v37 & 1) == 0)
                    {
                      v24 = *__error();
                      _wrlog();
                      v25 = objc_claimAutoreleasedReturnValue();
                      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                        goto LABEL_38;
                      *(_DWORD *)buf = 138543618;
                      v63 = v14;
                      v64 = 2114;
                      v65 = v17;
                      v26 = v25;
                      v27 = "Unable to remove %{public}@: %{public}@";
                      v28 = 22;
                      goto LABEL_19;
                    }
                    if (!v38)
                      goto LABEL_39;
                    v24 = *__error();
                    _wrlog();
                    v25 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138543618;
                      v63 = v14;
                      v64 = 2114;
                      v65 = v17;
                      v33 = v25;
                      v34 = "Removed %{public}@ successfully, but received error: %{public}@";
                      goto LABEL_36;
                    }
                  }
                  else if (v32)
                  {
                    *(_DWORD *)buf = 138543618;
                    v63 = v14;
                    v64 = 2114;
                    v65 = v21;
                    v33 = v25;
                    v34 = "WR cleanup: %{public}@ created at %{public}@, skipping";
LABEL_36:
                    _os_log_impl(&dword_24A5B4000, v33, OS_LOG_TYPE_INFO, v34, buf, 0x16u);
                  }
                }
                else
                {
                  v24 = *__error();
                  _wrlog();
                  v25 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v63 = v14;
                    v35 = v25;
                    v36 = "WR cleanup: %@ is not a tailspin file";
                    goto LABEL_29;
                  }
                }
              }
              else
              {
                v24 = *__error();
                _wrlog();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v63 = v14;
                  v35 = v25;
                  v36 = "WR cleanup: %@ is not a regular file";
LABEL_29:
                  _os_log_debug_impl(&dword_24A5B4000, v35, OS_LOG_TYPE_DEBUG, v36, buf, 0xCu);
                }
              }
            }
LABEL_38:

            *__error() = v24;
LABEL_39:

            ++v13;
          }
          while (v55 != v13);
          v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
          v55 = v39;
          if (!v39)
          {
LABEL_43:

            v7 = v47;
            v6 = v48;
            v8 = v49;
            v11 = v46;
            goto LABEL_53;
          }
        }
      }
      v44 = *__error();
      _wrlog();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
        +[WRWorkflowEventTracker cleanupDirectory:ofFilesWithSuffix:olderThan:].cold.2();

      *__error() = v44;
LABEL_53:

    }
    else
    {
      v42 = *__error();
      _wrlog();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        +[WRWorkflowEventTracker cleanupDirectory:ofFilesWithSuffix:olderThan:].cold.3(v43);

      *__error() = v42;
    }

  }
  else
  {
    v40 = *__error();
    _wrlog();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
      +[WRWorkflowEventTracker cleanupDirectory:ofFilesWithSuffix:olderThan:].cold.1();

    *__error() = v40;
  }

}

uint64_t __71__WRWorkflowEventTracker_cleanupDirectory_ofFilesWithSuffix_olderThan___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  NSObject *v7;

  v4 = a2;
  v5 = a3;
  v6 = *__error();
  _wrlog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __71__WRWorkflowEventTracker_cleanupDirectory_ofFilesWithSuffix_olderThan___block_invoke_cold_1();

  *__error() = v6;
  return 1;
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
  char v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56[18];

  v56[16] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDBCED8]);
  -[WRWorkflowEventTracker workflow](self, "workflow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodedDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v51 = CFSTR("wt_workflow");
  *((_QWORD *)&v51 + 1) = 0;
  v6 = (void *)objc_msgSend(v3, "initWithObjectsAndKeys:", v5);

  -[WRWorkflowEventTracker startSignpost](self, "startSignpost");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("wt_signpost_start"));

  -[WRWorkflowEventTracker endSignpost](self, "endSignpost");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("wt_signpost_end"));

  -[WRWorkflowEventTracker error](self, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[WRWorkflowEventTracker error](self, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("WorkflowResponsivenessError"));

    if ((v14 & 1) == 0)
    {
      -[WRWorkflowEventTracker workflow](self, "workflow");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "name");

      -[WRWorkflowEventTracker eventIdentifier](self, "eventIdentifier");
      -[WRWorkflowEventTracker eventIdentifier](self, "eventIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = *__error();
      _wrlog();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_FAULT);
      if (v16)
      {
        if (v19)
          -[WRWorkflowEventTracker encodedDict].cold.2((uint64_t)self, (uint64_t)v18, v20, v21, v22, v23, v24, v25, v51, v52, *((uint64_t *)&v52 + 1), v53, *((uint64_t *)&v53 + 1), v54, *((uint64_t *)&v54 + 1), v55, *((uint64_t *)&v55 + 1), v56[0], v56[1],
            v56[2],
            v56[3]);
      }
      else if (v19)
      {
        -[WRWorkflowEventTracker encodedDict].cold.1();
      }

      *__error() = v17;
    }
    v26 = (void *)MEMORY[0x24BDD16E0];
    -[WRWorkflowEventTracker error](self, "error");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "numberWithInteger:", objc_msgSend(v27, "code"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v28, CFSTR("wt_error_code"));

    -[WRWorkflowEventTracker error](self, "error");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "userInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x24BDD0BA0]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v31, CFSTR("wt_error_description"));

  }
  -[WRWorkflowEventTracker eventStart](self, "eventStart");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[WRTimestampAndThread encodedDict](v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v33, CFSTR("wt_event_start"));

  -[WRWorkflowEventTracker eventEnd](self, "eventEnd");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[WRTimestampAndThread encodedDict](v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v35, CFSTR("wt_event_end"));

  -[WRWorkflowEventTracker eventIdentifier](self, "eventIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v36, CFSTR("wt_event_identifier"));

  v37 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  -[WRWorkflowEventTracker allSignpostTrackers](self, "allSignpostTrackers");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v53 != v41)
          objc_enumerationMutation(v38);
        v43 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        objc_msgSend(v43, "signpost");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "name");
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v37, "objectForKeyedSubscript:", v45);
        v46 = (id)objc_claimAutoreleasedReturnValue();
        if (!v46)
        {
          v46 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v37, "setObject:forKeyedSubscript:", v46, v45);
        }
        -[WRSignpostTracker encodedDict](v43);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addObject:", v47);

      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    }
    while (v40);
  }

  v48 = (void *)objc_msgSend(v37, "copy");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v48, CFSTR("wt_signpost_trackers"));

  v49 = (void *)objc_msgSend(v6, "copy");
  return v49;
}

- (WRWorkflowEventTracker)initWithEncodedDict:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  WRWorkflowEventTracker *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  WRWorkflow *v27;
  uint64_t v28;
  void *v29;
  WRWorkflowEventTracker *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSError *error;
  void *v41;
  uint64_t v42;
  WRSignpost *startSignpost;
  void *v44;
  void *v45;
  uint64_t v46;
  WRSignpost *endSignpost;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id *v56;
  WRTimestampAndThread *eventStart;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  id *v66;
  WRTimestampAndThread *eventEnd;
  uint64_t v68;
  NSString *eventIdentifier;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  void *v77;
  uint64_t v79;
  id v80;
  void *v81;
  id v82;
  _QWORD v83[4];
  WRWorkflow *v84;
  id v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
  objc_super v93;
  uint64_t v94;

  v6 = a3;
  v94 = 0;
  if (a4)
    *a4 = 0;
  else
    a4 = (id *)&v94;
  v93.receiver = self;
  v93.super_class = (Class)WRWorkflowEventTracker;
  v13 = -[WRWorkflowEventTracker init](&v93, sel_init);
  if (v13)
  {
    DictGetDict(v6, CFSTR("wt_workflow"), a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      if (*a4)
      {
        v30 = 0;
      }
      else
      {
        WRMakeError(7, CFSTR("No workflow in tracker dict %@"), v14, v15, v16, v17, v18, v19, (uint64_t)v6);
        v30 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_55;
    }
    v27 = -[WRWorkflow initWithEncodedDict:error:]([WRWorkflow alloc], "initWithEncodedDict:error:", v20, a4);
    if (!v27)
    {
      if (*a4)
      {
        v30 = 0;
      }
      else
      {
        WRMakeError(3, CFSTR("No such workflow, or workflow disabled"), v21, v22, v23, v24, v25, v26, v79);
        v30 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_54;
    }
    objc_storeStrong((id *)&v13->_workflow, v27);
    DictGetNumber(v6, CFSTR("wt_error_code"), a4);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v28;
    if (*a4)
    {
      v30 = 0;
LABEL_53:

LABEL_54:
LABEL_55:

      goto LABEL_56;
    }
    if (v28)
    {
      DictGetString(v6, CFSTR("wt_error_description"), a4);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (*a4)
      {
LABEL_18:
        v30 = 0;
LABEL_52:

        goto LABEL_53;
      }
      v32 = objc_msgSend(v29, "integerValue");
      WRMakeError(v32, CFSTR("%@"), v33, v34, v35, v36, v37, v38, (uint64_t)v31);
      v39 = objc_claimAutoreleasedReturnValue();
      error = v13->_error;
      v13->_error = (NSError *)v39;

    }
    DictGetString(v6, CFSTR("wt_signpost_start"), a4);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v41;
    if (*a4)
      goto LABEL_18;
    if (v41)
    {
      -[WRWorkflow wrsignpostWithName:](v27, v41);
      v42 = objc_claimAutoreleasedReturnValue();
      startSignpost = v13->_startSignpost;
      v13->_startSignpost = (WRSignpost *)v42;

      if (!v13->_startSignpost)
      {
        -[WRWorkflow name](v27, "name");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        WRMakeError(7, CFSTR("Workflow %@ start signpost %@ doesn't exist"), v50, v51, v52, v53, v54, v55, (uint64_t)v45);
        v30 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_51;
      }
    }
    DictGetString(v6, CFSTR("wt_signpost_end"), a4);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v44;
    if (*a4)
    {
      v30 = 0;
LABEL_51:

      goto LABEL_52;
    }
    if (v44
      && (-[WRWorkflow wrsignpostWithName:](v27, v44),
          v46 = objc_claimAutoreleasedReturnValue(),
          endSignpost = v13->_endSignpost,
          v13->_endSignpost = (WRSignpost *)v46,
          endSignpost,
          !v13->_endSignpost))
    {
      -[WRWorkflow name](v27, "name");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      WRMakeError(7, CFSTR("Workflow %@ end signpost %@ doesn't exist"), v59, v60, v61, v62, v63, v64, (uint64_t)v49);
      v30 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      DictGetDict(v6, CFSTR("wt_event_start"), a4);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v48;
      if (!*a4)
      {
        if (!v48
          || (v56 = -[WRTimestampAndThread initWithEncodedDict:error:]((id *)[WRTimestampAndThread alloc], v48, (uint64_t *)a4), eventStart = v13->_eventStart, v13->_eventStart = (WRTimestampAndThread *)v56, eventStart, v13->_eventStart))
        {
          DictGetDict(v6, CFSTR("wt_event_end"), a4);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          if (!*a4)
          {
            v65 = v58;
            if (!v58
              || (v66 = -[WRTimestampAndThread initWithEncodedDict:error:]((id *)[WRTimestampAndThread alloc], v58, (uint64_t *)a4), eventEnd = v13->_eventEnd, v13->_eventEnd = (WRTimestampAndThread *)v66, eventEnd, v13->_eventEnd))
            {
              v82 = v65;
              DictGetString(v6, CFSTR("wt_event_identifier"), a4);
              v68 = objc_claimAutoreleasedReturnValue();
              eventIdentifier = v13->_eventIdentifier;
              v13->_eventIdentifier = (NSString *)v68;

              if (*a4)
              {
                v30 = 0;
              }
              else
              {
                DictGetDict(v6, CFSTR("wt_signpost_trackers"), a4);
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                if (v81)
                {
                  v87 = 0;
                  v88 = &v87;
                  v89 = 0x3032000000;
                  v90 = __Block_byref_object_copy_;
                  v91 = __Block_byref_object_dispose_;
                  v92 = 0;
                  v76 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                  v83[0] = MEMORY[0x24BDAC760];
                  v83[1] = 3221225472;
                  v83[2] = __52__WRWorkflowEventTracker_initWithEncodedDict_error___block_invoke;
                  v83[3] = &unk_251BE4698;
                  v86 = &v87;
                  v84 = v27;
                  v80 = v76;
                  v85 = v80;
                  objc_msgSend(v81, "enumerateKeysAndObjectsUsingBlock:", v83);
                  v77 = (void *)v88[5];
                  if (v77)
                  {
                    v30 = 0;
                    *a4 = objc_retainAutorelease(v77);
                  }
                  else
                  {
                    objc_storeStrong((id *)&v13->_allSignpostTrackersMutable, v76);
                    v30 = v13;
                  }

                  _Block_object_dispose(&v87, 8);
                }
                else if (*a4)
                {
                  WRMakeError(7, CFSTR("WRWorkflowEventTracker: No signpost trackers in dict"), v70, v71, v72, v73, v74, v75, v79);
                  v30 = 0;
                  *a4 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v30 = 0;
                }

              }
              v58 = v82;
              goto LABEL_49;
            }
            v58 = v65;
          }
          v30 = 0;
LABEL_49:

          goto LABEL_50;
        }
      }
      v30 = 0;
    }
LABEL_50:

    goto LABEL_51;
  }
  WRMakeError(2, CFSTR("Unable to init WRWorkflowEventTracker"), v7, v8, v9, v10, v11, v12, v79);
  v30 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_56:

  return v30;
}

void __52__WRWorkflowEventTracker_initWithEncodedDict_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  WRSignpostTracker *v16;
  uint64_t v17;
  _QWORD *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *ClassName;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  _BYTE *v49;
  id obj;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[WRWorkflow wrsignpostWithName:](*(void **)(a1 + 32), v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v49 = a4;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v52;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v52 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              ClassName = object_getClassName(v15);
              WRMakeError(6, CFSTR("Invalid type in signpostTrackerDicts (%s)"), v40, v41, v42, v43, v44, v45, (uint64_t)ClassName);
              v46 = objc_claimAutoreleasedReturnValue();
              v47 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
              v48 = *(void **)(v47 + 40);
              *(_QWORD *)(v47 + 40) = v46;

LABEL_17:
              *v49 = 1;
              goto LABEL_18;
            }
            v16 = [WRSignpostTracker alloc];
            v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            obj = *(id *)(v17 + 40);
            v18 = -[WRSignpostTracker initWithEncodedDict:signpost:error:](v16, v15, v9, (uint64_t *)&obj);
            objc_storeStrong((id *)(v17 + 40), obj);
            if (!v18)
              goto LABEL_17;
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v18);

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
          if (v12)
            continue;
          break;
        }
      }
LABEL_18:

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      WRMakeError(7, CFSTR("Workflow %@ signpost %@ doesn't exist"), v30, v31, v32, v33, v34, v35, (uint64_t)v29);
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v38 = *(void **)(v37 + 40);
      *(_QWORD *)(v37 + 40) = v36;

      *a4 = 1;
    }

  }
  else
  {
    v19 = object_getClassName(v7);
    object_getClassName(v8);
    WRMakeError(6, CFSTR("Invalid type in signpostTrackerDicts (%s -> %s)"), v20, v21, v22, v23, v24, v25, (uint64_t)v19);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v28 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v26;

    *a4 = 1;
  }

}

- (WRWorkflowEventTracker)initWithTailspin:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  WRWorkflowEventTracker *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  WRWorkflowEventTracker *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  id v58;
  _QWORD v59[4];
  WRWorkflowEventTracker *v60;
  id v61[6];
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;

  v6 = a3;
  v68 = 0;
  if (a4)
    *a4 = 0;
  else
    a4 = (id *)&v68;
  v7 = objc_retainAutorelease(v6);
  if (objc_msgSend(v7, "UTF8String"))
  {
    v62 = 0;
    v63 = &v62;
    v64 = 0x3032000000;
    v65 = __Block_byref_object_copy_;
    v66 = __Block_byref_object_dispose_;
    v67 = 0;
    if (ktrace_file_open())
    {
      v14 = MEMORY[0x24BDAC760];
      v61[1] = (id)MEMORY[0x24BDAC760];
      v61[2] = (id)3221225472;
      v61[3] = __49__WRWorkflowEventTracker_initWithTailspin_error___block_invoke;
      v61[4] = &unk_251BE46C0;
      v61[5] = &v62;
      v15 = ktrace_file_iterate();
      ktrace_file_close();
      if (!v15)
      {
        v37 = v63[5];
        if (v37)
        {
          v61[0] = 0;
          self = -[WRWorkflowEventTracker initWithEncodedString:error:](self, "initWithEncodedString:error:", v37, v61);
          v43 = v61[0];
          if (self)
          {
            -[WRWorkflowEventTracker workflow](self, "workflow");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "allowListForDiagnostics");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            -[WRWorkflowEventTracker workflow](self, "workflow");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "allowListForAllSignposts");
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            if (v45 == v47)
            {
              v29 = self;
            }
            else
            {
              v48 = objc_alloc_init(MEMORY[0x24BE90690]);
              -[WRWorkflowEventTracker workflow](self, "workflow");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "allowListForAllSignposts");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "setSubsystemCategoryFilter:", v50);
              v58 = v43;

              v59[0] = v14;
              v59[1] = 3221225472;
              v59[2] = __49__WRWorkflowEventTracker_initWithTailspin_error___block_invoke_2;
              v59[3] = &unk_251BE46E8;
              v51 = self;
              v60 = v51;
              v52 = (void *)MEMORY[0x24BD14614](v59);
              objc_msgSend(v48, "setBeginEventProcessingBlock:", v52);
              objc_msgSend(v48, "setEmitEventProcessingBlock:", v52);
              objc_msgSend(v48, "setIntervalCompletionProcessingBlock:", v52);
              -[WRWorkflowEventTracker eventStart](v51, "eventStart");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "date");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              -[WRWorkflowEventTracker eventEnd](v51, "eventEnd");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "date");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = objc_msgSend(v48, "processTraceFileWithPath:startDate:endDate:errorOut:", v7, v54, v56, a4);

              if ((v57 & 1) != 0)
                v29 = v51;
              else
                v29 = 0;
              v43 = v58;

            }
          }
          else
          {
            WRMakeErrorWithUnderlyingError(6, v43, CFSTR("Tailspin %@ is not a Workflow Responsiveness tailspin"), v38, v39, v40, v41, v42, (uint64_t)v7);
            v29 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }

        }
        else
        {
          WRMakeError(7, CFSTR("No reason string in tailspin file %@"), 0, v16, v17, v18, v19, v20, (uint64_t)v7);
          v29 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_11;
      }
      v21 = objc_alloc(MEMORY[0x24BDD1540]);
      v22 = (void *)objc_msgSend(v21, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
      WRMakeErrorWithUnderlyingError(2, v22, CFSTR("Error iterating over tailspin file %@"), v23, v24, v25, v26, v27, (uint64_t)v7);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = objc_alloc(MEMORY[0x24BDD1540]);
      v22 = (void *)objc_msgSend(v30, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
      WRMakeErrorWithUnderlyingError(2, v22, CFSTR("Could not open tailspin file %@"), v31, v32, v33, v34, v35, (uint64_t)v7);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    *a4 = v28;

    v29 = 0;
LABEL_11:
    _Block_object_dispose(&v62, 8);

    goto LABEL_12;
  }
  WRMakeError(2, CFSTR("Unable to get uft8 string from %@"), v8, v9, v10, v11, v12, v13, (uint64_t)v7);
  v29 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v29;
}

uint64_t __49__WRWorkflowEventTracker_initWithTailspin_error___block_invoke(uint64_t a1)
{
  int v2;
  unsigned int v3;
  uint64_t reason;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t result;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v2 = ktrace_chunk_tag();
  v3 = ktrace_chunk_version_major();
  if (ktrace_config_create())
  {
    reason = ktrace_config_get_reason();
    if (reason)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", reason);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;
LABEL_8:

      return 0;
    }
    ktrace_config_destroy();
  }
  result = 1;
  if (v2 == 36867 && v3 <= 1)
  {
    v9 = ktrace_chunk_size();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", ktrace_chunk_map_data(), v9, 0);
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v7, 0, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BEDE408]);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    ktrace_chunk_unmap_data();
    goto LABEL_8;
  }
  return result;
}

uint64_t __49__WRWorkflowEventTracker_initWithTailspin_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workflow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allowListForDiagnostics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subsystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "category");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "passesSubsystem:category:", v6, v7);

  if ((v8 & 1) == 0)
    -[WRWorkflowEventTracker fillInNonDiagnosticSignpost:](*(void **)(a1 + 32), v3);

  return 1;
}

- (WRWorkflowEventTracker)initWithSpindump:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  FILE *v17;
  FILE *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  WRWorkflowEventTracker *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  size_t v49;
  void *v50;
  void *v51;
  size_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  stat v75;
  uint64_t v76;

  v6 = a3;
  v76 = 0;
  if (a4)
    *a4 = 0;
  else
    a4 = (id *)&v76;
  v7 = objc_retainAutorelease(v6);
  v8 = (const char *)objc_msgSend(v7, "UTF8String");
  if (!v8)
  {
    WRMakeError(2, CFSTR("Unable to get uft8 string from %@"), v9, v10, v11, v12, v13, v14, (uint64_t)v7);
    v28 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  v15 = open(v8, 0);
  if (v15 == -1)
  {
    v29 = objc_alloc(MEMORY[0x24BDD1540]);
    v30 = (void *)objc_msgSend(v29, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
    WRMakeErrorWithUnderlyingError(7, v30, CFSTR("Unable to open %@"), v31, v32, v33, v34, v35, (uint64_t)v7);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_23;
  }
  v16 = v15;
  v17 = fdopen(v15, "r");
  if (!v17)
  {
    v36 = objc_alloc(MEMORY[0x24BDD1540]);
    v37 = (void *)objc_msgSend(v36, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
    WRMakeErrorWithUnderlyingError(7, v37, CFSTR("Unable to fdopen %@"), v38, v39, v40, v41, v42, (uint64_t)v7);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    close(v16);
    goto LABEL_23;
  }
  v18 = v17;
  v19 = malloc_type_malloc(0x800uLL, 0x1F0DD3AEuLL);
  do
  {
    if (!fgets((char *)v19, 2048, v18))
    {
      free(v19);
      WRMakeError(7, CFSTR("Spindump has no custom output"), v43, v44, v45, v46, v47, v48, v74);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
  }
  while (strncmp("Custom Output:", (const char *)v19, 0xEuLL));
  free(v19);
  v20 = MEMORY[0x24BD14398](v18);
  memset(&v75, 0, sizeof(v75));
  if (fstat(v16, &v75))
  {
    v21 = objc_alloc(MEMORY[0x24BDD1540]);
    v22 = (void *)objc_msgSend(v21, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
    WRMakeErrorWithUnderlyingError(7, v22, CFSTR("Unable to fstat %@"), v23, v24, v25, v26, v27, (uint64_t)v7);
    goto LABEL_21;
  }
  v49 = v75.st_size - v20;
  if (v75.st_size <= v20)
  {
    v60 = objc_alloc(MEMORY[0x24BDD1540]);
    v22 = (void *)objc_msgSend(v60, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
    WRMakeErrorWithUnderlyingError(7, v22, CFSTR("Spindump custom output is empty"), v61, v62, v63, v64, v65, v74);
LABEL_21:
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_22:
    fclose(v18);
    goto LABEL_23;
  }
  v50 = malloc_type_malloc(v75.st_size - v20, 0x13BF95C3uLL);
  if (!v50)
  {
    v67 = objc_alloc(MEMORY[0x24BDD1540]);
    v68 = (void *)objc_msgSend(v67, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
    WRMakeErrorWithUnderlyingError(2, v68, CFSTR("Unable to malloc %lu buffer"), v69, v70, v71, v72, v73, v49);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_22;
  }
  v51 = v50;
  v52 = fread(v50, v49, 1uLL, v18);
  fclose(v18);
  if (v52 == 1)
  {
    v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", v51, v49, 1);
    self = -[WRWorkflowEventTracker initWithEncodedData:error:](self, (uint64_t)v59, a4);

    v28 = self;
    goto LABEL_24;
  }
  WRMakeError(2, CFSTR("Unable to fread custom output from %@"), v53, v54, v55, v56, v57, v58, (uint64_t)v7);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  free(v51);
LABEL_23:
  v28 = 0;
LABEL_24:

  return v28;
}

- (void)initWithEncodedData:(_QWORD *)a3 error:
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v21;
  id v22;

  if (!a1)
    return 0;
  v4 = a1;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a2, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v22 = 0;
    v4 = (void *)objc_msgSend(v4, "initWithEncodedDict:error:", v11, &v22);
    v17 = v22;
    if (v4)
    {
      v18 = v4;
    }
    else if (a3)
    {
      WRMakeErrorWithUnderlyingError(6, v17, CFSTR("Encoded string does not contain a workflow event"), v12, v13, v14, v15, v16, v21);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    v19 = v4;
  }
  else if (a3)
  {
    WRMakeError(6, CFSTR("String is not an encoded dictionary"), v5, v6, v7, v8, v9, v10, v21);
    v19 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)encodedStringWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;

  if (a3)
    *a3 = 0;
  -[WRWorkflowEventTracker encodedDict](self, "encodedDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v4, 3, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v11, 4);
    v19 = v12;
    if (v12)
    {
      v20 = v12;
    }
    else if (a3)
    {
      WRMakeError(2, CFSTR("Failed to create encoded string, unable to create UTF8 string from JSON data (%@)\n"), v13, v14, v15, v16, v17, v18, (uint64_t)v4);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else if (a3 && !*a3)
  {
    WRMakeError(2, CFSTR("Failed to create encoded string, unable to serialize into JSON (%@)\n"), v5, v6, v7, v8, v9, v10, (uint64_t)v4);
    v19 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (WRWorkflowEventTracker)initWithEncodedString:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  WRWorkflowEventTracker *v13;
  uint64_t v15;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    self = -[WRWorkflowEventTracker initWithEncodedData:error:](self, (uint64_t)v12, a4);
    v13 = self;
  }
  else if (a4)
  {
    WRMakeError(2, CFSTR("Unable to create data with encoded string"), v6, v7, v8, v9, v10, v11, v15);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)gatherDiagnosticsIfNeeded
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  char v15;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int IsBeingDebugged;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  BOOL v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t k;
  void *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  NSObject *v81;
  _BOOL4 v82;
  void *v83;
  void *v84;
  void *v85;
  int v86;
  void *v87;
  void *v88;
  int v89;
  void *v90;
  void *v91;
  int v92;
  NSObject *v93;
  _BOOL4 v94;
  void *v95;
  void *v96;
  _BOOL4 v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  int v102;
  void *v103;
  void *v104;
  _BOOL4 v105;
  int v106;
  void *v107;
  void *v108;
  _BOOL4 v109;
  void *v110;
  void *v111;
  void *v112;
  int v113;
  id Property;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  char v126;
  void *v127;
  void *v128;
  _BOOL4 v129;
  void *v130;
  void *v131;
  int v132;
  NSObject *v133;
  _BOOL4 v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  int v141;
  int v142;
  void *v143;
  void *v144;
  int v145;
  void *v146;
  uint64_t v147;
  id obj;
  id obja;
  uint64_t v150;
  unsigned int v151;
  void *v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  _BYTE v188[128];
  _BYTE v189[128];
  _BYTE v190[128];
  _BYTE v191[128];
  uint8_t v192[128];
  uint8_t buf[4];
  void *v194;
  __int16 v195;
  void *v196;
  __int16 v197;
  int v198;
  _BYTE v199[128];
  _BYTE v200[128];
  _BYTE v201[128];
  uint64_t v202;

  v202 = *MEMORY[0x24BDAC8D0];
  -[WRWorkflowEventTracker eventStart](self, "eventStart");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_8;
  v4 = (void *)v3;
  -[WRWorkflowEventTracker startSignpost](self, "startSignpost");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_7:

    goto LABEL_8;
  }
  v6 = (void *)v5;
  -[WRWorkflowEventTracker eventEnd](self, "eventEnd");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {

    goto LABEL_7;
  }
  v8 = (void *)v7;
  -[WRWorkflowEventTracker error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    goto LABEL_16;
  }
  -[WRWorkflowEventTracker endSignpost](self, "endSignpost");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
LABEL_8:
    -[WRWorkflowEventTracker workflow](self, "workflow");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");

    -[WRWorkflowEventTracker eventIdentifier](self, "eventIdentifier");
    -[WRWorkflowEventTracker eventIdentifier](self, "eventIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *__error();
    _wrlog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_FAULT);
    if (v11)
    {
      if (v14)
        -[WRWorkflowEventTracker gatherDiagnosticsIfNeeded].cold.2();
    }
    else if (v14)
    {
      -[WRWorkflowEventTracker gatherDiagnosticsIfNeeded].cold.1(self, v13);
    }
    goto LABEL_13;
  }
LABEL_16:
  -[WRWorkflowEventTracker workflow](self, "workflow");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "workflowDiagnostics");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20)
    goto LABEL_29;
  v186 = 0u;
  v187 = 0u;
  v184 = 0u;
  v185 = 0u;
  -[WRWorkflowEventTracker workflow](self, "workflow");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "allSignposts");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v184, v201, 16);
  if (!v23)
  {
LABEL_25:

    -[WRWorkflowEventTracker workflow](self, "workflow");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "name");

    -[WRWorkflowEventTracker eventIdentifier](self, "eventIdentifier");
    -[WRWorkflowEventTracker eventIdentifier](self, "eventIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *__error();
    _wrlog();
    v13 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
    if (v30)
    {
      if (v31)
        -[WRWorkflowEventTracker gatherDiagnosticsIfNeeded].cold.4();
    }
    else if (v31)
    {
      -[WRWorkflowEventTracker gatherDiagnosticsIfNeeded].cold.3(self, v13);
    }
LABEL_13:

    v15 = 0;
    *__error() = v12;
    return v15;
  }
  v24 = v23;
  v25 = *(_QWORD *)v185;
LABEL_19:
  v26 = 0;
  while (1)
  {
    if (*(_QWORD *)v185 != v25)
      objc_enumerationMutation(v22);
    objc_msgSend(*(id *)(*((_QWORD *)&v184 + 1) + 8 * v26), "diagnostics");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "count");

    if (v28)
      break;
    if (v24 == ++v26)
    {
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v184, v201, 16);
      if (!v24)
        goto LABEL_25;
      goto LABEL_19;
    }
  }

LABEL_29:
  v32 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v180 = 0u;
  v181 = 0u;
  v182 = 0u;
  v183 = 0u;
  -[WRWorkflowEventTracker allSignpostTrackers](self, "allSignpostTrackers");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v180, v200, 16);
  if (v34)
  {
    v35 = *(_QWORD *)v181;
    v147 = *(_QWORD *)v181;
    do
    {
      v36 = 0;
      obj = (id)v34;
      do
      {
        if (*(_QWORD *)v181 != v35)
          objc_enumerationMutation(v33);
        v37 = *(void **)(*((_QWORD *)&v180 + 1) + 8 * v36);
        v176 = 0u;
        v177 = 0u;
        v178 = 0u;
        v179 = 0u;
        v150 = v36;
        v152 = v37;
        objc_msgSend(v37, "emits", v146);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v176, v199, 16);
        if (v39)
        {
          v40 = v39;
          v41 = *(_QWORD *)v177;
          do
          {
            for (i = 0; i != v40; ++i)
            {
              if (*(_QWORD *)v177 != v41)
                objc_enumerationMutation(v38);
              v43 = *(void **)(*((_QWORD *)&v176 + 1) + 8 * i);
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v43, "pid"));
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v32, "containsObject:", v44) & 1) == 0)
              {
                if (WRProcessIsBeingDebugged(objc_msgSend(v43, "pid")))
                {
                  v154 = v38;
                  v77 = v33;
                  -[WRWorkflowEventTracker workflow](self, "workflow");
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v78, "name");

                  -[WRWorkflowEventTracker eventIdentifier](self, "eventIdentifier");
                  -[WRWorkflowEventTracker eventIdentifier](self, "eventIdentifier");
                  v79 = (void *)objc_claimAutoreleasedReturnValue();

                  v80 = *__error();
                  _wrlog();
                  v81 = objc_claimAutoreleasedReturnValue();
                  v82 = os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT);
                  if (v79)
                  {
                    if (v82)
                    {
                      -[WRWorkflowEventTracker workflow](self, "workflow");
                      v83 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v83, "name");
                      v84 = (void *)objc_claimAutoreleasedReturnValue();
                      -[WRWorkflowEventTracker eventIdentifier](self, "eventIdentifier");
                      v85 = (void *)objc_claimAutoreleasedReturnValue();
                      v86 = objc_msgSend(v43, "pid");
                      *(_DWORD *)buf = 138543874;
                      v194 = v84;
                      v195 = 2114;
                      v196 = v85;
                      v197 = 1024;
                      v198 = v86;
                      _os_log_impl(&dword_24A5B4000, v81, OS_LOG_TYPE_DEFAULT, "%{public}@<%{public}@>: Process [%d] is being debugged, not saving diagnostics", buf, 0x1Cu);

                    }
                  }
                  else if (v82)
                  {
                    -[WRWorkflowEventTracker workflow](self, "workflow");
                    v87 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v87, "name");
                    v88 = (void *)objc_claimAutoreleasedReturnValue();
                    v89 = objc_msgSend(v43, "pid");
                    *(_DWORD *)buf = 138543618;
                    v194 = v88;
                    v195 = 1024;
                    LODWORD(v196) = v89;
                    _os_log_impl(&dword_24A5B4000, v81, OS_LOG_TYPE_DEFAULT, "%{public}@: Process [%d] is being debugged, not saving diagnostics", buf, 0x12u);

                  }
                  goto LABEL_151;
                }
                objc_msgSend(v32, "addObject:", v44);
              }

            }
            v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v176, v199, 16);
          }
          while (v40);
        }
        v146 = v33;

        v174 = 0u;
        v175 = 0u;
        v172 = 0u;
        v173 = 0u;
        objc_msgSend(v152, "intervals");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v172, v192, 16);
        if (v46)
        {
          v47 = v46;
          v48 = *(_QWORD *)v173;
          v154 = v45;
          do
          {
            for (j = 0; j != v47; ++j)
            {
              if (*(_QWORD *)v173 != v48)
                objc_enumerationMutation(v45);
              v50 = *(void **)(*((_QWORD *)&v172 + 1) + 8 * j);
              v51 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v50, "start", v146);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "numberWithInt:", objc_msgSend(v52, "pid"));
              v44 = (void *)objc_claimAutoreleasedReturnValue();

              if ((objc_msgSend(v32, "containsObject:", v44) & 1) == 0)
              {
                objc_msgSend(v50, "start");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                IsBeingDebugged = WRProcessIsBeingDebugged(objc_msgSend(v53, "pid"));

                if (IsBeingDebugged)
                {
                  -[WRWorkflowEventTracker workflow](self, "workflow");
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v95, "name");

                  -[WRWorkflowEventTracker eventIdentifier](self, "eventIdentifier");
                  -[WRWorkflowEventTracker eventIdentifier](self, "eventIdentifier");
                  v96 = (void *)objc_claimAutoreleasedReturnValue();

                  v80 = *__error();
                  _wrlog();
                  v81 = objc_claimAutoreleasedReturnValue();
                  v97 = os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT);
                  if (v96)
                  {
                    if (!v97)
                      goto LABEL_150;
                    -[WRWorkflowEventTracker workflow](self, "workflow");
                    v98 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v98, "name");
                    v99 = (void *)objc_claimAutoreleasedReturnValue();
                    -[WRWorkflowEventTracker eventIdentifier](self, "eventIdentifier");
                    v100 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v50, "start");
                    v101 = (void *)objc_claimAutoreleasedReturnValue();
                    v102 = objc_msgSend(v101, "pid");
                    *(_DWORD *)buf = 138543874;
                    v194 = v99;
                    v195 = 2114;
                    v196 = v100;
                    v197 = 1024;
                    v198 = v102;
LABEL_99:
                    _os_log_impl(&dword_24A5B4000, v81, OS_LOG_TYPE_DEFAULT, "%{public}@<%{public}@>: Process [%d] is being debugged, not saving diagnostics", buf, 0x1Cu);

                    goto LABEL_150;
                  }
                  if (!v97)
                    goto LABEL_150;
                  -[WRWorkflowEventTracker workflow](self, "workflow");
                  v138 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v138, "name");
                  v139 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v50, "start");
                  v140 = (void *)objc_claimAutoreleasedReturnValue();
                  v141 = objc_msgSend(v140, "pid");
                  *(_DWORD *)buf = 138543618;
                  v194 = v139;
                  v195 = 1024;
                  LODWORD(v196) = v141;
LABEL_143:
                  _os_log_impl(&dword_24A5B4000, v81, OS_LOG_TYPE_DEFAULT, "%{public}@: Process [%d] is being debugged, not saving diagnostics", buf, 0x12u);

                  goto LABEL_149;
                }
                objc_msgSend(v32, "addObject:", v44);
              }

              v55 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v50, "end");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "numberWithInt:", objc_msgSend(v56, "pid"));
              v44 = (void *)objc_claimAutoreleasedReturnValue();

              if ((objc_msgSend(v32, "containsObject:", v44) & 1) == 0)
              {
                objc_msgSend(v50, "end");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                v58 = WRProcessIsBeingDebugged(objc_msgSend(v57, "pid"));

                if (v58)
                {
                  -[WRWorkflowEventTracker workflow](self, "workflow");
                  v103 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v103, "name");

                  -[WRWorkflowEventTracker eventIdentifier](self, "eventIdentifier");
                  -[WRWorkflowEventTracker eventIdentifier](self, "eventIdentifier");
                  v104 = (void *)objc_claimAutoreleasedReturnValue();

                  v80 = *__error();
                  _wrlog();
                  v81 = objc_claimAutoreleasedReturnValue();
                  v105 = os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT);
                  if (v104)
                  {
                    if (!v105)
                      goto LABEL_150;
                    -[WRWorkflowEventTracker workflow](self, "workflow");
                    v98 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v98, "name");
                    v99 = (void *)objc_claimAutoreleasedReturnValue();
                    -[WRWorkflowEventTracker eventIdentifier](self, "eventIdentifier");
                    v100 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v50, "end");
                    v101 = (void *)objc_claimAutoreleasedReturnValue();
                    v106 = objc_msgSend(v101, "pid");
                    *(_DWORD *)buf = 138543874;
                    v194 = v99;
                    v195 = 2114;
                    v196 = v100;
                    v197 = 1024;
                    v198 = v106;
                    goto LABEL_99;
                  }
                  if (!v105)
                    goto LABEL_150;
                  -[WRWorkflowEventTracker workflow](self, "workflow");
                  v138 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v138, "name");
                  v139 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v50, "end");
                  v140 = (void *)objc_claimAutoreleasedReturnValue();
                  v142 = objc_msgSend(v140, "pid");
                  *(_DWORD *)buf = 138543618;
                  v194 = v139;
                  v195 = 1024;
                  LODWORD(v196) = v142;
                  goto LABEL_143;
                }
                objc_msgSend(v32, "addObject:", v44);
              }

              v45 = v154;
            }
            v47 = objc_msgSend(v154, "countByEnumeratingWithState:objects:count:", &v172, v192, 16);
          }
          while (v47);
        }

        v170 = 0u;
        v171 = 0u;
        v168 = 0u;
        v169 = 0u;
        objc_msgSend(v152, "incompleteIntervalStarts");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v168, v191, 16);
        if (v60)
        {
          v61 = v60;
          v62 = *(_QWORD *)v169;
LABEL_59:
          v63 = 0;
          while (1)
          {
            if (*(_QWORD *)v169 != v62)
              objc_enumerationMutation(v59);
            v64 = *(void **)(*((_QWORD *)&v168 + 1) + 8 * v63);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v64, "pid", v146));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v32, "containsObject:", v44) & 1) == 0)
            {
              if (WRProcessIsBeingDebugged(objc_msgSend(v64, "pid")))
              {
                v154 = v59;
                -[WRWorkflowEventTracker workflow](self, "workflow");
                v107 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v107, "name");

                -[WRWorkflowEventTracker eventIdentifier](self, "eventIdentifier");
                -[WRWorkflowEventTracker eventIdentifier](self, "eventIdentifier");
                v108 = (void *)objc_claimAutoreleasedReturnValue();

                v80 = *__error();
                _wrlog();
                v81 = objc_claimAutoreleasedReturnValue();
                v109 = os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT);
                if (v108)
                {
                  if (v109)
                  {
                    -[WRWorkflowEventTracker workflow](self, "workflow");
                    v110 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v110, "name");
                    v111 = (void *)objc_claimAutoreleasedReturnValue();
                    -[WRWorkflowEventTracker eventIdentifier](self, "eventIdentifier");
                    v112 = (void *)objc_claimAutoreleasedReturnValue();
                    v113 = objc_msgSend(v64, "pid");
                    *(_DWORD *)buf = 138543874;
                    v194 = v111;
                    v195 = 2114;
                    v196 = v112;
                    v197 = 1024;
                    v198 = v113;
                    _os_log_impl(&dword_24A5B4000, v81, OS_LOG_TYPE_DEFAULT, "%{public}@<%{public}@>: Process [%d] is being debugged, not saving diagnostics", buf, 0x1Cu);

                  }
                  goto LABEL_150;
                }
                if (!v109)
                  goto LABEL_150;
                -[WRWorkflowEventTracker workflow](self, "workflow");
                v138 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v138, "name");
                v139 = (void *)objc_claimAutoreleasedReturnValue();
                v145 = objc_msgSend(v64, "pid");
                *(_DWORD *)buf = 138543618;
                v194 = v139;
                v195 = 1024;
                LODWORD(v196) = v145;
                _os_log_impl(&dword_24A5B4000, v81, OS_LOG_TYPE_DEFAULT, "%{public}@: Process [%d] is being debugged, not saving diagnostics", buf, 0x12u);
LABEL_149:

LABEL_150:
                v77 = v146;
LABEL_151:

                *__error() = v80;
                v15 = 0;
                goto LABEL_155;
              }
              objc_msgSend(v32, "addObject:", v44);
            }

            if (v61 == ++v63)
            {
              v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v168, v191, 16);
              if (v61)
                goto LABEL_59;
              break;
            }
          }
        }

        v36 = v150 + 1;
        v33 = v146;
        v35 = v147;
      }
      while ((id)(v150 + 1) != obj);
      v34 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v180, v200, 16);
    }
    while (v34);
  }

  v166 = 0u;
  v167 = 0u;
  v164 = 0u;
  v165 = 0u;
  -[WRWorkflowEventTracker diagnosticsExceedingThresholds](self);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v164, v190, 16);
  v67 = v66;
  v68 = v66 != 0;
  v69 = 0;
  if (v66)
  {
    v70 = *(_QWORD *)v165;
    v71 = v66;
    while (2)
    {
      for (k = 0; k != v71; ++k)
      {
        if (*(_QWORD *)v165 != v70)
          objc_enumerationMutation(v65);
        v73 = *(void **)(*((_QWORD *)&v164 + 1) + 8 * k);
        if (objc_msgSend(v73, "gatherTailspin", v146))
        {
          if ((objc_msgSend(v73, "tailspinIncludeOSLogs") & 1) != 0)
          {

            LOBYTE(v76) = 1;
            goto LABEL_86;
          }
          v69 = 1;
        }
      }
      v71 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v164, v190, 16);
      if (v71)
        continue;
      break;
    }
  }

  -[WRWorkflowEventTracker error](self, "error");
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (v74)
  {
    if (v67)
    {
      LOBYTE(v76) = 0;
      goto LABEL_132;
    }
LABEL_136:
    -[WRWorkflowEventTracker workflow](self, "workflow", v146);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "name");

    -[WRWorkflowEventTracker eventIdentifier](self, "eventIdentifier");
    -[WRWorkflowEventTracker eventIdentifier](self, "eventIdentifier");
    v131 = (void *)objc_claimAutoreleasedReturnValue();

    v132 = *__error();
    _wrlog();
    v133 = objc_claimAutoreleasedReturnValue();
    v134 = os_log_type_enabled(v133, OS_LOG_TYPE_INFO);
    if (v131)
    {
      if (v134)
      {
        -[WRWorkflowEventTracker workflow](self, "workflow");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v135, "name");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        -[WRWorkflowEventTracker eventIdentifier](self, "eventIdentifier");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v194 = v136;
        v195 = 2114;
        v196 = v137;
        _os_log_impl(&dword_24A5B4000, v133, OS_LOG_TYPE_INFO, "%{public}@<%{public}@>: No diagnostic thresholds were exceeded", buf, 0x16u);

      }
    }
    else if (v134)
    {
      -[WRWorkflowEventTracker workflow](self, "workflow");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "name");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v194 = v144;
      _os_log_impl(&dword_24A5B4000, v133, OS_LOG_TYPE_INFO, "%{public}@: No diagnostic thresholds were exceeded", buf, 0xCu);

    }
    v15 = 0;
    *__error() = v132;
    goto LABEL_155;
  }
  v162 = 0u;
  v163 = 0u;
  v160 = 0u;
  v161 = 0u;
  if (self)
    Property = objc_getProperty(self, v75, 96, 1);
  else
    Property = 0;
  obja = Property;
  v155 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v160, v189, 16);
  v76 = 0;
  if (v155)
  {
    v153 = *(_QWORD *)v161;
    while (2)
    {
      v115 = 0;
      v116 = v76;
      do
      {
        if (*(_QWORD *)v161 != v153)
          objc_enumerationMutation(obja);
        v117 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * v115);
        v156 = 0u;
        v157 = 0u;
        v158 = 0u;
        v159 = 0u;
        -[WRWorkflowEventTracker eventStart](self, "eventStart", v146);
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "machContTimeNs");
        -[WRWorkflowEventTracker eventEnd](self, "eventEnd");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "machContTimeNs");
        -[WRSignpostTracker diagnosticsExceedingThresholdsWithEventStartNs:eventEndNs:](v117);
        v120 = (void *)objc_claimAutoreleasedReturnValue();

        v121 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v156, v188, 16);
        if (v121)
        {
          v122 = v121;
          v151 = v116;
          v123 = *(_QWORD *)v157;
LABEL_114:
          v124 = 0;
          while (1)
          {
            if (*(_QWORD *)v157 != v123)
              objc_enumerationMutation(v120);
            v125 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * v124);
            if (objc_msgSend(v125, "gatherTailspin"))
            {
              v126 = objc_msgSend(v125, "tailspinIncludeOSLogs");
              v69 = 1;
              v68 = 1;
              v76 = 1;
              if ((v126 & 1) != 0)
                break;
            }
            if (v122 == ++v124)
            {
              v122 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v156, v188, 16);
              if (v122)
                goto LABEL_114;
              v68 = 1;
              v76 = v151;
              break;
            }
          }
        }
        else
        {
          v76 = v116;
        }

        if ((v69 & 1) != 0 && (v76 & 1) != 0)
        {
          v69 = 1;
          LOBYTE(v76) = 1;
          goto LABEL_131;
        }
        ++v115;
        v116 = v76;
      }
      while (v115 != v155);
      v155 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v160, v189, 16);
      if (v155)
        continue;
      break;
    }
  }
LABEL_131:

  if (!v68)
    goto LABEL_136;
LABEL_132:
  if ((v69 & 1) != 0)
  {
LABEL_86:
    if (MEMORY[0x24BEDE478])
    {
      v15 = -[WRWorkflowEventTracker gatherDiagnosticsWithTailspin:tailspinIncludeOSLogs:](self, 0, v76 & 1);
      goto LABEL_155;
    }
    -[WRWorkflowEventTracker workflow](self, "workflow");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "name");

    -[WRWorkflowEventTracker eventIdentifier](self, "eventIdentifier");
    -[WRWorkflowEventTracker eventIdentifier](self, "eventIdentifier");
    v91 = (void *)objc_claimAutoreleasedReturnValue();

    v92 = *__error();
    _wrlog();
    v93 = objc_claimAutoreleasedReturnValue();
    v94 = os_log_type_enabled(v93, OS_LOG_TYPE_ERROR);
    if (v91)
    {
      if (v94)
        -[WRWorkflowEventTracker gatherDiagnosticsIfNeeded].cold.6();
    }
    else if (v94)
    {
      -[WRWorkflowEventTracker gatherDiagnosticsIfNeeded].cold.5(self);
    }
  }
  else
  {
    -[WRWorkflowEventTracker workflow](self, "workflow");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "name");

    -[WRWorkflowEventTracker eventIdentifier](self, "eventIdentifier");
    -[WRWorkflowEventTracker eventIdentifier](self, "eventIdentifier");
    v128 = (void *)objc_claimAutoreleasedReturnValue();

    v92 = *__error();
    _wrlog();
    v93 = objc_claimAutoreleasedReturnValue();
    v129 = os_log_type_enabled(v93, OS_LOG_TYPE_ERROR);
    if (v128)
    {
      if (v129)
        -[WRWorkflowEventTracker gatherDiagnosticsIfNeeded].cold.8();
    }
    else if (v129)
    {
      -[WRWorkflowEventTracker gatherDiagnosticsIfNeeded].cold.7(self);
    }
  }

  v15 = 0;
  *__error() = v92;
LABEL_155:

  return v15;
}

- (uint64_t)gatherDiagnosticsWithTailspin:(int)a3 tailspinIncludeOSLogs:
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  int v28;
  NSObject *v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  const char *v42;
  const char *v43;
  int v44;
  int v45;
  void *v46;
  void *v47;
  int v48;
  NSObject *v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  int v53;
  NSObject *v54;
  _BOOL4 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  _BOOL4 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  _BOOL4 v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  id v80;
  __int128 v82;
  const __CFString *v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  id v98;
  _QWORD v99[4];
  _QWORD v100[4];
  _BYTE buf[12];
  __int16 v102;
  void *v103;
  uint64_t v104;

  v3 = (uint64_t)a1;
  v104 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    LODWORD(v87) = a3;
    objc_msgSend(a1, "workflow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");

    objc_msgSend((id)v3, "eventIdentifier");
    objc_msgSend((id)v3, "eventIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = *__error();
    _wrlog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (!v8)
        goto LABEL_8;
      objc_msgSend((id)v3, "workflow");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v3, "eventIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v10;
      v102 = 2114;
      v103 = v11;
      _os_log_impl(&dword_24A5B4000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@<%{public}@>: Generating diagnostics", buf, 0x16u);

    }
    else
    {
      if (!v8)
        goto LABEL_8;
      objc_msgSend((id)v3, "workflow");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v10;
      _os_log_impl(&dword_24A5B4000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Generating diagnostics", buf, 0xCu);
    }

LABEL_8:
    *__error() = v6;
    +[WRWorkflowEventTracker makeTailspinDirectory]();
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend((id)v3, "workflow");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v3, "eventStart");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (!v16)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v18 = WRStringForDate_onceToken;
    v19 = v17;
    if (v18 != -1)
      dispatch_once(&WRStringForDate_onceToken, &__block_literal_global_413);
    objc_msgSend((id)WRStringForDate_dateFormatter, "stringFromDate:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    *((_QWORD *)&v82 + 1) = v20;
    v83 = CFSTR("tailspin");
    *(_QWORD *)&v82 = v14;
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@-%@.%@"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    +[WRWorkflowEventTracker tailspinDirectory]();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "URLByAppendingPathComponent:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v98 = 0;
    objc_msgSend((id)v3, "encodedStringWithError:", &v98);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v98;
    if (!v24)
    {
      objc_msgSend((id)v3, "workflow");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "name");

      objc_msgSend((id)v3, "eventIdentifier");
      objc_msgSend((id)v3, "eventIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = *__error();
      _wrlog();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = os_log_type_enabled(v29, OS_LOG_TYPE_FAULT);
      if (v27)
      {
        v36 = 0x24BDD1000;
        if (v30)
          -[WRWorkflowEventTracker gatherDiagnosticsWithTailspin:tailspinIncludeOSLogs:].cold.10(v3, (uint64_t)v25, (uint64_t)v29, v31, v32, v33, v34, v35, v82, *((uint64_t *)&v82 + 1), (uint64_t)CFSTR("tailspin"), v84, v85, v87, v89, v90, v91, v92, v93,
            v94,
            v96,
            v97);
      }
      else
      {
        v36 = 0x24BDD1000uLL;
        if (v30)
          -[WRWorkflowEventTracker gatherDiagnosticsWithTailspin:tailspinIncludeOSLogs:].cold.9();
      }

      *__error() = v28;
      v37 = objc_alloc(*(Class *)(v36 + 1992));
      objc_msgSend((id)v3, "workflow");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "name");
      *(_QWORD *)&v82 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v37, "initWithFormat:", CFSTR("Workflow responsiveness delay detected in %@"));

    }
    objc_msgSend(v23, "URLByAppendingPathExtension:", CFSTR("temp"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v39)
    {
      v41 = objc_retainAutorelease(v39);
      v42 = (const char *)objc_msgSend(v41, "fileSystemRepresentation");
      if (v42)
      {
        v43 = v42;
        v44 = open(v42, 3586, 420);
        if (v44 != -1)
        {
          v45 = v44;
          v86 = v25;
          if (unlink(v43))
          {
            objc_msgSend((id)v3, "workflow");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "name");

            objc_msgSend((id)v3, "eventIdentifier");
            objc_msgSend((id)v3, "eventIdentifier");
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            v48 = *__error();
            _wrlog();
            v49 = objc_claimAutoreleasedReturnValue();
            v50 = os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
            if (v47)
            {
              if (v50)
                -[WRWorkflowEventTracker gatherDiagnosticsWithTailspin:tailspinIncludeOSLogs:].cold.8(v3, v43, v49);
            }
            else if (v50)
            {
              -[WRWorkflowEventTracker gatherDiagnosticsWithTailspin:tailspinIncludeOSLogs:].cold.7();
            }

            *__error() = v48;
            close(v45);
            v3 = 0;
          }
          else
          {
            *(_QWORD *)buf = 0;
            mach_get_times();
            v72 = *MEMORY[0x24BEDE428];
            v99[0] = *MEMORY[0x24BEDE3F8];
            v99[1] = v72;
            v100[0] = MEMORY[0x24BDBD1C8];
            v100[1] = MEMORY[0x24BDBD1C0];
            v99[2] = *MEMORY[0x24BEDE418];
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", WRIsAppleInternal() ^ 1);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v99[3] = *MEMORY[0x24BEDE408];
            v100[2] = v73;
            v100[3] = v24;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v100, v99, 4);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = (void *)objc_msgSend(v74, "mutableCopy");

            if ((_DWORD)v87)
              objc_msgSend(v75, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BEDE3F0]);
            dispatch_get_global_queue(0, 0);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v3, "workflow");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "name");
            v77 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            WRCreateOSTransaction("Gathering tailspin for workflow %s", (const char *)objc_msgSend(v77, "UTF8String"));
            v78 = v75;
            v79 = (void *)objc_claimAutoreleasedReturnValue();

            v95 = v23;
            v80 = v79;
            tailspin_dump_output_with_options();

            v3 = 1;
          }
          v25 = v86;
          goto LABEL_51;
        }
        objc_msgSend((id)v3, "workflow");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "name");

        objc_msgSend((id)v3, "eventIdentifier");
        objc_msgSend((id)v3, "eventIdentifier");
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        v53 = *__error();
        _wrlog();
        v54 = objc_claimAutoreleasedReturnValue();
        v71 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);
        if (v70)
        {
          if (v71)
            -[WRWorkflowEventTracker gatherDiagnosticsWithTailspin:tailspinIncludeOSLogs:].cold.6(v3, v43, v54);
        }
        else if (v71)
        {
          -[WRWorkflowEventTracker gatherDiagnosticsWithTailspin:tailspinIncludeOSLogs:].cold.5();
        }
      }
      else
      {
        objc_msgSend((id)v3, "workflow");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "name");

        objc_msgSend((id)v3, "eventIdentifier");
        objc_msgSend((id)v3, "eventIdentifier");
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        v53 = *__error();
        _wrlog();
        v54 = objc_claimAutoreleasedReturnValue();
        v63 = os_log_type_enabled(v54, OS_LOG_TYPE_FAULT);
        if (v62)
        {
          if (v63)
            -[WRWorkflowEventTracker gatherDiagnosticsWithTailspin:tailspinIncludeOSLogs:].cold.4(v3, (uint64_t)v41, (uint64_t)v54, v64, v65, v66, v67, v68, v82, *((uint64_t *)&v82 + 1), (uint64_t)v83, v84, v85, v87, v89, v90, v91, v92, v93,
              v94,
              v96,
              v97);
        }
        else if (v63)
        {
          -[WRWorkflowEventTracker gatherDiagnosticsWithTailspin:tailspinIncludeOSLogs:].cold.3();
        }
      }
    }
    else
    {
      objc_msgSend((id)v3, "workflow");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "name");

      objc_msgSend((id)v3, "eventIdentifier");
      objc_msgSend((id)v3, "eventIdentifier");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      v53 = *__error();
      _wrlog();
      v54 = objc_claimAutoreleasedReturnValue();
      v55 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);
      if (v52)
      {
        if (v55)
          -[WRWorkflowEventTracker gatherDiagnosticsWithTailspin:tailspinIncludeOSLogs:].cold.2(v3, (uint64_t)v23, (uint64_t)v54, v56, v57, v58, v59, v60, v82, (uint64_t)v83, v84, v85, v87, v89, v90, v91, v92, v93, v94,
            v96,
            v97);
      }
      else if (v55)
      {
        -[WRWorkflowEventTracker gatherDiagnosticsWithTailspin:tailspinIncludeOSLogs:].cold.1();
      }
    }

    v3 = 0;
    *__error() = v53;
LABEL_51:

  }
  return v3;
}

uint64_t __78__WRWorkflowEventTracker_gatherDiagnosticsWithTailspin_tailspinIncludeOSLogs___block_invoke(uint64_t a1, char a2)
{
  const char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  id *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  _BYTE v40[24];
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t vars0;
  uint64_t vars8;

  v43 = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) == 0)
  {
    v10 = (id *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 32), "workflow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");

    objc_msgSend(*v10, "eventIdentifier");
    objc_msgSend(*v10, "eventIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = *__error();
    _wrlog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (v12)
    {
      if (v15)
        __78__WRWorkflowEventTracker_gatherDiagnosticsWithTailspin_tailspinIncludeOSLogs___block_invoke_cold_6(a1 + 32, a1, (uint64_t)v14, v16, v17, v18, v19, v20, *(__int128 *)v40, *(uint64_t *)&v40[16], v41, v42, v43, v44, v45, v46, v47, v48, v49,
          vars0,
          vars8);
    }
    else if (v15)
    {
      __78__WRWorkflowEventTracker_gatherDiagnosticsWithTailspin_tailspinIncludeOSLogs___block_invoke_cold_5();
    }

    *__error() = v13;
    return close(*(_DWORD *)(a1 + 56));
  }
  v3 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "fileSystemRepresentation");
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "workflow");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "name");

    objc_msgSend(*(id *)(a1 + 32), "eventIdentifier");
    objc_msgSend(*(id *)(a1 + 32), "eventIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *__error();
    _wrlog();
    v8 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v22)
    {
      if (v23)
        __78__WRWorkflowEventTracker_gatherDiagnosticsWithTailspin_tailspinIncludeOSLogs___block_invoke_cold_2(a1 + 32, a1 + 40, (uint64_t)v8, v24, v25, v26, v27, v28, *(__int128 *)v40, *(int *)&v40[16], *(__int16 *)&v40[20], *(__int16 *)&v40[22], v41, v42, v43, v44, v45, v46, v47,
          v48,
          v49,
          vars0,
          vars8);
    }
    else if (v23)
    {
      __78__WRWorkflowEventTracker_gatherDiagnosticsWithTailspin_tailspinIncludeOSLogs___block_invoke_cold_1();
    }
    goto LABEL_23;
  }
  v4 = (uint64_t)v3;
  if (fclonefileat(*(_DWORD *)(a1 + 56), -1, v3, 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "workflow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");

    objc_msgSend(*(id *)(a1 + 32), "eventIdentifier");
    objc_msgSend(*(id *)(a1 + 32), "eventIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *__error();
    _wrlog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v9)
        __78__WRWorkflowEventTracker_gatherDiagnosticsWithTailspin_tailspinIncludeOSLogs___block_invoke_cold_4(a1 + 32, v4, v8);
    }
    else if (v9)
    {
      __78__WRWorkflowEventTracker_gatherDiagnosticsWithTailspin_tailspinIncludeOSLogs___block_invoke_cold_3();
    }
LABEL_23:

    *__error() = v7;
    return close(*(_DWORD *)(a1 + 56));
  }
  close(*(_DWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "workflow");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "name");

  objc_msgSend(*(id *)(a1 + 32), "eventIdentifier");
  objc_msgSend(*(id *)(a1 + 32), "eventIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = *__error();
  _wrlog();
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
  if (v30)
  {
    if (v33)
    {
      objc_msgSend(*(id *)(a1 + 32), "workflow");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "name");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "eventIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v40 = 138543874;
      *(_QWORD *)&v40[4] = v35;
      *(_WORD *)&v40[12] = 2114;
      *(_QWORD *)&v40[14] = v36;
      *(_WORD *)&v40[22] = 2082;
      v41 = v4;
      _os_log_impl(&dword_24A5B4000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@<%{public}@>: saved tailspin file %{public}s for slow workflow, notifying spindump", v40, 0x20u);

    }
  }
  else if (v33)
  {
    objc_msgSend(*(id *)(a1 + 32), "workflow");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "name");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v40 = 138543618;
    *(_QWORD *)&v40[4] = v39;
    *(_WORD *)&v40[12] = 2082;
    *(_QWORD *)&v40[14] = v4;
    _os_log_impl(&dword_24A5B4000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: saved tailspin file %{public}s for slow workflow, notifying spindump", v40, 0x16u);

  }
  *__error() = v31;
  SPReportWorkflowResponsivenessDelay();
  return +[WRWorkflowEventTracker cleanupWorkflowResponsivenessDiagnosticsDirectory](WRWorkflowEventTracker, "cleanupWorkflowResponsivenessDiagnosticsDirectory");
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)stats
{
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;
  char *v9;
  int v10;
  int v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  uint64_t v34;
  unint64_t *v35;
  void *v36;
  int v37;
  unint64_t *v38;
  unint64_t *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t var2;
  void *v45;
  unint64_t v46;
  unint64_t v47;
  void *v48;
  void *v49;
  int v50;
  NSObject *v51;
  _BOOL4 v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  unint64_t *v57;
  void *v58;
  int v59;
  unint64_t *v60;
  unint64_t *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  _QWORD *v67;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *v68;
  void *v69;
  void *v70;
  int v71;
  NSObject *v72;
  _BOOL4 v73;
  void *v74;
  void *v75;
  void *v76;
  unint64_t v77;
  int *v78;
  unsigned int v79;
  unint64_t v80;
  unint64_t v81;
  unsigned int v82;
  char *v83;
  uint64_t v84;
  unint64_t v85;
  char *v86;
  unint64_t v87;
  char *v88;
  unint64_t *v89;
  unint64_t v90;
  unint64_t v91;
  size_t v92;
  char *v93;
  char *v94;
  char *v95;
  uint64_t v96;
  _QWORD *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  int v103;
  NSObject *v104;
  _BOOL4 v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  unint64_t v111;
  uint64_t v112;
  void *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  id obj;
  uint64_t v123;
  uint64_t v124;
  int v125;
  uint64_t v126;
  int v127;
  WRWorkflowEventTracker *v129;
  char *__ptr;
  void *__ptra;
  void *__ptrb;
  char *v133;
  char *v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  void *v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  uint64_t v144;
  void *v145;
  uint64_t v146;
  void *v147;
  uint64_t v148;
  void *v149;
  uint8_t buf[4];
  void *v151;
  __int16 v152;
  uint64_t v153;
  __int16 v154;
  unint64_t v155;
  __int16 v156;
  unint64_t v157;
  __int16 v158;
  unint64_t v159;
  __int16 v160;
  unint64_t v161;
  _BYTE v162[128];
  uint64_t v163;

  v163 = *MEMORY[0x24BDAC8D0];
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  v148 = 0;
  v149 = 0;
  v146 = 0;
  v147 = 0;
  v144 = 0;
  v145 = 0;
  -[WRWorkflowEventTracker eventStart](self, "eventStart");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "machContTimeNs");

  v129 = self;
  -[WRWorkflowEventTracker eventEnd](self, "eventEnd");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "machContTimeNs");

  if (!v5 || !v7 || v7 <= v5)
    return result;
  v111 = v7 - v5;
  v142 = 0u;
  v143 = 0u;
  v140 = 0u;
  v141 = 0u;
  -[WRWorkflowEventTracker allSignpostTrackers](self, "allSignpostTrackers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v124 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v140, v162, 16);
  if (!v124)
  {
    LOBYTE(v11) = 0;
    goto LABEL_56;
  }
  v133 = 0;
  v134 = 0;
  v9 = 0;
  v136 = 0;
  v10 = 0;
  v11 = 0;
  v123 = *(_QWORD *)v141;
  do
  {
    for (i = 0; i != v124; ++i)
    {
      if (*(_QWORD *)v141 != v123)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * i);
      objc_msgSend(v13, "signpost");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "networkBound");

      objc_msgSend(v13, "intervals");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v139, "count");
      v135 = v13;
      objc_msgSend(v13, "incompleteIntervalStarts");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      v137 = objc_msgSend(v138, "count");
      if (!(v16 + v137))
        goto LABEL_52;
      v127 = v11;
      v126 = i;
      v125 = v15;
      if (v16)
      {
        __ptr = v9;
        v17 = 0;
        while (1)
        {
          v18 = v16;
          objc_msgSend(v139, "objectAtIndexedSubscript:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "start");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "machContTimeNs");

          if (v21 <= v5)
            v22 = v5;
          else
            v22 = v21;
          objc_msgSend(v139, "objectAtIndexedSubscript:", v17);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "end");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "machContTimeNs");

          if (v25 >= v7)
            v26 = v7;
          else
            v26 = v25;
          if (v26 >= v22)
          {
            __ptr = (char *)reallocf(__ptr, 16 * (v10 + 1));
            v35 = (unint64_t *)&__ptr[16 * v10];
            *v35 = v22;
            v35[1] = v26;
            objc_msgSend(v135, "signpost");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "networkBound");

            if (v37)
            {
              v134 = (char *)reallocf(v134, 16 * (HIDWORD(v136) + 1));
              v38 = (unint64_t *)&v134[16 * HIDWORD(v136)];
              *v38 = v22;
              v38[1] = v26;
              ++HIDWORD(v136);
            }
            else
            {
              v133 = (char *)reallocf(v133, 16 * (v136 + 1));
              v39 = (unint64_t *)&v133[16 * v136];
              *v39 = v22;
              v39[1] = v26;
              LODWORD(v136) = v136 + 1;
            }
            ++v10;
            goto LABEL_28;
          }
          -[WRWorkflowEventTracker workflow](v129, "workflow");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "name");

          -[WRWorkflowEventTracker eventIdentifier](v129, "eventIdentifier");
          -[WRWorkflowEventTracker eventIdentifier](v129, "eventIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v29 = *__error();
          _wrlog();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = os_log_type_enabled(v30, OS_LOG_TYPE_FAULT);
          if (v28)
          {
            if (v31)
            {
              -[WRWorkflowEventTracker workflow](v129, "workflow");
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v120, "name");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[WRWorkflowEventTracker eventIdentifier](v129, "eventIdentifier");
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v139, "objectAtIndexedSubscript:", v17);
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v118, "start");
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              v112 = objc_msgSend(v116, "machContTimeNs");
              objc_msgSend(v139, "objectAtIndexedSubscript:", v17);
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v113, "end");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v33, "machContTimeNs");
              *(_DWORD *)buf = 138544642;
              v151 = v32;
              v152 = 2114;
              v153 = (uint64_t)v114;
              v154 = 2048;
              v155 = v112;
              v156 = 2048;
              v157 = v34;
              v158 = 2048;
              v159 = v5;
              v160 = 2048;
              v161 = v7;
              _os_log_fault_impl(&dword_24A5B4000, v30, OS_LOG_TYPE_FAULT, "%{public}@<%{public}@>: signpost interval %llu-%llu outside event time range %llu-%llu", buf, 0x3Eu);

LABEL_31:
            }
          }
          else if (v31)
          {
            -[WRWorkflowEventTracker workflow](v129, "workflow");
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v120, "name");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v139, "objectAtIndexedSubscript:", v17);
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v119, "start");
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            v115 = objc_msgSend(v117, "machContTimeNs");
            objc_msgSend(v139, "objectAtIndexedSubscript:", v17);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "end");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v41, "machContTimeNs");
            *(_DWORD *)buf = 138544386;
            v151 = v32;
            v152 = 2048;
            v153 = v115;
            v154 = 2048;
            v155 = v42;
            v156 = 2048;
            v157 = v5;
            v158 = 2048;
            v159 = v7;
            _os_log_fault_impl(&dword_24A5B4000, v30, OS_LOG_TYPE_FAULT, "%{public}@: signpost interval %llu-%llu outside event time range %llu-%llu", buf, 0x34u);

            goto LABEL_31;
          }

          *__error() = v29;
LABEL_28:
          ++v17;
          v16 = v18;
          if (v18 == v17)
          {
            v9 = __ptr;
            v149 = __ptr;
            v145 = v133;
            v147 = v134;
            v11 = v127;
            i = v126;
            v15 = v125;
            break;
          }
        }
      }
      LODWORD(v148) = v10;
      LODWORD(v146) = HIDWORD(v136);
      LODWORD(v144) = v136;
      if (!v137)
        goto LABEL_51;
      v43 = 0;
      var2 = retstr->var2;
      do
      {
        objc_msgSend(v138, "objectAtIndexedSubscript:", v43);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "machContTimeNs");

        if (v46 <= v5)
          v47 = v5;
        else
          v47 = v46;
        if (v7 < v47)
        {
          -[WRWorkflowEventTracker workflow](v129, "workflow");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "name");

          -[WRWorkflowEventTracker eventIdentifier](v129, "eventIdentifier");
          -[WRWorkflowEventTracker eventIdentifier](v129, "eventIdentifier");
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          v50 = *__error();
          _wrlog();
          v51 = objc_claimAutoreleasedReturnValue();
          v52 = os_log_type_enabled(v51, OS_LOG_TYPE_FAULT);
          if (v49)
          {
            if (v52)
            {
              -[WRWorkflowEventTracker workflow](v129, "workflow");
              v121 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v121, "name");
              __ptra = (void *)objc_claimAutoreleasedReturnValue();
              -[WRWorkflowEventTracker eventIdentifier](v129, "eventIdentifier");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v138, "objectAtIndexedSubscript:", v43);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = objc_msgSend(v54, "machContTimeNs");
              *(_DWORD *)buf = 138544130;
              v151 = __ptra;
              v152 = 2114;
              v153 = (uint64_t)v53;
              v154 = 2048;
              v155 = v55;
              v156 = 2048;
              v157 = v7;
              _os_log_fault_impl(&dword_24A5B4000, v51, OS_LOG_TYPE_FAULT, "%{public}@<%{public}@>: incomplete interval %llu after event end %llu", buf, 0x2Au);

              v56 = v121;
              goto LABEL_50;
            }
          }
          else if (v52)
          {
            -[WRWorkflowEventTracker workflow](v129, "workflow");
            __ptrb = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(__ptrb, "name");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v138, "objectAtIndexedSubscript:", v43);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = objc_msgSend(v63, "machContTimeNs");
            *(_DWORD *)buf = 138543874;
            v151 = v62;
            v152 = 2048;
            v153 = v64;
            v154 = 2048;
            v155 = v7;
            _os_log_fault_impl(&dword_24A5B4000, v51, OS_LOG_TYPE_FAULT, "%{public}@: incomplete interval %llu after event end %llu", buf, 0x20u);

            v56 = __ptrb;
LABEL_50:

          }
          *__error() = v50;
          goto LABEL_47;
        }
        retstr->var2 = ++var2;
        v9 = (char *)reallocf(v9, 16 * (v10 + 1));
        v57 = (unint64_t *)&v9[16 * v10];
        *v57 = v47;
        v57[1] = v7;
        objc_msgSend(v135, "signpost");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v58, "networkBound");

        if (v59)
        {
          v134 = (char *)reallocf(v134, 16 * (HIDWORD(v136) + 1));
          v60 = (unint64_t *)&v134[16 * HIDWORD(v136)];
          *v60 = v47;
          v60[1] = v7;
          ++HIDWORD(v136);
        }
        else
        {
          v133 = (char *)reallocf(v133, 16 * (v136 + 1));
          v61 = (unint64_t *)&v133[16 * v136];
          *v61 = v47;
          v61[1] = v7;
          LODWORD(v136) = v136 + 1;
        }
        ++v10;
LABEL_47:
        ++v43;
      }
      while (v137 != v43);
      v149 = v9;
      v145 = v133;
      v147 = v134;
      v11 = v127;
      i = v126;
      v15 = v125;
LABEL_51:
      LODWORD(v148) = v10;
      LODWORD(v146) = HIDWORD(v136);
      LODWORD(v144) = v136;
LABEL_52:
      v11 |= v15;

    }
    v124 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v140, v162, 16);
  }
  while (v124);
LABEL_56:

  WRRangesSortAndCoalesce((unsigned int *)&v148);
  v65 = v148;
  v66 = 0;
  if (!(_DWORD)v148)
  {
    v68 = retstr;
LABEL_64:
    v77 = v111 - (_QWORD)v66;
    goto LABEL_67;
  }
  v67 = (char *)v149 + 8;
  v68 = retstr;
  do
  {
    v66 = &v66[*v67 - *(v67 - 1)];
    v67 += 2;
    --v65;
  }
  while (v65);
  if ((unint64_t)v66 <= v111)
    goto LABEL_64;
  -[WRWorkflowEventTracker workflow](v129, "workflow");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "name");

  -[WRWorkflowEventTracker eventIdentifier](v129, "eventIdentifier");
  -[WRWorkflowEventTracker eventIdentifier](v129, "eventIdentifier");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  v71 = *__error();
  _wrlog();
  v72 = objc_claimAutoreleasedReturnValue();
  v73 = os_log_type_enabled(v72, OS_LOG_TYPE_FAULT);
  if (v70)
  {
    if (v73)
    {
      -[WRWorkflowEventTracker workflow](v129, "workflow");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "name");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[WRWorkflowEventTracker eventIdentifier](v129, "eventIdentifier");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v151 = v75;
      v152 = 2114;
      v153 = (uint64_t)v76;
      v154 = 2048;
      v155 = (unint64_t)v66;
      v156 = 2048;
      v157 = v111;
      _os_log_fault_impl(&dword_24A5B4000, v72, OS_LOG_TYPE_FAULT, "%{public}@<%{public}@>: union of all signposts duration %llu > workflow event duration %llu", buf, 0x2Au);

      goto LABEL_103;
    }
  }
  else if (v73)
  {
    -[WRWorkflowEventTracker workflow](v129, "workflow");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "name");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v151 = v75;
    v152 = 2048;
    v153 = (uint64_t)v66;
    v154 = 2048;
    v155 = v111;
    _os_log_fault_impl(&dword_24A5B4000, v72, OS_LOG_TYPE_FAULT, "%{public}@: union of all signposts duration %llu > workflow event duration %llu", buf, 0x20u);
LABEL_103:

    v68 = retstr;
  }

  v78 = __error();
  v77 = 0;
  *v78 = v71;
LABEL_67:
  v68->var0 = v77;
  LODWORD(v148) = 0;
  free(v149);
  v149 = 0;
  if ((v11 & 1) != 0)
  {
    WRRangesSortAndCoalesce((unsigned int *)&v146);
    WRRangesSortAndCoalesce((unsigned int *)&v144);
    v79 = v146;
    if (!(_DWORD)v146)
      goto LABEL_91;
    v80 = v144;
    if (!(_DWORD)v144)
      goto LABEL_87;
    v81 = 0;
    v82 = 0;
    do
    {
      if (v81 < v80)
      {
        v83 = (char *)v147;
        v84 = 16 * v81;
        do
        {
          v85 = *(_QWORD *)((char *)v145 + v84 + 8);
          v86 = &v83[16 * v82];
          if (v85 > *(_QWORD *)v86)
          {
            v87 = *(_QWORD *)((char *)v145 + v84);
            v88 = &v83[16 * v82];
            v91 = *((_QWORD *)v88 + 1);
            v89 = (unint64_t *)(v88 + 8);
            v90 = v91;
            if (v87 >= v91)
              break;
            if (*(_QWORD *)v86 >= v87)
            {
              if (v85 >= v90)
                *(_QWORD *)v86 = v90;
              else
                *(_QWORD *)v86 = v85;
            }
            else
            {
              *v89 = v87;
              if (v85 < v90)
              {
                v92 = v146 + ~v82;
                LODWORD(v146) = v146 + 1;
                v93 = (char *)reallocf(v83, 16 * v146);
                v83 = v93;
                v147 = v93;
                if ((_DWORD)v92)
                  memmove(&v93[16 * v82 + 32], &v93[16 * v82 + 16], v92);
                v94 = &v83[16 * ++v82];
                *(_QWORD *)v94 = v85;
                *((_QWORD *)v94 + 1) = v90;
                v80 = v144;
              }
            }
          }
          ++v81;
          v84 += 16;
        }
        while (v81 < v80);
        v81 = v81;
        v79 = v146;
      }
      ++v82;
    }
    while (v82 < v79);
    WRRangesSortAndCoalesce((unsigned int *)&v146);
    v79 = v146;
    v68 = retstr;
    if ((_DWORD)v146)
    {
LABEL_87:
      v95 = 0;
      v96 = v79;
      v97 = (char *)v147 + 8;
      do
      {
        v95 = &v95[*v97 - *(v97 - 1)];
        v97 += 2;
        --v96;
      }
      while (v96);
    }
    else
    {
LABEL_91:
      v95 = 0;
    }
    if (v111 <= (unint64_t)v95)
    {
      -[WRWorkflowEventTracker workflow](v129, "workflow");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "name");

      -[WRWorkflowEventTracker eventIdentifier](v129, "eventIdentifier");
      -[WRWorkflowEventTracker eventIdentifier](v129, "eventIdentifier");
      v102 = (void *)objc_claimAutoreleasedReturnValue();

      v103 = *__error();
      _wrlog();
      v104 = objc_claimAutoreleasedReturnValue();
      v105 = os_log_type_enabled(v104, OS_LOG_TYPE_FAULT);
      if (v102)
      {
        if (v105)
        {
          -[WRWorkflowEventTracker workflow](v129, "workflow");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "name");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          -[WRWorkflowEventTracker eventIdentifier](v129, "eventIdentifier");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v151 = v107;
          v152 = 2114;
          v153 = (uint64_t)v108;
          v154 = 2048;
          v155 = (unint64_t)v95;
          v156 = 2048;
          v157 = v111;
          _os_log_fault_impl(&dword_24A5B4000, v104, OS_LOG_TYPE_FAULT, "%{public}@<%{public}@>: network-bound duration %llu > workflow event duration %llu", buf, 0x2Au);

        }
      }
      else if (v105)
      {
        -[WRWorkflowEventTracker workflow](v129, "workflow");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "name");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v151 = v110;
        v152 = 2048;
        v153 = (uint64_t)v95;
        v154 = 2048;
        v155 = v111;
        _os_log_fault_impl(&dword_24A5B4000, v104, OS_LOG_TYPE_FAULT, "%{public}@: network-bound duration %llu > workflow event duration %llu", buf, 0x20u);

      }
      *__error() = v103;
    }
    else
    {
      v68->var1 = v111 - (_QWORD)v95;
    }
  }
  else
  {
    -[WRWorkflowEventTracker eventEnd](v129, "eventEnd");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = objc_msgSend(v98, "machContTimeNs");
    -[WRWorkflowEventTracker eventStart](v129, "eventStart");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v68->var1 = v99 - objc_msgSend(v100, "machContTimeNs");

  }
  free(v145);
  free(v147);
  return result;
}

- (void)generateTelemetry
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_23();
  objc_msgSend(v1, "workflow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11(), "eventIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_24A5B4000, v4, v5, "%{public}@<%{public}@>: Trying to report workflow without an end time", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0();
}

- (void)reportCoreAnalyticsEventForSignpost:(void *)a3 allCount:(void *)a4 allDurationUnionSec:(void *)a5 allDurationSumSec:(void *)a6 allDurationLongestSec:(void *)a7 allDurationUntrackedSec:(void *)a8 allDurationNonNetworkBoundSec:(void *)a9 allTimeUntilFirstSignpost:(void *)a10 allTimeAfterLastSignpost:(void *)a11 incompleteCount:(void *)a12 completeDurationUnionSec:(void *)a13 completeDurationSumSec:(void *)a14 completeDurationLongestSec:(void *)a15 completeTimeUntilFirstSignpost:(void *)a16 environment:
{
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  NSObject *v37;
  _BOOL4 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __CFString *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  _QWORD v69[4];
  id v70;
  id v71;
  void *v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  char v77;

  v68 = a2;
  v23 = a3;
  v66 = a4;
  v65 = a5;
  v64 = a6;
  v63 = a7;
  v62 = a8;
  v61 = a9;
  v24 = v23;
  v60 = a10;
  v59 = a11;
  v58 = a12;
  v57 = a13;
  v56 = a14;
  v55 = a15;
  v67 = a16;
  if (a1)
  {
    v25 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(a1, "workflow");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "name");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    WRSanitizeForCA(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v68)
    {
      WRSanitizeForCA(v68);
      v29 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = 0;
    }
    objc_msgSend(a1, "error");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v28, CFSTR("workflowName"));
    if (v30)
    {
      objc_msgSend(v30, "domain");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("WorkflowResponsivenessError"));

      if (v32)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v30, "code"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v33, CFSTR("error"));

      }
      else
      {
        objc_msgSend(a1, "workflow");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "name");

        objc_msgSend(a1, "eventIdentifier");
        objc_msgSend(a1, "eventIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        v36 = *__error();
        _wrlog();
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = os_log_type_enabled(v37, OS_LOG_TYPE_FAULT);
        if (v35)
        {
          if (v38)
            -[WRWorkflowEventTracker reportCoreAnalyticsEventForSignpost:allCount:allDurationUnionSec:allDurationSumSec:allDurationLongestSec:allDurationUntrackedSec:allDurationNonNetworkBoundSec:allTimeUntilFirstSignpost:allTimeAfterLastSignpost:incompleteCount:completeDurationUnionSec:completeDurationSumSec:completeDurationLongestSec:completeTimeUntilFirstSignpost:environment:].cold.2((uint64_t)a1, (uint64_t)v30, (uint64_t)v37, v39, v40, v41, v42, v43, v51, v52, v53, (uint64_t)v55, (uint64_t)v56, (uint64_t)v57, (uint64_t)v58, (uint64_t)v59, (uint64_t)v60, (uint64_t)v61, (uint64_t)v62,
              (uint64_t)v63,
              (uint64_t)v64,
              (uint64_t)v65);
        }
        else if (v38)
        {
          -[WRWorkflowEventTracker reportCoreAnalyticsEventForSignpost:allCount:allDurationUnionSec:allDurationSumSec:allDurationLongestSec:allDurationUntrackedSec:allDurationNonNetworkBoundSec:allTimeUntilFirstSignpost:allTimeAfterLastSignpost:incompleteCount:completeDurationUnionSec:completeDurationSumSec:completeDurationLongestSec:completeTimeUntilFirstSignpost:environment:].cold.1(a1, v30, v37);
        }

        *__error() = v36;
        objc_msgSend(v25, "setObject:forKeyedSubscript:", &unk_251BE8BA8, CFSTR("error"));
      }
    }
    v54 = (void *)v29;
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v29, CFSTR("signpostName"));
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, CFSTR("occurrencesCount"));
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v61, CFSTR("delaySec"));
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v60, CFSTR("delayAfterSec"));
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v65, CFSTR("durationSec"));
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v66, CFSTR("durationUnionSec"));
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v64, CFSTR("durationLongestSec"));
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v63, CFSTR("durationUntrackedSec"));
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v62, CFSTR("durationNonNetworkBoundSec"));
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v59, CFSTR("incompleteOccurrencesCount"));
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v55, CFSTR("completeDelaySec"));
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v57, CFSTR("completeDurationSec"));
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v58, CFSTR("completeDurationUnionSec"));
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v56, CFSTR("completeDurationLongestSec"));
    if (v30)
    {
      objc_msgSend(CFSTR("com.apple.workflow-responsiveness"), "stringByAppendingString:", CFSTR("-error"));
      v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v44 = CFSTR("com.apple.workflow-responsiveness");
    }
    -[__CFString stringByAppendingString:](v44, "stringByAppendingString:", CFSTR("-generic"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = a1;
    -[WRWorkflowEventTracker submitCAEventName:dict:forSignpost:](a1, v45, v25, v68);
    v74 = 0;
    v75 = &v74;
    v76 = 0x2020000000;
    v77 = 0;
    if (v67)
    {
      v69[0] = MEMORY[0x24BDAC760];
      v69[1] = 3221225472;
      v69[2] = __370__WRWorkflowEventTracker_reportCoreAnalyticsEventForSignpost_allCount_allDurationUnionSec_allDurationSumSec_allDurationLongestSec_allDurationUntrackedSec_allDurationNonNetworkBoundSec_allTimeUntilFirstSignpost_allTimeAfterLastSignpost_incompleteCount_completeDurationUnionSec_completeDurationSumSec_completeDurationLongestSec_completeTimeUntilFirstSignpost_environment___block_invoke;
      v69[3] = &unk_251BE4780;
      v73 = &v74;
      v47 = v25;
      v70 = v47;
      v48 = v68;
      v71 = v48;
      v72 = v46;
      objc_msgSend(v67, "enumerateKeysAndObjectsUsingBlock:", v69);

      if (*((_BYTE *)v75 + 24))
      {
        if (v29)
        {
          v49 = v28;
          -[__CFString stringByAppendingFormat:](v44, "stringByAppendingFormat:", CFSTR("-%@-%@"), v28, v54);
        }
        else
        {
          v49 = v28;
          -[__CFString stringByAppendingFormat:](v44, "stringByAppendingFormat:", CFSTR("-%@"), v28);
        }
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[WRWorkflowEventTracker submitCAEventName:dict:forSignpost:](v46, v50, v47, v48);

        v28 = v49;
      }
    }
    _Block_object_dispose(&v74, 8);

  }
}

void __43__WRWorkflowEventTracker_generateTelemetry__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v3 = a2;
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "statsWithEventEndNs:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "signpost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");

  v7 = *(void **)(a1 + 32);
  v6 = (id *)(a1 + 32);
  objc_msgSend(v7, "workflow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");

  objc_msgSend(*v6, "eventIdentifier");
  objc_msgSend(*v6, "eventIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *__error();
  _wrlog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (v12)
      __43__WRWorkflowEventTracker_generateTelemetry__block_invoke_cold_2((uint64_t)v6, (uint64_t)v4, (uint64_t)v11, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28,
        v29,
        v30);
  }
  else if (v12)
  {
    __43__WRWorkflowEventTracker_generateTelemetry__block_invoke_cold_1(v6, (uint64_t)v4, v11);
  }

  *__error() = v10;
}

- (void)submitCAEventName:(void *)a3 dict:(void *)a4 forSignpost:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  void *v21;
  void *v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  int v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    objc_msgSend(a1, "workflow");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");

    objc_msgSend(a1, "eventIdentifier");
    objc_msgSend(a1, "eventIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *__error();
    _wrlog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
    if (v9)
    {
      if (v11)
      {
        if (v14)
        {
          objc_msgSend(a1, "workflow");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "eventIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 138544386;
          v27 = v16;
          v28 = 2114;
          v29 = v17;
          v30 = 2114;
          v31 = v9;
          v32 = 2112;
          v33 = v7;
          v34 = 2112;
          v35 = v8;
          v18 = "%{public}@<%{public}@>: %{public}@: Logging %@ to CA: %@";
          v19 = v13;
          v20 = 52;
LABEL_9:
          _os_log_debug_impl(&dword_24A5B4000, v19, OS_LOG_TYPE_DEBUG, v18, (uint8_t *)&v26, v20);

          goto LABEL_13;
        }
        goto LABEL_13;
      }
      if (!v14)
        goto LABEL_13;
      objc_msgSend(a1, "workflow");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138544130;
      v27 = v22;
      v28 = 2114;
      v29 = v9;
      v30 = 2112;
      v31 = v7;
      v32 = 2112;
      v33 = v8;
      v23 = "%{public}@: %{public}@: Logging %@ to CA: %@";
      v24 = v13;
      v25 = 42;
    }
    else
    {
      if (v11)
      {
        if (v14)
        {
          objc_msgSend(a1, "workflow");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "eventIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 138544130;
          v27 = v16;
          v28 = 2114;
          v29 = v17;
          v30 = 2112;
          v31 = v7;
          v32 = 2112;
          v33 = v8;
          v18 = "%{public}@<%{public}@>: Logging %@ to CA: %@";
          v19 = v13;
          v20 = 42;
          goto LABEL_9;
        }
LABEL_13:

        *__error() = v12;
        AnalyticsSendEvent();
        goto LABEL_14;
      }
      if (!v14)
        goto LABEL_13;
      objc_msgSend(a1, "workflow");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543874;
      v27 = v22;
      v28 = 2112;
      v29 = v7;
      v30 = 2112;
      v31 = v8;
      v23 = "%{public}@: Logging %@ to CA: %@";
      v24 = v13;
      v25 = 32;
    }
    _os_log_debug_impl(&dword_24A5B4000, v24, OS_LOG_TYPE_DEBUG, v23, (uint8_t *)&v26, v25);

    goto LABEL_13;
  }
LABEL_14:

}

void __370__WRWorkflowEventTracker_reportCoreAnalyticsEventForSignpost_allCount_allDurationUnionSec_allDurationSumSec_allDurationLongestSec_allDurationUntrackedSec_allDurationNonNetworkBoundSec_allTimeUntilFirstSignpost_allTimeAfterLastSignpost_incompleteCount_completeDurationUnionSec_completeDurationSumSec_completeDurationLongestSec_completeTimeUntilFirstSignpost_environment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v7 = objc_alloc(MEMORY[0x24BDD17C8]);
    WRSanitizeForCA(v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("env_%@"), v8);

    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v9);
LABEL_9:

      goto LABEL_10;
    }
    objc_msgSend(*(id *)(a1 + 48), "workflow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");

    objc_msgSend(*(id *)(a1 + 48), "eventIdentifier");
    objc_msgSend(*(id *)(a1 + 48), "eventIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = *__error();
    _wrlog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (v12)
    {
      if (v15)
      {
        objc_msgSend(*(id *)(a1 + 48), "workflow");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "eventIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138544386;
        v22 = v17;
        v23 = 2114;
        v24 = v18;
        v25 = 2114;
        v26 = v19;
        v27 = 2114;
        v28 = v5;
        v29 = 2112;
        v30 = v6;
        _os_log_error_impl(&dword_24A5B4000, v14, OS_LOG_TYPE_ERROR, "%{public}@<%{public}@>: %{public}@: Cannot log telemetry for %{public}@ -> %@, conflicts with existing entry", buf, 0x34u);

LABEL_12:
      }
    }
    else if (v15)
    {
      objc_msgSend(*(id *)(a1 + 48), "workflow");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      v22 = v17;
      v23 = 2114;
      v24 = v20;
      v25 = 2114;
      v26 = v5;
      v27 = 2112;
      v28 = v6;
      _os_log_error_impl(&dword_24A5B4000, v14, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: Cannot log telemetry for %{public}@ -> %@, conflicts with existing entry", buf, 0x2Au);
      goto LABEL_12;
    }

    *__error() = v13;
    goto LABEL_9;
  }
LABEL_10:

}

+ (uint64_t)isReservedWorkflowName:(uint64_t)a1
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_self();
  v3 = objc_msgSend(&unk_251BE8B60, "containsObject:", v2);

  return v3;
}

+ (uint64_t)isReservedSignpostName:(uint64_t)a1
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_self();
  v3 = objc_msgSend(&unk_251BE8B78, "containsObject:", v2);

  return v3;
}

- (WRWorkflowEventTracker)initWithWorkflow:(id)a3 eventCompletionCallback:(id)a4
{
  id v6;
  id v7;
  WRWorkflowEventTracker *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __67__WRWorkflowEventTracker_initWithWorkflow_eventCompletionCallback___block_invoke;
  v10[3] = &unk_251BE47A8;
  v11 = v6;
  v7 = v6;
  v8 = -[WRWorkflowEventTracker initForReadbackWithWorkflow:eventCompletionCallback:](self, "initForReadbackWithWorkflow:eventCompletionCallback:", a3, v10);

  return v8;
}

void __67__WRWorkflowEventTracker_initWithWorkflow_eventCompletionCallback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "eventStart");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventEnd");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startSignpost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endSignpost");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, void *, void *, void *))(v2 + 16))(v2, v3, v7, v4, v5, v6);

}

- (WRWorkflow)workflow
{
  return (WRWorkflow *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)eventIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (WRTimestampAndThread)eventStart
{
  return (WRTimestampAndThread *)objc_getProperty(self, a2, 24, 1);
}

- (WRSignpost)startSignpost
{
  return (WRSignpost *)objc_getProperty(self, a2, 32, 1);
}

- (WRTimestampAndThread)eventEnd
{
  return (WRTimestampAndThread *)objc_getProperty(self, a2, 40, 1);
}

- (WRSignpost)endSignpost
{
  return (WRSignpost *)objc_getProperty(self, a2, 48, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 56, 1);
}

- (unint64_t)numHandledSignposts
{
  return self->_numHandledSignposts;
}

- (unint64_t)numOutsideSignposts
{
  return self->_numOutsideSignposts;
}

- (unint64_t)numUnhandledSignposts
{
  return self->_numUnhandledSignposts;
}

- (NSMutableDictionary)nonPublicFields
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setNonPublicFields:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void)setTimeoutQueue:(void *)a1
{
  if (a1)
    objc_setProperty_atomic(a1, newValue, newValue, 112);
}

- (void)setCandidateEndSignpostTrackers:(void *)a1
{
  if (a1)
    objc_setProperty_atomic(a1, newValue, newValue, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateEndSignpostTrackers, 0);
  objc_storeStrong(&self->_eventCompletionCallback, 0);
  objc_storeStrong((id *)&self->_openIndividuatedIntervalsWithFieldNameMatchingAnEndSignpostFromBeforeEventStart, 0);
  objc_storeStrong((id *)&self->_timeoutSource, 0);
  objc_storeStrong((id *)&self->_timeoutQueue, 0);
  objc_storeStrong((id *)&self->_concurrentEvents, 0);
  objc_storeStrong((id *)&self->_allSignpostTrackersMutable, 0);
  objc_storeStrong((id *)&self->_nonPublicFields, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_endSignpost, 0);
  objc_storeStrong((id *)&self->_eventEnd, 0);
  objc_storeStrong((id *)&self->_startSignpost, 0);
  objc_storeStrong((id *)&self->_eventStart, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
}

- (void)reportErrorsAndResetAtMachContNs:(void *)a1 date:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "workflow");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_21(&dword_24A5B4000, v3, v4, "%{public}@: reset in middle of event, reporting error", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0();
}

- (void)reportErrorsAndResetAtMachContNs:date:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_23();
  objc_msgSend(v1, "workflow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11(), "eventIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_24A5B4000, v4, v5, "%{public}@<%{public}@>: reset in middle of event, reporting error", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0();
}

- (void)valueForFieldName:inSignpostObject:.cold.1()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_8();
  objc_msgSend(v0, "workflow");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_24A5B4000, v3, v4, "%{public}@: Unknown signpost object type %{public}s", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_0();
}

- (void)valueForFieldName:(uint64_t)a3 inSignpostObject:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;

  OUTLINED_FUNCTION_10();
  a21 = v24;
  a22 = v25;
  OUTLINED_FUNCTION_18();
  a14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v26, "workflow");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "name");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_30(), "eventIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_9(&dword_24A5B4000, v22, v29, "%{public}@<%{public}@>: Unknown signpost object type %{public}s", &a9);

  OUTLINED_FUNCTION_1();
}

- (void)applySignpost:toSignpostTracker:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_8();
  objc_msgSend(v1, "workflow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11(), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_24A5B4000, v4, v5, "%{public}@: %{public}@: Handling synthetic event as SignpostEvent, not SignpostInterval", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0();
}

- (void)applySignpost:(uint64_t)a3 toSignpostTracker:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;

  OUTLINED_FUNCTION_10();
  a20 = v24;
  a21 = v25;
  OUTLINED_FUNCTION_19();
  a13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v26, "workflow");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "name");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_37(), "eventIdentifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_42(), "name");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a9) = 138543874;
  *(_QWORD *)((char *)&a9 + 4) = v23;
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_9(&dword_24A5B4000, v21, v29, "%{public}@<%{public}@>: %{public}@: Handling synthetic event as SignpostEvent, not SignpostInterval", (uint8_t *)&a9);

  OUTLINED_FUNCTION_1();
}

- (void)handleSignpost:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_8();
  objc_msgSend(v1, "workflow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11(), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_24A5B4000, v4, v5, "%{public}@: %{public}@: Unable to get event identifier for start signpost, throwing out all current events in case they were incomplete events", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0();
}

- (void)handleSignpost:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_8();
  objc_msgSend(v1, "workflow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11(), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_24A5B4000, v4, v5, "%{public}@: %{public}@: Unable to get event identifier, ignoring signpost", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0();
}

- (void)handleSignpost:(void *)a1 .cold.4(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "workflow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_34(&dword_24A5B4000, a2, v5, "%{public}@: concurrent workflow done", v6);

  OUTLINED_FUNCTION_0();
}

- (void)handleSignpost:.cold.5()
{
  NSObject *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  OUTLINED_FUNCTION_8();
  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v2, "workflow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11(), "eventIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_35(&dword_24A5B4000, v0, v5, "%{public}@<%{public}@>: concurrent workflow done", v6);

  OUTLINED_FUNCTION_0();
}

- (void)handleSignpost:(uint64_t)a3 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;

  OUTLINED_FUNCTION_10();
  a20 = v24;
  a21 = v25;
  OUTLINED_FUNCTION_8();
  a13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v26, "workflow");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "name");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11(), "name");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_40();
  LODWORD(a9) = 138543874;
  *(_QWORD *)((char *)&a9 + 4) = v22;
  WORD6(a9) = 2114;
  *(_QWORD *)((char *)&a9 + 14) = v23;
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_36(&dword_24A5B4000, v21, v28, "%{public}@: %{public}@: outside any workflow event (%llu)", (uint8_t *)&a9);

  OUTLINED_FUNCTION_1();
}

- (void)handleSignpost:(_QWORD *)a3 .cold.8(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;
  void *v8;

  objc_msgSend(a2, "workflow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a3 = v8;
  _os_log_debug_impl(&dword_24A5B4000, a4, OS_LOG_TYPE_DEBUG, "%{public}@: concurrent workflow done", a1, 0xCu);

}

- (void)handleSignpost:(NSObject *)a3 wrsignpost:.cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "workflow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543618;
  v10 = v6;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_24A5B4000, a3, v8, "%{public}@: %{public}@: No missing end signposts, but didn't find an end signpost tracker", (uint8_t *)&v9);

  OUTLINED_FUNCTION_0();
}

- (void)handleSignpost:(uint64_t)a3 wrsignpost:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;

  OUTLINED_FUNCTION_10();
  a20 = v21;
  a21 = v22;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  a13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v27, "workflow");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "name");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "eventIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "name");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a9) = 138543874;
  *(_QWORD *)((char *)&a9 + 4) = v30;
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_9(&dword_24A5B4000, v24, v33, "%{public}@<%{public}@>: %{public}@: No missing end signposts, but didn't find an end signpost tracker", (uint8_t *)&a9);

  OUTLINED_FUNCTION_1();
}

- (void)handleSignpost:(NSObject *)a3 wrsignpost:.cold.3(void *a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  int v13[5];
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "workflow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(a2, "startMachContinuousTime");
  objc_msgSend(a2, "startNanoseconds");
  objc_msgSend(a1, "eventStart");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "machContTimeNs");
  v13[0] = 138544130;
  OUTLINED_FUNCTION_41();
  v14 = 2048;
  v15 = v9;
  v16 = 2048;
  v17 = v11 / v12;
  _os_log_error_impl(&dword_24A5B4000, a3, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: event start @%llu (%+.3fs in previous event)", (uint8_t *)v13, 0x2Au);

  OUTLINED_FUNCTION_26();
}

- (void)handleSignpost:(NSObject *)a3 wrsignpost:.cold.4(void *a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "workflow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "eventIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a2, "startMachContinuousTime");
  v11 = objc_msgSend(a2, "startNanoseconds");
  objc_msgSend(a1, "eventStart");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 138544386;
  v14 = v7;
  v15 = 2114;
  v16 = v8;
  v17 = 2114;
  v18 = v9;
  v19 = 2048;
  v20 = v10;
  v21 = 2048;
  v22 = ((double)v11 - (double)(unint64_t)objc_msgSend(v12, "machContTimeNs")) / 1000000000.0;
  _os_log_error_impl(&dword_24A5B4000, a3, OS_LOG_TYPE_ERROR, "%{public}@<%{public}@>: %{public}@: event start @%llu (%+.3fs in previous event)", (uint8_t *)&v13, 0x34u);

  OUTLINED_FUNCTION_26();
}

void __47__WRWorkflowEventTracker_makeTailspinDirectory__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_16(&dword_24A5B4000, v0, v1, "WR mkdir: Unable to get path from %{public}@", v2);
  OUTLINED_FUNCTION_24();
}

void __47__WRWorkflowEventTracker_makeTailspinDirectory__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_16(&dword_24A5B4000, v0, v1, "WR mkdir: Unable to get path cstr from %{public}@", v2);
  OUTLINED_FUNCTION_24();
}

void __47__WRWorkflowEventTracker_makeTailspinDirectory__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  OUTLINED_FUNCTION_23();
  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *__error();
  v4 = 136446466;
  v5 = v1;
  v6 = 1024;
  v7 = v2;
  OUTLINED_FUNCTION_31(&dword_24A5B4000, v0, v3, "Unable to open dir at %{public}s: %{errno}d", (uint8_t *)&v4);
  OUTLINED_FUNCTION_32();
}

void __47__WRWorkflowEventTracker_makeTailspinDirectory__block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_34(&dword_24A5B4000, v0, v1, "Marked %{public}@ with purgeable children", v2);
  OUTLINED_FUNCTION_24();
}

void __47__WRWorkflowEventTracker_makeTailspinDirectory__block_invoke_cold_5()
{
  int v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_13();
  v3 = 1024;
  v4 = v0;
  OUTLINED_FUNCTION_31(&dword_24A5B4000, v1, (uint64_t)v1, "Failed to mark %{public}@ with purgeable children: %{errno}d", v2);
  OUTLINED_FUNCTION_24();
}

void __47__WRWorkflowEventTracker_makeTailspinDirectory__block_invoke_cold_6()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_13();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_5(&dword_24A5B4000, v1, (uint64_t)v1, "Unable to create folder at %{public}@: %@", v2);
  OUTLINED_FUNCTION_24();
}

void __47__WRWorkflowEventTracker_makeTailspinDirectory__block_invoke_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uid_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_23();
  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = v1;
  v5 = 1024;
  v6 = geteuid();
  OUTLINED_FUNCTION_31(&dword_24A5B4000, v0, v2, "must run as root to create directory %{public}@ (running as %d)", (uint8_t *)&v3);
  OUTLINED_FUNCTION_32();
}

+ (void)cleanupDirectory:ofFilesWithSuffix:olderThan:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_16(&dword_24A5B4000, v0, v1, "WR cleanup: Unable to get path from %{public}@", v2);
  OUTLINED_FUNCTION_24();
}

+ (void)cleanupDirectory:ofFilesWithSuffix:olderThan:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_16(&dword_24A5B4000, v0, v1, "WR cleanup: Unable to create enumerator for %{public}@ to clean up workflow responsiveness directory", v2);
  OUTLINED_FUNCTION_24();
}

+ (void)cleanupDirectory:(os_log_t)log ofFilesWithSuffix:olderThan:.cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_24A5B4000, log, OS_LOG_TYPE_DEBUG, "WR cleanup: No workflow responsiveness directory, no cleanup required", v1, 2u);
}

void __71__WRWorkflowEventTracker_cleanupDirectory_ofFilesWithSuffix_olderThan___block_invoke_cold_1()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_8();
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_24A5B4000, v4, v5, "WR cleanup: Error cleaning up workflow responsiveness directory file %{public}@: %{public}@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_0();
}

- (void)encodedDict
{
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;

  OUTLINED_FUNCTION_10();
  a20 = v23;
  a21 = v24;
  v26 = v25;
  a13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v27, "workflow");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "name");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_42(), "eventIdentifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_30(), "error");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a9) = 138543874;
  *(_QWORD *)((char *)&a9 + 4) = v21;
  WORD6(a9) = 2114;
  *(_QWORD *)((char *)&a9 + 14) = v22;
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9(&dword_24A5B4000, v26, v30, "%{public}@<%{public}@>: Have error with bad domain %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_1();
}

- (void)gatherDiagnosticsIfNeeded
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_23();
  objc_msgSend(v1, "workflow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11(), "eventIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_24A5B4000, v4, v5, "%{public}@<%{public}@>: Have exceeded diagnostic thresholds, but none use tailspin", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0();
}

- (void)gatherDiagnosticsWithTailspin:tailspinIncludeOSLogs:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_8();
  objc_msgSend(v1, "workflow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11(), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_24A5B4000, v4, v5, "%{public}@: Failed to generate tailspin, could not create open-unlinked file URL from %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0();
}

- (void)gatherDiagnosticsWithTailspin:(uint64_t)a3 tailspinIncludeOSLogs:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;

  OUTLINED_FUNCTION_10();
  a20 = v24;
  a21 = v25;
  OUTLINED_FUNCTION_19();
  a13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v26, "workflow");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "name");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_37(), "eventIdentifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_42(), "path");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a9) = 138543874;
  *(_QWORD *)((char *)&a9 + 4) = v23;
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_33(&dword_24A5B4000, v21, v29, "%{public}@<%{public}@>: Failed to generate tailspin, could not create open-unlinked file URL from %{public}@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_1();
}

- (void)gatherDiagnosticsWithTailspin:tailspinIncludeOSLogs:.cold.3()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8();
  objc_msgSend(v0, "workflow");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_4(&dword_24A5B4000, v3, v4, "%{public}@: Unable to get fileSystemRepresentation for %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0();
}

- (void)gatherDiagnosticsWithTailspin:(uint64_t)a3 tailspinIncludeOSLogs:(uint64_t)a4 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;

  OUTLINED_FUNCTION_10();
  a21 = v24;
  a22 = v25;
  OUTLINED_FUNCTION_18();
  a14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v26, "workflow");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "name");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_30(), "eventIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_9(&dword_24A5B4000, v22, v29, "%{public}@<%{public}@>: Unable to get fileSystemRepresentation for %{public}@", &a9);

  OUTLINED_FUNCTION_1();
}

- (void)gatherDiagnosticsWithTailspin:tailspinIncludeOSLogs:.cold.5()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8();
  objc_msgSend(v1, "workflow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_20(&dword_24A5B4000, v3, v4, "%{public}@: Failed to generate tailspin, could not open file %{public}s: %{errno}d", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_25();
}

- (void)gatherDiagnosticsWithTailspin:tailspinIncludeOSLogs:.cold.7()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8();
  objc_msgSend(v1, "workflow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_20(&dword_24A5B4000, v3, v4, "%{public}@: Failed to generate tailspin, could not open-unlink file %{public}s: %{errno}d", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_25();
}

- (void)gatherDiagnosticsWithTailspin:tailspinIncludeOSLogs:.cold.9()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8();
  objc_msgSend(v0, "workflow");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_4(&dword_24A5B4000, v3, v4, "%{public}@: Failed to create encoded string: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0();
}

- (void)gatherDiagnosticsWithTailspin:(uint64_t)a3 tailspinIncludeOSLogs:(uint64_t)a4 .cold.10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;

  OUTLINED_FUNCTION_10();
  a21 = v24;
  a22 = v25;
  OUTLINED_FUNCTION_18();
  a14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v26, "workflow");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "name");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_30(), "eventIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_9(&dword_24A5B4000, v22, v29, "%{public}@<%{public}@>: Failed to create encoded string: %{public}@", &a9);

  OUTLINED_FUNCTION_1();
}

void __78__WRWorkflowEventTracker_gatherDiagnosticsWithTailspin_tailspinIncludeOSLogs___block_invoke_cold_1()
{
  id *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8();
  objc_msgSend(*v0, "workflow");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3(&dword_24A5B4000, v3, v4, "%{public}@: Failed after saving tailspin file: unable to get fileSystemRepresentation for %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0();
}

void __78__WRWorkflowEventTracker_gatherDiagnosticsWithTailspin_tailspinIncludeOSLogs___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, int a10, __int16 a11, __int16 a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  NSObject *v23;
  uint64_t *v24;
  id *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;

  OUTLINED_FUNCTION_10();
  a22 = v26;
  a23 = v27;
  OUTLINED_FUNCTION_18();
  objc_msgSend((id)OUTLINED_FUNCTION_38(v28), "workflow");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "name");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v25, "eventIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = *v24;
  LODWORD(a9) = 138543874;
  *(_QWORD *)((char *)&a9 + 4) = v30;
  WORD6(a9) = 2114;
  *(_QWORD *)((char *)&a9 + 14) = v31;
  a12 = 2114;
  a13 = v32;
  OUTLINED_FUNCTION_33(&dword_24A5B4000, v23, v33, "%{public}@<%{public}@>: Failed after saving tailspin file: unable to get fileSystemRepresentation for %{public}@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_1();
}

void __78__WRWorkflowEventTracker_gatherDiagnosticsWithTailspin_tailspinIncludeOSLogs___block_invoke_cold_3()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8();
  objc_msgSend((id)OUTLINED_FUNCTION_38(v1), "workflow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_20(&dword_24A5B4000, v3, v4, "%{public}@: Failed after saving tailspin file: could not clonefile to %{public}s: %{errno}d", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_25();
}

void __78__WRWorkflowEventTracker_gatherDiagnosticsWithTailspin_tailspinIncludeOSLogs___block_invoke_cold_5()
{
  uint64_t v0;
  id *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_8();
  objc_msgSend(*v1, "workflow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v0 + 40), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_24A5B4000, v5, v6, "%{public}@: Failed to save tailspin to file to %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0();
}

void __78__WRWorkflowEventTracker_gatherDiagnosticsWithTailspin_tailspinIncludeOSLogs___block_invoke_cold_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  NSObject *v21;
  uint64_t v22;
  id *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;

  OUTLINED_FUNCTION_10();
  a20 = v24;
  a21 = v25;
  OUTLINED_FUNCTION_19();
  objc_msgSend((id)OUTLINED_FUNCTION_38(v26), "workflow");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "name");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v23, "eventIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v22 + 40), "path");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a9) = 138543874;
  *(_QWORD *)((char *)&a9 + 4) = v28;
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_33(&dword_24A5B4000, v21, v31, "%{public}@<%{public}@>: Failed to save tailspin to file to %{public}@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_1();
}

- (void)reportCoreAnalyticsEventForSignpost:(NSObject *)a3 allCount:allDurationUnionSec:allDurationSumSec:allDurationLongestSec:allDurationUntrackedSec:allDurationNonNetworkBoundSec:allTimeUntilFirstSignpost:allTimeAfterLastSignpost:incompleteCount:completeDurationUnionSec:completeDurationSumSec:completeDurationLongestSec:completeTimeUntilFirstSignpost:environment:.cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "workflow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543618;
  v10 = v6;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_24A5B4000, a3, v8, "%{public}@: Bad error domain %@", (uint8_t *)&v9);

  OUTLINED_FUNCTION_0();
}

- (void)reportCoreAnalyticsEventForSignpost:(uint64_t)a3 allCount:(uint64_t)a4 allDurationUnionSec:(uint64_t)a5 allDurationSumSec:(uint64_t)a6 allDurationLongestSec:(uint64_t)a7 allDurationUntrackedSec:(uint64_t)a8 allDurationNonNetworkBoundSec:(int)a9 allTimeUntilFirstSignpost:(uint64_t)a10 allTimeAfterLastSignpost:(uint64_t)a11 incompleteCount:(uint64_t)a12 completeDurationUnionSec:(uint64_t)a13 completeDurationSumSec:(uint64_t)a14 completeDurationLongestSec:(uint64_t)a15 completeTimeUntilFirstSignpost:(uint64_t)a16 environment:(uint64_t)a17 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;

  OUTLINED_FUNCTION_10();
  a21 = v22;
  a22 = v23;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  a14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v28, "workflow");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "name");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "eventIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "domain");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  a9 = 138543874;
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9(&dword_24A5B4000, v25, v34, "%{public}@<%{public}@>: Bad error domain %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_1();
}

void __43__WRWorkflowEventTracker_generateTelemetry__block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "workflow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_42(), "signpost");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_35(&dword_24A5B4000, a3, v8, "%{public}@: %{public}@: no signposts for telemetry", v9);

}

void __43__WRWorkflowEventTracker_generateTelemetry__block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  id *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;

  OUTLINED_FUNCTION_10();
  a20 = v21;
  a21 = v22;
  v24 = v23;
  v26 = (id *)v25;
  objc_msgSend((id)OUTLINED_FUNCTION_38(v25), "workflow");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "name");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v26, "eventIdentifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_37(), "signpost");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "name");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a9) = 138543874;
  *(_QWORD *)((char *)&a9 + 4) = v28;
  WORD6(a9) = 2114;
  *(_QWORD *)((char *)&a9 + 14) = v26;
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_36(&dword_24A5B4000, v24, v31, "%{public}@<%{public}@>: %{public}@: no signposts for telemetry", (uint8_t *)&a9);

  OUTLINED_FUNCTION_1();
}

@end
