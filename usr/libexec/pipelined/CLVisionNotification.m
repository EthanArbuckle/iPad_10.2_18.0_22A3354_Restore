@implementation CLVisionNotification

- (unint64_t)arSessionState
{
  return self->_arSessionState;
}

- (CLVisionNotification)initWithCoder:(id)a3
{
  id v4;
  CLVisionNotification *v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;
  size_t v10;
  __int128 *p_dst;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *p_serializedVIOEstimation;
  id v13;
  void *v14;
  id v15;
  id v16;
  unint64_t v17;
  size_t v18;
  __int128 *v19;
  int *p_var0;
  CLVisionNotification *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 __dst;
  unint64_t v28;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CLVisionNotification;
  v5 = -[CLVisionNotification init](&v29, "init");
  if (v5)
  {
    v5->_arSessionState = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("arSessionState"));
    v5->_notificationType = objc_msgSend(v4, "decodeIntForKey:", CFSTR("notificationType"));
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("vioEstimation"));
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v6));
    v8 = objc_msgSend(v7, "bytes");
    v9 = (unint64_t)objc_msgSend(v7, "length");
    v10 = v9;
    if (v9 > 0x7FFFFFFFFFFFFFF7)
      sub_1000CDE30();
    if (v9 >= 0x17)
    {
      v23 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v9 | 7) != 0x17)
        v23 = v9 | 7;
      v24 = v23 + 1;
      p_dst = (__int128 *)operator new(v23 + 1);
      *((_QWORD *)&__dst + 1) = v10;
      v28 = v24 | 0x8000000000000000;
      *(_QWORD *)&__dst = p_dst;
    }
    else
    {
      HIBYTE(v28) = v9;
      p_dst = &__dst;
      if (!v9)
      {
        LOBYTE(__dst) = 0;
        p_serializedVIOEstimation = &v5->_serializedVIOEstimation;
        if ((*((char *)&v5->_serializedVIOEstimation.__r_.__value_.var0.var1 + 23) & 0x80000000) == 0)
          goto LABEL_6;
LABEL_16:
        operator delete(p_serializedVIOEstimation->__r_.__value_.var0.var1.__data_);
LABEL_6:
        *(_OWORD *)p_serializedVIOEstimation->__r_.__value_.var0.var0.__data_ = __dst;
        *((_QWORD *)&p_serializedVIOEstimation->__r_.__value_.var0.var1 + 2) = v28;
        v13 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("vlLocalizationResult"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

        v15 = objc_retainAutorelease(v14);
        v16 = objc_msgSend(v15, "bytes");
        v17 = (unint64_t)objc_msgSend(v15, "length");
        v18 = v17;
        if (v17 > 0x7FFFFFFFFFFFFFF7)
          sub_1000CDE30();
        if (v17 >= 0x17)
        {
          v25 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v17 | 7) != 0x17)
            v25 = v17 | 7;
          v26 = v25 + 1;
          v19 = (__int128 *)operator new(v25 + 1);
          *((_QWORD *)&__dst + 1) = v18;
          v28 = v26 | 0x8000000000000000;
          *(_QWORD *)&__dst = v19;
        }
        else
        {
          HIBYTE(v28) = v17;
          v19 = &__dst;
          if (!v17)
          {
            LOBYTE(__dst) = 0;
            p_var0 = &v5->_serializedVIOEstimation.__r_.var0;
            if ((v5->_serializedVLLocalizationResult.__r_.__value_.var0.var0.__data_[7] & 0x80000000) == 0)
            {
LABEL_10:
              *(_OWORD *)p_var0 = __dst;
              *((_QWORD *)p_var0 + 2) = v28;
              v21 = v5;

              goto LABEL_11;
            }
LABEL_21:
            operator delete(*(void **)p_var0);
            goto LABEL_10;
          }
        }
        memmove(v19, v16, v18);
        *((_BYTE *)v19 + v18) = 0;
        p_var0 = &v5->_serializedVIOEstimation.__r_.var0;
        if ((v5->_serializedVLLocalizationResult.__r_.__value_.var0.var0.__data_[7] & 0x80000000) == 0)
          goto LABEL_10;
        goto LABEL_21;
      }
    }
    memmove(p_dst, v8, v10);
    *((_BYTE *)p_dst + v10) = 0;
    p_serializedVIOEstimation = &v5->_serializedVIOEstimation;
    if ((*((char *)&v5->_serializedVIOEstimation.__r_.__value_.var0.var1 + 23) & 0x80000000) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_11:

  return v5;
}

- (int)notificationType
{
  return self->_notificationType;
}

