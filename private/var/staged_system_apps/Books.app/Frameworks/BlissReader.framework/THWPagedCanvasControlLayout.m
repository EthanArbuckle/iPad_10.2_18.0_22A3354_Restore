@implementation THWPagedCanvasControlLayout

- (Class)repClassOverride
{
  return (Class)objc_opt_class(THWPagedCanvasControlRep, a2);
}

- (void)validate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWPagedCanvasControlLayout;
  -[THWControlLayout validate](&v3, "validate");
  -[THWPagedCanvasControlLayoutDelegate pagedCanvasControlLayoutDidValidate:](self->_delegate, "pagedCanvasControlLayoutDidValidate:", self);
}

- (THWPagedCanvasControlLayoutDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWPagedCanvasControlLayoutDelegate *)a3;
}

@end
