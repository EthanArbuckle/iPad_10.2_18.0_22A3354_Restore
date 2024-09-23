@implementation SUScriptTextField

- (SUScriptTextField)init
{
  return -[SUScriptTextField initWithTextFieldStyle:](self, "initWithTextFieldStyle:", 0);
}

- (SUScriptTextField)initWithTextFieldStyle:(id)a3
{
  SUScriptTextField *v5;
  SUScriptTextField *v6;
  __CFString *v7;
  objc_super v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a3 = 0;
  v9.receiver = self;
  v9.super_class = (Class)SUScriptTextField;
  v5 = -[SUScriptObject init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    if (a3)
    {
      if (!-[SUScriptTextField _styleIsValid:](v5, "_styleIsValid:", a3))
      {

        return 0;
      }
      v7 = (__CFString *)a3;
    }
    else
    {
      v7 = CFSTR("default");
    }
    v6->_style = &v7->isa;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[SUScriptFunction setScriptObject:](self->_shouldFocusFunction, "setScriptObject:", 0);
  -[SUScriptFunction setThisObject:](self->_shouldFocusFunction, "setThisObject:", 0);

  v3.receiver = self;
  v3.super_class = (Class)SUScriptTextField;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (BOOL)canBecomeFirstResponder
{
  SUScriptFunction *shouldFocusFunction;
  uint64_t v3;
  void *v4;

  shouldFocusFunction = self->_shouldFocusFunction;
  if (shouldFocusFunction
    && (v3 = -[SUScriptFunction callSynchronouslyWithArguments:](shouldFocusFunction, "callSynchronouslyWithArguments:", 0)) != 0&& (v4 = (void *)v3, (objc_opt_respondsToSelector() & 1) != 0))
  {
    return objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    return 1;
  }
}

- (void)setNativeObjectWithBarButtonItem:(id)a3
{
  if (a3)
    a3 = +[SUScriptNativeObject objectWithNativeObject:](SUScriptTextFieldNativeObjectUIBarButtonItem, "objectWithNativeObject:");
  -[SUScriptObject setNativeObject:](self, "setNativeObject:", a3);
}

- (void)setNativeObjectWithSearchBar:(id)a3
{
  if (a3)
    a3 = +[SUScriptNativeObject objectWithNativeObject:](SUScriptTextFieldNativeObjectUISearchBar, "objectWithNativeObject:");
  -[SUScriptObject setNativeObject:](self, "setNativeObject:", a3);
}

- (void)setNativeObjectWithTextField:(id)a3
{
  if (a3)
    a3 = +[SUScriptNativeObject objectWithNativeObject:](SUScriptTextFieldNativeObjectUITextField, "objectWithNativeObject:");
  -[SUScriptObject setNativeObject:](self, "setNativeObject:", a3);
}

- (id)buttonItem
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_msgSend(-[SUScriptTextField _boxedNativeTextField](self, "_boxedNativeTextField"), "object");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = -[SUScriptObject copyObjectForScriptFromPoolWithClass:](self, "copyObjectForScriptFromPoolWithClass:", objc_opt_class());
    objc_msgSend(v4, "setCustomView:", v3);
    SUScriptNavigationItemSetFlagged(v4, 1);
    v5 = v4;
    return v4;
  }
  return v3;
}

- (BOOL)blur
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  WebThreadRunOnMainThread();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __25__SUScriptTextField_blur__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeTextField"), "resignFirstResponder");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)focus
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  WebThreadRunOnMainThread();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __26__SUScriptTextField_focus__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeTextField"), "becomeFirstResponder");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSString)autocapitalizationType
{
  void *v2;
  NSString *v3;
  NSString *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__5;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (NSString *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __43__SUScriptTextField_autocapitalizationType__block_invoke, &unk_24DE7BE30, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __43__SUScriptTextField_autocapitalizationType__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1 + 32), "_autocapitalizationType");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)autocorrectionType
{
  void *v2;
  NSString *v3;
  NSString *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__5;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (NSString *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __39__SUScriptTextField_autocorrectionType__block_invoke, &unk_24DE7BE30, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __39__SUScriptTextField_autocorrectionType__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1 + 32), "_autocorrectionType");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_className
{
  return CFSTR("iTunesTextField");
}

