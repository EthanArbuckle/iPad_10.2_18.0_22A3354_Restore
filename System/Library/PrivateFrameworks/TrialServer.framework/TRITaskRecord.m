@implementation TRITaskRecord

- (TRITaskRecord)initWithTaskId:(id)a3 task:(id)a4 startDate:(id)a5 dependencies:(id)a6 capabilities:(unint64_t)a7 tags:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  TRITaskRecord *v18;
  TRITaskRecord *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v27;
  objc_super v28;

  v14 = a3;
  v15 = a4;
  v27 = a5;
  v16 = a6;
  v17 = a8;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 338, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("taskId != nil"));

    if (v15)
    {
LABEL_3:
      if (v16)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 340, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dependencies != nil"));

      if (v17)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 339, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("task != nil"));

  if (!v16)
    goto LABEL_10;
LABEL_4:
  if (v17)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 341, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tags != nil"));

LABEL_5:
  v28.receiver = self;
  v28.super_class = (Class)TRITaskRecord;
  v18 = -[TRITaskRecord init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_taskId, a3);
    objc_storeStrong((id *)&v19->_task, a4);
    objc_storeStrong((id *)&v19->_startDate, a5);
    objc_storeStrong((id *)&v19->_dependencies, a6);
    v19->_capabilities = a7;
    objc_storeStrong((id *)&v19->_tags, a8);
  }

  return v19;
}

+ (id)taskRecordWithTaskId:(id)a3 task:(id)a4 startDate:(id)a5 dependencies:(id)a6 capabilities:(unint64_t)a7 tags:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTaskId:task:startDate:dependencies:capabilities:tags:", v18, v17, v16, v15, a7, v14);

  return v19;
}

- (id)copyWithReplacementTaskId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTaskId:task:startDate:dependencies:capabilities:tags:", v4, self->_task, self->_startDate, self->_dependencies, self->_capabilities, self->_tags);

  return v5;
}

- (id)copyWithReplacementTask:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTaskId:task:startDate:dependencies:capabilities:tags:", self->_taskId, v4, self->_startDate, self->_dependencies, self->_capabilities, self->_tags);

  return v5;
}

- (id)copyWithReplacementStartDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTaskId:task:startDate:dependencies:capabilities:tags:", self->_taskId, self->_task, v4, self->_dependencies, self->_capabilities, self->_tags);

  return v5;
}

- (id)copyWithReplacementDependencies:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTaskId:task:startDate:dependencies:capabilities:tags:", self->_taskId, self->_task, self->_startDate, v4, self->_capabilities, self->_tags);

  return v5;
}

- (id)copyWithReplacementCapabilities:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTaskId:task:startDate:dependencies:capabilities:tags:", self->_taskId, self->_task, self->_startDate, self->_dependencies, a3, self->_tags);
}

- (id)copyWithReplacementTags:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTaskId:task:startDate:dependencies:capabilities:tags:", self->_taskId, self->_task, self->_startDate, self->_dependencies, self->_capabilities, v4);

  return v5;
}

