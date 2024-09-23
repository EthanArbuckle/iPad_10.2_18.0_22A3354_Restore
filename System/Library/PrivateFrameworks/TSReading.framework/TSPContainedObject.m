@implementation TSPContainedObject

- (TSPContainedObject)initWithOwner:(id)a3
{
  id v4;
  TSPContainedObject *v5;
  TSPContainedObject *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TSPContainedObject;
  v5 = -[TSPContainedObject init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_owner, v4);

  return v6;
}

- (void)willModify
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  objc_msgSend(WeakRetained, "willModify");

}

- (void)willModifyForUpgrade
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  objc_msgSend(WeakRetained, "willModifyForUpgrade");

}

- (TSPObject)owner
{
  return (TSPObject *)objc_loadWeakRetained((id *)&self->_owner);
}

- (void)setOwner:(id)a3
{
  objc_storeWeak((id *)&self->_owner, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owner);
}

- (id)documentRoot
{
  return -[TSPObject documentRoot](-[TSPContainedObject owner](self, "owner"), "documentRoot");
}

@end
