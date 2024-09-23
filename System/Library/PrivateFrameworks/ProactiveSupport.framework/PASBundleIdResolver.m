@implementation PASBundleIdResolver

void __54___PASBundleIdResolver_bundleIdentifierOrProcessName___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  _BYTE *v4;
  id *v5;

  v3 = a2;
  v5 = v3;
  if (!v3[1])
  {
    objc_msgSend(*(id *)(a1 + 32), "_populateResultWithLockWitness:", v3);
    v3 = v5;
  }
  v4 = *(_BYTE **)(a1 + 48);
  if (v4)
    *v4 = *((_BYTE *)v3 + 16);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3[1]);

}

@end
