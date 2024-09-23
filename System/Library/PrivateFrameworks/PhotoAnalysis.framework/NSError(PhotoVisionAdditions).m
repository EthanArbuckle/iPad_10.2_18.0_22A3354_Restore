@implementation NSError(PhotoVisionAdditions)

+ (uint64_t)errorForPhotoVisionErrorCode:()PhotoVisionAdditions userInfo:
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("PVErrorDomainPhotoVision"), a3, a4);
}

+ (id)errorForPhotoVisionErrorCode:()PhotoVisionAdditions localizedDescription:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = *MEMORY[0x1E0CB2D50];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("PVErrorDomainPhotoVision"), a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)errorForPhotoVisionErrorCode:()PhotoVisionAdditions localizedDescription:underlyingError:
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", a4, *MEMORY[0x1E0CB2D50], a5, *MEMORY[0x1E0CB3388], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("PVErrorDomainPhotoVision"), a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (uint64_t)errorForPhotoVisionUnimplementedFunction
{
  return objc_msgSend(a1, "errorForPhotoVisionErrorCode:userInfo:", -1000, 0);
}

+ (uint64_t)errorForPhotoVisionCancelledOperation
{
  return objc_msgSend(a1, "errorForPhotoVisionErrorCode:userInfo:", -1013, 0);
}

+ (id)errorForPhotoVisionUnexpectedCondition:()PhotoVisionAdditions
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0CB2D50], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorForPhotoVisionErrorCode:userInfo:", -1001, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)errorForPhotoVisionInvalidNilParameterNamed:()PhotoVisionAdditions
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The parameter %@ cannot be nil"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorForPhotoVisionInvalidParameterWithLocalizedDescription:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)errorForPhotoVisionInvalidParameterNamed:()PhotoVisionAdditions value:
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid value of %@ for parameter %@"), a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorForPhotoVisionInvalidParameterWithLocalizedDescription:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)errorForPhotoVisionInvalidParameterNamed:()PhotoVisionAdditions integerValue:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorForPhotoVisionInvalidParameterNamed:value:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)errorForPhotoVisionInvalidParameterNamed:()PhotoVisionAdditions realValue:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithDouble:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorForPhotoVisionInvalidParameterNamed:value:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)errorForPhotoVisionInvalidParameterWithLocalizedDescription:()PhotoVisionAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = *MEMORY[0x1E0CB2D50];
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "errorForPhotoVisionErrorCode:userInfo:", -1002, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)errorForPhotoVisionStorageErrorWithLocalizedDescription:()PhotoVisionAdditions
{
  return objc_msgSend(a1, "errorForPhotoVisionStorageErrorWithLocalizedDescription:underlyingError:", a3, 0);
}

+ (id)errorForPhotoVisionStorageErrorWithLocalizedDescription:()PhotoVisionAdditions underlyingError:
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0CB2D50], a4, *MEMORY[0x1E0CB3388], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorForPhotoVisionStorageErrorWithUserInfo:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (uint64_t)errorForPhotoVisionStorageErrorWithUserInfo:()PhotoVisionAdditions
{
  return objc_msgSend(a1, "errorForPhotoVisionErrorCode:userInfo:", -1007, a3);
}

+ (id)errorForPhotoVisionVisionKitErrorWithLocalizedDescription:()PhotoVisionAdditions underlyingError:
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0CB2D50], a4, *MEMORY[0x1E0CB3388], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorForPhotoVisionStorageErrorWithUserInfo:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (uint64_t)errorForPhotoVisionVisionKitErrorWithUserInfo:()PhotoVisionAdditions
{
  return objc_msgSend(a1, "errorForPhotoVisionErrorCode:userInfo:", -1009, a3);
}

@end
