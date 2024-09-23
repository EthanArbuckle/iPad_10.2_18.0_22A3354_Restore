@implementation PHACurareShadowEvaluationUtilities

+ (BOOL)generateError:(id *)a3 errorCode:(int)a4 errorDomain:(id)a5 message:(id)a6 underlyingError:(id)a7
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = a4;
    v12 = *MEMORY[0x1E0CB3388];
    v20 = *MEMORY[0x1E0CB2D50];
    v21 = v12;
    v22[0] = a6;
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = a6;
    v15 = a5;
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@"), a7, v20, v21, v22[0]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v20, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v15, v11, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    *a3 = v18;
  }
  return 1;
}

@end
