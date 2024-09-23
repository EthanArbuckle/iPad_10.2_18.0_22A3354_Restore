@implementation NSString

- (basic_string<char,)ps_STLStringOnNil:(std::allocator<char>> *__return_ptr)retstr
{
  void *v1;
  void *v2;
  void *v3;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *result;
  id v6;

  v3 = v1;
  v6 = v2;
  if (v3 || (v3 = v6) != 0)
  {
    objc_msgSend(v3, "ps_STLString");

  }
  else
  {
    retstr->__r_.__value_.var0.var1.__data_ = 0;
    retstr->__r_.__value_.var0.var1.__size_ = 0;
    *((_QWORD *)&retstr->__r_.__value_.var0.var1 + 2) = 0;

  }
  return result;
}

+ (id)ps_stringWithSTL:(const void *)a3
{
  void *v4;
  const void *v5;
  void *v6;

  v4 = objc_autoreleasePoolPush();
  if (*((char *)a3 + 23) >= 0)
    v5 = a3;
  else
    v5 = *(const void **)a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v5));
  objc_autoreleasePoolPop(v4);
  return v6;
}

- (basic_string<char,)ps_STLString
{
  void *v1;
  void *v2;
  void *v4;
  const char *v5;
  size_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v10;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *result;

  v2 = v1;
  v4 = objc_autoreleasePoolPush();
  v5 = (const char *)objc_msgSend(objc_retainAutorelease(v2), "UTF8String");
  v6 = strlen(v5);
  if (v6 >= 0x7FFFFFFFFFFFFFF8)
    sub_1000CDE30();
  v7 = v6;
  if (v6 >= 0x17)
  {
    v8 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17)
      v8 = v6 | 7;
    v9 = v8 + 1;
    v10 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)operator new(v8 + 1);
    retstr->__r_.__value_.var0.var1.__size_ = v7;
    *((_QWORD *)&retstr->__r_.__value_.var0.var1 + 2) = v9 | 0x8000000000000000;
    retstr->__r_.__value_.var0.var1.__data_ = (char *)v10;
    retstr = v10;
  }
  else
  {
    *((_BYTE *)&retstr->__r_.__value_.var0.var1 + 23) = v6;
    if (!v6)
      goto LABEL_9;
  }
  memmove(retstr, v5, v7);
LABEL_9:
  retstr->__r_.__value_.var0.var0.__data_[v7] = 0;
  objc_autoreleasePoolPop(v4);
  return result;
}

+ (id)ps_stringWithUTF8Data:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(+[NSString ps_stringWithData:encoding:](NSString, "ps_stringWithData:encoding:", a3, 4));
}

+ (id)ps_stringWithData:(id)a3 encoding:(unint64_t)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v5, a4);

  return v6;
}

- (id)ps_UTF8Data
{
  return -[NSString dataUsingEncoding:](self, "dataUsingEncoding:", 4);
}

- (id)ps_urlEncode
{
  return (id)objc_autoreleaseReturnValue((id)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, 0, CFSTR("!*'\"();:@&=+$,/?%#[]% "),
                                               0x8000100u));
}

- (BOOL)ps_IsNilOrEmpty
{
  return !self || -[NSString length](self, "length") == 0;
}

- (id)ps_stringWithoutPrefix:(id)a3
{
  id v4;
  NSString *v5;

  v4 = a3;
  if (-[NSString hasPrefix:](self, "hasPrefix:", v4))
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString substringFromIndex:](self, "substringFromIndex:", objc_msgSend(v4, "length")));
  else
    v5 = self;

  return v5;
}

@end
