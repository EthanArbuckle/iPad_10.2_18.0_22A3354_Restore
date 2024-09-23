@implementation BKBoolBlockProxy

- (BKBoolBlockProxy)initWithBlock:(id)a3
{
  id v4;
  BKBoolBlockProxy *v5;
  id v6;
  id work;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKBoolBlockProxy;
  v5 = -[BKBoolBlockProxy init](&v9, "init");
  if (v5)
  {
    v6 = objc_retainBlock(v4);
    work = v5->_work;
    v5->_work = v6;

  }
  return v5;
}

- (void)executeWithParam:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;

  v3 = a3;
  v4 = objc_retainBlock(self->_work);
  if (v4)
  {
    v5 = v4;
    (*((void (**)(id, _BOOL8))v4 + 2))(v4, v3);
    v4 = v5;
  }

}

- (id)work
{
  return self->_work;
}

- (void)setWork:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_work, 0);
}

@end
