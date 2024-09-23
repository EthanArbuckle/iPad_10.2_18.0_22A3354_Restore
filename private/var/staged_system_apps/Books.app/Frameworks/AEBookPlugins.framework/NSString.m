@implementation NSString

+ (id)md5StringWithContentsOfFile:(id)a3
{
  return (id)ITFileUtil::createMd5String((ITFileUtil *)a3, (const __CFString *)a2);
}

+ (id)fastHashStringFromPath:(id)a3
{
  return (id)ITFileUtil::createFastFileHash((ITFileUtil *)a3, (const __CFString *)a2);
}

+ (id)pathRelativeToContentBase:(id)a3 forRelativePath:(id)a4 startingFromAbsoluteFolderPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v8;
  v11 = v10;
  if ((objc_msgSend(v9, "isEqualToString:", v7) & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", v10));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByStandardizingPath"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByStandardizingPath"));
    v11 = v10;
    if (objc_msgSend(v13, "hasPrefix:", v14))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "substringFromIndex:", objc_msgSend(v14, "length")));

      if ((unint64_t)objc_msgSend(v11, "length") >= 2
        && objc_msgSend(v11, "characterAtIndex:", 0) == 47)
      {
        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substringFromIndex:", 1));

        v11 = (void *)v15;
      }
    }

  }
  return v11;
}

@end
