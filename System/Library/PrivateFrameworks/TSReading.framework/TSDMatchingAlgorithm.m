@implementation TSDMatchingAlgorithm

- (void)p_allocateMatrices
{
  int64_t mMatrixDimension;
  void *v4;
  uint64_t v5;
  int64_t v6;
  int64_t i;
  int64_t v8;
  int64_t *mCostMatrix;

  mMatrixDimension = self->mMatrixDimension;
  if (mMatrixDimension <= 0)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMatchingAlgorithm p_allocateMatrices]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMatchingAlgorithm.m"), 51, CFSTR("matrix dimension is 0!"));
    mMatrixDimension = self->mMatrixDimension;
  }
  self->mCostMatrix = (int64_t *)malloc_type_calloc(8uLL, mMatrixDimension * mMatrixDimension, 0x93C77A53uLL);
  self->mMaskMatrix = (char *)malloc_type_calloc(1uLL, self->mMatrixDimension * self->mMatrixDimension, 0x8817C830uLL);
  self->mObjectMapping = (id *)malloc_type_calloc(8uLL, self->mMatrixDimension * self->mMatrixDimension, 0xF290735FuLL);
  v6 = self->mMatrixDimension;
  if (v6 >= 1)
  {
    for (i = 0; i < v6; ++i)
    {
      if (v6 >= 1)
      {
        v8 = 0;
        mCostMatrix = self->mCostMatrix;
        do
        {
          mCostMatrix[v8 + i * v6] = 0x3FFFFFFFFFFFFFFFLL;
          ++v8;
          v6 = self->mMatrixDimension;
        }
        while (v6 > v8);
      }
    }
  }
  self->mIsStarInColumn = (BOOL *)malloc_type_calloc(1uLL, v6, 0x8422D288uLL);
  self->mIsStarInRow = (BOOL *)malloc_type_calloc(1uLL, self->mMatrixDimension, 0xA48DAD1CuLL);
  self->mIsColCovered = (BOOL *)malloc_type_calloc(1uLL, self->mMatrixDimension, 0x5C07D3B4uLL);
  self->mIsRowCovered = (BOOL *)malloc_type_calloc(1uLL, self->mMatrixDimension, 0xD02211F3uLL);
}

- (void)p_deallocateMatrices
{
  free(self->mCostMatrix);
  free(self->mMaskMatrix);
  free(self->mObjectMapping);
  free(self->mIsStarInColumn);
  free(self->mIsStarInRow);
  free(self->mIsColCovered);
  free(self->mIsRowCovered);
}

- (int)p_doStep1
{
  int64_t mMatrixDimension;
  uint64_t v3;
  int64_t i;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  int64_t v8;
  int64_t *mCostMatrix;

  mMatrixDimension = self->mMatrixDimension;
  if (mMatrixDimension >= 1)
  {
    v3 = 0;
    for (i = 0; i < mMatrixDimension; ++i)
    {
      if (mMatrixDimension >= 1)
      {
        v5 = 0;
        v7 = 0x7FFFFFFFFFFFFFFFLL;
        do
        {
          v6 = (char *)self->mCostMatrix + mMatrixDimension * v3;
          if (v7 >= *(_QWORD *)&v6[8 * v5])
            v7 = *(_QWORD *)&v6[8 * v5];
          ++v5;
        }
        while (mMatrixDimension != v5);
        if (v7 >= 1)
        {
          v8 = 0;
          mCostMatrix = self->mCostMatrix;
          do
          {
            mCostMatrix[v8 + i * mMatrixDimension] -= v7;
            ++v8;
            mMatrixDimension = self->mMatrixDimension;
          }
          while (mMatrixDimension > v8);
        }
      }
      v3 += 8;
    }
  }
  return 2;
}

