@implementation NUNISceneUpdateDescription

+ (id)descriptionWithVista:(unint64_t)a3 updateBlock:(id)a4
{
  id v5;
  NUNISceneUpdateDescription *v6;

  v5 = a4;
  v6 = -[NUNISceneUpdateDescription initWithVista:updateBlock:]([NUNISceneUpdateDescription alloc], "initWithVista:updateBlock:", a3, v5);

  return v6;
}

- (NUNISceneUpdateDescription)initWithVista:(unint64_t)a3 updateBlock:(id)a4
{
  id v6;
  NUNISceneUpdateDescription *v7;
  NUNISceneUpdateDescription *v8;
  void *v9;
  id updateBlock;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NUNISceneUpdateDescription;
  v7 = -[NUNISceneUpdateDescription init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_vista = a3;
    v9 = _Block_copy(v6);
    updateBlock = v8->_updateBlock;
    v8->_updateBlock = v9;

  }
  return v8;
}

- (BOOL)isEarth
{
  return self->_vista == 0;
}

- (BOOL)isLuna
{
  return self->_vista == 1;
}

- (unint64_t)vista
{
  return self->_vista;
}

- (void)setVista:(unint64_t)a3
{
  self->_vista = a3;
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateBlock, 0);
}

@end
