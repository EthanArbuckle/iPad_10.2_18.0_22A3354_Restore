@implementation UARPiCloudAccessory

- (UARPiCloudAccessory)initWithProductGroup:(id)a3 productNumber:(id)a4 firmwareVersion:(id)a5
{
  id v8;
  id v9;
  id v10;
  UARPiCloudAccessory *v11;
  uint64_t v12;
  NSString *productGroup;
  uint64_t v14;
  NSString *productNumber;
  uint64_t v16;
  NSString *firmwareVersion;
  NSMutableArray *v18;
  NSMutableArray *availableRecords;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)UARPiCloudAccessory;
  v11 = -[UARPiCloudAccessory init](&v21, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    productGroup = v11->_productGroup;
    v11->_productGroup = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    productNumber = v11->_productNumber;
    v11->_productNumber = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    firmwareVersion = v11->_firmwareVersion;
    v11->_firmwareVersion = (NSString *)v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    availableRecords = v11->_availableRecords;
    v11->_availableRecords = v18;

    v11->_signatureValidationNeeded = 1;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UARPiCloudAccessory *v4;

  v4 = -[UARPiCloudAccessory initWithProductGroup:productNumber:firmwareVersion:]([UARPiCloudAccessory alloc], "initWithProductGroup:productNumber:firmwareVersion:", self->_productGroup, self->_productNumber, self->_firmwareVersion);
  -[UARPiCloudAccessory setRecord:](v4, "setRecord:", self->_record);
  -[UARPiCloudAccessory setChipFirmwareRecord:](v4, "setChipFirmwareRecord:", self->_chipFirmwareRecord);
  -[UARPiCloudAccessory setAvailableRecords:](v4, "setAvailableRecords:", self->_availableRecords);
  -[UARPiCloudAccessory setSignatureValidationNeeded:](v4, "setSignatureValidationNeeded:", self->_signatureValidationNeeded);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  UARPiCloudAccessory *v4;
  UARPiCloudAccessory *v5;
  NSString *productGroup;
  void *v7;
  NSString *productNumber;
  void *v9;
  char v10;

  v4 = (UARPiCloudAccessory *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self == v4)
    {
      v10 = 1;
    }
    else
    {
      v5 = v4;
      productGroup = self->_productGroup;
      -[UARPiCloudAccessory productGroup](v5, "productGroup");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](productGroup, "isEqualToString:", v7))
      {
        productNumber = self->_productNumber;
        -[UARPiCloudAccessory productNumber](v5, "productNumber");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[NSString isEqualToString:](productNumber, "isEqualToString:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setAvailableRecords:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *availableRecords;

  v4 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
  availableRecords = self->_availableRecords;
  self->_availableRecords = v4;

}

- (NSMutableArray)availableRecords
{
  return self->_availableRecords;
}

- (unint64_t)hash
{
  return getMultiValueHash(-[NSString hash](self->_productGroup, "hash"), -[NSString hash](self->_productNumber, "hash"));
}

- (NSString)productGroup
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)productNumber
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)firmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)signatureValidationNeeded
{
  return self->_signatureValidationNeeded;
}

- (void)setSignatureValidationNeeded:(BOOL)a3
{
  self->_signatureValidationNeeded = a3;
}

- (UARPiCloudAccessoryRecord)record
{
  return (UARPiCloudAccessoryRecord *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRecord:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (CHIPAccessoryFirmwareRecord)chipFirmwareRecord
{
  return (CHIPAccessoryFirmwareRecord *)objc_getProperty(self, a2, 56, 1);
}

- (void)setChipFirmwareRecord:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chipFirmwareRecord, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_productNumber, 0);
  objc_storeStrong((id *)&self->_productGroup, 0);
  objc_storeStrong((id *)&self->_availableRecords, 0);
}

@end
