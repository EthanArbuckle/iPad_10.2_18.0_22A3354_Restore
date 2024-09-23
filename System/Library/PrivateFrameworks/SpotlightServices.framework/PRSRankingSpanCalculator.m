@implementation PRSRankingSpanCalculator

+ (BOOL)doesOrderedSpanExistWithArrayOfIndexArrays:(unint64_t *)a3 arrayOfIndexArraysCounts:(unint64_t *)a4 arrayOfIndexArraysCount:(unint64_t)a5 queryTermCount:(unint64_t)a6 kTermCount:(unint64_t)a7
{
  uint64_t v7;
  unint64_t v10;
  unint64_t *v11;
  unint64_t **v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t *v26;
  _BOOL4 v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t *v31;
  const char *v32;
  unint64_t v33;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (a6 < a7)
    return 0;
  v10 = a6 + 1 - a7;
  if (a6 + 1 == a7)
    return 0;
  v11 = a4;
  v12 = a3;
  v13 = 0;
  v14 = 8 * a6;
  if (v10 <= 1)
    v10 = 1;
  v36 = a7 - 1;
  v37 = v10;
  while (1)
  {
    if (v12[v13])
    {
      MEMORY[0x1E0C80A78](a1, a2, a3, a4, a5, a6, a7, v7);
      v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v15, 8 * a6);
      MEMORY[0x1E0C80A78](v16, v17, v18, v19, v20, v21, v22, v23);
      bzero(v15, 8 * a6);
      bzero(v15, 8 * a6);
      bzero(v15, 8 * a6);
      v24 = v11[v13];
      if (v24)
        break;
    }
LABEL_35:
    if (++v13 == v37)
      return 0;
  }
  v25 = 0;
  v26 = v12[v13];
  v28 = v13 + 1 < a6 && a7 > 1;
LABEL_14:
  *(_QWORD *)&v15[8 * v13] = v25;
  v29 = v26[v25];
  *(_QWORD *)&v15[8 * v13] = v29;
  if (!v28)
    goto LABEL_34;
  v30 = v13 + 1;
  do
  {
    v31 = v12[v30];
    if (!v31 || (v32 = *(const char **)&v15[8 * v30], a1 = (id)(v11[v30] - 1), v32 > a1))
    {
LABEL_32:
      if (++v25 == v24)
        goto LABEL_35;
      goto LABEL_14;
    }
    a3 = *(unint64_t ***)&v15[8 * v30];
    while (1)
    {
      a4 = (unint64_t *)((char *)a1 + (_QWORD)a3);
      a2 = (SEL)(((unint64_t)a1 + (unint64_t)a3) >> 1);
      v33 = v31[(_QWORD)a2];
      if (v33 >= v29)
        break;
      a3 = (unint64_t **)(a2 + 1);
LABEL_23:
      if (a3 > a1)
        goto LABEL_32;
    }
    if ((unint64_t)a4 >= 2)
    {
      a1 = (id)(a2 - 1);
      a4 = (unint64_t *)v31[(_QWORD)(a2 - 1)];
      if ((unint64_t)a4 >= v29)
        goto LABEL_23;
    }
    if (a2 == (SEL)0x7FFFFFFF || v33 > v29 + 1)
      goto LABEL_32;
    if (v25 && a2 == v32)
      break;
    *(_QWORD *)&v15[8 * v30] = v33;
    *(_QWORD *)&v15[8 * v30++] = a2;
    if (v30 >= a6)
      break;
    v29 = v33;
  }
  while (v30 - v13 < a7);
LABEL_34:
  if (*(_QWORD *)&v15[8 * v36 + 8 * v13] - *(_QWORD *)&v15[8 * v13] == 0x7FFFFFFFLL)
    goto LABEL_35;
  return 1;
}

