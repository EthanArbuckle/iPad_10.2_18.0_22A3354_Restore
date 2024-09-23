@implementation TIKeyboardInputManagerLiveConversion

void __71__TIKeyboardInputManagerLiveConversion_zh_presentSegmentPickerIfNeeded__block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  id v12;

  v7 = (void *)a1[4];
  v8 = a2;
  LODWORD(v7) = objc_msgSend(v7, "inputIndex");
  v9 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  objc_msgSend(v8, "surface");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length") + v9;

  if (v11 >= v7)
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
    *a4 = 1;
  }
  objc_msgSend(v8, "surface");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) += objc_msgSend(v12, "length");
}

@end
