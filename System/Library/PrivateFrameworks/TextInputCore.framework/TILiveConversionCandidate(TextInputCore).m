@implementation TILiveConversionCandidate(TextInputCore)

- (void)initWithMecabraCandidate:()TextInputCore candidate:
{
  id v7;
  char *v8;
  void *v9;
  objc_super v11;
  objc_super v12;

  v7 = a4;
  v12.receiver = a1;
  v12.super_class = (Class)&off_1F02B1FA0;
  v8 = (char *)objc_msgSendSuper2(&v12, sel_initWithMecabraCandidate_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8[*MEMORY[0x1E0DBDDE0]], a4);
    v11.receiver = v9;
    v11.super_class = (Class)&off_1F02B1FA0;
    objc_msgSend(v9, "setPartialCandidate:", objc_msgSendSuper2(&v11, sel_isPartialCandidate));
  }

  return v9;
}

@end
