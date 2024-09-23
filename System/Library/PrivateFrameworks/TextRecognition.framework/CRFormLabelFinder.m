@implementation CRFormLabelFinder

+ (double)_labelMatchingCostForRegion:(id)a3 field:(id)a4 position:(unint64_t *)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v51;
  uint64_t v52;
  double v53;
  double v54;

  v7 = a3;
  v8 = a4;
  if (v7 != v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v14 = 0;
        goto LABEL_12;
      }
      v9 = v7;
      objc_msgSend(v9, "text");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (qword_1ED0B4530 == -1)
      {
        if (!v10)
          goto LABEL_55;
      }
      else
      {
        dispatch_once(&qword_1ED0B4530, &__block_literal_global_13);
        if (!v11)
          goto LABEL_55;
      }
      if (objc_msgSend(v11, "length"))
      {
        v12 = objc_msgSend(v11, "characterAtIndex:", 0);
        if ((objc_msgSend((id)_MergedGlobals_17, "characterIsMember:", v12) & 1) != 0
          || (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_1D513AC40, (uint32x4_t)vaddq_s32(vdupq_n_s32(v12), (int32x4_t)xmmword_1D513AC30)))) & 1) != 0|| (v12 - 44032) >> 2 < 0xAE9|| ublock_getCode(v12) == UBLOCK_CURRENCY_SYMBOLS)
        {
          goto LABEL_8;
        }
        if (objc_msgSend(v11, "length") == 1)
          goto LABEL_55;
        if ((unint64_t)objc_msgSend(v11, "length") > 3)
        {
LABEL_8:

        }
        else
        {
          objc_msgSend(v11, "_crStringByReplacingCharactersInSet:withString:", qword_1ED0B4528, &stru_1E98DC948);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v51, "length");

          if (!v52)
          {
            v15 = 1.79769313e308;
            goto LABEL_58;
          }
        }
        objc_msgSend(v9, "text");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = +[CRFormUtilities stringEndsWithColon:](CRFormUtilities, "stringEndsWithColon:", v13);

LABEL_12:
        objc_msgSend(v7, "boundingQuad");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "boundingQuad");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "midPoint");
        v54 = v16;
        v18 = v17;
        objc_msgSend(v11, "midPoint");
        v53 = v19;
        v21 = v20;
        objc_msgSend(v11, "size");
        v23 = v22;
        objc_msgSend(v11, "topLeft");
        v25 = v24;
        objc_msgSend(v9, "topRight");
        if (v18 < v21)
        {
          v27 = v25 - v26;
          v28 = 9.6386522;
          if (!v14)
            v28 = 8.0;
          if (v27 < v28 * v23 && v27 > v23 * -3.1956241 && vabdd_f64(v54, v53) < v23 * 0.637716056)
          {
            v29 = 1.03271618;
            if (v14)
              v29 = 1.18845813;
            if (a5)
              *a5 = 3;
            v30 = fmax(v27, 0.0);
LABEL_33:
            v15 = v29 * v30;
LABEL_57:

LABEL_58:
            goto LABEL_59;
          }
        }
        objc_msgSend(v9, "topRight");
        v32 = v31;
        objc_msgSend(v11, "topRight");
        v34 = v33;
        objc_msgSend(v9, "topLeft");
        v36 = v35;
        objc_msgSend(v11, "topLeft");
        v38 = v37;
        objc_msgSend(v11, "size");
        v40 = v39;
        objc_msgSend(v11, "size");
        v41 = fmax(fmin(v32, v34) - fmax(v36, v38), 0.0);
        if (v41 > fmin(v40 * 0.2, v42 * 2.5) || (objc_msgSend(v9, "size"), v41 > v43 * 0.8))
        {
          v30 = v53 - v54;
          if (v53 - v54 > v23 * 0.403263008)
          {
            v44 = 2.2217905;
            if (v14)
              v44 = 3.22780074;
            if (v30 < v44 * v23)
            {
              v29 = 3.66674774;
              if (v14)
                v29 = 2.6;
              if (a5)
                *a5 = 1;
              goto LABEL_33;
            }
          }
          if (v23 * -0.134254297 < -v30 && v23 * 3.69995893 > -v30)
          {
            if (a5)
              *a5 = 2;
            v15 = v30 * -4.86195604;
            goto LABEL_57;
          }
        }
        objc_msgSend(v9, "topLeft");
        v46 = v45;
        objc_msgSend(v11, "topRight");
        if (v18 > v21)
        {
          v48 = v47;
          if (objc_msgSend(v8, "fieldType") == 2)
          {
            v49 = v46 - v48;
            if (v46 - v48 < v23 * 4.94467888 && v49 > v23 * -1.42588897 && vabdd_f64(v54, v53) < v23 * 0.933868987)
            {
              if (a5)
                *a5 = 4;
              if (v49 <= 0.0)
                v15 = 0.0;
              else
                v15 = v49 * 2.48167153;
              goto LABEL_57;
            }
          }
        }
        if (a5)
          *a5 = 0;
        goto LABEL_56;
      }
