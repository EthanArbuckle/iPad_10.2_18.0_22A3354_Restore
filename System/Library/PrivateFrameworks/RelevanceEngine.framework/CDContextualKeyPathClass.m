@implementation CDContextualKeyPathClass

REHTMLTagElement *__get_CDContextualKeyPathClass_block_invoke(uint64_t a1)
{
  REHTMLTagElement *result;
  REHTMLTagElement *v3;
  SEL v4;
  id v5;
  id v6;

  CoreDuetContextLibrary();
  result = (REHTMLTagElement *)objc_getClass("_CDContextualKeyPath");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_CDContextualKeyPathClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (REHTMLTagElement *)__get_CDContextualKeyPathClass_block_invoke_cold_1();
    return -[REHTMLTagElement initWithTag:content:](v3, v4, v5, v6);
  }
  return result;
}

uint64_t __get_CDContextualKeyPathClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return -[REActivitySummaryPredictor _startActivitySummaryQueryWithRetries:].cold.1(v0);
}

@end