- (int)p_doStep2
{
  int64_t mMatrixDimension;
  uint64_t v3;
  int64_t v4;
  BOOL *mIsStarInRow;
  uint64_t v7;
  BOOL *mIsStarInColumn;

  mMatrixDimension = self->mMatrixDimension;
  if (mMatrixDimension >= 1)
  {
    v3 = 0;
    v4 = 0;
    mIsStarInRow = self->mIsStarInRow;
    do
    {
      if (!mIsStarInRow[v4] && mMatrixDimension >= 1)
      {
        v7 = 0;
        while (self->mIsStarInColumn[v7] || *(int64_t *)((char *)&self->mCostMatrix[v7] + mMatrixDimension * v3))
        {
          if (mMatrixDimension == ++v7)
            goto LABEL_13;
        }
        self->mMaskMatrix[mMatrixDimension * v4 + v7] = 1;
        mIsStarInColumn = self->mIsStarInColumn;
        mIsStarInRow = self->mIsStarInRow;
        mIsStarInRow[v4] = 1;
        mIsStarInColumn[v7] = 1;
        mMatrixDimension = self->mMatrixDimension;
      }
LABEL_13:
      ++v4;
      v3 += 8;
    }
    while (mMatrixDimension > v4);
  }
  return 3;
}

- (int)p_doStep3
{
  int64_t mMatrixDimension;
  uint64_t v3;
  int v4;
  BOOL *mIsStarInColumn;

  mMatrixDimension = self->mMatrixDimension;
  if (mMatrixDimension < 1)
  {
    v4 = 0;
  }
  else
  {
    v3 = 0;
    v4 = 0;
    mIsStarInColumn = self->mIsStarInColumn;
    do
    {
      if (mIsStarInColumn[v3])
      {
        self->mIsColCovered[v3] = 1;
        ++v4;
      }
      ++v3;
    }
    while (mMatrixDimension != v3);
  }
  if (mMatrixDimension == v4)
    return 7;
  else
    return 4;
}

- (BOOL)p_step4FindAZeroAndReturnRow:(int *)a3 column:(int *)a4
{
  int64_t mMatrixDimension;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  mMatrixDimension = self->mMatrixDimension;
  if (mMatrixDimension < 1)
  {
    return 0;
  }
  else
  {
    v5 = 0;
    v6 = 0;
    v7 = 1;
    while (self->mIsRowCovered[v6])
    {
LABEL_8:
      v7 = mMatrixDimension > ++v6;
      v5 += mMatrixDimension;
      if (v6 == mMatrixDimension)
        return v7;
    }
    v8 = 0;
    while (self->mIsColCovered[v8] || self->mCostMatrix[v5 + v8])
    {
      if (mMatrixDimension == ++v8)
        goto LABEL_8;
    }
    *a3 = v6;
    *a4 = v8;
  }
  return v7;
}

- (int)p_step4IndexOfStarredZeroInRow:(int)a3
{
  int64_t mMatrixDimension;
  uint64_t v5;
  char *v6;

  mMatrixDimension = self->mMatrixDimension;
  if (mMatrixDimension < 1)
  {
LABEL_5:
    LODWORD(v5) = -1;
  }
  else
  {
    v5 = 0;
    v6 = &self->mMaskMatrix[mMatrixDimension * a3];
    while (v6[v5] != 1)
    {
      if (mMatrixDimension == ++v5)
        goto LABEL_5;
    }
  }
  return v5;
}

- (int)p_doStep4
{
  int v3;
  BOOL *mIsColCovered;
  int64_t v6;
  uint64_t v7;

  v7 = 0;
  if (!-[TSDMatchingAlgorithm p_step4FindAZeroAndReturnRow:column:](self, "p_step4FindAZeroAndReturnRow:column:", (char *)&v7 + 4, &v7))return 6;
  while (1)
  {
    self->mMaskMatrix[(int)v7 + self->mMatrixDimension * SHIDWORD(v7)] = 2;
    v3 = -[TSDMatchingAlgorithm p_step4IndexOfStarredZeroInRow:](self, "p_step4IndexOfStarredZeroInRow:", HIDWORD(v7));
    if (v3 == -1)
      break;
    mIsColCovered = self->mIsColCovered;
    self->mIsRowCovered[SHIDWORD(v7)] = 1;
    mIsColCovered[v3] = 0;
    if (!-[TSDMatchingAlgorithm p_step4FindAZeroAndReturnRow:column:](self, "p_step4FindAZeroAndReturnRow:column:", (char *)&v7 + 4, &v7))return 6;
  }
  v6 = (int)v7;
  self->mZ0Row = SHIDWORD(v7);
  self->mZ0Col = v6;
  return 5;
}

