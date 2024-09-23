@implementation CRLiOSPresetRenderer

- (CRLiOSPresetRenderer)initWithPresetProvider:(id)a3
{
  id v5;
  CRLiOSPresetRenderer *v6;
  NSOperationQueue *v7;
  NSOperationQueue *swatchOperationQueue;
  uint64_t v9;
  uint64_t v10;
  NSArray *inFlightOperations;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRLiOSPresetRenderer;
  v6 = -[CRLiOSPresetRenderer init](&v13, "init");
  if (v6)
  {
    v7 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    swatchOperationQueue = v6->_swatchOperationQueue;
    v6->_swatchOperationQueue = v7;

    if ((objc_opt_respondsToSelector(v5, "maxConcurrentOperationCount") & 1) != 0)
      v9 = (uint64_t)objc_msgSend(v5, "maxConcurrentOperationCount");
    else
      v9 = -1;
    -[NSOperationQueue setMaxConcurrentOperationCount:](v6->_swatchOperationQueue, "setMaxConcurrentOperationCount:", v9);
    objc_storeStrong((id *)&v6->_presetProvider, a3);
    v10 = objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
    inFlightOperations = v6->_inFlightOperations;
    v6->_inFlightOperations = (NSArray *)v10;

  }
  return v6;
}

- (BOOL)cancelSwatchRenderingIfNeeded
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetRenderer p_swatchOperationQueue](self, "p_swatchOperationQueue"));
  v4 = objc_msgSend(v3, "operationCount");
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetRenderer p_swatchOperationQueue](self, "p_swatchOperationQueue"));
    objc_msgSend(v5, "cancelAllOperations");

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
    -[CRLiOSPresetRenderer setP_inFlightOperations:](self, "setP_inFlightOperations:", v6);

  }
  return v4 != 0;
}

- (void)waitOnSwatchRenderingAndDeliverResultsIfNeededInContext:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (-[CRLiOSPresetRenderer p_shouldWaitBeforeDeliveringSwatchesInContext:](self, "p_shouldWaitBeforeDeliveringSwatchesInContext:", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetRenderer p_swatchOperationQueue](self, "p_swatchOperationQueue"));
    objc_msgSend(v4, "waitUntilAllOperationsAreFinished");

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetRenderer p_inFlightOperations](self, "p_inFlightOperations", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "deliverSwatch");
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  -[CRLiOSPresetRenderer setP_inFlightOperations:](self, "setP_inFlightOperations:", v10);

}

- (BOOL)contextIsLowContrast:(id)a3 forBackgroundColor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetRenderer p_presetProvider](self, "p_presetProvider"));
  v9 = objc_msgSend(v8, "contextIsLowContrast:forBackgroundColor:", v7, v6);

  return v9;
}

- (void)renderSwatchInView:(id)a3 withSize:(CGSize)a4 backgroundColor:(id)a5 atIndexPath:(id)a6 context:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  height = a4.height;
  width = a4.width;
  v28 = a3;
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetRenderer p_presetProvider](self, "p_presetProvider"));
  v17 = objc_msgSend(v16, "suppressesAnimation");

  objc_msgSend(v28, "setExclusiveTouch:", 1);
  if ((v17 & 1) == 0)
    objc_msgSend(v28, "setHidden:", 1);
  objc_msgSend(v28, "crl_prepareForPresetRendering");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetRenderer p_swatchOperationForCellWithSize:atIndexPath:context:](self, "p_swatchOperationForCellWithSize:atIndexPath:context:", v14, v13, width, height));
  objc_msgSend(v18, "setView:", v28);
  v19 = objc_retainAutorelease(v15);
  v20 = objc_msgSend(v19, "CGColor");

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "layer"));
  objc_msgSend(v22, "setBackgroundColor:", v20);

  objc_msgSend(v18, "setSuppressesAnimation:", v17);
  objc_msgSend(v18, "setTargetIndexPath:", v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "view"));
  objc_setAssociatedObject(v23, "CRLSwatchRenderingOperationTargetIndexPathKey", v14, (void *)3);

  v24 = -[CRLiOSPresetRenderer p_shouldWaitBeforeDeliveringSwatchesInContext:](self, "p_shouldWaitBeforeDeliveringSwatchesInContext:", v13);
  if (v24)
    objc_msgSend(v18, "setDeliversImageAutomatically:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetRenderer p_swatchOperationQueue](self, "p_swatchOperationQueue"));
  objc_msgSend(v25, "addOperation:", v18);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetRenderer p_inFlightOperations](self, "p_inFlightOperations"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "arrayByAddingObject:", v18));
  -[CRLiOSPresetRenderer setP_inFlightOperations:](self, "setP_inFlightOperations:", v27);

}

