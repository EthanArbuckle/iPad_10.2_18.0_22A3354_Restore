@implementation SFSearchResult

void __70__SFSearchResult_SearchToShare__sts_providerIconWithScale_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BEBD640], "imageWithData:scale:", a2, *(double *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

uint64_t __59__SFSearchResult_SearchToShare___sts_cardSectionWithClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

@end
