@implementation NSError(MTLModelException)

+ (id)mtl_modelErrorWithException:()MTLModelException
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSError+MTLModelException.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("exception != nil"));

  }
  v12[0] = *MEMORY[0x1E0CB2D50];
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v12[1] = *MEMORY[0x1E0CB2D68];
  objc_msgSend(v5, "reason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = CFSTR("MTLModelThrownException");
  v13[1] = v7;
  v13[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTLModelErrorDomain"), 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
