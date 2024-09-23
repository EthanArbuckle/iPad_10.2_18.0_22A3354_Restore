@implementation NSMutableSet

void __68__NSMutableSet_WFNetworkProfile___equivalentExistingNetworkProfile___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (+[WFNetworkProfile networkProfileRepresentSameNetwork:toNetworkProfile:](WFNetworkProfile, "networkProfileRepresentSameNetwork:toNetworkProfile:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

uint64_t __62__NSMutableSet_WiFiKit__compareAndUpdateDuplicateScanRecords___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "ssid");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "ssid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "ssid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if (v9)
    {
      v6 = 1;
      *a3 = 1;
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

@end
