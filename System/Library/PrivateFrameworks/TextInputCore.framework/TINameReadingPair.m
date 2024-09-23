@implementation TINameReadingPair

- (TINameReadingPair)initWithName:(id)a3 reading:(id)a4
{
  id v6;
  id v7;
  TINameReadingPair *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  NSString *reading;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TINameReadingPair;
  v8 = -[TINameReadingPair init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    reading = v8->_reading;
    v8->_reading = (NSString *)v11;

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = -[NSString copyWithZone:](self->_reading, "copyWithZone:", a3);
    v9 = (void *)v5[2];
    v5[2] = v8;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  TINameReadingPair *v4;
  TINameReadingPair *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (TINameReadingPair *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[TINameReadingPair name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TINameReadingPair name](v5, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v7))
      {
        -[TINameReadingPair reading](self, "reading");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[TINameReadingPair reading](v5, "reading");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToString:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[TINameReadingPair name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[TINameReadingPair reading](self, "reading");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") + 257 * v4;

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)reading
{
  return self->_reading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reading, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)nameReadingPairWithName:(id)a3 reading:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:reading:", v7, v6);

  return v8;
}

@end
