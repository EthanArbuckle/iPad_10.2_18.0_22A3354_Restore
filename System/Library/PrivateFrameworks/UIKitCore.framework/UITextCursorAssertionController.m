@implementation UITextCursorAssertionController

- (void)setSubject:(id)a3
{
  objc_storeWeak((id *)&self->_subject, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_subject);
  objc_storeStrong((id *)&self->_assertions, 0);
}

- (void)_updateSubjectWithAssertionState
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  int v29;
  id *p_subject;
  id WeakRetained;
  int v32;
  id v33;
  id v34;
  int v35;
  id v36;
  id v37;
  int v38;
  id v39;
  id v40;
  char v41;
  id v42;
  UITextCursorAssertionController *v43;
  uint64_t v44;
  NSHashTable *obj;
  int v46;
  unint64_t v47;
  _BOOL4 v48;
  _BOOL4 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v43 = self;
  obj = self->_assertions;
  v2 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = 0;
    LODWORD(v6) = 1;
    v7 = *(_QWORD *)v51;
    v44 = 1;
    LODWORD(v8) = 1;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v51 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "options", v43) & 1;
        v12 = objc_msgSend(v10, "options");
        v48 = (v12 & 2 | (unint64_t)v11) == 0;
        v49 = (v12 & 2) == 0;
        v47 = objc_msgSend(v10, "options");
        if ((objc_msgSend(v10, "options") & 0x40) != 0)
        {
          v14 = v5 | 8;
          objc_msgSend(v10, "userInfo");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("_UITextCursorAnimationStyleUserInfoKey"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v16, "integerValue");

        }
        else
        {
          v13 = objc_msgSend(v10, "options");
          v14 = ((unint64_t)objc_msgSend(v10, "options") >> 3) & 2 | (v13 >> 3) & 1 | v5;
        }
        v5 = ((unint64_t)objc_msgSend(v10, "options") >> 3) & 0x10 | v14;
        if ((objc_msgSend(v10, "options") & 0x20) != 0)
        {
          objc_msgSend(v10, "userInfo");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("_UITextCursorKeyboardIndicatorUserInfoKey"));
          v46 = v6;
          v18 = v8;
          v19 = v4;
          v20 = v7;
          v21 = v5;
          v22 = v3;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "BOOLValue");

          v3 = v22;
          v25 = 4;
          if (v24)
            v25 = 36;
          v26 = v25 | v21;
          v7 = v20;
          v4 = v19;
          LODWORD(v8) = v18;
          LODWORD(v6) = v46;
          objc_msgSend(v10, "userInfo");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("_UITextCursorInputModeSwitcherUserInfoKey"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "BOOLValue");

          if (v29)
            v5 = v26 | 0x40;
          else
            v5 = v26;
        }
        v6 = v49 & v6;
        v8 = v48 & v8;
        v4 |= (v47 >> 2) & 1;
      }
      v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    }
    while (v3);
  }
  else
  {
    LOBYTE(v4) = 0;
    v5 = 0;
    v6 = 1;
    v44 = 1;
    v8 = 1;
  }

  p_subject = (id *)&v43->_subject;
  WeakRetained = objc_loadWeakRetained((id *)&v43->_subject);
  v32 = objc_msgSend(WeakRetained, "cursorVisible");

  if ((_DWORD)v6 != v32)
  {
    v33 = objc_loadWeakRetained(p_subject);
    objc_msgSend(v33, "setCursorVisible:", v6);

  }
  v34 = objc_loadWeakRetained(p_subject);
  v35 = objc_msgSend(v34, "cursorBlinks");

  if ((_DWORD)v8 != v35)
  {
    v36 = objc_loadWeakRetained(p_subject);
    objc_msgSend(v36, "setCursorBlinks:", v8);

  }
  v37 = objc_loadWeakRetained(p_subject);
  v38 = objc_msgSend(v37, "ghostAppearance");

  if ((v4 & 1) != v38)
  {
    v39 = objc_loadWeakRetained(p_subject);
    objc_msgSend(v39, "setGhostAppearance:", v4 & 1);

  }
  v40 = objc_loadWeakRetained(p_subject);
  v41 = objc_opt_respondsToSelector();

  if ((v41 & 1) != 0)
  {
    v42 = objc_loadWeakRetained(p_subject);
    objc_msgSend(v42, "setActiveIndicators:animationStyle:", v5, v44);

  }
}

