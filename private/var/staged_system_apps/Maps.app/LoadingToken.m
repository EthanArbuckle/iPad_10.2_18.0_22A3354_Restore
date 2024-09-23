@implementation LoadingToken

- (LoadingToken)initWithInvalidationBlock:(id)a3
{
  id v4;
  LoadingToken *v5;
  id v6;
  id invalidate;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LoadingToken;
  v5 = -[LoadingToken init](&v9, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    invalidate = v5->_invalidate;
    v5->_invalidate = v6;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[LoadingToken end](self, "end");
  v3.receiver = self;
  v3.super_class = (Class)LoadingToken;
  -[LoadingToken dealloc](&v3, "dealloc");
}

- (void)end
{
  void (**invalidate)(id, SEL);

  invalidate = (void (**)(id, SEL))self->_invalidate;
  if (invalidate)
  {
    invalidate[2](invalidate, a2);
    invalidate = (void (**)(id, SEL))self->_invalidate;
  }
  self->_invalidate = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidate, 0);
}

@end
