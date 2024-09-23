@implementation CNVCardParsingConcurrentStrategy

id __69___CNVCardParsingConcurrentStrategy_parseData_options_resultFactory___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(a2, "rangeValue");
  objc_msgSend(v3, "subdataWithRange:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "seriallyParsedData:options:resultFactory:", v6, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