- (void)dealloc
{
  UITextCursorAssertionControllerSubject **p_subject;
  id WeakRetained;
  objc_super v5;

  p_subject = &self->_subject;
  WeakRetained = objc_loadWeakRetained((id *)&self->_subject);

  if (WeakRetained)
  {
    -[NSHashTable removeAllObjects](self->_assertions, "removeAllObjects");
    -[UITextCursorAssertionController _updateSubjectWithAssertionState](self, "_updateSubjectWithAssertionState");
    objc_storeWeak((id *)p_subject, 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)UITextCursorAssertionController;
  -[UITextCursorAssertionController dealloc](&v5, sel_dealloc);
}

- (id)nonBlinkingAssertionWithReason:(id)a3
{
  return -[UITextCursorAssertionController _createAssertionWithReason:options:userInfo:](self, "_createAssertionWithReason:options:userInfo:", a3, 1, 0);
}

- (id)nonBlinkingGhostAssertionWithReason:(id)a3
{
  return -[UITextCursorAssertionController _createAssertionWithReason:options:userInfo:](self, "_createAssertionWithReason:options:userInfo:", a3, 5, 0);
}

- (id)nonVisibleAssertionWithReason:(id)a3
{
  return -[UITextCursorAssertionController _createAssertionWithReason:options:userInfo:](self, "_createAssertionWithReason:options:userInfo:", a3, 2, 0);
}

- (id)capslockAssertionWithReason:(id)a3
{
  return -[UITextCursorAssertionController _createAssertionWithReason:options:userInfo:](self, "_createAssertionWithReason:options:userInfo:", a3, 8, 0);
}

- (id)activeInputModeAssertionWithReason:(id)a3
{
  return -[UITextCursorAssertionController _createAssertionWithReason:options:userInfo:](self, "_createAssertionWithReason:options:userInfo:", a3, 16, 0);
}

- (id)inputModeSelectorAssertionWithReason:(id)a3 userInfo:(id)a4
{
  return -[UITextCursorAssertionController _createAssertionWithReason:options:userInfo:](self, "_createAssertionWithReason:options:userInfo:", a3, 32, a4);
}

- (id)dictationIndicatorAssertionWithReason:(id)a3 userInfo:(id)a4
{
  return -[UITextCursorAssertionController _createAssertionWithReason:options:userInfo:](self, "_createAssertionWithReason:options:userInfo:", a3, 64, a4);
}

- (id)deleteIndicatorAssertionWithReason:(id)a3
{
  return -[UITextCursorAssertionController _createAssertionWithReason:options:userInfo:](self, "_createAssertionWithReason:options:userInfo:", a3, 128, 0);
}

- (id)_createAssertionWithReason:(id)a3 options:(unint64_t)a4 userInfo:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v13;

  v9 = a5;
  v10 = a3;
  if (!objc_msgSend(v10, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextCursorAssertion.m"), 121, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason.length > 0"));

  }
  v11 = -[_UITextCursorAssertion _initWithReason:options:controller:userInfo:]([_UITextCursorAssertion alloc], "_initWithReason:options:controller:userInfo:", v10, a4, self, v9);

  -[UITextCursorAssertionController _beginTrackingAssertion:](self, "_beginTrackingAssertion:", v11);
  return v11;
}

- (BOOL)_isNonBlinking
{
  NSHashTable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_assertions;
  v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "options", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_beginTrackingAssertion:(id)a3
{
  id v4;
  NSHashTable *assertions;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  assertions = self->_assertions;
  v8 = v4;
  if (!assertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_assertions;
    self->_assertions = v6;

    v4 = v8;
    assertions = self->_assertions;
  }
  -[NSHashTable addObject:](assertions, "addObject:", v4);
  -[UITextCursorAssertionController _updateSubjectWithAssertionState](self, "_updateSubjectWithAssertionState");

}

- (void)_endTrackingAssertion:(id)a3
{
  -[NSHashTable removeObject:](self->_assertions, "removeObject:", a3);
  -[UITextCursorAssertionController _updateSubjectWithAssertionState](self, "_updateSubjectWithAssertionState");
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHashTable allObjects](self->_assertions, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (UITextCursorAssertionControllerSubject)subject
{
  return (UITextCursorAssertionControllerSubject *)objc_loadWeakRetained((id *)&self->_subject);
}

@end
