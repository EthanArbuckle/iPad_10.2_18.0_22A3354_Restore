@implementation PKPassSemanticDictionariesInDictionary

void __PKPassSemanticDictionariesInDictionary_block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;

  v8 = a2;
  v7 = a3;
  if (+[PKPassSemantic isSupportedDictionaryKeyType:](PKPassSemantic, "isSupportedDictionaryKeyType:", v8)&& +[PKPassSemantic isSupportedDictionaryValueType:](PKPassSemantic, "isSupportedDictionaryValueType:", v7))
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

@end
