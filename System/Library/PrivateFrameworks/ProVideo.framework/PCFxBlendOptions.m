@implementation PCFxBlendOptions

- (PCFxBlendOptions)initWithBlendOptions:(id)a3
{
  -[PCFxBlendOptions setBlendMode:](self, "setBlendMode:", objc_msgSend(a3, "getBlendMode"));
  return self;
}

- (int)getBlendMode
{
  return self->_mode;
}

- (void)setBlendMode:(int)a3
{
  self->_mode = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PCFxBlendOptions initWithBlendOptions:](+[PCFxBlendOptions allocWithZone:](PCFxBlendOptions, "allocWithZone:", a3), "initWithBlendOptions:", self);
}

@end
