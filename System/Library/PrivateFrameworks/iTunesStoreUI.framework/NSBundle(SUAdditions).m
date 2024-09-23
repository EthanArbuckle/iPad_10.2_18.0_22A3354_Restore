@implementation NSBundle(SUAdditions)

- (uint64_t)newDataURLForResource:()SUAdditions ofType:withMIMEType:
{
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;

  if (!objc_msgSend(a5, "hasPrefix:", CFSTR("image"))
    || (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "scale"), v9 != 2.0)
    || (v10 = objc_msgSend(a1, "pathForResource:ofType:", objc_msgSend(a3, "stringByAppendingString:", CFSTR("@2x")), a4)) == 0)
  {
    v10 = objc_msgSend(a1, "pathForResource:ofType:", a3, a4);
    if (!v10)
      return 0;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfFile:", v10);
  if (!v11)
    return 0;
  v12 = v11;
  v13 = objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
  if (v13)
  {
    v14 = v13;
    v15 = objc_alloc(MEMORY[0x24BDBCF48]);
    v16 = objc_msgSend(v15, "initWithString:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("data:%@;base64,%@"), a5, v14));
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (uint64_t)pathForITunesResource:()SUAdditions ofType:
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "pathForResource:ofType:", a3, a4);
  if (!result)
    return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", a3, a4);
  return result;
}

@end
