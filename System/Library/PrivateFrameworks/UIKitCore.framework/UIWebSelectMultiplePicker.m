@implementation UIWebSelectMultiplePicker

- (UIWebSelectMultiplePicker)initWithDOMHTMLSelectElement:(id)a3 cachedItems:(id)a4 singleSelectionItem:(id)a5 singleSelectionIndex:(unint64_t)a6 multipleSelection:(BOOL)a7
{
  _BOOL8 v7;
  UIWebSelectMultiplePicker *v12;
  UIWebSelectMultiplePicker *v13;
  unint64_t singleSelectionIndex;
  uint64_t v16;
  objc_super v17;

  v7 = a7;
  v17.receiver = self;
  v17.super_class = (Class)UIWebSelectMultiplePicker;
  v12 = -[UIPickerView initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v13 = v12;
  if (v12)
  {
    -[UIView setAutoresizingMask:](v12, "setAutoresizingMask:", 18);
    -[UIPickerView setDataSource:](v13, "setDataSource:", v13);
    -[UIPickerView setDelegate:](v13, "setDelegate:", v13);
    -[UIPickerView _setUsesCheckedSelection:](v13, "_setUsesCheckedSelection:", 1);
    -[UIPickerView _setMagnifierEnabled:](v13, "_setMagnifierEnabled:", 0);
    -[UIWebSelectMultiplePicker set_selectionNode:](v13, "set_selectionNode:", a3);
    -[UIWebSelectMultiplePicker set_cachedItems:](v13, "set_cachedItems:", a4);
    -[UIWebSelectMultiplePicker set_singleSelectionItem:](v13, "set_singleSelectionItem:", a5);
    v13->_singleSelectionIndex = a6;
    v16 = 0;
    objc_msgSend(a3, "getTextWritingDirection:override:", &v16, 0);
    v13->_textAlignment = 2 * (v16 != 0);
    -[UIPickerView setAllowsMultipleSelection:](v13, "setAllowsMultipleSelection:", v7);
    +[UIKeyboard defaultSizeForInterfaceOrientation:](UIKeyboard, "defaultSizeForInterfaceOrientation:", objc_msgSend((id)UIApp, "_defaultSceneInterfaceOrientationReturningUnknownForNilScene:", 0));
    -[UIView setSize:](v13, "setSize:");
    -[UIPickerView reloadAllComponents](v13, "reloadAllComponents");
    singleSelectionIndex = v13->_singleSelectionIndex;
    if (singleSelectionIndex != 0x7FFFFFFFFFFFFFFFLL)
      -[UIPickerView selectRow:inComponent:animated:](v13, "selectRow:inComponent:animated:", singleSelectionIndex, 0, 0);
  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[UIPickerView setDataSource:](self, "setDataSource:", 0);
  -[UIPickerView setDelegate:](self, "setDelegate:", 0);
  -[UIWebSelectMultiplePicker set_selectionNode:](self, "set_selectionNode:", 0);
  -[UIWebSelectMultiplePicker set_cachedItems:](self, "set_cachedItems:", 0);
  -[UIWebSelectMultiplePicker set_singleSelectionItem:](self, "set_singleSelectionItem:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIWebSelectMultiplePicker;
  -[UIPickerView dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  _BOOL4 v3;
  unint64_t singleSelectionIndex;
  double layoutWidth;
  double v6;
  double v7;
  objc_super v8;

  v3 = -[UIPickerView _needsLayout](self, "_needsLayout");
  v8.receiver = self;
  v8.super_class = (Class)UIWebSelectMultiplePicker;
  -[UIPickerView layoutSubviews](&v8, sel_layoutSubviews);
  if (v3)
  {
    singleSelectionIndex = self->_singleSelectionIndex;
    if (singleSelectionIndex != 0x7FFFFFFFFFFFFFFFLL)
      -[UIPickerView selectRow:inComponent:animated:](self, "selectRow:inComponent:animated:", singleSelectionIndex, 0, 0);
  }
  layoutWidth = self->_layoutWidth;
  -[UIView frame](self, "frame");
  if (layoutWidth != v6)
  {
    -[UIPickerView reloadAllComponents](self, "reloadAllComponents");
    -[UIView frame](self, "frame");
    self->_layoutWidth = v7;
  }
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;

  WebThreadLock();
  v9 = (void *)objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndex:](self->_cachedItems, "objectAtIndex:", a4), "node"), "createPickerCell");
  -[UIPickerView _contentSizeForRow:inComponent:](self, "_contentSizeForRow:inComponent:", a4, a5);
  v11 = v10;
  v13 = v12;
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, v10, v12);
  v14 = (void *)objc_msgSend(v9, "titleLabel");
  objc_msgSend(v9, "labelWidthForBounds:", 0.0, 0.0, v11, v13);
  v16 = v15;
  v17 = (void *)objc_msgSend(v14, "font");
  if (v16 != self->_maximumTextWidth || self->_fontSize == 0.0)
  {
    self->_maximumTextWidth = v16;
    objc_msgSend((id)objc_msgSend(v14, "font"), "pointSize");
    self->_fontSize = adjustedFontSize((uint64_t)v17, self->_cachedItems, v16, v18);
  }
  objc_msgSend(v14, "setFont:", objc_msgSend(v17, "fontWithSize:"));
  objc_msgSend(v14, "setLineBreakMode:", 0);
  objc_msgSend(v14, "setNumberOfLines:", 2);
  objc_msgSend(v14, "setTextAlignment:", self->_textAlignment);
  return v9;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return -[NSArray count](self->_cachedItems, "count", a3, a4);
}

