@implementation TUIFeedRendererOptions

- (TUIFeedRendererOptions)initWithResourceTimeout:(double)a3
{
  TUIFeedRendererOptions *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUIFeedRendererOptions;
  result = -[TUIFeedRendererOptions init](&v5, "init");
  if (result)
    result->_timeout = a3;
  return result;
}

- (double)timeout
{
  return self->_timeout;
}

@end
