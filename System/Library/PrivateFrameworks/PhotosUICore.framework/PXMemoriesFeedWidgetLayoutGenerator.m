@implementation PXMemoriesFeedWidgetLayoutGenerator

- (PXMemoriesFeedWidgetLayoutGenerator)initWithMetrics:(id)a3
{
  id v5;
  PXMemoriesFeedWidgetLayoutGenerator *v6;
  PXMemoriesFeedWidgetLayoutGenerator *v7;
  double *p_top;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v39;
  objc_super v40;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesFeedWidgetLayoutGenerator.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[metrics isKindOfClass:[PXMemoriesFeedWidgetLayoutMetrics class]]"));

  }
  v40.receiver = self;
  v40.super_class = (Class)PXMemoriesFeedWidgetLayoutGenerator;
  v6 = -[PXMemoriesFeedLayoutGenerator initWithMetrics:](&v40, sel_initWithMetrics_, v5);
  v7 = v6;
  if (v6)
  {
    p_top = &v6->_context.contentInsets.top;
    v9 = v5;
    objc_msgSend(v9, "contentInsets");
    v11 = v10;
    v13 = v12;
    objc_msgSend(v9, "interitemSpacing");
    v15 = v14;
    v17 = v16;
    v18 = objc_msgSend(v9, "numberOfColumns");
    v19 = objc_msgSend(v9, "numberOfRows");
    v20 = objc_msgSend(v9, "layoutAxis");
    objc_msgSend(v9, "referenceSize");
    v22 = v21;
    v24 = v23;

    v25 = *MEMORY[0x1E0C9D820];
    v26 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (v24 == v26 && v22 == v25 || v18 == 0)
    {
      v18 = 0;
      v19 = 0;
      v32 = *(double *)off_1E50B8020;
      v35 = *((double *)off_1E50B8020 + 1);
      v20 = 1;
      v33 = *((double *)off_1E50B8020 + 2);
      v36 = *((double *)off_1E50B8020 + 3);
      v15 = *MEMORY[0x1E0C9D820];
      v17 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      v22 = *MEMORY[0x1E0C9D820];
      v37 = v17;
    }
    else
    {
      v29 = v15 * (double)(v18 - 1);
      v25 = floor((v22 - (v11 + v13) - v29) / (double)v18);
      v30 = (double)(v19 - 1);
      v31 = v24 - v25 * (double)v19 - v17 * v30;
      v32 = floor(v31 * 0.5);
      v33 = v31 - v32;
      v34 = v22 - (v29 + (double)v18 * v25);
      v35 = floor(v34 * 0.5);
      v36 = v34 - v35;
      v37 = v33 + v32 + (double)v19 * v25 + v30 * v17;
      v26 = v25;
    }
    *p_top = v32;
    v7->_context.contentInsets.left = v35;
    v7->_context.contentInsets.bottom = v33;
    v7->_context.contentInsets.right = v36;
    v7->_context.itemSize.width = v25;
    v7->_context.itemSize.height = v26;
    v7->_context.interitemSpacing.width = v15;
    v7->_context.interitemSpacing.height = v17;
    v7->_context.size.width = v22;
    v7->_context.size.height = v37;
    v7->_context.numberOfColumns = v18;
    v7->_context.numberOfRows = v19;
    v7->_context.layoutAxis = v20;
  }

  return v7;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_context.size.width;
  height = self->_context.size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)geometryKinds
{
  if (geometryKinds_onceToken != -1)
    dispatch_once(&geometryKinds_onceToken, &__block_literal_global_212580);
  return (id)geometryKinds_kinds;
}

- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  CGFloat *p_height;
  _OWORD *v11;
  double left;
  double top;
  double width;
  double height;
  double v16;
  double v17;
  int64_t layoutAxis;
  unint64_t v19;
  unint64_t v20;
  unint64_t numberOfColumns;
  unint64_t numberOfRows;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  void *v32;
  void *v33;
  void *v34;
  CGRect v35;

  length = a4.length;
  location = a4.location;
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesFeedWidgetLayoutGenerator.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXMemoriesFeedLayoutItemKindContent == kind"));

  }
  if (location < location + length)
  {
    p_height = &a3[location].var7.height;
    v11 = (_OWORD *)MEMORY[0x1E0C9BAA8];
    do
    {
      if (location >= -[PXMemoriesFeedWidgetLayoutGenerator numberOfGeometriesWithKind:](self, "numberOfGeometriesWithKind:", a5))break;
      top = self->_context.contentInsets.top;
      left = self->_context.contentInsets.left;
      width = self->_context.itemSize.width;
      height = self->_context.itemSize.height;
      v17 = self->_context.interitemSpacing.width;
      v16 = self->_context.interitemSpacing.height;
      layoutAxis = self->_context.layoutAxis;
      switch(layoutAxis)
      {
        case 1:
          numberOfColumns = self->_context.numberOfColumns;
          v20 = location / numberOfColumns;
          v19 = location % numberOfColumns;
          break;
        case 2:
          numberOfRows = self->_context.numberOfRows;
          v19 = location / numberOfRows;
          v20 = location % numberOfRows;
          break;
        case 0:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", left, top, width, height, v16, v17);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGRect _ItemRectForItemAtIndex(NSUInteger, _LayoutContext)");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("PXMemoriesFeedWidgetLayoutGenerator.m"), 154, CFSTR("Can't determine rect for unknown axis"));

          abort();
        default:
          v19 = 0;
          v20 = 0;
          break;
      }
      v23 = left + (double)v19 * (width + v17);
      v24 = top + (double)v20 * (height + v16);
      v35 = CGRectIntegral(*(CGRect *)(&width - 2));
      v25 = v35.size.width;
      v26 = v35.size.height;
      PXRectGetCenter();
      *((_QWORD *)p_height - 18) = location;
      *((_QWORD *)p_height - 17) = v27;
      *((_QWORD *)p_height - 16) = v28;
      *(p_height - 15) = v25;
      *(p_height - 14) = v26;
      v29 = v11[1];
      *(_OWORD *)(p_height - 13) = *v11;
      *(_OWORD *)(p_height - 11) = v29;
      *(_OWORD *)(p_height - 9) = v11[2];
      *(p_height - 7) = 0.0;
      *((_QWORD *)p_height - 6) = a5;
      v30 = *(_OWORD *)off_1E50B86D0;
      *(_OWORD *)(p_height - 3) = *((_OWORD *)off_1E50B86D0 + 1);
      *(_OWORD *)(p_height - 5) = v30;
      ++location;
      *(p_height - 1) = v25;
      *p_height = v26;
      p_height += 19;
      --length;
    }
    while (length);
  }
}

void __52__PXMemoriesFeedWidgetLayoutGenerator_geometryKinds__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)geometryKinds_kinds;
  geometryKinds_kinds = v0;

}

@end
