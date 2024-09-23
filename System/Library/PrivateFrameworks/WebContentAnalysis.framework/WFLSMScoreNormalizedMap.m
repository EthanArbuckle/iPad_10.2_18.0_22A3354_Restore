@implementation WFLSMScoreNormalizedMap

- (WFLSMScoreNormalizedMap)initWithMap:(__LSMMap *)a3
{
  WFLSMScoreNormalizedMap *v3;
  WFLSMScoreNormalizedMap *v4;
  uint64_t v5;
  float *v6;
  uint64_t v7;
  float *maxScore;
  uint64_t v9;
  uint64_t i;
  id v11;
  id v12;
  float v13;
  uint64_t j;
  float v15;
  float *minScore;
  float v17;
  NSObject *v19;
  uint64_t k;
  NSObject *v21;
  uint64_t v22;
  float v23;
  float v24;
  uint64_t *v26;
  objc_super v27;
  objc_super v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  int v32;
  __int16 v33;
  double v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;
  uint8_t v39[4];
  _BYTE v40[28];

  *(_QWORD *)&v40[20] = *MEMORY[0x24BDAC8D0];
  v28.receiver = self;
  v28.super_class = (Class)WFLSMScoreNormalizedMap;
  v3 = -[WFLSMMap initWithMap:](&v28, sel_initWithMap_, a3);
  v4 = v3;
  if (v3)
  {
    v5 = -[WFLSMMap numberOfCategories](v3, "numberOfCategories");
    v4->maxScore = (float *)malloc_type_malloc(4 * v5 + 4, 0x100004052888210uLL);
    v6 = (float *)malloc_type_malloc(4 * v5 + 4, 0x100004052888210uLL);
    v4->minScore = v6;
    if ((v5 & 0x8000000000000000) == 0)
    {
      v7 = 0;
      maxScore = v4->maxScore;
      do
      {
        maxScore[v7] = -1.0;
        v6[v7++] = -1.0;
      }
      while (v5 + 1 != v7);
      if (v5 >= 1)
      {
        v9 = 0;
        v26 = (uint64_t *)v40;
        for (i = 1; i <= v5; ++i)
        {
          v11 = +[WFWebPageToTrainingText signatureForCategory:](WFWebPageToTrainingText, "signatureForCategory:", i, v26);
          v27.receiver = v4;
          v27.super_class = (Class)WFLSMScoreNormalizedMap;
          v12 = -[WFLSMMap evaluate:](&v27, sel_evaluate_, v11);
          if (objc_msgSend(v12, "bestMatchingCategory") == i)
          {
            objc_msgSend(v12, "scoreForCategory:", i);
            v4->maxScore[i] = v13;
            for (j = 1; j <= v5; ++j)
            {
              if (v9 + j != 1)
              {
                objc_msgSend(v12, "scoreForCategory:", j);
                minScore = v4->minScore;
                v17 = minScore[j];
                if (v17 <= 0.0 || v15 < v17)
                  minScore[j] = v15;
              }
            }
          }
          else
          {
            v19 = __WFDefaultLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              -[WFLSMScoreNormalizedMap initWithMap:].cold.1(v39, (uint64_t)v4, v26, v19);
          }
          --v9;
        }
        for (k = 1; k <= v5; ++k)
        {
          v21 = __WFDefaultLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v22 = objc_msgSend((id)objc_opt_class(), "description");
            v23 = v4->minScore[k];
            v24 = v4->maxScore[k];
            *(_DWORD *)buf = 138413314;
            v30 = v22;
            v31 = 1024;
            v32 = k;
            v33 = 2048;
            v34 = v23;
            v35 = 2048;
            v36 = v24;
            v37 = 2048;
            v38 = (float)(v24 - v23);
            _os_log_impl(&dword_20CD6C000, v21, OS_LOG_TYPE_INFO, "%@ category:%d min:%f max:%f scope:%f", buf, 0x30u);
          }
        }
      }
    }
  }
  return v4;
}

- (id)evaluate:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  uint64_t v9;
  float v10;
  float v11;
  float v12;
  uint64_t v13;
  float v14;
  float v15;
  double v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)WFLSMScoreNormalizedMap;
  v4 = -[WFLSMMap evaluate:](&v18, sel_evaluate_, a3);
  v5 = -[WFLSMMap numberOfCategories](self, "numberOfCategories");
  if (v5 >= 1)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0.0;
    do
    {
      v9 = v7 + 1;
      objc_msgSend(v4, "scoreForCategory:", v7 + 1);
      v10 = self->minScore[v7 + 1];
      v12 = (float)(v11 - v10) / (float)(self->maxScore[v7 + 1] - v10);
      if (v12 < 0.0)
        v12 = 0.0;
      v8 = v8 + v12;
      objc_msgSend(v4, "setScore:forCategory:", ++v7);
    }
    while (v6 != v9);
    v13 = 0;
    v14 = 1.0 / v8;
    do
    {
      objc_msgSend(v4, "scoreForCategory:", ++v13);
      *(float *)&v16 = v14 * v15;
      objc_msgSend(v4, "setScore:forCategory:", v13, v16);
    }
    while (v6 != v13);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  free(self->maxScore);
  free(self->minScore);
  v3.receiver = self;
  v3.super_class = (Class)WFLSMScoreNormalizedMap;
  -[WFLSMMap dealloc](&v3, sel_dealloc);
}

- (void)initWithMap:(uint64_t *)a3 .cold.1(uint8_t *a1, uint64_t a2, uint64_t *a3, NSObject *a4)
{
  uint64_t v7;

  v7 = objc_msgSend((id)objc_opt_class(), "description");
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_20CD6C000, a4, OS_LOG_TYPE_ERROR, "**** %@ ERROR: bestMatchingCategory doesn't match category_i, error in the creating of the map", a1, 0xCu);
}

@end
