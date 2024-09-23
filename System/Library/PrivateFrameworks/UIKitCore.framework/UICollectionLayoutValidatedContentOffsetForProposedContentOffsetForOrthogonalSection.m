@implementation UICollectionLayoutValidatedContentOffsetForProposedContentOffsetForOrthogonalSection

double ___UICollectionLayoutValidatedContentOffsetForProposedContentOffsetForOrthogonalSection_block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v10;
  double v11;
  BOOL IsNull;
  double v13;
  double v14;
  BOOL v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  BOOL v24;
  BOOL v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  BOOL v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  double v49;
  double v50;
  uint64_t v51;
  double v52;
  double v53;
  double v54;
  double v56;

  v10 = a5 + a5 + *(double *)(a1 + 40) - *(double *)(a1 + 48);
  v11 = fabs(a4);
  IsNull = CGRectIsNull(*(CGRect *)(a1 + 56));
  if (v11 >= 2.22044605e-16)
  {
    v15 = IsNull;
    v16 = *(_QWORD *)(a1 + 32);
    v17 = 0.0;
    v18 = 0.0;
    v19 = 0.0;
    if (v16)
    {
      v19 = *(double *)(v16 + 96);
      v18 = *(double *)(v16 + 104);
    }
    v20 = *(_QWORD *)(a1 + 104);
    if (v20)
    {
      v21 = *(double *)(a1 + 88) - v19;
      v22 = *(double *)(a1 + 96) - v18;
      v23 = 1.0;
      v24 = v22 < 0.0;
      v25 = v22 <= 0.0;
      v26 = 1.0;
      if (v25)
      {
        v26 = 0.0;
        if (v24)
          v26 = -1.0;
      }
      if (v21 <= 0.0)
      {
        v23 = 0.0;
        if (v21 < 0.0)
          v23 = -1.0;
      }
      if ((v20 & 1) != 0)
        v17 = v23;
      else
        v17 = 0.0;
      if ((v20 & 2) != 0)
        v27 = v26;
      else
        v27 = 0.0;
    }
    else
    {
      v27 = 0.0;
    }
    v28 = _UIPointValueForAxis(v20, a2, a3) - v10 + 0.0001;
    v29 = *(_QWORD *)(a1 + 104);
    v30 = 1.0;
    if (v29 == 2)
      v31 = 1.0;
    else
      v31 = v27;
    if (v29 == 3)
    {
      v31 = 1.0;
      v32 = 1.0;
    }
    else
    {
      v32 = v17;
    }
    if (v29 == 1)
      v31 = v27;
    else
      v30 = v32;
    v33 = v28 < 0.0;
    if (v28 >= 0.0)
      v34 = v31;
    else
      v34 = v27;
    if (v33)
      v30 = v17;
    if (v29 == 1)
      v35 = v30;
    else
      v35 = v34;
    v36 = _UIPointValueForAxis(v29, a2, a3) / a4;
    v37 = -v35;
    if (v35 >= 0.0)
      v37 = v35;
    if (v37 > 2.22044605e-16 && v15)
    {
      if (v35 >= 0.0)
        v39 = ceil(v36 + -0.005);
      else
        v39 = floor(v36 + 0.005);
    }
    else
    {
      v39 = round(v36);
    }
    v40 = (uint64_t)v39 & ~((uint64_t)v39 >> 63);
    v14 = _UISetPointValueForAxis(*(_QWORD *)(a1 + 104), a2, a3, (double)v40 * a4);
    v13 = v41;
    if (!v15)
    {
      v56 = v10;
      v42 = _UIPointValueForAxis(*(_QWORD *)(a1 + 104), *(double *)(a1 + 56), *(double *)(a1 + 64));
      v43 = a5;
      v44 = v42 + _UISizeValueForAxis(*(_QWORD *)(a1 + 104), *(double *)(a1 + 72), *(double *)(a1 + 80));
      v45 = _UIPointValueForAxis(*(_QWORD *)(a1 + 104), v14, v13);
      v46 = *(double *)(a1 + 48);
      v47 = v45 + v46 - v43;
      if (v46 - a4 + 0.0001 < 0.0)
      {
        v10 = v56;
      }
      else
      {
        v10 = v56;
        if (v45 > v42 != v47 < v44)
        {
          if (v45 <= v42)
            v48 = 0;
          else
            v48 = (uint64_t)(0.0 - ceil((v45 - v42) / a4));
          if (v47 < v44)
            v48 = (uint64_t)(ceil((v44 - v47) / a4) + (double)v48);
          v14 = _UISetPointValueForAxis(*(_QWORD *)(a1 + 104), a2, a3, (double)(v48 + v40) * a4);
          v13 = v49;
        }
      }
    }
  }
  else
  {
    v13 = a3;
    v14 = a2;
  }
  v50 = _UIPointValueForAxis(*(_QWORD *)(a1 + 104), v14, v13);
  if (v10 < 0.0 || v50 < 0.0)
  {
    v51 = *(_QWORD *)(a1 + 104);
    v54 = 0.0;
    v52 = v14;
    v53 = v13;
    return _UISetPointValueForAxis(v51, v52, v53, v54);
  }
  if (v50 > v10)
  {
    v51 = *(_QWORD *)(a1 + 104);
    v52 = v14;
    v53 = v13;
    v54 = v10;
    return _UISetPointValueForAxis(v51, v52, v53, v54);
  }
  return v14;
}

@end
