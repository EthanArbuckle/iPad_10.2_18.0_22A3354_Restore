@implementation WK_RTCH264ProfileLevelId

- (WK_RTCH264ProfileLevelId)initWithHexString:(id)a3
{
  id v4;
  WK_RTCH264ProfileLevelId *v5;
  WK_RTCH264ProfileLevelId *v6;
  webrtc *v7;
  const char *v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WK_RTCH264ProfileLevelId;
  v5 = -[WK_RTCH264ProfileLevelId init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    -[WK_RTCH264ProfileLevelId setHexString:](v5, "setHexString:", v4);
    v7 = (webrtc *)objc_msgSend(objc_retainAutorelease(v4), "cStringUsingEncoding:", 4);
    v9 = webrtc::ParseH264ProfileLevelId(v7, v8);
    if (v10)
    {
      v11 = v9;
      -[WK_RTCH264ProfileLevelId setProfile:](v6, "setProfile:", (int)v9);
      -[WK_RTCH264ProfileLevelId setLevel:](v6, "setLevel:", v11 >> 32);
    }
  }

  return v6;
}

- (WK_RTCH264ProfileLevelId)initWithProfile:(unint64_t)a3 level:(unint64_t)a4
{
  WK_RTCH264ProfileLevelId *v6;
  WK_RTCH264ProfileLevelId *v7;
  void *v8;
  std::string *p_p;
  void *v10;
  std::string __p;
  std::string v13;
  char v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WK_RTCH264ProfileLevelId;
  v6 = -[WK_RTCH264ProfileLevelId init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    -[WK_RTCH264ProfileLevelId setProfile:](v6, "setProfile:", a3);
    -[WK_RTCH264ProfileLevelId setLevel:](v7, "setLevel:", a4);
    __p.__r_.__value_.__r.__words[0] = __PAIR64__(a4, a3);
    webrtc::H264ProfileLevelIdToString((int *)&__p, (int *)&v13);
    v8 = (void *)MEMORY[0x24BDD17C8];
    if (v14)
    {
      if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&__p, v13.__r_.__value_.__l.__data_, v13.__r_.__value_.__l.__size_);
      else
        __p = v13;
    }
    else
    {
      *((_BYTE *)&__p.__r_.__value_.__s + 23) = 0;
      __p.__r_.__value_.__s.__data_[0] = 0;
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    objc_msgSend(v8, "stringWithCString:encoding:", p_p, 4, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WK_RTCH264ProfileLevelId setHexString:](v7, "setHexString:", v10);

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (v14 && SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v13.__r_.__value_.__l.__data_);
  }
  return v7;
}

- (unint64_t)profile
{
  return self->_profile;
}

- (void)setProfile:(unint64_t)a3
{
  self->_profile = a3;
}

- (unint64_t)level
{
  return self->_level;
}

- (void)setLevel:(unint64_t)a3
{
  self->_level = a3;
}

- (NSString)hexString
{
  return self->_hexString;
}

- (void)setHexString:(id)a3
{
  objc_storeStrong((id *)&self->_hexString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hexString, 0);
}

@end
