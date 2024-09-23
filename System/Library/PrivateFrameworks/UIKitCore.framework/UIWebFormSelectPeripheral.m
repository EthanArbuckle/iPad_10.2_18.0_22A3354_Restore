@implementation UIWebFormSelectPeripheral

- (UIWebFormSelectPeripheral)initWithDOMHTMLSelectElement:(id)a3
{
  UIWebFormSelectPeripheral *v4;
  UIWebFormSelectPeripheral *v5;
  id v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  uint64_t v18;
  UIWebSelectPopover *v19;
  id v20;
  UIWebSelectSinglePicker *v21;
  id v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)UIWebFormSelectPeripheral;
  v4 = -[UIWebFormSelectPeripheral init](&v24, sel_init);
  v5 = v4;
  if (v4)
  {
    v23 = a3;
    -[UIWebFormSelectPeripheral set_selectionNode:](v4, "set_selectionNode:", a3);
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    WebThreadLock();
    v7 = -[DOMHTMLSelectElement multiple](v5->_selectionNode, "multiple");
    v8 = -[DOMHTMLSelectElement completeLength](v5->_selectionNode, "completeLength");
    if (v8)
    {
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0x7FFFFFFFFFFFFFFFLL;
      v13 = v8;
      do
      {
        v14 = (void *)objc_msgSend((id)-[DOMHTMLSelectElement listItemAtIndex:](v5->_selectionNode, "listItemAtIndex:", v9), "createSelectedItem");
        if (v14)
        {
          v15 = v14;
          v16 = objc_msgSend(v14, "isGroup");
          if ((v7 & 1) == 0)
          {
            v17 = objc_msgSend(v15, "selected");
            if (v12 == 0x7FFFFFFFFFFFFFFFLL)
              v18 = v9;
            else
              v18 = v12;
            if (v17)
            {
              v12 = v18;
              v11 = v15;
            }
          }
          v10 |= v16;
          objc_msgSend(v6, "addObject:", v15);
        }
        ++v9;
      }
      while (v13 != v9);
    }
    else
    {
      v11 = 0;
      v10 = 0;
      v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if ((-[UIDevice userInterfaceIdiom](+[UIDevice currentDevice](UIDevice, "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v19 = [UIWebSelectPopover alloc];
      v20 = v23;
    }
    else
    {
      if (((v7 | v10) & 1) == 0)
      {
        v21 = -[UIWebSelectSinglePicker initWithDOMHTMLSelectElement:allItems:]([UIWebSelectSinglePicker alloc], "initWithDOMHTMLSelectElement:allItems:", v23, v6);
        goto LABEL_21;
      }
      v19 = [UIWebSelectMultiplePicker alloc];
      v20 = v23;
    }
    v21 = -[UIWebSelectPopover initWithDOMHTMLSelectElement:cachedItems:singleSelectionItem:singleSelectionIndex:multipleSelection:](v19, "initWithDOMHTMLSelectElement:cachedItems:singleSelectionItem:singleSelectionIndex:multipleSelection:", v20, v6, v11, v12, v7);
LABEL_21:
    -[UIWebFormSelectPeripheral set_selectControl:](v5, "set_selectControl:", v21);
  }
  return v5;
}

+ (id)createPeripheralWithDOMHTMLSelectElement:(id)a3
{
  return -[UIWebFormSelectPeripheral initWithDOMHTMLSelectElement:]([UIWebFormSelectPeripheral alloc], "initWithDOMHTMLSelectElement:", a3);
}

- (void)dealloc
{
  objc_super v3;

  -[UIWebFormSelectPeripheral set_selectionNode:](self, "set_selectionNode:", 0);
  -[UIWebFormSelectPeripheral set_selectControl:](self, "set_selectControl:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIWebFormSelectPeripheral;
  -[UIWebFormSelectPeripheral dealloc](&v3, sel_dealloc);
}

- (id)assistantView
{
  return (id)-[UIWebFormControl controlView](self->_selectControl, "controlView");
}

- (void)beginEditing
{
  -[UIWebFormControl controlBeginEditing](self->_selectControl, "controlBeginEditing");
}

- (void)endEditing
{
  -[UIWebFormControl controlEndEditing](self->_selectControl, "controlEndEditing");
}

- (DOMHTMLSelectElement)_selectionNode
{
  return self->_selectionNode;
}

- (void)set_selectionNode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (UIWebFormControl)_selectControl
{
  return self->_selectControl;
}

- (void)set_selectControl:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
