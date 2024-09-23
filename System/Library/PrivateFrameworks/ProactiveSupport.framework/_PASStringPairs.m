@implementation _PASStringPairs

- (_PASStringPairs)initWithKeys:(id)a3 values:(id)a4
{
  id v8;
  id v9;
  uint64_t v10;
  _PASStringPairs *v11;
  _PASStringPairs *v12;
  void *v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "count");
  if (v10 != objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASStringPairs.m"), 16, CFSTR("number of elements don't match: keys - %lu, values - %lu"), -[NSArray count](self->_keys, "count"), -[NSArray count](self->_values, "count"));

  }
  v15.receiver = self;
  v15.super_class = (Class)_PASStringPairs;
  v11 = -[_PASStringPairs init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_keys, a3);
    objc_storeStrong((id *)&v12->_values, a4);
  }

  return v12;
}

- (unint64_t)count
{
  return -[NSArray count](self->_keys, "count");
}

- (id)keyAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_keys, "objectAtIndexedSubscript:", a3);
}

- (id)valueAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_values, "objectAtIndexedSubscript:", a3);
}

- (NSArray)keys
{
  return self->_keys;
}

- (NSArray)values
{
  return self->_values;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

@end
