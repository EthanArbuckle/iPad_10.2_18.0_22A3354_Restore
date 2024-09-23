@implementation UICellAccessoryInsert

- (UICellAccessoryInsert)init
{
  UICellAccessoryInsert *v2;
  UICellAccessoryInsert *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UICellAccessoryInsert;
  v2 = -[UICellAccessory init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[UICellAccessory setDisplayedState:](v2, "setDisplayedState:", 1);
  return v3;
}

- (int64_t)_systemType
{
  return 3;
}

- (int64_t)_systemTypePlacementForHeader:(BOOL)a3
{
  return 102;
}

- (id)_identifier
{
  return CFSTR("Insert");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UICellAccessoryInsert;
  v4 = -[UICellAccessory copyWithZone:](&v8, sel_copyWithZone_, a3);
  if (v4)
  {
    v5 = objc_msgSend(self->_actionHandler, "copy");
    v6 = (void *)v4[6];
    v4[6] = v5;

  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  BOOL v5;
  objc_super v7;

  v4 = (id *)a3;
  v7.receiver = self;
  v7.super_class = (Class)UICellAccessoryInsert;
  if (-[UICellAccessory isEqual:](&v7, sel_isEqual_, v4))
    v5 = self->_actionHandler == v4[6];
  else
    v5 = 0;

  return v5;
}

- (BOOL)_canDirectlyUpdateExistingAccessoryViewFrom:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UICellAccessoryInsert;
  return -[UICellAccessory _canDirectlyUpdateExistingAccessoryViewFrom:](&v4, sel__canDirectlyUpdateExistingAccessoryViewFrom_, a3);
}

- (void)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(void *)actionHandler
{
  objc_setProperty_nonatomic_copy(self, a2, actionHandler, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);
}

@end
