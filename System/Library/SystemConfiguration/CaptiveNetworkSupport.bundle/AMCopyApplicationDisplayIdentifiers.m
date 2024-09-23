@implementation AMCopyApplicationDisplayIdentifiers

void ___AMCopyApplicationDisplayIdentifiers_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "applicationType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDC1518]))
  {

    v4 = v8;
  }
  else
  {
    objc_msgSend(v8, "applicationType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDC1508]);

    v4 = v8;
    if (!v6)
      goto LABEL_7;
  }
  objc_msgSend(v4, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v7);

  v4 = v8;
LABEL_7:

}

@end
