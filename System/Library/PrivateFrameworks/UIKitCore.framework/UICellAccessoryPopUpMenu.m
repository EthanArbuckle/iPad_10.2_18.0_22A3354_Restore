@implementation UICellAccessoryPopUpMenu

- (UICellAccessoryPopUpMenu)initWithMenu:(UIMenu *)menu
{
  UIMenu *v5;
  UICellAccessoryPopUpMenu *v6;
  uint64_t v7;
  UIMenu *v8;
  void *v10;
  objc_super v11;

  v5 = menu;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICellAccessory.m"), 641, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("menu != nil"));

  }
  v11.receiver = self;
  v11.super_class = (Class)UICellAccessoryPopUpMenu;
  v6 = -[UICellAccessory init](&v11, sel_init);
  if (v6)
  {
    v7 = -[UIMenu copy](v5, "copy");
    v8 = v6->_menu;
    v6->_menu = (UIMenu *)v7;

    -[UICellAccessory setReservedLayoutWidth:](v6, "setReservedLayoutWidth:", 0.0);
  }

  return v6;
}

- (UIMenu)menu
{
  return (UIMenu *)(id)-[UIMenu copy](self->_menu, "copy");
}

- (UIMenu)_internalMenu
{
  return self->_menu;
}

- (int64_t)_systemType
{
  return 10;
}

- (int64_t)_systemTypePlacementForHeader:(BOOL)a3
{
  return 204;
}

- (id)_identifier
{
  return CFSTR("PopUpMenu");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UICellAccessoryPopUpMenu)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  void *v5;
  UICellAccessoryPopUpMenu *v6;
  UICellAccessoryPopUpMenu *v7;
  objc_super v9;

  v4 = coder;
  -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("menu"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v9.receiver = self;
    v9.super_class = (Class)UICellAccessoryPopUpMenu;
    v6 = -[UICellAccessory initWithCoder:](&v9, sel_initWithCoder_, v4);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_menu, v5);
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UICellAccessoryPopUpMenu;
  v4 = a3;
  -[UICellAccessory encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_menu, CFSTR("menu"), v5.receiver, v5.super_class);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UICellAccessoryPopUpMenu;
  v4 = -[UICellAccessory copyWithZone:](&v10, sel_copyWithZone_, a3);
  if (v4)
  {
    v5 = -[UIMenu copy](self->_menu, "copy");
    v6 = (void *)v4[6];
    v4[6] = v5;

    v7 = objc_msgSend(self->_selectedElementDidChangeHandler, "copy");
    v8 = (void *)v4[7];
    v4[7] = v7;

  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  UIMenu *v7;
  UIMenu *v8;
  UIMenu *v9;
  BOOL v10;
  BOOL v11;
  _BOOL4 v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UICellAccessoryPopUpMenu;
  if (-[UICellAccessory isEqual:](&v14, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = (void *)v5[6];
    v7 = self->_menu;
    v8 = v6;
    if (v7 != v8)
    {
      v9 = v8;
      if (v7)
        v10 = v8 == 0;
      else
        v10 = 1;
      if (v10)
      {

      }
      else
      {
        v12 = -[UIMenu isEqual:](v7, "isEqual:", v8);

        if (v12)
          goto LABEL_12;
      }
      v11 = 0;
      goto LABEL_14;
    }

LABEL_12:
    v11 = self->_selectedElementDidChangeHandler == (id)v5[7];
LABEL_14:

    goto LABEL_15;
  }
  v11 = 0;
LABEL_15:

  return v11;
}

- (BOOL)_canDirectlyUpdateExistingAccessoryViewFrom:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UICellAccessoryPopUpMenu;
  return -[UICellAccessory _canDirectlyUpdateExistingAccessoryViewFrom:](&v4, sel__canDirectlyUpdateExistingAccessoryViewFrom_, a3);
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UICellAccessoryPopUpMenu;
  v3 = -[UICellAccessory hash](&v5, sel_hash);
  return -[UIMenu hash](self->_menu, "hash") ^ v3;
}

- (void)selectedElementDidChangeHandler
{
  return self->_selectedElementDidChangeHandler;
}

- (void)setSelectedElementDidChangeHandler:(void *)selectedElementDidChangeHandler
{
  objc_setProperty_nonatomic_copy(self, a2, selectedElementDidChangeHandler, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectedElementDidChangeHandler, 0);
  objc_storeStrong((id *)&self->_menu, 0);
}

@end
