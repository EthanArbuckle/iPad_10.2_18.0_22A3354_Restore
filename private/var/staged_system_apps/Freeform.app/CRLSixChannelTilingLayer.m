@implementation CRLSixChannelTilingLayer

- (CRLSixChannelTilingLayer)init
{
  CRLSixChannelTilingLayer *v2;
  CRLSixChannelTilingLayer *v3;
  uint64_t v4;
  CRLTilingLayer *multiplyLayer;
  uint64_t v6;
  CRLTilingLayer *addLayer;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRLSixChannelTilingLayer;
  v2 = -[CRLSixChannelTilingLayer init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    -[CRLSixChannelTilingLayer setAllowsGroupOpacity:](v2, "setAllowsGroupOpacity:", 0);
    -[CRLSixChannelTilingLayer setAllowsGroupBlending:](v3, "setAllowsGroupBlending:", 0);
    v4 = objc_claimAutoreleasedReturnValue(-[CRLSixChannelTilingLayer p_createSublayerWithCompositingFilter:](v3, "p_createSublayerWithCompositingFilter:", kCAFilterMultiplyBlendMode));
    multiplyLayer = v3->_multiplyLayer;
    v3->_multiplyLayer = (CRLTilingLayer *)v4;

    v6 = objc_claimAutoreleasedReturnValue(-[CRLSixChannelTilingLayer p_createSublayerWithCompositingFilter:](v3, "p_createSublayerWithCompositingFilter:", kCAFilterLinearDodgeBlendMode));
    addLayer = v3->_addLayer;
    v3->_addLayer = (CRLTilingLayer *)v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSixChannelTilingLayer p_internalSublayers](v3, "p_internalSublayers"));
    -[CRLSixChannelTilingLayer setSublayers:](v3, "setSublayers:", v8);

  }
  return v3;
}

- (id)p_createSublayerWithCompositingFilter:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLTilingLayer layer](CRLTilingLayer, "layer"));
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "setAllowsGroupOpacity:", 0);
  objc_msgSend(v5, "setAllowsGroupBlending:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", v4));

  objc_msgSend(v5, "setCompositingFilter:", v6);
  return v5;
}

+ (Class)crl_renderableClass
{
  return (Class)objc_opt_class(CRLSixChannelTilingRenderable, a2);
}

- (id)p_internalSublayers
{
  CRLTilingLayer *addLayer;
  _QWORD v4[2];

  addLayer = self->_addLayer;
  v4[0] = self->_multiplyLayer;
  v4[1] = addLayer;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, 2));
}

- (void)setDrawsAsynchronously:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CRLSixChannelTilingLayer;
  -[CRLSixChannelTilingLayer setDrawsAsynchronously:](&v5, "setDrawsAsynchronously:");
  -[CRLTilingLayer setDrawsAsynchronously:](self->_multiplyLayer, "setDrawsAsynchronously:", v3);
  -[CRLTilingLayer setDrawsAsynchronously:](self->_addLayer, "setDrawsAsynchronously:", v3);
}

- (void)setShouldRasterize:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[CRLTilingLayer setShouldRasterize:](self->_multiplyLayer, "setShouldRasterize:");
  -[CRLTilingLayer setShouldRasterize:](self->_addLayer, "setShouldRasterize:", v3);
}

- (void)setContentsScale:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLSixChannelTilingLayer;
  -[CRLSixChannelTilingLayer setContentsScale:](&v5, "setContentsScale:");
  -[CRLTilingLayer setContentsScale:](self->_multiplyLayer, "setContentsScale:", a3);
  -[CRLTilingLayer setContentsScale:](self->_addLayer, "setContentsScale:", a3);
}

- (void)crl_tilingSafeSetSublayers:(id)a3
{
  unint64_t v4;
  void *v5;
  unsigned __int8 v6;
  NSArray *v7;
  NSArray *customSublayers;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (unint64_t)a3;
  v5 = (void *)v4;
  if (v4 | (unint64_t)self->_customSublayers)
  {
    v12 = (void *)v4;
    v6 = objc_msgSend((id)v4, "isEqual:");
    v5 = v12;
    if ((v6 & 1) == 0)
    {
      v7 = (NSArray *)objc_msgSend(v12, "copy");
      customSublayers = self->_customSublayers;
      self->_customSublayers = v7;

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSixChannelTilingLayer p_internalSublayers](self, "p_internalSublayers"));
      v10 = v9;
      if (v12)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "arrayByAddingObjectsFromArray:"));
        -[CRLSixChannelTilingLayer setSublayers:](self, "setSublayers:", v11);

      }
      else
      {
        -[CRLSixChannelTilingLayer setSublayers:](self, "setSublayers:", v9);
      }

      v5 = v12;
    }
  }

}

- (void)layoutSublayers
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLSixChannelTilingLayer;
  -[CRLSixChannelTilingLayer layoutSublayers](&v3, "layoutSublayers");
  -[CRLSixChannelTilingLayer bounds](self, "bounds");
  -[CRLTilingLayer setFrame:](self->_multiplyLayer, "setFrame:");
  -[CRLTilingLayer setNeedsLayout](self->_multiplyLayer, "setNeedsLayout");
  -[CRLSixChannelTilingLayer bounds](self, "bounds");
  -[CRLTilingLayer setFrame:](self->_addLayer, "setFrame:");
  -[CRLTilingLayer setNeedsLayout](self->_addLayer, "setNeedsLayout");
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)CRLSixChannelTilingLayer;
  -[CRLSixChannelTilingLayer setNeedsDisplayInRect:](&v8, "setNeedsDisplayInRect:");
  -[CRLSixChannelTilingLayer convertRect:toLayer:](self, "convertRect:toLayer:", self->_multiplyLayer, x, y, width, height);
  -[CRLTilingLayer setNeedsDisplayInRect:](self->_multiplyLayer, "setNeedsDisplayInRect:");
  -[CRLSixChannelTilingLayer convertRect:toLayer:](self, "convertRect:toLayer:", self->_addLayer, x, y, width, height);
  -[CRLTilingLayer setNeedsDisplayInRect:](self->_addLayer, "setNeedsDisplayInRect:");
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  CRLTilingLayer *v6;
  CRLTilingLayer *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = (CRLTilingLayer *)a3;
  v7 = v6;
  if (self->_multiplyLayer == v6)
  {
    sub_10041104C((uint64_t)a4, 1);
LABEL_14:
    -[CRLSixChannelTilingLayer drawInContext:](self, "drawInContext:", a4);
    goto LABEL_15;
  }
  if (self->_addLayer == v6)
  {
    sub_100411150((uint64_t)a4, 1);
    goto LABEL_14;
  }
  v8 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123ABA8);
  v9 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DFDF2C((uint64_t)v7, v8, v9);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123ABC8);
  v10 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE81F0(v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSixChannelTilingLayer drawLayer:inContext:]"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSixChannelTilingLayer.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 223, 0, "Unexpected delegate call for layer %@", v7);

LABEL_15:
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return +[NSNull null](NSNull, "null", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customSublayers, 0);
  objc_storeStrong((id *)&self->_addLayer, 0);
  objc_storeStrong((id *)&self->_multiplyLayer, 0);
}

@end
