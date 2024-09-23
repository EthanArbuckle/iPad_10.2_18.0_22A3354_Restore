@implementation SUScriptSegmentedControl

- (SUScriptSegmentedControl)initWithPageSectionGroup:(id)a3
{
  SUScriptSegmentedControl *v4;
  SUScriptSegmentedControl *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUScriptSegmentedControl;
  v4 = -[SUScriptObject init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = -[SUScriptSegmentedControl _newSegmentsFromPageSectionGroup:](v4, "_newSegmentsFromPageSectionGroup:", a3);
    -[SUScriptSegmentedControl setSegments:](v5, "setSegments:", v6);
    -[SUScriptSegmentedControl setSelectedIndex:](v5, "setSelectedIndex:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a3, "defaultSectionIndex")));
    v5->_style = objc_msgSend(a3, "style");

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptSegmentedControl;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (SUSegmentedControl)nativeSegmentedControl
{
  SUSegmentedControl *v3;
  SUSegmentedControl *v4;

  v3 = -[SUScriptNativeObject object](-[SUScriptObject nativeObject](self, "nativeObject"), "object");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = -[SUScriptSegmentedControl _newNativeSegmentedControl](self, "_newNativeSegmentedControl");
    -[SUScriptObject setNativeObject:](self, "setNativeObject:", +[SUScriptNativeObject objectWithNativeObject:](SUScriptSegmentedControlNativeObject, "objectWithNativeObject:", v3));
    v4 = v3;
  }
  return v3;
}

- (int64_t)nativeSelectedIndex
{
  return -[SUSegmentedControl selectedItemIndex](-[SUScriptSegmentedControl activeSegmentedControl](self, "activeSegmentedControl"), "selectedItemIndex");
}

- (id)newPageSectionGroup
{
  return -[SUScriptSegmentedControl _newPageSectionGroupWithSegments:](self, "_newPageSectionGroupWithSegments:", -[SUScriptSegmentedControl segments](self, "segments"));
}

- (void)setNativeSegmentedControl:(id)a3
{
  -[SUScriptObject setNativeObject:](self, "setNativeObject:", +[SUScriptNativeObject objectWithNativeObject:](SUScriptSegmentedControlNativeObject, "objectWithNativeObject:", a3));
}

- (void)hideMoreListAnimated:(BOOL)a3
{
  WebThreadRunOnMainThread();
}

uint64_t __49__SUScriptSegmentedControl_hideMoreListAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl"), "showMoreList:animated:", 0, *(unsigned __int8 *)(a1 + 40));
}

- (id)makeSegmentWithTitle:(id)a3 userInfo:(id)a4
{
  SUScriptSegmentedControlItem *v7;

  v7 = objc_alloc_init(SUScriptSegmentedControlItem);
  -[SUScriptSegmentedControlItem setTitle:](v7, "setTitle:", a3);
  -[SUScriptSegmentedControlItem setUserInfo:](v7, "setUserInfo:", a4);
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7);
  return v7;
}

- (void)setTitleColor:(id)a3 forControlState:(unint64_t)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a3 = 0;
  -[SUScriptSegmentedControl _setColor:forTitleTextAttribute:controlState:](self, "_setColor:forTitleTextAttribute:controlState:", a3, *MEMORY[0x24BDF6600], a4);
}

- (void)setTitleShadowColor:(id)a3 forControlState:(unint64_t)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a3 = 0;
  -[SUScriptSegmentedControl _setColor:forTitleTextAttribute:controlState:](self, "_setColor:forTitleTextAttribute:controlState:", a3, *MEMORY[0x24BDF7DF8], a4);
}

- (void)showMoreListAnimated:(BOOL)a3
{
  WebThreadRunOnMainThread();
}

uint64_t __49__SUScriptSegmentedControl_showMoreListAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl"), "showMoreList:animated:", 1, *(unsigned __int8 *)(a1 + 40));
}

- (void)showPopoverController:(id)a3 fromSegmentIndex:(int64_t)a4 animated:(BOOL)a5
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  WebThreadRunOnMainThread();
}