- (id)localizedNameForPresetAtIndexPath:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetRenderer p_presetProvider](self, "p_presetProvider"));
  if ((objc_opt_respondsToSelector(v8, "localizedNameForPresetAtIndexPath:context:") & 1) != 0)
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedNameForPresetAtIndexPath:context:", v6, v7));
  else
    v9 = 0;

  return v9;
}

- (BOOL)isDefaultLocalizedNameForPresetAtIndexPath:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetRenderer p_presetProvider](self, "p_presetProvider"));
  if ((objc_opt_respondsToSelector(v8, "isDefaultLocalizedNameForPresetAtIndexPath:context:") & 1) != 0)
    v9 = objc_msgSend(v8, "isDefaultLocalizedNameForPresetAtIndexPath:context:", v6, v7);
  else
    v9 = 0;

  return v9;
}

- (id)defaultLocalizedNameForPresetAtIndexPath:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetRenderer p_presetProvider](self, "p_presetProvider"));
  if ((objc_opt_respondsToSelector(v8, "defaultLocalizedNameForPresetAtIndexPath:context:") & 1) != 0)
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "defaultLocalizedNameForPresetAtIndexPath:context:", v6, v7));
  else
    v9 = 0;

  return v9;
}

- (id)localizedAccessibilityNameForPresetAtIndexPath:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetRenderer p_presetProvider](self, "p_presetProvider"));
  if ((objc_opt_respondsToSelector(v8, "localizedAccessibilityNameForPresetAtIndexPath:context:") & 1) != 0)
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedAccessibilityNameForPresetAtIndexPath:context:", v6, v7));
  else
    v9 = 0;

  return v9;
}

- (UIEdgeInsets)swatchInsets
{
  void *v2;
  double v3;
  double v4;
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
  UIEdgeInsets result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetRenderer p_presetProvider](self, "p_presetProvider"));
  objc_msgSend(v2, "swatchInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (id)p_swatchOperationForCellWithSize:(CGSize)a3 atIndexPath:(id)a4 context:(id)a5
{
  double width;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  width = a3.width;
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetRenderer p_presetProvider](self, "p_presetProvider"));
  v11 = objc_msgSend(v10, "swatchOperationWithSize:atIndexPath:context:", v9, v8, sub_100063090(width));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  return v12;
}

- (BOOL)p_shouldWaitBeforeDeliveringSwatchesInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetRenderer p_presetProvider](self, "p_presetProvider"));
  if ((objc_opt_respondsToSelector(v5, "shouldWaitBeforeDeliveringSwatchesInContext:") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetRenderer p_presetProvider](self, "p_presetProvider"));
    v7 = objc_msgSend(v6, "shouldWaitBeforeDeliveringSwatchesInContext:", v4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSArray)p_inFlightOperations
{
  return self->_inFlightOperations;
}

- (void)setP_inFlightOperations:(id)a3
{
  objc_storeStrong((id *)&self->_inFlightOperations, a3);
}

- (CRLiOSPresetProviding)p_presetProvider
{
  return self->_presetProvider;
}

- (void)setP_presetProvider:(id)a3
{
  objc_storeStrong((id *)&self->_presetProvider, a3);
}

- (NSOperationQueue)p_swatchOperationQueue
{
  return self->_swatchOperationQueue;
}

- (void)setP_swatchOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_swatchOperationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swatchOperationQueue, 0);
  objc_storeStrong((id *)&self->_presetProvider, 0);
  objc_storeStrong((id *)&self->_inFlightOperations, 0);
}

@end
