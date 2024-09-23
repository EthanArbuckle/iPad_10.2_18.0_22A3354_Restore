@implementation NSString(CXX)

+ (uint64_t)stringWithCXXString:()CXX
{
  if (*((char *)a3 + 23) < 0)
    a3 = (uint64_t *)*a3;
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", a3, 1);
}

- (_QWORD)asCXXString
{
  return std::string::basic_string[abi:ne180100]<0>(a2, (char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String"));
}

@end
