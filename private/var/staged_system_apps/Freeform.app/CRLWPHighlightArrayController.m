@implementation CRLWPHighlightArrayController

- (CRLWPHighlightArrayController)initWithZOrder:(double)a3 delegate:(id)a4
{
  id v6;
  CRLWPHighlightArrayController *v7;
  CRLWPHighlightArrayController *v8;
  __int128 v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CRLWPHighlightArrayController;
  v7 = -[CRLWPHighlightArrayController init](&v11, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v8->_zOrder = a3;
    v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v8->_transform.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v8->_transform.c = v9;
    *(_OWORD *)&v8->_transform.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    v8->_viewScale = 1.0;
    v8->_layerCreationLock._os_unfair_lock_opaque = 0;
    __dmb(0xBu);
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[CRLWPHighlightArrayController disconnect](self, "disconnect");
  -[CRLWPHighlightArrayController reset](self, "reset");
  v3.receiver = self;
  v3.super_class = (Class)CRLWPHighlightArrayController;
  -[CRLWPHighlightArrayController dealloc](&v3, "dealloc");
}

- (void)startAnimating
{
  if (-[NSMutableArray count](self->_controllers, "count") && self->_shouldPulsate && !self->_pulsating)
  {
    -[NSMutableArray makeObjectsPerformSelector:](self->_controllers, "makeObjectsPerformSelector:", "startAnimating");
    self->_pulsating = 1;
  }
}

- (void)stop
{
  id v3;

  if (!self->_stopping)
  {
    self->_stopping = 1;
    if (-[NSMutableArray count](self->_controllers, "count"))
    {
      if (self->_shouldPulsate)
      {
        self->_pulsating = 0;
        v3 = -[NSMutableArray copy](self->_controllers, "copy");
        objc_msgSend(v3, "makeObjectsPerformSelector:", "stop");

      }
    }
    self->_stopping = 0;
  }
}

- (void)pulseAnimationDidStopForPulse:(id)a3
{
  id WeakRetained;

  self->_pulsating = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pulseAnimationDidStop:", self);

}

- (unint64_t)pulseAnimationStyle:(id)a3
{
  CRLWPHighlightArrayControllerProtocol **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "pulseAnimationStyle:");

  if ((v6 & 1) == 0)
    return 0;
  v7 = objc_loadWeakRetained((id *)p_delegate);
  v8 = objc_msgSend(v7, "pulseAnimationStyle:", self);

  return (unint64_t)v8;
}

- (void)disconnect
{
  objc_storeWeak((id *)&self->_delegate, 0);
  -[NSMutableArray makeObjectsPerformSelector:](self->_controllers, "makeObjectsPerformSelector:", "disconnect");
}

- (void)reset
{
  NSMutableArray *controllers;
  NSMutableArray *layers;

  -[NSMutableArray makeObjectsPerformSelector:](self->_controllers, "makeObjectsPerformSelector:", "reset");
  controllers = self->_controllers;
  self->_controllers = 0;

  layers = self->_layers;
  self->_layers = 0;

}

- (id)buildHighlightsForSearchReferences:(id)a3 contentsScaleForLayers:(double)a4
{
  return -[CRLWPHighlightArrayController buildHighlightsForSearchReferences:contentsScaleForLayers:shouldCreateBackground:backgroundColor:](self, "buildHighlightsForSearchReferences:contentsScaleForLayers:shouldCreateBackground:backgroundColor:", a3, 0, 0, a4);
}