- (BOOL)isEqualToTaskRecord:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSNumber *taskId;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  TRITask *task;
  void *v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  NSDate *startDate;
  void *v22;
  int v23;
  int v24;
  void *v25;
  int v26;
  NSArray *dependencies;
  void *v28;
  int v29;
  unint64_t capabilities;
  int v31;
  void *v32;
  int v33;
  NSArray *tags;
  void *v35;
  char v36;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_18;
  v6 = self->_taskId != 0;
  objc_msgSend(v4, "taskId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_18;
  taskId = self->_taskId;
  if (taskId)
  {
    objc_msgSend(v5, "taskId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSNumber isEqual:](taskId, "isEqual:", v10);

    if (!v11)
      goto LABEL_18;
  }
  v12 = self->_task != 0;
  objc_msgSend(v5, "task");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
    goto LABEL_18;
  task = self->_task;
  if (task)
  {
    objc_msgSend(v5, "task");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[TRITask isEqual:](task, "isEqual:", v16);

    if (!v17)
      goto LABEL_18;
  }
  v18 = self->_startDate != 0;
  objc_msgSend(v5, "startDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v18 == v20)
    goto LABEL_18;
  startDate = self->_startDate;
  if (startDate)
  {
    objc_msgSend(v5, "startDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[NSDate isEqual:](startDate, "isEqual:", v22);

    if (!v23)
      goto LABEL_18;
  }
  v24 = self->_dependencies != 0;
  objc_msgSend(v5, "dependencies");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25 == 0;

  if (v24 == v26)
    goto LABEL_18;
  dependencies = self->_dependencies;
  if (dependencies)
  {
    objc_msgSend(v5, "dependencies");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[NSArray isEqual:](dependencies, "isEqual:", v28);

    if (!v29)
      goto LABEL_18;
  }
  capabilities = self->_capabilities;
  if (capabilities != objc_msgSend(v5, "capabilities")
    || (v31 = self->_tags != 0,
        objc_msgSend(v5, "tags"),
        v32 = (void *)objc_claimAutoreleasedReturnValue(),
        v33 = v32 == 0,
        v32,
        v31 == v33))
  {
LABEL_18:
    v36 = 0;
  }
  else
  {
    tags = self->_tags;
    if (tags)
    {
      objc_msgSend(v5, "tags");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = -[NSArray isEqual:](tags, "isEqual:", v35);

    }
    else
    {
      v36 = 1;
    }
  }

  return v36;
}

- (BOOL)isEqual:(id)a3
{
  TRITaskRecord *v4;
  TRITaskRecord *v5;
  BOOL v6;

  v4 = (TRITaskRecord *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRITaskRecord isEqualToTaskRecord:](self, "isEqualToTaskRecord:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSArray *tags;
  unint64_t v8;

  v3 = -[NSNumber hash](self->_taskId, "hash");
  v4 = -[TRITask hash](self->_task, "hash") - v3 + 32 * v3;
  v5 = -[NSDate hash](self->_startDate, "hash") - v4 + 32 * v4;
  v6 = -[NSArray hash](self->_dependencies, "hash") - v5 + 32 * v5;
  tags = self->_tags;
  v8 = self->_capabilities - v6 + 32 * v6;
  return -[NSArray hash](tags, "hash") - v8 + 32 * v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRITaskRecord)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  TRITaskRecord *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  objc_class *v37;
  objc_class *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  objc_class *v46;
  objc_class *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  TRITaskRecord *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  const __CFString *v77;
  uint64_t v78;
  const __CFString *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  const __CFString *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  const __CFString *v87;
  uint64_t v88;
  _QWORD v89[3];

  v89[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("taskId"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    v50 = (void *)v5;
    v51 = self;
    v73 = objc_alloc(MEMORY[0x1E0C99E60]);
    v72 = objc_opt_class();
    v71 = objc_opt_class();
    v70 = objc_opt_class();
    v69 = objc_opt_class();
    v68 = objc_opt_class();
    v67 = objc_opt_class();
    v66 = objc_opt_class();
    v65 = objc_opt_class();
    v64 = objc_opt_class();
    v63 = objc_opt_class();
    v62 = objc_opt_class();
    v61 = objc_opt_class();
    v60 = objc_opt_class();
    v59 = objc_opt_class();
    v58 = objc_opt_class();
    v57 = objc_opt_class();
    v56 = objc_opt_class();
    v55 = objc_opt_class();
    v54 = objc_opt_class();
    v53 = objc_opt_class();
    v52 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = v4;
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v49 = v12;
    v4 = v11;
    v17 = (void *)objc_msgSend(v73, "initWithObjects:", v72, v71, v70, v69, v68, v67, v66, v65, v64, v63, v62, v61, v60, v59, v58, v57, v56,
                    v55,
                    v54,
                    v53,
                    v52,
                    v7,
                    v8,
                    v9,
                    v10,
                    v49,
                    v13,
                    v14,
                    v15,
                    v16,
                    objc_opt_class(),
                    0);
    objc_msgSend(v11, "decodeObjectOfClasses:forKey:", v17, CFSTR("task"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      objc_msgSend(v11, "error");
      v27 = (TRITaskRecord *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v18 = 0;
        v27 = 0;
        v6 = v50;
        self = v51;
LABEL_34:

        goto LABEL_35;
      }
      v86 = *MEMORY[0x1E0CB2D50];
      v87 = CFSTR("Retrieved nil serialized value for nonnull TRITaskRecord.task");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRITaskRecordOCNTErrorDomain"), 2, v19);
      objc_msgSend(v4, "failWithError:", v21);
      goto LABEL_31;
    }
    objc_msgSend(v11, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRITaskRecord key \"startDate\" (expected %@, decoded %@)"), v21, v23, 0);
        v84 = *MEMORY[0x1E0CB2D50];
        v85 = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRITaskRecordOCNTErrorDomain"), 3, v25);
        objc_msgSend(v4, "failWithError:", v26);
LABEL_24:

LABEL_25:
LABEL_26:
        v27 = 0;
        v6 = v50;
        self = v51;
        goto LABEL_27;
      }
      goto LABEL_12;
    }
    objc_msgSend(v4, "error");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {
LABEL_12:
      v29 = objc_alloc(MEMORY[0x1E0C99E60]);
      v30 = objc_opt_class();
      v31 = (void *)objc_msgSend(v29, "initWithObjects:", v30, objc_opt_class(), 0);
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("dependencies"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v37 = (objc_class *)objc_opt_class();
          NSStringFromClass(v37);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = (objc_class *)objc_opt_class();
          NSStringFromClass(v38);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRITaskRecord key \"dependencies\" (expected %@, decoded %@)"), v23, v24, 0);
          v80 = *MEMORY[0x1E0CB2D50];
          v81 = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRITaskRecordOCNTErrorDomain"), 3, v26);
          objc_msgSend(v4, "failWithError:", v39);
LABEL_23:

          goto LABEL_24;
        }
        v32 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("capabilities"));
        if (v32)
        {
LABEL_15:
          v33 = objc_alloc(MEMORY[0x1E0C99E60]);
          v34 = objc_opt_class();
          v35 = (void *)objc_msgSend(v33, "initWithObjects:", v34, objc_opt_class(), 0);
          objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v35, CFSTR("tags"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v23)
          {
            objc_msgSend(v4, "error");
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            self = v51;
            if (!v43)
            {
              v76 = *MEMORY[0x1E0CB2D50];
              v77 = CFSTR("Retrieved nil serialized value for nonnull TRITaskRecord.tags");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRITaskRecordOCNTErrorDomain"), 2, v44);
              objc_msgSend(v4, "failWithError:", v45);

            }
            v23 = 0;
            v27 = 0;
            v6 = v50;
            goto LABEL_27;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v6 = v50;
            self = -[TRITaskRecord initWithTaskId:task:startDate:dependencies:capabilities:tags:](v51, "initWithTaskId:task:startDate:dependencies:capabilities:tags:", v50, v18, v19, v21, v32, v23);
            v27 = self;
LABEL_27:

LABEL_32:
            goto LABEL_33;
          }
          v46 = (objc_class *)objc_opt_class();
          NSStringFromClass(v46);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = (objc_class *)objc_opt_class();
          NSStringFromClass(v47);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRITaskRecord key \"tags\" (expected %@, decoded %@)"), v24, v25, 0);
          v74 = *MEMORY[0x1E0CB2D50];
          v75 = v26;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRITaskRecordOCNTErrorDomain"), 3, v39);
          objc_msgSend(v4, "failWithError:", v48);

          goto LABEL_23;
        }
        objc_msgSend(v4, "error");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v41)
        {
          if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("capabilities")) & 1) == 0)
          {
            v78 = *MEMORY[0x1E0CB2D50];
            v79 = CFSTR("Missing serialized value for TRITaskRecord.capabilities");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRITaskRecordOCNTErrorDomain"), 1, v23);
            objc_msgSend(v4, "failWithError:", v24);
            goto LABEL_25;
          }
          goto LABEL_15;
        }
      }
      else
      {
        objc_msgSend(v4, "error");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v36)
        {
          v82 = *MEMORY[0x1E0CB2D50];
          v83 = CFSTR("Retrieved nil serialized value for nonnull TRITaskRecord.dependencies");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRITaskRecordOCNTErrorDomain"), 2, v23);
          objc_msgSend(v4, "failWithError:", v40);

          v21 = 0;
          goto LABEL_26;
        }
        v21 = 0;
      }
      v27 = 0;
