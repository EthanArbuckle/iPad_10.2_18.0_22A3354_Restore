@implementation NSLinguisticTagger

void __94__NSLinguisticTagger_RKPrivate__languageOfRange_withAdditionalContext_withPreferredLanguages___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id obj;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v1 + 40);
  objc_msgSend(MEMORY[0x24BDD14E8], "dataDetectorWithTypes:error:", 32, &obj);
  v2 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v1 + 40), obj);
  v3 = (void *)languageOfRange_withAdditionalContext_withPreferredLanguages__dataDetector;
  languageOfRange_withAdditionalContext_withPreferredLanguages__dataDetector = v2;

}

uint64_t __94__NSLinguisticTagger_RKPrivate__languageOfRange_withAdditionalContext_withPreferredLanguages___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = objc_msgSend(v5, "countForObject:", a3);
  v8 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v6);

  if (v7 < v8)
    return -1;
  else
    return v7 > v8;
}

void __94__NSLinguisticTagger_RKPrivate__languageOfRange_withAdditionalContext_withPreferredLanguages___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "tagAtIndex:scheme:tokenRange:sentenceRange:", a3, *MEMORY[0x24BDD0F58], 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = v4;
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (unint64_t)((double)(unint64_t)objc_msgSend(v5, "unsignedIntegerValue") + 1.0);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v8);

    v4 = v8;
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }

}

void __94__NSLinguisticTagger_RKPrivate__languageOfRange_withAdditionalContext_withPreferredLanguages___block_invoke_4(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if ((double)(unint64_t)objc_msgSend(a3, "unsignedIntegerValue")
     / (double)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) >= 0.7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

@end
