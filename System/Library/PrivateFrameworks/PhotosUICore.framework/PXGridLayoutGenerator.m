@implementation PXGridLayoutGenerator

- (PXGridLayoutGenerator)initWithMetrics:(id)a3
{
  PXGridLayoutGenerator *v3;
  PXGridLayoutGenerator *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  double v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  NSIndexSet *geometrySet;
  double v32;
  double v33;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)PXGridLayoutGenerator;
  v3 = -[PXGridLayoutGenerator initWithMetrics:](&v34, sel_initWithMetrics_, a3);
  v4 = v3;
  if (!v3)
    return v4;
  -[PXGridLayoutGenerator metrics](v3, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentInsets");
  v7 = v6;
  v33 = v8;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v5, "itemSize");
  v32 = v13;
  v15 = v14;
  objc_msgSend(v5, "interItemSpacing");
  v17 = v16;
  v19 = v18;
  objc_msgSend(v5, "referenceSize");
  v21 = v20;
  v23 = v22;
  v24 = objc_msgSend(v5, "axis");
  if (v24 == 2)
  {
    v25 = v19 + v23 - (v7 + v10) + 0.00000999999975;
    v26 = v15 + v19;
  }
  else
  {
    if (v24 != 1)
    {
      v27 = 1;
      goto LABEL_8;
    }
    v25 = v17 + v21 - (v33 + v12) + 0.00000999999975;
    v26 = v32 + v17;
  }
  v27 = vcvtmd_s64_f64(v25 / v26);
LABEL_8:
  v4->_numberOfItemsWide = v27;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "displaysHeaderTile"))
    objc_msgSend(v28, "addIndex:", 2);
  if (objc_msgSend(v5, "additionalTileCount"))
    objc_msgSend(v28, "addIndex:", 1);
  v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexSet:", v28);
  geometrySet = v4->_geometrySet;
  v4->_geometrySet = (NSIndexSet *)v29;

  return v4;
}

- (id)geometryKinds
{
  return self->_geometrySet;
}

- (unint64_t)numberOfGeometriesWithKind:(int64_t)a3
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v8;
  void *v10;
  objc_super v11;

  switch(a3)
  {
    case 0:
      v11.receiver = self;
      v11.super_class = (Class)PXGridLayoutGenerator;
      return -[PXGridLayoutGenerator numberOfGeometriesWithKind:](&v11, sel_numberOfGeometriesWithKind_, 0);
    case 1:
      -[PXGridLayoutGenerator metrics](self, "metrics");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "additionalTileCount");

      return v6;
    case 2:
      -[PXGridLayoutGenerator metrics](self, "metrics");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v8, "displaysHeaderTile");

      return v4;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGridLayoutGenerator.m"), 100, CFSTR("Footer tiles not supported"));

      return 0;
    default:
      return 0;
  }
}