uint64_t __76__SUScriptSegmentedControl_showPopoverController_fromSegmentIndex_animated___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  void *v4;

  result = objc_msgSend(*(id *)(a1 + 32), "presentablePopoverController");
  if (result)
  {
    v3 = (void *)result;
    v4 = (void *)objc_msgSend(*(id *)(a1 + 40), "activeSegmentedControl");
    objc_msgSend(v3, "setPassthroughViews:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v4, 0));
    return objc_msgSend(v4, "showPopover:fromSegmentIndex:animated:", v3, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
  }
  return result;
}

- (id)titleColorForControlState:(unint64_t)a3
{
  id v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__34;
  v9 = __Block_byref_object_dispose__34;
  v10 = 0;
  WebThreadRunOnMainThread();
  v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v3;
}

SUScriptColor *__54__SUScriptSegmentedControl_titleColorForControlState___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  SUScriptColor *result;

  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl"), "titleTextAttributesForState:", *(_QWORD *)(a1 + 48));
  v3 = objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDF6600]);
  objc_opt_class();
  result = (SUScriptColor *)objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    result = -[SUScriptColor initWithUIColor:]([SUScriptColor alloc], "initWithUIColor:", v3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (id)titleShadowColorForControlState:(unint64_t)a3
{
  id v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__34;
  v9 = __Block_byref_object_dispose__34;
  v10 = 0;
  WebThreadRunOnMainThread();
  v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v3;
}

SUScriptColor *__60__SUScriptSegmentedControl_titleShadowColorForControlState___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  SUScriptColor *result;

  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl"), "titleTextAttributesForState:", *(_QWORD *)(a1 + 48));
  v3 = objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDF7DF8]);
  objc_opt_class();
  result = (SUScriptColor *)objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    result = -[SUScriptColor initWithUIColor:]([SUScriptColor alloc], "initWithUIColor:", v3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (NSString)cancelButtonTitle
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
  v7 = __Block_byref_object_copy__34;
  v8 = __Block_byref_object_dispose__34;
  v9 = 0;
  WebThreadRunOnMainThread();
  v2 = (NSString *)(id)v5[5];
  _Block_object_dispose(&v4, 8);
  return v2;
}

id __45__SUScriptSegmentedControl_cancelButtonTitle__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl"), "cancelButtonTitle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_className
{
  return CFSTR("iTunesSegmentedControl");
}

- (int64_t)maximumNumberOfItems
{
  int64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  WebThreadRunOnMainThread();
  v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __48__SUScriptSegmentedControl_maximumNumberOfItems__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl"), "maximumNumberOfItems");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)maximumWidth
{
  double v2;
  uint64_t v4;
  double *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = (double *)&v4;
  v6 = 0x2020000000;
  v7 = 0;
  WebThreadRunOnMainThread();
  v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __40__SUScriptSegmentedControl_maximumWidth__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl"), "maximumWidth");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (NSString)moreListTitle
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
  v7 = __Block_byref_object_copy__34;
  v8 = __Block_byref_object_dispose__34;
  v9 = 0;
  WebThreadRunOnMainThread();
  v2 = (NSString *)(id)v5[5];
  _Block_object_dispose(&v4, 8);
  return v2;
}

id __41__SUScriptSegmentedControl_moreListTitle__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl"), "moreListTitle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)segments
{
  void *v2;
  id v3;
  void *v4;
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
  v11 = __Block_byref_object_copy__34;
  v12 = __Block_byref_object_dispose__34;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __36__SUScriptSegmentedControl_segments__block_invoke, &unk_24DE7BE08, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __36__SUScriptSegmentedControl_segments__block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  id result;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "storePageViewController");
  v3 = *(id **)(a1 + 32);
  if (v2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(v3, "_newSegmentsFromPageSectionGroup:", objc_msgSend(v2, "sectionGroup"));
    return (id)objc_msgSend(*(id *)(a1 + 32), "_setRawSegments:", 0);
  }
  else
  {
    result = v3[9];
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (NSNumber)selectedIndex
{
  NSNumber *v2;
  uint64_t v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = -1;
  v4 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (NSNumber *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7[3], v4, 3221225472, __41__SUScriptSegmentedControl_selectedIndex__block_invoke, &unk_24DE7BE30, self, &v6);
  _Block_object_dispose(&v6, 8);
  return v2;
}

uint64_t __41__SUScriptSegmentedControl_selectedIndex__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl"), "selectedItemIndex");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSNumber)selectedSegmentIndex
{
  NSNumber *v2;
  uint64_t v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = -1;
  v4 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (NSNumber *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7[3], v4, 3221225472, __48__SUScriptSegmentedControl_selectedSegmentIndex__block_invoke, &unk_24DE7BE30, self, &v6);
  _Block_object_dispose(&v6, 8);
  return v2;
}

uint64_t __48__SUScriptSegmentedControl_selectedSegmentIndex__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl"), "selectedSegmentIndex");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setCancelButtonTitle:(id)a3
{
  WebThreadRunOnMainThread();
}

uint64_t __49__SUScriptSegmentedControl_setCancelButtonTitle___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl"), "setCancelButtonTitle:", *(_QWORD *)(a1 + 40));
}

