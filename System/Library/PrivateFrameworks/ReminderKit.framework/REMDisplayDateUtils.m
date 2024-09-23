@implementation REMDisplayDateUtils

+ (id)_displayDateWithDueDateComponents:(id)a3 alarms:(id)a4 hasAlarmDateComponents:(BOOL)a5 floatingDateComponents:(id)a6 nonFloatingDateComponents:(id)a7 displayDateUtils:(id)a8
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  double v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  REMDisplayDate *v43;
  uint64_t v44;
  void *v45;
  void *v47;
  REMDisplayDate *v48;
  id v49;
  id v50;
  id v52;
  void *v53;
  id v54;
  id obj;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v54 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  v52 = a8;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v12;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v61;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v61 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v18);
        if (objc_msgSend(v19, "isOriginal"))
        {
          v20 = objc_opt_class();
          objc_msgSend(v19, "trigger");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          REMDynamicCast(v20, (uint64_t)v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = objc_opt_class();
          objc_msgSend(v19, "trigger");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          REMDynamicCast(v23, (uint64_t)v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            objc_msgSend(v22, "dateComponents");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (v26)
            {
              objc_msgSend(v22, "dateComponents");
              v27 = objc_claimAutoreleasedReturnValue();
              goto LABEL_10;
            }
          }
          if (v25)
          {
            objc_msgSend(v25, "timeInterval");
            if (v54)
            {
              if (v29 != 0.0 && (objc_msgSend(v54, "rem_isAllDayDateComponents") & 1) == 0)
              {
                objc_msgSend(v25, "timeInterval");
                objc_msgSend(v54, "rem_dateComponentsByAddingTimeInterval:");
                v27 = objc_claimAutoreleasedReturnValue();
LABEL_10:
                v28 = (void *)v27;
                objc_msgSend(v53, "addObject:", v27);

              }
            }
          }

        }
        ++v18;
      }
      while (v16 != v18);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
      v16 = v30;
    }
    while (v30);
  }

  if (!a5 && !objc_msgSend(v53, "count"))
  {
    v45 = v54;
    objc_msgSend(v54, "timeZone");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = [REMDisplayDate alloc];
    if (v47)
    {
      v49 = 0;
      v50 = v54;
    }
    else
    {
      v49 = v54;
      v50 = 0;
    }
    v43 = -[REMDisplayDate initWithFloatingDateComponents:nonFloatingDateComponents:](v48, "initWithFloatingDateComponents:nonFloatingDateComponents:", v49, v50);
    v44 = 0;
    goto LABEL_40;
  }
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v31 = v53;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
  if (!v32)
    goto LABEL_39;
  v33 = v32;
  v34 = *(_QWORD *)v57;
  do
  {
    for (i = 0; i != v33; ++i)
    {
      if (*(_QWORD *)v57 != v34)
        objc_enumerationMutation(v31);
      v36 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
      objc_msgSend(v36, "timeZone");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        if (v14)
        {
          v38 = objc_msgSend(v14, "rem_compare:", v36);
          v39 = v14;
          v40 = v36;
          v41 = v13;
          goto LABEL_32;
        }
        v39 = 0;
        v40 = v36;
        v41 = v13;
LABEL_36:
        v42 = v36;

        v14 = v40;
        v13 = v41;
        continue;
      }
      if (!v13)
      {
        v39 = 0;
        v40 = v14;
        v41 = v36;
        goto LABEL_36;
      }
      v38 = objc_msgSend(v13, "rem_compare:", v36);
      v39 = v13;
      v40 = v14;
      v41 = v36;
LABEL_32:
      if (v38 == 1)
        goto LABEL_36;
    }
    v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
  }
  while (v33);
LABEL_39:

  v43 = -[REMDisplayDate initWithFloatingDateComponents:nonFloatingDateComponents:]([REMDisplayDate alloc], "initWithFloatingDateComponents:nonFloatingDateComponents:", v13, v14);
  v44 = 1;
  v45 = v54;