- (int)p_doStep5
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t mMatrixDimension;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  int v27;
  int v28;
  char *mMaskMatrix;
  int64_t v30;
  BOOL v31;
  BOOL *mIsStarInColumn;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL *mIsStarInRow;
  uint64_t v37;
  uint64_t v38;
  BOOL *v39;
  uint64_t v40;
  char *v41;
  int64_t j;
  int64_t k;
  char *v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = (void *)MEMORY[0x24BEB3CD0];
  v5 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->mZ0Row);
  objc_msgSend(v3, "addObject:", objc_msgSend(v4, "pairWithFirst:second:", v5, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->mZ0Col)));
  v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "lastObject"), "second"), "intValue");
  if (self->mIsStarInColumn[(int)v6])
  {
    v7 = (int)v6;
    v8 = v6;
    do
    {
      mMatrixDimension = self->mMatrixDimension;
      if (mMatrixDimension < 1)
      {
LABEL_7:
        v10 = 0xFFFFFFFFLL;
      }
      else
      {
        v10 = 0;
        v11 = &self->mMaskMatrix[v7];
        while (*v11 != 1)
        {
          v11 += mMatrixDimension;
          if (mMatrixDimension == ++v10)
            goto LABEL_7;
        }
      }
      v12 = (void *)MEMORY[0x24BEB3CD0];
      v13 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v10);
      objc_msgSend(v3, "addObject:", objc_msgSend(v12, "pairWithFirst:second:", v13, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8)));
      v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "lastObject"), "first"), "intValue");
      v15 = v14;
      v16 = self->mMatrixDimension;
      if (v16 < 1)
      {
LABEL_12:
        v18 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMatchingAlgorithm p_doStep5]");
        objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMatchingAlgorithm.m"), 271, CFSTR("did not find prime in row!"));
        v17 = 0xFFFFFFFFLL;
      }
      else
      {
        v17 = 0;
        while (self->mMaskMatrix[v16 * (int)v14 + v17] != 2)
        {
          if (v16 == ++v17)
            goto LABEL_12;
        }
      }
      v20 = (void *)MEMORY[0x24BEB3CD0];
      v21 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v15);
      objc_msgSend(v3, "addObject:", objc_msgSend(v20, "pairWithFirst:second:", v21, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v17)));
      v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "lastObject"), "second"), "intValue");
      v7 = (int)v8;
    }
    while (self->mIsStarInColumn[(int)v8]);
  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v22 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v47 != v24)
          objc_enumerationMutation(v3);
        v26 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        v27 = objc_msgSend((id)objc_msgSend(v26, "first"), "intValue");
        v28 = objc_msgSend((id)objc_msgSend(v26, "second"), "intValue");
        mMaskMatrix = self->mMaskMatrix;
        v30 = self->mMatrixDimension * v27 + v28;
        v31 = mMaskMatrix[v30] != 1;
        mMaskMatrix[v30] = v31;
        mIsStarInColumn = self->mIsStarInColumn;
        self->mIsStarInRow[v27] = v31;
        mIsStarInColumn[v28] = v31;
      }
      v23 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v23);
  }
  v33 = self->mMatrixDimension;
  if (v33 >= 1)
  {
    v34 = 0;
    v35 = 0;
    mIsStarInRow = self->mIsStarInRow;
    do
    {
      if (!mIsStarInRow[v35])
      {
        v37 = 0;
        while (self->mMaskMatrix[v34 + v37] != 1)
        {
          if (v33 == ++v37)
            goto LABEL_29;
        }
        mIsStarInRow[v35] = 1;
        self->mIsStarInColumn[v37] = 1;
      }
LABEL_29:
      ++v35;
      v34 += v33;
    }
    while (v35 != v33);
    v38 = 0;
    v39 = self->mIsStarInColumn;
    do
    {
      if (!v39[v38])
      {
        v40 = 0;
        v41 = self->mMaskMatrix;
        while (v41[v38] != 1)
        {
          v41 += v33;
          if (v33 == ++v40)
            goto LABEL_37;
        }
        self->mIsStarInRow[v40] = 1;
        v39[v38] = 1;
      }
LABEL_37:
      ++v38;
    }
    while (v38 != v33);
    bzero(self->mIsRowCovered, v33);
    bzero(self->mIsColCovered, v33);
    for (j = 0; j < v33; ++j)
    {
      if (v33 >= 1)
      {
        for (k = 0; k < v33; ++k)
        {
          v44 = &self->mMaskMatrix[j * v33];
          if (v44[k] == 2)
          {
            v44[k] = 0;
            v33 = self->mMatrixDimension;
          }
        }
      }
    }
  }

  return 3;
}

