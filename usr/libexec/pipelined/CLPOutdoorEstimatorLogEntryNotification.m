@implementation CLPOutdoorEstimatorLogEntryNotification

- (CLPOutdoorEstimatorLogEntryNotification)initWithCoder:(id)a3
{
  id v4;
  CLPOutdoorEstimatorLogEntryNotification *v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;
  size_t v10;
  __int128 *p_dst;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *p_serializedOutdoorEstimatorLogEntry;
  __int128 v13;
  CLPOutdoorEstimatorLogEntryNotification *v14;
  uint64_t v16;
  uint64_t v17;
  __int128 __dst;
  unint64_t v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLPOutdoorEstimatorLogEntryNotification;
  v5 = -[CLPOutdoorEstimatorLogEntryNotification init](&v20, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("outdoorEstimatorLogEntry"));
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v6));
    v8 = objc_msgSend(v7, "bytes");
    v9 = (unint64_t)objc_msgSend(v7, "length");
    v10 = v9;
    if (v9 >= 0x7FFFFFFFFFFFFFF8)
      sub_1000CDE30();
    if (v9 >= 0x17)
    {
      v16 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v9 | 7) != 0x17)
        v16 = v9 | 7;
      v17 = v16 + 1;
      p_dst = (__int128 *)operator new(v16 + 1);
      *((_QWORD *)&__dst + 1) = v10;
      v19 = v17 | 0x8000000000000000;
      *(_QWORD *)&__dst = p_dst;
    }
    else
    {
      HIBYTE(v19) = v9;
      p_dst = &__dst;
      if (!v9)
      {
        LOBYTE(__dst) = 0;
        p_serializedOutdoorEstimatorLogEntry = &v5->_serializedOutdoorEstimatorLogEntry;
        if ((*((char *)&v5->_serializedOutdoorEstimatorLogEntry.__r_.__value_.var0.var1 + 23) & 0x80000000) == 0)
        {
LABEL_6:
          v13 = __dst;
          *((_QWORD *)&p_serializedOutdoorEstimatorLogEntry->__r_.__value_.var0.var1 + 2) = v19;
          *(_OWORD *)p_serializedOutdoorEstimatorLogEntry->__r_.__value_.var0.var0.__data_ = v13;
          v14 = v5;

          goto LABEL_7;
        }
LABEL_12:
        operator delete(p_serializedOutdoorEstimatorLogEntry->__r_.__value_.var0.var1.__data_);
        goto LABEL_6;
      }
    }
    memmove(p_dst, v8, v10);
    *((_BYTE *)p_dst + v10) = 0;
    p_serializedOutdoorEstimatorLogEntry = &v5->_serializedOutdoorEstimatorLogEntry;
    if ((*((char *)&v5->_serializedOutdoorEstimatorLogEntry.__r_.__value_.var0.var1 + 23) & 0x80000000) == 0)
      goto LABEL_6;
    goto LABEL_12;
  }
LABEL_7:

  return v5;
}

- (basic_string<char,)serializedOutdoorEstimatorLogEntry
{
  basic_string<char, std::char_traits<char>, std::allocator<char>> *result;

  if (*((char *)&result->__r_.var1 + 3) < 0)
    return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_10006CED8(retstr, (void *)result->__r_.__value_.var0.var1.__size_, *((_QWORD *)&result->__r_.__value_.var0.var1+ 2));
  *(_OWORD *)retstr->__r_.__value_.var0.var0.__data_ = *(_OWORD *)&result->__r_.__value_.var0.var1.__size_;
  *((_QWORD *)&retstr->__r_.__value_.var0.var1 + 2) = *(_QWORD *)&result->__r_.var0;
  return result;
}

- (void).cxx_destruct
{
  if (*((char *)&self->_serializedOutdoorEstimatorLogEntry.__r_.__value_.var0.var1 + 23) < 0)
    operator delete(self->_serializedOutdoorEstimatorLogEntry.__r_.__value_.var0.var1.__data_);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 8) = 0uLL;
  *((_QWORD *)self + 3) = 0;
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLPOutdoorEstimatorLogEntryNotification)init
{
  -[CLPOutdoorEstimatorLogEntryNotification doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (CLPOutdoorEstimatorLogEntryNotification)initWithSerializedOutdoorEstimatorLogEntry:()basic_string<char
{
  char *v4;
  CLPOutdoorEstimatorLogEntryNotification *v5;
  CLPOutdoorEstimatorLogEntryNotification *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLPOutdoorEstimatorLogEntryNotification;
  v4 = -[CLPOutdoorEstimatorLogEntryNotification init](&v8, "init");
  v5 = (CLPOutdoorEstimatorLogEntryNotification *)v4;
  if (v4)
  {
    std::string::operator=((std::string *)(v4 + 8), (const std::string *)a3);
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  basic_string<char, std::char_traits<char>, std::allocator<char>> *data;
  unint64_t size;
  void *v6;
  id v7;

  v7 = a3;
  if (*((char *)&self->_serializedOutdoorEstimatorLogEntry.__r_.__value_.var0.var1 + 23) < 0)
  {
    data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)self->_serializedOutdoorEstimatorLogEntry.__r_.__value_.var0.var1.__data_;
    size = self->_serializedOutdoorEstimatorLogEntry.__r_.__value_.var0.var1.__size_;
  }
  else
  {
    data = &self->_serializedOutdoorEstimatorLogEntry;
    size = *((unsigned __int8 *)&self->_serializedOutdoorEstimatorLogEntry.__r_.__value_.var0.var1 + 23);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", data, size));
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("outdoorEstimatorLogEntry"));

}

@end
