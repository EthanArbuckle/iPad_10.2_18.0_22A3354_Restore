@implementation WFStaccatoActionTemplate

id __89__WFStaccatoActionTemplate_WorkflowKit__initWithIdentifier_sectionIdentifier_linkAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((v4 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = v3;
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7D78]), "initWithLinkAction:parameter:", *(_QWORD *)(a1 + 40), v7);
    else
      v6 = 0;

  }
  return v6;
}

@end