+ (BOOL)doesOrderedSpanExistWithArrayOfIndexArrays:(unint64_t *)a3 arrayOfIndexArraysCounts:(unint64_t *)a4 arrayOfIndexArraysCount:(unint64_t)a5 orderedSpan:(int64_t *)a6 firstTermPosition:(unint64_t *)a7 queryTermCount:(unint64_t)a8
{
  size_t v14;
  unint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t *v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  int64_t v38;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v14 = 8 * a8;
  MEMORY[0x1E0C80A78](a1, a2, a3, a4, a5, a6, a7, a8);
  v15 = (_QWORD *)((char *)v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  bzero(v15, v14);
  MEMORY[0x1E0C80A78](v16, v17, v18, v19, v20, v21, v22, v23);
  bzero(v15, v14);
  bzero(v15, v14);
  bzero(v15, v14);
  v24 = *a4;
  if (!*a4)
  {
    v27 = 0x7FFFFFFFLL;
    return v27 != 0x7FFFFFFF;
  }
  v25 = 0;
  v26 = *a3;
  v27 = 0x7FFFFFFFLL;
  do
  {
    v28 = v25;
    v29 = v26[v25];
    *v15 = v29;
    if (a5 >= 2)
    {
      v30 = v29;
      v31 = 1;
      while (1)
      {
        v32 = v15[v31];
        v33 = a4[v31] - 1;
        if (v32 > v33)
          goto LABEL_21;
        v34 = a3[v31];
        v35 = v15[v31];
        while (1)
        {
          v36 = (v35 + v33) >> 1;
          v37 = v34[v36];
          if (v37 >= v30)
            break;
          v35 = v36 + 1;
LABEL_11:
          if (v35 > v33)
            goto LABEL_21;
        }
        if (v35 + v33 >= 2)
        {
          v33 = v36 - 1;
          if (v34[v36 - 1] >= v30)
            goto LABEL_11;
        }
        if (v36 == 0x7FFFFFFF)
          goto LABEL_21;
        if (!v28 || v36 != v32)
        {
          v15[v31] = v37;
          v15[v31++] = v36;
          v30 = v37;
          if (v31 != a5)
            continue;
        }
        break;
      }
    }
    v38 = v15[a8 - 1] - v29;
    if (v27 == 0x7FFFFFFF || v38 < v27)
    {
      *a6 = v38;
      *a7 = v29;
      v27 = v38;
    }
    v25 = v28 + 1;
  }
  while (v28 + 1 != v24);
LABEL_21:
  *v15 = v28;
  return v27 != 0x7FFFFFFF;
}

+ (int64_t)minimumAnyOrderSpanWithArrayOfIndexArrays:(unint64_t *)a3 arrayOfIndexArraysCounts:(unint64_t *)a4 arrayOfIndexArraysCount:(unint64_t)a5 queryTermCount:(unint64_t)a6
{
  size_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t result;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  int64_t v28;
  BOOL v29;
  _BOOL4 v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  BOOL v39;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  if (a6 - 1 >= a5)
    return 0x7FFFFFFFLL;
  v10 = 8 * a6;
  ((void (*)(id, SEL, unint64_t **, unint64_t *, unint64_t, unint64_t))MEMORY[0x1E0C80A78])(a1, a2, a3, a4, a5, a6);
  v11 = (char *)v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v11, v10);
  MEMORY[0x1E0C80A78](v12, v13, v14, v15, v16, v17, v18, v19);
  bzero(v11, v10);
  bzero(v11, v10);
  bzero(v11, v10);
  v20 = 0;
  v21 = 0;
  v22 = 0;
  result = 0x7FFFFFFFLL;
  while (a4[v20])
  {
    v24 = *a3[v20];
    *(_QWORD *)&v11[8 * v20] = v24;
    v25 = v24;
    if (!v20 || (v24 >= v22 ? (v25 = v22) : (v25 = v24), v22 = v25, v24 > v21))
    {
      v22 = v25;
      v21 = v24;
    }
    if (a5 == ++v20)
    {
      result = 0x7FFFFFFFLL;
      while (1)
      {
        v26 = 0;
        v27 = 0;
        v28 = v21 - v22;
        v29 = result == 0x7FFFFFFF || v28 < result;
        v30 = v29;
        v31 = 0x7FFFFFFFLL;
        do
        {
          if (v26)
            v32 = *(_QWORD *)&v11[8 * v26] >= v27;
          else
            v32 = 0;
          if (!v32)
          {
            v27 = *(_QWORD *)&v11[8 * v26];
            v31 = v26;
          }
          ++v26;
        }
        while (a6 != v26);
        if (v30)
          result = v28;
        if (v31 == 0x7FFFFFFF)
          +[PRSRankingSpanCalculator minimumAnyOrderSpanWithArrayOfIndexArrays:arrayOfIndexArraysCounts:arrayOfIndexArraysCount:queryTermCount:].cold.1();
        v34 = *(_QWORD *)&v11[8 * v31];
        if (v34 == a4[v31] - 1)
          break;
        v35 = 0;
        v22 = 0;
        v36 = v34 + 1;
        *(_QWORD *)&v11[8 * v31] = v36;
        v37 = a3[v31][v36];
        *(_QWORD *)&v11[8 * v31] = v37;
        v38 = 0x7FFFFFFFLL;
        do
        {
          if (v35)
            v39 = *(_QWORD *)&v11[8 * v35] >= v22;
          else
            v39 = 0;
          if (!v39)
          {
            v22 = *(_QWORD *)&v11[8 * v35];
            v38 = v35;
          }
          ++v35;
        }
        while (a6 != v35);
        if (v38 == 0x7FFFFFFF)
          +[PRSRankingSpanCalculator minimumAnyOrderSpanWithArrayOfIndexArrays:arrayOfIndexArraysCounts:arrayOfIndexArraysCount:queryTermCount:].cold.2();
        if (v37 > v21)
          v21 = v37;
      }
      return result;
    }
  }
  return result;
}

