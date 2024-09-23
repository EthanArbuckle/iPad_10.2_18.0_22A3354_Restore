@implementation SKUIOfferViewElement

- (BOOL)isSimpleOffer
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__SKUIOfferViewElement_isSimpleOffer__block_invoke;
  v4[3] = &unk_1E73A01D0;
  v4[4] = &v5;
  -[SKUIOfferViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __37__SKUIOfferViewElement_isSimpleOffer__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "elementType") == 138 && objc_msgSend(v5, "labelViewStyle") != 3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }

}

- (BOOL)isCompactModeEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[SKUIOfferViewElement attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("compact"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4;
  objc_super v5;
  _QWORD v6[4];
  id v7;

  v6[1] = 3221225472;
  v6[2] = __52__SKUIOfferViewElement_enumerateChildrenUsingBlock___block_invoke;
  v6[3] = &unk_1E73A1F80;
  v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SKUIOfferViewElement;
  v6[0] = MEMORY[0x1E0C809B0];
  v4 = v7;
  -[SKUIViewElement enumerateChildrenUsingBlock:](&v5, sel_enumerateChildrenUsingBlock_, v6);

}

void __52__SKUIOfferViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  BOOL v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "elementType");
  v4 = v3 > 0x32 || ((1 << v3) & 0x4000000003000) == 0;
  if (!v4 || v3 == 141 || v3 == 138)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (int64_t)pageComponentType
{
  return 24;
}

@end
