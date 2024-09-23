@implementation UITraitCollection(PBFDisplayContextAdditions)

+ (id)pbf_traitCollectionCompatibleWithContext:()PBFDisplayContextAdditions
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0DC3E88];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90__UITraitCollection_PBFDisplayContextAdditions__pbf_traitCollectionCompatibleWithContext___block_invoke;
  v8[3] = &unk_1E86F6AB0;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "traitCollectionWithTraits:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
