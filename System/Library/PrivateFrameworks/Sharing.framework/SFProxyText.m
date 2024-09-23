@implementation SFProxyText

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFProxyText)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  SFProxyText *v9;
  SFProxyText *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("slotIdentifier"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("slotTextHeight"));
  v8 = v7;

  if (v5)
    v9 = -[SFProxyText initWithText:](self, "initWithText:", v5);
  else
    v9 = -[SFProxyText initWithSlotIdentifier:slotTextHeight:](self, "initWithSlotIdentifier:slotTextHeight:", v6, v8);
  v10 = v9;

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *text;
  id v5;

  text = self->_text;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", text, CFSTR("text"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_slotIdentifier, CFSTR("slotIdentifier"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("slotTextHeight"), self->_slotTextHeight);

}

- (SFProxyText)initWithText:(id)a3
{
  id v4;
  SFProxyText *v5;
  uint64_t v6;
  NSString *text;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFProxyText;
  v5 = -[SFProxyText init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    text = v5->_text;
    v5->_text = (NSString *)v6;

  }
  return v5;
}

- (SFProxyText)initWithSlotIdentifier:(unsigned int)a3
{
  SFProxyText *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFProxyText;
  result = -[SFProxyText init](&v5, sel_init);
  if (result)
    result->_slotIdentifier = a3;
  return result;
}

- (SFProxyText)initWithSlotIdentifier:(unsigned int)a3 slotTextHeight:(double)a4
{
  SFProxyText *result;

  result = -[SFProxyText initWithSlotIdentifier:](self, "initWithSlotIdentifier:", *(_QWORD *)&a3);
  if (result)
    result->_slotTextHeight = a4;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)SFProxyText;
  -[SFProxyText description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFProxyText text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SFProxyText slotIdentifier](self, "slotIdentifier");
  -[SFProxyText slotTextHeight](self, "slotTextHeight");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: text:%@ slotIdentifier:%u slotTextHeight:%f>"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  -[SFProxyText text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SFProxyText text](self, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hash");

  }
  else
  {
    v8 = -[SFProxyText slotIdentifier](self, "slotIdentifier");
  }

  return v8 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  SFProxyText *v4;
  SFProxyText *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  BOOL v12;
  unsigned int v13;
  double v14;
  double v15;
  double v16;

  v4 = (SFProxyText *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SFProxyText text](self, "text");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFProxyText text](v5, "text");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {

      }
      else
      {
        if ((v8 == 0) == (v9 != 0))
        {

          goto LABEL_13;
        }
        v11 = objc_msgSend(v8, "isEqual:", v9);

        if (!v11)
          goto LABEL_13;
      }
      v13 = -[SFProxyText slotIdentifier](self, "slotIdentifier");
      if (v13 == -[SFProxyText slotIdentifier](v5, "slotIdentifier"))
      {
        -[SFProxyText slotTextHeight](self, "slotTextHeight");
        v15 = v14;
        -[SFProxyText slotTextHeight](v5, "slotTextHeight");
        v12 = v15 == v16;
LABEL_14:

        goto LABEL_15;
      }
LABEL_13:
      v12 = 0;
      goto LABEL_14;
    }
    v12 = 0;
  }
LABEL_15:

  return v12;
}

- (NSString)text
{
  return self->_text;
}

- (unsigned)slotIdentifier
{
  return self->_slotIdentifier;
}

- (double)slotTextHeight
{
  return self->_slotTextHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end
