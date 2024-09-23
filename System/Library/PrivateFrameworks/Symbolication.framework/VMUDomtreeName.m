@implementation VMUDomtreeName

- (VMUDomtreeName)initWithDict:(id)a3
{
  uint64_t i;
  void *v6;
  void *v7;
  NSCopying *v8;
  NSCopying *v9;

  for (i = 0; i != 6; ++i)
  {
    objc_msgSend(a3, "objectForKeyedSubscript:", name_keys[i]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (NSCopying *)objc_claimAutoreleasedReturnValue();
    }
    v9 = self->_elements[i];
    self->_elements[i] = v8;

  }
  return self;
}

- (VMUDomtreeName)initWithArray:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  objc_class *v10;
  void *v11;

  v4 = a3;
  v5 = -6;
  v6 = 8;
  while (v5 + 6 < objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", v5 + 6);
    v7 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v8 = *(Class *)((char *)&self->super.isa + v6);
    *(Class *)((char *)&self->super.isa + v6) = v7;

    v6 += 8;
    if (__CFADD__(v5++, 1))
      goto LABEL_8;
  }
  if (v5 >= 0xFFFFFFFFFFFFFFFALL)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v11 = *(Class *)((char *)&self->super.isa + v6);
      *(Class *)((char *)&self->super.isa + v6) = v10;

      v6 += 8;
    }
    while (v6 != 56);
  }
LABEL_8:

  return self;
}

- (id)asArray
{
  uint64_t v2;
  uint64_t v3;

  v2 = 6;
  do
  {
    v3 = v2;
    if (!v2)
      break;
    --v2;
  }
  while (!*((_QWORD *)&self->super.isa + v3));
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", self->_elements, v3);
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  NSCopying *v5;
  NSCopying *v6;
  NSCopying *v7;
  unint64_t v8;
  BOOL v9;
  NSCopying **v10;

  v4 = (id *)a3;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (NSCopying *)objc_claimAutoreleasedReturnValue();
  v6 = self->_elements[0];
  v7 = (NSCopying *)v4[1];
  if ((v6 != v5) == (v7 == v5))
  {
    v9 = 0;
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v10 = &self->_elements[1];
    while (-[NSCopying isEqual:](v6, "isEqual:", v7))
    {

      if (v8 == 5)
      {
        v9 = 1;
        goto LABEL_9;
      }
      v9 = v8 > 4;
      v6 = v10[v8];
      v7 = (NSCopying *)v4[v8++ + 2];
      if ((v6 != v5) == (v7 == v5))
        break;
    }
  }

LABEL_9:
  return v9;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  uint64_t i;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  for (i = 8; i != 56; i += 8)
  {
    v6 = *(Class *)((char *)&self->super.isa + i);
    if (v6 != v3)
      v4 += objc_msgSend(v6, "hash");
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VMUDomtreeName *v4;
  uint64_t i;

  v4 = +[VMUDomtreeName allocWithZone:](VMUDomtreeName, "allocWithZone:", a3);
  for (i = 8; i != 56; i += 8)
    objc_storeStrong((id *)((char *)&v4->super.isa + i), *(id *)((char *)&self->super.isa + i));
  return v4;
}

- (void).cxx_destruct
{
  uint64_t v3;

  v3 = 48;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end
