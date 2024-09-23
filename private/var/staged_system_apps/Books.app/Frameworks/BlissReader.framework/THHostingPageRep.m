@implementation THHostingPageRep

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THHostingPageRep;
  -[THPageRep dealloc](&v3, "dealloc");
}

- (void)willBeRemoved
{
  if (-[THPageLayerAndSubviewHost rep](self->_layerAndSubviewHost, "rep") == (TSDRep *)self)
  {
    -[THPageLayerAndSubviewHost setRep:](self->_layerAndSubviewHost, "setRep:", 0);
    -[THPageLayerAndSubviewHost recycle](self->_layerAndSubviewHost, "recycle");
  }

  self->_layerAndSubviewHost = 0;
}

- (TSDLayerAndSubviewHosting)layerAndSubviewHost
{
  TSDLayerAndSubviewHosting *result;
  THPageLayerAndSubviewHost *v4;

  result = (TSDLayerAndSubviewHosting *)self->_layerAndSubviewHost;
  if (!result)
  {
    v4 = (THPageLayerAndSubviewHost *)objc_msgSend(objc_msgSend(-[THHostingPageRep interactiveCanvasController](self, "interactiveCanvasController"), "ancestorRepOfRep:orDelegateConformingToProtocol:", self, &OBJC_PROTOCOL___THPageLayerAndSubviewHostProvider), "layerAndSubviewHostForPageInfo:", -[THHostingPageRep info](self, "info"));
    self->_layerAndSubviewHost = v4;
    -[THPageLayerAndSubviewHost setRep:](v4, "setRep:", self);
    return (TSDLayerAndSubviewHosting *)self->_layerAndSubviewHost;
  }
  return result;
}

- (id)subviewsController
{
  return -[THPageLayerAndSubviewHost subviewsController](self->_layerAndSubviewHost, "subviewsController");
}

- (void)p_updateHostGeometry
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1479E0;
  block[3] = &unk_426DD0;
  block[4] = self;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
    sub_1479E0((uint64_t)block);
  else
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)updateLayerGeometryFromLayout:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THHostingPageRep;
  -[THHostingPageRep updateLayerGeometryFromLayout:](&v4, "updateLayerGeometryFromLayout:", a3);
  -[THHostingPageRep p_updateHostGeometry](self, "p_updateHostGeometry");
}

- (void)addChildViewsToArray:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = -[THPageLayerAndSubviewHost view](self->_layerAndSubviewHost, "view");
  v6 = -[THPageLayerAndSubviewHost borderView](self->_layerAndSubviewHost, "borderView");
  -[THHostingPageRep p_updateHostGeometry](self, "p_updateHostGeometry");
  if (v5)
    objc_msgSend(a3, "addObject:", v5);
  if (v6)
    objc_msgSend(a3, "addObject:", v6);
}

- (int)positionForChildView:(id)a3
{
  if (-[THPageLayerAndSubviewHost borderView](self->_layerAndSubviewHost, "borderView") == a3)
    return 3;
  else
    return 1;
}

- (BOOL)drawsPageBackground
{
  return 0;
}

- (void)didUpdateLayer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THHostingPageRep;
  -[THPageRep didUpdateLayer:](&v4, "didUpdateLayer:", a3);
  -[THPageLayerAndSubviewHost updateTopLevelLayers](self->_layerAndSubviewHost, "updateTopLevelLayers");
}

- (BOOL)isVisibleOnCanvas
{
  return -[THPageLayerAndSubviewHost visible](self->_layerAndSubviewHost, "visible");
}

@end
