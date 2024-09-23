@implementation PLPlatterCustomContentView

- (PLPlatterCustomContentView)initWithAncestorPlatterView:(id)a3
{
  id v4;
  PLPlatterCustomContentView *v5;
  PLPlatterCustomContentView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PLPlatterCustomContentView;
  v5 = -[PLPlatterCustomContentView init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_ancestorPlatterView, v4);

  return v6;
}

- (void)willRemoveSubview:(id)a3
{
  id v4;
  id WeakRetained;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLPlatterCustomContentView;
  v4 = a3;
  -[PLPlatterCustomContentView willRemoveSubview:](&v6, sel_willRemoveSubview_, v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_ancestorPlatterView);
  objc_msgSend(WeakRetained, "_willRemoveCustomContent:", v4, v6.receiver, v6.super_class);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ancestorPlatterView);
}

@end
