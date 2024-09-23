@implementation WFStaccatoActionTemplateParameterValueSection

id __95__WFStaccatoActionTemplateParameterValueSection_WorkflowKit__initWithSection_action_parameter___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0DC7D80];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithAction:state:parameter:", *(_QWORD *)(a1 + 32), v4, *(_QWORD *)(a1 + 40));

  return v5;
}

@end
