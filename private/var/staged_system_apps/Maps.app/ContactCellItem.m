@implementation ContactCellItem

- (ContactCellItem)initWithType:(unint64_t)a3 editable:(BOOL)a4 required:(BOOL)a5
{
  ContactCellItem *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ContactCellItem;
  result = -[ContactCellItem init](&v9, "init");
  if (result)
  {
    result->_type = a3;
    result->_editable = a4;
    result->_required = a5;
  }
  return result;
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)editable
{
  return self->_editable;
}

- (BOOL)required
{
  return self->_required;
}

@end