- (int)p_doStep6
{
  int64_t mMatrixDimension;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  BOOL *mIsColCovered;
  int64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  int64_t v11;
  BOOL *v12;
  _BOOL4 v13;
  int64_t *mCostMatrix;
  int64_t v15;
  int64_t v16;

  mMatrixDimension = self->mMatrixDimension;
  if (mMatrixDimension >= 1)
  {
    v3 = 0;
    v4 = 0;
    v5 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      if (!self->mIsRowCovered[v4])
      {
        mIsColCovered = self->mIsColCovered;
        v7 = self->mMatrixDimension;
        v8 = v3;
        do
        {
          v9 = *mIsColCovered++;
          if (!v9 && v5 >= *(int64_t *)((char *)self->mCostMatrix + v8))
            v5 = *(int64_t *)((char *)self->mCostMatrix + v8);
          v8 += 8;
          --v7;
        }
        while (v7);
      }
      ++v4;
      v3 += 8 * mMatrixDimension;
    }
    while (v4 != mMatrixDimension);
    v10 = 0;
    while (mMatrixDimension < 1)
    {
LABEL_20:
      if (mMatrixDimension <= ++v10)
        return 4;
    }
    v11 = 0;
    v12 = self->mIsColCovered;
    v13 = self->mIsRowCovered[v10];
    while (1)
    {
      if (v13)
      {
        if (v12[v11])
        {
          mCostMatrix = self->mCostMatrix;
          v15 = v11 + v10 * mMatrixDimension;
          v16 = mCostMatrix[v15] + v5;
LABEL_18:
          mCostMatrix[v15] = v16;
        }
      }
      else if (!v12[v11])
      {
        mCostMatrix = self->mCostMatrix;
        v15 = v11 + v10 * mMatrixDimension;
        v16 = mCostMatrix[v15] - v5;
        goto LABEL_18;
      }
      ++v11;
      mMatrixDimension = self->mMatrixDimension;
      if (mMatrixDimension <= v11)
        goto LABEL_20;
    }
  }
  return 4;
}

