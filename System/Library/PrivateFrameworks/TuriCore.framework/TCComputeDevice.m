@implementation TCComputeDevice

- (TCComputeDevice)initWithDevices:(id)a3 forceCPU:(BOOL)a4
{
  id v7;
  TCComputeDevice *v8;
  TCComputeDevice *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TCComputeDevice;
  v8 = -[TCComputeDevice init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_forceCPU = a4;
    objc_storeStrong((id *)&v8->_devices, a3);
  }

  return v9;
}

- (id)asMLCDevice
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[TCComputeDevice forceCPU](self, "forceCPU"))
  {
    v3 = (void *)MEMORY[0x24BDDAAC8];
    v4 = 0;
LABEL_6:
    objc_msgSend(v3, "deviceWithType:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    return v9;
  }
  -[TCComputeDevice devices](self, "devices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = (void *)MEMORY[0x24BDDAAC8];
  if (!v6)
  {
    v3 = (void *)MEMORY[0x24BDDAAC8];
    v4 = 2;
    goto LABEL_6;
  }
  -[TCComputeDevice devices](self, "devices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deviceWithGPUDevices:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)asMLCDevice:(int64_t)a3
{
  if (a3 == 1)
    objc_msgSend(MEMORY[0x24BDDAAC8], "deviceWithType:", 0);
  else
    -[TCComputeDevice asMLCDevice](self, "asMLCDevice");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)asVNDevice
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[TCComputeDevice forceCPU](self, "forceCPU"))
  {
    objc_msgSend(MEMORY[0x24BDF9C70], "defaultCPUDevice");
    v3 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v9 = (void *)v3;
    return v9;
  }
  -[TCComputeDevice devices](self, "devices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = (void *)MEMORY[0x24BDF9C70];
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDF9C70], "defaultMetalDevice");
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[TCComputeDevice devices](self, "devices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceForMetalDevice:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)asVNDevice:(int64_t)a3
{
  if (a3 == 1)
    objc_msgSend(MEMORY[0x24BDF9C70], "defaultCPUDevice");
  else
    -[TCComputeDevice asVNDevice](self, "asVNDevice");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_storeStrong((id *)&self->_devices, a3);
}

- (BOOL)forceCPU
{
  return self->_forceCPU;
}

- (void)setForceCPU:(BOOL)a3
{
  self->_forceCPU = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
}

@end