+ (int64_t)minimumPairDistanceWithArrayOfIndexArrays:(unint64_t *)a3 arrayOfIndexArraysCounts:(unint64_t *)a4 arrayOfIndexArraysCount:(unint64_t)a5 queryTermCount:(unint64_t)a6 tokenCount:(unint64_t)a7
{
  int64_t v9;
  int v11;
  unint64_t *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (!a6)
    return 0x7FFFFFFFLL;
  if (a6 == 1)
  {
    if (a4 && *a4)
      return 0;
    return 0x7FFFFFFFLL;
  }
  v9 = 0x7FFFFFFFLL;
  if (a5 >= a6 && a5)
  {
    v11 = 0;
    v12 = a4;
    do
    {
      if (*v12++)
        ++v11;
      --a5;
    }
    while (a5);
    if (!v11)
      return 0x7FFFFFFFLL;
    v9 = a7;
    if (v11 != 1)
    {
      v14 = 0;
      v9 = -1;
      do
      {
        v15 = a4[v14];
        if (v15)
        {
          v16 = 0;
          do
          {
            if (v14 != v16)
            {
              v17 = a4[v16];
              if (v17)
              {
                v18 = minSpanLenContainingPair((uint64_t)a3[v14], v15, a3[v16], v17);
                if (v18 < v9 || v9 == -1)
                  v9 = v18;
              }
            }
            ++v16;
          }
          while (a6 != v16);
        }
        ++v14;
      }
      while (v14 != a6);
    }
  }
  return v9;
}

- (void)reset
{
  *(_QWORD *)&self->_unordered = 0x4F0000004F000000;
  self->_pairDist = 2147500000.0;
  self->_firstTermPosition = 2147500000.0;
  *(_WORD *)&self->_pathExists = 0;
  self->_n3Exists = 0;
}

- (void)resetSpans
{
  *(_QWORD *)&self->_unordered = 0x4F0000004F000000;
}

