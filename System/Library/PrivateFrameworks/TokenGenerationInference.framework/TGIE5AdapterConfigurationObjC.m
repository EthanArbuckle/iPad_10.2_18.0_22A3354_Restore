@implementation TGIE5AdapterConfigurationObjC

- (TGIE5AdapterConfigurationObjC)initWithAdapterType:(id)a3 symbolName:(id)a4 mutableWeightsFilePath:(id)a5
{
  id v8;
  id v9;
  __CFString *v10;
  TGIE5AdapterConfigurationObjC *v11;
  uint64_t v12;
  NSString *adapterType;
  uint64_t v14;
  NSString *symbolName;
  uint64_t v16;
  NSString *mutableWeightsFilePath;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  NSString *description;
  objc_super v23;
  _QWORD v24[3];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (__CFString *)a5;
  v23.receiver = self;
  v23.super_class = (Class)TGIE5AdapterConfigurationObjC;
  v11 = -[TGIE5AdapterConfigurationObjC init](&v23, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    adapterType = v11->_adapterType;
    v11->_adapterType = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    symbolName = v11->_symbolName;
    v11->_symbolName = (NSString *)v14;

    v16 = -[__CFString copy](v10, "copy");
    mutableWeightsFilePath = v11->_mutableWeightsFilePath;
    v11->_mutableWeightsFilePath = (NSString *)v16;

    v24[0] = CFSTR("adapterType");
    v24[1] = CFSTR("symbolName");
    v25[0] = v8;
    v25[1] = v9;
    v24[2] = CFSTR("mutableWeightsFilePath");
    if (v10)
      v18 = v10;
    else
      v18 = CFSTR("nil");
    v25[2] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "description");
    v20 = objc_claimAutoreleasedReturnValue();
    description = v11->_description;
    v11->_description = (NSString *)v20;

  }
  return v11;
}

- (TGIE5AdapterConfiguration)adapterConfiguration
{
  void *v1;
  void *v2;
  id v4;
  id v5;
  id v6;
  TGIE5AdapterConfiguration *result;
  uint64_t v8;
  char *v9;

  v2 = v1;
  objc_msgSend(v1, "adapterType", 0, 0, 0);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(retstr, (char *)objc_msgSend(v4, "UTF8String"));
  objc_msgSend(v2, "symbolName");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(retstr->var0.var0.var1.var0, (char *)objc_msgSend(v5, "UTF8String"));
  objc_msgSend(v2, "mutableWeightsFilePath");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (char *)objc_msgSend(v6, "UTF8String");
  std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>((std::string *)&retstr[1], &v9);

  v9 = (char *)&v8;
  std::vector<TGIE5Function>::__destroy_vector::operator()[abi:ne180100]((void ***)&v9);
  return result;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[TGIE5AdapterConfigurationObjC adapterType](self, "adapterType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[TGIE5AdapterConfigurationObjC symbolName](self, "symbolName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  -[TGIE5AdapterConfigurationObjC mutableWeightsFilePath](self, "mutableWeightsFilePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ v4 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[TGIE5AdapterConfigurationObjC adapterType](self, "adapterType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "adapterType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[TGIE5AdapterConfigurationObjC symbolName](self, "symbolName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "symbolName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqual:", v9))
      {
        -[TGIE5AdapterConfigurationObjC mutableWeightsFilePath](self, "mutableWeightsFilePath");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "mutableWeightsFilePath");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  return objc_getProperty(self, a2, 8, 1);
}

- (NSString)adapterType
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)symbolName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)mutableWeightsFilePath
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableWeightsFilePath, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_adapterType, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

@end
