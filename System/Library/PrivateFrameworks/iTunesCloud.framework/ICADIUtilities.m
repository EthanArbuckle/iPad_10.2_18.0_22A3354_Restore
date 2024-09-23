@implementation ICADIUtilities

+ (BOOL)generateMachineDataForAccountID:(unint64_t)a3 returningMachineIDData:(id *)a4 otpData:(id *)a5 error:(id *)a6
{
  int v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v13 = 0;
  v14 = 0;
  v12 = 0;
  qi864985u0(a3, (uint64_t)&v14, (uint64_t)&v12 + 4, (uint64_t)&v13, (uint64_t)&v12);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICFairPlayError"), v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a6)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "ic_dataWithADIBytes:length:", v14, HIDWORD(v12));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    if (a5)
      goto LABEL_6;
LABEL_10:
    jk24uiwqrg(v13);
    v10 = 0;
    if (!a6)
      goto LABEL_8;
    goto LABEL_7;
  }
  jk24uiwqrg(v14);
  if (!a5)
    goto LABEL_10;
LABEL_6:
  objc_msgSend(MEMORY[0x1E0C99D50], "ic_dataWithADIBytes:length:", v13, v12);
  v10 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  if (a6)
LABEL_7:
    *a6 = objc_retainAutorelease(v10);
LABEL_8:

  return v10 == 0;
}

@end
