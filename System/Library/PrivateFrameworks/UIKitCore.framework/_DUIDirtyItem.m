@implementation _DUIDirtyItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DUIDirtyItem)initWithCoder:(id)a3
{
  id v4;
  _DUIDirtyItem *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_DUIDirtyItem;
  v5 = -[_DUIDirtyItem init](&v7, sel_init);
  if (v5)
    v5->_index = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("index"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_index, CFSTR("index"));
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p: index=%lu>"), objc_opt_class(), self, self->_index);
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

@end
