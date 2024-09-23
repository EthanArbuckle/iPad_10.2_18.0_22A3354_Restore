@implementation NSDictionary

uint64_t __58__NSDictionary_HKSPSleep__hksp_dictionaryByFilteringKeys___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

void __36__NSDictionary_HKSPSleep__hksp_hash__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EE7905C8))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v8, "hash") ^ v6;
  }
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE7905C8))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v5, "hash") ^ v7;
  }

}

@end
