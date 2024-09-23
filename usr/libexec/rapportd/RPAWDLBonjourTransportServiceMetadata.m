@implementation RPAWDLBonjourTransportServiceMetadata

- (RPAWDLBonjourTransportServiceMetadata)initWithSingleBandModeRequired:(BOOL)a3
{
  RPAWDLBonjourTransportServiceMetadata *v4;
  RPAWDLBonjourTransportServiceMetadata *v5;
  RPAWDLBonjourTransportServiceMetadata *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RPAWDLBonjourTransportServiceMetadata;
  v4 = -[RPTransportServiceMetadata initWithTransportServiceType:](&v8, "initWithTransportServiceType:", 1);
  v5 = v4;
  if (v4)
  {
    v4->_isSingleBandModeRequired = a3;
    v6 = v4;
  }

  return v5;
}

- (RPAWDLBonjourTransportServiceMetadata)initWithDictionary:(id)a3
{
  id v4;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v7;
  void *v8;
  uint64_t Int64;
  int v10;
  RPAWDLBonjourTransportServiceMetadata *v11;
  BOOL v12;
  char v13;
  RPAWDLBonjourTransportServiceMetadata *v14;
  objc_super v16;
  int v17;

  v4 = a3;
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v4, &off_10011AC20, TypeID, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  v8 = v7;
  if (v7 && (objc_msgSend(v7, "isEqual:", CFSTR("Bonjour")) & 1) != 0)
  {

    v17 = 0;
    Int64 = CFDictionaryGetInt64(v4, &off_10011AC38, &v17);
    v10 = v17;
    v16.receiver = self;
    v16.super_class = (Class)RPAWDLBonjourTransportServiceMetadata;
    v11 = -[RPTransportServiceMetadata initWithDictionary:](&v16, "initWithDictionary:", v4);
    if (v11)
    {
      if (v10)
        v12 = 1;
      else
        v12 = Int64 == 0;
      v13 = !v12;
      v11->_isSingleBandModeRequired = v13;
    }
    self = v11;
    v14 = self;
  }
  else
  {

    v14 = 0;
  }

  return v14;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  __CFDictionary *v5;
  const void **v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RPAWDLBonjourTransportServiceMetadata;
  v3 = -[RPTransportServiceMetadata dictionaryRepresentation](&v8, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (__CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v4));

  if (self->_isSingleBandModeRequired)
    v6 = (const void **)&kCFBooleanTrue;
  else
    v6 = (const void **)&kCFBooleanFalse;
  CFDictionarySetValue(v5, &off_10011AC38, *v6);
  return v5;
}

- (id)descriptionWithLevel:(int)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _BOOL4 isSingleBandModeRequired;
  id v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)RPAWDLBonjourTransportServiceMetadata;
  v4 = -[RPTransportServiceMetadata descriptionWithLevel:](&v11, "descriptionWithLevel:", *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v5, "mutableCopy");

  isSingleBandModeRequired = self->_isSingleBandModeRequired;
  v10 = v6;
  NSAppendPrintF(&v10, " single band required: %d", isSingleBandModeRequired);
  v7 = v10;

  return v7;
}

- (BOOL)isSingleBandModeRequired
{
  return self->_isSingleBandModeRequired;
}

@end
