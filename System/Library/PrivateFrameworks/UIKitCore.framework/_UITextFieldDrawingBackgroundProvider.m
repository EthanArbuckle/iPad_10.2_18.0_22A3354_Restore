@implementation _UITextFieldDrawingBackgroundProvider

- (_UITextFieldDrawingBackgroundProvider)init
{
  _UITextFieldDrawingBackgroundProvider *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UITextFieldDrawingBackgroundProvider;
  result = -[_UITextFieldDrawingBackgroundProvider init](&v3, sel_init);
  if (result)
    *((_BYTE *)&result->_flags + 1) = 1;
  return result;
}

- (void)setDrawsContent:(BOOL)a3
{
  *(_BYTE *)&self->_flags &= ~1u;
  -[_UITextFieldDrawingBackgroundProvider _setDrawsContent:](self, "_setDrawsContent:", a3);
}

- (void)_setDrawsContent:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  id v6;

  *(_BYTE *)&self->_flags &= ~1u;
  if (*((_BYTE *)&self->_flags + 1) != a3)
  {
    v3 = a3;
    *((_BYTE *)&self->_flags + 1) = a3;
    -[_UITextFieldBackgroundProvider textField](self, "textField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    if (v3)
    {
      objc_msgSend(v4, "setNeedsDisplay");
    }
    else
    {
      objc_msgSend(v4, "layer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setContents:", 0);

    }
  }
}

- (void)setDrawsContentBasedOnTraitsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  id v7;

  -[_UITextFieldBackgroundProvider textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_flags & 1) != 0 && v3)
  {
    v7 = v3;
    objc_msgSend(v3, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v6 = objc_msgSend(v4, "userInterfaceIdiom") != 2;
    else
      v6 = 1;
    -[_UITextFieldDrawingBackgroundProvider setDrawsContent:](self, "setDrawsContent:", v6);

    v3 = v7;
  }

}

- (void)addToTextField:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UITextFieldDrawingBackgroundProvider;
  -[_UITextFieldBackgroundProvider addToTextField:](&v5, sel_addToTextField_, v4);
  -[_UITextFieldDrawingBackgroundProvider setDrawsContentBasedOnTraitsIfNeeded](self, "setDrawsContentBasedOnTraitsIfNeeded");
  if (-[_UITextFieldDrawingBackgroundProvider drawsContent](self, "drawsContent"))
    objc_msgSend(v4, "setNeedsDisplay");

}

- (void)removeFromTextField
{
  void *v3;
  void *v4;
  objc_super v5;

  if (-[_UITextFieldDrawingBackgroundProvider drawsContent](self, "drawsContent"))
  {
    -[_UITextFieldBackgroundProvider textField](self, "textField");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setContents:", 0);

  }
  v5.receiver = self;
  v5.super_class = (Class)_UITextFieldDrawingBackgroundProvider;
  -[_UITextFieldBackgroundProvider removeFromTextField](&v5, sel_removeFromTextField);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UITextFieldDrawingBackgroundProvider;
  -[_UITextFieldBackgroundProvider traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[_UITextFieldDrawingBackgroundProvider setDrawsContentBasedOnTraitsIfNeeded](self, "setDrawsContentBasedOnTraitsIfNeeded");
}

- (void)drawInBounds:(CGRect)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54___UITextFieldDrawingBackgroundProvider_drawInBounds___block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  if (drawInBounds__once != -1)
    dispatch_once(&drawInBounds__once, block);
}

- (void)setNeedsDisplay
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UITextFieldDrawingBackgroundProvider;
  -[_UITextFieldBackgroundProvider setNeedsDisplay](&v4, sel_setNeedsDisplay);
  -[_UITextFieldBackgroundProvider textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsDisplay");

}

- (void)_buildDescription:(id)a3
{
  id v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UITextFieldDrawingBackgroundProvider;
  -[_UITextFieldBackgroundProvider _buildDescription:](&v9, sel__buildDescription_, v4);
  if (*((_BYTE *)&self->_flags + 1))
    v5 = CFSTR("yes");
  else
    v5 = CFSTR("no");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v6 = CFSTR(", based on traits");
  else
    v6 = &stru_1E16EDF20;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendName:object:", CFSTR("drawsContent"), v7);

}

- (BOOL)drawsContent
{
  return *((_BYTE *)&self->_flags + 1);
}

@end
