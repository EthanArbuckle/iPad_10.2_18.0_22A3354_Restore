@implementation UIBarButtonItemAppearance

- (_UIBarButtonItemData)_data
{
  return (_UIBarButtonItemData *)-[_UIBarAppearanceData markReadOnly](self->_data, "markReadOnly");
}

- (UIBarButtonItemAppearance)init
{
  return -[UIBarButtonItemAppearance initWithStyle:](self, "initWithStyle:", 0);
}

- (void)_updateToSupportBackIndicatorsCopyingIndicatorsAndFallbackFrom:(id)a3
{
  id WeakRetained;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_changeObserver);

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIBarButtonItemAppearance.m"), 311, CFSTR("This method must be called before a change observer is attached"));

  }
  v6 = -[_UIBarButtonItemData copyAsBackButtonDataWithIndicatorsAndFallbackFrom:](self->_data, "copyAsBackButtonDataWithIndicatorsAndFallbackFrom:", v8);
  -[UIBarButtonItemAppearance _updateDataTo:signal:](self, "_updateDataTo:signal:", v6, 0);

}

- (UIBarButtonItemAppearance)copy
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIBarButtonItemAppearance;
  return -[UIBarButtonItemAppearance copy](&v3, sel_copy);
}

- (UIBarButtonItemAppearance)initWithBarButtonItemAppearance:(id)a3
{
  id *v4;
  UIBarButtonItemAppearance *v5;
  uint64_t v6;
  _UIBarButtonItemData *data;

  v4 = (id *)a3;
  v5 = -[UIBarButtonItemAppearance initWithStyle:](self, "initWithStyle:", objc_msgSend(v4[2], "style"));
  if (v5)
  {
    v6 = objc_msgSend(v4[2], "copy");
    data = v5->_data;
    v5->_data = (_UIBarButtonItemData *)v6;

  }
  return v5;
}

- (UIBarButtonItemAppearance)initWithStyle:(UIBarButtonItemStyle)style
{
  UIBarButtonItemAppearance *v4;
  uint64_t v5;
  _UIBarButtonItemData *data;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIBarButtonItemAppearance;
  v4 = -[UIBarButtonItemAppearance init](&v8, sel_init);
  if (v4)
  {
    +[_UIBarButtonItemData standardItemDataForStyle:](_UIBarButtonItemData, "standardItemDataForStyle:", style);
    v5 = objc_claimAutoreleasedReturnValue();
    data = v4->_data;
    v4->_data = (_UIBarButtonItemData *)v5;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBarButtonItemAppearance:", self);
}

- (void)_updateDataTo:(id)a3 signal:(BOOL)a4
{
  _UIBarButtonItemData *v7;
  _UIBarButtonItemData *data;
  _UIBarButtonItemData *v9;
  uint64_t i;
  id WeakRetained;
  _UIBarButtonItemData *v12;

  v7 = (_UIBarButtonItemData *)a3;
  data = self->_data;
  if (data != v7)
  {
    v12 = v7;
    v9 = data;
    objc_storeStrong((id *)&self->_data, a3);
    for (i = 24; i != 56; i += 8)
      objc_msgSend(*(id *)((char *)&self->super.isa + i), "setData:", self->_data);
    if (a4)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_changeObserver);
      objc_msgSend(WeakRetained, "_barButtonItemAppearanceChangedItemData:toItemData:fromItemData:", self, self->_data, v9);

    }
    v7 = v12;
  }

}

- (void)_setChangeObserver:(id)a3
{
  objc_storeWeak((id *)&self->_changeObserver, a3);
}