LABEL_40:
  if (v52)
  {
    objc_msgSend(v52, "setIsCacheSet:", 1);
    objc_msgSend(v52, "setDueDateComponents:", v45);
    objc_msgSend(v52, "setFloatingDateComponents:", v13);
    objc_msgSend(v52, "setNonFloatingDateComponents:", v14);
    objc_msgSend(v52, "setHasAlarmDateComponents:", v44);
  }

  return v43;
}

+ (id)displayDateWithDueDateComponents:(id)a3 alarms:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_displayDateWithDueDateComponents:alarms:hasAlarmDateComponents:floatingDateComponents:nonFloatingDateComponents:displayDateUtils:", v6, v5, 0, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)displayDateWithDueDateComponents:(id)a3 alarms:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "_displayDateWithDueDateComponents:alarms:hasAlarmDateComponents:floatingDateComponents:nonFloatingDateComponents:displayDateUtils:", v7, v6, 0, 0, 0, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)updateDisplayDateWithDueDateComponents:(id)a3 alarm:(id)a4 alarmsProviding:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  int v14;
  _BOOL4 v15;
  id WeakRetained;
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[REMDisplayDateUtils dueDateComponents](self, "dueDateComponents");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 == v8)
  {
    v14 = 0;
  }
  else
  {
    -[REMDisplayDateUtils dueDateComponents](self, "dueDateComponents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqual:", v8);

    v14 = v13 ^ 1;
  }

  v15 = -[REMDisplayDateUtils isCacheSet](self, "isCacheSet");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegete);
  v17 = WeakRetained;
  if (!v15 || v14)
  {
    objc_msgSend(WeakRetained, "invokeWithCache:", 0);

    objc_msgSend(v10, "alarms");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMDisplayDateUtils displayDateWithDueDateComponents:alarms:](self, "displayDateWithDueDateComponents:alarms:", v8, v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(WeakRetained, "invokeWithCache:", 1);

    v18 = (void *)objc_opt_class();
    v26[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[REMDisplayDateUtils hasAlarmDateComponents](self, "hasAlarmDateComponents");
    -[REMDisplayDateUtils floatingDateComponents](self, "floatingDateComponents");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMDisplayDateUtils nonFloatingDateComponents](self, "nonFloatingDateComponents");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_displayDateWithDueDateComponents:alarms:hasAlarmDateComponents:floatingDateComponents:nonFloatingDateComponents:displayDateUtils:", v8, v19, v20, v21, v22, self);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v23;
}

- (REMDisplayDateUtilsDelegate)delegete
{
  return (REMDisplayDateUtilsDelegate *)objc_loadWeakRetained((id *)&self->_delegete);
}

- (void)setDelegete:(id)a3
{
  objc_storeWeak((id *)&self->_delegete, a3);
}

- (BOOL)isCacheSet
{
  return self->_isCacheSet;
}

- (void)setIsCacheSet:(BOOL)a3
{
  self->_isCacheSet = a3;
}

- (BOOL)hasAlarmDateComponents
{
  return self->_hasAlarmDateComponents;
}

- (void)setHasAlarmDateComponents:(BOOL)a3
{
  self->_hasAlarmDateComponents = a3;
}

- (NSDateComponents)dueDateComponents
{
  return self->_dueDateComponents;
}

- (void)setDueDateComponents:(id)a3
{
  objc_storeStrong((id *)&self->_dueDateComponents, a3);
}

- (NSDateComponents)floatingDateComponents
{
  return self->_floatingDateComponents;
}

- (void)setFloatingDateComponents:(id)a3
{
  objc_storeStrong((id *)&self->_floatingDateComponents, a3);
}

- (NSDateComponents)nonFloatingDateComponents
{
  return self->_nonFloatingDateComponents;
}

- (void)setNonFloatingDateComponents:(id)a3
{
  objc_storeStrong((id *)&self->_nonFloatingDateComponents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonFloatingDateComponents, 0);
  objc_storeStrong((id *)&self->_floatingDateComponents, 0);
  objc_storeStrong((id *)&self->_dueDateComponents, 0);
  objc_destroyWeak((id *)&self->_delegete);
}

@end
