@implementation SUScriptButton

- (id)_initSUScriptButton
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptButton;
  result = -[SUScriptObject init](&v3, sel_init);
  if (result)
    *((_BYTE *)result + 88) = 1;
  return result;
}

- (SUScriptButton)initWithSystemItemString:(id)a3
{
  SUScriptButton *v4;
  SUScriptButtonNativeObject *v5;

  v4 = -[SUScriptButton _initSUScriptButton](self, "_initSUScriptButton");
  if (v4)
  {
    v5 = -[SUScriptButtonNativeObject initWithSystemItemString:]([SUScriptButtonNativeObject alloc], "initWithSystemItemString:", a3);
    -[SUScriptObject setNativeObject:](v4, "setNativeObject:", v5);
    -[SUScriptObject setNativeObject:](v4, "setNativeObject:", +[SUScriptNativeUIBarButtonItem objectWithDefaultButtonForScriptButton:](SUScriptNativeUIBarButtonItem, "objectWithDefaultButtonForScriptButton:", v4));

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptButton;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (UIImage)image
{
  return (UIImage *)objc_msgSend(-[SUScriptButton _boxedNativeButton](self, "_boxedNativeButton"), "image");
}

- (UIEdgeInsets)imageEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  objc_msgSend(-[SUScriptButton _boxedNativeButton](self, "_boxedNativeButton"), "imageInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)nativeButtonOfType:(int)a3
{
  SUScriptNativeObject *v5;
  SUScriptNativeObject *v6;
  SUScriptNativeObject *v7;
  __objc2_class **v8;
  SUScriptNativeObject *v9;

  v5 = -[SUScriptObject nativeObject](self, "nativeObject");
  v6 = v5;
  if (v5 && -[SUScriptNativeObject buttonType](v5, "buttonType") == a3)
  {
    v7 = v6;
  }
  else
  {
    v8 = off_24DE79E68;
    if (a3 != 1)
      v8 = off_24DE79E70;
    v9 = (SUScriptNativeObject *)-[__objc2_class objectWithDefaultButtonForScriptButton:](*v8, "objectWithDefaultButtonForScriptButton:", self);
    v7 = v9;
    if (v6)
      -[SUScriptNativeObject configureFromScriptButtonNativeObject:](v9, "configureFromScriptButtonNativeObject:", v6);
    -[SUScriptObject setNativeObject:](self, "setNativeObject:", v7);
  }
  return -[SUScriptNativeObject object](v7, "object");
}

- (void)performActionWithArguments:(id)a3
{
  id action;

  action = self->_action;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(action, "performAction");
    return;
  }
  if (action)
  {
    -[SUScriptButton target](self, "target");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
LABEL_2:
      WebThreadRun();
  }
}

uint64_t __45__SUScriptButton_performActionWithArguments___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "callWebScriptMethod:withArguments:", CFSTR("call"), *(_QWORD *)(a1 + 40));
}

uint64_t __45__SUScriptButton_performActionWithArguments___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "callWebScriptMethod:withArguments:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)setImage:(id)a3
{
  objc_msgSend(-[SUScriptButton _boxedNativeButton](self, "_boxedNativeButton"), "setImage:", a3);
}

- (void)setNativeButton:(id)a3
{
  void *v5;
  uint64_t v6;

  objc_opt_class();
  if (((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    && (v5 = (void *)objc_opt_class()) != 0)
  {
    v6 = objc_msgSend(v5, "objectWithNativeObject:", a3);
  }
  else
  {
    v6 = 0;
  }
  -[SUScriptObject setNativeObject:](self, "setNativeObject:", v6);
}

- (id)buttonItem
{
  id v3;
  NSString *v4;
  uint64_t v5;
  int v6;
  SUUIAppearance *v7;

  v3 = -[SUScriptButton nativeButtonOfType:](self, "nativeButtonOfType:", 1);
  SUScriptNavigationItemSetFlagged(v3, 1);
  if (!objc_msgSend((id)objc_msgSend(-[SUScriptObject parentViewController](self, "parentViewController"), "navigationController"), "_popoverController"))goto LABEL_7;
  v4 = -[SUScriptButton style](self, "style");
  v5 = 0;
  while ((objc_msgSend((id)__BarButtonStyles[v5 + 1], "isEqualToString:", v4) & 1) == 0)
  {
    v5 += 2;
    if (v5 == 8)
      return v3;
  }
  if (__BarButtonStyles[v5] == 2)
  {
LABEL_7:
    v6 = objc_msgSend(-[SUScriptButton _boxedNativeButton](self, "_boxedNativeButton"), "isBackButton");
    v7 = -[SUClientInterface appearance](-[SUScriptObject clientInterface](self, "clientInterface"), "appearance");
    if (v6)
      -[SUUIAppearance _styleBackBarButtonItem:](v7, "_styleBackBarButtonItem:", v3);
    else
      -[SUUIAppearance styleBarButtonItem:](v7, "styleBarButtonItem:", v3);
  }
  return v3;
}

- (id)action
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  uint64_t v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3052000000;
  v7 = __Block_byref_object_copy__7;
  v8 = __Block_byref_object_dispose__7;
  v9 = 0;
  WebThreadRunOnMainThread();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);
  return v2;
}

