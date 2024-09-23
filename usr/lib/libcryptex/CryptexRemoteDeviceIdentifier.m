@implementation CryptexRemoteDeviceIdentifier

- (CryptexRemoteDeviceIdentifier)initWithChipInstance:(const _img4_chip_instance *)a3
{
  CryptexRemoteDeviceIdentifier *v4;
  _img4_chip_instance *v5;
  objc_super v7;
  uint64_t v8;
  _OWORD v9[5];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)CryptexRemoteDeviceIdentifier;
  v4 = -[CryptexRemoteDeviceIdentifier init](&v7, sel_init);
  v5 = (_img4_chip_instance *)malloc_type_calloc(1uLL, 0x90uLL, 0x61D5536CuLL);
  if (!v5)
    -[CryptexRemoteDeviceIdentifier initWithChipInstance:].cold.1(&v8, v9);
  v4->_inst = v5;
  memmove(v5, a3, 0x90uLL);
  return v4;
}

- (void)dealloc
{
  _img4_chip_instance *inst;
  objc_super v4;

  inst = self->_inst;
  if (inst)
  {
    free(inst);
    self->_inst = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CryptexRemoteDeviceIdentifier;
  -[CryptexRemoteDeviceIdentifier dealloc](&v4, sel_dealloc);
}

- (_img4_chip_instance)inst
{
  return self->_inst;
}

- (void)initWithChipInstance:(_QWORD *)a1 .cold.1(_QWORD *a1, _OWORD *a2)
{
  int *v2;

  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_5();
  v2 = __error();
  OUTLINED_FUNCTION_4(v2);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

@end