- (CGSize)estimatedSize
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGSize result;

  -[PXGridLayoutGenerator metrics](self, "metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C9D820];
  v38 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  objc_msgSend(v4, "itemSize");
  v7 = v6;
  v37 = v8;
  objc_msgSend(v4, "interItemSpacing");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "contentInsets");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = objc_msgSend(v4, "axis");
  if (v21)
  {
    if (v21 == 2)
    {
      objc_msgSend(v4, "referenceSize");
      v29 = v28;
      v30 = v20 + v16 - (v10 - (v7 + v10) * 3.0);
      objc_msgSend(v4, "headerSize");
      v32 = v31;
      objc_msgSend(v4, "footerSize");
      v34 = v32 + v33;
      v22 = v29;
      v5 = v30 + v34;
    }
    else
    {
      v22 = v38;
      if (v21 == 1)
      {
        objc_msgSend(v4, "referenceSize");
        v5 = v23;
        objc_msgSend(v4, "headerSize");
        v25 = v24;
        objc_msgSend(v4, "footerSize");
        v22 = v18 + v14 - (v12 - (v37 + v12) * 3.0) + v25 + v26;
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGridLayoutGenerator.m"), 130, CFSTR("axis == PXAxisUndefined"));

    v22 = v38;
  }

  v35 = v5;
  v36 = v22;
  result.height = v36;
  result.width = v35;
  return result;
}

- (CGSize)size
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  int64_t numberOfItemsWide;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGSize result;

  -[PXGridLayoutGenerator metrics](self, "metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C9D820];
  v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  objc_msgSend(v4, "itemSize");
  v39 = v8;
  v40 = v7;
  objc_msgSend(v4, "interItemSpacing");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "contentInsets");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = objc_msgSend(v4, "axis");
  v22 = -[PXGridLayoutGenerator itemCount](self, "itemCount");
  -[PXGridLayoutGenerator metrics](self, "metrics");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "additionalTileCount");

  if (v21)
  {
    v25 = v24 + v22;
    if (v21 == 2)
    {
      numberOfItemsWide = self->_numberOfItemsWide;
      objc_msgSend(v4, "referenceSize");
      v5 = v33;
      if (numberOfItemsWide >= 1)
        v6 = v20 + v16 - (v10 - ceil((double)v25 / (double)numberOfItemsWide) * (v40 + v10));
      objc_msgSend(v4, "headerSize");
      v35 = v34;
      objc_msgSend(v4, "footerSize");
      v6 = v6 + v35 + v36;
    }
    else if (v21 == 1)
    {
      v26 = ceil((double)v25 / (double)self->_numberOfItemsWide);
      objc_msgSend(v4, "referenceSize");
      v6 = v27;
      if (v26 > 0.0)
        v5 = v18 + v14 - (v12 - v26 * (v39 + v12));
      objc_msgSend(v4, "headerSize");
      v29 = v28;
      objc_msgSend(v4, "footerSize");
      v5 = v5 + v29 + v30;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGridLayoutGenerator.m"), 174, CFSTR("axis == PXAxisUndefined"));

  }
  v37 = v6;
  v38 = v5;
  result.height = v38;
  result.width = v37;
  return result;
}

- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5
{
  id v7;

  if (a4.length)
  {
    switch(a5)
    {
      case 0:
        -[PXGridLayoutGenerator _getContentGeometries:inRange:](self, "_getContentGeometries:inRange:", a3, a4.location);
        break;
      case 1:
        -[PXGridLayoutGenerator _getAdditionalGeometries:inRange:](self, "_getAdditionalGeometries:inRange:", a3, a4.location);
        break;
      case 2:
        -[PXGridLayoutGenerator _getHeaderGeometries:inRange:](self, "_getHeaderGeometries:inRange:", a3, a4.location);
        break;
      case 3:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4.location);
        v7 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGridLayoutGenerator.m"), 204, CFSTR("Footer tiles not supported"));

        break;
      default:
        return;
    }
  }
}

- (void)_getContentGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v9;
  double v10;
  unint64_t v11;
  _PXLayoutGeometry *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSRange v18;

  length = a4.length;
  location = a4.location;
  v9 = -[PXGridLayoutGenerator itemCount](self, "itemCount");
  -[PXGridLayoutGenerator metrics](self, "metrics");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "referenceSize");
  if (v10 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGridLayoutGenerator.m"), 212, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[metrics referenceSize].width > 0"));

    if (v9)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGridLayoutGenerator.m"), 213, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemCount > 0"));

    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_10;
LABEL_3:
  v11 = length + location - 1;
  if ((v11 & 0x8000000000000000) != 0 || v11 >= v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18.location = location;
    v18.length = length;
    NSStringFromRange(v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGridLayoutGenerator.m"), 215, CFSTR("range %@ out of bounds %lu"), v16, v9);

  }
  if (location <= v11)
  {
    v12 = &a3[location];
    do
    {
      -[PXGridLayoutGenerator getGeometry:forItemAtIndex:](self, "getGeometry:forItemAtIndex:", v12, location);
      v12->var5 = 0;
      ++location;
      ++v12;
    }
    while (location <= v11);
  }

}

