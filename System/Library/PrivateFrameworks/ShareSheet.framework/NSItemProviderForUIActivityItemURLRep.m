@implementation NSItemProviderForUIActivityItemURLRep

void ___NSItemProviderForUIActivityItemURLRep_block_invoke(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD))
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "URL");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, _QWORD))a2)[2](v4, v5, 0);

}

void ___NSItemProviderForUIActivityItemURLRep_block_invoke_2(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD))
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "thumbnail");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, _QWORD))a2)[2](v4, v5, 0);

}

@end
