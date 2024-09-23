@implementation PQLQueryBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->lastError, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

- (NSError)lastError
{
  return self->lastError;
}

- (PQLQueryBuilder)init
{
  PQLQueryBuilder *v2;
  uint64_t v3;
  NSMutableArray *parameters;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PQLQueryBuilder;
  v2 = -[PQLQueryBuilder init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    parameters = v2->_parameters;
    v2->_parameters = (NSMutableArray *)v3;

  }
  return v2;
}

- (id)bindObjectParameter:(id)a3
{
  id v4;
  void *v5;
  PQLQueryBuilder *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EFEAAEB0))
      abort();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = self;
      v7 = v5;
      v8 = 9;
    }
    else
    {
      v6 = self;
      v7 = v5;
      v8 = 7;
    }
    -[PQLQueryBuilder bindParameter:spec:](v6, "bindParameter:spec:", v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PQLQueryBuilder bindParameter:spec:](self, "bindParameter:spec:", v9, 7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)bindLongParameter:(int64_t)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PQLQueryBuilder bindParameter:spec:](self, "bindParameter:spec:", v4, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)bindParameter:(id)a3 spec:(unsigned __int8)a4
{
  id v6;
  void *v7;
  uint64_t specLength;

  v6 = a3;
  if ((unsigned __int16)self->_specLength >= 0x3E8u)
    abort();
  v7 = v6;
  -[NSMutableArray addObject:](self->_parameters, "addObject:", v6);
  specLength = self->_specLength;
  self->_specLength = specLength + 1;
  self->_spec[specLength] = a4;

  return CFSTR("?");
}

- (id)bindStringParameter:(id)a3
{
  return -[PQLQueryBuilder bindParameter:spec:](self, "bindParameter:spec:", a3, 4);
}

- (id)bindDoubleParameter:(double)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PQLQueryBuilder bindParameter:spec:](self, "bindParameter:spec:", v4, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)bindBooleanParameter:(BOOL)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PQLQueryBuilder bindParameter:spec:](self, "bindParameter:spec:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)bindCharParameter:(char)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PQLQueryBuilder bindParameter:spec:](self, "bindParameter:spec:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)bindUnsignedCharParameter:(unsigned __int8)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PQLQueryBuilder bindParameter:spec:](self, "bindParameter:spec:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)bindShortParameter:(signed __int16)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PQLQueryBuilder bindParameter:spec:](self, "bindParameter:spec:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)bindUnsignedShortParameter:(unsigned __int16)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PQLQueryBuilder bindParameter:spec:](self, "bindParameter:spec:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)bindIntegerParameter:(int)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PQLQueryBuilder bindParameter:spec:](self, "bindParameter:spec:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)bindUnsignedIntegerParameter:(unsigned int)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PQLQueryBuilder bindParameter:spec:](self, "bindParameter:spec:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)bindUnsignedLongParameter:(unint64_t)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PQLQueryBuilder bindParameter:spec:](self, "bindParameter:spec:", v4, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setLastError:(id)a3
{
  objc_storeStrong((id *)&self->lastError, a3);
}

@end
