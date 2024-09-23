@implementation USKResourcePath

- (SdfAssetPath)sdfAssetPath
{
  uint64_t v1;
  uint64_t v2;
  SdfAssetPath *result;

  v2 = v1;
  if (*(char *)(v1 + 31) < 0)
  {
    sub_2263AE36C(retstr, *(void **)(v1 + 8), *(_QWORD *)(v1 + 16));
  }
  else
  {
    *(_OWORD *)retstr->_assetPath.__r_.__value_.var0.var0.__data_ = *(_OWORD *)(v1 + 8);
    *((_QWORD *)&retstr->_assetPath.__r_.__value_.var0.var1 + 2) = *(_QWORD *)(v1 + 24);
  }
  result = (SdfAssetPath *)&retstr->_assetPath.__r_.var0;
  if (*(char *)(v2 + 55) < 0)
    return (SdfAssetPath *)sub_2263AE36C(result, *(void **)(v2 + 32), *(_QWORD *)(v2 + 40));
  *(_OWORD *)result->_assetPath.__r_.__value_.var0.var0.__data_ = *(_OWORD *)(v2 + 32);
  retstr[1]._assetPath.__r_.__value_.var0.var1.__data_ = *(char **)(v2 + 48);
  return result;
}

- (USKResourcePath)initWithSdfAssetPath:(SdfAssetPath *)a3
{
  char *v4;
  char *v5;
  char *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)USKResourcePath;
  v4 = -[USKResourcePath init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    std::string::operator=((std::string *)(v4 + 8), (const std::string *)a3);
    std::string::operator=((std::string *)(v5 + 32), (const std::string *)&a3->_assetPath.__r_.var0);
    v6 = v5;
  }

  return (USKResourcePath *)v5;
}

- (id)path
{
  uint64_t v2;
  void *v3;
  void *__p[2];
  uint64_t v6;

  __p[0] = 0;
  __p[1] = 0;
  v6 = 0;
  if (*((char *)&self->_path._assetPath.__r_.__value_.var0.var1 + 23) < 0)
  {
    sub_2263AE36C(__p, self->_path._assetPath.__r_.__value_.var0.var1.__data_, self->_path._assetPath.__r_.__value_.var0.var1.__size_);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)self->_path._assetPath.__r_.__value_.var0.var0.__data_;
    v6 = *((_QWORD *)&self->_path._assetPath.__r_.__value_.var0.var1 + 2);
  }
  if (v6 >= 0)
    objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], a2, (uint64_t)__p, v2, __p[0], __p[1], v6);
  else
    objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], a2, (uint64_t)__p[0], v2, __p[0], __p[1], v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v6) < 0)
    operator delete(__p[0]);
  return v3;
}

- (id)resolvedPath
{
  uint64_t v2;
  void *v3;
  void *__p[2];
  Class isa;

  __p[0] = 0;
  __p[1] = 0;
  isa = 0;
  if (SHIBYTE(self[1].super.isa) < 0)
  {
    sub_2263AE36C(__p, *(void **)&self->_path._assetPath.__r_.var0, self->_path._assetPath.var0);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)&self->_path._assetPath.__r_.var0;
    isa = self[1].super.isa;
  }
  if (SHIBYTE(isa) >= 0)
    objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], a2, (uint64_t)__p, v2, __p[0], __p[1], isa);
  else
    objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], a2, (uint64_t)__p[0], v2, __p[0], __p[1], isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(isa) < 0)
    operator delete(__p[0]);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  USKResourcePath *v4;
  USKResourcePath *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  void *v11;
  char v12;
  void *__p;
  char v14;

  v4 = (USKResourcePath *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_sdfAssetPath(v5, v6, v7, v8);
    v9 = sub_2263C35E0((unsigned __int8 *)&self->_path, (unsigned __int8 *)&v11);
    if (v14 < 0)
      operator delete(__p);
    if (v12 < 0)
      operator delete(v11);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  _QWORD v3[2];

  v3[0] = 0;
  v3[1] = 0;
  sub_2263C3588((pxrInternal__aapl__pxrReserved__::Tf_HashState *)v3, self->_path._assetPath.__r_.__value_.var0.var0.__data_, (uint64_t)&self->_path._assetPath.__r_.var0);
  return bswap64(0x9E3779B97F4A7C55 * v3[0]);
}

- (void).cxx_destruct
{
  if (SHIBYTE(self[1].super.isa) < 0)
    operator delete(*(void **)&self->_path._assetPath.__r_.var0);
  if (*((char *)&self->_path._assetPath.__r_.__value_.var0.var1 + 23) < 0)
    operator delete(self->_path._assetPath.__r_.__value_.var0.var1.__data_);
}

- (id).cxx_construct
{
  pxrInternal__aapl__pxrReserved__::SdfAssetPath::SdfAssetPath((pxrInternal__aapl__pxrReserved__::SdfAssetPath *)&self->_path);
  return self;
}

@end
