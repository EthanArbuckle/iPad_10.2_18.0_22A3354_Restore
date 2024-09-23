@implementation TSDMagicMoveTextureZOrderer

- (TSDMagicMoveTextureZOrderer)init
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMagicMoveTextureZOrderer init]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 1113, CFSTR("Do not call method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[TSDMagicMoveTextureZOrderer init]"), 0));
}

- (TSDMagicMoveTextureZOrderer)initWithAnimationMatches:(id)a3
{
  TSDMagicMoveTextureZOrderer *v4;
  TSDMagicMoveTextureZOrderer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSDMagicMoveTextureZOrderer;
  v4 = -[TSDMagicMoveTextureZOrderer init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[TSDMagicMoveTextureZOrderer p_setupZOrderMatchesWithAnimationMatches:](v4, "p_setupZOrderMatchesWithAnimationMatches:", a3);
    -[TSDMagicMoveTextureZOrderer p_calculateTextureArraysFromIntersections](v5, "p_calculateTextureArraysFromIntersections");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_percentTexturesTimes);
  v3.receiver = self;
  v3.super_class = (Class)TSDMagicMoveTextureZOrderer;
  -[TSDMagicMoveTextureZOrderer dealloc](&v3, sel_dealloc);
}

- (id)texturedRectanglesAtPercent:(double)a3
{
  NSUInteger v6;
  double *percentTexturesTimes;
  uint64_t v8;
  uint64_t v9;
  double v10;

  if (a3 == 0.0)
    return self->_outgoingTexturesInZOrder;
  if (a3 == 1.0)
    return self->_incomingTexturesInZOrder;
  v6 = -[NSArray count](self->_percentTextures, "count");
  if (v6 && (percentTexturesTimes = self->_percentTexturesTimes, *percentTexturesTimes <= a3))
  {
    v8 = v6 - 1;
    v9 = 1;
    while (v6 != v9)
    {
      v10 = percentTexturesTimes[v9++];
      if (v10 > a3)
      {
        v8 = v9 - 2;
        return -[NSArray objectAtIndexedSubscript:](self->_percentTextures, "objectAtIndexedSubscript:", v8);
      }
    }
  }
  else
  {
    v8 = 0;
  }
  return -[NSArray objectAtIndexedSubscript:](self->_percentTextures, "objectAtIndexedSubscript:", v8);
}

- (void)p_addVisibleTexturesFromMatches:(id)a3 toArray:(id)a4 interpolatedPercent:(double)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[5];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", a3);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __91__TSDMagicMoveTextureZOrderer_p_addVisibleTexturesFromMatches_toArray_interpolatedPercent___block_invoke;
  v20[3] = &__block_descriptor_40_e79_q24__0__TSDMagicMoveTextureZOrdererMatch_8__TSDMagicMoveTextureZOrdererMatch_16l;
  *(double *)&v20[4] = a5;
  objc_msgSend(v7, "sortUsingComparator:", v20);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = 0;
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        do
        {
          v14 = (void *)objc_msgSend((id)objc_msgSend(v13, "outgoingTexture"), "firstVisibleTextureForTextureType:", v12);
          if (v14
            || (v14 = (void *)objc_msgSend((id)objc_msgSend(v13, "incomingTexture"), "firstVisibleTextureForTextureType:", v12)) != 0)
          {
            objc_msgSend(a4, "addObject:", v14);
          }
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "layer"), "valueForKey:", CFSTR("kTSDTextureLayerKeyIsPaired")), "BOOLValue"))
          {
            v15 = objc_msgSend((id)objc_msgSend(v13, "incomingTexture"), "firstVisibleTextureForTextureType:", v12);
            if (v15)
            {
              if ((void *)v15 != v14)
                objc_msgSend(a4, "addObject:", v15);
            }
          }
          v12 = (v12 + 1);
        }
        while ((_DWORD)v12 != 10);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v9);
  }

}

uint64_t __91__TSDMagicMoveTextureZOrderer_p_addVisibleTexturesFromMatches_toArray_interpolatedPercent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (*(double *)(a1 + 32) >= 0.5)
  {
    v8 = objc_msgSend(a2, "incomingZIndex");
    if (v8 != objc_msgSend(a3, "incomingZIndex"))
      goto LABEL_3;
  }
  else
  {
    v5 = objc_msgSend(a2, "outgoingZIndex");
    if (v5 == objc_msgSend(a3, "outgoingZIndex"))
    {
LABEL_3:
      v6 = objc_msgSend(a2, "incomingZIndex");
      v7 = objc_msgSend(a3, "incomingZIndex");
      goto LABEL_6;
    }
  }
  v6 = objc_msgSend(a2, "outgoingZIndex");
  v7 = objc_msgSend(a3, "outgoingZIndex");
LABEL_6:
  if (v6 < v7)
    return -1;
  else
    return v6 > v7;
}

