@implementation ISPlayerOutputTransitionOptions

- (ISPlayerOutputTransitionOptions)init
{
  ISPlayerOutputTransitionOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISPlayerOutputTransitionOptions;
  result = -[ISPlayerOutputTransitionOptions init](&v3, sel_init);
  if (result)
    result->_transitionDuration = 0.0;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ISPlayerOutputTransitionOptions;
  -[ISPlayerOutputTransitionOptions description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("\n\t\tduration:\t%f"), *(_QWORD *)&self->_transitionDuration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)transitionDuration
{
  return self->_transitionDuration;
}

- (void)setTransitionDuration:(double)a3
{
  self->_transitionDuration = a3;
}

@end
