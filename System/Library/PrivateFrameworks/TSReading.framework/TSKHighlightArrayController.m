@implementation TSKHighlightArrayController

- (TSKHighlightArrayController)initWithZOrder:(double)a3 delegate:(id)a4
{
  TSKHighlightArrayController *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSKHighlightArrayController;
  result = -[TSKHighlightArrayController init](&v7, sel_init);
  if (result)
  {
    result->_delegate = (TSKHighlightArrayControllerProtocol *)a4;
    result->_zOrder = a3;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[TSKHighlightArrayController disconnect](self, "disconnect");
  -[TSKHighlightArrayController reset](self, "reset");
  v3.receiver = self;
  v3.super_class = (Class)TSKHighlightArrayController;
  -[TSKHighlightArrayController dealloc](&v3, sel_dealloc);
}

- (void)startAnimating
{
  if (-[NSMutableArray count](self->_controllers, "count") && self->_shouldPulsate && !self->_pulsating)
  {
    -[NSMutableArray makeObjectsPerformSelector:](self->_controllers, "makeObjectsPerformSelector:", sel_startAnimating);
    self->_pulsating = 1;
  }
}

- (void)stop
{
  if (-[NSMutableArray count](self->_controllers, "count"))
  {
    if (self->_shouldPulsate)
    {
      self->_pulsating = 0;
      -[NSMutableArray makeObjectsPerformSelector:](self->_controllers, "makeObjectsPerformSelector:", sel_stop);
    }
  }
}

- (void)pulseAnimationDidStopForPulse:(id)a3
{
  self->_pulsating = 0;
  -[TSKHighlightArrayControllerProtocol pulseAnimationDidStop:](self->_delegate, "pulseAnimationDidStop:", self);
}

- (void)disconnect
{
  self->_delegate = 0;
  -[NSMutableArray makeObjectsPerformSelector:](self->_controllers, "makeObjectsPerformSelector:", sel_disconnect);
}

- (void)reset
{
  -[NSMutableArray makeObjectsPerformSelector:](self->_controllers, "makeObjectsPerformSelector:", sel_reset);

  self->_controllers = 0;
  self->_layers = 0;
}

- (id)buildHighlightsForSearchReferences:(id)a3 contentsScaleForLayers:(double)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  TSKPulseAnimationController *v14;
  TSKPulseAnimationController *v15;
  const CGPath *v16;
  const CGPath *v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  NSMutableArray *controllers;
  _OWORD v24[3];
  _OWORD v25[3];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  if (self->_creatingLayers)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKHighlightArrayController buildHighlightsForSearchReferences:contentsScaleForLayers:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKHighlightArrayController.m"), 82, CFSTR("buildHighlightsForSearchReferences: should not be called recursively."));
  }
  else
  {
    self->_creatingLayers = 1;
    if (!self->_layers)
      self->_layers = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(a3, "count"));
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(a3);
          v13 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (self->_shouldPulsate)
            v14 = -[TSKPulseAnimationController initWithDelegate:]([TSKPulseAnimationController alloc], "initWithDelegate:", self);
          else
            v14 = objc_alloc_init(TSKHighlightController);
          v15 = v14;
          objc_msgSend(v6, "addObject:", v14);

          if (self->_shouldPulsate)
            -[TSKPulseAnimationController setAutohide:](v15, "setAutohide:", self->_autohide);
          v16 = (const CGPath *)-[TSKHighlightArrayControllerProtocol newPathForSearchReference:](self->_delegate, "newPathForSearchReference:", v13);
          v17 = v16;
          if (v16 && !CGPathIsEmpty(v16))
          {
            -[TSKHighlightController setViewScale:](v15, "setViewScale:", self->_viewScale);
            v18 = *(_OWORD *)&self->_canvasTransform.c;
            v25[0] = *(_OWORD *)&self->_canvasTransform.a;
            v25[1] = v18;
            v25[2] = *(_OWORD *)&self->_canvasTransform.tx;
            v19 = *(_OWORD *)&self->_layerTransform.c;
            v24[0] = *(_OWORD *)&self->_layerTransform.a;
            v24[1] = v19;
            v24[2] = *(_OWORD *)&self->_layerTransform.tx;
            -[TSKHighlightController setCanvasTransform:layerTransform:](v15, "setCanvasTransform:layerTransform:", v25, v24);
            v20 = -[TSKHighlightArrayControllerProtocol imageForSearchReference:forPath:shouldPulsate:](self->_delegate, "imageForSearchReference:forPath:shouldPulsate:", v13, v17, self->_shouldPulsate);
            -[TSKHighlightController createLayerWithZOrder:contentsScaleForLayers:](v15, "createLayerWithZOrder:contentsScaleForLayers:", self->_zOrder, a4);
            -[TSKHighlightController buildLayersForPath:withImage:](v15, "buildLayersForPath:withImage:", v17, v20);
            -[NSMutableArray addObject:](self->_layers, "addObject:", -[TSKHighlightController layer](v15, "layer"));
          }
          CGPathRelease(v17);
        }
        v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v10);
    }
    self->_creatingLayers = 0;
  }
  controllers = self->_controllers;
  if (!controllers)
  {
    if (objc_msgSend(a3, "count"))
    {
      self->_controllers = (NSMutableArray *)objc_msgSend(v6, "mutableCopy");
      return v6;
    }
    controllers = self->_controllers;
  }
  -[NSMutableArray addObjectsFromArray:](controllers, "addObjectsFromArray:", v6);
  return v6;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_layerTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_layerTransform.tx = v4;
  *(_OWORD *)&self->_layerTransform.a = v3;
  v5 = *(_OWORD *)&a3->a;
  v6 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_canvasTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_canvasTransform.tx = v6;
  *(_OWORD *)&self->_canvasTransform.a = v5;
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].tx;
  return self;
}

- (void)setCanvasTransform:(CGAffineTransform *)a3 layerTransform:(CGAffineTransform *)a4
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v4 = *(_OWORD *)&a3->a;
  v5 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_canvasTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_canvasTransform.tx = v5;
  *(_OWORD *)&self->_canvasTransform.a = v4;
  v6 = *(_OWORD *)&a4->a;
  v7 = *(_OWORD *)&a4->tx;
  *(_OWORD *)&self->_layerTransform.c = *(_OWORD *)&a4->c;
  *(_OWORD *)&self->_layerTransform.tx = v7;
  *(_OWORD *)&self->_layerTransform.a = v6;
}

- (double)viewScale
{
  return self->_viewScale;
}

- (void)setViewScale:(double)a3
{
  self->_viewScale = a3;
}

- (NSArray)layers
{
  return &self->_layers->super;
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

@end