- (id)p_newArrayBySortingMatches:(id)a3 withInterpolatedPercent:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", a3);
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __82__TSDMagicMoveTextureZOrderer_p_newArrayBySortingMatches_withInterpolatedPercent___block_invoke;
  v22[3] = &__block_descriptor_40_e79_q24__0__TSDMagicMoveTextureZOrdererMatch_8__TSDMagicMoveTextureZOrdererMatch_16l;
  *(double *)&v22[4] = a4;
  objc_msgSend(v6, "sortUsingComparator:", v22);
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
        if (objc_msgSend(v8, "count"))
        {
          objc_msgSend((id)objc_msgSend(v8, "lastObject"), "interpolatedZIndexAtPercent:", a4);
          v15 = v14;
          objc_msgSend(v13, "interpolatedZIndexAtPercent:", a4);
          if (vabdd_f64(v15, v16) >= 0.00999999978)
          {
            -[TSDMagicMoveTextureZOrderer p_addVisibleTexturesFromMatches:toArray:interpolatedPercent:](self, "p_addVisibleTexturesFromMatches:toArray:interpolatedPercent:", v8, v7, a4);
            objc_msgSend(v8, "removeAllObjects");
          }
        }
        objc_msgSend(v8, "addObject:", v13);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v10);
  }
  -[TSDMagicMoveTextureZOrderer p_addVisibleTexturesFromMatches:toArray:interpolatedPercent:](self, "p_addVisibleTexturesFromMatches:toArray:interpolatedPercent:", v8, v7, a4);

  return v7;
}

uint64_t __82__TSDMagicMoveTextureZOrderer_p_newArrayBySortingMatches_withInterpolatedPercent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v5;
  double v6;
  double v7;

  objc_msgSend(a2, "interpolatedZIndexAtPercent:", *(double *)(a1 + 32));
  v6 = v5;
  objc_msgSend(a3, "interpolatedZIndexAtPercent:", *(double *)(a1 + 32));
  if (v6 < v7)
    return -1;
  else
    return v6 > v7;
}

- (void)p_adjustZOrdererMatchesZIndexByTextureType:(id)a3
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v43 = (void *)objc_opt_new();
  v3 = 1;
  v4 = 0x24BDD1000uLL;
  do
  {
    v5 = v3;
    objc_msgSend(v43, "removeAllObjects");
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v60 != v8)
            objc_enumerationMutation(a3);
          v10 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          if ((v5 & 1) != 0)
            v11 = objc_msgSend(v10, "outgoingZIndex");
          else
            v11 = objc_msgSend(v10, "incomingZIndex");
          v12 = v11;
          if (v11 != -1)
          {
            v13 = (void *)objc_msgSend(v43, "objectForKey:", objc_msgSend(*(id *)(v4 + 1760), "numberWithInteger:", v11));
            if (!v13)
            {
              v13 = (void *)objc_opt_new();
              objc_msgSend(v43, "setObject:forKey:", v13, objc_msgSend(*(id *)(v4 + 1760), "numberWithInteger:", v12));

            }
            objc_msgSend(v13, "addObject:", v10);
          }
        }
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
      }
      while (v7);
    }
    v14 = (void *)objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", objc_msgSend(v43, "allKeys"));
    objc_msgSend(v15, "sortUsingSelector:", sel_compare_);
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v40 = v15;
    v42 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
    if (v42)
    {
      v46 = 0;
      v41 = *(_QWORD *)v56;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v56 != v41)
            objc_enumerationMutation(v40);
          v44 = v16;
          v17 = (void *)objc_msgSend(v43, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v16));
          objc_msgSend(v14, "removeAllObjects");
          v53 = 0u;
          v54 = 0u;
          v51 = 0u;
          v52 = 0u;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v52;
            do
            {
              for (j = 0; j != v19; ++j)
              {
                if (*(_QWORD *)v52 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
                if ((v5 & 1) == 0)
                {
                  v23 = (void *)objc_msgSend(v22, "incomingTexture");
                  if (!v23)
                    continue;
LABEL_30:
                  objc_msgSend(v14, "addObject:", objc_msgSend(*(id *)(v4 + 1760), "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v23, "visibleTextures"), "firstObject"), "textureType")));
                  continue;
                }
                v23 = (void *)objc_msgSend(v22, "outgoingTexture");
                if (v23)
                  goto LABEL_30;
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
            }
            while (v19);
          }
          objc_msgSend(v14, "sortUsingComparator:", &__block_literal_global_373);
          v49 = 0u;
          v50 = 0u;
          v47 = 0u;
          v48 = 0u;
          v24 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v48;
            v45 = *(_QWORD *)v48;
            do
            {
              for (k = 0; k != v25; ++k)
              {
                if (*(_QWORD *)v48 != v26)
                  objc_enumerationMutation(v17);
                v28 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * k);
                if ((v5 & 1) != 0)
                  v29 = (void *)objc_msgSend(v28, "outgoingTexture");
                else
                  v29 = (void *)objc_msgSend(v28, "incomingTexture");
                v30 = objc_msgSend(v14, "indexOfObject:", objc_msgSend(*(id *)(v4 + 1760), "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v29, "visibleTextures"), "firstObject"), "textureType")));
                if (v30 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  v31 = v17;
                  v32 = v5;
                  v33 = v14;
                  v34 = v4;
                  v35 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
                  v36 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMagicMoveTextureZOrderer p_adjustZOrdererMatchesZIndexByTextureType:]");
                  v37 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m");
                  v38 = (void *)v35;
                  v4 = v34;
                  v14 = v33;
                  v5 = v32;
                  v17 = v31;
                  v26 = v45;
                  objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v36, v37, 1274, CFSTR("Couldn't find texture type!"));
                }
                if ((v5 & 1) != 0)
                {
                  if ((objc_msgSend(v28, "isOutgoingZIndexUnmatched") & 1) == 0)
                    objc_msgSend(v28, "setOutgoingZIndex:", v30 + v46 + objc_msgSend(v28, "outgoingZIndex"));
                }
                else if ((objc_msgSend(v28, "isIncomingZIndexUnmatched") & 1) == 0)
                {
                  objc_msgSend(v28, "setIncomingZIndex:", v30 + v46 + objc_msgSend(v28, "incomingZIndex"));
                }
              }
              v25 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
            }
            while (v25);
          }
          v46 = v46 + objc_msgSend(v14, "count") - 1;
          v16 = v44 + 1;
        }
        while (v44 + 1 != v42);
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
      }
      while (v42);
    }

    v3 = 0;
  }
  while ((v5 & 1) != 0);

}

