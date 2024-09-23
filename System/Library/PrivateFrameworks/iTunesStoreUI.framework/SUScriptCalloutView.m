@implementation SUScriptCalloutView

- (SUScriptCalloutView)init
{
  SUScriptCalloutView *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUScriptCalloutView;
  v2 = -[SUScriptObject init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__menuDidHideNotification_, *MEMORY[0x24BDF7BA0], 0);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7BA0], 0);
  v4.receiver = self;
  v4.super_class = (Class)SUScriptCalloutView;
  -[SUScriptObject dealloc](&v4, sel_dealloc);
}

- (void)setTargetX:(double)a3 y:(double)a4 width:(double)a5 height:(double)a6
{
  WebThreadRunOnMainThread();
}

uint64_t __49__SUScriptCalloutView_setTargetX_y_width_height___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "parentViewController"), "webView"), "_browserView");
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6BB0], "sharedMenuController"), "setTargetRect:inView:", v2, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)setTitle:(id)a3 subtitle:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a3 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a4 = 0;
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || a4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
  else
  {
    WebThreadRunOnMainThread();
  }
}

uint64_t __41__SUScriptCalloutView_setTitle_subtitle___block_invoke(id *a1)
{
  char v2;
  uint64_t result;

  v2 = objc_msgSend(*((id *)a1[4] + 10), "isEqualToString:", a1[5]);
  if ((v2 & 1) == 0)
  {

    *((_QWORD *)a1[4] + 10) = objc_msgSend(a1[5], "copy");
  }
  result = objc_msgSend(*((id *)a1[4] + 11), "isEqualToString:", a1[6]);
  if ((result & 1) == 0)
  {

    *((_QWORD *)a1[4] + 11) = objc_msgSend(a1[6], "copy");
    return objc_msgSend(a1[4], "_reloadUntructedString");
  }
  if ((v2 & 1) == 0)
    return objc_msgSend(a1[4], "_reloadUntructedString");
  return result;
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
  WebThreadRunOnMainThread();
}

uint64_t __43__SUScriptCalloutView_setVisible_animated___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  _BYTE *v4;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 72) != v2)
  {
    v3 = result;
    *(_BYTE *)(v1 + 72) = v2;
    v4 = *(_BYTE **)(result + 32);
    if (v4[72])
      objc_msgSend(v4, "_setupCalloutBar");
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6BB0], "sharedMenuController"), "setMenuVisible:animated:", *(unsigned __int8 *)(v3 + 40), *(unsigned __int8 *)(v3 + 41));
    result = *(_QWORD *)(v3 + 32);
    if (!*(_BYTE *)(result + 72))
      return objc_msgSend((id)result, "_resetCalloutBar");
  }
  return result;
}

- (id)_className
{
  return CFSTR("iTunesCalloutView");
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

uint64_t __35__SUScriptCalloutView_setSubtitle___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(*(_QWORD *)(result + 32) + 80);
  if (v1 != *(void **)(result + 40))
  {
    v2 = result;

    *(_QWORD *)(*(_QWORD *)(v2 + 32) + 80) = objc_msgSend(*(id *)(v2 + 40), "copy");
    return objc_msgSend(*(id *)(v2 + 32), "_reloadUntructedString");
  }
  return result;
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

uint64_t __32__SUScriptCalloutView_setTitle___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(*(_QWORD *)(result + 32) + 88);
  if (v1 != *(void **)(result + 40))
  {
    v2 = result;

    *(_QWORD *)(*(_QWORD *)(v2 + 32) + 88) = objc_msgSend(*(id *)(v2 + 40), "copy");
    return objc_msgSend(*(id *)(v2 + 32), "_reloadUntructedString");
  }
  return result;
}

- (NSString)subtitle
{
  NSString *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  uint64_t v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3052000000;
  v7 = __Block_byref_object_copy__52;
  v8 = __Block_byref_object_dispose__52;
  v9 = 0;
  WebThreadRunOnMainThread();
  v2 = (NSString *)(id)v5[5];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __31__SUScriptCalloutView_subtitle__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)title
{
  NSString *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  uint64_t v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3052000000;
  v7 = __Block_byref_object_copy__52;
  v8 = __Block_byref_object_dispose__52;
  v9 = 0;
  WebThreadRunOnMainThread();
  v2 = (NSString *)(id)v5[5];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __28__SUScriptCalloutView_title__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_menuDidHideNotification:(id)a3
{
  if (self->_isVisible)
  {
    self->_isVisible = 0;
    -[SUScriptCalloutView _resetCalloutBar](self, "_resetCalloutBar", a3);
  }
}

- (void)_reloadUntructedString
{
  NSString *title;
  NSString *subtitle;
  uint64_t v4;

  if (self->_isVisible)
  {
    title = self->_title;
    subtitle = self->_subtitle;
    if (title)
    {
      if (!subtitle)
      {
LABEL_9:
        objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6890], "sharedCalloutBar"), "setUntruncatedString:", title);
        return;
      }
      v4 = -[NSString stringByAppendingFormat:](title, "stringByAppendingFormat:", CFSTR("\n%@"), self->_subtitle);
    }
    else
    {
      if (!subtitle)
      {
        title = 0;
        goto LABEL_9;
      }
      v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n%@"), subtitle);
    }
    title = (NSString *)v4;
    goto LABEL_9;
  }
}

- (void)_resetCalloutBar
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDF6890], "sharedCalloutBar");
  objc_msgSend(v2, "clearSupressesHorizontalMovementFrame");
  objc_msgSend(v2, "setSupressesHorizontalMovement:", 0);
  objc_msgSend(v2, "setUntruncatedString:", 0);
}

- (void)_setupCalloutBar
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6890], "sharedCalloutBar"), "setSupressesHorizontalMovement:", 1);
  -[SUScriptCalloutView _reloadUntructedString](self, "_reloadUntructedString");
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_79, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptCalloutView;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_58, 3);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptCalloutView;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptCalloutView;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_79, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_58 = (uint64_t)sel_setTargetX_y_width_height_;
    unk_255187190 = CFSTR("setTargetRect");
    qword_255187198 = (uint64_t)sel_setTitle_subtitle_;
    unk_2551871A0 = CFSTR("setTitles");
    qword_2551871A8 = (uint64_t)sel_setVisible_animated_;
    unk_2551871B0 = CFSTR("setVisible");
    __KeyMapping_79 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("subtitle"), CFSTR("title"), CFSTR("title"), 0);
  }
}

@end
