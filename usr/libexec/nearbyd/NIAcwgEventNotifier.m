@implementation NIAcwgEventNotifier

- (NIAcwgEventNotifier)initWithParentSession:(id)a3
{
  id v4;
  NIAcwgEventNotifier *v5;
  NIAcwgEventNotifier *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NIAcwgEventNotifier;
  v5 = -[NIAcwgEventNotifier init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->parentSession, v4);

  return v6;
}

- (void)notifyUrskCreated:(unsigned int)a3
{
  uint64_t v3;
  id WeakRetained;
  void *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "prefetchAcwgUrsk:", v3);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2292, CFSTR("Parent session is nil"));

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->parentSession);
}

@end
