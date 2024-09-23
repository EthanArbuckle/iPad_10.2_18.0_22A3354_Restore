@implementation NSError(TRICloudKit)

+ (id)triCloudKitErrorWithMessage:()TRICloudKit code:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14[0] = *MEMORY[0x1E0CB2D50];
  v5 = (void *)MEMORY[0x1E0CB34D0];
  v6 = a3;
  objc_msgSend(v5, "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CloudKit error"), &stru_1E9336E60, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v14[1] = *MEMORY[0x1E0CB2D68];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", v6, &stru_1E9336E60, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.trial.cloudkit"), a4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)triCloudKitErrorWithMessage:()TRICloudKit
{
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;

  v9 = (objc_class *)MEMORY[0x1E0CB3940];
  v10 = a3;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithFormat:arguments:", v10, &a9);

  objc_msgSend(MEMORY[0x1E0CB35C8], "triCloudKitErrorWithMessage:code:", v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
