@implementation PSIAddPlaceInfoToObject

void ___PSIAddPlaceInfoToObject_block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v5 = a2;
  if (objc_msgSend(v5, "length"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = ___PSIAddPlaceInfoToObject_block_invoke_2;
    v8[3] = &unk_1E366CC48;
    v6 = v5;
    v9 = v6;
    v7 = (void *)MEMORY[0x19AEC174C](v8);
    if (a3 <= 0xC && ((1 << a3) & 0x1420) != 0
      || objc_msgSend(*(id *)(a1 + 32), "indexOfObjectPassingTest:", v7) == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(a1 + 40), "addContentString:category:owningCategory:", v6, (__int16)a3, 0);
    }

  }
}

uint64_t ___PSIAddPlaceInfoToObject_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

@end
