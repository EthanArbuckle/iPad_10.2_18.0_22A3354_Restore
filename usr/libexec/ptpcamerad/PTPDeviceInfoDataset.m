@implementation PTPDeviceInfoDataset

- (PTPDeviceInfoDataset)init
{
  PTPDeviceInfoDataset *v2;
  NSMutableData *v3;
  NSMutableData *content;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PTPDeviceInfoDataset;
  v2 = -[PTPDeviceInfoDataset init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableData *)objc_msgSend(objc_alloc((Class)NSMutableData), "initWithCapacity:", 35);
    content = v2->_content;
    v2->_content = v3;

    *(_WORD *)&v2->_dirty = 1;
  }
  return v2;
}

- (void)setContent:(id)a3
{
  id v5;
  unsigned __int16 *v6;
  char *v7;
  id v8;
  NSString *v9;
  NSString *vendorExtensionDescription;
  id v11;
  NSArray *v12;
  NSArray *operationsSupported;
  id v14;
  NSArray *v15;
  NSArray *eventsSupported;
  id v17;
  NSArray *v18;
  NSArray *devicePropertiesSupported;
  id v20;
  NSArray *v21;
  NSArray *captureFormats;
  id v23;
  NSArray *v24;
  NSArray *imageFormats;
  id v26;
  NSString *v27;
  NSString *manufacturer;
  id v29;
  NSString *v30;
  NSString *model;
  id v32;
  NSString *v33;
  NSString *deviceVersion;
  id v35;
  NSString *v36;
  NSString *serialNumber;
  unsigned __int16 *v38;

  objc_storeStrong((id *)&self->_content, a3);
  v5 = a3;
  v6 = (unsigned __int16 *)-[NSMutableData bytes](self->_content, "bytes");
  v7 = (char *)-[NSMutableData length](self->_content, "length") + (_QWORD)v6;
  v38 = v6;
  self->_standardVersion = sub_100027364((unint64_t *)&v38, (unint64_t)v7);
  self->_vendorExtensionID = sub_10002738C((unint64_t *)&v38, (unint64_t)v7);
  self->_vendorExtensionVersion = sub_100027364((unint64_t *)&v38, (unint64_t)v7);
  v8 = sub_1000274E0((const void **)&v38, (unint64_t)v7);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue(v8);
  vendorExtensionDescription = self->_vendorExtensionDescription;
  self->_vendorExtensionDescription = v9;

  self->_functionalMode = sub_100027364((unint64_t *)&v38, (unint64_t)v7);
  v11 = sub_100027750(&v38, (unint64_t)v7);
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue(v11);
  operationsSupported = self->_operationsSupported;
  self->_operationsSupported = v12;

  v14 = sub_100027750(&v38, (unint64_t)v7);
  v15 = (NSArray *)objc_claimAutoreleasedReturnValue(v14);
  eventsSupported = self->_eventsSupported;
  self->_eventsSupported = v15;

  v17 = sub_100027750(&v38, (unint64_t)v7);
  v18 = (NSArray *)objc_claimAutoreleasedReturnValue(v17);
  devicePropertiesSupported = self->_devicePropertiesSupported;
  self->_devicePropertiesSupported = v18;

  v20 = sub_100027750(&v38, (unint64_t)v7);
  v21 = (NSArray *)objc_claimAutoreleasedReturnValue(v20);
  captureFormats = self->_captureFormats;
  self->_captureFormats = v21;

  v23 = sub_100027750(&v38, (unint64_t)v7);
  v24 = (NSArray *)objc_claimAutoreleasedReturnValue(v23);
  imageFormats = self->_imageFormats;
  self->_imageFormats = v24;

  v26 = sub_1000274E0((const void **)&v38, (unint64_t)v7);
  v27 = (NSString *)objc_claimAutoreleasedReturnValue(v26);
  manufacturer = self->_manufacturer;
  self->_manufacturer = v27;

  v29 = sub_1000274E0((const void **)&v38, (unint64_t)v7);
  v30 = (NSString *)objc_claimAutoreleasedReturnValue(v29);
  model = self->_model;
  self->_model = v30;

  v32 = sub_1000274E0((const void **)&v38, (unint64_t)v7);
  v33 = (NSString *)objc_claimAutoreleasedReturnValue(v32);
  deviceVersion = self->_deviceVersion;
  self->_deviceVersion = v33;

  v35 = sub_1000274E0((const void **)&v38, (unint64_t)v7);
  v36 = (NSString *)objc_claimAutoreleasedReturnValue(v35);
  serialNumber = self->_serialNumber;
  self->_serialNumber = v36;

}

