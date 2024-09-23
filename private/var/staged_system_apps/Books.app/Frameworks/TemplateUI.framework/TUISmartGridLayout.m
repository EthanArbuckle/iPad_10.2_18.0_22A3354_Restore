@implementation TUISmartGridLayout

- (void)computeLayout
{
  void *v3;
  id v4;
  __objc2_class *v5;
  TUISmartGridGridLayoutManager *v6;
  void *v7;
  void *v8;
  TUISmartGridGridLayoutManager *v9;
  TUISmartGridLayoutManager *layoutManager;
  id v11;
  void *v12;
  TUISmartGridLayoutManager *v13;
  TUISmartGridLayoutManager *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _TUISmartGridLayoutConfiguration *v25;
  double v26;
  _TUISmartGridLayoutConfiguration *v27;
  id v28;

  if (!self->_layoutManager)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v4 = objc_msgSend(v3, "layoutMode");

    switch((unint64_t)v4)
    {
      case 0uLL:
        v5 = TUISmartGridSwooshLayoutManager;
        goto LABEL_8;
      case 1uLL:
        v5 = TUISmartGridGridLayoutManager;
        goto LABEL_8;
      case 2uLL:
        v6 = [TUISmartGridGridLayoutManager alloc];
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "content"));
        v9 = -[TUISmartGridGridLayoutManager initWithContent:](v6, "initWithContent:", v8);

        -[TUISmartGridGridLayoutManager setList:](v9, "setList:", 1);
        layoutManager = self->_layoutManager;
        self->_layoutManager = (TUISmartGridLayoutManager *)v9;
        goto LABEL_9;
      case 3uLL:
        v5 = TUISmartGridOverlapWithOffsetsLayoutManager;
        goto LABEL_8;
      case 4uLL:
        v5 = TUISmartGridFlexRowLayoutManager;
LABEL_8:
        v11 = [v5 alloc];
        layoutManager = (TUISmartGridLayoutManager *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUISmartGridLayoutManager content](layoutManager, "content"));
        v13 = (TUISmartGridLayoutManager *)objc_msgSend(v11, "initWithContent:", v12);
        v14 = self->_layoutManager;
        self->_layoutManager = v13;

LABEL_9:
        break;
      default:
        break;
    }
  }
  -[TUILayout computeWidth](self, "computeWidth");
  v16 = v15;
  v28 = (id)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "scrollBox"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layoutForModel:", v19));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout controller](self, "controller"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "content"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "layoutForModel:", v23));

  v25 = [_TUISmartGridLayoutConfiguration alloc];
  -[TUILayout computeHeight](self, "computeHeight");
  v27 = -[_TUISmartGridLayoutConfiguration initWithWidth:height:box:](v25, "initWithWidth:height:box:", v28, v16, v26);
  -[TUISmartGridLayoutManager setConfiguration:](self->_layoutManager, "setConfiguration:", v27);
  objc_msgSend((id)objc_opt_class(self->_layoutManager), "configureScrollLayout:configuration:", v20, v27);
  objc_msgSend((id)objc_opt_class(self->_layoutManager), "configureContentLayout:configuration:", v24, v27);
  objc_msgSend(v20, "validateLayout");
  if ((objc_opt_respondsToSelector(self->_layoutManager, "shouldInvalidateRenderModelForScrollLayout") & 1) != 0)
    objc_msgSend(v20, "invalidateRenderModel");
  -[TUISmartGridLayoutManager layoutSize](self->_layoutManager, "layoutSize");
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:");

}

- (BOOL)shouldUpdateContainingMetricsForScrollableContent
{
  return 0;
}

- (void)appendChildRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4 transform:(CGAffineTransform *)a5 toModels:(id)a6
{
  __int128 v10;
  id v11;
  id v12;
  TUISmartGridLayoutManager *layoutManager;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)TUISmartGridLayout;
  v10 = *(_OWORD *)&a5->c;
  v16 = *(_OWORD *)&a5->a;
  v17 = v10;
  v18 = *(_OWORD *)&a5->tx;
  v11 = a6;
  v12 = a4;
  -[TUILayout appendChildRenderModelCompatibleWithKind:context:transform:toModels:](&v19, "appendChildRenderModelCompatibleWithKind:context:transform:toModels:", a3, v12, &v16, v11);
  layoutManager = self->_layoutManager;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box", v16, v17, v18, v19.receiver, v19.super_class));
  v15 = *(_OWORD *)&a5->c;
  v16 = *(_OWORD *)&a5->a;
  v17 = v15;
  v18 = *(_OWORD *)&a5->tx;
  -[TUISmartGridLayoutManager appendNonScrollableAdornmentRenderModelsCompatibleWithKind:transform:context:box:toModels:](layoutManager, "appendNonScrollableAdornmentRenderModelsCompatibleWithKind:transform:context:box:toModels:", a3, &v16, v12, v14, v11);

}

- (double)columnLayoutProviderWidthForColumnSpan:(unint64_t)a3
{
  double result;

  if ((objc_opt_respondsToSelector(self->_layoutManager, "widthForColumnSpan:") & 1) == 0)
    return NAN;
  -[TUISmartGridLayoutManager widthForColumnSpan:](self->_layoutManager, "widthForColumnSpan:", a3);
  return result;
}

- (unint64_t)columnLayoutProviderColumnSpanForColumnSpan:(id)a3
{
  TUISmartGridLayoutManager *layoutManager;
  id v4;
  void *v5;
  id v6;

  layoutManager = self->_layoutManager;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUISmartGridLayoutManager configuration](layoutManager, "configuration"));
  v6 = objc_msgSend(v5, "unsignedIntegerWithSpec:", v4);

  return (unint64_t)v6;
}

- (unint64_t)columnLayoutProviderColumnsForContainerFraction:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  unint64_t v14;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUISmartGridLayoutManager configuration](self->_layoutManager, "configuration"));
  objc_msgSend(v5, "width");
  v7 = v6;
  -[TUISmartGridLayoutManager computedColumnSpacing](self->_layoutManager, "computedColumnSpacing");
  v9 = v8 + v7 * a3;
  -[TUISmartGridLayoutManager computedColumnWidth](self->_layoutManager, "computedColumnWidth");
  v11 = v10;
  -[TUISmartGridLayoutManager computedColumnSpacing](self->_layoutManager, "computedColumnSpacing");
  v13 = vcvtpd_u64_f64(v9 / (v11 + v12));

  if (v13 <= 1)
    v14 = 1;
  else
    v14 = v13;
  if (v14 <= (unint64_t)-[TUISmartGridLayoutManager computedColumns](self->_layoutManager, "computedColumns"))
    return v14;
  else
    return (unint64_t)-[TUISmartGridLayoutManager computedColumns](self->_layoutManager, "computedColumns");
}

- (unint64_t)ruleLayoutAxis
{
  return (unint64_t)-[TUISmartGridLayoutManager ruleLayoutAxis](self->_layoutManager, "ruleLayoutAxis");
}

- (TUISmartGridLayoutManager)layoutManager
{
  return self->_layoutManager;
}

- (void)setLayoutManager:(id)a3
{
  objc_storeStrong((id *)&self->_layoutManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutManager, 0);
}

@end
