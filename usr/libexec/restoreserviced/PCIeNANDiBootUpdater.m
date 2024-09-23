@implementation PCIeNANDiBootUpdater

+ (id)IOMatchingPropertyTable
{
  const __CFString *v3;
  const __CFString *v4;

  v3 = CFSTR("IOProviderClass");
  v4 = CFSTR("AppleEmbeddedNVMeController");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1);
}

- (PCIeNANDiBootUpdater)initWithIOService:(unsigned int)a3
{
  uint64_t v3;
  PCIeNANDiBootUpdater *v4;
  PCIeNANDBootWriter *v5;
  objc_super v7;

  v3 = *(_QWORD *)&a3;
  v7.receiver = self;
  v7.super_class = (Class)PCIeNANDiBootUpdater;
  v4 = -[MSUBootFirmwareUpdater initWithIOService:](&v7, "initWithIOService:");
  if (v4)
  {
    v5 = -[PCIeNANDBootWriter initWithServiceNamed:parent:]([PCIeNANDBootWriter alloc], "initWithServiceNamed:parent:", CFSTR("EmbeddedDeviceTypePcieBootFirmware"), v3);
    v4->_writer = v5;
    if (!v5)
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PCIeNANDiBootUpdater;
  -[MSUBootFirmwareUpdater dealloc](&v3, "dealloc");
}

- (BOOL)updateBootFirmwareWithError:(id *)a3
{
  PCIeNANDBootWriter *v5;

  v5 = -[PCIeNANDiBootUpdater writer](self, "writer");
  -[PCIeNANDBootWriter setIsErase:](v5, "setIsErase:", -[MSUBootFirmwareUpdater isErase](self, "isErase"));
  -[PCIeNANDBootWriter setShouldCommit:](v5, "setShouldCommit:", -[MSUBootFirmwareUpdater shouldCommit](self, "shouldCommit"));
  return -[PCIeNANDBootWriter writeFirmware:error:](v5, "writeFirmware:error:", self, a3) == 0;
}

- (PCIeNANDBootWriter)writer
{
  return (PCIeNANDBootWriter *)objc_getProperty(self, a2, 88, 1);
}

@end