- (void)_setFallback:(id)a3
{
  id v4;

  -[_UIBarButtonItemData dataWithNewFallback:](self->_data, "dataWithNewFallback:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItemAppearance _updateDataTo:signal:](self, "_updateDataTo:signal:", v4, 0);

}

- (void)dealloc
{
  uint64_t i;
  objc_super v4;

  for (i = 24; i != 56; i += 8)
    objc_msgSend(*(id *)((char *)&self->super.isa + i), "_clearOwner");
  v4.receiver = self;
  v4.super_class = (Class)UIBarButtonItemAppearance;
  -[UIBarButtonItemAppearance dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  uint64_t i;

  for (i = 48; i != 16; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_destroyWeak((id *)&self->_changeObserver);
}

- (void)_setBackIndicatorImage:(id)a3 transitionMaskImage:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__UIBarButtonItemAppearance__setBackIndicatorImage_transitionMaskImage___block_invoke;
  v10[3] = &unk_1E16B47A8;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[UIBarButtonItemAppearance _writeToStorage:](self, "_writeToStorage:", v10);

}

- (void)_writeToStorage:(id)a3
{
  _UIBarButtonItemData *data;
  void (**v5)(_QWORD);
  void *v6;
  id WeakRetained;

  data = self->_data;
  v5 = (void (**)(_QWORD))a3;
  -[_UIBarAppearanceData writableInstance](data, "writableInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItemAppearance _updateDataTo:signal:](self, "_updateDataTo:signal:", v6, 1);

  v5[2](v5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_changeObserver);
  objc_msgSend(WeakRetained, "_barButtonItemDataChanged:", self);

}

uint64_t __72__UIBarButtonItemAppearance__setBackIndicatorImage_transitionMaskImage___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "setBackIndicatorImage:transitionMaskImage:", a1[5], a1[6]);
}

- (UIBarButtonItemStateAppearance)normal
{
  return (UIBarButtonItemStateAppearance *)-[UIBarButtonItemAppearance _proxyForState:](self, "_proxyForState:", 0);
}

- (id)_proxyForState:(int64_t)a3
{
  UIBarButtonItemStateAppearance **states;
  UIBarButtonItemStateAppearance *v5;
  UIBarButtonItemStateAppearance *v7;
  UIBarButtonItemStateAppearance *v8;

  states = self->_states;
  v5 = self->_states[a3];
  if (!v5)
  {
    v7 = -[UIBarButtonItemStateAppearance _initWithOwner:data:state:]([UIBarButtonItemStateAppearance alloc], "_initWithOwner:data:state:", self, self->_data, a3);
    v8 = states[a3];
    states[a3] = v7;

    v5 = states[a3];
  }
  return v5;
}

- (UIBarButtonItemAppearance)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UIBarButtonItemAppearance *v5;
  uint64_t v6;
  _UIBarButtonItemData *data;
  uint64_t v8;
  _UIBarButtonItemData *v9;
  objc_super v11;

  v4 = coder;
  v11.receiver = self;
  v11.super_class = (Class)UIBarButtonItemAppearance;
  v5 = -[UIBarButtonItemAppearance init](&v11, sel_init);
  if (v5)
  {
    +[_UIBarButtonItemData decodeFromCoder:prefix:](_UIBarButtonItemData, "decodeFromCoder:prefix:", v4, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (_UIBarButtonItemData *)v6;

    if (!v5->_data)
    {
      +[_UIBarButtonItemData standardItemDataForStyle:](_UIBarButtonItemData, "standardItemDataForStyle:", 0);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v5->_data;
      v5->_data = (_UIBarButtonItemData *)v8;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  -[_UIBarButtonItemData encodeToCoder:prefix:](self->_data, "encodeToCoder:prefix:", a3, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIBarButtonItemAppearance;
  -[UIBarButtonItemAppearance description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[UIBarButtonItemAppearance _describeInto:](self, "_describeInto:", v4);
  return v4;
}

- (unint64_t)hash
{
  return -[_UIBarAppearanceData hash](self->_data, "hash");
}

- (BOOL)isEqual:(id)a3
{
  UIBarButtonItemAppearance *v4;
  id *p_isa;
  char v6;

  v4 = (UIBarButtonItemAppearance *)a3;
  p_isa = (id *)&v4->super.isa;
  if (self == v4)
  {
    v6 = 1;
  }
  else if (v4 && -[UIBarButtonItemAppearance isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v6 = objc_msgSend(p_isa[2], "isEqual:", self->_data);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_describeInto:(id)a3
{
  -[_UIBarButtonItemData describeInto:](self->_data, "describeInto:", a3);
}

- (void)_setData:(id)a3
{
  -[UIBarButtonItemAppearance _updateDataTo:signal:](self, "_updateDataTo:signal:", a3, 0);
}

- (_UIBarButtonItemDataFallback)_fallback
{
  return -[_UIBarButtonItemData fallback](self->_data, "fallback");
}

- (void)configureWithDefaultForStyle:(UIBarButtonItemStyle)style
{
  void *v5;
  id WeakRetained;
  id v7;

  if (-[_UIBarButtonItemData isBackButtonData](self->_data, "isBackButtonData"))
  {
    +[_UIBarButtonItemData standardBackButtonData](_UIBarButtonItemData, "standardBackButtonData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v5, "copyAsBackButtonDataWithIndicatorsAndFallbackFrom:", self->_data);

  }
  else
  {
    +[_UIBarButtonItemData standardItemDataForStyle:](_UIBarButtonItemData, "standardItemDataForStyle:", style);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[UIBarButtonItemAppearance _updateDataTo:signal:](self, "_updateDataTo:signal:", v7, 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_changeObserver);
  objc_msgSend(WeakRetained, "_barButtonItemDataChanged:", self);

}

- (UIBarButtonItemStateAppearance)highlighted
{
  return (UIBarButtonItemStateAppearance *)-[UIBarButtonItemAppearance _proxyForState:](self, "_proxyForState:", 1);
}

- (UIBarButtonItemStateAppearance)disabled
{
  return (UIBarButtonItemStateAppearance *)-[UIBarButtonItemAppearance _proxyForState:](self, "_proxyForState:", 2);
}

- (UIBarButtonItemStateAppearance)focused
{
  return (UIBarButtonItemStateAppearance *)-[UIBarButtonItemAppearance _proxyForState:](self, "_proxyForState:", 3);
}

- (void)_resetBackIndicatorImages
{
  id WeakRetained;

  -[_UIBarButtonItemData resetBackIndicatorImages](self->_data, "resetBackIndicatorImages");
  WeakRetained = objc_loadWeakRetained((id *)&self->_changeObserver);
  objc_msgSend(WeakRetained, "_barButtonItemDataChanged:", self);

}

- (_UIBarButtonItemAppearanceChangeObserver)_changeObserver
{
  return (_UIBarButtonItemAppearanceChangeObserver *)objc_loadWeakRetained((id *)&self->_changeObserver);
}

@end
