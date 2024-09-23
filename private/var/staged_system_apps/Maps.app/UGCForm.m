@implementation UGCForm

- (UGCForm)init
{
  UGCForm *v2;
  GEOObserverHashTable *v3;
  GEOObserverHashTable *observers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UGCForm;
  v2 = -[UGCForm init](&v6, "init");
  if (v2)
  {
    v3 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___UGCFormObserver, 0);
    observers = v2->_observers;
    v2->_observers = v3;

  }
  return v2;
}

- (BOOL)isComplete
{
  return 0;
}

- (void)_notifyObserversOfChange
{
  -[GEOObserverHashTable formDidChange:](self->_observers, "formDidChange:", self);
}

- (void)addObserver:(id)a3
{
  -[GEOObserverHashTable registerObserver:](self->_observers, "registerObserver:", a3);
}

- (void)removeObserver:(id)a3
{
  -[GEOObserverHashTable unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (NSString)parentSubmissionIdentifier
{
  return self->_parentSubmissionIdentifier;
}

- (void)setParentSubmissionIdentifier:(id)a3
{
  self->_parentSubmissionIdentifier = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
