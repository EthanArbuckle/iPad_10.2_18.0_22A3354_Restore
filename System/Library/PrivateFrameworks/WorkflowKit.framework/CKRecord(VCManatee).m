@implementation CKRecord(VCManatee)

- (id)wf_decryptedStringForKey:()VCManatee
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4
    && (objc_msgSend(a1, "encryptedValuesByKey"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "objectForKeyedSubscript:", v4),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
