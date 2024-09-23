@implementation NSAttributedString

void __71__NSAttributedString_StocksUICoreText__su_languageAwareOutsetsAtScale___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "su_languageAwareOutsetsAtScale:", *(double *)(a1 + 40));
    UIEdgeInsetsMin();
    v3 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
    v3[4] = v4;
    v3[5] = v5;
    v3[6] = v6;
    v3[7] = v7;
  }

}

@end
