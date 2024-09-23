@implementation _SFECKeyPair(TPKeyPair)

- (id)signatureForData:()TPKeyPair withError:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  signingOperation();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sign:withKey:error:", v6, a1, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "signature");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