LABEL_55:

LABEL_56:
      v15 = 1.79769313e308;
      goto LABEL_57;
    }
  }
  v15 = 1.79769313e308;
LABEL_59:

  return v15;
}

+ (id)labelRegionForField:(id)a3 inRegions:(id)a4
{
  id v4;
  _QWORD v6[3];
  void **v7;

  objc_msgSend(a1, "labelRegionsForField:inRegions:", a3, a4);
  if (v6[0] == v6[1])
    v4 = 0;
  else
    v4 = *(id *)(v6[0] + 16);
  v7 = (void **)v6;
  std::vector<std::tuple<double,CRFormFieldLabelPosition,CROutputRegion * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v7);
  return v4;
}

+ (vector<std::tuple<double,)labelRegionsForField:(CROutputRegion *)> inRegions:()std:()CRFormFieldLabelPosition :(CROutputRegion *>>> *__return_ptr)retstr allocator<std:(id)a2 :(SEL)a3 tuple<double
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  id v17;
  id v18;
  char *var0;
  char *var1;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  char *v27;
  void *v28;
  char *v29;
  char *v30;
  char *v31;
  __int128 v32;
  uint64_t v33;
  char *v34;
  void *v35;
  __n128 v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  unint64_t v40;
  const std::nothrow_t *v41;
  unint64_t v42;
  void *v43;
  BOOL v44;
  void *v45;
  vector<std::tuple<double, CRFormFieldLabelPosition, CROutputRegion *>, std::allocator<std::tuple<double, CRFormFieldLabelPosition, CROutputRegion *>>> *result;
  __compressed_pair<std::tuple<double, CRFormFieldLabelPosition, CROutputRegion *> *, std::allocator<std::tuple<double, CRFormFieldLabelPosition, CROutputRegion *>>> *p_var2;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  _QWORD v54[5];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  v48 = v10;
  if (v11)
  {
    p_var2 = &retstr->var2;
    v12 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v50 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        v53 = 0;
        objc_msgSend(a2, "_labelMatchingCostForRegion:field:position:", v14, v8, &v53, p_var2);
        v16 = v15;
        if (v15 != 1.79769313e308)
        {
          v17 = v14;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v18 = v17;

            if (v18)
            {
              var1 = (char *)retstr->var1;
              var0 = (char *)retstr->var2.var0;
              if (var1 >= var0)
              {
                v22 = 0xAAAAAAAAAAAAAAABLL * ((var1 - (char *)retstr->var0) >> 3);
                v23 = v22 + 1;
                if (v22 + 1 > 0xAAAAAAAAAAAAAAALL)
                  std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
                v24 = 0xAAAAAAAAAAAAAAABLL * ((var0 - (char *)retstr->var0) >> 3);
                if (2 * v24 > v23)
                  v23 = 2 * v24;
                if (v24 >= 0x555555555555555)
                  v25 = 0xAAAAAAAAAAAAAAALL;
                else
                  v25 = v23;
                v54[4] = p_var2;
                if (v25)
                {
                  if (v25 > 0xAAAAAAAAAAAAAAALL)
                    std::__throw_bad_array_new_length[abi:ne180100]();
                  v26 = (char *)operator new(24 * v25);
                }
                else
                {
                  v26 = 0;
                }
                v27 = &v26[24 * v22];
                *(double *)v27 = v16;
                *((_QWORD *)v27 + 1) = v53;
                *((_QWORD *)v27 + 2) = v18;
                v29 = (char *)retstr->var0;
                v28 = retstr->var1;
                v30 = v27;
                if (v28 != retstr->var0)
                {
                  v31 = (char *)retstr->var1;
                  do
                  {
                    v32 = *(_OWORD *)(v31 - 24);
                    v31 -= 24;
                    *(_OWORD *)(v30 - 24) = v32;
                    v30 -= 24;
                    v33 = *((_QWORD *)v31 + 2);
                    *((_QWORD *)v31 + 2) = 0;
                    *((_QWORD *)v30 + 2) = v33;
                  }
                  while (v31 != v29);
                }
                v34 = &v26[24 * v25];
                v21 = v27 + 24;
                retstr->var0 = v30;
                retstr->var1 = v27 + 24;
                v35 = retstr->var2.var0;
                retstr->var2.var0 = v34;
                v54[2] = v28;
                v54[3] = v35;
                v54[0] = v29;
                v54[1] = v29;
                std::__split_buffer<std::tuple<double,CRFormFieldLabelPosition,CROutputRegion * {__strong}>>::~__split_buffer((uint64_t)v54);
                v10 = v48;
              }
              else
              {
                *(double *)var1 = v16;
                *((_QWORD *)var1 + 1) = v53;
                *((_QWORD *)var1 + 2) = v18;
                v21 = var1 + 24;
              }
              retstr->var1 = v21;
            }
          }
          else
          {

            v18 = 0;
          }

        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v11);
  }

  v37 = (uint64_t *)retstr->var0;
  v38 = (uint64_t *)retstr->var1;
  v39 = (char *)v38 - (char *)retstr->var0;
  v40 = 0xAAAAAAAAAAAAAAABLL * (v39 >> 3);
  if (v39 < 1)
  {
LABEL_34:
    v45 = 0;
    v42 = 0;
  }
  else
  {
    v41 = (const std::nothrow_t *)MEMORY[0x1E0DE4E10];
    v42 = 0xAAAAAAAAAAAAAAABLL * (v39 >> 3);
    while (1)
    {
      v43 = operator new(24 * v42, v41);
      if (v43)
        break;
      v44 = v42 > 1;
      v42 >>= 1;
      if (!v44)
        goto LABEL_34;
    }
    v45 = v43;
  }
  std::__stable_sort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<std::tuple<double,CRFormFieldLabelPosition,CROutputRegion * {__strong}> *>>(v37, v38, v40, (uint64_t)v45, v42, v36);
  if (v45)
    operator delete(v45);

  return result;
}