id __24__SUScriptButton_action__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 72);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (SUScriptCanvasContext)canvas
{
  SUScriptCanvasContext *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_canvas;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (id)_className
{
  return CFSTR("iTunesButton");
}

- (BOOL)enabled
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

uint64_t __25__SUScriptButton_enabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nativeButton"), "isEnabled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)hideConfirmationAnimated:(BOOL)a3
{
  WebThreadRunOnMainThread();
}

uint64_t __43__SUScriptButton_hideConfirmationAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeButton"), "hideConfirmationAnimated:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)loading
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

uint64_t __25__SUScriptButton_loading__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeButton"), "isLoading");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setAction:(id)a3
{
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __28__SUScriptButton_setAction___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t result;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[9];
  if (v3 != *(void **)(a1 + 40))
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = *(id *)(a1 + 40);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v4 = (void *)objc_msgSend(v2, "_boxedNativeButton");
  result = objc_msgSend(v4, "disconnectButtonAction");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
    return objc_msgSend(v4, "connectButtonAction");
  return result;
}

- (void)setCanvas:(id)a3
{
  SUScriptCanvasContext *canvas;
  void *v6;

  -[SUScriptObject lock](self, "lock");
  canvas = self->_canvas;
  if (canvas == a3)
  {
    -[SUScriptObject unlock](self, "unlock");
    v6 = 0;
  }
  else
  {

    self->_canvas = (SUScriptCanvasContext *)a3;
    v6 = (void *)objc_msgSend(a3, "copyCanvasImage");
    -[SUScriptObject unlock](self, "unlock");
    WebThreadRunOnMainThread();
  }

}

uint64_t __28__SUScriptButton_setCanvas___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setImage:", *(_QWORD *)(a1 + 40));
}

- (void)setEnabled:(BOOL)a3
{
  WebThreadRunOnMainThread();
}

uint64_t __29__SUScriptButton_setEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nativeButton"), "setEnabled:", *(unsigned __int8 *)(a1 + 40));
}

- (void)setImageInsetsTop:(float)a3 left:(float)a4 bottom:(float)a5 right:(float)a6
{
  WebThreadRunOnMainThread();
}

uint64_t __54__SUScriptButton_setImageInsetsTop_left_bottom_right___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeButton"), "setImageInsets:", *(float *)(a1 + 40), *(float *)(a1 + 44), *(float *)(a1 + 48), *(float *)(a1 + 52));
}

- (void)setImageWithURLString:(id)a3 scale:(id)a4
{
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a4 = 0;
  objc_opt_class();
  if (((objc_opt_isKindOfClass() & 1) != 0
     || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), !a3)
     || (isKindOfClass & 1) != 0
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    && (!a4 || (objc_opt_respondsToSelector() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

void __46__SUScriptButton_setImageWithURLString_scale___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  float v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  if (*(_QWORD *)(a1 + 32)
    && (v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", *(_QWORD *)(a1 + 32))) != 0)
  {
    v8 = (id)v2;
    v3 = *(void **)(a1 + 48);
    if (v3)
    {
      objc_msgSend(v3, "floatValue");
      v5 = v4;
    }
    else
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "scale");
    }
    v7 = (void *)objc_msgSend(*(id *)(a1 + 40), "newImageWithURL:scale:", v8, v5);
    objc_msgSend(*(id *)(a1 + 40), "setImage:", v7);

    v6 = v8;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setImage:", 0);
    v6 = 0;
  }

}

- (void)setLoading:(BOOL)a3
{
  WebThreadRunOnMainThread();
}

uint64_t __29__SUScriptButton_setLoading___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeButton"), "setLoading:", *(unsigned __int8 *)(a1 + 40));
}

- (void)setStyle:(id)a3
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

uint64_t __27__SUScriptButton_setStyle___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeButton"), "setStyleFromString:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_boxedNativeButton");
  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "buttonItem");
  return result;
}

- (void)setSubtitle:(id)a3
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

uint64_t __30__SUScriptButton_setSubtitle___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeButton"), "setSubtitle:", *(_QWORD *)(a1 + 40));
}

- (void)setTag:(int64_t)a3
{
  WebThreadRunOnMainThread();
}

uint64_t __25__SUScriptButton_setTag___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeButton"), "setTag:", *(_QWORD *)(a1 + 40));
}

