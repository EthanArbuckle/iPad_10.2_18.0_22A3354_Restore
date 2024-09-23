@implementation MOPair

- (MOPair)init
{
  return -[MOPair initWithFirstObject:secondObject:](self, "initWithFirstObject:secondObject:", 0, 0);
}

- (MOPair)initWithFirstObject:(id)a3 secondObject:(id)a4
{
  id v7;
  id v8;
  MOPair *v9;
  MOPair *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MOPair;
  v9 = -[MOPair init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_firstObject, a3);
    objc_storeStrong(&v10->_secondObject, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOPair firstObject](self, "firstObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOPair secondObject](self, "secondObject"));
  v7 = objc_msgSend(v4, "initWithFirstObject:secondObject:", v5, v6);

  return v7;
}

- (MOPair)initWithCoder:(id)a3
{
  id v4;
  MOPair *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[MOPair init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectForKey:", CFSTR("firstObject")));
    -[MOPair setFirstObject:](v5, "setFirstObject:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectForKey:", CFSTR("secondObject")));
    -[MOPair setSecondObject:](v5, "setSecondObject:", v7);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOPair firstObject](self, "firstObject"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("firstObject"));

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MOPair secondObject](self, "secondObject"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("secondObject"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOPair firstObject](self, "firstObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOPair secondObject](self, "secondObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Pair: firstObject, %@, secondObject, %@"), v3, v4));

  return v5;
}

- (id)firstObject
{
  return self->_firstObject;
}

- (void)setFirstObject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)secondObject
{
  return self->_secondObject;
}

- (void)setSecondObject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_secondObject, 0);
  objc_storeStrong(&self->_firstObject, 0);
}

@end
