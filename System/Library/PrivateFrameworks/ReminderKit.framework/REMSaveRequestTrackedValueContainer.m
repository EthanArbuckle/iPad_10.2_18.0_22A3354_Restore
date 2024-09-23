@implementation REMSaveRequestTrackedValueContainer

- (REMSaveRequestTrackedValueContainer)initWithValue:(id)a3
{
  id v4;
  REMSaveRequestTrackedValueContainer *v5;
  REMSaveRequestTrackedValueContainer *v6;
  uint64_t v7;
  REMSaveRequestTrackedValue *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)REMSaveRequestTrackedValueContainer;
  v5 = -[REMSaveRequestTrackedValueContainer init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_weakValue, v4);
    objc_msgSend(v4, "shallowCopyWithSaveRequest:", 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v6->_template;
    v6->_template = (REMSaveRequestTrackedValue *)v7;

  }
  return v6;
}

- (id)valueForSaveRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[REMSaveRequestTrackedValueContainer weakValue](self, "weakValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[REMSaveRequestTrackedValueContainer template](self, "template");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shallowCopyWithSaveRequest:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[REMSaveRequestTrackedValueContainer setWeakValue:](self, "setWeakValue:", v5);
  }

  return v5;
}

- (id)valueWithoutPerformingCopy
{
  void *v3;

  -[REMSaveRequestTrackedValueContainer weakValue](self, "weakValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[REMSaveRequestTrackedValueContainer template](self, "template");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (REMSaveRequestTrackedValue)weakValue
{
  return (REMSaveRequestTrackedValue *)objc_loadWeakRetained((id *)&self->_weakValue);
}

- (void)setWeakValue:(id)a3
{
  objc_storeWeak((id *)&self->_weakValue, a3);
}

- (REMSaveRequestTrackedValue)template
{
  return self->_template;
}

- (void)setTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_template, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_template, 0);
  objc_destroyWeak((id *)&self->_weakValue);
}

@end
