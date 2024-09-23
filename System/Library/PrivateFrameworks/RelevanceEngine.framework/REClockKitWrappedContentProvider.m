@implementation REClockKitWrappedContentProvider

- (REClockKitWrappedContentProvider)initWithClockKitTextProvider:(id)a3
{
  id v4;
  REClockKitWrappedContentProvider *v5;
  uint64_t v6;
  CLKTextProvider *clockKitTextProvider;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REClockKitWrappedContentProvider;
  v5 = -[REClockKitWrappedContentProvider init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    clockKitTextProvider = v5->_clockKitTextProvider;
    v5->_clockKitTextProvider = (CLKTextProvider *)v6;

  }
  return v5;
}

- (REClockKitWrappedContentProvider)initWithCoder:(id)a3
{
  id v4;
  REClockKitWrappedContentProvider *v5;
  void *v6;
  id v7;
  uint64_t v8;
  CLKTextProvider *clockKitTextProvider;
  objc_super v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REClockKitWrappedContentProvider;
  v5 = -[REClockKitWrappedContentProvider init](&v11, sel_init);
  if (v5)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v6 = (void *)getCLKTextProviderClass_softClass;
    v16 = getCLKTextProviderClass_softClass;
    if (!getCLKTextProviderClass_softClass)
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __getCLKTextProviderClass_block_invoke;
      v12[3] = &unk_24CF8AC38;
      v12[4] = &v13;
      __getCLKTextProviderClass_block_invoke((uint64_t)v12);
      v6 = (void *)v14[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v13, 8);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clockKitTextProvider"));
    v8 = objc_claimAutoreleasedReturnValue();
    clockKitTextProvider = v5->_clockKitTextProvider;
    v5->_clockKitTextProvider = (CLKTextProvider *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_clockKitTextProvider, CFSTR("clockKitTextProvider"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  CLKTextProvider *clockKitTextProvider;
  CLKTextProvider *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    clockKitTextProvider = self->_clockKitTextProvider;
    objc_msgSend(v4, "clockKitTextProvider");
    v6 = (CLKTextProvider *)objc_claimAutoreleasedReturnValue();
    if (clockKitTextProvider == v6)
      v7 = 1;
    else
      v7 = -[CLKTextProvider isEqual:](clockKitTextProvider, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return -[CLKTextProvider hash](self->_clockKitTextProvider, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithClockKitTextProvider:", self->_clockKitTextProvider);
}

- (id)attributedStringRepresentation
{
  return (id)-[CLKTextProvider attributedString](self->_clockKitTextProvider, "attributedString");
}

- (id)clockKitTextProviderRepresentation
{
  return self->_clockKitTextProvider;
}

- (CLKTextProvider)clockKitTextProvider
{
  return self->_clockKitTextProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clockKitTextProvider, 0);
}

@end
