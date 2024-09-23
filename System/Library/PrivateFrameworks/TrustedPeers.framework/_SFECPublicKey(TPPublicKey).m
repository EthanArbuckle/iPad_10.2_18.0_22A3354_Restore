@implementation _SFECPublicKey(TPPublicKey)

- (BOOL)checkSignature:()TPPublicKey matchesData:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;

  v6 = a4;
  v7 = a3;
  signingOperation();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C968]), "initWithData:signature:", v6, v7);

  objc_msgSend(v8, "verify:withKey:error:", v9, a1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 != 0;

  return v11;
}

@end
