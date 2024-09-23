@implementation FedStatsCohortQueryDeviceType

- (FedStatsCohortQueryDeviceType)initWithDeviceType:(id)a3
{
  id v5;
  FedStatsCohortQueryDeviceType *v6;
  FedStatsCohortQueryDeviceType *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FedStatsCohortQueryDeviceType;
  v6 = -[FedStatsCohortQueryDeviceType init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_deviceType, a3);

  return v7;
}

+ (id)cohortInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__FedStatsCohortQueryDeviceType_cohortInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (cohortInstance_onceToken[0] != -1)
    dispatch_once(cohortInstance_onceToken, block);
  return (id)cohortInstance_cohortInstance;
}

void __47__FedStatsCohortQueryDeviceType_cohortInstance__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  utsname v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  memset(&v6, 0, 512);
  uname(&v6);
  v2 = objc_alloc(*(Class *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v6.machine, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "initWithDeviceType:", v3);
  v5 = (void *)cohortInstance_cohortInstance;
  cohortInstance_cohortInstance = v4;

}

- (NSString)deviceType
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDeviceType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceType, 0);
}

@end