- (void)updateWithTermPositions:(id)a3 queryTermCount:(unint64_t)a4 tokenCount:(unint64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  size_t v12;
  _QWORD **v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  void **v21;
  uint64_t j;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  PRSRankingSpanCalculator *v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  int64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  float v39;
  float v40;
  _QWORD v41[2];
  void *v42;
  unint64_t v43;
  _QWORD *v44;
  PRSRankingSpanCalculator *v45;
  unint64_t v46;
  void *v47;
  _QWORD v48[5];
  unint64_t v49;
  uint64_t v50;
  _QWORD v51[7];

  v51[5] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[PRSRankingSpanCalculator reset](self, "reset");
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  v47 = (void *)*MEMORY[0x1E0C9B0D0];
  objc_msgSend(v9, "removeObject:");
  v10 = objc_msgSend(v9, "count");
  if (v10)
  {
    v11 = v10;
    v45 = self;
    v46 = a4;
    v43 = a5;
    v44 = v41;
    v12 = 8 * v10;
    v13 = (_QWORD **)((char *)v41 - ((8 * v10 + 15) & 0xFFFFFFFFFFFFFFF0));
    bzero(v13, 8 * v10);
    bzero(v13, v12);
    for (i = 0; i != v11; ++i)
    {
      v15 = (void *)MEMORY[0x1E0C99E40];
      objc_msgSend(v9, "objectAtIndexedSubscript:", i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "orderedSetWithArray:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_msgSend(v17, "count");
      v13[i] = (_QWORD *)v18;
      if (v18)
      {
        v19 = malloc_type_malloc(8 * v18, 0x100004000313F17uLL);
        v51[0] = MEMORY[0x1E0C809B0];
        v51[1] = 3221225472;
        v51[2] = __78__PRSRankingSpanCalculator_updateWithTermPositions_queryTermCount_tokenCount___block_invoke;
        v51[3] = &__block_descriptor_40_e25_v32__0__NSNumber_8Q16_B24l;
        v51[4] = v19;
        objc_msgSend(v17, "enumerateObjectsUsingBlock:", v51);
      }
      else
      {
        v19 = 0;
      }
      v13[i] = v19;

    }
    v49 = 0x7FFFFFFFLL;
    v50 = 0x7FFFFFFFLL;
    if (v11 <= 1)
    {
      if (v46)
      {
        v29 = v45;
        if (v46 == 1)
        {
          v45->_pathExists = 1;
          v50 = 0;
          v35 = 0;
          v36 = 0;
          if (*v13)
            v49 = **v13;
        }
        else
        {
          v35 = 0x7FFFFFFFLL;
          v36 = v43;
        }
      }
      else
      {
        v35 = 0x7FFFFFFFLL;
        v36 = 0x7FFFFFFFLL;
        v29 = v45;
      }
    }
    else
    {
      v42 = v9;
      v41[1] = v41;
      v20 = v46;
      v21 = (void **)((char *)v41 - ((8 * v46 + 15) & 0xFFFFFFFFFFFFFFF0));
      bzero(v21, 8 * v46);
      bzero(v21, 8 * v20);
      if (v20)
      {
        for (j = 0; j != v20; ++j)
        {
          objc_msgSend(v8, "objectAtIndexedSubscript:", j);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23 == v47)
          {
            v21[j] = 0;
            v21[j] = 0;
          }
          else
          {
            v24 = v8;
            objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "count");
            v21[j] = (void *)v26;
            if (v26)
            {
              v27 = malloc_type_malloc(8 * v26, 0x100004000313F17uLL);
              v48[0] = MEMORY[0x1E0C809B0];
              v48[1] = 3221225472;
              v48[2] = __78__PRSRankingSpanCalculator_updateWithTermPositions_queryTermCount_tokenCount___block_invoke_2;
              v48[3] = &__block_descriptor_40_e25_v32__0__NSNumber_8Q16_B24l;
              v48[4] = v27;
              objc_msgSend(v25, "enumerateObjectsUsingBlock:", v48);
            }
            else
            {
              v27 = 0;
            }
            v21[j] = v27;

            v8 = v24;
            v20 = v46;
          }

        }
      }
      v28 = +[PRSRankingSpanCalculator doesOrderedSpanExistWithArrayOfIndexArrays:arrayOfIndexArraysCounts:arrayOfIndexArraysCount:queryTermCount:kTermCount:](PRSRankingSpanCalculator, "doesOrderedSpanExistWithArrayOfIndexArrays:arrayOfIndexArraysCounts:arrayOfIndexArraysCount:queryTermCount:kTermCount:", v21, v21, v11, v20, 2);
      v29 = v45;
      v45->_n2Exists = v28;
      if (v11 > 2)
        v29->_n3Exists = +[PRSRankingSpanCalculator doesOrderedSpanExistWithArrayOfIndexArrays:arrayOfIndexArraysCounts:arrayOfIndexArraysCount:queryTermCount:kTermCount:](PRSRankingSpanCalculator, "doesOrderedSpanExistWithArrayOfIndexArrays:arrayOfIndexArraysCounts:arrayOfIndexArraysCount:queryTermCount:kTermCount:", v21, v21, v11, v20, 3);
      v30 = v43;
      if (v20)
      {
        v31 = v20;
        do
        {
          v32 = *v21++;
          free(v32);
          --v31;
        }
        while (v31);
      }
      if (v11 == v20)
        v29->_pathExists = +[PRSRankingSpanCalculator doesOrderedSpanExistWithArrayOfIndexArrays:arrayOfIndexArraysCounts:arrayOfIndexArraysCount:orderedSpan:firstTermPosition:queryTermCount:](PRSRankingSpanCalculator, "doesOrderedSpanExistWithArrayOfIndexArrays:arrayOfIndexArraysCounts:arrayOfIndexArraysCount:orderedSpan:firstTermPosition:queryTermCount:", v13, v13, v20, &v50, &v49, v20);
      v33 = +[PRSRankingSpanCalculator minimumAnyOrderSpanWithArrayOfIndexArrays:arrayOfIndexArraysCounts:arrayOfIndexArraysCount:queryTermCount:](PRSRankingSpanCalculator, "minimumAnyOrderSpanWithArrayOfIndexArrays:arrayOfIndexArraysCounts:arrayOfIndexArraysCount:queryTermCount:", v13, v13, v11, v20);
      v34 = v20;
      v35 = v33;
      v36 = +[PRSRankingSpanCalculator minimumPairDistanceWithArrayOfIndexArrays:arrayOfIndexArraysCounts:arrayOfIndexArraysCount:queryTermCount:tokenCount:](PRSRankingSpanCalculator, "minimumPairDistanceWithArrayOfIndexArrays:arrayOfIndexArraysCounts:arrayOfIndexArraysCount:queryTermCount:tokenCount:", v13, v13, v11, v34, v30);
      v9 = v42;
    }
    if (v11 <= 1)
      v37 = 1;
    else
      v37 = v11;
    do
    {
      v38 = *v13++;
      free(v38);
      --v37;
    }
    while (v37);
    if (v50 != 0x7FFFFFFF)
    {
      v39 = (double)v50 + 2.0;
      v29->_ordered = v39 / (float)v46;
    }
    if (v49 != 0x7FFFFFFF)
      v29->_firstTermPosition = (float)v49;
    if (v35 != 0x7FFFFFFF)
    {
      v40 = (double)v35 + 2.0;
      v29->_unordered = v40 / (float)v46;
    }
    if (v36 != 0x7FFFFFFF)
      v29->_pairDist = (float)v36;
    if (v11 != v46)
      -[PRSRankingSpanCalculator resetSpans](v29, "resetSpans");
  }

}