- (int)_itemIndexForRowIndex:(int)a3
{
  unint64_t v4;
  unint64_t v5;
  int v6;

  v4 = 0;
  v5 = a3;
  v6 = -1;
  do
    v6 += objc_msgSend(-[NSArray objectAtIndex:](self->_cachedItems, "objectAtIndex:", v4++), "isGroup") ^ 1;
  while (v4 <= v5);
  return v6;
}

- (void)pickerView:(id)a3 row:(int)a4 column:(int)a5 checked:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  id v9;

  v6 = a6;
  v7 = *(_QWORD *)&a4;
  WebThreadLock();
  v9 = -[NSArray objectAtIndex:](self->_cachedItems, "objectAtIndex:", (int)v7);
  if (-[UIPickerView allowsMultipleSelection](self, "allowsMultipleSelection"))
  {
    -[DOMHTMLSelectElement _activateItemAtIndex:allowMultipleSelection:](-[UIWebSelectMultiplePicker _selectionNode](self, "_selectionNode"), "_activateItemAtIndex:allowMultipleSelection:", -[UIWebSelectMultiplePicker _itemIndexForRowIndex:](self, "_itemIndexForRowIndex:", v7), 1);
  }
  else
  {
    -[UIWebSelectedItemPrivate unselect](self->_singleSelectionItem, "unselect");
    -[UIWebSelectMultiplePicker set_singleSelectionItem:](self, "set_singleSelectionItem:", v9);
    self->_singleSelectionIndex = (int)v7;
    if (!v6)
      return;
    -[DOMHTMLSelectElement _activateItemAtIndex:](-[UIWebSelectMultiplePicker _selectionNode](self, "_selectionNode"), "_activateItemAtIndex:", -[UIWebSelectMultiplePicker _itemIndexForRowIndex:](self, "_itemIndexForRowIndex:", v7));
  }
  objc_msgSend(v9, "setSelected:", v6);
}

- (DOMHTMLSelectElement)_selectionNode
{
  return self->_selectionNode;
}

- (void)set_selectionNode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 552);
}

- (NSArray)_cachedItems
{
  return self->_cachedItems;
}

- (void)set_cachedItems:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 560);
}

- (UIWebSelectedItemPrivate)_singleSelectionItem
{
  return self->_singleSelectionItem;
}

- (void)set_singleSelectionItem:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 568);
}

@end
