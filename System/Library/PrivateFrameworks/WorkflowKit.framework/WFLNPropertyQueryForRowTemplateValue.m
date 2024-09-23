@implementation WFLNPropertyQueryForRowTemplateValue

void __WFLNPropertyQueryForRowTemplateValue_block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "propertyIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)a1[4];
  v10 = v8;
  v11 = v9;
  if (v10 == v11)
  {

  }
  else
  {
    v12 = v11;
    if (!v10 || !v11)
    {

      goto LABEL_9;
    }
    v13 = objc_msgSend(v10, "isEqualToString:", v11);

    if (!v13)
      goto LABEL_9;
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
  *a4 = 1;
LABEL_9:

}

uint64_t __WFLNPropertyQueryForRowTemplateValue_block_invoke_124(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "displayRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wf_localizedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "isEqualToString:", v5);

  return v6;
}

@end
