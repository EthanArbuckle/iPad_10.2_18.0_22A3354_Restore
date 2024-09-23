@implementation LegacyTileHostLayer

- (LegacyTileHostLayer)initWithTileGrid:(void *)a3
{
  LegacyTileHostLayer *v4;
  LegacyTileHostLayer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LegacyTileHostLayer;
  v4 = -[LegacyTileHostLayer init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_tileGrid = a3;
    -[LegacyTileHostLayer setAnchorPoint:](v4, "setAnchorPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  }
  return v5;
}

- (id)actionForKey:(id)a3
{
  return 0;
}

- (void)renderInContext:(CGContext *)a3
{
  WebCore::LegacyTileCache *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  _DWORD v9[4];
  CGRect ClipBoundingBox;

  if (pthread_main_np())
    WebThreadLock();
  ClipBoundingBox = CGContextGetClipBoundingBox(a3);
  v5 = *(WebCore::LegacyTileCache **)self->_tileGrid;
  *(float *)&ClipBoundingBox.origin.x = ClipBoundingBox.origin.x;
  *(float *)&ClipBoundingBox.origin.y = ClipBoundingBox.origin.y;
  v9[0] = LODWORD(ClipBoundingBox.origin.x);
  v9[1] = LODWORD(ClipBoundingBox.origin.y);
  *(float *)&ClipBoundingBox.origin.x = ClipBoundingBox.size.width;
  *(float *)&ClipBoundingBox.origin.y = ClipBoundingBox.size.height;
  v9[2] = LODWORD(ClipBoundingBox.origin.x);
  v9[3] = LODWORD(ClipBoundingBox.origin.y);
  if ((WebCore::LegacyTileCache::setOverrideVisibleRect(v5, (const WebCore::FloatRect *)v9) & 1) != 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)LegacyTileHostLayer;
    -[LegacyTileHostLayer renderInContext:](&v8, sel_renderInContext_, a3);
    v6 = *(_QWORD *)self->_tileGrid;
    if (*(_BYTE *)(v6 + 40))
      *(_BYTE *)(v6 + 40) = 0;
  }
  else
  {
    WebCore::LegacyTileCache::doLayoutTiles(*(_QWORD *)self->_tileGrid);
    v8.receiver = self;
    v8.super_class = (Class)LegacyTileHostLayer;
    -[LegacyTileHostLayer renderInContext:](&v8, sel_renderInContext_, a3);
    v7 = *(_QWORD *)self->_tileGrid;
    if (*(_BYTE *)(v7 + 40))
      *(_BYTE *)(v7 + 40) = 0;
    WebCore::LegacyTileCache::doLayoutTiles(v7);
  }
}

@end
