@implementation MBSBackupAttributes

- (void)dealloc
{
  objc_super v3;

  -[MBSBackupAttributes setDeviceClass:](self, "setDeviceClass:", 0);
  -[MBSBackupAttributes setProductType:](self, "setProductType:", 0);
  -[MBSBackupAttributes setSerialNumber:](self, "setSerialNumber:", 0);
  -[MBSBackupAttributes setDeviceColor:](self, "setDeviceColor:", 0);
  -[MBSBackupAttributes setHardwareModel:](self, "setHardwareModel:", 0);
  -[MBSBackupAttributes setMarketingName:](self, "setMarketingName:", 0);
  -[MBSBackupAttributes setDeviceEnclosureColor:](self, "setDeviceEnclosureColor:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MBSBackupAttributes;
  -[MBSBackupAttributes dealloc](&v3, "dealloc");
}

- (BOOL)hasDeviceClass
{
  return self->_deviceClass != 0;
}

- (BOOL)hasProductType
{
  return self->_productType != 0;
}

- (BOOL)hasSerialNumber
{
  return self->_serialNumber != 0;
}

- (BOOL)hasDeviceColor
{
  return self->_deviceColor != 0;
}

- (BOOL)hasHardwareModel
{
  return self->_hardwareModel != 0;
}

- (BOOL)hasMarketingName
{
  return self->_marketingName != 0;
}

- (BOOL)hasDeviceEnclosureColor
{
  return self->_deviceEnclosureColor != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBSBackupAttributes;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[MBSBackupAttributes description](&v3, "description"), -[MBSBackupAttributes dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *deviceClass;
  NSString *productType;
  NSString *serialNumber;
  NSString *deviceColor;
  NSString *hardwareModel;
  NSString *marketingName;
  NSString *deviceEnclosureColor;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v4 = v3;
  deviceClass = self->_deviceClass;
  if (deviceClass)
    objc_msgSend(v3, "setObject:forKey:", deviceClass, CFSTR("deviceClass"));
  productType = self->_productType;
  if (productType)
    objc_msgSend(v4, "setObject:forKey:", productType, CFSTR("productType"));
  serialNumber = self->_serialNumber;
  if (serialNumber)
    objc_msgSend(v4, "setObject:forKey:", serialNumber, CFSTR("serialNumber"));
  deviceColor = self->_deviceColor;
  if (deviceColor)
    objc_msgSend(v4, "setObject:forKey:", deviceColor, CFSTR("deviceColor"));
  hardwareModel = self->_hardwareModel;
  if (hardwareModel)
    objc_msgSend(v4, "setObject:forKey:", hardwareModel, CFSTR("hardwareModel"));
  marketingName = self->_marketingName;
  if (marketingName)
    objc_msgSend(v4, "setObject:forKey:", marketingName, CFSTR("marketingName"));
  deviceEnclosureColor = self->_deviceEnclosureColor;
  if (deviceEnclosureColor)
    objc_msgSend(v4, "setObject:forKey:", deviceEnclosureColor, CFSTR("deviceEnclosureColor"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000C48C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSString *deviceClass;
  NSString *productType;
  NSString *serialNumber;
  NSString *deviceColor;
  NSString *hardwareModel;
  NSString *marketingName;
  NSString *deviceEnclosureColor;

  deviceClass = self->_deviceClass;
  if (deviceClass)
    PBDataWriterWriteStringField(a3, deviceClass, 1);
  productType = self->_productType;
  if (productType)
    PBDataWriterWriteStringField(a3, productType, 2);
  serialNumber = self->_serialNumber;
  if (serialNumber)
    PBDataWriterWriteStringField(a3, serialNumber, 3);
  deviceColor = self->_deviceColor;
  if (deviceColor)
    PBDataWriterWriteStringField(a3, deviceColor, 4);
  hardwareModel = self->_hardwareModel;
  if (hardwareModel)
    PBDataWriterWriteStringField(a3, hardwareModel, 5);
  marketingName = self->_marketingName;
  if (marketingName)
    PBDataWriterWriteStringField(a3, marketingName, 6);
  deviceEnclosureColor = self->_deviceEnclosureColor;
  if (deviceEnclosureColor)
    PBDataWriterWriteStringField(a3, deviceEnclosureColor, 7);
}

- (void)copyTo:(id)a3
{
  if (self->_deviceClass)
    objc_msgSend(a3, "setDeviceClass:");
  if (self->_productType)
    objc_msgSend(a3, "setProductType:");
  if (self->_serialNumber)
    objc_msgSend(a3, "setSerialNumber:");
  if (self->_deviceColor)
    objc_msgSend(a3, "setDeviceColor:");
  if (self->_hardwareModel)
    objc_msgSend(a3, "setHardwareModel:");
  if (self->_marketingName)
    objc_msgSend(a3, "setMarketingName:");
  if (self->_deviceEnclosureColor)
    objc_msgSend(a3, "setDeviceEnclosureColor:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;

  v5 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");

  v5[1] = -[NSString copyWithZone:](self->_deviceClass, "copyWithZone:", a3);
  v5[6] = -[NSString copyWithZone:](self->_productType, "copyWithZone:", a3);

  v5[7] = -[NSString copyWithZone:](self->_serialNumber, "copyWithZone:", a3);
  v5[2] = -[NSString copyWithZone:](self->_deviceColor, "copyWithZone:", a3);

  v5[4] = -[NSString copyWithZone:](self->_hardwareModel, "copyWithZone:", a3);
  v5[5] = -[NSString copyWithZone:](self->_marketingName, "copyWithZone:", a3);

  v5[3] = -[NSString copyWithZone:](self->_deviceEnclosureColor, "copyWithZone:", a3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  NSString *deviceClass;
  NSString *productType;
  NSString *serialNumber;
  NSString *deviceColor;
  NSString *hardwareModel;
  NSString *marketingName;
  NSString *deviceEnclosureColor;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self));
  if (v5)
  {
    deviceClass = self->_deviceClass;
    if (!((unint64_t)deviceClass | *((_QWORD *)a3 + 1))
      || (v5 = -[NSString isEqual:](deviceClass, "isEqual:")) != 0)
    {
      productType = self->_productType;
      if (!((unint64_t)productType | *((_QWORD *)a3 + 6))
        || (v5 = -[NSString isEqual:](productType, "isEqual:")) != 0)
      {
        serialNumber = self->_serialNumber;
        if (!((unint64_t)serialNumber | *((_QWORD *)a3 + 7))
          || (v5 = -[NSString isEqual:](serialNumber, "isEqual:")) != 0)
        {
          deviceColor = self->_deviceColor;
          if (!((unint64_t)deviceColor | *((_QWORD *)a3 + 2))
            || (v5 = -[NSString isEqual:](deviceColor, "isEqual:")) != 0)
          {
            hardwareModel = self->_hardwareModel;
            if (!((unint64_t)hardwareModel | *((_QWORD *)a3 + 4))
              || (v5 = -[NSString isEqual:](hardwareModel, "isEqual:")) != 0)
            {
              marketingName = self->_marketingName;
              if (!((unint64_t)marketingName | *((_QWORD *)a3 + 5))
                || (v5 = -[NSString isEqual:](marketingName, "isEqual:")) != 0)
              {
                deviceEnclosureColor = self->_deviceEnclosureColor;
                if ((unint64_t)deviceEnclosureColor | *((_QWORD *)a3 + 3))
                  LOBYTE(v5) = -[NSString isEqual:](deviceEnclosureColor, "isEqual:");
                else
                  LOBYTE(v5) = 1;
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  NSUInteger v5;
  unint64_t v6;
  NSUInteger v7;
  unint64_t v8;

  v3 = -[NSString hash](self->_deviceClass, "hash");
  v4 = -[NSString hash](self->_productType, "hash") ^ v3;
  v5 = -[NSString hash](self->_serialNumber, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_deviceColor, "hash");
  v7 = -[NSString hash](self->_hardwareModel, "hash");
  v8 = v7 ^ -[NSString hash](self->_marketingName, "hash");
  return v6 ^ v8 ^ -[NSString hash](self->_deviceEnclosureColor, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[MBSBackupAttributes setDeviceClass:](self, "setDeviceClass:");
  if (*((_QWORD *)a3 + 6))
    -[MBSBackupAttributes setProductType:](self, "setProductType:");
  if (*((_QWORD *)a3 + 7))
    -[MBSBackupAttributes setSerialNumber:](self, "setSerialNumber:");
  if (*((_QWORD *)a3 + 2))
    -[MBSBackupAttributes setDeviceColor:](self, "setDeviceColor:");
  if (*((_QWORD *)a3 + 4))
    -[MBSBackupAttributes setHardwareModel:](self, "setHardwareModel:");
  if (*((_QWORD *)a3 + 5))
    -[MBSBackupAttributes setMarketingName:](self, "setMarketingName:");
  if (*((_QWORD *)a3 + 3))
    -[MBSBackupAttributes setDeviceEnclosureColor:](self, "setDeviceEnclosureColor:");
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSString)deviceColor
{
  return self->_deviceColor;
}

- (void)setDeviceColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)hardwareModel
{
  return self->_hardwareModel;
}

- (void)setHardwareModel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSString)marketingName
{
  return self->_marketingName;
}

- (void)setMarketingName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)deviceEnclosureColor
{
  return self->_deviceEnclosureColor;
}

- (void)setDeviceEnclosureColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
