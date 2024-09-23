@implementation SUTableCellContentOverlayView

- (void)dealloc
{
  objc_super v3;

  self->_configuration = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUTableCellContentOverlayView;
  -[SUTableCellContentOverlayView dealloc](&v3, sel_dealloc);
}

- (void)drawRect:(CGRect)a3
{
  -[SUCellConfiguration drawBackgroundWithModifiers:](self->_configuration, "drawBackgroundWithModifiers:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SUCellConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 416);
}

@end
