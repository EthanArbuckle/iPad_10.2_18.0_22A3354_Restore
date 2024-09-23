@implementation SBSHomeScreenServiceArrayOfNumbers

- (SBSHomeScreenServiceArrayOfNumbers)initWithArray:(id)a3
{
  id v4;
  SBSHomeScreenServiceArrayOfNumbers *v5;
  uint64_t v6;
  NSArray *array;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSHomeScreenServiceArrayOfNumbers;
  v5 = -[SBSHomeScreenServiceArrayOfNumbers init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    array = v5->_array;
    v5->_array = (NSArray *)v6;

  }
  return v5;
}

- (SBSHomeScreenServiceArrayOfNumbers)init
{
  return -[SBSHomeScreenServiceArrayOfNumbers initWithArray:](self, "initWithArray:", MEMORY[0x1E0C9AA60]);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_array, CFSTR("array"));
}

- (SBSHomeScreenServiceArrayOfNumbers)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SBSHomeScreenServiceArrayOfNumbers *v10;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithObjects:", v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("array"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SBSHomeScreenServiceArrayOfNumbers initWithArray:](self, "initWithArray:", v9);
  return v10;
}

- (NSArray)array
{
  return self->_array;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_array, 0);
}

@end
