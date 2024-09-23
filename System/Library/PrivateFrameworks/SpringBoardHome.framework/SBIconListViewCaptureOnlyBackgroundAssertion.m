@implementation SBIconListViewCaptureOnlyBackgroundAssertion

- (SBIconListViewCaptureOnlyBackgroundAssertion)initWithIcon:(id)a3 groupName:(id)a4 invalidation:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBIconListViewCaptureOnlyBackgroundAssertion *v11;
  SBIconListViewCaptureOnlyBackgroundAssertion *v12;
  uint64_t v13;
  id invalidationBlock;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SBIconListViewCaptureOnlyBackgroundAssertion;
  v11 = -[SBIconListViewCaptureOnlyBackgroundAssertion init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_icon, v8);
    objc_storeStrong((id *)&v12->_groupName, a4);
    v13 = objc_msgSend(v10, "copy");
    invalidationBlock = v12->_invalidationBlock;
    v12->_invalidationBlock = (id)v13;

  }
  return v12;
}

- (void)invalidate
{
  id invalidationBlock;
  id v4;
  void (**v5)(id, SBIconListViewCaptureOnlyBackgroundAssertion *);

  invalidationBlock = self->_invalidationBlock;
  if (invalidationBlock)
  {
    v5 = (void (**)(id, SBIconListViewCaptureOnlyBackgroundAssertion *))_Block_copy(invalidationBlock);
    v4 = self->_invalidationBlock;
    self->_invalidationBlock = 0;

    v5[2](v5, self);
  }
}

- (SBIcon)icon
{
  return (SBIcon *)objc_loadWeakRetained((id *)&self->_icon);
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_destroyWeak((id *)&self->_icon);
  objc_storeStrong(&self->_invalidationBlock, 0);
}

@end
