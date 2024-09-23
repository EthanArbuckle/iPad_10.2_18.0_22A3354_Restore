@implementation AWDWAAssociatedAPInfo

- (void)dealloc
{
  objc_super v3;

  -[AWDWAAssociatedAPInfo setManufacturerElement:](self, "setManufacturerElement:", 0);
  -[AWDWAAssociatedAPInfo setModelName:](self, "setModelName:", 0);
  -[AWDWAAssociatedAPInfo setModelNumber:](self, "setModelNumber:", 0);
  -[AWDWAAssociatedAPInfo setDeviceNameElement:](self, "setDeviceNameElement:", 0);
  -[AWDWAAssociatedAPInfo setDeviceNameData:](self, "setDeviceNameData:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWAAssociatedAPInfo;
  -[AWDWAAssociatedAPInfo dealloc](&v3, sel_dealloc);
}

- (BOOL)hasManufacturerElement
{
  return self->_manufacturerElement != 0;
}

- (BOOL)hasModelName
{
  return self->_modelName != 0;
}

- (BOOL)hasModelNumber
{
  return self->_modelNumber != 0;
}

- (BOOL)hasDeviceNameElement
{
  return self->_deviceNameElement != 0;
}

- (BOOL)hasDeviceNameData
{
  return self->_deviceNameData != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWAAssociatedAPInfo;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWAAssociatedAPInfo description](&v3, sel_description), -[AWDWAAssociatedAPInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *manufacturerElement;
  NSString *modelName;
  NSString *modelNumber;
  NSString *deviceNameElement;
  NSString *deviceNameData;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  manufacturerElement = self->_manufacturerElement;
  if (manufacturerElement)
    objc_msgSend(v3, "setObject:forKey:", manufacturerElement, CFSTR("ManufacturerElement"));
  modelName = self->_modelName;
  if (modelName)
    objc_msgSend(v4, "setObject:forKey:", modelName, CFSTR("ModelName"));
  modelNumber = self->_modelNumber;
  if (modelNumber)
    objc_msgSend(v4, "setObject:forKey:", modelNumber, CFSTR("ModelNumber"));
  deviceNameElement = self->_deviceNameElement;
  if (deviceNameElement)
    objc_msgSend(v4, "setObject:forKey:", deviceNameElement, CFSTR("DeviceNameElement"));
  deviceNameData = self->_deviceNameData;
  if (deviceNameData)
    objc_msgSend(v4, "setObject:forKey:", deviceNameData, CFSTR("DeviceNameData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWAAssociatedAPInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_manufacturerElement)
    PBDataWriterWriteStringField();
  if (self->_modelName)
    PBDataWriterWriteStringField();
  if (self->_modelNumber)
    PBDataWriterWriteStringField();
  if (self->_deviceNameElement)
    PBDataWriterWriteStringField();
  if (self->_deviceNameData)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  if (self->_manufacturerElement)
    objc_msgSend(a3, "setManufacturerElement:");
  if (self->_modelName)
    objc_msgSend(a3, "setModelName:");
  if (self->_modelNumber)
    objc_msgSend(a3, "setModelNumber:");
  if (self->_deviceNameElement)
    objc_msgSend(a3, "setDeviceNameElement:");
  if (self->_deviceNameData)
    objc_msgSend(a3, "setDeviceNameData:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;

  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[3] = (id)-[NSString copyWithZone:](self->_manufacturerElement, "copyWithZone:", a3);
  v5[4] = (id)-[NSString copyWithZone:](self->_modelName, "copyWithZone:", a3);

  v5[5] = (id)-[NSString copyWithZone:](self->_modelNumber, "copyWithZone:", a3);
  v5[2] = (id)-[NSString copyWithZone:](self->_deviceNameElement, "copyWithZone:", a3);

  v5[1] = (id)-[NSString copyWithZone:](self->_deviceNameData, "copyWithZone:", a3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *manufacturerElement;
  NSString *modelName;
  NSString *modelNumber;
  NSString *deviceNameElement;
  NSString *deviceNameData;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    manufacturerElement = self->_manufacturerElement;
    if (!((unint64_t)manufacturerElement | *((_QWORD *)a3 + 3))
      || (v5 = -[NSString isEqual:](manufacturerElement, "isEqual:")) != 0)
    {
      modelName = self->_modelName;
      if (!((unint64_t)modelName | *((_QWORD *)a3 + 4))
        || (v5 = -[NSString isEqual:](modelName, "isEqual:")) != 0)
      {
        modelNumber = self->_modelNumber;
        if (!((unint64_t)modelNumber | *((_QWORD *)a3 + 5))
          || (v5 = -[NSString isEqual:](modelNumber, "isEqual:")) != 0)
        {
          deviceNameElement = self->_deviceNameElement;
          if (!((unint64_t)deviceNameElement | *((_QWORD *)a3 + 2))
            || (v5 = -[NSString isEqual:](deviceNameElement, "isEqual:")) != 0)
          {
            deviceNameData = self->_deviceNameData;
            if ((unint64_t)deviceNameData | *((_QWORD *)a3 + 1))
              LOBYTE(v5) = -[NSString isEqual:](deviceNameData, "isEqual:");
            else
              LOBYTE(v5) = 1;
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
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_manufacturerElement, "hash");
  v4 = -[NSString hash](self->_modelName, "hash") ^ v3;
  v5 = -[NSString hash](self->_modelNumber, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_deviceNameElement, "hash");
  return v6 ^ -[NSString hash](self->_deviceNameData, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 3))
    -[AWDWAAssociatedAPInfo setManufacturerElement:](self, "setManufacturerElement:");
  if (*((_QWORD *)a3 + 4))
    -[AWDWAAssociatedAPInfo setModelName:](self, "setModelName:");
  if (*((_QWORD *)a3 + 5))
    -[AWDWAAssociatedAPInfo setModelNumber:](self, "setModelNumber:");
  if (*((_QWORD *)a3 + 2))
    -[AWDWAAssociatedAPInfo setDeviceNameElement:](self, "setDeviceNameElement:");
  if (*((_QWORD *)a3 + 1))
    -[AWDWAAssociatedAPInfo setDeviceNameData:](self, "setDeviceNameData:");
}

- (NSString)manufacturerElement
{
  return self->_manufacturerElement;
}

- (void)setManufacturerElement:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSString)modelNumber
{
  return self->_modelNumber;
}

- (void)setModelNumber:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)deviceNameElement
{
  return self->_deviceNameElement;
}

- (void)setDeviceNameElement:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)deviceNameData
{
  return self->_deviceNameData;
}

- (void)setDeviceNameData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