- (void)setMaximumNumberOfItems:(int64_t)a3
{
  WebThreadRunOnMainThread();
}

uint64_t __52__SUScriptSegmentedControl_setMaximumNumberOfItems___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl"), "setMaximumNumberOfItems:", *(_QWORD *)(a1 + 40));
}

- (void)setMaximumWidth:(double)a3
{
  WebThreadRunOnMainThread();
}

uint64_t __44__SUScriptSegmentedControl_setMaximumWidth___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl");
  objc_msgSend(v2, "setMaximumWidth:", *(double *)(a1 + 40));
  objc_msgSend(v2, "sizeToFitUserInterfaceIdiom");
  return objc_msgSend((id)objc_msgSend(v2, "superview"), "setNeedsLayout");
}

- (void)setMoreListTitle:(id)a3
{
  WebThreadRunOnMainThread();
}

uint64_t __45__SUScriptSegmentedControl_setMoreListTitle___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl"), "setMoreListTitle:", *(_QWORD *)(a1 + 40));
}

- (void)setSegments:(id)a3
{
  id v4;
  char isKindOfClass;
  uint64_t v6;
  void *v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v4 = 0;
    if (a3)
    {
      if ((isKindOfClass & 1) == 0)
      {
        objc_opt_class();
        v4 = a3;
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_8;
      }
    }
  }
  v6 = objc_msgSend(v4, "copyArrayValueWithValidator:context:", SUISAValidator, objc_opt_class());
  if (!v6)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    v7 = 0;
    goto LABEL_9;
  }
  v7 = (void *)v6;
  WebThreadRunOnMainThread();
LABEL_9:

}

uint64_t __40__SUScriptSegmentedControl_setSegments___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_setRawSegments:", *(_QWORD *)(a1 + 40));
  v2 = objc_msgSend(*(id *)(a1 + 32), "storePageViewController");
  v3 = *(void **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "_reloadViewControllerPageSectionGroup");
  result = objc_msgSend(v3, "activeSegmentedControl");
  if (result)
    return objc_msgSend(*(id *)(a1 + 32), "_reloadSegmentedControl:withSegments:", result, *(_QWORD *)(a1 + 40));
  return result;
}

- (void)setSelectedIndex:(id)a3
{
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0)
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __45__SUScriptSegmentedControl_setSelectedIndex___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl");
  v3 = *(void **)(a1 + 40);
  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = -1;
  return objc_msgSend(v2, "setSelectedItemIndex:", v4);
}

- (void)setShowsMoreListAutomatically:(id)a3
{
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0)
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __58__SUScriptSegmentedControl_setShowsMoreListAutomatically___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl"), "setShowsMoreListAutomatically:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
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

uint64_t __37__SUScriptSegmentedControl_setStyle___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;
  void *v5;
  void *v6;
  uint64_t v7;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = objc_msgSend(*(id *)(a1 + 32), "_sectionsStyleForString:", *(_QWORD *)(a1 + 40));
  v2 = objc_msgSend(*(id *)(a1 + 32), "storePageViewController");
  v3 = *(void **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "_reloadViewControllerPageSectionGroup");
  v5 = (void *)objc_msgSend(v3, "activeSegmentedControl");
  v6 = v5;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) == 1)
  {
    v7 = 7;
  }
  else
  {
    result = _UIApplicationUsesLegacyUI();
    if (!(_DWORD)result)
      return result;
    v5 = v6;
    v7 = 2;
  }
  return objc_msgSend(v5, "setSegmentedControlStyle:", v7);
}

