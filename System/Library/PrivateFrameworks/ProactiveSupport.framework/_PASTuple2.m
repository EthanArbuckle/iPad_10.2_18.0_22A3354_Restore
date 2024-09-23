@implementation _PASTuple2

- (NSObject)second
{
  return self->_second;
}

- (NSObject)first
{
  return self->_first;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_second, 0);
  objc_storeStrong((id *)&self->_first, 0);
}

+ (id)tupleWithFirst:(id)a3 second:(id)a4
{
  id v5;
  id v6;
  _PASTuple2 *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_PASTuple2 initWithFirst:second:]([_PASTuple2 alloc], "initWithFirst:second:", v6, v5);

  return v7;
}

- (_PASTuple2)initWithFirst:(id)a3 second:(id)a4
{
  id v7;
  id v8;
  _PASTuple2 *v9;
  _PASTuple2 *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PASTuple2;
  v9 = -[_PASTuple2 init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_first, a3);
    objc_storeStrong((id *)&v10->_second, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _PASTuple2 *v4;
  _PASTuple2 *v5;
  BOOL v6;

  v4 = (_PASTuple2 *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[_PASTuple2 isEqualToTuple2:](self, "isEqualToTuple2:", v5);

  return v6;
}

- (BOOL)isEqualToTuple2:(id)a3
{
  id v4;
  _QWORD *v5;
  NSObject *first;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  char v10;
  char v11;
  NSObject *v12;
  NSObject *v13;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_4;
  first = self->_first;
  v7 = *((id *)v4 + 1);
  if (first == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = first;
    v10 = -[NSObject isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
    {
LABEL_4:
      v11 = 0;
      goto LABEL_10;
    }
  }
  v12 = self->_second;
  v13 = v12;
  if (v12 == v5[2])
    v11 = 1;
  else
    v11 = -[NSObject isEqual:](v12, "isEqual:");

LABEL_10:
  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSObject hash](self->_first, "hash");
  return -[NSObject hash](self->_second, "hash") - v3 + 32 * v3;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("_PASTuple2(%@, %@)"), self->_first, self->_second);
}

@end
