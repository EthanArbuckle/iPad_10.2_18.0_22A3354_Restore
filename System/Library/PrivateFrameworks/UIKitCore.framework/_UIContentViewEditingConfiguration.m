@implementation _UIContentViewEditingConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = objc_msgSend(self->_shouldBeginHandler, "copy");
    v6 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v5;

    v7 = objc_msgSend(self->_shouldChangeHandler, "copy");
    v8 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v7;

    v9 = objc_msgSend(self->_shouldEndHandler, "copy");
    v10 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v9;

    v11 = objc_msgSend(self->_didEndHandler, "copy");
    v12 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v11;

    *(_BYTE *)(v4 + 8) = self->_useTextInputAsLabel;
    *(_BYTE *)(v4 + 9) = self->_selectAllTextWhenEditingBegins;
  }
  return (id)v4;
}

- (_UIContentViewEditingConfiguration)initWithDidEndHandler:(id)a3
{
  id v5;
  _UIContentViewEditingConfiguration *v6;
  uint64_t v7;
  id didEndHandler;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIContentViewEditingConfiguration.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endHandler"));

  }
  v11.receiver = self;
  v11.super_class = (Class)_UIContentViewEditingConfiguration;
  v6 = -[_UIContentViewEditingConfiguration init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    didEndHandler = v6->_didEndHandler;
    v6->_didEndHandler = (id)v7;

    v6->_selectAllTextWhenEditingBegins = 1;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _UIContentViewEditingConfiguration *v4;
  _UIContentViewEditingConfiguration *v5;
  _UIContentViewEditingConfiguration *v6;

  v4 = (_UIContentViewEditingConfiguration *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(self) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (self)
      LOBYTE(self) = (self->_didEndHandler != 0) != (v6->_didEndHandler == 0)
                  && (self->_shouldBeginHandler != 0) != (v6->_shouldBeginHandler == 0)
                  && (self->_shouldChangeHandler != 0) != (v6->_shouldChangeHandler == 0)
                  && (self->_shouldEndHandler != 0) != (v6->_shouldEndHandler == 0)
                  && self->_useTextInputAsLabel == v6->_useTextInputAsLabel
                  && self->_selectAllTextWhenEditingBegins == v6->_selectAllTextWhenEditingBegins;

  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (BOOL)useTextInputAsLabel
{
  return self->_useTextInputAsLabel;
}

- (void)setUseTextInputAsLabel:(BOOL)a3
{
  self->_useTextInputAsLabel = a3;
}

- (BOOL)selectAllTextWhenEditingBegins
{
  return self->_selectAllTextWhenEditingBegins;
}

- (void)setSelectAllTextWhenEditingBegins:(BOOL)a3
{
  self->_selectAllTextWhenEditingBegins = a3;
}

- (id)didEndHandler
{
  return self->_didEndHandler;
}

- (id)shouldBeginHandler
{
  return self->_shouldBeginHandler;
}

- (void)setShouldBeginHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)shouldChangeHandler
{
  return self->_shouldChangeHandler;
}

- (void)setShouldChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)shouldEndHandler
{
  return self->_shouldEndHandler;
}

- (void)setShouldEndHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shouldEndHandler, 0);
  objc_storeStrong(&self->_shouldChangeHandler, 0);
  objc_storeStrong(&self->_shouldBeginHandler, 0);
  objc_storeStrong(&self->_didEndHandler, 0);
}

@end