- (void)setTintColor:(id)a3
{
  SUScriptColor *v4;
  SUScriptColor *v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a3 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -[SUScriptColor initWithStyleString:]([SUScriptColor alloc], "initWithStyleString:", a3);
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (SUScriptColor *)a3;
LABEL_8:
    v5 = v4;
    if (!a3)
      goto LABEL_13;
    goto LABEL_11;
  }
  v5 = 0;
  if (!a3)
  {
LABEL_13:
    WebThreadRunOnMainThread();
    goto LABEL_14;
  }
LABEL_11:
  if (v5)
    goto LABEL_13;
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
LABEL_14:

}

uint64_t __41__SUScriptSegmentedControl_setTintColor___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl"), "setTintColor:", objc_msgSend(*(id *)(a1 + 40), "nativeColor"));
}

- (void)setTintStyle:(int64_t)a3
{
  WebThreadRunOnMainThread();
}

uint64_t __41__SUScriptSegmentedControl_setTintStyle___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl"), "setTintStyle:", *(_QWORD *)(a1 + 40));
}

- (id)showsMoreListAutomatically
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
  v8 = 1;
  WebThreadRunOnMainThread();
  if (*((_BYTE *)v6 + 24))
    v2 = (void **)MEMORY[0x24BDBD270];
  else
    v2 = (void **)MEMORY[0x24BDBD268];
  v3 = *v2;
  _Block_object_dispose(&v5, 8);
  return v3;
}

uint64_t __54__SUScriptSegmentedControl_showsMoreListAutomatically__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl"), "showsMoreListAutomatically");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSString)style
{
  const __CFString *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  WebThreadRunOnMainThread();
  if (v5[3] == 1)
    v2 = CFSTR("body");
  else
    v2 = CFSTR("navigation");
  _Block_object_dispose(&v4, 8);
  return &v2->isa;
}

void *__33__SUScriptSegmentedControl_style__block_invoke(uint64_t a1)
{
  void *result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  result = (void *)objc_msgSend(*(id *)(a1 + 32), "storePageViewController");
  if (result)
  {
    result = (void *)objc_msgSend((id)objc_msgSend(result, "sectionGroup"), "style");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (id)tintColor
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
  v7 = __Block_byref_object_copy__34;
  v8 = __Block_byref_object_dispose__34;
  v9 = 0;
  WebThreadRunOnMainThread();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);
  return v2;
}

