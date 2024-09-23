@implementation BKDisplayAnnotationRenderer

- (BOOL)shouldRenderWithSupernode
{
  return 0;
}

- (void)locationDidChange
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;
  CGRect v35;
  CGRect v36;

  v34 = (id)objc_claimAutoreleasedReturnValue(-[BKDisplayAnnotationRenderer layer](self, "layer"));
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayAnnotationRenderer annotation](self, "annotation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "location"));
  if (objc_msgSend(v4, "definedInReferenceSpace"))
  {
    objc_msgSend(v4, "superBias");
    objc_msgSend(v34, "setAnchorPoint:");
    objc_msgSend(v4, "point");
    objc_msgSend(v34, "setPosition:");
  }
  else
  {
    if (objc_msgSend(v4, "shouldAutoposition"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "superlayer"));
      objc_msgSend(v5, "bounds");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      objc_msgSend(v4, "superBias");
      v15 = v14;
      v17 = v16;
      v35.origin.x = v7;
      v35.origin.y = v9;
      v35.size.width = v11;
      v35.size.height = v13;
      v18 = CGRectGetMaxX(v35) * v15;
      v36.origin.x = v7;
      v36.origin.y = v9;
      v36.size.width = v11;
      v36.size.height = v13;
      v19 = v17 * CGRectGetMaxY(v36);
      objc_msgSend(v34, "setAnchorPoint:", v15, v17);
      objc_msgSend(v34, "setPosition:", v18, v19);
    }
    else
    {
      objc_msgSend(v4, "point");
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "annotationController"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "display"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "uniqueId"));

      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "context"));
      v23 = objc_msgSend(v22, "contextId");

      sub_10000F7A0(v21);
      v26 = sub_10000F560((uint64_t)v23, v21, v24, v25);
      v28 = v27;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "superlayer"));
      objc_msgSend(v29, "convertPoint:fromLayer:", 0, v26, v28);
      v31 = v30;
      v33 = v32;

      objc_msgSend(v4, "superBias");
      objc_msgSend(v34, "setAnchorPoint:");
      objc_msgSend(v34, "setPosition:", v31, v33);

    }
  }
  +[CATransaction commit](CATransaction, "commit");

}

- (void)didRemoveAnnotation
{
  CALayer *layer;

  -[CALayer removeFromSuperlayer](self->_layer, "removeFromSuperlayer");
  layer = self->_layer;
  self->_layer = 0;

  self->_shouldReapplyStyles = 1;
}

- (void)styleSheetDidChange
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKDisplayAnnotationRenderer annotation](self, "annotation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "styleSheet"));
  self->_shouldReapplyStyles = 1;
  if (self->_layer)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayAnnotationRenderer layer](self, "layer"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "content"));
    objc_msgSend(v3, "applyToLayer:forContent:", v4, v5);

    -[CALayer setNeedsDisplay](self->_layer, "setNeedsDisplay");
  }

}

- (CALayer)layer
{
  CALayer **p_layer;
  CALayer *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CALayer *v16;

  p_layer = &self->_layer;
  v4 = self->_layer;
  WeakRetained = objc_loadWeakRetained((id *)p_layer - 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "annotationController"));
  v7 = v6;
  if (v4)
    v8 = 1;
  else
    v8 = v6 == 0;
  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootLayer"));
    objc_msgSend(v9, "rasterizationScale");
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "styleSheet"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "content"));
    v4 = (CALayer *)objc_msgSend(v12, "newLayerForContent:scale:", v13, v11);

    objc_storeStrong((id *)p_layer, v4);
    self->_shouldReapplyStyles = 1;

  }
  if (v4 && self->_shouldReapplyStyles)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "styleSheet"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "content"));
    objc_msgSend(v14, "applyToLayer:forContent:", v4, v15);

    self->_shouldReapplyStyles = 0;
  }
  v16 = *p_layer;

  return v16;
}

- (void)sizeLayerToFitAtScale:(double)a3
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKDisplayAnnotationRenderer layer](self, "layer"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_annotation);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "styleSheet"));
  objc_msgSend(v6, "sizeLayer:toFitAtScale:", v7, a3);

}

- (void)regenerateLayerTree
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  unsigned __int8 v12;
  void *v13;
  unsigned int v14;
  id v15;
  id v16;
  id v17;

  v17 = (id)objc_claimAutoreleasedReturnValue(-[BKDisplayAnnotationRenderer annotation](self, "annotation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "location"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "annotationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootLayer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transformLayer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "referenceSpaceLayer"));
  objc_msgSend(v5, "rasterizationScale");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayAnnotationRenderer layer](self, "layer"));
  v11 = v6;
  v12 = objc_msgSend(v3, "definedInReferenceSpace");
  v13 = v7;
  if ((v12 & 1) != 0 || (v14 = objc_msgSend(v3, "inhibitRotation"), v13 = v5, v15 = v11, v14))
  {
    v15 = v13;

  }
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "superlayer"));

  if (v16 != v15)
  {
    objc_msgSend(v10, "removeFromSuperlayer");
    objc_msgSend(v15, "addSublayer:", v10);
  }
  -[BKDisplayAnnotationRenderer sizeLayerToFitAtScale:](self, "sizeLayerToFitAtScale:", v9);
  -[BKDisplayAnnotationRenderer locationDidChange](self, "locationDidChange");

}

- (BKDisplayAnnotation)annotation
{
  return (BKDisplayAnnotation *)objc_loadWeakRetained((id *)&self->_annotation);
}

- (void)setAnnotation:(id)a3
{
  objc_storeWeak((id *)&self->_annotation, a3);
}

- (void)setLayer:(id)a3
{
  objc_storeStrong((id *)&self->_layer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layer, 0);
  objc_destroyWeak((id *)&self->_annotation);
}

@end
