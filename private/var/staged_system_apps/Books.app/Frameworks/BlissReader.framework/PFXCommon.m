@implementation PFXCommon

+ (void)writeString:(id)a3 toStream:(id)a4 atEntry:(id)a5 isCompressed:(BOOL)a6
{
  _BOOL8 v6;
  id v9;

  v6 = a6;
  v9 = objc_msgSend(a3, "dataUsingEncoding:", 4);
  objc_msgSend(a4, "beginEntryWithName:isCompressed:uncompressedSize:", a5, v6, objc_msgSend(v9, "length"));
  objc_msgSend(a4, "writeBuffer:size:", objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"));
}

+ (id)relativePathFromFile:(id)a3 toPath:(id)a4
{
  return objc_msgSend(a4, "tsu_stringWithPathRelativeTo:allowBacktracking:", objc_msgSend(a3, "stringByDeletingLastPathComponent"), 1);
}

+ (id)absolutePathWithUrl:(id)a3 relativeToFile:(id)a4
{
  id v4;

  v4 = a4;
  if ((objc_msgSend(a4, "hasPrefix:", CFSTR("/")) & 1) == 0)
    v4 = objc_msgSend(CFSTR("/"), "stringByAppendingString:", v4);
  return -[NSString substringFromIndex:](-[NSURL path](+[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", objc_msgSend(a3, "stringByAddingPercentEncodingWithAllowedCharacters:", +[NSCharacterSet URLPathAllowedCharacterSet](NSCharacterSet, "URLPathAllowedCharacterSet")), +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v4, 0)), "path"), "substringFromIndex:", 1);
}

+ (id)dataWithContentsOfURL:(id)a3
{
  if (objc_msgSend(a3, "isFileURL"))
    return +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", objc_msgSend(objc_msgSend(a3, "path"), "stringByStandardizingPath"));
  else
    return +[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", a3);
}

+ (id)urlWithRelativeString:(id)a3 sourceUrl:(id)a4
{
  id v5;
  uint64_t v6;

  v5 = a3;
  if (objc_msgSend(a3, "rangeOfString:", CFSTR("%")) == (id)0x7FFFFFFFFFFFFFFFLL || v6 == 0)
    v5 = objc_msgSend(v5, "stringByAddingPercentEncodingWithAllowedCharacters:", +[NSCharacterSet URLPathAllowedCharacterSet](NSCharacterSet, "URLPathAllowedCharacterSet"));
  return +[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", v5, a4);
}

+ (id)dataWithContentsOfURLString:(id)a3 sourceUrl:(id)a4
{
  return +[PFXCommon dataWithContentsOfURL:](PFXCommon, "dataWithContentsOfURL:", objc_msgSend(a1, "urlWithRelativeString:sourceUrl:", a3, a4));
}

+ (id)stringWithContentsOfPercentEscapedURLString:(id)a3 sourceUrl:(id)a4
{
  return objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", objc_msgSend(a1, "dataWithContentsOfURLString:sourceUrl:", a3, a4), 4);
}

+ (id)cfiPathToNodeWithDepth:(int64_t)a3 nodeArray:(void *)a4 idArray:(void *)a5
{
  id v8;
  int64_t v9;

  v8 = +[NSMutableString string](NSMutableString, "string");
  if (a3 >= 1)
  {
    v9 = 0;
    do
    {
      objc_msgSend(v8, "appendFormat:", CFSTR("%lu"), *(_QWORD *)(*(_QWORD *)a4 + 8 * v9));
      if (a5 && *(_QWORD *)(*(_QWORD *)a5 + 8 * v9))
        objc_msgSend(v8, "appendFormat:", CFSTR("[%s]"), *(_QWORD *)(*(_QWORD *)a5 + 8 * v9));
      if (v9 < a3 - 1)
        objc_msgSend(v8, "appendFormat:", CFSTR("/"));
      ++v9;
    }
    while (a3 != v9);
  }
  return v8;
}

@end