- (void).cxx_destruct
{
  if ((self->_serializedVLLocalizationResult.__r_.__value_.var0.var0.__data_[7] & 0x80000000) == 0)
  {
    if ((*((char *)&self->_serializedVIOEstimation.__r_.__value_.var0.var1 + 23) & 0x80000000) == 0)
      return;
LABEL_5:
    operator delete(self->_serializedVIOEstimation.__r_.__value_.var0.var1.__data_);
    return;
  }
  operator delete(*(void **)&self->_serializedVIOEstimation.__r_.var0);
  if (*((char *)&self->_serializedVIOEstimation.__r_.__value_.var0.var1 + 23) < 0)
    goto LABEL_5;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLVisionNotification)init
{
  -[CLVisionNotification doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (CLVisionNotification)initWithARSessionState:(unint64_t)a3
{
  CLVisionNotification *v4;
  CLVisionNotification *v5;
  CLVisionNotification *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLVisionNotification;
  v4 = -[CLVisionNotification init](&v8, "init");
  v5 = v4;
  if (v4)
  {
    v4->_arSessionState = a3;
    v4->_notificationType = 0;
    v6 = v4;
  }

  return v5;
}

- (CLVisionNotification)initWithSerializedVIOEstimation:()basic_string<char
{
  id v4;
  CLVisionNotification *v5;
  CLVisionNotification *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLVisionNotification;
  v4 = -[CLVisionNotification init](&v8, "init");
  v5 = (CLVisionNotification *)v4;
  if (v4)
  {
    std::string::operator=((std::string *)v4 + 1, (const std::string *)a3);
    v5->_notificationType = 1;
    v6 = v5;
  }

  return v5;
}

- (CLVisionNotification)initWithSerializedVLLocalizationResult:()basic_string<char
{
  id v4;
  CLVisionNotification *v5;
  CLVisionNotification *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLVisionNotification;
  v4 = -[CLVisionNotification init](&v8, "init");
  v5 = (CLVisionNotification *)v4;
  if (v4)
  {
    std::string::operator=((std::string *)v4 + 2, (const std::string *)a3);
    v5->_notificationType = 2;
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  basic_string<char, std::char_traits<char>, std::allocator<char>> *data;
  unint64_t size;
  void *v6;
  int *p_var0;
  int64_t var0;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "encodeInt:forKey:", LODWORD(self->_arSessionState), CFSTR("arSessionState"));
  objc_msgSend(v10, "encodeInt:forKey:", self->_notificationType, CFSTR("notificationType"));
  if (*((char *)&self->_serializedVIOEstimation.__r_.__value_.var0.var1 + 23) < 0)
  {
    data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)self->_serializedVIOEstimation.__r_.__value_.var0.var1.__data_;
    size = self->_serializedVIOEstimation.__r_.__value_.var0.var1.__size_;
  }
  else
  {
    data = &self->_serializedVIOEstimation;
    size = *((unsigned __int8 *)&self->_serializedVIOEstimation.__r_.__value_.var0.var1 + 23);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", data, size));
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("vioEstimation"));

  if (self->_serializedVLLocalizationResult.__r_.__value_.var0.var0.__data_[7] < 0)
  {
    p_var0 = *(int **)&self->_serializedVIOEstimation.__r_.var0;
    var0 = self->_serializedVIOEstimation.var0;
  }
  else
  {
    p_var0 = &self->_serializedVIOEstimation.__r_.var0;
    var0 = self->_serializedVLLocalizationResult.__r_.__value_.var0.var0.__data_[7];
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", p_var0, var0));
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("vlLocalizationResult"));

}

- (basic_string<char,)serializedVIOEstimation
{
  basic_string<char, std::char_traits<char>, std::allocator<char>> *result;

  if (result[1].__r_.__value_.var0.var0.__data_[7] < 0)
    return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_10006CED8(retstr, *(void **)&result->__r_.var0, result->var0);
  *(_OWORD *)retstr->__r_.__value_.var0.var0.__data_ = *(_OWORD *)&result->__r_.var0;
  *((_QWORD *)&retstr->__r_.__value_.var0.var1 + 2) = result[1].__r_.__value_.var0.var1.__data_;
  return result;
}

- (basic_string<char,)serializedVLLocalizationResult
{
  basic_string<char, std::char_traits<char>, std::allocator<char>> *result;

  if (*((char *)&result[1].__r_.var1 + 3) < 0)
    return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_10006CED8(retstr, (void *)result[1].__r_.__value_.var0.var1.__size_, *((_QWORD *)&result[1].__r_.__value_.var0.var1+ 2));
  *(_OWORD *)retstr->__r_.__value_.var0.var0.__data_ = *(_OWORD *)&result[1].__r_.__value_.var0.var1.__size_;
  *((_QWORD *)&retstr->__r_.__value_.var0.var1 + 2) = *(_QWORD *)&result[1].__r_.var0;
  return result;
}

@end
