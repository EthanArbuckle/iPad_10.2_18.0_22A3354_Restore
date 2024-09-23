@implementation SBUIBiometricMatchingAssertion

void __73___SBUIBiometricMatchingAssertion_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("identifier"));

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "reason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("reason"));

  v6 = *(void **)(a1 + 32);
  NSStringFromSBUIBiometricMatchMode(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:withName:", v7, CFSTR("matchMode"));

  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "restartCount"), CFSTR("restartCount"));
  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "operations");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendArraySection:withName:skipIfEmpty:", v10, CFSTR("operations"), 0);

}

@end
