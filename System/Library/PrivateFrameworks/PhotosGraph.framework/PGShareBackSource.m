@implementation PGShareBackSource

- (PGShareBackSource)initWithLoggingConnection:(id)a3
{
  id v5;
  PGShareBackSource *v6;
  PGShareBackSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGShareBackSource;
  v6 = -[PGShareBackSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_loggingConnection, a3);

  return v7;
}

- (BOOL)prepareSourceWithGraph:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99DA0]);
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ must implement %@"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v5, "initWithName:reason:userInfo:", v6, v11, 0);

  objc_exception_throw(objc_retainAutorelease(v12));
}

- (id)validInputsForSource:(id)a3 givenSuggesterResults:(id)a4
{
  return a3;
}

- (id)suggesterResultsForInputs:(id)a3 momentNodes:(id)a4 inGraph:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_alloc(MEMORY[0x1E0C99DA0]);
  v13 = *MEMORY[0x1E0C99768];
  v14 = (void *)MEMORY[0x1E0CB3940];
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ must implement %@"), v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v12, "initWithName:reason:userInfo:", v13, v18, 0);

  objc_exception_throw(objc_retainAutorelease(v19));
}

- (id)prepareAndReturnSuggesterResultsForInputs:(id)a3 inGraph:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  if (-[PGShareBackSource prepareSourceWithGraph:](self, "prepareSourceWithGraph:", v9))
  {
    +[PGShareBackSuggesterInput localDateIntervalForSuggesterInputs:withTimeIntervalPadding:](PGShareBackSuggesterInput, "localDateIntervalForSuggesterInputs:withTimeIntervalPadding:", v8, 7200.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "momentNodesOverlappingLocalDateInterval:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGShareBackSource suggesterResultsForInputs:momentNodes:inGraph:error:](self, "suggesterResultsForInputs:momentNodes:inGraph:error:", v8, v11, v9, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

@end
