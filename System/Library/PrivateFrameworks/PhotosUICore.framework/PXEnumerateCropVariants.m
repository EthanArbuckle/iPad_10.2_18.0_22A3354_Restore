@implementation PXEnumerateCropVariants

uint64_t ___PXEnumerateCropVariants_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  v7 = objc_msgSend(v6, "cropType");
  objc_msgSend(v6, "cropRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v6, "cropScore");
  v17 = v16;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, double, double, double, double, double))(v5 + 16))(v5, v7, a4, v9, v11, v13, v15, v17);
}

@end
