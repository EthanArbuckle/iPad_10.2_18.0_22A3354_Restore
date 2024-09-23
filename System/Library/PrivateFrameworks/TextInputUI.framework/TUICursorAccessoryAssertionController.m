@implementation TUICursorAccessoryAssertionController

- (id)createAssertionWithType:(unint64_t)a3 accessory:(id)a4
{
  id v6;
  TUICursorAccessoryAssertion *v7;

  v6 = a4;
  v7 = -[TUICursorAccessoryAssertion initWithAccessoryType:accessory:controller:]([TUICursorAccessoryAssertion alloc], "initWithAccessoryType:accessory:controller:", a3, v6, self);

  -[TUICursorAccessoryAssertionController beginTrackingAssertion:](self, "beginTrackingAssertion:", v7);
  return v7;
}

- (void)beginTrackingAssertion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[TUICursorAccessoryAssertionController assertions](self, "assertions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICursorAccessoryAssertionController setAssertions:](self, "setAssertions:", v6);

  }
  -[TUICursorAccessoryAssertionController assertions](self, "assertions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

  -[TUICursorAccessoryAssertionController updateSubjectWithAssertionState](self, "updateSubjectWithAssertionState");
}

- (void)endTrackingAssertion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "accessoryType");
  -[TUICursorAccessoryAssertionController assertions](self, "assertions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

  if (v5 == 4)
  {
    -[TUICursorAccessoryAssertionController assertions](self, "assertions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v14, "accessoryType", (_QWORD)v16) == 4)
          {
            -[TUICursorAccessoryAssertionController assertions](self, "assertions");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "removeObject:", v14);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

  }
  -[TUICursorAccessoryAssertionController updateSubjectWithAssertionState](self, "updateSubjectWithAssertionState", (_QWORD)v16);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[TUICursorAccessoryAssertionController subject](self, "subject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TUICursorAccessoryAssertionController assertions](self, "assertions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllObjects");

    -[TUICursorAccessoryAssertionController updateSubjectWithAssertionState](self, "updateSubjectWithAssertionState");
    -[TUICursorAccessoryAssertionController setSubject:](self, "setSubject:", 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)TUICursorAccessoryAssertionController;
  -[TUICursorAccessoryAssertionController dealloc](&v5, sel_dealloc);
}

- (void)updateSubjectWithAssertionState
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  TUICursorAccessoryAssertionController *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  TUICursorAccessoryAssertionController *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  TUIAssertionLogFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v36 = "-[TUICursorAccessoryAssertionController updateSubjectWithAssertionState]";
    _os_log_impl(&dword_18C785000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v29 = self;
  -[TUICursorAccessoryAssertionController assertions](self, "assertions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v4);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        switch(objc_msgSend(v13, "accessoryType"))
        {
          case 1:
            objc_msgSend(v13, "accessory");
            v14 = objc_claimAutoreleasedReturnValue();
            v15 = v7;
            v7 = (void *)v14;
            goto LABEL_13;
          case 2:
            objc_msgSend(v13, "accessory");
            v17 = objc_claimAutoreleasedReturnValue();
            v15 = v10;
            v10 = (void *)v17;
            goto LABEL_13;
          case 4:
            objc_msgSend(v13, "accessory");
            v16 = objc_claimAutoreleasedReturnValue();
            v15 = v8;
            v8 = (void *)v16;
            goto LABEL_13;
          case 8:
            objc_msgSend(v13, "accessory");
            v18 = objc_claimAutoreleasedReturnValue();
            v15 = v9;
            v9 = (void *)v18;
LABEL_13:

            break;
          default:
            continue;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v9)
  {
    objc_msgSend(v19, "addObject:", v9);
    v21 = v29;
    if (!v8)
    {
LABEL_28:
      -[TUICursorAccessoryAssertionController subject](v21, "subject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setScrollAwayIndicatorEnabled:", 0);

      -[TUICursorAccessoryAssertionController subject](v21, "subject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      v25 = 0;
      goto LABEL_29;
    }
  }
  else
  {
    v21 = v29;
    if (!v8)
    {
      if (v10)
        objc_msgSend(v19, "addObject:", v10);
      if (v7)
        objc_msgSend(v20, "addObject:", v7);
      goto LABEL_28;
    }
    objc_msgSend(v19, "addObject:", v8);
  }
  -[TUICursorAccessoryAssertionController subject](v21, "subject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setScrollAwayIndicatorEnabled:", 1);

  -[TUICursorAccessoryAssertionController subject](v21, "subject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  v25 = 1;
LABEL_29:
  objc_msgSend(v23, "setSelectedTextIndicatorEnabled:", v25);

  -[TUICursorAccessoryAssertionController subject](v21, "subject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAutoHideEnabled:", v9 == 0);

  -[TUICursorAccessoryAssertionController subject](v21, "subject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setCursorAccessories:", v20);

}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICursorAccessoryAssertionController assertions](self, "assertions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@>"), v5, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (TUICursorAccessoryAssertionControllerSubject)subject
{
  return (TUICursorAccessoryAssertionControllerSubject *)objc_loadWeakRetained((id *)&self->_subject);
}

- (void)setSubject:(id)a3
{
  objc_storeWeak((id *)&self->_subject, a3);
}

- (NSHashTable)assertions
{
  return self->_assertions;
}

- (void)setAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_assertions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_destroyWeak((id *)&self->_subject);
}

@end
