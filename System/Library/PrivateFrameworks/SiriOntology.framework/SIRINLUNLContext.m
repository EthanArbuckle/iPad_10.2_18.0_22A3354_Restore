@implementation SIRINLUNLContext

- (SIRINLUNLContext)initWithSystemDialogActs:(id)a3 activeTasks:(id)a4 executedTasks:(id)a5 salientEntities:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SIRINLUNLContext *v15;
  SIRINLUNLContext *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SIRINLUNLContext;
  v15 = -[SIRINLUNLContext init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_systemDialogActs, a3);
    objc_storeStrong((id *)&v16->_activeTasks, a4);
    objc_storeStrong((id *)&v16->_executedTasks, a5);
    objc_storeStrong((id *)&v16->_salientEntities, a6);
  }

  return v16;
}

- (SIRINLUNLContext)initWithSystemDialogActs:(id)a3 activeTasks:(id)a4 executedTasks:(id)a5
{
  id v9;
  id v10;
  id v11;
  SIRINLUNLContext *v12;
  SIRINLUNLContext *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SIRINLUNLContext;
  v12 = -[SIRINLUNLContext init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_systemDialogActs, a3);
    objc_storeStrong((id *)&v13->_activeTasks, a4);
    objc_storeStrong((id *)&v13->_executedTasks, a5);
  }

  return v13;
}

- (SIRINLUNLContext)initWithCoder:(id)a3
{
  id v4;
  SIRINLUNLContext *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *systemDialogActs;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSArray *activeTasks;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSArray *executedTasks;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSArray *salientEntities;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)SIRINLUNLContext;
  v5 = -[SIRINLUNLContext init](&v33, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("systemDialogActs"));
    v15 = objc_claimAutoreleasedReturnValue();
    systemDialogActs = v5->_systemDialogActs;
    v5->_systemDialogActs = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("activeTasks"));
    v20 = objc_claimAutoreleasedReturnValue();
    activeTasks = v5->_activeTasks;
    v5->_activeTasks = (NSArray *)v20;

    v22 = (void *)MEMORY[0x1E0C99E60];
    v23 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("executedTasks"));
    v25 = objc_claimAutoreleasedReturnValue();
    executedTasks = v5->_executedTasks;
    v5->_executedTasks = (NSArray *)v25;

    v27 = (void *)MEMORY[0x1E0C99E60];
    v28 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("salientEntities"));
    v30 = objc_claimAutoreleasedReturnValue();
    salientEntities = v5->_salientEntities;
    v5->_salientEntities = (NSArray *)v30;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[SIRINLUNLContext systemDialogActs](self, "systemDialogActs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("systemDialogActs"));

  -[SIRINLUNLContext activeTasks](self, "activeTasks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("activeTasks"));

  -[SIRINLUNLContext executedTasks](self, "executedTasks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("executedTasks"));

  -[SIRINLUNLContext salientEntities](self, "salientEntities");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("salientEntities"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[SIRINLUNLContext systemDialogActs](self, "systemDialogActs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentArray:numSpaces:](SIRINLUPrintUtils, "indentArray:numSpaces:", v3, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SIRINLUNLContext activeTasks](self, "activeTasks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentArray:numSpaces:](SIRINLUPrintUtils, "indentArray:numSpaces:", v5, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SIRINLUNLContext executedTasks](self, "executedTasks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentArray:numSpaces:](SIRINLUPrintUtils, "indentArray:numSpaces:", v7, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SIRINLUNLContext salientEntities](self, "salientEntities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentArray:numSpaces:](SIRINLUPrintUtils, "indentArray:numSpaces:", v9, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{NLContext\n  systemDialogActs:\n%@\n  activeTasks:\n%@\n  executedTasks:\n%@\n  salientEntities:\n%@\n}"), v4, v6, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSArray)systemDialogActs
{
  return self->_systemDialogActs;
}

- (void)setSystemDialogActs:(id)a3
{
  objc_storeStrong((id *)&self->_systemDialogActs, a3);
}

- (NSArray)activeTasks
{
  return self->_activeTasks;
}

- (void)setActiveTasks:(id)a3
{
  objc_storeStrong((id *)&self->_activeTasks, a3);
}

- (NSArray)executedTasks
{
  return self->_executedTasks;
}

- (void)setExecutedTasks:(id)a3
{
  objc_storeStrong((id *)&self->_executedTasks, a3);
}

- (NSArray)salientEntities
{
  return self->_salientEntities;
}

- (void)setSalientEntities:(id)a3
{
  objc_storeStrong((id *)&self->_salientEntities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_salientEntities, 0);
  objc_storeStrong((id *)&self->_executedTasks, 0);
  objc_storeStrong((id *)&self->_activeTasks, 0);
  objc_storeStrong((id *)&self->_systemDialogActs, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