uint64_t __74__TSDMagicMoveTextureZOrderer_p_adjustZOrdererMatchesZIndexByTextureType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)p_setupZOrderMatchesWithAnimationMatches:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  TSDMagicMoveTextureZOrdererMatch *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  BOOL v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  void *v31;
  char v32;
  char v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t n;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t ii;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t jj;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v57;
  uint64_t v58;
  NSArray *v59;
  uint64_t v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x24BDAC8D0];
  v4 = (NSArray *)objc_opt_new();
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v90, v101, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v91;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v91 != v7)
          objc_enumerationMutation(a3);
        v9 = -[TSDMagicMoveTextureZOrdererMatch initWithAnimationMatch:]([TSDMagicMoveTextureZOrdererMatch alloc], "initWithAnimationMatch:", *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * i));
        -[NSArray addObject:](v4, "addObject:", v9);

      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v90, v101, 16);
    }
    while (v6);
  }
  -[TSDMagicMoveTextureZOrderer p_adjustZOrdererMatchesZIndexByTextureType:](self, "p_adjustZOrdererMatchesZIndexByTextureType:", v4);
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v86, v100, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = 0;
    v14 = *(_QWORD *)v87;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v87 != v14)
          objc_enumerationMutation(v4);
        v16 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * j);
        if (v12 <= objc_msgSend(v16, "outgoingZIndex"))
          v12 = objc_msgSend(v16, "outgoingZIndex");
        if (v13 <= objc_msgSend(v16, "incomingZIndex"))
          v13 = objc_msgSend(v16, "incomingZIndex");
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v86, v100, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
    v13 = 0;
  }
  v55 = (void *)objc_opt_new();
  v54 = (void *)objc_opt_new();
  if ((v12 & 0x8000000000000000) == 0)
  {
    v17 = 0;
    do
    {
      v18 = (void *)objc_opt_new();
      v82 = 0u;
      v83 = 0u;
      v84 = 0u;
      v85 = 0u;
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v82, v99, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v83;
        do
        {
          for (k = 0; k != v20; ++k)
          {
            if (*(_QWORD *)v83 != v21)
              objc_enumerationMutation(v4);
            v23 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * k);
            if (objc_msgSend(v23, "outgoingZIndex", v54) == v17 && objc_msgSend(v23, "incomingZIndex") == -1)
              objc_msgSend(v18, "addObject:", v23);
          }
          v20 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v82, v99, 16);
        }
        while (v20);
      }
      if ((unint64_t)objc_msgSend(v18, "count", v54) >= 2)
        objc_msgSend(v55, "addObject:", v18);

      v24 = v17++ == v12;
    }
    while (!v24);
  }
  if ((v13 & 0x8000000000000000) == 0)
  {
    v25 = 0;
    do
    {
      v26 = (void *)objc_opt_new();
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      v81 = 0u;
      v27 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v78, v98, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v79;
        do
        {
          for (m = 0; m != v28; ++m)
          {
            if (*(_QWORD *)v79 != v29)
              objc_enumerationMutation(v4);
            v31 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * m);
            if (objc_msgSend(v31, "incomingZIndex", v54) == v25 && objc_msgSend(v31, "outgoingZIndex") == -1)
              objc_msgSend(v26, "addObject:", v31);
          }
          v28 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v78, v98, 16);
        }
        while (v28);
      }
      if ((unint64_t)objc_msgSend(v26, "count", v54) >= 2)
        objc_msgSend(v54, "addObject:", v26);

      v24 = v25++ == v13;
    }
    while (!v24);
  }
  v32 = 1;
  v59 = v4;
  do
  {
    v33 = v32;
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v58 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v74, v97, 16, v54);
    if (v58)
    {
      v57 = *(_QWORD *)v75;
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v75 != v57)
            objc_enumerationMutation(v4);
          v35 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v34);
          v60 = v34;
          if ((v33 & 1) != 0)
            v36 = objc_msgSend(v35, "outgoingZIndex");
          else
            v36 = objc_msgSend(v35, "incomingZIndex");
          if (v36 == -1)
          {
            v61 = v35;
            v37 = -[TSDMagicMoveTextureZOrderer p_bestZIndexForUnassignedMatch:inMatchArray:](self, "p_bestZIndexForUnassignedMatch:inMatchArray:", v35, v59);
            v70 = 0u;
            v71 = 0u;
            v72 = 0u;
            v73 = 0u;
            v38 = -[NSArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v70, v96, 16);
            if (v38)
            {
              v39 = v38;
              v40 = *(_QWORD *)v71;
              do
              {
                for (n = 0; n != v39; ++n)
                {
                  if (*(_QWORD *)v71 != v40)
                    objc_enumerationMutation(v59);
                  v42 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * n);
                  if ((v33 & 1) != 0)
                  {
                    if (objc_msgSend(v42, "outgoingZIndex") >= v37)
                      objc_msgSend(v42, "setOutgoingZIndex:", objc_msgSend(v42, "outgoingZIndex") + 1);
                  }
                  else if (objc_msgSend(v42, "incomingZIndex") >= v37)
                  {
                    objc_msgSend(v42, "setIncomingZIndex:", objc_msgSend(v42, "incomingZIndex") + 1);
                  }
                }
                v39 = -[NSArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v70, v96, 16);
              }
              while (v39);
            }
            if ((v33 & 1) != 0)
            {
              objc_msgSend(v35, "setOutgoingZIndex:", v37);
              v43 = v54;
            }
            else
            {
              objc_msgSend(v35, "setIncomingZIndex:", v37);
              v43 = v55;
            }
            v68 = 0u;
            v69 = 0u;
            v66 = 0u;
            v67 = 0u;
            v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v66, v95, 16);
            if (v44)
            {
              v45 = v44;
              v46 = *(_QWORD *)v67;
              do
              {
                for (ii = 0; ii != v45; ++ii)
                {
                  if (*(_QWORD *)v67 != v46)
                    objc_enumerationMutation(v43);
                  v48 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * ii);
                  if (objc_msgSend(v48, "containsObject:", v35))
                  {
                    v64 = 0u;
                    v65 = 0u;
                    v62 = 0u;
                    v63 = 0u;
                    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v62, v94, 16);
                    if (v49)
                    {
                      v50 = v49;
                      v51 = *(_QWORD *)v63;
                      do
                      {
                        for (jj = 0; jj != v50; ++jj)
                        {
                          if (*(_QWORD *)v63 != v51)
                            objc_enumerationMutation(v48);
                          v53 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * jj);
                          if ((v33 & 1) != 0)
                            objc_msgSend(v53, "setOutgoingZIndex:", v37);
                          else
                            objc_msgSend(v53, "setIncomingZIndex:", v37);
                        }
                        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v62, v94, 16);
                      }
                      while (v50);
                    }
                  }
                  v35 = v61;
                }
                v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v66, v95, 16);
              }
              while (v45);
            }
          }
          v4 = v59;
          v34 = v60 + 1;
        }
        while (v60 + 1 != v58);
        v58 = -[NSArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v74, v97, 16);
      }
      while (v58);
    }
    v32 = 0;
  }
  while ((v33 & 1) != 0);

  self->_zOrderMatches = v4;
  self->_outgoingTexturesInZOrder = (NSArray *)-[TSDMagicMoveTextureZOrderer p_newArrayBySortingMatches:withInterpolatedPercent:](self, "p_newArrayBySortingMatches:withInterpolatedPercent:", v4, 0.0);
  self->_incomingTexturesInZOrder = (NSArray *)-[TSDMagicMoveTextureZOrderer p_newArrayBySortingMatches:withInterpolatedPercent:](self, "p_newArrayBySortingMatches:withInterpolatedPercent:", v4, 1.0);
}

