@implementation LegacyTileLayer

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
  -[LegacyTileLayer setNeedsLayout](self, "setNeedsLayout");
  v8.receiver = self;
  v8.super_class = (Class)LegacyTileLayer;
  -[LegacyTileLayer setNeedsDisplayInRect:](&v8, sel_setNeedsDisplayInRect_, x, y, width, height);
}

- (void)layoutSublayers
{
  WebCore::LegacyTileCache **tileGrid;

  if (pthread_main_np())
    WebThreadLock();
  tileGrid = (WebCore::LegacyTileCache **)self->_tileGrid;
  if (tileGrid)
    WebCore::LegacyTileCache::prepareToDraw(*tileGrid);
}

- (void)renderInContext:(CGContext *)a3
{
  BOOL isRenderingInContext;
  objc_super v5;

  isRenderingInContext = self->_isRenderingInContext;
  self->_isRenderingInContext = 1;
  v5.receiver = self;
  v5.super_class = (Class)LegacyTileLayer;
  -[LegacyTileLayer renderInContext:](&v5, sel_renderInContext_, a3);
  self->_isRenderingInContext = isRenderingInContext;
}

- (void)drawInContext:(CGContext *)a3
{
  uint64_t *tileGrid;

  if (pthread_main_np())
    WebThreadLock();
  tileGrid = (uint64_t *)self->_tileGrid;
  if (tileGrid)
    WebCore::LegacyTileCache::drawLayer(*tileGrid, self, a3, -[LegacyTileLayer isRenderingInContext](self, "isRenderingInContext"));
}

- (id)actionForKey:(id)a3
{
  return 0;
}

- (unsigned)paintCount
{
  return self->_paintCount;
}

- (void)setPaintCount:(unsigned int)a3
{
  self->_paintCount = a3;
}

- (void)tileGrid
{
  return self->_tileGrid;
}

- (void)setTileGrid:(void *)a3
{
  self->_tileGrid = a3;
}

- (BOOL)isRenderingInContext
{
  return self->_isRenderingInContext;
}

@end
