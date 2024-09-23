@implementation Z53pv

CGAffineTransform *___Z53pv_transform_PVCGPointQuad_between_coordinate_systems13PVCGPointQuad6CGSize25_PVCoordinateSystemOriginS0_S1__block_invoke(uint64_t a1, int a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double *v8;
  double *v9;
  int v10;
  int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _BOOL4 v19;
  double v20;
  double v21;
  double v22;
  BOOL v23;
  _BOOL4 v24;
  _BOOL4 v25;
  double v26;
  double v27;
  CGAffineTransform *result;
  double v29;
  double v30;
  double *v31;
  double *v32;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGAffineTransform v35;

  v4 = *MEMORY[0x1E0C9D538];
  v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v6 = *MEMORY[0x1E0C9D538];
  v7 = v5;
  switch(a2)
  {
    case 0:
      v8 = (double *)(a1 + 40);
      v9 = (double *)(a1 + 48);
      goto LABEL_6;
    case 1:
      v9 = (double *)(a1 + 64);
      v8 = (double *)(a1 + 56);
      goto LABEL_6;
    case 2:
      v9 = (double *)(a1 + 80);
      v8 = (double *)(a1 + 72);
      goto LABEL_6;
    case 3:
      v9 = (double *)(a1 + 96);
      v8 = (double *)(a1 + 88);
LABEL_6:
      v7 = *v9;
      v6 = *v8;
      break;
    default:
      break;
  }
  v11 = *(_DWORD *)(a1 + 136);
  v10 = *(_DWORD *)(a1 + 140);
  v13 = *(double *)(a1 + 104);
  v12 = *(double *)(a1 + 112);
  v15 = *(double *)(a1 + 120);
  v14 = *(double *)(a1 + 128);
  if (v11 == 2)
  {
    if (!v10)
    {
      v5 = v12 * 0.5;
      v4 = v13 * 0.5;
    }
    v25 = v10 == 1;
    if (v10 == 1)
      v26 = v12 * 0.5;
    else
      v26 = v5;
    if (v10 == 1)
      v27 = v13 * 0.5;
    else
      v27 = v4;
  }
  else
  {
    v16 = v13 * -0.5;
    v17 = v12 * 0.5;
    if (v10)
      v18 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    else
      v18 = *(double *)(a1 + 112);
    v19 = v10 == 2 || v10 == 0;
    if (v10 == 2)
    {
      v20 = v13 * -0.5;
    }
    else
    {
      v17 = v18;
      v20 = *MEMORY[0x1E0C9D538];
    }
    v21 = v12 * -0.5;
    if (v10 == 1)
      v22 = *(double *)(a1 + 112);
    else
      v22 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v23 = v10 == 2;
    v24 = v10 != 2 && v10 == 1;
    if (!v23)
    {
      v21 = v22;
      v16 = *MEMORY[0x1E0C9D538];
    }
    if (v11)
      v24 = 0;
    else
      v5 = v21;
    if (!v11)
      v4 = v16;
    if (v11 == 1)
      v25 = v19;
    else
      v25 = v24;
    if (v11 == 1)
      v26 = v17;
    else
      v26 = v5;
    if (v11 == 1)
      v27 = v20;
    else
      v27 = v4;
  }
  memset(&v33, 0, sizeof(v33));
  CGAffineTransformMakeScale(&v33, v15 / v13, v14 / v12);
  v34 = v33;
  result = CGAffineTransformTranslate(&v35, &v34, v27, v26);
  v33 = v35;
  if (v25)
  {
    v34 = v33;
    result = CGAffineTransformScale(&v35, &v34, 1.0, -1.0);
    v33 = v35;
  }
  v29 = v33.tx + v6 * v33.a + v7 * v33.c;
  v30 = v33.ty + v6 * v33.b + v7 * v33.d;
  v31 = *(double **)(*(_QWORD *)(a1 + 32) + 8);
  switch(a2)
  {
    case 0:
      v31[4] = v29;
      v32 = v31 + 5;
      goto LABEL_54;
    case 1:
      v31[6] = v29;
      v32 = v31 + 7;
      goto LABEL_54;
    case 2:
      v31[8] = v29;
      v32 = v31 + 9;
      goto LABEL_54;
    case 3:
      v31[10] = v29;
      v32 = v31 + 11;
LABEL_54:
      *v32 = v30;
      break;
    default:
      return result;
  }
  return result;
}

@end
