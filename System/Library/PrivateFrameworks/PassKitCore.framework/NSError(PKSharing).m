@implementation NSError(PKSharing)

+ (uint64_t)pkSharingError:()PKSharing
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKSharingErrorDomain"), a3, 0);
}

+ (id)pkSharingError:()PKSharing debugDescription:
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v11 = *MEMORY[0x1E0CB2938];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("PKSharingErrorDomain"), a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
