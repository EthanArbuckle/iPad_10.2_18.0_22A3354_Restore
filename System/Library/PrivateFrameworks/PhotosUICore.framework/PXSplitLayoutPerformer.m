@implementation PXSplitLayoutPerformer

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
  v11.super_class = (Class)&OBJC_METACLASS___PXSplitLayoutPerformer;
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
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int64_t v10;
  double v11;
  double v12;
  double height;
  double width;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  CGFloat v20;
  double MaxX;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  CGSize v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  CGFloat rect;
  double v34;
  double v35;
  __int128 v36;
  CGSize v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  CGSize v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  CGSize result;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v45 = 0;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = (CGSize)0;
  -[PXBaseLayoutPerformer layoutInput](self, "layoutInput");
  -[PXBaseLayoutPerformer layoutOutput](self, "layoutOutput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSplitLayoutPerformer children](self, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") <= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSplitLayoutPerformer.m"), 28, CFSTR("PXSplitLayoutPerformer needs 2 children"));

  }
  v6 = *(double *)&v41;
  -[PXSplitLayoutPerformer layoutRatio](self, "layoutRatio");
  v8 = v7;
  v9 = 1.0 - v7;
  v10 = -[PXSplitLayoutPerformer layoutAxis](self, "layoutAxis");
  -[PXSplitLayoutPerformer interItemSpacing](self, "interItemSpacing");
  v12 = v11 * 0.5;
  if (v10 == 1)
  {
    height = -(v12 - v42.height * v8);
    v19 = v11 - (v12 - v42.height * v8);
    v15 = *((double *)&v41 + 1);
    v34 = *((double *)&v41 + 1) + v19;
    v35 = *(double *)&v41;
    v17 = -(v12 - v42.height * v9);
    width = v42.width;
    v16 = v42.width;
  }
  else if (v10 == 2)
  {
    width = -(v12 - v42.width * v8);
    v34 = *((double *)&v41 + 1);
    v35 = *(double *)&v41 + v11 - (v12 - v42.width * v8);
    v16 = -(v12 - v42.width * v9);
    height = v42.height;
    v15 = *((double *)&v41 + 1);
    v17 = v42.height;
  }
  else
  {
    height = v42.height;
    width = v42.width;
    v34 = *((double *)&v41 + 1);
    v15 = *((double *)&v41 + 1);
    v35 = *(double *)&v41;
    v17 = v42.height;
    v16 = v42.width;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v11, v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSplitLayoutPerformer.m"), 52, CFSTR("PXSplitLayoutPerformer needs a specified layout axis"));

      abort();
    }
  }
  if ((_QWORD)v44 == 2)
  {
    *(_QWORD *)&v47.origin.x = v41;
    v47.origin.y = v15;
    v47.size = v42;
    rect = v17;
    v20 = v16;
    MaxX = CGRectGetMaxX(v47);
    *(_QWORD *)&v48.origin.x = v41;
    v48.origin.y = v15;
    v48.size.width = width;
    v48.size.height = height;
    v22 = MaxX - CGRectGetWidth(v48);
    *(_QWORD *)&v49.origin.x = v41;
    v49.origin.y = v15;
    v49.size.width = width;
    v49.size.height = height;
    v32 = v22 - CGRectGetMinX(v49);
    *(_QWORD *)&v50.origin.x = v41;
    v50.origin.y = v15;
    v50.size = v42;
    v23 = CGRectGetMaxX(v50);
    v24 = v34;
    v51.origin.x = v35;
    v51.origin.y = v34;
    v51.size.width = v20;
    v51.size.height = rect;
    v25 = v23 - CGRectGetWidth(v51);
    v52.origin.x = v35;
    v52.origin.y = v34;
    v52.size.width = v20;
    v52.size.height = rect;
    v35 = v25 - CGRectGetMinX(v52);
    v16 = v20;
    v6 = v32;
    v17 = rect;
  }
  else
  {
    v24 = v34;
  }
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0, *(_QWORD *)&v32);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v43;
  v39 = v44;
  v40 = v45;
  v36 = v41;
  v37 = v42;
  PXPerformChildLayout(v26, &v36, v4, v6, v15, width, height);
  objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v43;
  v39 = v44;
  v40 = v45;
  v36 = v41;
  v37 = v42;
  PXPerformChildLayout(v27, &v36, v4, v35, v24, v16, v17);
  v28 = v42;

  v30 = v28.height;
  *(_QWORD *)&v29 = *(_OWORD *)&v28;
  result.height = v30;
  result.width = v29;
  return result;
}

- (void)prepareForReuse
{
  -[PXSplitLayoutPerformer setLayoutAxis:](self, "setLayoutAxis:", 0);
  -[PXSplitLayoutPerformer setLayoutRatio:](self, "setLayoutRatio:", 0.0);
  -[PXSplitLayoutPerformer setInterItemSpacing:](self, "setInterItemSpacing:", 0.0);
}

- (NSArray)children
{
  return self->children;
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->children, a3);
}

- (int64_t)layoutAxis
{
  return self->_layoutAxis;
}

- (void)setLayoutAxis:(int64_t)a3
{
  self->_layoutAxis = a3;
}

- (double)layoutRatio
{
  return self->_layoutRatio;
}

- (void)setLayoutRatio:(double)a3
{
  self->_layoutRatio = a3;
}

- (double)interItemSpacing
{
  return self->_interItemSpacing;
}

- (void)setInterItemSpacing:(double)a3
{
  self->_interItemSpacing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->children, 0);
}

@end
