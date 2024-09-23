@implementation VKDebugTreePropertyNode

- (id)name
{
  const void **property;

  property = (const void **)self->_property;
  if (*((char *)property + 23) < 0)
    property = (const void **)*property;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", property);
}

- (id)propertyColumn
{
  const void **property;

  property = (const void **)self->_property;
  if (*((char *)property + 23) < 0)
    property = (const void **)*property;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", property);
}

- (id)valueColumn
{
  __CFString *v3;
  _QWORD *property;
  __int128 *v5;
  __int128 *v6;
  __int128 *v7;
  __int128 v8;
  __int128 v9;
  __int128 *v10;
  void *v11;
  void *v12;
  _BYTE v14[32];
  std::string __p;
  int v16;

  if (*((_QWORD *)self->_property + 5) == *((_QWORD *)self->_property + 4))
  {
    v3 = CFSTR(" ");
  }
  else
  {
    v3 = (__CFString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    property = self->_property;
    v5 = (__int128 *)property[4];
    v6 = (__int128 *)property[5];
    if (v5 != v6)
    {
      v7 = v5 + 2;
      do
      {
        v8 = *(v7 - 2);
        *(_OWORD *)&v14[9] = *(__int128 *)((char *)v7 - 23);
        *(_OWORD *)v14 = v8;
        if (*((char *)v7 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v7, *((_QWORD *)v7 + 1));
        }
        else
        {
          v9 = *v7;
          __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v7 + 2);
          *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v9;
        }
        v10 = v7 - 2;
        v16 = *((_DWORD *)v7 + 6);
        -[VKDebugTreePropertyNode idValueForTreeValue:](self, "idValueForTreeValue:", v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[__CFString appendString:](v3, "appendString:", v11, *(_QWORD *)v14, *(_OWORD *)&v14[8], *(_QWORD *)&v14[24]);
          }
          else
          {
            objc_msgSend(v11, "stringValue", *(_QWORD *)v14, *(_OWORD *)&v14[8], *(_QWORD *)&v14[24]);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString appendString:](v3, "appendString:", v12);

          }
          -[__CFString appendString:](v3, "appendString:", CFSTR(", "));
        }

        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        v7 += 4;
      }
      while (v10 + 4 != v6);
    }
    -[__CFString deleteCharactersInRange:](v3, "deleteCharactersInRange:", -[__CFString length](v3, "length", *(_QWORD *)v14, *(_OWORD *)&v14[8], *(_QWORD *)&v14[24]) - 2, 2);
  }
  return v3;
}

- (id)tagsColumn
{
  __CFString *v3;
  _QWORD *property;
  __int128 *v5;
  __int128 *i;
  __int128 v7;
  std::string *p_p;
  void *v9;
  std::string __p;

  if (*((_QWORD *)self->_property + 8) == *((_QWORD *)self->_property + 7))
  {
    v3 = CFSTR(" ");
  }
  else
  {
    v3 = (__CFString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    property = self->_property;
    v5 = (__int128 *)property[7];
    for (i = (__int128 *)property[8]; v5 != i; v5 = (__int128 *)((char *)v5 + 24))
    {
      if (*((char *)v5 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v5, *((_QWORD *)v5 + 1));
      }
      else
      {
        v7 = *v5;
        __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v5 + 2);
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v7;
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString appendString:](v3, "appendString:", v9);

      -[__CFString appendString:](v3, "appendString:", CFSTR(", "));
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
    -[__CFString deleteCharactersInRange:](v3, "deleteCharactersInRange:", -[__CFString length](v3, "length") - 2, 2);
  }
  return v3;
}

- (void)searchNodes:(id)a3 withParameter:(id)a4
{
  id v6;
  const void **property;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  __int128 *v11;
  __int128 *v12;
  __int128 *v13;
  __int128 v14;
  __int128 v15;
  __int128 *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __int128 *v23;
  __int128 *v24;
  __int128 v25;
  _BYTE *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  _BYTE v32[25];
  std::string __p;
  int v34;

  v31 = a3;
  v6 = a4;
  property = (const void **)self->_property;
  if (*((char *)property + 23) < 0)
    property = (const void **)*property;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", property);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "rangeOfString:options:", v6, 1);

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = self->_property;
    v11 = (__int128 *)v10[4];
    v12 = (__int128 *)v10[5];
    if (v11 != v12)
    {
      v30 = 24;
      v13 = v11 + 2;
      while (1)
      {
        v14 = *(v13 - 2);
        *(_OWORD *)&v32[9] = *(__int128 *)((char *)v13 - 23);
        *(_OWORD *)v32 = v14;
        if (*((char *)v13 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v13, *((_QWORD *)v13 + 1));
        }
        else
        {
          v15 = *v13;
          __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v13 + 2);
          *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v15;
        }
        v16 = v13 - 2;
        v34 = *((_DWORD *)v13 + 6);
        -[VKDebugTreePropertyNode idValueForTreeValue:](self, "idValueForTreeValue:", v32, v30);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          v18 = 3;
          goto LABEL_18;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v17, "rangeOfString:options:", v6, 1) == 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_16;
        }
        else
        {
          objc_msgSend(v17, "stringValue");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "rangeOfString:options:", v6, 1);

          if (v20 == 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_16:
            v18 = 0;
            goto LABEL_18;
          }
        }
        -[VKDebugTreeNode parent](self, "parent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addObject:", v21);

        v18 = 1;
