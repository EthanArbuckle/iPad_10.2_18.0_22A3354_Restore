@implementation NSManagedObject

uint64_t __56__NSManagedObject_MTAdditions__dictionaryRepresentation__block_invoke()
{
  return 0;
}

void __87__NSManagedObject_MTAdditions__dictionaryRepresentationWithNullAttributeValueProvider___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_4;
    if (!v5)
      goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v5, v4);
LABEL_4:

LABEL_5:
}

@end
