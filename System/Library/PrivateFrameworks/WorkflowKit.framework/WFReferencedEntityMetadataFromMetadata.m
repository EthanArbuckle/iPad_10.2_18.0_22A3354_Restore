@implementation WFReferencedEntityMetadataFromMetadata

void ____WFReferencedEntityMetadataFromMetadata_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v13;
  if (v13)
  {
    objc_msgSend(v13, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {

LABEL_6:
      v5 = v13;
      goto LABEL_7;
    }
    v8 = *(void **)(a1 + 48);
    objc_msgSend(v13, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v13;
    if (!v10)
    {
      v11 = *(void **)(a1 + 48);
      objc_msgSend(v13, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v13, v12);

      __WFReferencedEntityMetadataFromMetadata(v13, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
      goto LABEL_6;
    }
  }
LABEL_7:

}

id ____WFReferencedEntityMetadataFromMetadata_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(a2, "valueType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "memberValueType");
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v2;
  else
    v4 = 0;

  return v4;
}

@end