+ (id)parseAndAssignLabelForField:(id)a3 regions:(id)a4 associatedLabels:(id)a5 labelRegions:(void *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id *v14;
  id *v15;
  id *v16;
  id *v17;
  void *v18;
  void *v19;
  __int128 v21;
  uint64_t v22;
  void **v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  +[CRFormLabelFinder labelRegionForField:inRegions:](CRFormLabelFinder, "labelRegionForField:inRegions:", v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && objc_msgSend(v9, "fieldSource") == 1)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if (!+[CRFormUtilities isRegion:verticallyAlignedWithRegionBelow:maxRelativeDistance:](CRFormUtilities, "isRegion:verticallyAlignedWithRegionBelow:maxRelativeDistance:", v12, v9, 10.0)|| !+[CRFormUtilities isRegion:verticallyAlignedWithRegionBelow:maxRelativeDistance:](CRFormUtilities, "isRegion:verticallyAlignedWithRegionBelow:maxRelativeDistance:", v13, v9, 10.0))
      {

        v12 = 0;
      }
    }
    else
    {
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, v12);
    }

  }
  +[CRFormLabelFinder labelRegionsForField:inRegions:](CRFormLabelFinder, "labelRegionsForField:inRegions:", v9, v10);
  v14 = *(id **)a6;
  if (*(_QWORD *)a6)
  {
    v15 = (id *)*((_QWORD *)a6 + 1);
    v16 = *(id **)a6;
    if (v15 != v14)
    {
      do
      {
        v17 = v15 - 3;

        v15 = v17;
      }
      while (v17 != v14);
      v16 = *(id **)a6;
    }
    *((_QWORD *)a6 + 1) = v14;
    operator delete(v16);
    *(_QWORD *)a6 = 0;
    *((_QWORD *)a6 + 1) = 0;
    *((_QWORD *)a6 + 2) = 0;
  }
  *(_OWORD *)a6 = v21;
  *((_QWORD *)a6 + 2) = v22;
  v22 = 0;
  v21 = 0uLL;
  v23 = (void **)&v21;
  std::vector<std::tuple<double,CRFormFieldLabelPosition,CROutputRegion * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v23);
  CRCastAsClass<CRFormFieldOutputRegion>(v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
    objc_msgSend(v18, "setLabelRegion:", v12);

  return v12;
}

@end
