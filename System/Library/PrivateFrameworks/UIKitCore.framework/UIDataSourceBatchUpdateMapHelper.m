@implementation UIDataSourceBatchUpdateMapHelper

uint64_t __83___UIDataSourceBatchUpdateMapHelper__generateUpdateMapsAssertingForInvalidUpdates___block_invoke(uint64_t a1, unsigned int a2)
{
  unint64_t v2;
  unint64_t v3;
  void *v5;
  void *v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "numberOfItemsBeforeSection:", a2);
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = v2;
    if (!HIDWORD(v2))
      return v3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("_UIDataSourceBatchUpdateMap.h"), 28, CFSTR("NSInteger index is negative or too large: %ld"), v3);

  }
  return 0xFFFFFFFFLL;
}

uint64_t __83___UIDataSourceBatchUpdateMapHelper__generateUpdateMapsAssertingForInvalidUpdates___block_invoke_2(uint64_t a1, unsigned int a2)
{
  unint64_t v2;
  unint64_t v3;
  void *v5;
  void *v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "numberOfItemsInSection:", a2);
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = v2;
    if (!HIDWORD(v2))
      return v3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("_UIDataSourceBatchUpdateMap.h"), 28, CFSTR("NSInteger index is negative or too large: %ld"), v3);

  }
  return 0xFFFFFFFFLL;
}

uint64_t __83___UIDataSourceBatchUpdateMapHelper__generateUpdateMapsAssertingForInvalidUpdates___block_invoke_3(uint64_t a1, unsigned int a2)
{
  unint64_t v2;
  unint64_t v3;
  void *v5;
  void *v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "numberOfItemsBeforeSection:", a2);
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = v2;
    if (!HIDWORD(v2))
      return v3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("_UIDataSourceBatchUpdateMap.h"), 28, CFSTR("NSInteger index is negative or too large: %ld"), v3);

  }
  return 0xFFFFFFFFLL;
}

uint64_t __83___UIDataSourceBatchUpdateMapHelper__generateUpdateMapsAssertingForInvalidUpdates___block_invoke_4(uint64_t a1, unsigned int a2)
{
  unint64_t v2;
  unint64_t v3;
  void *v5;
  void *v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "numberOfItemsInSection:", a2);
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = v2;
    if (!HIDWORD(v2))
      return v3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("_UIDataSourceBatchUpdateMap.h"), 28, CFSTR("NSInteger index is negative or too large: %ld"), v3);

  }
  return 0xFFFFFFFFLL;
}

void __83___UIDataSourceBatchUpdateMapHelper__generateUpdateMapsAssertingForInvalidUpdates___block_invoke_5(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *v4;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  _UIDataSourceUpdateFromCollectionViewUpdateItem(v4, a3);

}

@end
