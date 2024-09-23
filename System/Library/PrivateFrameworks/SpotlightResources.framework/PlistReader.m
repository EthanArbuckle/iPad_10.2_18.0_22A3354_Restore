@implementation PlistReader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plist, 0);
}

- (NSDictionary)plist
{
  return self->_plist;
}

+ (id)plistReaderWithResourcePath:(id)a3
{
  id v3;
  id v4;
  char v5;
  void *v6;
  uint64_t v7;
  const void *v8;
  void *v9;
  PlistReader *v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "fileExistsAtPath:", v3))
    goto LABEL_9;
  if ((objc_msgSend(v3, "hasSuffix:", CFSTR(".mdplist")) & 1) != 0)
  {

  }
  else
  {
    v5 = objc_msgSend(v3, "hasSuffix:", CFSTR(".factors"));

    if ((v5 & 1) == 0)
    {
      v10 = 0;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  if (!v6)
    goto LABEL_9;
  v4 = objc_retainAutorelease(v6);
  objc_msgSend(v4, "bytes");
  objc_msgSend(v4, "length");
  v7 = _MDPlistContainerCreateWithBytes();
  if (v7 && (v8 = (const void *)v7, v9 = (void *)_MDPlistContainerCopyRootObject(), CFRelease(v8), v9))
  {
    v10 = -[PlistReader initWithPlist:]([PlistReader alloc], "initWithPlist:", v9);

  }
  else
  {
LABEL_9:
    v10 = 0;
  }

LABEL_11:
  return v10;
}

- (PlistReader)initWithPlist:(id)a3
{
  id v5;
  PlistReader *v6;
  PlistReader *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PlistReader;
  v6 = -[PlistReader init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_plist, a3);

  return v7;
}

@end
