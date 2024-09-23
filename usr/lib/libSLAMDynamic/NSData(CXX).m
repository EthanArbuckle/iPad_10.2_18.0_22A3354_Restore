@implementation NSData(CXX)

+ (uint64_t)dataWithCXXVector:()CXX
{
  return objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *a3, a3[1] - *a3);
}

- (_QWORD)asCXXVector
{
  id v3;
  const void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_retainAutorelease(a1);
  v4 = (const void *)objc_msgSend(v3, "bytes");
  v5 = objc_retainAutorelease(v3);
  v6 = objc_msgSend(v5, "bytes");
  v7 = v6 + objc_msgSend(v5, "length");
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  return std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(a2, v4, v7, v7 - (_QWORD)v4);
}

@end