- (unint64_t)p_zIntersectionsBetweenZOrdererMatches:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  v4 = objc_msgSend(a3, "count");
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 0;
  v7 = 0;
  do
  {
    v8 = objc_msgSend(a3, "objectAtIndexedSubscript:", v6++);
    if (v6 < v5)
    {
      v9 = (void *)v8;
      v10 = v6;
      do
        v7 += objc_msgSend(v9, "intersectsZOrdererMatch:", objc_msgSend(a3, "objectAtIndexedSubscript:", v10++));
      while (v5 != v10);
    }
  }
  while (v6 != v5);
  return v7;
}

- (id)p_debugDescription
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  const __CFString *v37;
  int64_t v38;
  const __CFString *v40;
  void *v41;
  uint64_t v42;
  __CFString *v43;
  NSArray *obj;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v3 = -[NSArray objectAtIndexedSubscript:](self->_percentTextures, "objectAtIndexedSubscript:", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v64 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        v10 = -[__CFString length]((id)TSDStringFromTextureType(objc_msgSend(v9, "textureType")), "length");
        v11 = objc_msgSend(v9, "textureType");
        v12 = v10 + 5;
        if (v11 != 6)
          v12 = v10;
        if (v6 <= v12)
          v6 = v12;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }
  v13 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("Texture Z Orders:"));
  if (objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_percentTextures, "objectAtIndexedSubscript:", 0), "count") >= 1)
  {
    v14 = 0;
    v41 = v13;
    v42 = v6;
    do
    {
      objc_msgSend(v13, "appendString:", CFSTR("\n"));
      v15 = (__CFString *)TSDStringFromTextureType(objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_percentTextures, "objectAtIndexedSubscript:", 0), "objectAtIndexedSubscript:", v14), "textureType"));
      v16 = (void *)objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_percentTextures, "objectAtIndexedSubscript:", 0), "objectAtIndexedSubscript:", v14), "text");
      if (v16)
      {
        v17 = v16;
        if ((unint64_t)objc_msgSend(v16, "length") <= 3)
          v18 = objc_msgSend(v17, "length");
        else
          v18 = 3;
        v15 = (__CFString *)-[__CFString stringByAppendingFormat:](v15, "stringByAppendingFormat:", CFSTR("\"%@\"), objc_msgSend(v17, "substringWithRange:", 0, v18));
      }
      if (-[__CFString length](v15, "length") < v6)
      {
        v19 = 0;
        do
        {
          objc_msgSend(v13, "appendString:", CFSTR(" "));
          ++v19;
        }
        while (v19 < v6 - -[__CFString length](v15, "length"));
      }
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      obj = self->_zOrderMatches;
      v46 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
      v43 = v15;
      v20 = 0;
      if (v46)
      {
        v45 = *(_QWORD *)v60;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v60 != v45)
              objc_enumerationMutation(obj);
            v22 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v21);
            v23 = (void *)objc_opt_new();
            if (objc_msgSend(v22, "outgoingTexture"))
              objc_msgSend(v23, "addObject:", objc_msgSend(v22, "outgoingTexture"));
            v47 = v21;
            if (objc_msgSend(v22, "incomingTexture"))
              objc_msgSend(v23, "addObject:", objc_msgSend(v22, "incomingTexture"));
            v57 = 0u;
            v58 = 0u;
            v55 = 0u;
            v56 = 0u;
            v48 = v23;
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
            if (v24)
            {
              v25 = v24;
              v49 = v22;
              v50 = *(_QWORD *)v56;
LABEL_35:
              v26 = 0;
              while (1)
              {
                if (*(_QWORD *)v56 != v50)
                  objc_enumerationMutation(v48);
                v27 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v26);
                v51 = 0u;
                v52 = 0u;
                v53 = 0u;
                v54 = 0u;
                v28 = (void *)objc_msgSend(v27, "visibleTextures");
                v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
                if (v29)
                {
                  v30 = v29;
                  v31 = *(_QWORD *)v52;
                  while (2)
                  {
                    for (j = 0; j != v30; ++j)
                    {
                      if (*(_QWORD *)v52 != v31)
                        objc_enumerationMutation(v28);
                      v33 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j);
                      if (v33 == objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_percentTextures, "objectAtIndexedSubscript:", 0), "objectAtIndexedSubscript:", v14))
                      {
                        v20 = v49;
                        goto LABEL_48;
                      }
                    }
                    v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
                    if (v30)
                      continue;
                    break;
                  }
                }