- (id)p_bestMatchesFromArray:(id)a3
{
  id v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  int64_t v19;
  int64_t mMatrixDimension;
  uint64_t j;
  uint64_t k;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id *mObjectMapping;
  int v35;
  int64_t v36;
  int64_t n;
  int64_t ii;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t jj;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
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
  _QWORD v72[5];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v3 = a3;
  v81 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)objc_msgSend(a3, "count") >= 2)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v59 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
    v58 = v5;
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = 0;
      v56 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v74 != v56)
            objc_enumerationMutation(v3);
          v11 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
          if (!objc_msgSend(v11, "outgoingMatchObject") || !objc_msgSend(v11, "incomingMatchObject"))
          {
            v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
            v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMatchingAlgorithm p_bestMatchesFromArray:]");
            v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMatchingAlgorithm.m");
            v15 = v13;
            v5 = v58;
            objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v15, v14, 440, CFSTR("Match does not have both incoming and outgoing objects!"));
          }
          if (!objc_msgSend(v5, "objectForKeyedSubscript:", objc_msgSend(v11, "outgoingMatchObject")))
            objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9++), objc_msgSend(v11, "outgoingMatchObject"));
          if (!objc_msgSend(v59, "objectForKeyedSubscript:", objc_msgSend(v11, "incomingMatchObject")))
            objc_msgSend(v59, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8++), objc_msgSend(v11, "incomingMatchObject"));
        }
        v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
      }
      while (v7);
    }
    v16 = objc_msgSend(v5, "count");
    if (v16 < 0)
    {
      v50 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v51 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMatchingAlgorithm p_bestMatchesFromArray:]");
      objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", v51, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMatchingAlgorithm.m"), 453, CFSTR("Out-of-bounds type assignment was clamped to max"));
      v16 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v17 = v59;
    v18 = objc_msgSend(v59, "count");
    if (v18 < 0)
    {
      v52 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v53 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMatchingAlgorithm p_bestMatchesFromArray:]");
      v54 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMatchingAlgorithm.m");
      v55 = v53;
      v17 = v59;
      objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v55, v54, 454, CFSTR("Out-of-bounds type assignment was clamped to max"));
      v18 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v72[0] = MEMORY[0x24BDAC760];
    v72[1] = 3221225472;
    v72[2] = __47__TSDMatchingAlgorithm_p_bestMatchesFromArray___block_invoke;
    v72[3] = &unk_24D82C838;
    v72[4] = v3;
    if (v16 == 1 || v18 == 1)
    {
      return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", objc_msgSend((id)objc_msgSend(v3, "sortedArrayUsingComparator:", v72), "firstObject"));
    }
    else
    {
      if (v16 <= v18)
        v19 = v18;
      else
        v19 = v16;
      self->mMatrixDimension = v19;
      -[TSDMatchingAlgorithm p_allocateMatrices](self, "p_allocateMatrices");
      mMatrixDimension = self->mMatrixDimension;
      if (mMatrixDimension >= 1)
      {
        for (j = 0; j < mMatrixDimension; ++j)
        {
          if (mMatrixDimension >= 1)
          {
            for (k = 0; k < mMatrixDimension; ++k)
            {
              if (j >= v16 || k >= v18)
              {
                self->mCostMatrix[k + j * mMatrixDimension] = 0;
                mMatrixDimension = self->mMatrixDimension;
              }
            }
          }
        }
      }
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v23 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
      if (v23)
      {
        v24 = v23;
        v57 = *(_QWORD *)v69;
        do
        {
          for (m = 0; m != v24; ++m)
          {
            if (*(_QWORD *)v69 != v57)
              objc_enumerationMutation(v3);
            v26 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * m);
            v27 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", objc_msgSend(v26, "outgoingMatchObject")), "integerValue");
            v28 = objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", objc_msgSend(v26, "incomingMatchObject")), "integerValue");
            if (*((_QWORD *)&self->mObjectMapping[v28] + self->mMatrixDimension * v27))
            {
              v29 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
              v30 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMatchingAlgorithm p_bestMatchesFromArray:]");
              v31 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMatchingAlgorithm.m");
              v32 = (void *)v29;
              v17 = v59;
              objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v30, v31, 502, CFSTR("Duplicate match between objects! (%@ is a duplicate of %@)"), v26, *((_QWORD *)&self->mObjectMapping[v28] + self->mMatrixDimension * v27));
            }
            v33 = objc_msgSend(v26, "matchCost");
            mObjectMapping = self->mObjectMapping;
            self->mCostMatrix[v28 + self->mMatrixDimension * v27] = v33;
            *(&mObjectMapping[v28] + self->mMatrixDimension * v27) = v26;
            v5 = v58;
          }
          v24 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
        }
        while (v24);
      }
      v35 = 1;
      while (2)
      {
        switch(v35)
        {
          case 1:
            v35 = -[TSDMatchingAlgorithm p_doStep1](self, "p_doStep1");
            goto LABEL_51;
          case 2:
            v35 = -[TSDMatchingAlgorithm p_doStep2](self, "p_doStep2");
            goto LABEL_51;
          case 3:
            v35 = -[TSDMatchingAlgorithm p_doStep3](self, "p_doStep3");
            goto LABEL_51;
          case 4:
            v35 = -[TSDMatchingAlgorithm p_doStep4](self, "p_doStep4");
            goto LABEL_51;
          case 5:
            v35 = -[TSDMatchingAlgorithm p_doStep5](self, "p_doStep5");
            goto LABEL_51;
          case 6:
            v35 = -[TSDMatchingAlgorithm p_doStep6](self, "p_doStep6");
LABEL_51:
            if (v35 <= 0)
              goto LABEL_52;
            continue;
          default:
LABEL_52:
            v3 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v36 = self->mMatrixDimension;
            if (v36 >= 1)
            {
              for (n = 0; n < v36; ++n)
              {
                if (v36 >= 1)
                {
                  for (ii = 0; ii < v36; ++ii)
                  {
                    if (self->mMaskMatrix[n * v36 + ii] == 1 && *((_QWORD *)&self->mObjectMapping[ii] + n * v36))
                    {
                      objc_msgSend(v3, "addObject:");
                      v36 = self->mMatrixDimension;
                    }
                  }
                }
              }
            }
            -[TSDMatchingAlgorithm p_deallocateMatrices](self, "p_deallocateMatrices");
            v39 = (void *)objc_msgSend(v3, "sortedArrayUsingComparator:", v72);
            objc_msgSend(v3, "removeAllObjects");
            v66 = 0u;
            v67 = 0u;
            v64 = 0u;
            v65 = 0u;
            v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
            if (!v40)
              return v3;
            v41 = v40;
            v42 = *(_QWORD *)v65;
            break;
        }
        break;
      }
      do
      {
        for (jj = 0; jj != v41; ++jj)
        {
          if (*(_QWORD *)v65 != v42)
            objc_enumerationMutation(v39);
          v44 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * jj);
          v60 = 0u;
          v61 = 0u;
          v62 = 0u;
          v63 = 0u;
          v45 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v60, v77, 16);
          if (v45)
          {
            v46 = v45;
            v47 = *(_QWORD *)v61;
LABEL_68:
            v48 = 0;
            while (1)
            {
              if (*(_QWORD *)v61 != v47)
                objc_enumerationMutation(v3);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * v48), "conflictsWithMatch:", v44) & 1) != 0)
                break;
              if (v46 == ++v48)
              {
                v46 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v60, v77, 16);
                if (v46)
                  goto LABEL_68;
                goto LABEL_74;
              }
            }
          }
          else
          {
LABEL_74:
            objc_msgSend(v3, "addObject:", v44);
          }
        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
      }
      while (v41);
    }
  }
  return v3;
}

uint64_t __47__TSDMatchingAlgorithm_p_bestMatchesFromArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v6 = objc_msgSend(a2, "matchCost");
  if (v6 < objc_msgSend(a3, "matchCost"))
    return -1;
  v8 = objc_msgSend(a2, "matchCost");
  if (v8 > objc_msgSend(a3, "matchCost"))
    return 1;
  v9 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", a2);
  v10 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", a3);
  v11 = -1;
  if (v9 >= v10)
    v11 = 1;
  if (v9 == v10)
    return 0;
  else
    return v11;
}

+ (id)bestMatchesFromArray:(id)a3
{
  TSDMatchingAlgorithm *v4;
  id v5;

  v4 = objc_alloc_init(TSDMatchingAlgorithm);
  v5 = -[TSDMatchingAlgorithm p_bestMatchesFromArray:](v4, "p_bestMatchesFromArray:", a3);

  return v5;
}

@end
