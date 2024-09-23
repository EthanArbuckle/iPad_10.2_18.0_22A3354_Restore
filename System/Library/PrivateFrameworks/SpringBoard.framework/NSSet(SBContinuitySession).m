@implementation NSSet(SBContinuitySession)

- (id)sb_setByRemovingReason:()SBContinuitySession
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__NSSet_SBContinuitySession__sb_setByRemovingReason___block_invoke;
  v8[3] = &unk_1E8E9DE38;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "bs_filter:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
