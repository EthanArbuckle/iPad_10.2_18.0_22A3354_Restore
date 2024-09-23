@implementation WFOnScreenContentService

uint64_t __108__WFOnScreenContentService_WFContentCollection__getOnScreenContentForInputContentClasses_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v4)(void);

  if (a3)
  {
    v4 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "populateOutputFromNodeRecursively:outputCollection:", a2, *(_QWORD *)(a1 + 40));
    v4 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  return v4();
}

NSString *__108__WFOnScreenContentService_WFContentCollection__getOnScreenContentForInputContentClasses_completionHandler___block_invoke(int a1, Class aClass)
{
  return NSStringFromClass(aClass);
}

@end
