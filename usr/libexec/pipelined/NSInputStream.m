@implementation NSInputStream

+ (pair<NSInputStream)ps_inputStreamWithFileAtPath:(const void *)a3
{
  _QWORD *v3;
  _QWORD *v5;
  off_t v6;
  void *v7;
  NSInputStream *v8;
  unint64_t v9;
  void *__p;
  void *v11[2];
  char v12;
  std::string v13;
  __int128 v14;
  uint64_t v15;
  pair<NSInputStream *, unsigned long> result;

  v5 = v3;
  sub_10006DB18((const char *)a3, 0, (int *)&v13);
  if (LODWORD(v13.__r_.__value_.__l.__data_) != 2)
  {
    sub_1000D5048(v11, "");
    sub_100219DCC("Can't create an input stream for something not a file @ ", &v13);
    if (*((char *)a3 + 23) < 0)
    {
      sub_10006CED8(&v14, *(void **)a3, *((_QWORD *)a3 + 1));
    }
    else
    {
      v14 = *(_OWORD *)a3;
      v15 = *((_QWORD *)a3 + 2);
    }
    sub_100174738((uint64_t)v11, (uint64_t)&v13, 2);
    if (SHIBYTE(v15) < 0)
    {
      operator delete((void *)v14);
      if ((SHIBYTE(v13.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_8:
        if ((v12 & 0x80000000) == 0)
          goto LABEL_9;
LABEL_12:
        operator delete(v11[0]);
LABEL_9:
        sub_10015C2DC((uint64_t)&__p);
      }
    }
    else if ((SHIBYTE(v13.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_8;
    }
    operator delete(v13.__r_.__value_.__l.__data_);
    if ((v12 & 0x80000000) == 0)
      goto LABEL_9;
    goto LABEL_12;
  }
  v6 = sub_10006CE40((uint64_t)a3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString ps_stringWithSTL:](NSString, "ps_stringWithSTL:", a3));
  *v5 = objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithFileAtPath:](NSInputStream, "inputStreamWithFileAtPath:", v7));
  v5[1] = v6;

  result.second = v9;
  result.first = v8;
  return result;
}

+ (pair<NSInputStream)ps_inputStreamWithString:(id)a3
{
  NSInputStream *v3;
  unint64_t v4;
  pair<NSInputStream *, unsigned long> result;

  v3 = (NSInputStream *)+[NSInputStream ps_inputStreamWithString:usingEncoding:](NSInputStream, "ps_inputStreamWithString:usingEncoding:", a3, 4);
  result.second = v4;
  result.first = v3;
  return result;
}

+ (pair<NSInputStream)ps_inputStreamWithString:(id)a3 usingEncoding:(unint64_t)a4
{
  uint64_t *v4;
  uint64_t *v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSInputStream *v10;
  unint64_t v11;
  id v12;
  pair<NSInputStream *, unsigned long> result;

  v6 = v4;
  v12 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dataUsingEncoding:", a4));
  v8 = objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithData:](NSInputStream, "inputStreamWithData:", v7));
  v9 = objc_msgSend(v7, "length");
  *v6 = v8;
  v6[1] = (uint64_t)v9;

  result.second = v11;
  result.first = v10;
  return result;
}

+ (pair<NSInputStream)ps_inputStreamWithData:(id)a3
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  id v6;
  NSInputStream *v7;
  unint64_t v8;
  id v9;
  pair<NSInputStream *, unsigned long> result;

  v4 = v3;
  v9 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithData:](NSInputStream, "inputStreamWithData:"));
  v6 = objc_msgSend(v9, "length");
  *v4 = v5;
  v4[1] = (uint64_t)v6;

  result.second = v8;
  result.first = v7;
  return result;
}

@end