uint64_t __78__PRSRankingSpanCalculator_updateWithTermPositions_queryTermCount_tokenCount___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "unsignedIntegerValue");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * a3) = result;
  return result;
}

uint64_t __78__PRSRankingSpanCalculator_updateWithTermPositions_queryTermCount_tokenCount___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "unsignedIntegerValue");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * a3) = result;
  return result;
}

- (id)description
{
  double v2;
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  _QWORD v19[5];
  _QWORD v20[6];

  v20[5] = *MEMORY[0x1E0C80C00];
  v19[0] = CFSTR("unordered");
  *(float *)&v2 = self->_unordered;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v4;
  v19[1] = CFSTR("ordered");
  *(float *)&v5 = self->_ordered;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v6;
  v19[2] = CFSTR("firstTermPosition");
  *(float *)&v7 = self->_firstTermPosition;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v8;
  v19[3] = CFSTR("normCount");
  *(float *)&v9 = self->_normCount;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v10;
  v19[4] = CFSTR("pairDist");
  *(float *)&v11 = self->_pairDist;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB3940];
  v18.receiver = self;
  v18.super_class = (Class)PRSRankingSpanCalculator;
  -[PRSRankingSpanCalculator description](&v18, sel_description);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ %@"), v15, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (float)unordered
{
  return self->_unordered;
}

- (void)setUnordered:(float)a3
{
  self->_unordered = a3;
}

- (float)ordered
{
  return self->_ordered;
}

- (void)setOrdered:(float)a3
{
  self->_ordered = a3;
}

- (float)firstTermPosition
{
  return self->_firstTermPosition;
}

- (void)setFirstTermPosition:(float)a3
{
  self->_firstTermPosition = a3;
}

- (float)normCount
{
  return self->_normCount;
}

- (void)setNormCount:(float)a3
{
  self->_normCount = a3;
}

- (float)pairDist
{
  return self->_pairDist;
}

- (void)setPairDist:(float)a3
{
  self->_pairDist = a3;
}

- (BOOL)pathExists
{
  return self->_pathExists;
}

- (void)setPathExists:(BOOL)a3
{
  self->_pathExists = a3;
}

- (BOOL)n2Exists
{
  return self->_n2Exists;
}

- (void)setN2Exists:(BOOL)a3
{
  self->_n2Exists = a3;
}

- (BOOL)n3Exists
{
  return self->_n3Exists;
}

- (void)setN3Exists:(BOOL)a3
{
  self->_n3Exists = a3;
}

+ (void)minimumAnyOrderSpanWithArrayOfIndexArrays:arrayOfIndexArraysCounts:arrayOfIndexArraysCount:queryTermCount:.cold.1()
{
  __assert_rtn("+[PRSRankingSpanCalculator minimumAnyOrderSpanWithArrayOfIndexArrays:arrayOfIndexArraysCounts:arrayOfIndexArraysCount:queryTermCount:]", "PRSRankingSpanCalculator.m", 263, "j != PRS_RANKING_SCORE_NO_MATCH");
}

+ (void)minimumAnyOrderSpanWithArrayOfIndexArrays:arrayOfIndexArraysCounts:arrayOfIndexArraysCount:queryTermCount:.cold.2()
{
  __assert_rtn("+[PRSRankingSpanCalculator minimumAnyOrderSpanWithArrayOfIndexArrays:arrayOfIndexArraysCounts:arrayOfIndexArraysCount:queryTermCount:]", "PRSRankingSpanCalculator.m", 277, "unused != PRS_RANKING_SCORE_NO_MATCH");
}

@end