- (PTPDeviceInfoDataset)initWithData:(id)a3
{
  id v4;
  PTPDeviceInfoDataset *v5;
  id v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PTPDeviceInfoDataset;
  v5 = -[PTPDeviceInfoDataset init](&v8, "init");
  if (v5)
  {
    if ((unint64_t)objc_msgSend(v4, "length") < 0x23)
    {

      v5 = 0;
    }
    else
    {
      v6 = objc_msgSend(v4, "mutableCopy");
      -[PTPDeviceInfoDataset setContent:](v5, "setContent:", v6);

      v5->_readOnlyObject = 1;
    }
  }

  return v5;
}

- (PTPDeviceInfoDataset)initWithMutableData:(id)a3
{
  id v4;
  PTPDeviceInfoDataset *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PTPDeviceInfoDataset;
  v5 = -[PTPDeviceInfoDataset init](&v7, "init");
  if (v5)
  {
    if ((unint64_t)objc_msgSend(v4, "length") < 0x23)
    {

      v5 = 0;
    }
    else
    {
      -[PTPDeviceInfoDataset setContent:](v5, "setContent:", v4);
      v5->_readOnlyObject = 0;
    }
  }

  return v5;
}

- (void)updateContent
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v13;
  int64x2_t v14;
  int64x2_t v15;
  _WORD *v16;

  if (self->_dirty && !self->_readOnlyObject)
  {
    v3 = -[NSString length](self->_vendorExtensionDescription, "length");
    v4 = -[NSArray count](self->_operationsSupported, "count");
    v5 = -[NSArray count](self->_eventsSupported, "count");
    v6 = -[NSArray count](self->_devicePropertiesSupported, "count");
    v7 = -[NSArray count](self->_captureFormats, "count");
    v8 = -[NSArray count](self->_imageFormats, "count");
    v9 = -[NSString length](self->_manufacturer, "length");
    v10 = -[NSString length](self->_model, "length");
    v11 = -[NSString length](self->_deviceVersion, "length");
    v12 = -[NSString length](self->_serialNumber, "length");
    v13 = 2 * v12 + 2;
    if (!v12)
      v13 = 0;
    v14.i64[0] = v9;
    v14.i64[1] = v3;
    v15.i64[0] = v10;
    v15.i64[1] = v11;
    -[NSMutableData setLength:](self->_content, "setLength:", vaddvq_s64(vaddq_s64((int64x2_t)vbslq_s8((int8x16_t)vceqzq_s64(v14), (int8x16_t)xmmword_100037B20, (int8x16_t)vaddq_s64(vaddq_s64(v14, v14), (int64x2_t)xmmword_100037B10)), (int64x2_t)vbicq_s8((int8x16_t)vaddq_s64(vaddq_s64(v15, v15), vdupq_n_s64(2uLL)), (int8x16_t)vceqzq_s64(v15))))+ v13+ 2 * (v5 + v4 + v6 + v7 + v8));
    v16 = -[NSMutableData mutableBytes](self->_content, "mutableBytes");
    sub_100027338(&v16, self->_standardVersion);
    sub_1000273B4((_DWORD **)&v16, self->_vendorExtensionID);
    sub_100027338(&v16, self->_vendorExtensionVersion);
    sub_100027514((_BYTE **)&v16, self->_vendorExtensionDescription);
    sub_100027338(&v16, self->_functionalMode);
    sub_10002778C(&v16, self->_operationsSupported);
    sub_10002778C(&v16, self->_eventsSupported);
    sub_10002778C(&v16, self->_devicePropertiesSupported);
    sub_10002778C(&v16, self->_captureFormats);
    sub_10002778C(&v16, self->_imageFormats);
    sub_100027514((_BYTE **)&v16, self->_manufacturer);
    sub_100027514((_BYTE **)&v16, self->_model);
    sub_100027514((_BYTE **)&v16, self->_deviceVersion);
    sub_100027514((_BYTE **)&v16, self->_serialNumber);
    self->_dirty = 0;
  }
}

