@implementation EBOfficeArtWriterClient

- (void)writeClientAnchorFromDrawable:(id)a3 toObject:(id)a4 state:(id)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int32x4_t v16;
  int32x4_t v17;
  uint64_t v18;
  int v19;
  id v20;

  v20 = a3;
  v6 = a4;
  v7 = operator new();
  EshAtom::EshAtom((EshAtom *)v7, 0xF010u, 0);
  *(_QWORD *)v7 = &unk_24F3AC110;
  *(_WORD *)(v7 + 28) = 0;
  *(_OWORD *)(v7 + 32) = 0u;
  *(_OWORD *)(v7 + 48) = 0u;
  EshRecord::setDataLength(v7, 18);
  objc_opt_class();
  objc_msgSend(v20, "clientData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    v11 = objc_msgSend(v10, "from");
    v13 = v12;
    v14 = objc_msgSend(v10, "to");
    *(_DWORD *)(v7 + 32) = v11;
    *(_DWORD *)(v7 + 36) = v13;
    *(_DWORD *)(v7 + 40) = v14;
    *(_DWORD *)(v7 + 44) = v15;
    v16.i64[0] = v14;
    v16.i64[1] = v15;
    v17.i64[0] = v11;
    v17.i64[1] = v13;
    *(int32x4_t *)(v7 + 48) = vcvtq_s32_f32(vmulq_f32((float32x4_t)vuzp2q_s32(v17, v16), (float32x4_t)xmmword_22A4C1D30));

  }
  v18 = objc_msgSend(v6, "eshObject");
  v19 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v18 + 16))(v18);
  if (v19 == 6)
  {
    XlEshGroup::takeClientAnchor(v18, (XlEshClientAnchor *)v7);
  }
  else if (v19 == 7)
  {
    XlEshShape::takeClientAnchor(v18, v7);
  }

}

- (void)writeClientDataFromDrawable:(id)a3 toObject:(id)a4 state:(id)a5
{
  EshAtom *v5;
  uint64_t v6;
  int v7;
  id v8;

  v8 = a4;
  v5 = (EshAtom *)operator new();
  EshAtom::EshAtom(v5, 0xF011u, 0);
  *(_QWORD *)v5 = &unk_24F3AC1D0;
  v6 = objc_msgSend(v8, "eshObject");
  v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 16))(v6);
  if (v7 == 6)
  {
    XlEshGroup::takeClientData(v6, v5);
  }
  else if (v7 == 7)
  {
    XlEshShape::takeClientData(v6, (uint64_t)v5);
  }
  else
  {
    (*(void (**)(EshAtom *))(*(_QWORD *)v5 + 8))(v5);
  }

}

- (void)writeClientTextFromShape:(id)a3 toObject:(id)a4 state:(id)a5
{
  id v6;
  void *v7;
  EshAtom *v8;
  const void *v9;
  char *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v16 = a3;
  v6 = a4;
  objc_msgSend(v16, "clientData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_255B3A6F8)
    && objc_msgSend(v7, "hasText"))
  {
    v8 = (EshAtom *)operator new();
    EshAtom::EshAtom(v8, 0xF00Du, 0);
    *(_QWORD *)v8 = &unk_24F3AC278;
    v9 = (const void *)objc_msgSend(v6, "eshObject");
    if (v9)
    else
      v10 = 0;
    objc_msgSend(v16, "textBody");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "properties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v12, "hasLeftInset", EshTextBox::setAutoInset((EshTextBox *)(v10 + 272), 0)) & 1) == 0)
      v13 = EshTextBox::setInsetLeft((EshTextBox *)(v10 + 272), 0);
    if ((objc_msgSend(v12, "hasRightInset", v13) & 1) == 0)
      v14 = EshTextBox::setInsetRight((EshTextBox *)(v10 + 272), 0);
    if ((objc_msgSend(v12, "hasTopInset", v14) & 1) == 0)
      v15 = EshTextBox::setInsetTop((EshTextBox *)(v10 + 272), 0);
    if ((objc_msgSend(v12, "hasBottomInset", v15) & 1) == 0)
      EshTextBox::setInsetBottom((EshTextBox *)(v10 + 272), 0);
    XlEshShape::takeClientTextBox((uint64_t)v10, (uint64_t)v8);

  }
}

@end
