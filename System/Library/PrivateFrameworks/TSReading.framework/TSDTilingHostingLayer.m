@implementation TSDTilingHostingLayer

- (void)p_commonInit
{
  self->mDirtyTilingLayers = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BEB3CB0]);
}

- (TSDTilingHostingLayer)init
{
  TSDTilingHostingLayer *v2;
  TSDTilingHostingLayer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDTilingHostingLayer;
  v2 = -[TSDTilingHostingLayer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[TSDTilingHostingLayer p_commonInit](v2, "p_commonInit");
  return v3;
}

- (TSDTilingHostingLayer)initWithCoder:(id)a3
{
  TSDTilingHostingLayer *v3;
  TSDTilingHostingLayer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSDTilingHostingLayer;
  v3 = -[TSDTilingHostingLayer initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[TSDTilingHostingLayer p_commonInit](v3, "p_commonInit");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDTilingHostingLayer;
  -[TSDTilingHostingLayer dealloc](&v3, sel_dealloc);
}

- (void)setNeedsDisplayForDirtyTiles:(id)a3
{
  -[TSDTilingHostingLayer setNeedsDisplay](self, "setNeedsDisplay");
  -[NSMutableSet addObject:](self->mDirtyTilingLayers, "addObject:", a3);
}

- (TSDInteractiveCanvasController)controller
{
  return self->mController;
}

- (void)setController:(id)a3
{
  self->mController = (TSDInteractiveCanvasController *)a3;
}

@end
