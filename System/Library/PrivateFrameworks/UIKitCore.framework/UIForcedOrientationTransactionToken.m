@implementation UIForcedOrientationTransactionToken

void __78___UIForcedOrientationTransactionToken_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  const __CFString *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  __CFString *v12;
  id v13;
  id v14;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 40), "state");
  if (v3 > 2)
    v4 = CFSTR("unknown");
  else
    v4 = off_1E16D3F20[v3];
  objc_msgSend(v2, "appendString:withName:", v4, CFSTR("state"));
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendInterfaceOrientation:withName:", objc_msgSend(*(id *)(a1 + 40), "originalInterfaceOrientation"), CFSTR("originalOrientation"));
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "transactionReason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:withName:", v7, CFSTR("reason"));

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "transactionHandler");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@: %p>"), v11, v14);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = CFSTR("(nil)");
  }
  v13 = (id)objc_msgSend(v8, "appendObject:withName:", v12, CFSTR("handler"));

}

@end
