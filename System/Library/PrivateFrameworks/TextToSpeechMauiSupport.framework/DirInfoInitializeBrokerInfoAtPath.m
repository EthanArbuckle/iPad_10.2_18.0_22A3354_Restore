@implementation DirInfoInitializeBrokerInfoAtPath

uint64_t ___DirInfoInitializeBrokerInfoAtPath_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasSuffix:", CFSTR("hdr"));
}

void ___DirInfoInitializeBrokerInfoAtPath_block_invoke_674(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  if (objc_msgSend(v12, "numberOfRanges") == 2)
  {
    v6 = *(void **)(a1 + 32);
    v7 = objc_msgSend(v12, "rangeAtIndex:", 1);
    objc_msgSend(v6, "substringWithRange:", v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *a4 = 1;
  }

}

@end