- (void)_getHeaderGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  CGFloat v19;
  CGFloat v20;
  uint64_t v21;
  __int128 v22;
  void *v23;
  double v24;
  double v25;
  id v26;

  if (a4.length != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4.location);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGridLayoutGenerator.m"), 225, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("range.length == 1"));

  }
  -[PXGridLayoutGenerator metrics](self, "metrics");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "headerSize");
  v24 = v8;
  v25 = v7;
  objc_msgSend(v26, "contentInsets");
  objc_msgSend(v26, "referenceSize");
  PXEdgeInsetsInsetSize();
  v10 = v9;
  v12 = v11;
  v13 = objc_msgSend(v26, "axis");
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  if (v13)
  {
    if (v13 == 1)
      v16 = v10;
    else
      v16 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v17 = v24;
    if (v13 != 1)
      v17 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    if (v13 == 2)
      v14 = v25;
    else
      v14 = v16;
    if (v13 == 2)
      v15 = v12;
    else
      v15 = v17;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGridLayoutGenerator.m"), 243, CFSTR("axis == PXAxisUndefined"));

  }
  a3->var2.width = v14;
  a3->var2.height = v15;
  a3->var0 = 0;
  PXRectGetCenter();
  a3->var1.x = v19;
  a3->var1.y = v20;
  v21 = MEMORY[0x1E0C9BAA8];
  v22 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&a3->var3.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&a3->var3.c = v22;
  *(_OWORD *)&a3->var3.tx = *(_OWORD *)(v21 + 32);
  a3->var4 = 0.0;
  a3->var5 = 2;

}

- (void)_getAdditionalGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  unint64_t v10;
  double v11;
  unint64_t v12;
  _PXLayoutGeometry *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSRange v18;

  length = a4.length;
  location = a4.location;
  v9 = -[PXGridLayoutGenerator itemCount](self, "itemCount");
  -[PXGridLayoutGenerator metrics](self, "metrics");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v17, "additionalTileCount");
  objc_msgSend(v17, "referenceSize");
  if (v11 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGridLayoutGenerator.m"), 262, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[metrics referenceSize].width > 0"));

  }
  v12 = length + location - 1;
  if ((v12 & 0x8000000000000000) != 0 || v12 >= v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18.location = location;
    v18.length = length;
    NSStringFromRange(v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGridLayoutGenerator.m"), 264, CFSTR("range %@ out of bounds %lu"), v16, v10);

  }
  if (location <= v12)
  {
    v13 = &a3[location];
    do
    {
      -[PXGridLayoutGenerator getGeometry:forItemAtIndex:](self, "getGeometry:forItemAtIndex:", v13, v9 + location);
      v13->var5 = 1;
      ++location;
      ++v13;
    }
    while (location <= v12);
  }

}

- (void)getGeometry:(_PXLayoutGeometry *)a3 forItemAtIndex:(unint64_t)a4
{
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  uint64_t v15;
  __int128 v16;
  id v17;

  -[PXGridLayoutGenerator metrics](self, "metrics");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "headerSize");
  objc_msgSend(v17, "headerSpacing");
  if (!objc_msgSend(v17, "axis"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGridLayoutGenerator.m"), 302, CFSTR("axis == PXAxisUndefined"));

  }
  objc_msgSend(v17, "itemSize");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v17, "interItemSpacing");
  objc_msgSend(v17, "contentInsets");
  a3->var2.width = v10;
  a3->var2.height = v12;
  a3->var0 = a4;
  PXRectGetCenter();
  a3->var1.x = v13;
  a3->var1.y = v14;
  v15 = MEMORY[0x1E0C9BAA8];
  v16 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&a3->var3.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&a3->var3.c = v16;
  *(_OWORD *)&a3->var3.tx = *(_OWORD *)(v15 + 32);
  a3->var4 = 0.0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geometrySet, 0);
}

@end
