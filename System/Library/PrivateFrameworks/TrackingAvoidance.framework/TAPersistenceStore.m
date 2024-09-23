@implementation TAPersistenceStore

- (BOOL)isEqual:(id)a3
{
  void *v3;
  TAPersistenceStore *v5;
  TAPersistenceStore *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v5 = (TAPersistenceStore *)a3;
  if (self == v5)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[TAPersistenceStore deviceRecord](self, "deviceRecord");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAPersistenceStore deviceRecord](v6, "deviceRecord");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[TAPersistenceStore deviceRecord](self, "deviceRecord");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAPersistenceStore deviceRecord](v6, "deviceRecord");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "isEqual:", v3))
        {
          v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v16 = v9;
      }
      -[TAPersistenceStore visitState](self, "visitState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAPersistenceStore visitState](v6, "visitState");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v10 = 1;
      }
      else
      {
        -[TAPersistenceStore visitState](self, "visitState");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAPersistenceStore visitState](v6, "visitState");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v13, "isEqual:", v14);

      }
      v9 = v16;
      if (v7 == v8)
        goto LABEL_14;
      goto LABEL_13;
    }
    v10 = 0;
  }
LABEL_15:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAPersistenceStore)initWithCoder:(id)a3
{
  id v4;
  TAPersistenceStore *v5;
  uint64_t v6;
  TADeviceRecord *deviceRecord;
  uint64_t v8;
  TAVisitState *visitState;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TAPersistenceStore;
  v5 = -[TAPersistenceStore init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DeviceRecord"));
    v6 = objc_claimAutoreleasedReturnValue();
    deviceRecord = v5->_deviceRecord;
    v5->_deviceRecord = (TADeviceRecord *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VisitState"));
    v8 = objc_claimAutoreleasedReturnValue();
    visitState = v5->_visitState;
    v5->_visitState = (TAVisitState *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  TADeviceRecord *deviceRecord;
  id v5;

  deviceRecord = self->_deviceRecord;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", deviceRecord, CFSTR("DeviceRecord"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_visitState, CFSTR("VisitState"));

}

- (TADeviceRecord)deviceRecord
{
  return self->_deviceRecord;
}

- (void)setDeviceRecord:(id)a3
{
  objc_storeStrong((id *)&self->_deviceRecord, a3);
}

- (TAVisitState)visitState
{
  return self->_visitState;
}

- (void)setVisitState:(id)a3
{
  objc_storeStrong((id *)&self->_visitState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visitState, 0);
  objc_storeStrong((id *)&self->_deviceRecord, 0);
}

@end