LABEL_31:
      v6 = v50;
      self = v51;
      goto LABEL_32;
    }
    v19 = 0;
    v27 = 0;
    v6 = v50;
    self = v51;
LABEL_33:

    goto LABEL_34;
  }
  objc_msgSend(v4, "error");
  v27 = (TRITaskRecord *)objc_claimAutoreleasedReturnValue();

  if (!v27)
  {
    v88 = *MEMORY[0x1E0CB2D50];
    v89[0] = CFSTR("Retrieved nil serialized value for nonnull TRITaskRecord.taskId");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, &v88, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRITaskRecordOCNTErrorDomain"), 2, v18);
    objc_msgSend(v4, "failWithError:", v19);
    goto LABEL_33;
  }
  v27 = 0;
LABEL_35:

  return v27;
}

- (void)defaultEncodeWithCoder:(id)a3
{
  id v4;
  NSNumber *taskId;
  TRITask *task;
  NSDate *startDate;
  NSArray *dependencies;
  NSArray *tags;
  id v10;

  v4 = a3;
  taskId = self->_taskId;
  v10 = v4;
  if (taskId)
  {
    objc_msgSend(v4, "encodeObject:forKey:", taskId, CFSTR("taskId"));
    v4 = v10;
  }
  task = self->_task;
  if (task)
  {
    objc_msgSend(v10, "encodeObject:forKey:", task, CFSTR("task"));
    v4 = v10;
  }
  startDate = self->_startDate;
  if (startDate)
  {
    objc_msgSend(v10, "encodeObject:forKey:", startDate, CFSTR("startDate"));
    v4 = v10;
  }
  dependencies = self->_dependencies;
  if (dependencies)
  {
    objc_msgSend(v10, "encodeObject:forKey:", dependencies, CFSTR("dependencies"));
    v4 = v10;
  }
  objc_msgSend(v4, "encodeInt64:forKey:", self->_capabilities, CFSTR("capabilities"));
  tags = self->_tags;
  if (tags)
    objc_msgSend(v10, "encodeObject:forKey:", tags, CFSTR("tags"));

}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 586, CFSTR("Do not use NSKeyedArchiver to persist instances of TRITaskRecord to disk. If you want to persist this object to disk, create a protobuf schema."));

  }
  -[TRITaskRecord defaultEncodeWithCoder:](self, "defaultEncodeWithCoder:", v6);

}

- (id)description
{
  id v3;
  NSDate *startDate;
  NSArray *dependencies;
  void *v6;
  void *v7;
  __int128 v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v9 = *(_OWORD *)&self->_taskId;
  startDate = self->_startDate;
  dependencies = self->_dependencies;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_capabilities);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRITaskRecord | taskId:%@ task:%@ startDate:%@ dependencies:%@ capabilities:%@ tags:%@>"), v9, startDate, dependencies, v6, self->_tags);

  return v7;
}

- (NSNumber)taskId
{
  return self->_taskId;
}

- (TRITask)task
{
  return self->_task;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSArray)dependencies
{
  return self->_dependencies;
}

- (unint64_t)capabilities
{
  return self->_capabilities;
}

- (NSArray)tags
{
  return self->_tags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_dependencies, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_taskId, 0);
}

@end
