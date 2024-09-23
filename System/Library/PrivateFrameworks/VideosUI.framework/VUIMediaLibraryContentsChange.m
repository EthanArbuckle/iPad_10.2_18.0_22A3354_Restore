@implementation VUIMediaLibraryContentsChange

- (VUIMediaLibraryContentsChange)initWithRevision:(unint64_t)a3
{
  VUIMediaLibraryContentsChange *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIMediaLibraryContentsChange;
  result = -[VUIMediaLibraryContentsChange init](&v5, sel_init);
  if (result)
    result->_revision = a3;
  return result;
}

- (VUIMediaLibraryContentsChange)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  VUIMediaLibraryContentsChange *v4;
  VUIMediaLibraryContentsChange *v5;
  VUIMediaLibraryContentsChange *v6;
  unint64_t v7;
  uint64_t v8;
  BOOL v9;

  v4 = (VUIMediaLibraryContentsChange *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = -[VUIMediaLibraryContentsChange revision](self, "revision");
    v8 = -[VUIMediaLibraryContentsChange revision](v6, "revision");

    v9 = v7 == v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12.receiver = self;
  v12.super_class = (Class)VUIMediaLibraryContentsChange;
  -[VUIMediaLibraryContentsChange description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VUIMediaLibraryContentsChange revision](self, "revision"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("revision"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@>"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)revision
{
  return self->_revision;
}

- (void)setRevision:(unint64_t)a3
{
  self->_revision = a3;
}

@end
