@implementation PAAccessMatcher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_access, 0);
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[PAAccess hashWithOptions:](self->_access, "hashWithOptions:", self->_options);
  return self->_options - v3 + 32 * v3;
}

+ (id)coalescingMatcherForAccess:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAccess:options:", v4, 63);

  return v5;
}

- (PAAccessMatcher)initWithAccess:(id)a3 options:(unint64_t)a4
{
  id v7;
  PAAccessMatcher *v8;
  PAAccessMatcher *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PAAccessMatcher;
  v8 = -[PAAccessMatcher init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_access, a3);
    v9->_options = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  PAAccessMatcher *v4;
  PAAccessMatcher *v5;
  unint64_t options;
  PAAccess *access;
  void *v8;
  char v9;

  v4 = (PAAccessMatcher *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (-[PAAccessMatcher isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    options = self->_options;
    if (options == -[PAAccessMatcher options](v5, "options"))
    {
      access = self->_access;
      -[PAAccessMatcher access](v5, "access");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PAAccess isEqualToAccess:withOptions:](access, "isEqualToAccess:withOptions:", v8, self->_options);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)options
{
  return self->_options;
}

- (PAAccess)access
{
  return self->_access;
}

@end
