@implementation SUScriptDialog

- (void)dealloc
{
  objc_super v3;

  self->_body = 0;
  self->_buttons = 0;

  self->_cancelButtonIndex = 0;
  self->_destructiveButtonIndex = 0;

  self->_textFields = 0;
  self->_title = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUScriptDialog;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (void)dismiss
{
  WebThreadRunOnMainThread();
}

uint64_t __25__SUScriptDialog_dismiss__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nativeDialog"), "dismiss");
}

- (void)show
{
  WebThreadRunOnMainThread();
}

uint64_t __22__SUScriptDialog_show__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nativeDialog"), "show");
}

- (void)showSheet
{
  -[SUScriptDialog _logSheetWarnings](self, "_logSheetWarnings");
  WebThreadRunOnMainThread();
}

uint64_t __27__SUScriptDialog_showSheet__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nativeDialog"), "showSheet");
}

- (void)showSheetInPopOver:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SUScriptDialog _logSheetWarnings](self, "_logSheetWarnings");
    WebThreadRunOnMainThread();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __37__SUScriptDialog_showSheetInPopOver___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "activeViewController");
  if (result)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "_nativeDialog"), "showSheetInViewController:", result);
  return result;
}

- (void)showFromDOMElement:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SUScriptDialog _logSheetWarnings](self, "_logSheetWarnings");
    WebThreadRunOnMainThread();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __37__SUScriptDialog_showFromDOMElement___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "DOMElementWithElement:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_msgSend(v2, "webView");
  objc_msgSend(v2, "frame");
  objc_msgSend(v3, "convertRect:fromView:", 0);
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nativeDialog"), "showFromRect:inView:", objc_msgSend(v2, "webView"), v4, v5, v6, v7);
}

- (NSString)body
{
  NSString *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_body;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (id)buttons
{
  id v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_buttons;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (NSNumber)cancelButtonIndex
{
  NSNumber *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_cancelButtonIndex;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (NSNumber)destructiveButtonIndex
{
  NSNumber *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_destructiveButtonIndex;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (id)_className
{
  return CFSTR("iTunesDialog");
}

- (void)setBody:(id)a3
{
  NSString *v5;
  char isKindOfClass;
  NSString *body;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = 0;
    if (a3)
    {
      if ((isKindOfClass & 1) == 0)
      {
        objc_opt_class();
        v5 = (NSString *)a3;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
          return;
        }
      }
    }
  }
  -[SUScriptObject lock](self, "lock");
  body = self->_body;
  if (body != v5)
  {

    self->_body = v5;
  }
  -[SUScriptObject unlock](self, "unlock");
}

- (void)setButtons:(id)a3
{
  id buttons;
  void *v6;
  char isKindOfClass;
  void *v8;
  const __CFString *v9;
  id v10;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v10 = 0;
    if (!a3 || (isKindOfClass & 1) != 0)
      goto LABEL_3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (id)objc_msgSend(a3, "copyArrayValueWithValidator:context:", __SUButtonValidator, 0);
      if (v10)
        goto LABEL_3;
      v8 = (void *)MEMORY[0x24BDFA950];
      v9 = CFSTR("Buttons array contains invalid iTunesButton objects");
    }
    else
    {
      v8 = (void *)MEMORY[0x24BDFA950];
      v9 = CFSTR("Invalid argument");
    }
    objc_msgSend(v8, "throwException:", v9);
    v6 = 0;
    goto LABEL_6;
  }
  v10 = 0;
LABEL_3:
  -[SUScriptObject lock](self, "lock");
  buttons = self->_buttons;
  if (buttons != v10)
  {

    self->_buttons = v10;
  }
  -[SUScriptObject unlock](self, "unlock");
  v6 = v10;
LABEL_6:

}

