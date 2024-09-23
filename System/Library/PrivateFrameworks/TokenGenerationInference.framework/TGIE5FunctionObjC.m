@implementation TGIE5FunctionObjC

- (TGIE5FunctionObjC)initWithName:(id)a3 queryLength:(int64_t)a4 contextSize:(int64_t)a5 adapterType:(id)a6
{
  id v10;
  __CFString *v11;
  TGIE5FunctionObjC *v12;
  uint64_t v13;
  NSString *name;
  uint64_t v15;
  NSString *adapterType;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;
  NSString *description;
  objc_super v25;
  _QWORD v26[4];
  _QWORD v27[5];

  v27[4] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (__CFString *)a6;
  v25.receiver = self;
  v25.super_class = (Class)TGIE5FunctionObjC;
  v12 = -[TGIE5FunctionObjC init](&v25, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    name = v12->_name;
    v12->_name = (NSString *)v13;

    v12->_queryLength = a4;
    v12->_contextSize = a5;
    v15 = -[__CFString copy](v11, "copy");
    adapterType = v12->_adapterType;
    v12->_adapterType = (NSString *)v15;

    v27[0] = v10;
    v26[0] = CFSTR("name");
    v26[1] = CFSTR("queryLength");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v17;
    v26[2] = CFSTR("contextSize");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    v26[3] = CFSTR("adapterType");
    v20 = CFSTR("nil");
    if (v11)
      v20 = v11;
    v27[2] = v18;
    v27[3] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "description");
    v22 = objc_claimAutoreleasedReturnValue();
    description = v12->_description;
    v12->_description = (NSString *)v22;

  }
  return v12;
}

- (TGIE5Function)e5Function
{
  void *v1;
  void *v2;
  void *v4;
  id v5;
  id v6;
  TGIE5Function *result;
  std::string::value_type *v8;
  std::string __p;
  char v10;

  v2 = v1;
  __p.__r_.__value_.__s.__data_[0] = 0;
  v10 = 0;
  objc_msgSend(v1, "adapterType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v2, "adapterType");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (std::string::value_type *)objc_msgSend(v5, "UTF8String");
    std::optional<std::string>::operator=[abi:ne180100]<char const*,void>(&__p, &v8);

  }
  objc_msgSend(v2, "name");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(retstr, (char *)objc_msgSend(v6, "UTF8String"));
  LODWORD(retstr->var0.var0.var1.var0[0]) = objc_msgSend(v2, "queryLength");
  HIDWORD(retstr->var0.var0.var1.var0[0]) = objc_msgSend(v2, "contextSize");
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100]((std::string *)&retstr->var0.var0.var1.var0[1], (__int128 *)&__p);

  if (v10)
  {
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  return result;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  unint64_t v8;

  -[TGIE5FunctionObjC name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v5 = -[TGIE5FunctionObjC queryLength](self, "queryLength");
  v6 = -[TGIE5FunctionObjC contextSize](self, "contextSize");
  -[TGIE5FunctionObjC adapterType](self, "adapterType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5 ^ v4 ^ v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int64_t v8;
  int64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  char v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[TGIE5FunctionObjC name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7)
      && (v8 = -[TGIE5FunctionObjC queryLength](self, "queryLength"), v8 == objc_msgSend(v5, "queryLength"))
      && (v9 = -[TGIE5FunctionObjC contextSize](self, "contextSize"), v9 == objc_msgSend(v5, "contextSize")))
    {
      -[TGIE5FunctionObjC adapterType](self, "adapterType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "adapterType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v10;
      v13 = v11;
      v14 = (void *)v13;
      if (v12 | v13)
      {
        if (!v12 || v13)
          v15 = objc_msgSend((id)v12, "isEqual:", v13);
        else
          v15 = 0;
      }
      else
      {
        v15 = 1;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)description
{
  return objc_getProperty(self, a2, 8, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)queryLength
{
  return self->_queryLength;
}

- (int64_t)contextSize
{
  return self->_contextSize;
}

- (NSString)adapterType
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adapterType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

@end
