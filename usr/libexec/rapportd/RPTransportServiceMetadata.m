@implementation RPTransportServiceMetadata

+ (id)metadataWithDictionary:(id)a3
{
  id v3;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v6;
  void *v7;
  __objc2_class **v8;
  id v9;

  v3 = a3;
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v3, &off_10011AC20, TypeID, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "isEqual:", CFSTR("Bonjour")) & 1) != 0)
    v8 = &off_1001106A0;
  else
    v8 = &off_100110730;

  v9 = objc_msgSend(objc_alloc(*v8), "initWithDictionary:", v3);
  return v9;
}

- (RPTransportServiceMetadata)initWithTransportServiceType:(unint64_t)a3
{
  RPTransportServiceMetadata *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RPTransportServiceMetadata;
  result = -[RPTransportServiceMetadata init](&v5, "init");
  if (result)
    result->_serviceType = a3;
  return result;
}

- (RPTransportServiceMetadata)initWithDictionary:(id)a3
{
  id v4;
  RPTransportServiceMetadata *v5;
  id v6;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v9;
  uint64_t v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RPTransportServiceMetadata;
  v5 = -[RPTransportServiceMetadata init](&v12, "init");
  if (v5)
  {
    v6 = v4;
    TypeID = CFStringGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v6, &off_10011AC20, TypeID, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

    if (v9)
    {
      if (objc_msgSend(v9, "isEqual:", CFSTR("Bonjour")))
        v10 = 1;
      else
        v10 = -1;
    }
    else
    {
      v10 = -1;
    }

    v5->_serviceType = v10;
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  __CFString *v2;
  __CFString *v3;
  void *v4;
  _UNKNOWN **v6;
  __CFString *v7;

  v2 = CFSTR("Other");
  if (self->_serviceType == 1)
    v2 = CFSTR("Bonjour");
  v6 = &off_10011AC20;
  v7 = v2;
  v3 = v2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));

  return v4;
}

- (unint64_t)serviceType
{
  return self->_serviceType;
}

- (id)description
{
  return -[RPTransportServiceMetadata descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v4;
  id v5;
  const __CFString *v6;
  id v7;
  id v9;
  id v10;

  v10 = 0;
  v4 = objc_opt_class(self, a2, *(_QWORD *)&a3);
  NSAppendPrintF(&v10, "%@", v4);
  v5 = v10;
  v9 = v5;
  if (self->_serviceType == 1)
    v6 = CFSTR("Bonjour");
  else
    v6 = CFSTR("Other");
  NSAppendPrintF(&v9, ", serviceType %@", v6);
  v7 = v9;

  return v7;
}

@end