- (NSMutableData)content
{
  -[PTPDeviceInfoDataset updateContent](self, "updateContent");
  return self->_content;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  __CFString *v31;
  void *v32;
  uint64_t v33;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<PTPDeviceInfoDataset %p>{\n  _standardVersion:            %d\n  _vendorExtensionID:          %lu\n  _vendorExtensionVersion:     %d\n  _vendorExtensionDescription: %@\n  _functionalMode:             %d\n  _operationsSupported:\n    {\n"), self, self->_standardVersion, self->_vendorExtensionID, self->_vendorExtensionVersion, self->_vendorExtensionDescription, self->_functionalMode));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectEnumerator](self->_operationsSupported, "objectEnumerator"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextObject"));
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      v7 = sub_100027910((uint64_t)objc_msgSend(v6, "unsignedShortValue"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      objc_msgSend(v3, "appendFormat:", CFSTR("      %@\n"), v8);

      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextObject"));
      v6 = (void *)v9;
    }
    while (v9);
  }
  objc_msgSend(v3, "appendString:", CFSTR("    }\n  _eventsSupported:\n    {\n"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectEnumerator](self->_eventsSupported, "objectEnumerator"));

  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nextObject"));
  if (v11)
  {
    v12 = (void *)v11;
    do
    {
      v13 = sub_1000284BC((int)objc_msgSend(v12, "unsignedShortValue"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      objc_msgSend(v3, "appendFormat:", CFSTR("      %@\n"), v14);

      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nextObject"));
      v12 = (void *)v15;
    }
    while (v15);
  }
  objc_msgSend(v3, "appendString:", CFSTR("    }\n  _devicePropertiesSupported:\n    {\n"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectEnumerator](self->_devicePropertiesSupported, "objectEnumerator"));

  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "nextObject"));
  if (v17)
  {
    v18 = (void *)v17;
    do
    {
      v19 = sub_100028670((uint64_t)objc_msgSend(v18, "unsignedShortValue"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      objc_msgSend(v3, "appendFormat:", CFSTR("      %@\n"), v20);

      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "nextObject"));
      v18 = (void *)v21;
    }
    while (v21);
  }
  objc_msgSend(v3, "appendString:", CFSTR("    }\n  _captureFormats:\n    {\n"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectEnumerator](self->_captureFormats, "objectEnumerator"));

  v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "nextObject"));
  if (v23)
  {
    v24 = (void *)v23;
    do
    {
      v25 = sub_1000288B4((int)objc_msgSend(v24, "unsignedShortValue"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      objc_msgSend(v3, "appendFormat:", CFSTR("      %@\n"), v26);

      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "nextObject"));
      v24 = (void *)v27;
    }
    while (v27);
  }
  objc_msgSend(v3, "appendString:", CFSTR("    }\n  _imageFormats:\n    {\n"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectEnumerator](self->_imageFormats, "objectEnumerator"));

  v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "nextObject"));
  if (v29)
  {
    v30 = (void *)v29;
    do
    {
      v31 = sub_1000288B4((int)objc_msgSend(v30, "unsignedShortValue"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      objc_msgSend(v3, "appendFormat:", CFSTR("      %@\n"), v32);

      v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "nextObject"));
      v30 = (void *)v33;
    }
    while (v33);
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("    }\n  _manufacturer:  %@\n  _model:         %@\n  _deviceVersion: %@\n  _serialNumber:  %@\n}"), self->_manufacturer, self->_model, self->_deviceVersion, self->_serialNumber);

  return v3;
}

- (unsigned)standardVersion
{
  return self->_standardVersion;
}

- (void)setStandardVersion:(unsigned __int16)a3
{
  self->_standardVersion = a3;
  self->_dirty = 1;
}

- (unsigned)vendorExtensionID
{
  return self->_vendorExtensionID;
}

- (void)setVendorExtensionID:(unsigned int)a3
{
  self->_vendorExtensionID = a3;
  self->_dirty = 1;
}

- (unsigned)vendorExtensionVersion
{
  return self->_vendorExtensionVersion;
}

- (void)setVendorExtensionVersion:(unsigned __int16)a3
{
  self->_vendorExtensionVersion = a3;
  self->_dirty = 1;
}

