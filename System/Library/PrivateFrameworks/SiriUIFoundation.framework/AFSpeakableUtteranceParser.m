@implementation AFSpeakableUtteranceParser

void __85__AFSpeakableUtteranceParser_SiriUIFoundationAdditions___domainsForStringWithFormat___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("@")))
  {
    v3 = *(_QWORD *)(a1 + 40);
LABEL_5:
    *(_BYTE *)(*(_QWORD *)(v3 + 8) + 24) = 1;
    goto LABEL_6;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("{")))
  {
    v3 = *(_QWORD *)(a1 + 48);
    goto LABEL_5;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
    && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v4 = objc_msgSend(v12, "isEqualToString:", CFSTR("#"));
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v6 = *(_QWORD *)(v5 + 40);
    if (v4)
    {
      if (v6)
      {
        objc_msgSend(*(id *)(a1 + 32), "addObject:");
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v8 = *(void **)(v7 + 40);
        *(_QWORD *)(v7 + 40) = 0;

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      }
    }
    else if (v6)
    {
      objc_msgSend(*(id *)(v5 + 40), "appendString:", v12);
    }
    else
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", v12);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
  }
LABEL_6:

}

@end