SUScriptColor *__37__SUScriptSegmentedControl_tintColor__block_invoke(uint64_t a1)
{
  SUScriptColor *result;

  result = (SUScriptColor *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl"), "tintColor");
  if (result)
  {
    result = -[SUScriptColor initWithUIColor:]([SUScriptColor alloc], "initWithUIColor:", result);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (int64_t)tintStyle
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

uint64_t __37__SUScriptSegmentedControl_tintStyle__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl"), "tintStyle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)controlStateDisabled
{
  return 2;
}

- (unint64_t)controlStateHighlighted
{
  return 1;
}

- (unint64_t)controlStateNormal
{
  return 0;
}

- (unint64_t)controlStateSelected
{
  return 4;
}

- (NSNumber)noSegmentIndex
{
  return (NSNumber *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -1);
}

- (int64_t)tintStyleDark
{
  return 1;
}

- (int64_t)tintStyleDefault
{
  return 0;
}

- (SUSegmentedControl)activeSegmentedControl
{
  SUSegmentedControl *result;

  result = -[SUScriptNativeObject object](-[SUScriptObject nativeObject](self, "nativeObject"), "object");
  if (!result)
  {
    result = -[SUStorePageViewController sectionSegmentedControl](-[SUScriptSegmentedControl storePageViewController](self, "storePageViewController"), "sectionSegmentedControl");
    if (!result)
      return -[SUScriptSegmentedControl nativeSegmentedControl](self, "nativeSegmentedControl");
  }
  return result;
}

- (NSArray)rawSegments
{
  return self->_segments;
}

- (SUStorePageViewController)storePageViewController
{
  SUStorePageViewController *v2;

  v2 = -[SUScriptNativeObject object](-[SUScriptObject nativeObject](-[SUScriptObject parentScriptObject](self, "parentScriptObject"), "nativeObject"), "object");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (id)_newNativeSegmentedControl
{
  id v3;

  v3 = -[SUScriptObject copyObjectForScriptFromPoolWithClass:](self, "copyObjectForScriptFromPoolWithClass:", objc_opt_class());
  objc_msgSend(v3, "setClientInterface:", -[SUScriptObject clientInterface](self, "clientInterface"));
  -[SUScriptSegmentedControl _reloadSegmentedControl:withSegments:](self, "_reloadSegmentedControl:withSegments:", v3, self->_segments);
  return v3;
}

- (id)_newPageSectionGroupWithSegments:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  SUPageSectionGroup *v12;
  int64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(a3);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "newPageSection");
        if (!v10)
        {
          v12 = 0;
          goto LABEL_13;
        }
        v11 = (void *)v10;
        objc_msgSend(v5, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = objc_alloc_init(SUPageSectionGroup);
  v13 = -[SUSegmentedControl selectedItemIndex](-[SUScriptSegmentedControl activeSegmentedControl](self, "activeSegmentedControl"), "selectedItemIndex");
  if (v13 != -1)
    -[SUPageSectionGroup setDefaultSectionIndex:](v12, "setDefaultSectionIndex:", v13);
  -[SUPageSectionGroup setSections:](v12, "setSections:", v5);
  -[SUPageSectionGroup setStyle:](v12, "setStyle:", self->_style);
LABEL_13:

  return v12;
}

- (id)_newSegmentsFromPageSectionGroup:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  SUScriptSegmentedControlItem *v10;
  SUScriptSegmentedControlItem *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = (void *)objc_msgSend(a3, "sections");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = -[SUScriptSegmentedControlItem initWithPageSection:]([SUScriptSegmentedControlItem alloc], "initWithPageSection:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
        if (v10)
        {
          v11 = v10;
          objc_msgSend(v4, "addObject:", v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  return v4;
}

- (void)_reloadSegmentedControl:(id)a3 withSegments:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(a4);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "image");
        if (!v12)
          v12 = objc_msgSend(v11, "title");
        objc_msgSend(v6, "addObject:", v12);
      }
      v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  objc_msgSend(a3, "setItems:", v6);

}

- (void)_reloadViewControllerPageSectionGroup
{
  SUStorePageViewController *v3;
  SUStorePageViewController *v4;
  id v5;

  v3 = -[SUScriptSegmentedControl storePageViewController](self, "storePageViewController");
  if (v3)
  {
    v4 = v3;
    v5 = -[SUScriptSegmentedControl _newPageSectionGroupWithSegments:](self, "_newPageSectionGroupWithSegments:", self->_segments);
    -[SUStorePageViewController reloadForSectionsWithGroup:](v4, "reloadForSectionsWithGroup:", v5);

  }
}

- (int64_t)_sectionsStyleForString:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("body"));
}

- (void)_setColor:(id)a3 forTitleTextAttribute:(id)a4 controlState:(unint64_t)a5
{
  SUScriptColor *v6;
  SUScriptColor *v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[SUScriptColor initWithStyleString:]([SUScriptColor alloc], "initWithStyleString:", a3);
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (SUScriptColor *)a3;
LABEL_5:
    v7 = v6;
    if (!a3)
      goto LABEL_10;
    goto LABEL_8;
  }
  v7 = 0;
  if (!a3)
  {
LABEL_10:
    WebThreadRunOnMainThread();
    goto LABEL_11;
  }
LABEL_8:
  if (v7)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
LABEL_11:

}

