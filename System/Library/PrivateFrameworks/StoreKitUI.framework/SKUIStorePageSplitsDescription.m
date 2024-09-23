@implementation SKUIStorePageSplitsDescription

- (void)enumerateSplitsUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, char *);
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIStorePageSplit *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  char v18;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, uint64_t, char *))a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUIStorePageSplitsDescription enumerateSplitsUsingBlock:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v19[0] = self->_topSplit;
  v19[1] = self->_leftSplit;
  v19[2] = self->_rightSplit;
  v13 = self->_bottomSplit;
  v14 = 0;
  v15 = 0;
  v19[3] = v13;
  do
  {
    v18 = 0;
    v16 = v19[v14];
    if (v16)
    {
      v4[2](v4, v16, v15, &v18);
      if (v18)
        break;
      ++v15;
    }
    ++v14;
  }
  while (v14 != 4);
  for (i = 3; i != -1; --i)

}

- (SKUIStorePageSplit)firstSplit
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v3)
        -[SKUIStorePageSplitsDescription firstSplit].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__57;
  v18 = __Block_byref_object_dispose__57;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44__SKUIStorePageSplitsDescription_firstSplit__block_invoke;
  v13[3] = &unk_1E73A62E0;
  v13[4] = &v14;
  -[SKUIStorePageSplitsDescription enumerateSplitsUsingBlock:](self, "enumerateSplitsUsingBlock:", v13);
  v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return (SKUIStorePageSplit *)v11;
}

void __44__SKUIStorePageSplitsDescription_firstSplit__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a4 = 1;
}

- (int64_t)numberOfSplits
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v3)
        -[SKUIStorePageSplitsDescription numberOfSplits].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__SKUIStorePageSplitsDescription_numberOfSplits__block_invoke;
  v13[3] = &unk_1E73A62E0;
  v13[4] = &v14;
  -[SKUIStorePageSplitsDescription enumerateSplitsUsingBlock:](self, "enumerateSplitsUsingBlock:", v13);
  v11 = v15[3];
  _Block_object_dispose(&v14, 8);
  return v11;
}

uint64_t __48__SKUIStorePageSplitsDescription_numberOfSplits__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (void)sizeSplitsToFitWidth:(double)a3 usingBlock:(id)a4
{
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SKUIStorePageSplit *rightSplit;
  SKUIStorePageSplit *v16;
  id v17;
  SKUIStorePageSplit *v18;
  _QWORD v19[5];
  SKUIStorePageSplit *v20;
  id v21;
  _QWORD *v22;
  double v23;
  _QWORD v24[4];

  v6 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v7)
        -[SKUIStorePageSplitsDescription sizeSplitsToFitWidth:usingBlock:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  rightSplit = self->_rightSplit;
  if (!rightSplit)
    rightSplit = self->_leftSplit;
  v16 = rightSplit;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  *(double *)&v24[3] = a3;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __66__SKUIStorePageSplitsDescription_sizeSplitsToFitWidth_usingBlock___block_invoke;
  v19[3] = &unk_1E73A6308;
  v19[4] = self;
  v17 = v6;
  v21 = v17;
  v23 = a3;
  v18 = v16;
  v20 = v18;
  v22 = v24;
  -[SKUIStorePageSplitsDescription enumerateSplitsUsingBlock:](self, "enumerateSplitsUsingBlock:", v19);

  _Block_object_dispose(v24, 8);
}

void __66__SKUIStorePageSplitsDescription_sizeSplitsToFitWidth_usingBlock___block_invoke(double *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  __n128 v8;
  id *v9;
  double v10;
  double v11;
  float v12;
  double v13;
  void *v14;
  uint64_t v15;
  id v16;

  v7 = a2;
  v9 = (id *)*((_QWORD *)a1 + 4);
  v16 = v7;
  if (v9[4] == v7 || v9[1] == v7)
  {
    v15 = *((_QWORD *)a1 + 6);
    v8.n128_f64[0] = a1[8];
LABEL_9:
    (*(void (**)(uint64_t, id, uint64_t, uint64_t, __n128))(v15 + 16))(v15, v16, a3, a4, v8);
    v14 = v16;
    goto LABEL_10;
  }
  if (*((id *)a1 + 5) == v7)
  {
    v15 = *((_QWORD *)a1 + 6);
    v8.n128_u64[0] = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 7) + 8) + 24);
    goto LABEL_9;
  }
  objc_msgSend(v9[2], "widthFraction");
  if (v10 < 0.00000011920929)
  {
    objc_msgSend(*(id *)(*((_QWORD *)a1 + 4) + 24), "widthFraction");
    v10 = 1.0 - v11;
  }
  v12 = v10 * a1[8];
  v13 = roundf(v12);
  (*(void (**)(double))(*((_QWORD *)a1 + 6) + 16))(v13);
  v14 = v16;
  *(double *)(*(_QWORD *)(*((_QWORD *)a1 + 7) + 8) + 24) = *(double *)(*(_QWORD *)(*((_QWORD *)a1 + 7) + 8) + 24)
                                                             - v13;
LABEL_10:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUIStorePageSplitsDescription copyWithZone:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v13, "setBottomSplit:", self->_bottomSplit);
  objc_msgSend(v13, "setLeftSplit:", self->_leftSplit);
  objc_msgSend(v13, "setRightSplit:", self->_rightSplit);
  objc_msgSend(v13, "setTopSplit:", self->_topSplit);
  return v13;
}

- (id)description
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIStorePageSplitsDescription description].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v11 = (void *)MEMORY[0x1E0CB3940];
  v15.receiver = self;
  v15.super_class = (Class)SKUIStorePageSplitsDescription;
  -[SKUIStorePageSplitsDescription description](&v15, sel_description);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: Splits: [T: %@, L: %@, R: %@, B: %@]"), v12, self->_topSplit, self->_leftSplit, self->_rightSplit, self->_bottomSplit);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (SKUIStorePageSplit)bottomSplit
{
  return self->_bottomSplit;
}

- (void)setBottomSplit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SKUIStorePageSplit)leftSplit
{
  return self->_leftSplit;
}

- (void)setLeftSplit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SKUIStorePageSplit)rightSplit
{
  return self->_rightSplit;
}

- (void)setRightSplit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SKUIStorePageSplit)topSplit
{
  return self->_topSplit;
}

- (void)setTopSplit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topSplit, 0);
  objc_storeStrong((id *)&self->_rightSplit, 0);
  objc_storeStrong((id *)&self->_leftSplit, 0);
  objc_storeStrong((id *)&self->_bottomSplit, 0);
}

- (void)enumerateSplitsUsingBlock:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)firstSplit
{
  OUTLINED_FUNCTION_1();
}

- (void)numberOfSplits
{
  OUTLINED_FUNCTION_1();
}

- (void)sizeSplitsToFitWidth:(uint64_t)a3 usingBlock:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)copyWithZone:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)description
{
  OUTLINED_FUNCTION_1();
}

@end
