@implementation RTMigrationHelperOneStateAndEntryExitPair

- (RTMigrationHelperOneStateAndEntryExitPair)initWithOneState:(id)a3 entryExit:(id)a4
{
  id v7;
  id v8;
  RTMigrationHelperOneStateAndEntryExitPair *v9;
  RTMigrationHelperOneStateAndEntryExitPair *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RTMigrationHelperOneStateAndEntryExitPair;
  v9 = -[RTMigrationHelperOneStateAndEntryExitPair init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_oneState, a3);
    objc_storeStrong((id *)&v10->_entryExit, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  RTMigrationHelperOneStateAndEntryExitPair *v4;
  RTMigrationHelperOneStateAndEntryExitPair *v5;
  RTMigrationHelperOneStateAndEntryExitPair *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  char v29;
  uint64_t v31;
  void *v32;
  void *v33;

  v4 = (RTMigrationHelperOneStateAndEntryExitPair *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v16 = 1;
    goto LABEL_20;
  }
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v16 = 0;
    goto LABEL_20;
  }
  v6 = v5;
  -[RTMigrationHelperOneStateAndEntryExitPair oneState](self, "oneState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[RTMigrationHelperOneStateAndEntryExitPair oneState](v6, "oneState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueId");
    v10 = objc_claimAutoreleasedReturnValue();
    v33 = v9;
    if (!v10)
    {
      v32 = 0;
      v15 = 1;
LABEL_12:

      goto LABEL_13;
    }
    v31 = v10;
  }
  -[RTMigrationHelperOneStateAndEntryExitPair oneState](self, "oneState", v31, v33);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uniqueId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMigrationHelperOneStateAndEntryExitPair oneState](v6, "oneState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "uniqueId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "isEqual:", v14);

  if (!v8)
    goto LABEL_12;
LABEL_13:

  -[RTMigrationHelperOneStateAndEntryExitPair entryExit](self, "entryExit");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "entry_s");
  v19 = v18;
  -[RTMigrationHelperOneStateAndEntryExitPair entryExit](v6, "entryExit");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "entry_s");
  v22 = v21;

  -[RTMigrationHelperOneStateAndEntryExitPair entryExit](self, "entryExit");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "exit_s");
  v25 = v24;
  -[RTMigrationHelperOneStateAndEntryExitPair entryExit](v6, "entryExit");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "exit_s");
  v28 = v27;

  if (v19 == v22)
    v29 = v15;
  else
    v29 = 0;
  if (v25 == v28)
    v16 = v29;
  else
    v16 = 0;

LABEL_20:
  return v16;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;

  -[RTStateModelOneState uniqueId](self->_oneState, "uniqueId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[RTStateModelEntryExit entry_s](self->_entryExit, "entry_s");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") ^ v4;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[RTStateModelEntryExit exit_s](self->_entryExit, "exit_s");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (RTStateModelOneState)oneState
{
  return self->_oneState;
}

- (void)setOneState:(id)a3
{
  objc_storeStrong((id *)&self->_oneState, a3);
}

- (RTStateModelEntryExit)entryExit
{
  return self->_entryExit;
}

- (void)setEntryExit:(id)a3
{
  objc_storeStrong((id *)&self->_entryExit, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryExit, 0);
  objc_storeStrong((id *)&self->_oneState, 0);
}

@end