- (NSString)vendorExtensionDescription
{
  return self->_vendorExtensionDescription;
}

- (void)setVendorExtensionDescription:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_vendorExtensionDescription != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_vendorExtensionDescription, a3);
    v5 = v6;
    self->_dirty = 1;
  }

}

- (unsigned)functionalMode
{
  return self->_functionalMode;
}

- (void)setFunctionalMode:(unsigned __int16)a3
{
  self->_functionalMode = a3;
  self->_dirty = 1;
}

- (NSArray)operationsSupported
{
  return self->_operationsSupported;
}

- (void)setOperationsSupported:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *operationsSupported;

  if (self->_operationsSupported != a3)
  {
    v4 = a3;
    v5 = (NSArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v4);

    operationsSupported = self->_operationsSupported;
    self->_operationsSupported = v5;

    self->_dirty = 1;
  }
}

- (NSArray)eventsSupported
{
  return self->_eventsSupported;
}

- (void)setEventsSupported:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *eventsSupported;

  if (self->_eventsSupported != a3)
  {
    v4 = a3;
    v5 = (NSArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v4);

    eventsSupported = self->_eventsSupported;
    self->_eventsSupported = v5;

    self->_dirty = 1;
  }
}

- (NSArray)devicePropertiesSupported
{
  return self->_devicePropertiesSupported;
}

- (void)setDevicePropertiesSupported:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *devicePropertiesSupported;

  if (self->_devicePropertiesSupported != a3)
  {
    v4 = a3;
    v5 = (NSArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v4);

    devicePropertiesSupported = self->_devicePropertiesSupported;
    self->_devicePropertiesSupported = v5;

    self->_dirty = 1;
  }
}

- (NSArray)captureFormats
{
  return self->_captureFormats;
}

- (void)setCaptureFormats:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *captureFormats;

  if (self->_captureFormats != a3)
  {
    v4 = a3;
    v5 = (NSArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v4);

    captureFormats = self->_captureFormats;
    self->_captureFormats = v5;

    self->_dirty = 1;
  }
}

- (NSArray)imageFormats
{
  return self->_imageFormats;
}

- (void)setImageFormats:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *imageFormats;

  if (self->_imageFormats != a3)
  {
    v4 = a3;
    v5 = (NSArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v4);

    imageFormats = self->_imageFormats;
    self->_imageFormats = v5;

    self->_dirty = 1;
  }
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (void)setManufacturer:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_manufacturer != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_manufacturer, a3);
    v5 = v6;
    self->_dirty = 1;
  }

}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_model != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_model, a3);
    v5 = v6;
    self->_dirty = 1;
  }

}

- (NSString)deviceVersion
{
  return self->_deviceVersion;
}

- (void)setDeviceVersion:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_deviceVersion != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_deviceVersion, a3);
    v5 = v6;
    self->_dirty = 1;
  }

}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_serialNumber != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_serialNumber, a3);
    v5 = v6;
    self->_dirty = 1;
  }

}

- (id)canonicalManufacturer
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSString componentsSeparatedByString:](self->_manufacturer, "componentsSeparatedByString:", CFSTR(" ")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectEnumerator"));
  v5 = 0;
  v6 = CFSTR("NIKON");
  while (1)
  {
    v7 = v5;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextObject"));

    if (!v5)
    {
      v6 = self->_manufacturer;
      goto LABEL_9;
    }
    if (!objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("NIKON")))
      goto LABEL_9;
    if (!objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("CANON")))
      break;
    if (!objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("KODAK")))
    {
      v6 = CFSTR("KODAK");
      goto LABEL_9;
    }
  }
  v6 = &stru_10004A300;
LABEL_9:

  return v6;
}

- (BOOL)dirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (BOOL)readOnlyObject
{
  return self->_readOnlyObject;
}

- (void)setReadOnlyObject:(BOOL)a3
{
  self->_readOnlyObject = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_deviceVersion, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_imageFormats, 0);
  objc_storeStrong((id *)&self->_captureFormats, 0);
  objc_storeStrong((id *)&self->_devicePropertiesSupported, 0);
  objc_storeStrong((id *)&self->_eventsSupported, 0);
  objc_storeStrong((id *)&self->_operationsSupported, 0);
  objc_storeStrong((id *)&self->_vendorExtensionDescription, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end