- (NSString)keyboardType
{
  void *v2;
  NSString *v3;
  NSString *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__5;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (NSString *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __33__SUScriptTextField_keyboardType__block_invoke, &unk_24DE7BE30, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __33__SUScriptTextField_keyboardType__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1 + 32), "_keyboardType");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)placeholder
{
  void *v2;
  NSString *v3;
  NSString *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__5;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (NSString *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __32__SUScriptTextField_placeholder__block_invoke, &unk_24DE7BE30, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __32__SUScriptTextField_placeholder__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_copyPlaceholder");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setAutocapitalizationType:(id)a3
{
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && __SUAutocapitalizationTypeForString(a3) != -1)
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __47__SUScriptTextField_setAutocapitalizationType___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeTextField"), "setAutocapitalizationType:", __SUAutocapitalizationTypeForString(*(void **)(a1 + 40)));
}

- (void)setAutocorrectionType:(id)a3
{
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ((objc_msgSend(a3, "isEqualToString:", CFSTR("default")) & 1) != 0
     || (objc_msgSend(a3, "isEqualToString:", CFSTR("no")) & 1) != 0
     || (objc_msgSend(a3, "isEqualToString:", CFSTR("yes")) & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __43__SUScriptTextField_setAutocorrectionType___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeTextField"), "setAutocorrectionType:", __SUAutocorrectionTypeForString(*(_QWORD *)(a1 + 40)));
}

- (void)setKeyboardType:(id)a3
{
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && __SUKeyboardTypeForString((uint64_t)a3) != -1)
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __37__SUScriptTextField_setKeyboardType___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeTextField"), "setKeyboardType:", __SUKeyboardTypeForString(*(_QWORD *)(a1 + 40)));
}

- (void)setPlaceholder:(id)a3
{
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __36__SUScriptTextField_setPlaceholder___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeTextField"), "setPlaceholder:", *(_QWORD *)(a1 + 40));
}

- (void)setShouldFocusFunction:(id)a3
{
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __44__SUScriptTextField_setShouldFocusFunction___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  if (!v2)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = objc_alloc_init(SUScriptFunction);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setThisObject:");
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  }
  return objc_msgSend(v2, "setScriptObject:", *(_QWORD *)(a1 + 40));
}

- (void)setValue:(id)a3
{
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __30__SUScriptTextField_setValue___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeTextField"), "setValue:", *(_QWORD *)(a1 + 40));
}

- (void)setWidth:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    WebThreadRunOnMainThread();
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

uint64_t __30__SUScriptTextField_setWidth___block_invoke(uint64_t a1)
{
  void *v2;
  float v3;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeTextField");
  objc_msgSend(*(id *)(a1 + 40), "floatValue");
  return objc_msgSend(v2, "setWidth:", v3);
}

- (WebScriptObject)shouldFocusFunction
{
  void *v2;
  WebScriptObject *v3;
  WebScriptObject *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__5;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (WebScriptObject *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __40__SUScriptTextField_shouldFocusFunction__block_invoke, &unk_24DE7BE30, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __40__SUScriptTextField_shouldFocusFunction__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "scriptObject");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)style
{
  return self->_style;
}

- (NSString)value
{
  void *v2;
  NSString *v3;
  NSString *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__5;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (NSString *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __26__SUScriptTextField_value__block_invoke, &unk_24DE7BE30, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __26__SUScriptTextField_value__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_copyValue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSNumber)width
{
  double v2;
  NSNumber *v3;
  uint64_t v5;
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  v5 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = v8[3];
  *(float *)&v2 = v2;
  v3 = (NSNumber *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2, v5, 3221225472, __26__SUScriptTextField_width__block_invoke, &unk_24DE7BE30, self, &v7);
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __26__SUScriptTextField_width__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeTextField"), "width");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (id)_autocapitalizationType
{
  unint64_t v2;

  v2 = objc_msgSend(-[SUScriptTextField _boxedNativeTextField](self, "_boxedNativeTextField"), "autocapitalizationType");
  if (v2 > 3)
    return CFSTR("sentences");
  else
    return off_24DE7C148[v2];
}

- (id)_autocorrectionType
{
  uint64_t v2;
  const __CFString *v3;

  v2 = objc_msgSend(-[SUScriptTextField _boxedNativeTextField](self, "_boxedNativeTextField"), "autocorrectionType");
  v3 = CFSTR("default");
  if (v2 == 2)
    v3 = CFSTR("yes");
  if (v2 == 1)
    return CFSTR("no");
  else
    return (id)v3;
}

- (id)_copyPlaceholder
{
  return (id)objc_msgSend(-[SUScriptTextField _boxedNativeTextField](self, "_boxedNativeTextField"), "placeholder");
}

- (id)_copyValue
{
  return (id)objc_msgSend(-[SUScriptTextField _boxedNativeTextField](self, "_boxedNativeTextField"), "value");
}

- (id)_keyboardType
{
  uint64_t v2;

  v2 = objc_msgSend(-[SUScriptTextField _boxedNativeTextField](self, "_boxedNativeTextField"), "keyboardType");
  if ((unint64_t)(v2 - 1) > 6)
    return CFSTR("default");
  else
    return (id)qword_24DE7C168[v2 - 1];
}

- (id)_boxedNativeTextField
{
  SUScriptNativeObject *v3;
  id v4;

  v3 = -[SUScriptObject nativeObject](self, "nativeObject");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = -[SUScriptTextField _newTextField](self, "_newTextField");
    v3 = +[SUScriptNativeObject objectWithNativeObject:](SUScriptTextFieldNativeObjectUITextField, "objectWithNativeObject:", v4);
    -[SUScriptObject setNativeObject:](self, "setNativeObject:", v3);

  }
  return v3;
}

- (double)_defaultWidth
{
  return dbl_21B558360[objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") == 1];
}

- (id)_newTextField
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  if (-[NSString isEqualToString:](-[SUScriptTextField style](self, "style"), "isEqualToString:", CFSTR("search")))
  {
    v3 = -[SUScriptObject copyObjectForScriptFromPoolWithClass:](self, "copyObjectForScriptFromPoolWithClass:", objc_opt_class());
    objc_msgSend(MEMORY[0x24BDF6D70], "defaultHeight");
    objc_msgSend(v3, "setFrame:", 0.0, 0.0, 0.0, v4);
    objc_msgSend(v3, "setClearButtonMode:", 1);
    objc_msgSend(v3, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 14.0));
    LODWORD(v5) = 5.0;
    LODWORD(v6) = 4.0;
    objc_msgSend(v3, "setPaddingTop:paddingLeft:", v5, v6);
    objc_msgSend((id)objc_msgSend(v3, "textInputTraits"), "setReturnKeyType:", 6);
  }
  else
  {
    v3 = -[SUScriptObject copyObjectForScriptFromPoolWithClass:](self, "copyObjectForScriptFromPoolWithClass:", objc_opt_class());
    objc_msgSend(v3, "setBorderStyle:", 2);
  }
  objc_msgSend(v3, "setEnablesReturnKeyAutomatically:", 1);
  objc_msgSend(v3, "setTextColor:", objc_msgSend(MEMORY[0x24BDF6950], "blackColor"));
  objc_msgSend(v3, "setTextLoupeVisibility:", 3);
  objc_msgSend(v3, "sizeToFit");
  objc_msgSend(v3, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SUScriptTextField _defaultWidth](self, "_defaultWidth");
  objc_msgSend(v3, "setFrame:", v8, v10, v13, v12);
  return v3;
}

- (BOOL)_styleIsValid:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("default")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a3, "isEqualToString:", CFSTR("search"));
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_11, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptTextField;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_8, 2);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptTextField;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptTextField;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_11, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_8 = (uint64_t)sel_blur;
    *(_QWORD *)algn_255186168 = CFSTR("blur");
    qword_255186170 = (uint64_t)sel_focus;
    unk_255186178 = CFSTR("focus");
    __KeyMapping_11 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("autocapitalizationType"), CFSTR("autocorrectionType"), CFSTR("autocorrectionType"), CFSTR("keyboardType"), CFSTR("keyboardType"), CFSTR("placeholder"), CFSTR("placeholder"), CFSTR("shouldFocusFunction"), CFSTR("shouldFocusFunction"), CFSTR("style"), CFSTR("style"), CFSTR("value"), CFSTR("value"), CFSTR("width"), CFSTR("width"), 0);
  }
}

@end
