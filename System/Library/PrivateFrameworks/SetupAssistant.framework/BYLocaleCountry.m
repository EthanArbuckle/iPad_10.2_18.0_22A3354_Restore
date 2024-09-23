@implementation BYLocaleCountry

+ (id)comparatorForLocale:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__BYLocaleCountry_comparatorForLocale___block_invoke;
  v8[3] = &unk_1E4E27240;
  v9 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1A85AAF94](v8);
  v6 = (void *)MEMORY[0x1A85AAF94]();

  return v6;
}

uint64_t __39__BYLocaleCountry_comparatorForLocale___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v7, "compare:options:range:locale:", v8, 1, 0, objc_msgSend(v9, "length"), *(_QWORD *)(a1 + 32));
  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[BYLocaleCountry code](self, "code");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BYLocaleCountry name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[BYLocaleCountry code](self, "code");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "code");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)code
{
  return self->_code;
}

- (void)setCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_code, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