void __73__SUScriptSegmentedControl__setColor_forTitleTextAttribute_controlState___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl");
  v5 = (id)objc_msgSend((id)objc_msgSend(v2, "titleTextAttributesForState:", *(_QWORD *)(a1 + 56)), "mutableCopy");
  v3 = objc_msgSend(*(id *)(a1 + 40), "nativeColor");
  if (v3)
  {
    v4 = v3;
    if (!v5)
      v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v5, "setObject:forKey:", v4, *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(v5, "removeObjectForKey:", *(_QWORD *)(a1 + 48));
  }
  objc_msgSend(v2, "setTitleTextAttributes:forState:", v5, *(_QWORD *)(a1 + 56));

}

- (void)_setRawSegments:(id)a3
{
  NSArray *segments;
  NSArray *v6;
  NSArray *v7;

  segments = self->_segments;
  if (segments != a3)
  {
    if (segments)
    {
      -[SUScriptObject checkOutScriptObjects:](self, "checkOutScriptObjects:");
      v6 = self->_segments;
    }
    else
    {
      v6 = 0;
    }

    v7 = (NSArray *)a3;
    self->_segments = v7;
    if (v7)
      -[SUScriptObject checkInScriptObjects:](self, "checkInScriptObjects:", v7);
  }
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_46, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptSegmentedControl;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_37, 8);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptSegmentedControl;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptSegmentedControl;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_46, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_37 = (uint64_t)sel_hideMoreListAnimated_;
    unk_255186AB0 = CFSTR("hideMoreList");
    qword_255186AB8 = (uint64_t)sel_makeSegmentWithTitle_userInfo_;
    unk_255186AC0 = CFSTR("createSegment");
    qword_255186AC8 = (uint64_t)sel_setTitleColor_forControlState_;
    unk_255186AD0 = CFSTR("setTitleColor");
    qword_255186AD8 = (uint64_t)sel_setTitleShadowColor_forControlState_;
    unk_255186AE0 = CFSTR("setTitleShadowColor");
    qword_255186AE8 = (uint64_t)sel_showMoreListAnimated_;
    unk_255186AF0 = CFSTR("showMoreList");
    qword_255186AF8 = (uint64_t)sel_showPopoverController_fromSegmentIndex_animated_;
    unk_255186B00 = CFSTR("showPopOver");
    qword_255186B08 = (uint64_t)sel_titleColorForControlState_;
    unk_255186B10 = CFSTR("getTitleColor");
    qword_255186B18 = (uint64_t)sel_titleShadowColorForControlState_;
    unk_255186B20 = CFSTR("getTitleShadowColor");
    __KeyMapping_46 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("cancelButtonTitle"), CFSTR("maximumNumberOfItems"), CFSTR("maximumNumberOfItems"), CFSTR("maximumWidth"), CFSTR("maximumWidth"), CFSTR("moreListTitle"), CFSTR("moreListTitle"), CFSTR("segments"), CFSTR("segments"), CFSTR("selectedIndex"), CFSTR("selectedIndex"), CFSTR("selectedSegmentIndex"), CFSTR("selectedSegmentIndex"), CFSTR("showsMoreListAutomatically"), CFSTR("showsMoreListAutomatically"), CFSTR("style"), CFSTR("style"),
                        CFSTR("tintColor"),
                        CFSTR("tintColor"),
                        CFSTR("tintStyle"),
                        CFSTR("tintStyle"),
                        CFSTR("CONTROL_STATE_DISABLED"),
                        CFSTR("controlStateDisabled"),
                        CFSTR("CONTROL_STATE_HIGHLIGHTED"),
                        CFSTR("controlStateHighlighted"),
                        CFSTR("CONTROL_STATE_NORMAL"),
                        CFSTR("controlStateNormal"),
                        CFSTR("CONTROL_STATE_SELECTED"),
                        CFSTR("controlStateSelected"),
                        CFSTR("NO_SEGMENT_INDEX"),
                        CFSTR("noSegmentIndex"),
                        CFSTR("TINT_STYLE_DARK"),
                        CFSTR("tintStyleDark"),
                        CFSTR("TINT_STYLE_DEFAULT"),
                        CFSTR("tintStyleDefault"),
                        0);
  }
}

@end
