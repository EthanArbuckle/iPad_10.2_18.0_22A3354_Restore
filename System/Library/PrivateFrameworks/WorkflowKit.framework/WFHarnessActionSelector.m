@implementation WFHarnessActionSelector

- (WFHarnessActionSelector)initWithPredicate:(id)a3
{
  id v6;
  WFHarnessActionSelector *v7;
  WFHarnessActionSelector *v8;
  WFHarnessActionSelector *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFHarnessActionSelector.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("predicate"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFHarnessActionSelector;
  v7 = -[WFHarnessActionSelector init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_predicate, a3);
    v9 = v8;
  }

  return v8;
}

- (BOOL)matchesContext:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFHarnessActionSelector.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  -[WFHarnessActionSelector predicate](self, "predicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allowEvaluation");

  -[WFHarnessActionSelector predicate](self, "predicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v7, "evaluateWithObject:", v5);

  return (char)v6;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
}

+ (WFHarnessActionSelector)matchAll
{
  WFHarnessActionSelector *v2;
  void *v3;
  WFHarnessActionSelector *v4;

  v2 = [WFHarnessActionSelector alloc];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WFHarnessActionSelector initWithPredicate:](v2, "initWithPredicate:", v3);

  return v4;
}

@end
