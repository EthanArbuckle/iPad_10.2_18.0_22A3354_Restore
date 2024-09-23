@implementation PBStreamReader

+ (id)readProtoBuffersOfClass:(Class)a3 fromFile:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  PBDataReader *v14;
  void *v15;
  void *v16;
  void *v17;
  void *context;

  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "fileExistsAtPath:", v7))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1A85B6664]();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v7, 0, a5);
    v12 = v11;
    if (*a5)
    {

      objc_autoreleasePoolPop(v10);
      v13 = 0;
    }
    else
    {
      context = v10;
      v14 = -[PBDataReader initWithData:]([PBDataReader alloc], "initWithData:", v11);
      if (-[PBDataReader hasMoreData](v14, "hasMoreData"))
      {
        do
        {
          v15 = (void *)MEMORY[0x1A85B6664]();
          -[PBDataReader readProtoBuffer](v14, "readProtoBuffer");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v17 = (void *)objc_msgSend([a3 alloc], "initWithData:", v16);
            if (v17)
              objc_msgSend(v9, "addObject:", v17);

          }
          objc_autoreleasePoolPop(v15);
        }
        while (-[PBDataReader hasMoreData](v14, "hasMoreData"));
      }
      if (-[PBDataReader hasError](v14, "hasError"))
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PBRequesterErrorDomain"), 6005, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

      objc_autoreleasePoolPop(context);
      v13 = v9;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
