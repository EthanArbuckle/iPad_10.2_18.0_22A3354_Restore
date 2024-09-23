@implementation _REDiffItem

+ (id)itemWithObject:(id)a3 index:(unint64_t)a4 comparator:(id)a5 hashGenerator:(id)a6
{
  id v9;
  id v10;
  id v11;
  _REDiffItem *v12;
  id object;
  id v14;
  uint64_t v15;
  id comparator;
  uint64_t v17;
  id hashGenerator;

  v9 = a3;
  v10 = a6;
  v11 = a5;
  v12 = objc_alloc_init(_REDiffItem);
  object = v12->_object;
  v12->_object = v9;
  v14 = v9;

  v12->_index = a4;
  v15 = MEMORY[0x2199B2434](v11);

  comparator = v12->_comparator;
  v12->_comparator = (id)v15;

  v17 = MEMORY[0x2199B2434](v10);
  hashGenerator = v12->_hashGenerator;
  v12->_hashGenerator = (id)v17;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  _REDiffItem *v4;
  void *v5;
  char v6;

  v4 = (_REDiffItem *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_REDiffItem object](v4, "object");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (*((uint64_t (**)(void))self->_comparator + 2))();

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return (*((uint64_t (**)(id, id))self->_hashGenerator + 2))(self->_hashGenerator, self->_object);
}

- (id)object
{
  return self->_object;
}

- (unint64_t)index
{
  return self->_index;
}

- (id)comparator
{
  return self->_comparator;
}

- (id)hashGenerator
{
  return self->_hashGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hashGenerator, 0);
  objc_storeStrong(&self->_comparator, 0);
  objc_storeStrong(&self->_object, 0);
}

@end