- (id)buildHighlightsForSearchReferences:(id)a3 contentsScaleForLayers:(double)a4 shouldCreateBackground:(BOOL)a5 backgroundColor:(CGColor *)a6
{
  id v9;
  NSMutableArray *v10;
  NSMutableArray *layers;
  id v12;
  _BOOL8 v13;
  id v14;
  void *i;
  uint64_t v16;
  CRLPulseAnimationController *v17;
  CRLPulseAnimationController *v18;
  id WeakRetained;
  const CGPath *v20;
  id v21;
  void *v22;
  void *v23;
  NSMutableArray *controllers;
  NSMutableArray *v25;
  NSMutableArray *v26;
  _BOOL4 v28;
  os_unfair_lock_t lock;
  id obj;
  uint64_t v31;
  id v32;
  _OWORD v33[6];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  CGRect BoundingBox;

  v28 = a5;
  v9 = a3;
  v32 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v9, "count")));
  os_unfair_lock_lock(&self->_layerCreationLock);
  if (!self->_layers)
  {
    v10 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v9, "count"));
    layers = self->_layers;
    self->_layers = v10;

  }
  lock = &self->_layerCreationLock;
  os_unfair_lock_unlock(&self->_layerCreationLock);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v9;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  v13 = v28;
  if (v12)
  {
    v14 = v12;
    v31 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v31)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        if (self->_shouldPulsate)
          v17 = -[CRLPulseAnimationController initWithDelegate:]([CRLPulseAnimationController alloc], "initWithDelegate:", self);
        else
          v17 = objc_alloc_init(CRLHighlightController);
        v18 = v17;
        -[CRLHighlightController setShouldCreateBackground:](v17, "setShouldCreateBackground:", v13);
        -[CRLHighlightController setBackgroundColor:](v18, "setBackgroundColor:", a6);
        objc_msgSend(v32, "addObject:", v18);
        if (self->_shouldPulsate)
          -[CRLPulseAnimationController setAutohide:](v18, "setAutohide:", self->_autohide);
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v20 = (const CGPath *)objc_msgSend(WeakRetained, "newPathForSearchReference:", v16);

        if (v20)
        {
          if (!CGPathIsEmpty(v20))
          {
            BoundingBox = CGPathGetBoundingBox(v20);
            if (sub_10006178C(BoundingBox.origin.x, BoundingBox.origin.y, BoundingBox.size.width, BoundingBox.size.height))
            {
              -[CRLHighlightController setViewScale:](v18, "setViewScale:", self->_viewScale);
              -[CRLWPHighlightArrayController transform](self, "transform");
              v33[0] = v33[3];
              v33[1] = v33[4];
              v33[2] = v33[5];
              -[CRLHighlightController setTransform:](v18, "setTransform:", v33);
              v21 = objc_loadWeakRetained((id *)&self->_delegate);
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "imageForSearchReference:forPath:shouldPulsate:", v16, v20, self->_shouldPulsate));

              -[CRLHighlightController createLayerWithZOrder:contentsScaleForLayers:](v18, "createLayerWithZOrder:contentsScaleForLayers:", self->_zOrder, a4);
              -[CRLHighlightController buildLayersForPath:withImage:](v18, "buildLayersForPath:withImage:", v20, v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLHighlightController layer](v18, "layer"));
              os_unfair_lock_lock(lock);
              -[NSMutableArray addObject:](self->_layers, "addObject:", v23);
              v13 = v28;
              os_unfair_lock_unlock(lock);

            }
          }
          CGPathRelease(v20);
        }

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v14);
  }

  os_unfair_lock_lock(lock);
  controllers = self->_controllers;
  if (!controllers)
  {
    if (objc_msgSend(obj, "count"))
    {
      v25 = (NSMutableArray *)objc_msgSend(v32, "mutableCopy");
      v26 = self->_controllers;
      self->_controllers = v25;

      goto LABEL_24;
    }
    controllers = self->_controllers;
  }
  -[NSMutableArray addObjectsFromArray:](controllers, "addObjectsFromArray:", v32);
LABEL_24:
  os_unfair_lock_unlock(lock);

  return v32;
}

- (void)removeLayersFromSuperlayer
{
  NSMutableArray *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_layers;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "removeFromSuperlayer", (_QWORD)v7);
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)anySuperlayer
{
  void *v3;
  void *v4;

  if (-[NSMutableArray count](self->_layers, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_layers, "objectAtIndexedSubscript:", 0));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "superlayer"));

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (NSArray)layers
{
  return &self->_layers->super;
}

- (double)viewScale
{
  return self->_viewScale;
}

- (void)setViewScale:(double)a3
{
  self->_viewScale = a3;
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].a;
  return self;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tx = v4;
  *(_OWORD *)&self->_transform.a = v3;
}

- (BOOL)shouldPulsate
{
  return self->_shouldPulsate;
}

- (void)setShouldPulsate:(BOOL)a3
{
  self->_shouldPulsate = a3;
}

- (BOOL)pulsating
{
  return self->_pulsating;
}

- (void)setPulsating:(BOOL)a3
{
  self->_pulsating = a3;
}

- (BOOL)autohide
{
  return self->_autohide;
}

- (void)setAutohide:(BOOL)a3
{
  self->_autohide = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_controllers, 0);
  objc_storeStrong((id *)&self->_layers, 0);
}

@end
