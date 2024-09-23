@implementation CKOperationGroup(PKAdditions)

+ (id)pk_operationGroupWithName:()PKAdditions
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0C94F88];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setName:", v4);

  return v5;
}

+ (id)pk_operationGroupWithName:()PKAdditions suffix:
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v5, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;
  objc_msgSend((id)objc_opt_class(), "pk_operationGroupWithName:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
