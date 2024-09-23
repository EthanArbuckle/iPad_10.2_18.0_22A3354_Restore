@implementation PXAlignmentLayoutPerformer

+ (CGSize)performLayoutWithLayoutInput:(id *)a3 layoutOutput:(id)a4 usingBlock:(id)a5
{
  __int128 v5;
  CGSize size;
  double v7;
  double v8;
  _OWORD v9[4];
  int64_t var3;
  objc_super v11;
  CGSize result;

  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___PXAlignmentLayoutPerformer;
  v5 = *(_OWORD *)&a3->var2.var1;
  v9[2] = *(_OWORD *)&a3->var1;
  v9[3] = v5;
  var3 = a3->var2.var3;
  size = a3->var0.size;
  v9[0] = a3->var0.origin;
  v9[1] = size;
  objc_msgSendSuper2(&v11, sel_performLayoutWithLayoutInput_layoutOutput_usingBlock_, v9, a4, a5);
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)performLayout
{
  void *v3;
  void *v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unsigned __int128 v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _OWORD v35[2];
  _BYTE v36[128];
  uint64_t v37;
  CGSize result;
  CGRect v39;
  CGRect v40;

  v37 = *MEMORY[0x1E0C80C00];
  v34 = 0u;
  memset(v35, 0, 24);
  v32 = 0u;
  v33 = 0u;
  -[PXBaseLayoutPerformer layoutInput](self, "layoutInput");
  -[PXBaseLayoutPerformer layoutOutput](self, "layoutOutput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAlignmentLayoutPerformer children](self, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = *(_OWORD *)((char *)v35 + 8);
  v5 = -[PXAlignmentLayoutPerformer xAlignment](self, "xAlignment");
  v6 = -[PXAlignmentLayoutPerformer yAlignment](self, "yAlignment");
  v27 = 0u;
  v28 = 0u;
  v7 = v5;
  v29 = 0uLL;
  v30 = 0uLL;
  obj = v4;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    v11 = 0.0;
    v12 = 0.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v22 = 0uLL;
        v23 = v31;
        v15 = PXGetSizeFromChild(v14, &v22, 0.0, 0.0, 0.0, 0.0);
        v17 = v16;
        if (v7)
        {
          if (v7 == 2)
          {
            v39.origin = 0u;
            v39.size = 0u;
            v11 = CGRectGetMaxX(v39) - v15;
          }
          else if (v7 == 1)
          {
            v11 = 0.0;
            if (!v6)
              goto LABEL_18;
            goto LABEL_13;
          }
          if (!v6)
            goto LABEL_18;
        }
        else
        {
          v11 = (0.0 - v15) * 0.5 + 0.0;
          if (!v6)
          {
LABEL_18:
            v12 = (0.0 - v17) * 0.5 + 0.0;
            goto LABEL_19;
          }
        }
LABEL_13:
        if (v6 == 1)
        {
          v40.origin = 0u;
          v40.size = 0u;
          v12 = CGRectGetMaxY(v40) - v17;
        }
        else if (v6 == 2)
        {
          v12 = 0.0;
        }
LABEL_19:
        v24 = v34;
        v25 = v35[0];
        v26 = *(_QWORD *)&v35[1];
        v22 = v32;
        v23 = v33;
        PXPerformChildLayout(v14, &v22, v3, v11, v12, v15, v17);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v9);
  }

  v20 = 0u;
  *(_QWORD *)&v19 = v20 >> 64;
  *(_QWORD *)&v18 = v20;
  result.height = v19;
  result.width = v18;
  return result;
}

- (void)preprareForReuse
{
  -[PXAlignmentLayoutPerformer setXAlignment:](self, "setXAlignment:", 0);
  -[PXAlignmentLayoutPerformer setYAlignment:](self, "setYAlignment:", 0);
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->_children, a3);
}

- (int64_t)xAlignment
{
  return self->_xAlignment;
}

- (void)setXAlignment:(int64_t)a3
{
  self->_xAlignment = a3;
}

- (int64_t)yAlignment
{
  return self->_yAlignment;
}

- (void)setYAlignment:(int64_t)a3
{
  self->_yAlignment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
}

@end
