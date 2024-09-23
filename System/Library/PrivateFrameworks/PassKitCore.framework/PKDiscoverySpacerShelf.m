@implementation PKDiscoverySpacerShelf

- (PKDiscoverySpacerShelf)initWithDictionary:(id)a3
{
  id v4;
  PKDiscoverySpacerShelf *v5;
  PKDiscoverySpacerShelf *v6;
  id v7;
  uint64_t v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKDiscoverySpacerShelf;
  v5 = -[PKDiscoverySpacerShelf init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PKDiscoveryShelf setType:](v5, "setType:", 3);
    objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(CFSTR("cardSpacerA"), "isEqualToString:", v7) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(CFSTR("cardSpacerB"), "isEqualToString:", v7) & 1) != 0)
    {
      v8 = 2;
    }
    else if ((objc_msgSend(CFSTR("cardSpacerC"), "isEqualToString:", v7) & 1) != 0)
    {
      v8 = 3;
    }
    else if (objc_msgSend(CFSTR("cardSpacerD"), "isEqualToString:", v7))
    {
      v8 = 4;
    }
    else
    {
      v8 = 0;
    }

    v6->_spacerType = v8;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKDiscoverySpacerShelf;
  v5 = -[PKDiscoveryShelf isEqual:](&v7, sel_isEqual_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && self->_spacerType == v4[4];

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKDiscoverySpacerShelf;
  v3 = -[PKDiscoveryShelf hash](&v5, sel_hash);
  return self->_spacerType - v3 + 32 * v3;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%ld'; "), CFSTR("type"), self->_spacerType);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKDiscoverySpacerShelf;
  v4 = a3;
  -[PKDiscoveryShelf encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_spacerType, CFSTR("type"), v5.receiver, v5.super_class);

}

- (PKDiscoverySpacerShelf)initWithCoder:(id)a3
{
  id v4;
  PKDiscoverySpacerShelf *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKDiscoverySpacerShelf;
  v5 = -[PKDiscoveryShelf initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_spacerType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));

  return v5;
}

- (int64_t)spacerType
{
  return self->_spacerType;
}

@end
