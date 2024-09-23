@implementation PXCMMLayoutGenerator

+ (id)layoutGeneratorForLayoutType:(int64_t)a3 withReferenceSize:(CGSize)a4 additionalTileCount:(unint64_t)a5 headerHeight:(double)a6 itemSize:(CGSize)a7 interItemSpacing:(CGSize)a8 contentInsets:(UIEdgeInsets)a9
{
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  switch(a3)
  {
    case 0:
      objc_msgSend(a1, "_defaultGridLayoutGeneratorWithReferenceSize:additionalTileCount:headerHeight:itemSize:interItemSpacing:contentInsets:", a5, a4.width, a4.height, a6, a7.width, a7.height, a8.width, a8.height, *(_QWORD *)&a9.top, *(_QWORD *)&a9.left, *(_QWORD *)&a9.bottom, *(_QWORD *)&a9.right, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      return v11;
    case 1:
      objc_msgSend(a1, "_defaultEditorialLayoutGeneratorWithReferenceSize:headerHeight:interItemSpacing:", a4.width, a4.height, a6, a8.width, a8.height);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      return v11;
    case 2:
      v12 = 2;
      goto LABEL_9;
    case 3:
      v12 = 3;
      goto LABEL_9;
    case 4:
      v12 = 4;
LABEL_9:
      objc_msgSend(a1, "_gridLayoutGeneratorWithReferenceSize:columnCount:additionalTileCount:headerHeight:interItemSpacing:", v12, a5, a4.width, a4.height, a6, a8.width, a8.height);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v11 = 0;
      break;
  }
  return v11;
}

+ (id)_defaultGridLayoutGeneratorWithReferenceSize:(CGSize)a3 additionalTileCount:(unint64_t)a4 headerHeight:(double)a5 itemSize:(CGSize)a6 interItemSpacing:(CGSize)a7 contentInsets:(UIEdgeInsets)a8
{
  double height;
  double width;
  double v12;
  double v13;
  PXGridLayoutMetrics *v14;
  PXGridLayoutGenerator *v15;

  height = a6.height;
  width = a6.width;
  v12 = a3.height;
  v13 = a3.width;
  v14 = objc_alloc_init(PXGridLayoutMetrics);
  -[PXGridLayoutMetrics setAxis:](v14, "setAxis:", 1);
  -[PXLayoutMetrics setReferenceSize:](v14, "setReferenceSize:", v13, v12);
  -[PXGridLayoutMetrics setDisplaysHeaderTile:](v14, "setDisplaysHeaderTile:", a5 > 0.0);
  -[PXGridLayoutMetrics setHeaderSize:](v14, "setHeaderSize:", a5, a5);
  -[PXGridLayoutMetrics setItemSize:](v14, "setItemSize:", width, height);
  -[PXGridLayoutMetrics setInterItemSpacing:](v14, "setInterItemSpacing:", a7.width, a7.height);
  -[PXGridLayoutMetrics setContentInsets:](v14, "setContentInsets:", a8.top, a8.left, a8.bottom, a8.right);
  -[PXGridLayoutMetrics setAdditionalTileCount:](v14, "setAdditionalTileCount:", a4);
  v15 = -[PXGridLayoutGenerator initWithMetrics:]([PXGridLayoutGenerator alloc], "initWithMetrics:", v14);

  return v15;
}

+ (id)_gridLayoutGeneratorWithReferenceSize:(CGSize)a3 columnCount:(unint64_t)a4 additionalTileCount:(unint64_t)a5 headerHeight:(double)a6 interItemSpacing:(CGSize)a7
{
  double height;
  double width;
  double v12;
  double v13;
  PXGridLayoutMetrics *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  PXGridLayoutGenerator *v19;
  void *v23;

  height = a7.height;
  width = a7.width;
  v12 = a3.height;
  v13 = a3.width;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXCMMLayoutGenerator.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("columnCount > 0"));

  }
  v14 = objc_alloc_init(PXGridLayoutMetrics);
  -[PXGridLayoutMetrics setAxis:](v14, "setAxis:", 1);
  -[PXLayoutMetrics setReferenceSize:](v14, "setReferenceSize:", v13, v12);
  -[PXGridLayoutMetrics setDisplaysHeaderTile:](v14, "setDisplaysHeaderTile:", a6 > 0.0);
  -[PXGridLayoutMetrics setHeaderSize:](v14, "setHeaderSize:", a6, a6);
  -[PXGridLayoutMetrics setInterItemSpacing:](v14, "setInterItemSpacing:", width, height);
  -[PXGridLayoutMetrics setContentInsets:](v14, "setContentInsets:", *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
  -[PXGridLayoutMetrics setAdditionalTileCount:](v14, "setAdditionalTileCount:", a5);
  -[PXLayoutMetrics referenceSize](v14, "referenceSize");
  -[PXGridLayoutMetrics contentInsets](v14, "contentInsets");
  PXEdgeInsetsInsetSize();
  v16 = v15;
  -[PXGridLayoutMetrics interItemSpacing](v14, "interItemSpacing");
  v18 = (v16 - (double)(uint64_t)(a4 - 1) * v17) / (double)(uint64_t)a4;
  -[PXGridLayoutMetrics setItemSize:](v14, "setItemSize:", v18, v18);
  v19 = -[PXGridLayoutGenerator initWithMetrics:]([PXGridLayoutGenerator alloc], "initWithMetrics:", v14);

  return v19;
}

+ (id)_defaultEditorialLayoutGeneratorWithReferenceSize:(CGSize)a3 headerHeight:(double)a4 interItemSpacing:(CGSize)a5
{
  double width;
  double height;
  double v8;
  PXEditorialLayoutMetrics *v9;
  PXEditorialLayoutGenerator *v10;

  width = a5.width;
  height = a3.height;
  v8 = a3.width;
  v9 = objc_alloc_init(PXEditorialLayoutMetrics);
  -[PXLayoutMetrics setReferenceSize:](v9, "setReferenceSize:", v8, height);
  -[PXEditorialLayoutMetrics setInterTileSpacing:](v9, "setInterTileSpacing:", width);
  -[PXEditorialLayoutMetrics setNumberOfColumns:](v9, "setNumberOfColumns:", 3);
  -[PXEditorialLayoutMetrics setLowerItemCountThreshold:](v9, "setLowerItemCountThreshold:", 6);
  -[PXEditorialLayoutMetrics setPadding:](v9, "setPadding:", *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
  -[PXEditorialLayoutMetrics setHeaderHeight:](v9, "setHeaderHeight:", a4);
  v10 = -[PXEditorialLayoutGenerator initWithMetrics:]([PXEditorialLayoutGenerator alloc], "initWithMetrics:", v9);

  return v10;
}

@end
