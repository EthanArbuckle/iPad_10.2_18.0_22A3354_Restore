@implementation _UIDocumentPickerNavigationItem

- (_UIDocumentPickerNavigationItem)initWithTitle:(id)a3 rightBarButtonItem:(id)a4
{
  _UIDocumentPickerNavigationItem *v5;
  objc_super v7;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)_UIDocumentPickerNavigationItem;
  v5 = -[UINavigationItem initWithTitle:](&v8, sel_initWithTitle_, a3);
  if (v5)
  {
    v9[0] = a4;
    v7.receiver = v5;
    v7.super_class = (Class)_UIDocumentPickerNavigationItem;
    -[UINavigationItem setRightBarButtonItems:animated:](&v7, sel_setRightBarButtonItems_animated_, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1), 0);
  }
  return v5;
}

- (void)setLeftBarButtonItems:(id)a3 animated:(BOOL)a4
{
  WarnSetterIsNoop((uint64_t)a2);
}

- (void)setRightBarButtonItems:(id)a3 animated:(BOOL)a4
{
  WarnSetterIsNoop((uint64_t)a2);
}

- (void)setLeftBarButtonItem:(id)a3 animated:(BOOL)a4
{
  WarnSetterIsNoop((uint64_t)a2);
}

- (void)setRightBarButtonItem:(id)a3 animated:(BOOL)a4
{
  WarnSetterIsNoop((uint64_t)a2);
}

@end
