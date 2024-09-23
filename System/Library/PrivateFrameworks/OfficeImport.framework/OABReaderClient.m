@implementation OABReaderClient

+ (BOOL)sourceDrawableIsTopLevel:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "eshObject");
  v5 = v3;
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v4 + 16))(v4) == 6)
  {
    objc_msgSend(v3, "parent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "parent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "eshObject");

  if (v8)
    v9 = (*(unsigned int (**)(uint64_t))(*(_QWORD *)v8 + 16))(v8) == 61442;
  else
    v9 = 0;

  return v9;
}

@end
