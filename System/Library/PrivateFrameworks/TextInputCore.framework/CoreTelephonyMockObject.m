@implementation CoreTelephonyMockObject

- (CoreTelephonyMockObject)initWithCellularEid:(id)a3 cellularImei:(id)a4
{
  id v7;
  id v8;
  CoreTelephonyMockObject *v9;
  CoreTelephonyMockObject *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CoreTelephonyMockObject;
  v9 = -[CoreTelephonyMockObject init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cellularEid, a3);
    objc_storeStrong((id *)&v10->_cellularImei, a4);
  }

  return v10;
}

- (id)retrieveDeviceIdentifier:(int64_t)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 8;
  return *(id *)((char *)&self->super.isa + v3);
}

- (NSString)cellularEid
{
  return self->_cellularEid;
}

- (void)setCellularEid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)cellularImei
{
  return self->_cellularImei;
}

- (void)setCellularImei:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularImei, 0);
  objc_storeStrong((id *)&self->_cellularEid, 0);
}

@end
