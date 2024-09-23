@implementation PXGTextureManagerPreheatingStrategy

- (CGRect)preheatingRectForLayout:(id)a3 interactionState:(id *)a4
{
  id v6;
  int64_t var0;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  v6 = a3;
  objc_msgSend(v6, "visibleRect");
  objc_msgSend(v6, "contentSize");

  var0 = a4->var0;
  v8 = 0.0;
  switch(a4->var0)
  {
    case 0xFFFFFFFFFFFFFFFFLL:
    case 0:
      goto LABEL_4;
    case 1:
      if (self->_previousRegime >= 2)
        goto LABEL_3;
LABEL_4:
      -[PXGTextureManagerPreheatingStrategy stoppedOffset](self, "stoppedOffset", 0.0);
      break;
    case 2:
LABEL_3:
      -[PXGTextureManagerPreheatingStrategy mediumOffset](self, "mediumOffset", 0.0);
      break;
    case 3:
      -[PXGTextureManagerPreheatingStrategy fastOffset](self, "fastOffset", 0.0);
      break;
    default:
      break;
  }
  self->_previousRegime = var0;
  if (!a4->var6 && a4->var4 - 2 < 2)
  {
    -[PXGTextureManagerPreheatingStrategy maxPreheatingDistance](self, "maxPreheatingDistance", v8, 0.0);
    -[PXGTextureManagerPreheatingStrategy maxPreheatingDistance](self, "maxPreheatingDistance");
  }
  PXEdgeInsetsMake();
  PXEdgeInsetsInsetRect();
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (double)stoppedOffset
{
  return self->_stoppedOffset;
}

+ (id)defaultPreheatingStrategy
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setStoppedOffset:", 400.0);
  objc_msgSend(v2, "setSlowOffset:", 300.0);
  objc_msgSend(v2, "setMediumOffset:", 200.0);
  objc_msgSend(v2, "setFastOffset:", 100.0);
  return v2;
}

- (void)setStoppedOffset:(double)a3
{
  self->_stoppedOffset = a3;
}

- (void)setSlowOffset:(double)a3
{
  self->_slowOffset = a3;
}

- (void)setMediumOffset:(double)a3
{
  self->_mediumOffset = a3;
}

- (void)setFastOffset:(double)a3
{
  self->_fastOffset = a3;
}

+ (id)lowMemoryPreheatingStrategy
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setStoppedOffset:", 100.0);
  objc_msgSend(v2, "setSlowOffset:", 100.0);
  objc_msgSend(v2, "setMediumOffset:", 100.0);
  objc_msgSend(v2, "setFastOffset:", 100.0);
  return v2;
}

+ (id)noPreheatingStrategy
{
  return objc_alloc_init((Class)a1);
}

- (double)slowOffset
{
  return self->_slowOffset;
}

- (double)mediumOffset
{
  return self->_mediumOffset;
}

- (double)fastOffset
{
  return self->_fastOffset;
}

@end