- (void)setTitle:(id)a3
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

uint64_t __27__SUScriptButton_setTitle___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeButton"), "setTitle:", *(_QWORD *)(a1 + 40));
}

- (void)showConfirmationWithTitle:(id)a3 animated:(BOOL)a4
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

uint64_t __53__SUScriptButton_showConfirmationWithTitle_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeButton"), "showConfirmationWithTitle:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (id)showingConfirmation
{
  void **v2;
  void *v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  WebThreadRunOnMainThread();
  if (*((_BYTE *)v6 + 24))
    v2 = (void **)MEMORY[0x24BDBD270];
  else
    v2 = (void **)MEMORY[0x24BDBD268];
  v3 = *v2;
  _Block_object_dispose(&v5, 8);
  return v3;
}

uint64_t __37__SUScriptButton_showingConfirmation__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeButton"), "isShowingConfirmation");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSString)style
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
  v11 = __Block_byref_object_copy__7;
  v12 = __Block_byref_object_dispose__7;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (NSString *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __23__SUScriptButton_style__block_invoke, &unk_24DE7BE30, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __23__SUScriptButton_style__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeButton"), "styleString");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)subtitle
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
  v11 = __Block_byref_object_copy__7;
  v12 = __Block_byref_object_dispose__7;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (NSString *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __26__SUScriptButton_subtitle__block_invoke, &unk_24DE7BE30, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __26__SUScriptButton_subtitle__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeButton"), "subtitle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (int64_t)tag
{
  int64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  WebThreadRunOnMainThread();
  v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __21__SUScriptButton_tag__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeButton"), "tag");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSString)title
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
  v11 = __Block_byref_object_copy__7;
  v12 = __Block_byref_object_dispose__7;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (NSString *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __23__SUScriptButton_title__block_invoke, &unk_24DE7BE30, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __23__SUScriptButton_title__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_boxedNativeButton"), "title");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setTarget:(id)a3
{
  WebScriptObject *v5;
  char isKindOfClass;
  WebScriptObject *target;

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
        v5 = (WebScriptObject *)a3;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
          return;
        }
      }
    }
  }
  -[SUScriptObject lock](self, "lock");
  target = self->_target;
  if (target != v5)
  {

    self->_target = v5;
  }
  -[SUScriptObject unlock](self, "unlock");
}

- (WebScriptObject)target
{
  WebScriptObject *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_target;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (id)_action
{
  return self->_action;
}

- (id)_boxedNativeButton
{
  SUScriptNativeObject *v3;

  v3 = -[SUScriptObject nativeObject](self, "nativeObject");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = +[SUScriptNativeUIButton objectWithDefaultButtonForScriptButton:](SUScriptNativeUIButton, "objectWithDefaultButtonForScriptButton:", self);
    -[SUScriptObject setNativeObject:](self, "setNativeObject:", v3);
  }
  return v3;
}

- (id)_nativeButton
{
  return (id)objc_msgSend(-[SUScriptButton _boxedNativeButton](self, "_boxedNativeButton"), "object");
}

- (id)_systemItemString
{
  return (id)-[SUScriptNativeObject systemItemString](-[SUScriptObject nativeObject](self, "nativeObject"), "systemItemString");
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_12, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptButton;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_9, 4);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptButton;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptButton;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_12, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __KeyMapping_12 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("action"), CFSTR("canvas"), CFSTR("canvas"), CFSTR("enabled"), CFSTR("enabled"), CFSTR("loading"), CFSTR("loading"), CFSTR("showingConfirmation"), CFSTR("showingConfirmation"), CFSTR("style"), CFSTR("style"), CFSTR("subtitle"), CFSTR("subtitle"), CFSTR("tag"), CFSTR("tag"), CFSTR("title"), CFSTR("title"),
                        CFSTR("target"),
                        CFSTR("target"),
                        0);
    __SelectorMapping_9 = (uint64_t)sel_hideConfirmationAnimated_;
    unk_255186190 = CFSTR("hideConfirmation");
    qword_255186198 = (uint64_t)sel_setImageInsetsTop_left_bottom_right_;
    unk_2551861A0 = CFSTR("setImageInsets");
    qword_2551861A8 = (uint64_t)sel_setImageWithURLString_scale_;
    unk_2551861B0 = CFSTR("setImage");
    qword_2551861B8 = (uint64_t)sel_showConfirmationWithTitle_animated_;
    unk_2551861C0 = CFSTR("showConfirmation");
  }
}

- (BOOL)shouldPerformDefaultAction
{
  return self->_shouldPerformDefaultAction;
}

- (void)setShouldPerformDefaultAction:(BOOL)a3
{
  self->_shouldPerformDefaultAction = a3;
}

@end
