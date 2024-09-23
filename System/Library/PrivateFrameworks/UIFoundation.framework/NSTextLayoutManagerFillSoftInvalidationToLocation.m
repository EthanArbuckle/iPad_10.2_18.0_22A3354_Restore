@implementation NSTextLayoutManagerFillSoftInvalidationToLocation

uint64_t ____NSTextLayoutManagerFillSoftInvalidationToLocation_block_invoke_2(uint64_t result, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSTextRange *v11;
  double v12;
  double v13;

  if (*(double *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) >= *(double *)(result + 64))
  {
    *a4 = 1;
  }
  else
  {
    v5 = result;
    result = objc_msgSend(a2, "state");
    if (result)
    {
      v6 = (void *)objc_msgSend(a2, "rangeInElement");
      objc_msgSend(a2, "layoutFragmentFrame");
      v8 = v7;
      v10 = v9;
      if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v5 + 48) + 8) + 40), "compare:", objc_msgSend(v6, "location")) == -1)
      {
        v11 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 48) + 8) + 40), objc_msgSend(v6, "location"));
        objc_msgSend(*(id *)(v5 + 32), "_estimatedVerticalSizeForTextRange:adjustedTextRange:", v11, 0);
        *(double *)(*(_QWORD *)(*(_QWORD *)(v5 + 40) + 8) + 24) = v12
                                                                    + *(double *)(*(_QWORD *)(*(_QWORD *)(v5 + 40) + 8)
                                                                                + 24);

      }
      v13 = *(double *)(*(_QWORD *)(*(_QWORD *)(v5 + 40) + 8) + 24);
      objc_msgSend(a2, "setLayoutFragmentFrameOrigin:", v8, v13);
      *(double *)(*(_QWORD *)(*(_QWORD *)(v5 + 40) + 8) + 24) = v10 + v13;
      result = objc_msgSend((id)objc_msgSend(a2, "rangeInElement"), "endLocation");
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 48) + 8) + 40) = result;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 56) + 8) + 24) = 1;
    }
  }
  return result;
}

uint64_t ____NSTextLayoutManagerFillSoftInvalidationToLocation_block_invoke(_QWORD *a1, void *a2, void *a3, char *a4)
{
  uint64_t result;
  double v8;
  double v9;
  char v10;

  result = objc_msgSend((id)objc_msgSend(a3, "location"), "compare:", a1[4]);
  if (result != -1)
  {
    result = objc_msgSend(a2, "state");
    if (!result)
    {
      v10 = 0;
      goto LABEL_6;
    }
    objc_msgSend(a2, "layoutFragmentFrame");
    *(double *)(*(_QWORD *)(a1[5] + 8) + 24) = v8 + v9;
    result = objc_msgSend((id)objc_msgSend(a2, "rangeInElement"), "endLocation");
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  }
  v10 = 1;
LABEL_6:
  *a4 = v10;
  return result;
}

@end
