@implementation SIRINLUTurnInput

- (SIRINLUTurnInput)initWithAsrOutputs:(id)a3 salientEntities:(id)a4 turnContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  SIRINLUTurnInput *v12;
  SIRINLUTurnInput *v13;
  NSString *locale;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SIRINLUTurnInput;
  v12 = -[SIRINLUTurnInput init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_asrOutputs, a3);
    objc_storeStrong((id *)&v13->_salientEntities, a4);
    objc_storeStrong((id *)&v13->_turnContext, a5);
    locale = v13->_locale;
    v13->_locale = (NSString *)&stru_1E7D21BF0;

    v13->_tapToEdit = 0;
    v13->_startTimestamp = 0;
  }

  return v13;
}

- (SIRINLUTurnInput)initWithAsrOutputs:(id)a3 systemDialogActs:(id)a4 activeTasks:(id)a5 executedTasks:(id)a6 salientEntities:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SIRINLUTurnInput *v17;
  SIRINLUTurnInput *v18;
  NSString *locale;
  id v21;
  objc_super v22;

  v21 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)SIRINLUTurnInput;
  v17 = -[SIRINLUTurnInput init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_asrOutputs, a3);
    objc_storeStrong((id *)&v18->_systemDialogActs, a4);
    objc_storeStrong((id *)&v18->_activeTasks, a5);
    objc_storeStrong((id *)&v18->_executedTasks, a6);
    objc_storeStrong((id *)&v18->_salientEntities, a7);
    locale = v18->_locale;
    v18->_locale = (NSString *)&stru_1E7D21BF0;

    v18->_tapToEdit = 0;
    v18->_startTimestamp = 0;
  }

  return v18;
}

- (SIRINLUTurnInput)initWithAsrOutputs:(id)a3 salientEntities:(id)a4 turnContext:(id)a5 locale:(id)a6 tapToEdit:(BOOL)a7 startTimestamp:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  SIRINLUTurnInput *v18;
  SIRINLUTurnInput *v19;
  objc_super v22;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SIRINLUTurnInput;
  v18 = -[SIRINLUTurnInput init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_asrOutputs, a3);
    objc_storeStrong((id *)&v19->_salientEntities, a4);
    objc_storeStrong((id *)&v19->_turnContext, a5);
    objc_storeStrong((id *)&v19->_locale, a6);
    v19->_tapToEdit = a7;
    v19->_startTimestamp = a8;
  }

  return v19;
}