LABEL_48:
                if (v20)
                  break;
                if (++v26 == v25)
                {
                  v25 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
                  v20 = 0;
                  if (v25)
                    goto LABEL_35;
                  break;
                }
              }
            }

            v21 = v47 + 1;
          }
          while (v47 + 1 != v46);
          v46 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
        }
        while (v46);
      }
      v34 = objc_msgSend(v20, "outgoingZIndex");
      if (objc_msgSend(v20, "isOutgoingZIndexUnmatched"))
        v35 = CFSTR("*");
      else
        v35 = CFSTR(" ");
      v36 = objc_msgSend(v20, "incomingZIndex");
      if (objc_msgSend(v20, "isIncomingZIndexUnmatched"))
        v37 = CFSTR("*");
      else
        v37 = CFSTR(" ");
      v40 = v35;
      v13 = v41;
      objc_msgSend(v41, "appendFormat:", CFSTR("%@ %2d(z:%2d%@->%2d%@):"), v43, v14, v34, v40, v36, v37);
      if ((int64_t)-[NSArray count](self->_percentTextures, "count") >= 1)
      {
        v38 = 0;
        do
          objc_msgSend(v41, "appendFormat:", CFSTR("  %2d"), objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_percentTextures, "objectAtIndexedSubscript:", 0), "indexOfObject:", objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_percentTextures, "objectAtIndexedSubscript:", v38++), "objectAtIndexedSubscript:", v14)));
        while (v38 < (int64_t)-[NSArray count](self->_percentTextures, "count"));
      }
      ++v14;
      v6 = v42;
    }
    while (v14 < objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_percentTextures, "objectAtIndexedSubscript:", 0), "count"));
  }
  return v13;
}

