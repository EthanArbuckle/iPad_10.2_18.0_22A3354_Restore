@implementation NSString(BRCSharingAdditions)

- (id)brc_fixDocumentExtensionIfNeededForShareURL:()BRCSharingAdditions
{
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;

  objc_msgSend(a3, "brc_iWorkPathExtensions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count")
    && (objc_msgSend(a1, "br_pathExtension"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v4, "containsObject:", v5),
        v5,
        (v6 & 1) == 0))
  {
    objc_msgSend(v4, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "stringByAppendingPathExtension:", v8);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = a1;
  }

  return v7;
}

@end
