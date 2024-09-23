@implementation UIWebSelectSinglePicker

- (UIWebSelectSinglePicker)initWithDOMHTMLSelectElement:(id)a3 allItems:(id)a4
{
  UIWebSelectSinglePicker *v6;
  UIWebSelectSinglePicker *v7;
  NSArray *optionItems;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t i;
  UIWebSelectedItemPrivate *v14;
  int64_t selectedIndex;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)UIWebSelectSinglePicker;
  v6 = -[UIPickerView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    -[UIPickerView setDelegate:](v6, "setDelegate:", v6);
    -[UIPickerView setDataSource:](v7, "setDataSource:", v7);
    -[UIView setAutoresizingMask:](v7, "setAutoresizingMask:", 18);
    v7->_selectNode = (DOMHTMLSelectElement *)a3;
    v7->_optionItems = (NSArray *)a4;
    v7->_selectedOptionItem = 0;
    v7->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    v7->_optionToSelectWhenDone = 0;
    v7->_indexToSelectWhenDone = 0x7FFFFFFFFFFFFFFFLL;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    optionItems = v7->_optionItems;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](optionItems, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(optionItems);
          v14 = *(UIWebSelectedItemPrivate **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if ((-[UIWebSelectedItemPrivate isGroup](v14, "isGroup") & 1) == 0)
          {
            if (-[UIWebSelectedItemPrivate selected](v14, "selected"))
            {
              v7->_selectedOptionItem = v14;
              v7->_selectedIndex = v11;
              goto LABEL_14;
            }
            ++v11;
          }
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](optionItems, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_14:
    -[UIPickerView reloadAllComponents](v7, "reloadAllComponents");
    selectedIndex = v7->_selectedIndex;
    if (selectedIndex != 0x7FFFFFFFFFFFFFFFLL)
      -[UIPickerView selectRow:inComponent:animated:](v7, "selectRow:inComponent:animated:", selectedIndex, 0, 0);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[UIPickerView setDelegate:](self, "setDelegate:", 0);
  -[UIPickerView setDataSource:](self, "setDataSource:", 0);

  v3.receiver = self;
  v3.super_class = (Class)UIWebSelectSinglePicker;
  -[UIPickerView dealloc](&v3, sel_dealloc);
}

- (void)controlEndEditing
{
  UIWebSelectedItemPrivate *optionToSelectWhenDone;

  optionToSelectWhenDone = self->_optionToSelectWhenDone;
  if (optionToSelectWhenDone)
  {
    if (optionToSelectWhenDone != self->_selectedOptionItem)
    {
      WebThreadLock();
      -[UIWebSelectedItemPrivate unselect](self->_selectedOptionItem, "unselect");
      -[DOMHTMLSelectElement _activateItemAtIndex:](self->_selectNode, "_activateItemAtIndex:", LODWORD(self->_indexToSelectWhenDone));
      -[UIWebSelectedItemPrivate setSelected:](self->_optionToSelectWhenDone, "setSelected:", 1);
    }
  }
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return -[NSArray count](self->_optionItems, "count", a3, a4);
}

- (id)pickerView:(id)a3 attributedTitleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  void *v7;
  void *v8;
  void *v9;

  WebThreadLock();
  v7 = (void *)objc_msgSend(-[NSArray objectAtIndex:](self->_optionItems, "objectAtIndex:", a4), "node");
  v8 = (void *)objc_msgSend((id)objc_msgSend(v7, "text"), "_uikit_stringByTrimmingWhitespaceAndNewlines");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v8);
  if (objc_msgSend(v7, "disabled"))
    objc_msgSend(v9, "addAttribute:value:range:", *(_QWORD *)off_1E1678D98, +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.3), 0, objc_msgSend(v8, "length"));
  return v9;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  uint64_t v7;

  WebThreadLock();
  if (objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndex:](self->_optionItems, "objectAtIndex:", a4), "node"), "disabled"))
  {
    v7 = a4;
    while (v7 > 0)
    {
      if ((objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndex:](self->_optionItems, "objectAtIndex:", --v7), "node"), "disabled") & 1) == 0)
      {
LABEL_10:
        -[UIPickerView selectRow:inComponent:animated:](self, "selectRow:inComponent:animated:", v7, 0, 1);
        a4 = v7;
        goto LABEL_11;
      }
    }
    v7 = a4;
    while (++v7 < -[NSArray count](self->_optionItems, "count"))
    {
      if ((objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndex:](self->_optionItems, "objectAtIndex:", v7), "node"), "disabled") & 1) == 0)
      {
        if (v7 == 0x7FFFFFFFFFFFFFFFLL)
          return;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_11:
    self->_indexToSelectWhenDone = a4;
    self->_optionToSelectWhenDone = (UIWebSelectedItemPrivate *)-[NSArray objectAtIndex:](self->_optionItems, "objectAtIndex:", a4);
  }
}

@end
