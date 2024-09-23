@implementation MTResultsChangeWrapper

- (MTResultsChangeWrapper)initWithObject:(id)a3
{
  id v4;
  MTResultsChangeWrapper *v5;
  MTResultsChangeWrapper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTResultsChangeWrapper;
  v5 = -[MTResultsChangeWrapper init](&v8, "init");
  v6 = v5;
  if (v5)
    -[MTResultsChangeWrapper setObject:](v5, "setObject:", v4);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTResultsChangeWrapper *v4;
  void *v5;
  MTResultsChangeWrapper *v6;

  v4 = [MTResultsChangeWrapper alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsChangeWrapper object](self, "object"));
  v6 = -[MTResultsChangeWrapper initWithObject:](v4, "initWithObject:", v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = a3;
  v5 = objc_opt_class(MTResultsChangeWrapper);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsChangeWrapper object](self, "object"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "object"));

    v9 = objc_msgSend(v7, "isEqual:", v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsChangeWrapper object](self, "object"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (NSCopying)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
  objc_storeStrong((id *)&self->_object, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_object, 0);
}

@end
