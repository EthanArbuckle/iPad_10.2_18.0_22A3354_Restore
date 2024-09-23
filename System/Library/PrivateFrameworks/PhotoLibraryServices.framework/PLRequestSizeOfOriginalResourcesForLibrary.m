@implementation PLRequestSizeOfOriginalResourcesForLibrary

void __PLRequestSizeOfOriginalResourcesForLibrary_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "librarySizesFromDB");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E375F390, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "longLongValue");

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
