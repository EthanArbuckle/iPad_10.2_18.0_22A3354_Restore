@implementation _UIWeakOverlayService

- (_UIWeakOverlayService)initWithService:(id)a3
{
  id v4;
  _UIWeakOverlayService *v5;
  _UIWeakOverlayService *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIWeakOverlayService;
  v5 = -[_UIWeakOverlayService init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_service, v4);

  return v6;
}

- (void)performOverlayClientAction:(id)a3
{
  _UIOverlayService **p_service;
  id v4;
  id WeakRetained;

  p_service = &self->_service;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_service);
  objc_msgSend(WeakRetained, "performOverlayClientAction:", v4);

}

- (_UIOverlayService)service
{
  return (_UIOverlayService *)objc_loadWeakRetained((id *)&self->_service);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_service);
}

@end
