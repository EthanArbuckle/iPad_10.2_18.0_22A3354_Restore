@implementation UIBoundingPathBitmapDataImageRepresentation

void ___UIBoundingPathBitmapDataImageRepresentation_block_invoke(unint64_t *a1, void *a2)
{
  uint64_t v3;
  _UNKNOWN **v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  __int16 v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t *v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  id v42;
  _QWORD v43[8];

  v42 = a2;
  if (a1[5])
  {
    v3 = 0;
    v4 = &off_1E167A000;
    v36 = a1;
    while (v3 == a1[6] && a1[7])
    {
      objc_msgSend(v4[179], "blackColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setFill");

      objc_msgSend(v42, "fillRect:", 0.0, (double)v3, (double)a1[4], (double)a1[7]);
      v3 = a1[6] + a1[7] - 1;
LABEL_36:
      if (++v3 >= a1[5])
        goto LABEL_37;
    }
    v6 = a1[4];
    if (!v6)
      goto LABEL_36;
    v7 = 0;
    v8 = (double)v3;
    v37 = v3;
    while (1)
    {
      v9 = a1[5];
      if (v3 > v9 || v3 < 0)
      {
        v10 = 0xFFFFLL;
      }
      else
      {
        v10 = 0xFFFFLL;
        if (v9)
        {
          if ((v7 & 0x8000000000000000) != 0)
          {
            v10 = -(uint64_t)v7;
          }
          else
          {
            v11 = a1[6];
            v12 = a1[7];
            v14 = a1[8];
            v13 = a1[9];
            v15 = a1[10];
            if (v7 >= v6 - 1)
              v16 = v6 - 1;
            else
              v16 = v7;
            if (v3 >= v9 - 1)
              v17 = v9 - 1;
            else
              v17 = v3;
            if (v17 >= v11)
            {
              if (v17 < v12 + v11)
              {
                v10 = v6 - v16;
LABEL_35:
                objc_msgSend(v4[179], "blackColor");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_33;
              }
              v17 -= v12;
            }
            if (v13)
            {
              v18 = 0;
              v19 = 0;
              v20 = v17 * v13;
              v21 = v15 + 2 * v17 * v13;
              while (1)
              {
                if (v20 + v18 >= v14)
                {
                  v38 = v17;
                  v40 = v16;
                  v34 = v12;
                  v35 = v11;
                  v33 = v15;
                  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIBoundingPathBitmapDataRowHitTestResult _UIBoundingPathBitmapDataRowHitTest(const _UIBoundingPathBitmapData, const _UIIntegralPoint)");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v6, v9, v35, v34, v14, v13);

                  v15 = v33;
                  v12 = v34;
                  v11 = v35;
                  v17 = v38;
                  v16 = v40;
                }
                v22 = *(_WORD *)(v21 + 2 * v18);
                v19 += v22 & 0x7FFF;
                v10 = v19 - v16;
                if (v19 > v16)
                  break;
                if (v13 == ++v18)
                  goto LABEL_30;
              }
              a1 = v36;
              v3 = v37;
              v4 = &off_1E167A000;
              if (v22 < 0)
                goto LABEL_35;
            }
            else
            {
LABEL_30:
              v39 = v17;
              v41 = v16;
              v24 = v11;
              v25 = v12;
              v26 = v15;
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIBoundingPathBitmapDataRowHitTestResult _UIBoundingPathBitmapDataRowHitTest(const _UIBoundingPathBitmapData, const _UIIntegralPoint)");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v43[0] = v6;
              v43[1] = v9;
              v43[2] = v24;
              v43[3] = v25;
              v43[4] = v14;
              v43[5] = v13;
              v43[6] = v26;
              _UIBoundingPathBitmapDataDescription(v43);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("_UIBoundingPathBitmapData.h"), 256, CFSTR("Bitmap is invalid: column %ld is missing for row %ld of bitmap data: %@"), v41, v39, v29);

              v10 = 1;
              a1 = v36;
              v3 = v37;
              v4 = &off_1E167A000;
            }
          }
        }
      }
      objc_msgSend(v4[179], "whiteColor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:
      v31 = v30;
      objc_msgSend(v30, "setFill");

      objc_msgSend(v42, "fillRect:", (double)(uint64_t)v7, v8, (double)v10, 1.0);
      v7 += v10;
      v6 = a1[4];
      if (v7 >= v6)
        goto LABEL_36;
    }
  }
LABEL_37:

}

@end
