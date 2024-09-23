@implementation UITextLightLoupeView

void __52___UITextLightLoupeView__backgroundColorIfNecessary__block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  char isKindOfClass;
  uint64_t v8;
  char v9;
  id v10;
  void *v11;

  v5 = a2;
  v6 = v5;
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL && (id)a1[4] == v5)
  {
    v10 = v5;
    isKindOfClass = objc_opt_isKindOfClass();
    v6 = v10;
    if ((isKindOfClass & 1) != 0)
    {
      v8 = a1[5];
LABEL_8:
      *(_QWORD *)(*(_QWORD *)(v8 + 8) + 24) = a3;
      goto LABEL_9;
    }
  }
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = v6;
    v9 = objc_opt_isKindOfClass();
    v6 = v11;
    if ((v9 & 1) != 0)
    {
      v8 = a1[6];
      goto LABEL_8;
    }
  }
LABEL_9:

}

uint64_t __56___UITextLightLoupeView_setVisible_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v4 + 488) && *(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(v4 + 472), "setPaused:", 1);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __56___UITextLightLoupeView_setVisible_animated_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
  CGAffineTransformMakeTranslation(&v5, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56));
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

@end