- (SIRINLUTurnInput)initWithCoder:(id)a3
{
  id v4;
  SIRINLUTurnInput *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *asrOutputs;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *systemDialogActs;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSArray *activeTasks;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSArray *executedTasks;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSArray *salientEntities;
  void *v36;
  uint64_t v37;
  SIRINLUTurnContext *turnContext;
  uint64_t v39;
  NSString *locale;
  void *v41;
  void *v42;
  void *v44;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)SIRINLUTurnInput;
  v5 = -[SIRINLUTurnInput init](&v45, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v44, CFSTR("asrOutputs"));
    v8 = objc_claimAutoreleasedReturnValue();
    asrOutputs = v5->_asrOutputs;
    v5->_asrOutputs = (NSArray *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, v16, v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("systemDialogActs"));
    v19 = objc_claimAutoreleasedReturnValue();
    systemDialogActs = v5->_systemDialogActs;
    v5->_systemDialogActs = (NSArray *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("activeTasks"));
    v24 = objc_claimAutoreleasedReturnValue();
    activeTasks = v5->_activeTasks;
    v5->_activeTasks = (NSArray *)v24;

    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("executedTasks"));
    v29 = objc_claimAutoreleasedReturnValue();
    executedTasks = v5->_executedTasks;
    v5->_executedTasks = (NSArray *)v29;

    v31 = (void *)MEMORY[0x1E0C99E60];
    v32 = objc_opt_class();
    objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("salientEntities"));
    v34 = objc_claimAutoreleasedReturnValue();
    salientEntities = v5->_salientEntities;
    v5->_salientEntities = (NSArray *)v34;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("turnContext"));
    v37 = objc_claimAutoreleasedReturnValue();
    turnContext = v5->_turnContext;
    v5->_turnContext = (SIRINLUTurnContext *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locale"));
    v39 = objc_claimAutoreleasedReturnValue();
    locale = v5->_locale;
    v5->_locale = (NSString *)v39;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tapToEdit"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_tapToEdit = objc_msgSend(v41, "BOOLValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startTimestamp"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_startTimestamp = objc_msgSend(v42, "unsignedLongLongValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[SIRINLUTurnInput asrOutputs](self, "asrOutputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("asrOutputs"));

  -[SIRINLUTurnInput systemDialogActs](self, "systemDialogActs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("systemDialogActs"));

  -[SIRINLUTurnInput activeTasks](self, "activeTasks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("activeTasks"));

  -[SIRINLUTurnInput executedTasks](self, "executedTasks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("executedTasks"));

  -[SIRINLUTurnInput salientEntities](self, "salientEntities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("salientEntities"));

  -[SIRINLUTurnInput turnContext](self, "turnContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("turnContext"));

  -[SIRINLUTurnInput locale](self, "locale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("locale"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_tapToEdit);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("tapToEdit"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_startTimestamp);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("startTimestamp"));

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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[SIRINLUTurnInput asrOutputs](self, "asrOutputs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentArray:numSpaces:](SIRINLUPrintUtils, "indentArray:numSpaces:", v3, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SIRINLUTurnInput systemDialogActs](self, "systemDialogActs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentArray:numSpaces:](SIRINLUPrintUtils, "indentArray:numSpaces:", v5, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SIRINLUTurnInput activeTasks](self, "activeTasks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentArray:numSpaces:](SIRINLUPrintUtils, "indentArray:numSpaces:", v7, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SIRINLUTurnInput executedTasks](self, "executedTasks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentArray:numSpaces:](SIRINLUPrintUtils, "indentArray:numSpaces:", v9, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SIRINLUTurnInput salientEntities](self, "salientEntities");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentArray:numSpaces:](SIRINLUPrintUtils, "indentArray:numSpaces:", v11, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB3940];
  -[SIRINLUTurnInput turnContext](self, "turnContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUTurnInput locale](self, "locale");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("{TurnInput\n  asrOutputs:\n%@\n  systemDialogActs:\n%@\n  activeTasks:\n%@\n  executedTasks:\n%@\n  salientEntities:\n%@\n  turnContext:\n%@\n  locale:\n%@\n  tapToEdit:\n%i\n  startTimestamp:\n%llu\n}"), v4, v6, v8, v10, v12, v14, v15, -[SIRINLUTurnInput tapToEdit](self, "tapToEdit"), -[SIRINLUTurnInput startTimestamp](self, "startTimestamp"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSArray)asrOutputs
{
  return self->_asrOutputs;
}

- (void)setAsrOutputs:(id)a3
{
  objc_storeStrong((id *)&self->_asrOutputs, a3);
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

- (SIRINLUTurnContext)turnContext
{
  return self->_turnContext;
}

- (void)setTurnContext:(id)a3
{
  objc_storeStrong((id *)&self->_turnContext, a3);
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (BOOL)tapToEdit
{
  return self->_tapToEdit;
}

- (void)setTapToEdit:(BOOL)a3
{
  self->_tapToEdit = a3;
}

- (unint64_t)startTimestamp
{
  return self->_startTimestamp;
}

- (void)setStartTimestamp:(unint64_t)a3
{
  self->_startTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_turnContext, 0);
  objc_storeStrong((id *)&self->_salientEntities, 0);
  objc_storeStrong((id *)&self->_executedTasks, 0);
  objc_storeStrong((id *)&self->_activeTasks, 0);
  objc_storeStrong((id *)&self->_systemDialogActs, 0);
  objc_storeStrong((id *)&self->_asrOutputs, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
