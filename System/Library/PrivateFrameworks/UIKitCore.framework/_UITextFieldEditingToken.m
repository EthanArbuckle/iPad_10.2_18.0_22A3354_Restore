@implementation _UITextFieldEditingToken

- (_UITextFieldEditingToken)initWithTextStorage:(id)a3 attributeNames:(id)a4
{
  id v6;
  id v7;
  _UITextFieldEditingToken *v8;
  _UITextFieldEditingToken *v9;
  uint64_t v10;
  NSArray *attributeNames;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UITextFieldEditingToken;
  v8 = -[_UITextFieldEditingToken init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_textStorage, v6);
    v10 = objc_msgSend(v7, "copy");
    attributeNames = v9->_attributeNames;
    v9->_attributeNames = (NSArray *)v10;

  }
  return v9;
}

- (BOOL)endEditing
{
  NSUInteger v3;
  char flags;
  id WeakRetained;
  uint64_t v6;
  id v7;
  char v8;
  id v9;

  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v3 = -[NSArray count](self->_attributeNames, "count");
    if (v3)
    {
      flags = (char)self->_flags;
      *(_BYTE *)&self->_flags = flags | 4;
      if ((flags & 1) != 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_textStorage);
        v6 = objc_msgSend(WeakRetained, "length");

        if (v6)
        {
          v7 = objc_loadWeakRetained((id *)&self->_textStorage);
          objc_msgSend(v7, "coordinateAccess:", &__block_literal_global_569);

        }
      }
      v8 = (char)self->_flags;
      if ((v8 & 2) != 0)
      {
        v9 = objc_loadWeakRetained((id *)&self->_textStorage);
        objc_msgSend(v9, "coordinateAccess:", &__block_literal_global_20_6);

        v8 = (char)self->_flags;
      }
      LOBYTE(v3) = (v8 & 3) != 0;
    }
  }
  return v3;
}

- (BOOL)restoreTextAttributes
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)setRestoreTextAttributes:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)restoreDefaultAttributes
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)setRestoreDefaultAttributes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (_UICascadingTextStorage)textStorage
{
  return (_UICascadingTextStorage *)objc_loadWeakRetained((id *)&self->_textStorage);
}

- (NSArray)attributeNames
{
  return self->_attributeNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeNames, 0);
  objc_destroyWeak((id *)&self->_textStorage);
}

@end
