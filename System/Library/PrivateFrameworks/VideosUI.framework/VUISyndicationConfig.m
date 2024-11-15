@implementation VUISyndicationConfig

- (void)setHighlightsFetchLimit:(unint64_t)a3
{
  self->_highlightsFetchLimit = a3;
}

- (VUISyndicationConfig)init
{
  VUISyndicationConfig *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUISyndicationConfig;
  result = -[VUISyndicationConfig init](&v3, sel_init);
  if (result)
    result->_highlightsFetchLimit = 50;
  return result;
}

- (unint64_t)highlightsFetchLimit
{
  return self->_highlightsFetchLimit;
}

@end
