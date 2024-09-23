@implementation _UIFlowLayoutRow

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_destroyWeak((id *)&self->_section);
}

- (void)layoutRow
{
  id *WeakRetained;
  double *v3;
  double v4;
  double *v5;
  double *v6;
  BOOL v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int v13;
  uint64_t v14;
  double v15;
  id v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  double v28;
  uint64_t v29;
  int v30;
  id v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  BOOL v36;
  double v37;
  double v38;
  double v39;
  double v40;
  int v41;
  uint64_t v42;
  double v43;
  char *v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  double *v53;
  double v54;
  double v55;
  double v56;
  int v57;
  double v58;
  double v59;
  double v60;
  double v61;
  CGFloat v62;
  double v63;
  uint64_t v64;
  double v65;
  double v66;
  double v67;
  double v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;
  CGRect v80;

  v79 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 24));
    v3 = (double *)WeakRetained;
    v4 = 0.0;
    if (WeakRetained)
    {
      v5 = (double *)objc_loadWeakRetained(WeakRetained + 18);
      v6 = v5;
      v7 = v5 == 0;
      if (v5)
      {
        v8 = v3[35];
        v9 = v3[36];
        v11 = v3[37];
        v10 = v3[38];
        v12 = v5[14];
        v65 = v10;
        v66 = v9;
        if (*((_BYTE *)v5 + 97))
        {
          v7 = 0;
          v13 = 1;
          v14 = 14;
          v10 = v3[37];
          v9 = v3[35];
        }
        else
        {
          v13 = 0;
          v14 = 15;
        }
      }
      else
      {
        v13 = 0;
        v8 = v3[35];
        v9 = v3[36];
        v11 = v3[37];
        v10 = v3[38];
        v12 = 0.0;
        v14 = 15;
        v65 = v10;
        v66 = v9;
      }
      v15 = v3[v14];
    }
    else
    {
      v13 = 0;
      v6 = 0;
      v10 = 0.0;
      v12 = 0.0;
      v7 = 1;
      v15 = 0.0;
      v65 = 0.0;
      v66 = 0.0;
      v11 = 0.0;
      v8 = 0.0;
      v9 = 0.0;
    }
    v68 = v15;
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v16 = *(id *)(a1 + 40);
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
    v18 = 0.0;
    if (v17)
    {
      v19 = v17;
      v20 = *(_QWORD *)v74;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v74 != v20)
            objc_enumerationMutation(v16);
          v22 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * v21);
          if (v22)
          {
            v23 = *(double *)(v22 + 48);
            v24 = *(double *)(v22 + 56);
          }
          else
          {
            v23 = 0.0;
            v24 = 0.0;
          }
          if (v13)
            v25 = v23;
          else
            v25 = v24;
          if (v13)
            v23 = v24;
          if (v25 > v18)
            v18 = v25;
          v4 = v4 + v23;
          ++v21;
        }
        while (v19 != v21);
        v26 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
        v19 = v26;
      }
      while (v26);
    }

    if (v13)
      v27 = v12;
    else
      v27 = v18;
    if (v13)
      v28 = v18;
    else
      v28 = v12;
    *(double *)(a1 + 56) = v28;
    *(double *)(a1 + 64) = v27;
    if (v3)
      v29 = *((_QWORD *)v3 + 29);
    else
      v29 = 0;
    if (*(_BYTE *)(a1 + 9))
      v30 = v29;
    else
      v30 = HIDWORD(v29);
    v31 = *(id *)(a1 + 40);
    v32 = v31;
    switch(v30)
    {
      case 1:
        v33 = v9 + (v12 - v4 - v68 * (double)(unint64_t)(objc_msgSend(v31, "count") - 1) - v10 - v9) * 0.5;
        goto LABEL_48;
      case 3:
        if ((unint64_t)objc_msgSend(v31, "count") <= 1)
        {
          v34 = v12 - (v10 + v9);
          v35 = (v34 - v4) * 0.5;
          v36 = v34 < v4;
          v37 = -0.0;
          if (!v36)
            v37 = v35;
          v33 = v9 + v37;
          v68 = 0.0;
LABEL_48:
          if (*(_BYTE *)(a1 + 9) || !*(_BYTE *)(a1 + 20) || (_DWORD)v29 != 3 || (v29 & 0xFFFFFFFD00000000) != 0)
          {
LABEL_69:
            v67 = *(double *)(a1 + 56);
            v69 = 0u;
            v70 = 0u;
            v71 = 0u;
            v72 = 0u;
            v48 = v32;
            v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
            if (!v49)
              goto LABEL_101;
            v50 = v49;
            v51 = *(_QWORD *)v70;
            while (1)
            {
              v52 = 0;
              do
              {
                if (*(_QWORD *)v70 != v51)
                  objc_enumerationMutation(v48);
                v53 = *(double **)(*((_QWORD *)&v69 + 1) + 8 * v52);
                if (v53)
                {
                  v54 = v53[6];
                  v55 = v53[7];
                }
                else
                {
                  v54 = 0.0;
                  v55 = 0.0;
                }
                if (v13)
                  v56 = v55;
                else
                  v56 = v54;
                v57 = *(_DWORD *)(a1 + 12);
                if (v13)
                  v58 = v54;
                else
                  v58 = v55;
                v59 = v18 * 0.5 + v58 * -0.5;
                v60 = v18 - v58;
                if (v57 != 2)
                  v60 = 0.0;
                if (v57 == 1)
                  v60 = v59;
                if ((v13 & 1) != 0)
                {
                  if (v7)
                  {
                    v61 = v60;
                    v62 = v33;
                  }
                  else
                  {
                    v61 = v60;
                    v62 = v33;
                    v63 = v60;
                    v60 = v33;
                    if (*((_BYTE *)v6 + 98))
                      goto LABEL_93;
                  }
                }
                else if (v7)
                {
                  v61 = v33;
                  v62 = v60;
                }
                else
                {
                  v61 = v33;
                  v62 = v60;
                  v63 = v33;
                  if (*((_BYTE *)v6 + 98))
                    goto LABEL_93;
                }
                v80.origin.x = v61;
                v80.origin.y = v62;
                v80.size.width = v54;
                v80.size.height = v55;
                v63 = v67 - CGRectGetWidth(v80) - v61;
                v60 = v62;
LABEL_93:
                if (v53)
                {
                  v53[4] = v63;
                  v53[5] = v60;
                  v53[6] = v54;
                  v53[7] = v55;
                }
                v33 = v33 + v68 + v56;
                ++v52;
              }
              while (v50 != v52);
              v64 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
              v50 = v64;
              if (!v64)
              {
LABEL_101:

                return;
              }
            }
          }
          v38 = 0.0;
          v39 = 0.0;
          if (v7 || (v39 = v6[14], !*((_BYTE *)v6 + 97)))
          {
            v41 = 0;
            v40 = v66 + v65;
            if (v3)
            {
              v42 = 15;
              goto LABEL_58;
            }
          }
          else
          {
            v40 = v11 + v8;
            v41 = 1;
            if (v3)
            {
              v42 = 14;
LABEL_58:
              v38 = v3[v42];
            }
          }
          v43 = v39 - v40;
          objc_msgSend(*(id *)(a1 + 40), "lastObject");
          v44 = (char *)objc_claimAutoreleasedReturnValue();
          v45 = 0.0;
          v68 = 0.0;
          if (v44)
          {
            v46 = 48;
            if (v41)
              v46 = 56;
            v45 = *(double *)&v44[v46];
          }
          if (v45 <= v43)
          {
            v47 = -1;
            do
            {
              v43 = v43 - (v38 + v45);
              ++v47;
            }
            while (v45 <= v43);
            if (v47)
              v68 = (v12 - v45 * (double)(v47 + 1) - v9 - v10) / (double)v47;
          }

          v33 = v9;
          goto LABEL_69;
        }
        v68 = (v12 - v4 - v9 - v10) / (double)(unint64_t)(objc_msgSend(v32, "count") - 1);
        break;
      case 2:
        v33 = v12 - v4 - v68 * (double)(unint64_t)(objc_msgSend(v31, "count") - 1) - v10;
        goto LABEL_48;
    }
    v33 = v9;
    goto LABEL_48;
  }
}

