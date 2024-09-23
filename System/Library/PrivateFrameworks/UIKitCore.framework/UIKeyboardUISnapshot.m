@implementation UIKeyboardUISnapshot

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t slotID;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
  slotID = self->_slotID;
  if ((_DWORD)slotID)
    objc_msgSend(v7, "encodeInt32:forKey:", slotID, CFSTR("slot"));
  if (self->_size.width != *MEMORY[0x1E0C9D820] || self->_size.height != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("size"));

  }
}

- (UIKeyboardUISnapshot)initWithCoder:(id)a3
{
  id v4;
  UIKeyboardUISnapshot *v5;
  void *v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  objc_super v11;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The decoder must allow keyed coding."));
  v11.receiver = self;
  v11.super_class = (Class)UIKeyboardUISnapshot;
  v5 = -[UIKeyboardUISnapshot init](&v11, sel_init);
  if (v5)
  {
    v5->_slotID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("slot"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("size"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "sizeValue");
      v5->_size.width = v8;
      v5->_size.height = v9;
    }

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = -[UIKeyboardUISnapshot init](+[UIKeyboardUISnapshot allocWithZone:](UIKeyboardUISnapshot, "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_slotID;
  *((_OWORD *)result + 1) = self->_size;
  return result;
}

- (id)description
{
  void *v3;
  double v4;
  double v5;
  void *v7;
  NSSize v9;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  if (-[UIKeyboardUISnapshot slotID](self, "slotID"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; slotID = %u"), -[UIKeyboardUISnapshot slotID](self, "slotID"));
  -[UIKeyboardUISnapshot size](self, "size");
  if (v5 != *MEMORY[0x1E0C9D820] || v4 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[UIKeyboardUISnapshot size](self, "size");
    NSStringFromSize(v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; size = %@"), v7);

  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  UIKeyboardUISnapshot *v4;
  UIKeyboardUISnapshot *v5;
  unsigned int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;

  v4 = (UIKeyboardUISnapshot *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[UIKeyboardUISnapshot slotID](self, "slotID");
      if (v6 == -[UIKeyboardUISnapshot slotID](v5, "slotID"))
      {
        -[UIKeyboardUISnapshot size](self, "size");
        v8 = v7;
        v10 = v9;
        -[UIKeyboardUISnapshot size](v5, "size");
        v13 = v10 == v12 && v8 == v11;
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (unsigned)slotID
{
  return self->_slotID;
}

- (void)setSlotID:(unsigned int)a3
{
  self->_slotID = a3;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

@end
