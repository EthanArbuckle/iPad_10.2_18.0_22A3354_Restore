@implementation NSObject(_NSItemProviderTypeCoercion_UIKitAdditions)

- (_QWORD)_NSItemProviderTypeCoercion_coercedUIImageValueFromNSURLValue:()_NSItemProviderTypeCoercion_UIKitAdditions error:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "isFileURL"))
  {
    objc_msgSend(v5, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage imageWithContentsOfFile:](UIImage, "imageWithContentsOfFile:", v6);
    a4 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  }
  else if (a4)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB2C98];
    v11 = *MEMORY[0x1E0C9AFE0];
    v12[0] = CFSTR("Unknown error.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, -1, v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

- (UIImage)_NSItemProviderTypeCoercion_coercedUIImageValueFromNSDataValue:()_NSItemProviderTypeCoercion_UIKitAdditions error:
{
  return +[UIImage imageWithData:scale:](UIImage, "imageWithData:scale:", 1.0);
}

@end
