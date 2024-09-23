@implementation WiFiAnalyticsAWDWAAssociatedAPInfo

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
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWAAssociatedAPInfo;
  -[WiFiAnalyticsAWDWAAssociatedAPInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAnalyticsAWDWAAssociatedAPInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
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
  return WiFiAnalyticsAWDWAAssociatedAPInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_manufacturerElement)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_modelName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_modelNumber)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_deviceNameElement)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_deviceNameData)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_manufacturerElement)
  {
    objc_msgSend(v4, "setManufacturerElement:");
    v4 = v5;
  }
  if (self->_modelName)
  {
    objc_msgSend(v5, "setModelName:");
    v4 = v5;
  }
  if (self->_modelNumber)
  {
    objc_msgSend(v5, "setModelNumber:");
    v4 = v5;
  }
  if (self->_deviceNameElement)
  {
    objc_msgSend(v5, "setDeviceNameElement:");
    v4 = v5;
  }
  if (self->_deviceNameData)
  {
    objc_msgSend(v5, "setDeviceNameData:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_manufacturerElement, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_modelName, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[NSString copyWithZone:](self->_modelNumber, "copyWithZone:", a3);
  v11 = (void *)v5[5];
  v5[5] = v10;

  v12 = -[NSString copyWithZone:](self->_deviceNameElement, "copyWithZone:", a3);
  v13 = (void *)v5[2];
  v5[2] = v12;

  v14 = -[NSString copyWithZone:](self->_deviceNameData, "copyWithZone:", a3);
  v15 = (void *)v5[1];
  v5[1] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *manufacturerElement;
  NSString *modelName;
  NSString *modelNumber;
  NSString *deviceNameElement;
  NSString *deviceNameData;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((manufacturerElement = self->_manufacturerElement, !((unint64_t)manufacturerElement | v4[3]))
     || -[NSString isEqual:](manufacturerElement, "isEqual:"))
    && ((modelName = self->_modelName, !((unint64_t)modelName | v4[4]))
     || -[NSString isEqual:](modelName, "isEqual:"))
    && ((modelNumber = self->_modelNumber, !((unint64_t)modelNumber | v4[5]))
     || -[NSString isEqual:](modelNumber, "isEqual:"))
    && ((deviceNameElement = self->_deviceNameElement, !((unint64_t)deviceNameElement | v4[2]))
     || -[NSString isEqual:](deviceNameElement, "isEqual:")))
  {
    deviceNameData = self->_deviceNameData;
    if ((unint64_t)deviceNameData | v4[1])
      v10 = -[NSString isEqual:](deviceNameData, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
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
  _QWORD *v4;

  v4 = a3;
  if (v4[3])
    -[WiFiAnalyticsAWDWAAssociatedAPInfo setManufacturerElement:](self, "setManufacturerElement:");
  if (v4[4])
    -[WiFiAnalyticsAWDWAAssociatedAPInfo setModelName:](self, "setModelName:");
  if (v4[5])
    -[WiFiAnalyticsAWDWAAssociatedAPInfo setModelNumber:](self, "setModelNumber:");
  if (v4[2])
    -[WiFiAnalyticsAWDWAAssociatedAPInfo setDeviceNameElement:](self, "setDeviceNameElement:");
  if (v4[1])
    -[WiFiAnalyticsAWDWAAssociatedAPInfo setDeviceNameData:](self, "setDeviceNameData:");

}

- (NSString)manufacturerElement
{
  return self->_manufacturerElement;
}

- (void)setManufacturerElement:(id)a3
{
  objc_storeStrong((id *)&self->_manufacturerElement, a3);
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
  objc_storeStrong((id *)&self->_modelName, a3);
}

- (NSString)modelNumber
{
  return self->_modelNumber;
}

- (void)setModelNumber:(id)a3
{
  objc_storeStrong((id *)&self->_modelNumber, a3);
}

- (NSString)deviceNameElement
{
  return self->_deviceNameElement;
}

- (void)setDeviceNameElement:(id)a3
{
  objc_storeStrong((id *)&self->_deviceNameElement, a3);
}

- (NSString)deviceNameData
{
  return self->_deviceNameData;
}

- (void)setDeviceNameData:(id)a3
{
  objc_storeStrong((id *)&self->_deviceNameData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelNumber, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_manufacturerElement, 0);
  objc_storeStrong((id *)&self->_deviceNameElement, 0);
  objc_storeStrong((id *)&self->_deviceNameData, 0);
}

@end
