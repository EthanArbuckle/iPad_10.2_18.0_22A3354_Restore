@implementation LTTextLanguageDetectionResult

uint64_t __113___LTTextLanguageDetectionResult_Daemon__initWithDetectionCounts_availableLocales_lowConfidenceLocales_strategy___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = objc_msgSend(v5, "countForObject:", a3);
  v8 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v6);

  if (v7 > v8)
    return 1;
  else
    return -1;
}

uint64_t __113___LTTextLanguageDetectionResult_Daemon__initWithDetectionCounts_availableLocales_lowConfidenceLocales_strategy___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_ltLocaleIdentifier");
}

id __68___LTTextLanguageDetectionResult_Daemon__sendAnalytics_isSupported___block_invoke(uint64_t a1)
{
  const __CFString *v1;
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v1 = *(const __CFString **)(a1 + 32);
  if (!v1)
    v1 = &stru_251A15610;
  v5[1] = CFSTR("isSupported");
  v6[0] = v1;
  v5[0] = CFSTR("language");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
