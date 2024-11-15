@implementation SAAuxiliaryData

- (void)dealloc
{
  objc_super v3;

  FreeMountStatusData((char *)self->_mountStatus);
  v3.receiver = self;
  v3.super_class = (Class)SAAuxiliaryData;
  -[SAAuxiliaryData dealloc](&v3, sel_dealloc);
}

+ (id)auxiliaryDataForTimestamp:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  SAAuxiliaryData *v7;
  SAFanSpeed *v8;
  const char *v9;
  SAFanSpeed *v10;
  SEL v11;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[SATimestamp timestamp](SATimestamp, "timestamp");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  v7 = objc_alloc_init(SAAuxiliaryData);
  v8 = -[SAFanSpeed initWithTimestamp:]([SAFanSpeed alloc], "initWithTimestamp:", v6);
  v10 = v8;
  if (v7)
  {
    objc_setProperty_atomic(v7, v9, v8, 8);

    v7->_mountStatus = ($8EF4127CF77ECA3DDB612FCF233DC3A8 **)CopyMountStatusData();
    objc_setProperty_atomic(v7, v11, v6, 24);
  }
  else
  {

    CopyMountStatusData();
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_fanSpeed, 0);
}

@end
