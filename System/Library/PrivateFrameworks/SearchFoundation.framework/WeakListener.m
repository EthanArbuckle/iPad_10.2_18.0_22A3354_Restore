@implementation WeakListener

- (WeakListener)initWithListener:(id)a3
{
  id v4;
  WeakListener *v5;
  WeakListener *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WeakListener;
  v5 = -[WeakListener init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_weakListener, v4);

  return v6;
}

- (SFFeedbackListener)strongListener
{
  return (SFFeedbackListener *)objc_loadWeakRetained((id *)&self->_weakListener);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakListener);
}

@end
