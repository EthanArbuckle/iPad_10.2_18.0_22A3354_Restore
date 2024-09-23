@implementation _PGInterruption

- (_PGInterruption)initWithReason:(int64_t)a3 attribution:(id)a4
{
  __CFString *v6;
  _PGInterruption *v7;
  _PGInterruption *v8;
  uint64_t v9;
  NSString *attribution;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  objc_super v17;

  v6 = (__CFString *)a4;
  v17.receiver = self;
  v17.super_class = (Class)_PGInterruption;
  v7 = -[_PGInterruption init](&v17, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_reason = a3;
    v9 = -[__CFString copy](v6, "copy");
    attribution = v8->_attribution;
    v8->_attribution = (NSString *)v9;

    objc_msgSend(MEMORY[0x1E0D01788], "builder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v6)
      v14 = v6;
    else
      v14 = &stru_1E6231540;
    objc_msgSend(v12, "appendString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_bs_hash = objc_msgSend(v15, "hash");

  }
  return v8;
}

- (unint64_t)hash
{
  return self->_bs_hash;
}

- (int64_t)reason
{
  return self->_reason;
}

- (NSString)attribution
{
  return self->_attribution;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;
  NSString *v11;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  if (v8 && objc_msgSend(v8, "reason") == self->_reason)
  {
    objc_msgSend(v8, "attribution");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", self->_attribution) & 1) != 0)
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend(v8, "attribution");
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      v10 = v11 == self->_attribution;

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  unint64_t reason;
  const __CFString *v8;
  const __CFString *attribution;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  reason = self->_reason;
  if (reason > 4)
    v8 = CFSTR("invalid");
  else
    v8 = off_1E622F9F0[reason];
  attribution = (const __CFString *)self->_attribution;
  if (!attribution)
    attribution = CFSTR("<nil>");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ - %@"), v5, v8, attribution);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attribution, 0);
}

@end
