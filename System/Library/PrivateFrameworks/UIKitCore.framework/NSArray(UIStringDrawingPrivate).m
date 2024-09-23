@implementation NSArray(UIStringDrawingPrivate)

- (double)_legacy_drawComponentsJoinedByString:()UIStringDrawingPrivate atPoint:forWidth:withFont:lineBreakMode:
{
  id v13;
  void *v14;
  double v15;
  uint64_t v16;
  size_t v17;
  void **v18;
  uint64_t v19;
  uint64_t v20;
  double *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void **v28;
  void *v29;
  double v30;
  unint64_t v31;
  double v32;
  double v33;
  double *v34;
  unint64_t v35;
  double v36;
  double v37;
  double v38;
  BOOL v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  double *v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  double *v51;
  uint64_t v52;
  unint64_t v53;
  double **v54;
  id v55;
  void **v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a6 - 6) <= 0xFFFFFFFFFFFFFFFBLL)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIStringDrawing.m"), 523, CFSTR("Only truncation and clipping line breaking is supported for multi-component strings"));
  v13 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v14 = (void *)objc_msgSend(a1, "componentsJoinedByString:", a3);
  objc_msgSend(v14, "_legacy_sizeWithFont:", a5);
  if (v15 <= a7)
  {
    if (a4)
      objc_msgSend(v14, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:", a5, a6, *a4, a4[1], a7);
    v41 = v15;
  }
  else
  {
    v51 = a4;
    v55 = v13;
    v52 = a6;
    v16 = objc_msgSend(a1, "count");
    v54 = &v51;
    v17 = 8 * v16;
    MEMORY[0x1E0C80A78](v16);
    v18 = (void **)((char *)&v51 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
    MEMORY[0x1E0C80A78](v19);
    v21 = (double *)((char *)&v51 - v20);
    v53 = v22;
    if (v22)
    {
      bzero((char *)&v51 - v20, v17);
      bzero(v18, v17);
    }
    v60 = 0u;
    v59 = 0u;
    v58 = 0u;
    v57 = 0u;
    v23 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    if (v23)
    {
      v24 = v23;
      v25 = 0;
      v26 = *(_QWORD *)v58;
      v56 = v18;
      do
      {
        v27 = 0;
        v28 = &v18[v25];
        do
        {
          if (*(_QWORD *)v58 != v26)
            objc_enumerationMutation(a1);
          v29 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v27);
          if (v25 + v27)
            v29 = (void *)objc_msgSend(a3, "stringByAppendingString:", v29);
          v28[v27] = v29;
          objc_msgSend(v29, "_legacy_sizeWithFont:", a5);
          v21[v25 + v27++] = v30;
        }
        while (v24 != v27);
        v24 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
        v25 += v27;
        v18 = v56;
      }
      while (v24);
    }
    v31 = v53;
    if (v53)
    {
      v32 = a7 / (double)v53;
      v33 = 0.0;
      v34 = v21;
      v35 = v53;
      v36 = 0.0;
      v13 = v55;
      do
      {
        v37 = *v34++;
        v38 = v37;
        v39 = v37 > v32;
        if (v37 <= v32)
          v40 = -0.0;
        else
          v40 = v38;
        v36 = v36 + v40;
        if (v39)
          v38 = -0.0;
        v33 = v33 + v38;
        --v35;
      }
      while (v35);
      v41 = *MEMORY[0x1E0C9D820];
      v42 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      v43 = (a7 - v33) / v36;
      v44 = v52;
      v45 = v51;
      do
      {
        if (*v21 > v32)
          v46 = v43;
        else
          v46 = 1.0;
        v47 = *v18;
        if (v45)
          objc_msgSend(v47, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:", a5, v44, v41 + *v45, v45[1], *v21 * v46);
        else
          objc_msgSend(v47, "_legacy_sizeWithFont:forWidth:lineBreakMode:", a5, v44, *v21 * v46);
        v41 = v41 + ceil(v48);
        if (v42 < v49)
          v42 = v49;
        ++v18;
        ++v21;
        --v31;
      }
      while (v31);
    }
    else
    {
      v41 = *MEMORY[0x1E0C9D820];
      v13 = v55;
    }
  }

  return v41;
}

@end
