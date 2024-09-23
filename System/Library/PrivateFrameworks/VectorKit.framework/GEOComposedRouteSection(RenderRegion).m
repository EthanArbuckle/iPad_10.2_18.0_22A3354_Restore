@implementation GEOComposedRouteSection(RenderRegion)

- (id)pathsForRenderRegion:()RenderRegion inOverlay:shouldSnapToTransit:verifySnapping:elevationSource:elevationSourceContext:
{
  objc_msgSend(a1, "pathsForRenderRegion:inOverlay:elevationSource:elevationSourceContext:", a3, a4, a7, a8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)pathsForRenderRegion:()RenderRegion inOverlay:elevationSource:elevationSourceContext:
{
  char *v6;
  char *v7;
  __int128 v8;

  v6 = &a1[*MEMORY[0x1E0D27760]];
  v7 = &a1[*MEMORY[0x1E0D27768]];
  v8 = *(_OWORD *)(v6 + 24);
  *(_OWORD *)v7 = *(_OWORD *)v6;
  *((_OWORD *)v7 + 1) = v8;
  objc_msgSend(a1, "pathsForRenderRegion:inOverlay:excludedSegments:elevationSource:elevationSourceContext:", a3, a4, 0, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)pathsForRenderRegion:()RenderRegion inOverlay:excludedSegments:elevationSource:elevationSourceContext:
{
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
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
  BOOL v27;
  BOOL v28;
  id v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  int v38;
  int v39;
  int v40;
  uint64_t v41;
  unsigned int v42;
  uint64_t v43;
  signed int v44;
  float v45;
  float v46;
  float v47;
  float v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  _BOOL4 v57;
  _BOOL4 v58;
  uint64_t v59;
  int v60;
  _BOOL4 v61;
  uint64_t v62;
  uint8x8_t v63;
  unint64_t v64;
  uint64_t *v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  unsigned int v72;
  unsigned int *v73;
  unsigned int v74;
  int v75;
  __objc2_class **v76;
  void *v77;
  int v78;
  __objc2_class **v79;
  void *v80;
  int v81;
  __objc2_class **v82;
  void *v83;
  _QWORD *v84;
  _QWORD *v85;
  void *v86;
  void *v88;
  void *v89;
  uint64_t *v92;
  id v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  void *v98[2];
  void *__p[2];
  int v100;
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v93 = a4;
  v88 = v10;
  objc_msgSend(v10, "visibleRect");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(a1, "vkBounds");
  v23 = v22;
  if (v16 <= v22
    || ((v24 = v19, v25 = v20, v26 = v21, v12 < v20) ? (v27 = v18 <= v19) : (v27 = 1),
        !v27 ? (v28 = v14 < v21) : (v28 = 0),
        !v28))
  {
    v29 = 0;
    goto LABEL_90;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)v98 = 0u;
  *(_OWORD *)__p = 0u;
  v100 = 1065353216;
  objc_msgSend(v93, "composedRoute");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "transportType");

  v92 = a5;
  if (v31 == 2)
  {
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    objc_msgSend(v93, "composedRoute");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "visualInfos");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v94, v101, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v95;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v95 != v35)
            objc_enumerationMutation(v33);
          v37 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
          if (objc_msgSend(v37, "type") == 191)
          {
            if (objc_msgSend(v37, "routeCoordinateRange"))
            {
              v38 = objc_msgSend(v37, "routeCoordinateRange");
              std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int>((float *)v98, v38, v38);
            }
            objc_msgSend(v37, "routeCoordinateRange");
            if (v39)
            {
              objc_msgSend(v37, "routeCoordinateRange");
              std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int>((float *)v98, v40, v40);
            }
          }
        }
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v94, v101, 16);
      }
      while (v34);
    }

  }
  v41 = objc_msgSend(a1, "endPointIndex");
  v42 = v41;
  v43 = 0;
  v44 = 0;
  v45 = (v12 - v23) / (v25 - v23);
  v46 = (v14 - v24) / (v26 - v24);
  v47 = (v16 - v23) / (v25 - v23);
  v48 = (v18 - v24) / (v26 - v24);
  v49 = v41;
  while (v44 < objc_msgSend(a1, "pointCount") - 1)
  {
    v51 = *(_QWORD *)&a1[*MEMORY[0x1E0D27778]] + 12 * v44;
    v52 = *(float *)(v51 + 12);
    if (fmaxf(fmaxf(*(float *)v51, -3.4028e38), v52) <= v45)
    {
      v58 = 0;
    }
    else
    {
      v53 = *(float *)(v51 + 4);
      v54 = *(float *)(v51 + 16);
      v55 = fmaxf(fmaxf(v53, -3.4028e38), v54);
      v56 = fminf(v54, fminf(v53, 3.4028e38));
      v57 = fminf(v52, fminf(*(float *)v51, 3.4028e38)) < v47;
      if (v55 <= v46)
        v57 = 0;
      v58 = v56 < v48 && v57;
    }
    v59 = (int)*MEMORY[0x1E0D27780];
    v60 = *(_DWORD *)&a1[v59];
    if ((_DWORD)v49 == v42)
    {
      v61 = 0;
      v62 = (v60 + v44);
    }
    else
    {
      if (v98[1])
      {
        v63 = (uint8x8_t)vcnt_s8((int8x8_t)v98[1]);
        v63.i16[0] = vaddlv_u8(v63);
        if (v63.u32[0] > 1uLL)
        {
          v64 = v44;
          if (v98[1] <= (void *)v44)
            v64 = v44 % (unint64_t)v98[1];
        }
        else
        {
          v64 = ((unint64_t)v98[1] - 1) & v44;
        }
        v65 = (uint64_t *)*((_QWORD *)v98[0] + v64);
        if (v65)
        {
          v65 = (uint64_t *)*v65;
          if (v65)
          {
            if (v63.u32[0] < 2uLL)
            {
              while (1)
              {
                v67 = v65[1];
                if (v67 == v44)
                {
                  if (*((_DWORD *)v65 + 4) == v44)
                    goto LABEL_58;
                }
                else if ((v67 & ((uint64_t)v98[1] - 1)) != v64)
                {
                  goto LABEL_57;
                }
                v65 = (uint64_t *)*v65;
                if (!v65)
                  goto LABEL_58;
              }
            }
            do
            {
              v66 = v65[1];
              if (v66 == v44)
              {
                if (*((_DWORD *)v65 + 4) == v44)
                  break;
              }
              else
              {
                if ((void *)v66 >= v98[1])
                  v66 %= (unint64_t)v98[1];
                if (v66 != v64)
                  goto LABEL_57;
              }
              v65 = (uint64_t *)*v65;
            }
            while (v65);
          }
        }
      }
      else
      {
LABEL_57:
        v65 = 0;
      }
LABEL_58:
      v61 = v65 != 0;
      v62 = (v60 + v44);
      if (v65)
      {
LABEL_74:
        if (v49 < v42)
        {
          v78 = objc_msgSend(a1, "transportType");
          v79 = off_1E426D440;
          if (v78)
            v79 = off_1E426D518;
          v80 = (void *)objc_msgSend(objc_alloc(*v79), "initWithOverlay:section:routeStartIndex:routeEndIndex:matchedPathSegments:elevationSource:elevationSourceContext:", v93, a1, v49, v62, 0, a6, a7);
          objc_msgSend(v89, "addObject:", v80);
          if (v61)
            v49 = v62;
          else
            v49 = v42;

        }
LABEL_25:
        v50 = v43;
        goto LABEL_26;
      }
    }
    if (!v58)
      goto LABEL_74;
    if (v49 >= v42)
      v49 = v62;
    else
      v49 = v49;
    if (!v92)
      goto LABEL_25;
    v68 = *v92;
    v69 = (v92[1] - *v92) >> 3;
    v70 = v43;
    if (v69 <= v43)
      goto LABEL_25;
    v50 = (v43 + 1);
    while (1)
    {
      if (v62 >= *(_DWORD *)(v68 + 8 * v70))
      {
        v71 = v68 + 8 * v70;
        v74 = *(_DWORD *)(v71 + 4);
        v73 = (unsigned int *)(v71 + 4);
        v72 = v74;
        v43 = v50;
        if (v62 <= v74)
          break;
      }
      v70 = v50;
      v50 = (v50 + 1);
      if (v69 <= v70)
        goto LABEL_25;
    }
    if (v49 < v62)
    {
      v75 = objc_msgSend(a1, "transportType");
      v76 = off_1E426D440;
      if (v75)
        v76 = off_1E426D518;
      v77 = (void *)objc_msgSend(objc_alloc(*v76), "initWithOverlay:section:routeStartIndex:routeEndIndex:matchedPathSegments:elevationSource:elevationSourceContext:", v93, a1, v49, v62, 0, a6, a7);
      objc_msgSend(v89, "addObject:", v77);

      v72 = *v73;
      v60 = *(_DWORD *)&a1[v59];
    }
    v44 += v72 - v62;
    v49 = (v44 + v60);
LABEL_26:
    ++v44;
    v43 = v50;
  }
  if (v49 < v42)
  {
    v81 = objc_msgSend(a1, "transportType");
    v82 = off_1E426D440;
    if (v81)
      v82 = off_1E426D518;
    v83 = (void *)objc_msgSend(objc_alloc(*v82), "initWithOverlay:section:routeStartIndex:routeEndIndex:matchedPathSegments:elevationSource:elevationSourceContext:", v93, a1, v49, objc_msgSend(a1, "endPointIndex"), 0, a6, a7);
    objc_msgSend(v89, "addObject:", v83);

  }
  v29 = v89;
  v84 = __p[0];
  if (__p[0])
  {
    do
    {
      v85 = (_QWORD *)*v84;
      operator delete(v84);
      v84 = v85;
    }
    while (v85);
  }
  v86 = v98[0];
  v98[0] = 0;
  if (v86)
    operator delete(v86);

LABEL_90:
  return v29;
}

@end
