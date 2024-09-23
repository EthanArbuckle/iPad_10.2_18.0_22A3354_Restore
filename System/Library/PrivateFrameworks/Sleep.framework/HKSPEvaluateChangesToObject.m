@implementation HKSPEvaluateChangesToObject

void __HKSPEvaluateChangesToObject_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  v12 = v6;
  objc_msgSend(v6, "property");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "containsObject:", v8);

  if ((_DWORD)v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v12;
      if ((objc_msgSend(v9, "isAdd") & 1) != 0
        || (objc_msgSend(v9, "isRemove") & 1) != 0
        || (objc_msgSend(v9, "changedValue"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = HKSPEvaluateChangesToObject(),
            v10,
            v11 == 2))
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 2;
        *a4 = 1;
      }

    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 2;
      *a4 = 1;
    }
  }

}

@end
