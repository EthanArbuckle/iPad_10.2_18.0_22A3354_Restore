@implementation WFActionWillOpenURLTestingEvent

- (WFActionWillOpenURLTestingEvent)initWithAction:(id)a3 URL:(id)a4 bundleIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  WFActionWillOpenURLTestingEvent *v12;
  WFActionWillOpenURLTestingEvent *v13;
  WFActionWillOpenURLTestingEvent *v14;
  void *v16;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionWillOpenURLTestingEvent.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("URL"));

  }
  v17.receiver = self;
  v17.super_class = (Class)WFActionWillOpenURLTestingEvent;
  v12 = -[WFActionTestingEvent initWithAction:](&v17, sel_initWithAction_, v9);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_URL, a4);
    objc_storeStrong((id *)&v13->_bundleIdentifier, a5);
    v14 = v13;
  }

  return v13;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
