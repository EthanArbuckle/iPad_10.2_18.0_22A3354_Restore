@implementation NSURL(OZAdditions)

- (BOOL)isEditableMotionProjectURL:()OZAdditions
{
  void *v5;
  void *v6;
  OZTemplateFlagXMLParser *v7;
  OZTemplateFlagXMLParser *v8;
  _BOOL8 v9;
  id v11;
  uint64_t v12;

  v11 = 0;
  v12 = 0;
  if ((objc_msgSend(a1, "getResourceValue:forKey:error:", &v11, *MEMORY[0x1E0C99A18], &v12) & 1) == 0)
  {
    if (a3)
    {
      v9 = 0;
      *a3 = v12;
      return v9;
    }
    return 0;
  }
  if ((objc_msgSend(v11, "BOOLValue") & 1) == 0
    || (v5 = (void *)objc_msgSend(a1, "pathExtension")) == 0
    || (v6 = v5, !objc_msgSend(v5, "compare:options:", CFSTR("moti"), 1))
    && !objc_msgSend(v6, "compare:options:", CFSTR("moef"), 1)
    && !objc_msgSend(v6, "compare:options:", CFSTR("motr"), 1)
    && !objc_msgSend(v6, "compare:options:", CFSTR("motn"), 1)
    || (v7 = -[OZTemplateFlagXMLParser initWithContentsOfURL:]([OZTemplateFlagXMLParser alloc], "initWithContentsOfURL:", a1)) == 0)
  {
    if (a3)
    {
      v9 = 0;
      *a3 = 0;
      return v9;
    }
    return 0;
  }
  v8 = v7;
  if (!-[OZTemplateFlagXMLParser parse](v7, "parse"))
  {
    if (a3)
      *a3 = 0;

    return 0;
  }
  v9 = (-[OZTemplateFlagXMLParser templeFlags](v8, "templeFlags") & 8) == 0;

  return v9;
}

- (uint64_t)OZ_isImageSequenceURL
{
  uint64_t isSequence;
  const __CFURL *v3;

  PCURL::PCURL((PCURL *)&v3, cf);
  isSequence = PCURL::isSequence(&v3);
  PCURL::~PCURL((PCURL *)&v3);
  return isSequence;
}

- (id)OZ_imageSequenceURLs
{
  void *v1;
  int SequenceStart;
  int SequenceEnd;
  int v4;
  int v5;
  int v6;
  const __CFURL **URLforIndex;
  CFURLRef *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  PCString v14;
  PCString v15;
  const __CFURL **v16;
  const __CFURL *v17;

  PCURL::PCURL((PCURL *)&v17, cf);
  if (PCURL::isSequence(&v17))
  {
    v1 = (void *)objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    SequenceStart = PCURL::getSequenceStart(&v17);
    SequenceEnd = PCURL::getSequenceEnd(&v17);
    v4 = SequenceEnd - SequenceStart;
    if (SequenceEnd >= SequenceStart)
    {
      v5 = 0;
      v6 = v4 + 1;
      do
      {
        URLforIndex = (const __CFURL **)PCURL::getURLforIndex(&v17, v5);
        v8 = URLforIndex;
        v16 = URLforIndex;
        if (URLforIndex)
        {
          PCURL::getFilename(URLforIndex, &v15);
          PCURL::getPathAsFileSystemString(v8, (PCURL *)&v14);
          v9 = (__CFString *)PCString::ns_str(&v14);
          v10 = -[__CFString stringByAppendingPathComponent:](v9, "stringByAppendingPathComponent:", PCString::ns_str(&v15));
          PCString::~PCString(&v14);
          v11 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10);
          if (v11)
            objc_msgSend(v1, "addObject:", v11);
          PCString::~PCString(&v15);
          PCURL::~PCURL((PCURL *)v8);
          MEMORY[0x1B5E29170]();
        }
        ++v5;
      }
      while (v6 != v5);
    }
    v12 = (id)objc_msgSend(v1, "copy");
  }
  else
  {
    v12 = 0;
  }
  PCURL::~PCURL((PCURL *)&v17);
  return v12;
}

- (BOOL)isMotionBundle
{
  return +[PCMotionBundle isValidBundleURL:](PCMotionBundle, "isValidBundleURL:", a1);
}

+ (id)motionBundleURLFromMotionDocURL:()OZAdditions
{
  return +[PCMotionBundle bundleURLForProjectFileURL:](PCMotionBundle, "bundleURLForProjectFileURL:");
}

+ (uint64_t)motionDocURLFromMotionBundleURL:()OZAdditions
{
  PCMotionBundle *v3;
  uint64_t v4;

  v3 = -[PCMotionBundle initWithURL:]([PCMotionBundle alloc], "initWithURL:", a3);
  v4 = -[PCMotionBundle projectFileURL](v3, "projectFileURL");

  return v4;
}

- (uint64_t)oz_relativePathFromURL:()OZAdditions
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  void *v16;

  v4 = objc_msgSend(a1, "pathComponents");
  if (!v4)
    return 0;
  v5 = (void *)v4;
  v6 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", objc_msgSend(a3, "pathComponents"));
  if (!v6)
    return 0;
  v7 = (void *)v6;
  if ((objc_msgSend(a3, "hasDirectoryPath") & 1) == 0)
    objc_msgSend(v7, "removeLastObject");
  v8 = objc_msgSend(v5, "count");
  v9 = objc_msgSend(v7, "count");
  v10 = 0;
  if (v8 >= v9)
    v11 = v9;
  else
    v11 = v8;
  v12 = v11 & ~(v11 >> 63);
  while (1)
  {
    v13 = v10;
    if (v12 == v10)
      break;
    v14 = objc_msgSend((id)objc_msgSend(v5, "objectAtIndexedSubscript:", v10), "isEqualToString:", objc_msgSend(v7, "objectAtIndexedSubscript:", v10));
    v10 = v13 + 1;
    if ((v14 & 1) == 0)
    {
      v12 = v13;
      break;
    }
  }
  v15 = objc_msgSend(v7, "count");
  v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v15 - v12);
  if (v15 - v12 >= 1)
  {
    do
    {
      objc_msgSend(v16, "addObject:", CFSTR(".."));
      --v15;
    }
    while (v13 != v15);
  }
  objc_msgSend(v16, "addObjectsFromArray:", objc_msgSend(v5, "subarrayWithRange:", v12, objc_msgSend(v5, "count") - v12));
  return objc_msgSend(v16, "componentsJoinedByString:", CFSTR("/"));
}

@end
