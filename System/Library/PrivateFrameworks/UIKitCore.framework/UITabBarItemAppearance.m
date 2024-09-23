@implementation UITabBarItemAppearance

- (_UITabBarItemData)_data
{
  return (_UITabBarItemData *)-[_UIBarAppearanceData markReadOnly](self->_data, "markReadOnly");
}

- (id)_initWithTabBarItemData:(id)a3
{
  id v4;
  UITabBarItemAppearance *v5;
  uint64_t v6;
  _UITabBarItemData *data;

  v4 = a3;
  v5 = -[UITabBarItemAppearance init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    data = v5->_data;
    v5->_data = (_UITabBarItemData *)v6;

  }
  return v5;
}

- (UITabBarItemAppearance)init
{
  return -[UITabBarItemAppearance initWithStyle:](self, "initWithStyle:", 0);
}

- (UITabBarItemAppearance)initWithStyle:(UITabBarItemAppearanceStyle)style
{
  UITabBarItemAppearance *v4;
  uint64_t v5;
  _UITabBarItemData *data;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UITabBarItemAppearance;
  v4 = -[UITabBarItemAppearance init](&v8, sel_init);
  if (v4)
  {
    +[_UITabBarItemData standardItemDataForStyle:](_UITabBarItemData, "standardItemDataForStyle:", style);
    v5 = objc_claimAutoreleasedReturnValue();
    data = v4->_data;
    v4->_data = (_UITabBarItemData *)v5;

  }
  return v4;
}

- (void)_setOwningAppearance:(id)a3
{
  objc_storeWeak((id *)&self->_owningAppearance, a3);
}

- (void)dealloc
{
  uint64_t i;
  objc_super v4;

  for (i = 8; i != 48; i += 8)
    objc_msgSend(*(id *)((char *)&self->super.isa + i), "_clearOwner");
  v4.receiver = self;
  v4.super_class = (Class)UITabBarItemAppearance;
  -[UITabBarItemAppearance dealloc](&v4, sel_dealloc);
}

- (UITabBarItemStateAppearance)selected
{
  return (UITabBarItemStateAppearance *)-[UITabBarItemAppearance _proxyForState:](self, "_proxyForState:", 2);
}

- (UITabBarItemStateAppearance)normal
{
  return (UITabBarItemStateAppearance *)-[UITabBarItemAppearance _proxyForState:](self, "_proxyForState:", 0);
}

- (void).cxx_destruct
{
  uint64_t v3;

  objc_destroyWeak((id *)&self->_owningAppearance);
  objc_storeStrong((id *)&self->_data, 0);
  v3 = 40;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

- (void)_writeToStorage:(id)a3
{
  _UITabBarItemData *data;
  void (**v5)(_QWORD);
  void *v6;
  id WeakRetained;

  data = self->_data;
  v5 = (void (**)(_QWORD))a3;
  -[_UIBarAppearanceData writableInstance](data, "writableInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITabBarItemAppearance _updateDataTo:](self, "_updateDataTo:", v6);

  v5[2](v5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_owningAppearance);
  objc_msgSend(WeakRetained, "_tabBarItemDataChanged:", self);

}

- (void)_updateDataTo:(id)a3
{
  _UITabBarItemData *v5;
  _UITabBarItemData *data;
  _UITabBarItemData *v7;
  uint64_t i;
  _UITabBarItemData *v9;

  v5 = (_UITabBarItemData *)a3;
  data = self->_data;
  if (data != v5)
  {
    v9 = v5;
    v7 = data;
    objc_storeStrong((id *)&self->_data, a3);
    for (i = 8; i != 48; i += 8)
      objc_msgSend(*(id *)((char *)&self->super.isa + i), "_setData:", self->_data);

    v5 = v9;
  }

}

- (BOOL)isEqual:(id)a3
{
  UITabBarItemAppearance *v4;
  id *p_isa;
  char v6;

  v4 = (UITabBarItemAppearance *)a3;
  p_isa = (id *)&v4->super.isa;
  if (self == v4)
  {
    v6 = 1;
  }
  else if (v4 && -[UITabBarItemAppearance isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v6 = objc_msgSend(p_isa[6], "isEqual:", self->_data);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_proxyForState:(int64_t)a3
{
  UITabBarItemStateAppearance **states;
  UITabBarItemStateAppearance *v5;
  UITabBarItemStateAppearance *v7;
  UITabBarItemStateAppearance *v8;

  states = self->_states;
  v5 = self->_states[a3];
  if (!v5)
  {
    v7 = -[UITabBarItemStateAppearance _initWithOwner:data:state:]([UITabBarItemStateAppearance alloc], "_initWithOwner:data:state:", self, self->_data, a3);
    v8 = states[a3];
    states[a3] = v7;

    v5 = states[a3];
  }
  return v5;
}

- (UITabBarItemAppearance)initWithTabBarItemAppearance:(id)a3
{
  return (UITabBarItemAppearance *)-[UITabBarItemAppearance _initWithTabBarItemData:](self, "_initWithTabBarItemData:", *((_QWORD *)a3 + 6));
}

- (UITabBarItemAppearance)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UITabBarItemAppearance *v5;
  uint64_t v6;
  _UITabBarItemData *data;
  objc_super v9;

  v4 = coder;
  v9.receiver = self;
  v9.super_class = (Class)UITabBarItemAppearance;
  v5 = -[UITabBarItemAppearance init](&v9, sel_init);
  if (v5)
  {
    +[_UITabBarItemData decodeFromCoder:prefix:](_UITabBarItemData, "decodeFromCoder:prefix:", v4, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (_UITabBarItemData *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  -[_UITabBarItemData encodeToCoder:prefix:](self->_data, "encodeToCoder:prefix:", a3, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UITabBarItemAppearance)copy
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UITabBarItemAppearance;
  return -[UITabBarItemAppearance copy](&v3, sel_copy);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTabBarItemAppearance:", self);
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITabBarItemAppearance;
  -[UITabBarItemAppearance description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[UITabBarItemAppearance _describeInto:](self, "_describeInto:", v4);
  return v4;
}

- (unint64_t)hash
{
  return -[_UIBarAppearanceData hash](self->_data, "hash");
}

- (void)_describeInto:(id)a3
{
  -[_UITabBarItemData describeInto:](self->_data, "describeInto:", a3);
}

- (UITabBarItemStateAppearance)highlighted
{
  return (UITabBarItemStateAppearance *)-[UITabBarItemAppearance _proxyForState:](self, "_proxyForState:", 1);
}

- (UITabBarItemStateAppearance)disabled
{
  return (UITabBarItemStateAppearance *)-[UITabBarItemAppearance _proxyForState:](self, "_proxyForState:", 3);
}

- (UITabBarItemStateAppearance)focused
{
  return (UITabBarItemStateAppearance *)-[UITabBarItemAppearance _proxyForState:](self, "_proxyForState:", 4);
}

- (void)configureWithDefaultForStyle:(UITabBarItemAppearanceStyle)style
{
  void *v4;
  id WeakRetained;

  +[_UITabBarItemData standardItemDataForStyle:](_UITabBarItemData, "standardItemDataForStyle:", style);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITabBarItemAppearance _updateDataTo:](self, "_updateDataTo:", v4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_owningAppearance);
  objc_msgSend(WeakRetained, "_tabBarItemDataChanged:", self);

}

- (void)_setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (UITabBarAppearance)_owningAppearance
{
  return (UITabBarAppearance *)objc_loadWeakRetained((id *)&self->_owningAppearance);
}

@end
