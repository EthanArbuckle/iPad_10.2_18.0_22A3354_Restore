@implementation _HKSPObserverRecord

- (_HKSPObserverRecord)initWithObserver:(id)a3 callbackScheduler:(id)a4
{
  id v6;
  id v7;
  _HKSPObserverRecord *v8;
  _HKSPObserverRecord *v9;
  _HKSPObserverRecord *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_HKSPObserverRecord;
  v8 = -[_HKSPObserverRecord init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->_observer, v6);
    objc_storeStrong((id *)&v9->_callbackScheduler, a4);
    v10 = v9;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackScheduler, 0);
  objc_destroyWeak(&self->_observer);
}

- (id)observer
{
  return objc_loadWeakRetained(&self->_observer);
}

- (NAScheduler)callbackScheduler
{
  return self->_callbackScheduler;
}

@end