- (void)setCancelButtonIndex:(id)a3
{
  id v5;
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
LABEL_8:
    -[SUScriptObject lock](self, "lock");

    self->_cancelButtonIndex = (NSNumber *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", objc_msgSend(v5, "intValue"));
    -[SUScriptObject unlock](self, "unlock");
    return;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = 0;
  if (!a3 || (isKindOfClass & 1) != 0)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = a3;
    goto LABEL_8;
  }
  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

- (void)setDestructiveButtonIndex:(id)a3
{
  id v5;
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
LABEL_8:
    -[SUScriptObject lock](self, "lock");

    self->_destructiveButtonIndex = (NSNumber *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", objc_msgSend(v5, "intValue"));
    -[SUScriptObject unlock](self, "unlock");
    return;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = 0;
  if (!a3 || (isKindOfClass & 1) != 0)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = a3;
    goto LABEL_8;
  }
  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

- (void)setTextFields:(id)a3
{
  id textFields;
  void *v6;
  char isKindOfClass;
  void *v8;
  const __CFString *v9;
  id v10;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v10 = 0;
    if (!a3 || (isKindOfClass & 1) != 0)
      goto LABEL_3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (id)objc_msgSend(a3, "copyArrayValueWithValidator:context:", SUISAValidator, objc_opt_class());
      if (v10)
        goto LABEL_3;
      v8 = (void *)MEMORY[0x24BDFA950];
      v9 = CFSTR("Text fields array contains non-iTunesTextField objects");
    }
    else
    {
      v8 = (void *)MEMORY[0x24BDFA950];
      v9 = CFSTR("Invalid argument");
    }
    objc_msgSend(v8, "throwException:", v9);
    v6 = 0;
    goto LABEL_6;
  }
  v10 = 0;
LABEL_3:
  -[SUScriptObject lock](self, "lock");
  textFields = self->_textFields;
  if (textFields != v10)
  {

    self->_textFields = v10;
  }
  -[SUScriptObject unlock](self, "unlock");
  v6 = v10;
LABEL_6:

}

- (void)setTitle:(id)a3
{
  NSString *v5;
  char isKindOfClass;
  NSString *title;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = 0;
    if (a3)
    {
      if ((isKindOfClass & 1) == 0)
      {
        objc_opt_class();
        v5 = (NSString *)a3;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
          return;
        }
      }
    }
  }
  -[SUScriptObject lock](self, "lock");
  title = self->_title;
  if (title != v5)
  {

    self->_title = v5;
  }
  -[SUScriptObject unlock](self, "unlock");
}

- (id)textFields
{
  id v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_textFields;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (NSString)title
{
  NSString *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_title;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (void)_logSheetWarnings
{
  void *v3;
  int v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int *v16;
  int *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[SUScriptObject lock](self, "lock");
  if (objc_msgSend(self->_textFields, "count"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v4 = objc_msgSend(v3, "shouldLog");
    if (objc_msgSend(v3, "shouldLogToDisk"))
      v5 = v4 | 2;
    else
      v5 = v4;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v3, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v5 &= 2u;
    if (v5)
    {
      v19 = 138412290;
      v20 = objc_opt_class();
      LODWORD(v18) = 12;
      v16 = &v19;
      v6 = _os_log_send_and_compose_impl();
      if (v6)
      {
        v7 = (void *)v6;
        v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v6, 4, &v19, v18);
        free(v7);
        v16 = (int *)v8;
        SSFileLog();
      }
    }
  }
  if (-[NSString length](self->_body, "length", v16))
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v10 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v11 = v10 | 2;
    else
      v11 = v10;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v9, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v11 &= 2u;
    if (v11)
    {
      v12 = objc_opt_class();
      v19 = 138412290;
      v20 = v12;
      LODWORD(v18) = 12;
      v17 = &v19;
      v13 = _os_log_send_and_compose_impl();
      if (v13)
      {
        v14 = (void *)v13;
        v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v13, 4, &v19, v18);
        free(v14);
        v17 = (int *)v15;
        SSFileLog();
      }
    }
  }
  -[SUScriptObject unlock](self, "unlock", v17);
}

- (id)_nativeDialog
{
  SUScriptDialogNativeObject *v3;

  v3 = -[SUScriptObject nativeObject](self, "nativeObject");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = objc_alloc_init(SUScriptDialogNativeObject);
    -[SUScriptObject setNativeObject:](self, "setNativeObject:", v3);

  }
  return v3;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_13, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptDialog;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_10, 5);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptDialog;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptDialog;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_13, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_10 = (uint64_t)sel_dismiss;
    *(_QWORD *)algn_2551861D8 = CFSTR("dismiss");
    qword_2551861E0 = (uint64_t)sel_show;
    unk_2551861E8 = CFSTR("show");
    qword_2551861F0 = (uint64_t)sel_showFromDOMElement_;
    unk_2551861F8 = CFSTR("showFromElement");
    qword_255186200 = (uint64_t)sel_showSheet;
    unk_255186208 = CFSTR("showSheet");
    qword_255186210 = (uint64_t)sel_showSheetInPopOver_;
    unk_255186218 = CFSTR("showSheetInPopOver");
    __KeyMapping_13 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("body"), CFSTR("buttons"), CFSTR("buttons"), CFSTR("cancelButtonIndex"), CFSTR("cancelButtonIndex"), CFSTR("destructiveButtonIndex"), CFSTR("destructiveButtonIndex"), CFSTR("textFields"), CFSTR("textFields"), CFSTR("title"), CFSTR("title"), 0);
  }
}

@end
