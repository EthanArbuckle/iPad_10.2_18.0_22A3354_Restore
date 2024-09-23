@implementation OspreyConnectionHandle

- (OspreyConnectionHandle)initWithConnectionKey:(id)a3 willRelease:(id)a4
{
  id v6;
  id v7;
  OspreyConnectionHandle *v8;
  uint64_t v9;
  id connectionKey;
  uint64_t v11;
  id willRelease;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)OspreyConnectionHandle;
  v8 = -[OspreyConnectionHandle init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    connectionKey = v8->_connectionKey;
    v8->_connectionKey = (id)v9;

    v11 = objc_msgSend(v7, "copy");
    willRelease = v8->_willRelease;
    v8->_willRelease = (id)v11;

  }
  return v8;
}

- (void)dealloc
{
  void (**willRelease)(id, OspreyConnectionHandle *);
  objc_super v4;

  willRelease = (void (**)(id, OspreyConnectionHandle *))self->_willRelease;
  if (willRelease)
    willRelease[2](willRelease, self);
  v4.receiver = self;
  v4.super_class = (Class)OspreyConnectionHandle;
  -[OspreyConnectionHandle dealloc](&v4, sel_dealloc);
}

- (id)connectionKey
{
  return self->_connectionKey;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_connectionKey, 0);
  objc_storeStrong(&self->_willRelease, 0);
}

@end
