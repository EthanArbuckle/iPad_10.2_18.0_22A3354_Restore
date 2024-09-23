@implementation UIView(TUICandidateLine)

- (void)_attachLine:()TUICandidateLine toEdge:
{
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  CGRect v25;
  CGRect v26;

  v24 = a3;
  objc_msgSend(a1, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = TUIScreenScaleForView(a1);
  v15 = 0;
  v16 = 1.0 / v14;
  v17 = 1.0 / v14;
  v18 = 1.0 / v14;
  switch(a4)
  {
    case 1:
    case 4:
      objc_msgSend(a1, "bounds");
      v18 = v19;
      v15 = 2;
      v17 = v16;
      break;
    case 2:
    case 8:
      objc_msgSend(a1, "bounds");
      v17 = v20;
      v15 = 16;
      goto LABEL_5;
    case 3:
    case 5:
    case 6:
    case 7:
      break;
    default:
      v17 = 1.0 / v14;
LABEL_5:
      v18 = v16;
      break;
  }
  v21 = 0.0;
  v22 = 0.0;
  switch(a4)
  {
    case 1:
      v15 |= 0x20uLL;
      break;
    case 2:
      v15 |= 4uLL;
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      break;
    case 4:
      v25.origin.x = v7;
      v25.origin.y = v9;
      v25.size.width = v11;
      v25.size.height = v13;
      v22 = CGRectGetMaxY(v25) - v16;
      v15 |= 8uLL;
      break;
    case 8:
      v26.origin.x = v7;
      v26.origin.y = v9;
      v26.size.width = v11;
      v26.size.height = v13;
      v21 = CGRectGetMaxX(v26) - v16;
      v15 |= 1uLL;
      goto LABEL_11;
    default:
LABEL_11:
      v22 = 0.0;
      break;
  }
  objc_msgSend(v24, "setFrame:", v21, v22, v18, v17);
  objc_msgSend(a1, "addSubview:", v24);
  objc_msgSend(v24, "setAutoresizingMask:", v15);
  objc_msgSend(v24, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setZPosition:", 1.0);

  objc_msgSend(v24, "setTag:", a4);
}

- (void)_setShowsLinesOnEdges:()TUICandidateLine style:
{
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t j;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  TUICandidateLine *v34;
  double v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (a3 == 15 && (objc_msgSend(v6, "cornerRadius"), v8 > 0.0))
  {
    v9 = 1.0 / TUIScreenScaleForView(a1);
    objc_msgSend(a1, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBorderWidth:", v9);

    objc_msgSend(v7, "lineColor");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = objc_msgSend(v11, "CGColor");
    objc_msgSend(a1, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBorderColor:", v12);

    a3 = 0;
  }
  else
  {
    objc_msgSend(a1, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBorderWidth:", 0.0);

    objc_msgSend(a1, "layer");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBorderColor:", 0);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v36 = a1;
  objc_msgSend(a1, "subviews");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v42 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v21, "tag"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, v22);

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v18);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v23 = objc_msgSend(&unk_1E2517798, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v38;
    v26 = *MEMORY[0x1E0C9D648];
    v27 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v28 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v29 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v38 != v25)
          objc_enumerationMutation(&unk_1E2517798);
        v31 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
        v32 = objc_msgSend(v31, "integerValue");
        objc_msgSend(v15, "objectForKeyedSubscript:", v31);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = (TUICandidateLine *)v33;
        if ((v32 & a3) != 0)
        {
          if (!v33)
          {
            v34 = -[TUICandidateLine initWithFrame:]([TUICandidateLine alloc], "initWithFrame:", v26, v27, v28, v29);
            objc_msgSend(v36, "_attachLine:toEdge:", v34, v32);
          }
          -[TUICandidateLine setStyle:](v34, "setStyle:", v7);
          objc_msgSend(v7, "backgroundOpacity");
        }
        else
        {
          v35 = 0.0;
        }
        -[TUICandidateLine setAlpha:](v34, "setAlpha:", v35);

      }
      v24 = objc_msgSend(&unk_1E2517798, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v24);
  }

}

- (void)_setImage:()TUICandidateLine onEdges:outside:style:
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t j;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  TUICandidateLine *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;
  CGRect v58;

  v57 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v46 = a6;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v44 = a1;
  objc_msgSend(a1, "subviews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v52 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v16, "tag"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v17);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    }
    while (v13);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v18 = objc_msgSend(&unk_1E25177B0, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v48;
    v21 = *MEMORY[0x1E0C9D648];
    v22 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v24 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v48 != v20)
          objc_enumerationMutation(&unk_1E25177B0);
        v26 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
        v27 = objc_msgSend(v26, "integerValue");
        objc_msgSend(v10, "objectForKeyedSubscript:", v26);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = (TUICandidateLine *)v28;
        if ((v27 & a4) != 0)
        {
          if (!v28)
          {
            v29 = -[TUICandidateLine initWithFrame:]([TUICandidateLine alloc], "initWithFrame:", v21, v22, v23, v24);
            objc_msgSend(v44, "_attachLine:toEdge:", v29, v27);
          }
          -[TUICandidateLine subviews](v29, "subviews");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "count");

          if (!v31)
          {
            v32 = objc_alloc_init(MEMORY[0x1E0DC3890]);
            -[TUICandidateLine addSubview:](v29, "addSubview:", v32);

          }
          -[TUICandidateLine setBackgroundColor:](v29, "setBackgroundColor:", 0);
          -[TUICandidateLine subviews](v29, "subviews");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "firstObject");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            objc_msgSend(v34, "setImage:", v9);
            objc_msgSend(v46, "foregroundOpacity");
            -[TUICandidateLine setAlpha:](v29, "setAlpha:");
            -[TUICandidateLine bounds](v29, "bounds");
            v37 = v36;
            v38 = v35;
            if (a5)
            {
              v39 = v35;
              if (v27 == 2)
              {
                objc_msgSend(v9, "size");
                v39 = -v40;
              }
            }
            else
            {
              v39 = 0.0;
              if (v27 != 2)
              {
                objc_msgSend(v9, "size");
                v39 = v38 - v41;
              }
            }
            objc_msgSend(v9, "size");
            v43 = v42;
            -[TUICandidateLine bounds](v29, "bounds");
            objc_msgSend(v34, "setFrame:", v39, v37, v43, CGRectGetHeight(v58));
          }
          else
          {
            -[TUICandidateLine setAlpha:](v29, "setAlpha:", 0.0);
          }

        }
      }
      v19 = objc_msgSend(&unk_1E25177B0, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v19);
  }

}

- (id)_allLines
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a1, "subviews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v2, "addObject:", v8);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

@end
