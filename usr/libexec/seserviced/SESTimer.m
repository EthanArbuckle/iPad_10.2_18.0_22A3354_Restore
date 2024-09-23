@implementation SESTimer

- (void)dealloc
{
  objc_super v3;

  dispatch_source_cancel((dispatch_source_t)self->_src);
  v3.receiver = self;
  v3.super_class = (Class)SESTimer;
  -[SESTimer dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_src, 0);
}

@end