- (_UIFlowLayoutRow)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIFlowLayoutRow;
  v2 = -[_UIFlowLayoutRow init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
    v4 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v3;

    *(_QWORD *)(v2 + 12) = 0x300000001;
  }
  return (_UIFlowLayoutRow *)v2;
}

- (void)addItem:(int)a3 atEnd:
{
  id *v5;
  void *v6;
  id *v7;

  v5 = a2;
  if (a1)
  {
    v6 = (void *)a1[5];
    v7 = v5;
    if (a3)
      objc_msgSend(v6, "addObject:", v5);
    else
      objc_msgSend(v6, "insertObject:atIndex:", v5, 0);
    v5 = v7;
    if (v7)
    {
      objc_storeWeak(v7 + 3, a1);
      v5 = v7;
    }
  }

}

- (uint64_t)indexOfNearestItemAtPoint:(double)a3
{
  uint64_t v3;
  id *WeakRetained;
  id *v7;
  _BYTE *v8;
  BOOL v9;
  void *v10;
  _QWORD v12[8];
  BOOL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a1;
  if (a1)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 24));
    v7 = WeakRetained;
    if (WeakRetained && (v8 = objc_loadWeakRetained(WeakRetained + 18)) != 0)
    {
      v9 = v8[97] != 0;

    }
    else
    {
      v9 = 0;
    }

    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v10 = *(void **)(v3 + 40);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __46___UIFlowLayoutRow_indexOfNearestItemAtPoint___block_invoke;
    v12[3] = &unk_1E16BE320;
    v13 = v9;
    *(double *)&v12[6] = a2;
    *(double *)&v12[7] = a3;
    v12[4] = v3;
    v12[5] = &v14;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v12);
    v3 = v15[3];
    _Block_object_dispose(&v14, 8);
  }
  return v3;
}

@end
