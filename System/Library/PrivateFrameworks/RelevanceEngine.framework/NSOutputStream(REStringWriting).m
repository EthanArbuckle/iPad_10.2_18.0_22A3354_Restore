@implementation NSOutputStream(REStringWriting)

- (void)re_writeString:()REStringWriting
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "lengthOfBytesUsingEncoding:", 4);
  if (v5)
  {
    v6 = v5;
    if (v5 == 1)
    {
      v9 = objc_msgSend(v4, "characterAtIndex:", 0);
      objc_msgSend(a1, "write:maxLength:", &v9, 1);
    }
    else
    {
      v7 = objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
      if (v7)
      {
        v8 = v7;
        do
          v6 -= objc_msgSend(a1, "write:maxLength:", v8, v6);
        while (v6 && (objc_msgSend(a1, "hasSpaceAvailable") & 1) != 0);
      }
    }
  }

}

@end