- (unint64_t)p_bestZIndexForUnassignedMatch:(id)a3 inMatchArray:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int64_t v18;
  int64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t j;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a3, "outgoingZIndex") != -1 && objc_msgSend(a3, "incomingZIndex") != -1)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMagicMoveTextureZOrderer p_bestZIndexForUnassignedMatch:inMatchArray:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 1507, CFSTR("This match is already assigned!"));
  }
  v8 = objc_msgSend(a3, "outgoingZIndex");
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v9 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (!v9)
  {
    v11 = 0;
    goto LABEL_19;
  }
  v10 = v9;
  v11 = 0;
  v12 = *(_QWORD *)v33;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v33 != v12)
        objc_enumerationMutation(a4);
      v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
      if (v8 == -1)
      {
        if (v11 > objc_msgSend(v14, "outgoingZIndex"))
          continue;
        v15 = objc_msgSend(v14, "outgoingZIndex");
      }
      else
      {
        if (v11 > objc_msgSend(v14, "incomingZIndex"))
          continue;
        v15 = objc_msgSend(v14, "incomingZIndex");
      }
      v11 = v15;
    }
    v10 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  }
  while (v10);
LABEL_19:
  v16 = objc_msgSend(a4, "count");
  v17 = objc_msgSend((id)objc_msgSend(a3, "outgoingTexture"), "firstVisibleTextureForTextureType:", 1);
  v18 = v17 == 0;
  v19 = v11 + 1;
  if ((__int128)__PAIR128__(v19, v17) >= 1)
  {
    v20 = -1;
    do
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v21 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      if (v21)
      {
        v22 = v21;
        v23 = 0;
        v24 = *(_QWORD *)v29;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v29 != v24)
              objc_enumerationMutation(a4);
            v23 += objc_msgSend(a3, "intersectsZOrdererMatch:withAttemptedZIndex:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j), v19);
          }
          v22 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        }
        while (v22);
      }
      else
      {
        v23 = 0;
      }
      if (v23 < v20)
      {
        v20 = v23;
        v16 = v19;
      }
    }
    while (v19-- > v18);
  }
  return v16;
}

- (void)p_calculateTextureArraysFromIntersections
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  double v13;
  void *v14;
  unint64_t v15;
  NSArray *v16;
  void *v17;
  unint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  size_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v4 = -[NSArray count](self->_zOrderMatches, "count");
  v5 = v4 - 2;
  if (v4 >= 2)
  {
    v6 = v4;
    v7 = 0;
    do
    {
      v8 = v7;
      v9 = -[NSArray objectAtIndexedSubscript:](self->_zOrderMatches, "objectAtIndexedSubscript:", v7++);
      if (v7 < v6)
      {
        v10 = v9;
        v11 = v7;
        do
        {
          v12 = -[NSArray objectAtIndexedSubscript:](self->_zOrderMatches, "objectAtIndexedSubscript:", v11);
          if (objc_msgSend(v10, "intersectsZOrdererMatch:", v12))
          {
            objc_msgSend(v10, "intersectionPercentWithZOrdererMatch:", v12);
            objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", floor(v13 * 1000.0) / 1000.0));
          }
          ++v11;
        }
        while (v6 != v11);
      }
    }
    while (v8 != v5);
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", objc_msgSend(v3, "allObjects"));
  objc_msgSend(v14, "sortUsingSelector:", sel_compare_);
  if (!objc_msgSend(v14, "count") || objc_msgSend((id)objc_msgSend(v14, "firstObject"), "intValue"))
    objc_msgSend(v14, "insertObject:atIndex:", &unk_24D8FACB0, 0);
  if (objc_msgSend((id)objc_msgSend(v14, "lastObject"), "intValue") != 1)
    objc_msgSend(v14, "addObject:", &unk_24D8FACC8);
  v15 = objc_msgSend(v14, "count");
  v16 = (NSArray *)objc_opt_new();
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", self->_zOrderMatches);
  v17 = (void *)objc_opt_new();
  if (v15)
  {
    v18 = 0;
    v19 = 0.0;
    do
    {
      v20 = 1.0;
      if (v18 < objc_msgSend(v14, "count"))
      {
        objc_msgSend((id)objc_msgSend(v14, "objectAtIndexedSubscript:", v18), "doubleValue");
        v20 = v21;
      }
      if (v20 == 1.0)
        v22 = 1.0;
      else
        v22 = (v19 + v20) * 0.5;
      objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v19));
      v23 = -[TSDMagicMoveTextureZOrderer p_newArrayBySortingMatches:withInterpolatedPercent:](self, "p_newArrayBySortingMatches:withInterpolatedPercent:", self->_zOrderMatches, v22);
      -[NSArray addObject:](v16, "addObject:", v23);

      ++v18;
      v19 = v20;
    }
    while (v15 != v18);
  }
  if (objc_msgSend(v17, "count") != v15)
  {
    v24 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v25 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMagicMoveTextureZOrderer p_calculateTextureArraysFromIntersections]");
    objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 1593, CFSTR("percentTexturesTimes.count(%d) != percentTextureCount(%d)!"), objc_msgSend(v17, "count"), v15);
  }
  if (-[NSArray count](v16, "count") != v15)
  {
    v26 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v27 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMagicMoveTextureZOrderer p_calculateTextureArraysFromIntersections]");
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 1594, CFSTR("percentTextures.count(%d) != percentTextureCount(%d)!"), -[NSArray count](v16, "count"), v15);
  }
  free(self->_percentTexturesTimes);
  if (v15 <= 1)
    v28 = 1;
  else
    v28 = v15;
  self->_percentTexturesTimes = (double *)malloc_type_calloc(8uLL, v28, 0x1E7A0198uLL);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v29 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v29)
  {
    v30 = v29;
    v31 = 0;
    v32 = *(_QWORD *)v38;
    do
    {
      v33 = 0;
      v34 = v31;
      do
      {
        if (*(_QWORD *)v38 != v32)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v33), "doubleValue");
        v31 = v34 + 1;
        self->_percentTexturesTimes[v34] = v35;
        ++v33;
        ++v34;
      }
      while (v30 != v33);
      v30 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v30);
  }
  self->_percentTextures = v16;
  self->_zOrderIntersectionsCount = objc_msgSend(v14, "count");

}