LABEL_18:

        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(__p.__r_.__value_.__l.__data_);
          if (v18 != 3)
          {
LABEL_22:
            if (v18)
              goto LABEL_40;
          }
        }
        else if (v18 != 3)
        {
          goto LABEL_22;
        }
        v13 += 4;
        if (v16 + 4 == v12)
        {
          v10 = *(Class *)((char *)&self->super.super.isa + v30);
          break;
        }
      }
    }
    v23 = (__int128 *)v10[7];
    v24 = (__int128 *)v10[8];
    if (v23 != v24)
    {
      while (1)
      {
        if (*((char *)v23 + 23) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)v32, *(const std::string::value_type **)v23, *((_QWORD *)v23 + 1));
        }
        else
        {
          v25 = *v23;
          *(_QWORD *)&v32[16] = *((_QWORD *)v23 + 2);
          *(_OWORD *)v32 = v25;
        }
        v26 = v32[23] >= 0 ? v32 : *(_BYTE **)v32;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "rangeOfString:options:", v6, 1);

        if (v28 != 0x7FFFFFFFFFFFFFFFLL)
          break;
        if ((v32[23] & 0x80000000) != 0)
          operator delete(*(void **)v32);
        v23 = (__int128 *)((char *)v23 + 24);
        if (v23 == v24)
          goto LABEL_40;
      }
      -[VKDebugTreeNode parent](self, "parent");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addObject:", v29);

      if ((v32[23] & 0x80000000) != 0)
        operator delete(*(void **)v32);
    }
  }
  else
  {
    -[VKDebugTreeNode parent](self, "parent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObject:", v22);

  }
LABEL_40:

}

- (id)idValueForTreeValue:(const void *)a3
{
  __CFString *v3;
  id result;
  __CFString *v5;
  void *v6;
  void *v7;
  std::string *v8;
  std::string v9;

  switch(*((_DWORD *)a3 + 14))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 1:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)a3 + 1));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.02f"), *((_QWORD *)a3 + 2));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 3:
      if (*((_BYTE *)a3 + 24))
        v5 = CFSTR("True");
      else
        v5 = CFSTR("False");
      v3 = v5;
LABEL_10:
      v6 = v3;
      goto LABEL_11;
    case 4:
      v7 = (void *)MEMORY[0x1E0CB3940];
      if (*((char *)a3 + 55) < 0)
        std::string::__init_copy_ctor_external(&v9, *((const std::string::value_type **)a3 + 4), *((_QWORD *)a3 + 5));
      else
        v9 = *(std::string *)((char *)a3 + 32);
      if ((v9.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v8 = &v9;
      else
        v8 = (std::string *)v9.__r_.__value_.__r.__words[0];
      objc_msgSend(v7, "stringWithUTF8String:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v9.__r_.__value_.__l.__data_);
LABEL_11:
      result = v6;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (VKDebugTreePropertyNode)initWithDebugTreeProperty:(const void *)a3 withParent:(id)a4
{
  VKDebugTreePropertyNode *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VKDebugTreePropertyNode;
  result = -[VKDebugTreeNode initWithParent:](&v6, sel_initWithParent_, a4);
  if (result)
    result->_property = a3;
  return result;
}

@end
