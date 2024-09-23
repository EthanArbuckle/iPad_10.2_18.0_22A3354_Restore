@implementation NSFileManager

- (void)mf_enumerateAtPath:(id)a3 withBlock:(id)a4
{
  id v7;
  void (**v8)(id, void *, void *, _BYTE *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  unsigned __int8 v16;

  v7 = a3;
  v8 = (void (**)(id, void *, void *, _BYTE *))a4;
  if (!v8)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFDiskCacheUtilities.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v16 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileManager enumeratorAtPath:](self, "enumeratorAtPath:", v7));
  v10 = 0;
  do
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nextObject"));

    if (!v11)
      break;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileManager attributesOfItemAtPath:error:](self, "attributesOfItemAtPath:error:", v12, 0));
    v8[2](v8, v12, v13, &v16);
    v14 = v16;

    v10 = v11;
  }
  while (!v14);

}

@end
