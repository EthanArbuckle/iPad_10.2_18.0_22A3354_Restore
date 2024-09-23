@implementation PKImageDescriptor

+ (_QWORD)_createForType:(uint64_t)a3 withTintColor:(char)a4 hasBackground:
{
  __objc2_class **v7;
  id v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  objc_super v13;

  objc_opt_self();
  if (a2)
  {
    if (a2 != 1)
    {
      v9 = 0;
LABEL_9:

      return 0;
    }
    v7 = off_1E2A9ED40;
  }
  else
  {
    v7 = off_1E2A9ED38;
  }
  v8 = objc_alloc(*v7);
  v9 = v8;
  if (!v8)
    goto LABEL_9;
  v13.receiver = v8;
  v13.super_class = (Class)PKImageDescriptor;
  v10 = objc_msgSendSuper2(&v13, sel_init);
  if (!v10)
    goto LABEL_9;
  v11 = v10;
  v10[2] = a2;

  v11[3] = a3;
  *((_BYTE *)v11 + 8) = a4;
  return v11;
}

- (PKImageDescriptor)init
{

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKImageDescriptor)initWithCoder:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  char v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  char v11;
  PKImageDescriptor *v12;
  PKImageDescriptor *v13;
  void *v14;
  void *v15;
  PKImageDescriptor *v16;
  objc_super v18;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v5 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == CFSTR("bitmap")
    || v5
    && (v7 = -[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("bitmap")), v6, (v7 & 1) != 0))
  {
    v8 = 0;
  }
  else
  {

    v9 = v6;
    if (v9 != CFSTR("symbol"))
    {
      v10 = v9;
      if (!v6
        || (v11 = -[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("symbol")),
            v10,
            (v11 & 1) == 0))
      {

LABEL_15:
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PKImageDescriptorDecoder"), 0, 0);
        objc_msgSend(v4, "failWithError:", v15);

        v16 = 0;
        goto LABEL_18;
      }
    }
    v8 = 1;
  }

  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_15;
  if (self
    && (v18.receiver = self,
        v18.super_class = (Class)PKImageDescriptor,
        (v12 = -[PKImageDescriptor init](&v18, sel_init)) != 0))
  {
    v13 = v12;
    v12->_type = v8;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tintColor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PKSemanticColorFromString(v14, &v13->_tintColor);

    v13->_hasBackground = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasBackground"));
  }
  else
  {
    v13 = 0;
  }
  self = v13;
  v16 = self;
LABEL_18:

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  id v8;

  type = self->_type;
  v5 = CFSTR("symbol");
  if (type != 1)
    v5 = 0;
  if (type)
    v6 = v5;
  else
    v6 = CFSTR("bitmap");
  v8 = a3;
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("type"));
  PKSemanticColorToString(self->_tintColor);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("tintColor"));

  objc_msgSend(v8, "encodeBool:forKey:", self->_hasBackground, CFSTR("hasBackground"));
}

- (BOOL)isEqual:(id)a3
{
  PKImageDescriptor *v4;
  char isKindOfClass;
  BOOL v6;
  PKImageDescriptor *v7;
  PKImageDescriptor *v8;
  int64_t type;
  id *v10;
  id *v11;
  objc_class *v12;
  Class isa;
  char v14;
  id *v15;
  Class v16;
  objc_class *v17;
  objc_class *v18;
  objc_class *v19;
  char v20;

  v4 = (PKImageDescriptor *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v6 = 0;
    if (v4 && (isKindOfClass & 1) != 0)
    {
      v7 = v4;
      v8 = v7;
      if (!self)
        goto LABEL_26;
      type = v7->_type;
      if (type != self->_type || v7->_tintColor != self->_tintColor)
        goto LABEL_26;
      if (type != 1)
      {
        if (type)
          goto LABEL_23;
        v10 = v7;
        v11 = v10;
        v12 = (objc_class *)v10[4];
        isa = self[1].super.isa;
        if (v12 && isa)
        {
          v14 = objc_msgSend(v10[4], "isEqual:", isa);

          if ((v14 & 1) == 0)
            goto LABEL_26;
LABEL_23:
          v6 = 1;
LABEL_27:

          goto LABEL_28;
        }

        if (v12 == isa)
          goto LABEL_23;
LABEL_26:
        v6 = 0;
        goto LABEL_27;
      }
      v15 = v7;
      v16 = self[1].super.isa;
      v17 = (objc_class *)v15[4];
      v18 = v16;
      if (v17 == v18)
      {

      }
      else
      {
        v19 = v18;
        if (!v17 || !v18)
        {

LABEL_25:
          goto LABEL_26;
        }
        v20 = -[objc_class isEqualToString:](v17, "isEqualToString:", v18);

        if ((v20 & 1) == 0)
          goto LABEL_25;
      }

      goto LABEL_23;
    }
  }
LABEL_28:

  return v6;
}

- (unint64_t)hash
{
  int64_t type;
  int *v3;

  type = self->_type;
  if (!type)
  {
    v3 = &OBJC_IVAR___PKImageDescriptorBitmap__imageHash;
    goto LABEL_5;
  }
  if (type == 1)
  {
    v3 = &OBJC_IVAR___PKImageDescriptorSymbol__name;
LABEL_5:
    objc_msgSend(*(id *)((char *)&self->super.isa + *v3), "hash");
  }
  return SipHash();
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)tintColor
{
  return self->_tintColor;
}

- (BOOL)hasBackground
{
  return self->_hasBackground;
}

@end
