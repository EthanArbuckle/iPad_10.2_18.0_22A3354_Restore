@implementation PKDisplayLinkTargetProxy

- (void)drawWithDisplayLink:(id)a3
{
  PKRenderLoop **p_target;
  id v4;
  id WeakRetained;

  p_target = &self->_target;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_target);
  -[PKRenderLoop _drawWithDisplayLink:]((uint64_t)WeakRetained, v4);

}

- (id)initWithTarget:(id *)a1
{
  id v3;
  id *v4;
  objc_super v6;

  v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)PKDisplayLinkTargetProxy;
    v4 = (id *)objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4)
      objc_storeWeak(v4 + 1, v3);
  }

  return a1;
}

- (PKDisplayLinkTargetProxy)init
{

  return 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_target);
}

@end
