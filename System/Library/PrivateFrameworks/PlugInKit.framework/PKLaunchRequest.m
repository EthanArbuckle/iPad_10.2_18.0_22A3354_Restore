@implementation PKLaunchRequest

- (id)_initWithUUID:(id)a3 launchPersona:(id)a4
{
  id v6;
  id v7;
  PKLaunchRequest *v8;
  uint64_t v9;
  NSUUID *uuid;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKLaunchRequest;
  v8 = -[PKLaunchRequest init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    uuid = v8->_uuid;
    v8->_uuid = (NSUUID *)v9;

    objc_storeStrong((id *)&v8->_launchPersona, a4);
  }

  return v8;
}

+ (id)launchRequestWithUUID:(id)a3 launchPersona:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithUUID:launchPersona:", v7, v6);

  return v8;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (PKPersona)launchPersona
{
  return (PKPersona *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLaunchPersona:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchPersona, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