- (void)p_addFlattenableAnimationMatches:(id)a3 toArray:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  uint64_t v40;
  int v41;
  id v42;
  TSDMagicMoveTextureZOrderer *v43;
  _QWORD v44[5];
  _QWORD v45[5];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;
  CGRect v67;
  CGRect v68;

  v66 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)objc_msgSend(a3, "count") >= 2)
  {
    v43 = self;
    v7 = (void *)objc_opt_new();
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v59 != v10)
            objc_enumerationMutation(a3);
          v12 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          v54 = 0u;
          v55 = 0u;
          v56 = 0u;
          v57 = 0u;
          v13 = (void *)objc_msgSend((id)objc_msgSend(v12, "outgoingTexture"), "visibleTextures");
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v55;
            do
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v55 != v16)
                  objc_enumerationMutation(v13);
                objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * j));
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
            }
            while (v15);
          }
        }
        v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
      }
      while (v9);
    }
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v18 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v51;
      v42 = a4;
      while (2)
      {
        for (k = 0; k != v19; ++k)
        {
          if (*(_QWORD *)v51 != v20)
            objc_enumerationMutation(v7);
          v22 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * k);
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          v23 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v46, v62, 16, v42);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v47;
LABEL_23:
            v26 = 0;
            while (1)
            {
              if (*(_QWORD *)v47 != v25)
                objc_enumerationMutation(v7);
              v27 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v26);
              if (v22 != v27)
              {
                objc_msgSend(v22, "frameOnCanvas");
                v29 = v28;
                v31 = v30;
                v33 = v32;
                v35 = v34;
                objc_msgSend(v27, "frameOnCanvas");
                v68.origin.x = v36;
                v68.origin.y = v37;
                v68.size.width = v38;
                v68.size.height = v39;
                v67.origin.x = v29;
                v67.origin.y = v31;
                v67.size.width = v33;
                v67.size.height = v35;
                if (CGRectIntersectsRect(v67, v68))
                  break;
              }
              if (v24 == ++v26)
              {
                v24 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
                if (v24)
                  goto LABEL_23;
                goto LABEL_30;
              }
            }
            v40 = MEMORY[0x24BDAC760];
            v45[0] = MEMORY[0x24BDAC760];
            v45[1] = 3221225472;
            v45[2] = __72__TSDMagicMoveTextureZOrderer_p_addFlattenableAnimationMatches_toArray___block_invoke;
            v45[3] = &unk_24D82C838;
            v45[4] = v43;
            objc_msgSend(v7, "sortUsingComparator:", v45);
            v44[0] = v40;
            v44[1] = 3221225472;
            v44[2] = __72__TSDMagicMoveTextureZOrderer_p_addFlattenableAnimationMatches_toArray___block_invoke_2;
            v44[3] = &unk_24D82C860;
            v44[4] = v7;
            if ((__72__TSDMagicMoveTextureZOrderer_p_addFlattenableAnimationMatches_toArray___block_invoke_2((uint64_t)v44, v43->_outgoingTexturesInZOrder) & 1) == 0)goto LABEL_36;
            v41 = __72__TSDMagicMoveTextureZOrderer_p_addFlattenableAnimationMatches_toArray___block_invoke_2((uint64_t)v44, v43->_incomingTexturesInZOrder);

            if (v41)
              objc_msgSend(v42, "addObject:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", objc_msgSend(a3, "array")));
            return;
          }
