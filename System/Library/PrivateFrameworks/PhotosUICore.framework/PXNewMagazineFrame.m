@implementation PXNewMagazineFrame

- (PXNewMagazineFrame)initWithWidth:(int64_t)a3 height:(int64_t)a4
{
  PXNewMagazineFrame *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXNewMagazineFrame;
  result = -[PXNewMagazineFrame init](&v7, sel_init);
  if (result)
  {
    result->_width = a3;
    result->_height = a4;
  }
  return result;
}

- (int64_t)numberOfTiles
{
  return self->_height * self->_width;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lux%lu, asp: %.3f (%.3f ~ %.3f)"), self->_width, self->_height, *(_QWORD *)&self->_aspectRatio, *(_QWORD *)&self->_minAspectRatio, *(_QWORD *)&self->_maxAspectRatio);
}

- (int64_t)width
{
  return self->_width;
}

- (void)setWidth:(int64_t)a3
{
  self->_width = a3;
}

- (int64_t)height
{
  return self->_height;
}

- (void)setHeight:(int64_t)a3
{
  self->_height = a3;
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (void)setAspectRatio:(double)a3
{
  self->_aspectRatio = a3;
}

- (double)minAspectRatio
{
  return self->_minAspectRatio;
}

- (void)setMinAspectRatio:(double)a3
{
  self->_minAspectRatio = a3;
}

- (double)maxAspectRatio
{
  return self->_maxAspectRatio;
}

- (void)setMaxAspectRatio:(double)a3
{
  self->_maxAspectRatio = a3;
}

@end
