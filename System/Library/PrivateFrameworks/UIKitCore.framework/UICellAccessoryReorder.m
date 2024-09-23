@implementation UICellAccessoryReorder

- (void)setShowsVerticalSeparator:(BOOL)showsVerticalSeparator
{
  self->_showsVerticalSeparator = showsVerticalSeparator;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UICellAccessoryReorder;
  result = -[UICellAccessory copyWithZone:](&v5, sel_copyWithZone_, a3);
  if (result)
    *((_BYTE *)result + 48) = self->_showsVerticalSeparator;
  return result;
}

- (UICellAccessoryReorder)init
{
  UICellAccessoryReorder *v2;
  UICellAccessoryReorder *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UICellAccessoryReorder;
  v2 = -[UICellAccessory init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UICellAccessory setDisplayedState:](v2, "setDisplayedState:", 1);
    v3->_showsVerticalSeparator = 1;
  }
  return v3;
}

- (BOOL)showsVerticalSeparator
{
  return self->_showsVerticalSeparator;
}

- (int64_t)_systemType
{
  return 4;
}

- (id)_identifier
{
  return CFSTR("Reorder");
}

- (int64_t)_systemTypePlacementForHeader:(BOOL)a3
{
  return 208;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  BOOL v5;
  objc_super v7;

  v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)UICellAccessoryReorder;
  if (-[UICellAccessory isEqual:](&v7, sel_isEqual_, v4))
    v5 = self->_showsVerticalSeparator == v4[48];
  else
    v5 = 0;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UICellAccessoryReorder)initWithCoder:(id)a3
{
  id v4;
  UICellAccessoryReorder *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UICellAccessoryReorder;
  v5 = -[UICellAccessory initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_showsVerticalSeparator = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsVerticalSeparator"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UICellAccessoryReorder;
  v4 = a3;
  -[UICellAccessory encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_showsVerticalSeparator, CFSTR("showsVerticalSeparator"), v5.receiver, v5.super_class);

}

- (BOOL)_canDirectlyUpdateExistingAccessoryViewFrom:(id)a3
{
  unsigned __int8 *v4;
  BOOL v5;
  objc_super v7;

  v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)UICellAccessoryReorder;
  if (-[UICellAccessory _canDirectlyUpdateExistingAccessoryViewFrom:](&v7, sel__canDirectlyUpdateExistingAccessoryViewFrom_, v4))
  {
    v5 = self->_showsVerticalSeparator == v4[48];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
