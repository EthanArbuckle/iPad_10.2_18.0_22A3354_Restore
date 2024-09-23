@implementation _BSUIDailyReadingLayerConfig

- (_BSUIDailyReadingLayerConfig)initWithMetrics:(id)a3 timeTextYOffset:(double)a4 micaFileProvider:(id)a5
{
  id v9;
  id v10;
  _BSUIDailyReadingLayerConfig *v11;
  _BSUIDailyReadingLayerConfig *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_BSUIDailyReadingLayerConfig;
  v11 = -[_BSUIDailyReadingLayerConfig init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_metrics, a3);
    v12->_timeTextYOffset = a4;
    objc_storeStrong((id *)&v12->_micaFileProvider, a5);
  }

  return v12;
}

- (void)dynamicUserInterfaceTraitDidChangeForLayer:(id)a3
{
  _objc_msgSend(a3, "configureWithMetrics:timeTextYOffset:micaFileProvider:", self->_metrics, self->_micaFileProvider, self->_timeTextYOffset);
}

- (void)configureLayer:(id)a3
{
  _objc_msgSend(a3, "configureWithMetrics:timeTextYOffset:micaFileProvider:", self->_metrics, self->_micaFileProvider, self->_timeTextYOffset);
}

- (void)configureSublayers:(id)a3 forLayer:(id)a4
{
  _objc_msgSend(a4, "configureWithSublayers:", a3);
}

- (BOOL)isEqualToConfig:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BSUIDailyReadingLayerConfig *v8;

  v4 = a3;
  v6 = objc_opt_class(_BSUIDailyReadingLayerConfig, v5);
  v7 = TUIDynamicCast(v6, v4);
  v8 = (_BSUIDailyReadingLayerConfig *)objc_claimAutoreleasedReturnValue(v7);

  return v8 == self;
}

- (Class)layerClass
{
  return (Class)objc_opt_class(BSUIDailyReadingLayer, a2);
}

- (Class)layerClassForSize:(CGSize)a3
{
  return -[_BSUIDailyReadingLayerConfig layerClass](self, "layerClass", a3.width, a3.height);
}

- (BOOL)reuseLayerForBoundsChange
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_micaFileProvider, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end