LABEL_30:
          ;
        }
        v19 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
        if (v19)
          continue;
        break;
      }
    }
LABEL_36:

  }
}

uint64_t __72__TSDMagicMoveTextureZOrderer_p_addFlattenableAnimationMatches_toArray___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "indexOfObject:", a2);
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "indexOfObject:", a3);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMagicMoveTextureZOrderer p_addFlattenableAnimationMatches:toArray:]_block_invoke");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 1654, CFSTR("expected inequality between %s and %s"), "obj1Index", "NSNotFound");
  }
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMagicMoveTextureZOrderer p_addFlattenableAnimationMatches:toArray:]_block_invoke");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 1655, CFSTR("expected inequality between %s and %s"), "obj2Index", "NSNotFound");
  }
  if (v5 < v6)
    return -1;
  else
    return v5 > v6;
}

uint64_t __72__TSDMagicMoveTextureZOrderer_p_addFlattenableAnimationMatches_toArray___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(a2, "indexOfObject:", objc_msgSend(*(id *)(a1 + 32), "firstObject"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = *(void **)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        v11 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v10);
        if (v11 != objc_msgSend(a2, "indexOfObject:", v10) - v4)
          return 0;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  return 1;
}

- (NSArray)flattenableAnimationMatches
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  NSArray *zOrderMatches;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  id v27;
  NSArray *obj;
  uint64_t v30;
  NSArray *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v32 = (id)objc_opt_new();
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = self->_outgoingTexturesInZOrder;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (v4)
  {
    v5 = v4;
    v30 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v46 != v30)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        zOrderMatches = self->_zOrderMatches;
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](zOrderMatches, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v42;
LABEL_8:
          v12 = 0;
          while (1)
          {
            if (*(_QWORD *)v42 != v11)
              objc_enumerationMutation(zOrderMatches);
            v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v12);
            if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "outgoingTexture"), "visibleTextures"), "containsObject:", v7) & 1) != 0|| (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "incomingTexture"), "visibleTextures"), "containsObject:", v7) & 1) != 0)
            {
              break;
            }
            if (v10 == ++v12)
            {
              v10 = -[NSArray countByEnumeratingWithState:objects:count:](zOrderMatches, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
              if (v10)
                goto LABEL_8;
              goto LABEL_17;
            }
          }
          if (v13)
            goto LABEL_18;
        }
LABEL_17:
        v14 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMagicMoveTextureZOrderer flattenableAnimationMatches]");
        objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 1702, CFSTR("invalid nil value for '%s'"), "zOrdererMatch");
        v13 = 0;
LABEL_18:
        if ((objc_msgSend((id)objc_msgSend(v13, "animationMatch"), "isMatched") & 1) != 0)
        {
          -[TSDMagicMoveTextureZOrderer p_addFlattenableAnimationMatches:toArray:](self, "p_addFlattenableAnimationMatches:toArray:", v3, v32);
          objc_msgSend(v3, "removeAllObjects");
        }
        else
        {
          if (objc_msgSend(v3, "count")
            && (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "firstObject"), "animationMatch"), "outgoingTexture")
             || objc_msgSend((id)objc_msgSend(v13, "animationMatch"), "outgoingTexture"))
            && (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "firstObject"), "animationMatch"), "incomingTexture")
             || objc_msgSend((id)objc_msgSend(v13, "animationMatch"), "incomingTexture")))
          {
            -[TSDMagicMoveTextureZOrderer p_addFlattenableAnimationMatches:toArray:](self, "p_addFlattenableAnimationMatches:toArray:", v3, v32);
            objc_msgSend(v3, "removeAllObjects");
          }
          objc_msgSend(v3, "addObject:", v13);
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    }
    while (v5);
  }
  -[TSDMagicMoveTextureZOrderer p_addFlattenableAnimationMatches:toArray:](self, "p_addFlattenableAnimationMatches:toArray:", v3, v32);
  v31 = (NSArray *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v16 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v38 != v18)
          objc_enumerationMutation(v32);
        v20 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
        v21 = objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        -[TSDMagicMoveTextureZOrderer p_addVisibleTexturesFromMatches:toArray:interpolatedPercent:](self, "p_addVisibleTexturesFromMatches:toArray:interpolatedPercent:", v20, v21, 0.0);
        v22 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v20, "count"));
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v34;
          do
          {
            for (k = 0; k != v24; ++k)
            {
              if (*(_QWORD *)v34 != v25)
                objc_enumerationMutation(v20);
              objc_msgSend(v22, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * k), "animationMatch"));
            }
            v24 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
          }
          while (v24);
        }
        v27 = (id)objc_opt_new();
        objc_msgSend(v27, "setAnimationMatches:", v22);
        objc_msgSend(v27, "setTexturesInZOrder:", v21);
        -[NSArray addObject:](v31, "addObject:", v27);
      }
      v17 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    }
    while (v17);
  }

  return v31;
}

- (unint64_t)zOrderIntersectionsCount
{
  return self->_zOrderIntersectionsCount;
}

@end
