@implementation OBScrollViewWeakLayoutObserver

- (OBScrollViewWeakLayoutObserver)initWithLayoutObserver:(id)a3
{
  id v4;
  OBScrollViewWeakLayoutObserver *v5;
  OBScrollViewWeakLayoutObserver *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OBScrollViewWeakLayoutObserver;
  v5 = -[OBScrollViewWeakLayoutObserver init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_selfReference, v5);
    objc_storeWeak((id *)&v6->_weakLayoutObserver, v4);
  }

  return v6;
}

- (void)_scrollViewDidLayoutSubviews:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_weakLayoutObserver);
  v5 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_scrollViewDidLayoutSubviews:", v6);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakLayoutObserver);
  objc_storeStrong((id *)&self->_selfReference, 0);
}

@end
