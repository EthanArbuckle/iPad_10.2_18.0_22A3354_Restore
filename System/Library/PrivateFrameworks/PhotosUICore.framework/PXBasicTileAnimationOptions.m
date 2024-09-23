@implementation PXBasicTileAnimationOptions

- (PXBasicTileAnimationOptions)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXBasicTileAnimationOptions;
  return -[PXBasicTileAnimationOptions init](&v3, sel_init);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_duration;
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_delay;
  *((_QWORD *)result + 4) = self->_style;
  *((_BYTE *)result + 8) = self->_shouldNotifyTiles;
  *((_BYTE *)result + 9) = self->_shouldSnapshotDynamicContents;
  *((_QWORD *)result + 5) = self->_flags;
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXBasicTileAnimationOptions;
  -[PXBasicTileAnimationOptions description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBasicTileAnimationOptions duration](self, "duration");
  v5 = v4;
  -[PXBasicTileAnimationOptions delay](self, "delay");
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" duration:%.2f delay:%.2f style:%ld>"), v5, v6, -[PXBasicTileAnimationOptions style](self, "style"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (BOOL)shouldNotifyTiles
{
  return self->_shouldNotifyTiles;
}

- (void)setShouldNotifyTiles:(BOOL)a3
{
  self->_shouldNotifyTiles = a3;
}

- (BOOL)shouldSnapshotDynamicContents
{
  return self->_shouldSnapshotDynamicContents;
}

- (void)setShouldSnapshotDynamicContents:(BOOL)a3
{
  self->_shouldSnapshotDynamicContents = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

+ (id)defaultAnimationOptions
{
  PXBasicTileAnimationOptions *v2;

  v2 = objc_alloc_init(PXBasicTileAnimationOptions);
  -[PXBasicTileAnimationOptions setStyle:](v2, "setStyle:", 2);
  -[PXBasicTileAnimationOptions setDuration:](v2, "setDuration:", 0.3);
  return v2;
}

@end
