@implementation MRUPersonalizationInfo

- (MRUPersonalizationInfo)initWithHardwareInfo:(id)a3 componentName:(id)a4 objectName:(id)a5 nonce:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  MRUPersonalizationInfo *v15;
  MRUPersonalizationInfo *v16;
  NSNumber *tagNumber;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MRUPersonalizationInfo;
  v15 = -[MRUPersonalizationInfo init](&v19, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_hardwareInfo, a3);
    objc_storeStrong((id *)&v16->_componentName, a4);
    objc_storeStrong((id *)&v16->_objectName, a5);
    objc_storeStrong((id *)&v16->_nonce, a6);
    tagNumber = v16->_tagNumber;
    v16->_tagNumber = 0;

  }
  return v16;
}

- (MRUPersonalizationInfo)initWithHardwareInfo:(id)a3 componentName:(id)a4 objectName:(id)a5 nonce:(id)a6 tagNumber:(id)a7
{
  id v13;
  MRUPersonalizationInfo *v14;
  MRUPersonalizationInfo *v15;

  v13 = a7;
  v14 = -[MRUPersonalizationInfo initWithHardwareInfo:componentName:objectName:nonce:](self, "initWithHardwareInfo:componentName:objectName:nonce:", a3, a4, a5, a6);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_tagNumber, a7);

  return v15;
}

- (MRUPersonalizationInfo)initWithCoder:(id)a3
{
  id v4;
  MRUPersonalizationInfo *v5;
  uint64_t v6;
  MRUHardwareInfo *hardwareInfo;
  uint64_t v8;
  NSString *componentName;
  uint64_t v10;
  NSString *objectName;
  uint64_t v12;
  NSData *nonce;
  uint64_t v14;
  NSNumber *tagNumber;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MRUPersonalizationInfo;
  v5 = -[MRUPersonalizationInfo init](&v17, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectForKey:", CFSTR("hardwareInfo")));
    hardwareInfo = v5->_hardwareInfo;
    v5->_hardwareInfo = (MRUHardwareInfo *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectForKey:", CFSTR("componentName")));
    componentName = v5->_componentName;
    v5->_componentName = (NSString *)v8;

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectForKey:", CFSTR("objectName")));
    objectName = v5->_objectName;
    v5->_objectName = (NSString *)v10;

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectForKey:", CFSTR("nonce")));
    nonce = v5->_nonce;
    v5->_nonce = (NSData *)v12;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("tagNumber")))
    {
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectForKey:", CFSTR("tagNumber")));
      tagNumber = v5->_tagNumber;
      v5->_tagNumber = (NSNumber *)v14;
    }
    else
    {
      tagNumber = v5->_tagNumber;
      v5->_tagNumber = 0;
    }

  }
  return v5;
}

- (MRUPersonalizationInfo)initWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  MRUPersonalizationInfo *v7;
  uint64_t v8;
  void *v9;
  MRUHardwareInfo *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  NSNumber *tagNumber;
  void *v18;
  void *v19;
  void *v20;
  MRUPersonalizationInfo *v21;
  id v23;
  id v24;
  objc_super v25;
  NSErrorUserInfoKey v26;
  NSNumber *v27;
  NSErrorUserInfoKey v28;
  void *v29;
  NSErrorUserInfoKey v30;
  void *v31;
  _QWORD v32[2];
  _QWORD v33[2];
  NSErrorUserInfoKey v34;
  void *v35;

  v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MRUPersonalizationInfo;
  v7 = -[MRUPersonalizationInfo init](&v25, "init");
  if (!v7)
    goto LABEL_26;
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HardwareInfo")));
  if (!v8)
  {
    if (*a4)
    {
      v34 = NSLocalizedDescriptionKey;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No hardwareInfo in options dict")));
      v35 = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Manta.MantaRestoreUtils"), 2, v19));

    }
    goto LABEL_25;
  }
  v9 = (void *)v8;
  v24 = 0;
  v10 = -[MRUHardwareInfo initWithOptions:error:]([MRUHardwareInfo alloc], "initWithOptions:error:", v8, &v24);
  v11 = v24;
  if (v10)
  {
    objc_storeStrong((id *)&v7->_hardwareInfo, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ComponentName")));
    if (!v12)
    {
      if (!*a4)
      {
        v16 = 1;
        goto LABEL_23;
      }
      v23 = v11;
      v30 = NSLocalizedDescriptionKey;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No component name in options dict")));
      v31 = v13;
      v16 = 1;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Manta.MantaRestoreUtils"), 2, v14));
      goto LABEL_21;
    }
    v23 = v11;
    objc_storeStrong((id *)&v7->_componentName, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ObjectName")));
    if (v13)
    {
      objc_storeStrong((id *)&v7->_objectName, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Nonce")));
      if (v14)
      {
        objc_storeStrong((id *)&v7->_nonce, v14);
        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TagNumber")));
        v16 = 0;
        tagNumber = v7->_tagNumber;
        v7->_tagNumber = (NSNumber *)v15;
      }
      else
      {
        if (!*a4)
        {
          v16 = 1;
          goto LABEL_21;
        }
        v26 = NSLocalizedDescriptionKey;
        tagNumber = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No nonce in options dict")));
        v27 = tagNumber;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Manta.MantaRestoreUtils"), 2, v20));

        v16 = 1;
      }
LABEL_20:

LABEL_21:
      goto LABEL_22;
    }
    if (*a4)
    {
      v28 = NSLocalizedDescriptionKey;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No object name in options dict")));
      v29 = v14;
      v16 = 1;
      tagNumber = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Manta.MantaRestoreUtils"), 2, tagNumber));
      goto LABEL_20;
    }
  }
  else
  {
    if (!*a4)
    {
      v16 = 1;
      goto LABEL_24;
    }
    v32[0] = NSLocalizedDescriptionKey;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to create hardwareInfo, options: %@"), v9));
    v32[1] = NSUnderlyingErrorKey;
    v33[0] = v12;
    v23 = v11;
    v33[1] = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 2));
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Manta.MantaRestoreUtils"), 3, v13));
  }
  v16 = 1;
LABEL_22:

  v11 = v23;
LABEL_23:

LABEL_24:
  if (!v16)
  {
LABEL_26:
    v21 = v7;
    goto LABEL_27;
  }
LABEL_25:
  v21 = 0;
LABEL_27:

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *tagNumber;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_hardwareInfo, CFSTR("hardwareInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_componentName, CFSTR("componentName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_objectName, CFSTR("objectName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nonce, CFSTR("nonce"));
  tagNumber = self->_tagNumber;
  if (tagNumber)
    objc_msgSend(v5, "encodeObject:forKey:", tagNumber, CFSTR("tagNumber"));

}

- (NSDictionary)asDictionary
{
  void *v3;
  void *v4;
  id v5;
  NSNumber *tagNumber;
  void *v7;
  _QWORD v9[4];
  void *v10;
  __int128 v11;
  NSData *nonce;

  v9[0] = CFSTR("HardwareInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRUHardwareInfo asDictionary](self->_hardwareInfo, "asDictionary"));
  v10 = v3;
  v11 = *(_OWORD *)&self->_componentName;
  v9[1] = CFSTR("ComponentName");
  v9[2] = CFSTR("ObjectName");
  v9[3] = CFSTR("Nonce");
  nonce = self->_nonce;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, v9, 4));
  v5 = objc_msgSend(v4, "mutableCopy");

  tagNumber = self->_tagNumber;
  if (tagNumber)
    objc_msgSend(v5, "setObject:forKey:", tagNumber, CFSTR("TagNumber"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v5));

  return (NSDictionary *)v7;
}

- (NSString)_componentNameSuffix
{
  NSNumber *tagNumber;
  __CFString *v3;

  tagNumber = self->_tagNumber;
  if (tagNumber)
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), -[NSNumber intValue](tagNumber, "intValue")));
  else
    v3 = &stru_100052650;
  return (NSString *)v3;
}

- (NSString)_propertyNameSuffix
{
  NSNumber *tagNumber;
  __CFString *v3;

  tagNumber = self->_tagNumber;
  if (tagNumber)
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(",%d"), -[NSNumber intValue](tagNumber, "intValue")));
  else
    v3 = &stru_100052650;
  return (NSString *)v3;
}

- (NSString)ticketName
{
  NSString *componentName;
  void *v3;
  void *v4;

  componentName = self->_componentName;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRUPersonalizationInfo _componentNameSuffix](self, "_componentNameSuffix"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@,Ticket"), componentName, v3));

  return (NSString *)v4;
}

- (NSString)tag
{
  NSString *componentName;
  NSString *objectName;
  void *v4;
  void *v5;

  componentName = self->_componentName;
  objectName = self->_objectName;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRUPersonalizationInfo _propertyNameSuffix](self, "_propertyNameSuffix"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@,%@%@"), componentName, objectName, v4));

  return (NSString *)v5;
}

- (NSString)objectName
{
  return self->_objectName;
}

- (NSString)boardIDPropertyName
{
  NSString *componentName;
  void *v3;
  void *v4;

  componentName = self->_componentName;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRUPersonalizationInfo _propertyNameSuffix](self, "_propertyNameSuffix"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@,BoardID%@"), componentName, v3));

  return (NSString *)v4;
}

- (NSString)chipIDPropertyName
{
  NSString *componentName;
  void *v3;
  void *v4;

  componentName = self->_componentName;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRUPersonalizationInfo _propertyNameSuffix](self, "_propertyNameSuffix"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@,ChipID%@"), componentName, v3));

  return (NSString *)v4;
}

- (NSString)ecidPropertyName
{
  NSString *componentName;
  void *v3;
  void *v4;

  componentName = self->_componentName;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRUPersonalizationInfo _propertyNameSuffix](self, "_propertyNameSuffix"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@,ECID%@"), componentName, v3));

  return (NSString *)v4;
}

- (NSString)noncePropertyName
{
  NSString *componentName;
  void *v3;
  void *v4;

  componentName = self->_componentName;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRUPersonalizationInfo _propertyNameSuffix](self, "_propertyNameSuffix"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@,Nonce%@"), componentName, v3));

  return (NSString *)v4;
}

- (NSString)productionModePropertyName
{
  NSString *componentName;
  void *v3;
  void *v4;

  componentName = self->_componentName;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRUPersonalizationInfo _propertyNameSuffix](self, "_propertyNameSuffix"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@,ProductionMode%@"), componentName, v3));

  return (NSString *)v4;
}

- (NSString)securityDomainPropertyName
{
  NSString *componentName;
  void *v3;
  void *v4;

  componentName = self->_componentName;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRUPersonalizationInfo _propertyNameSuffix](self, "_propertyNameSuffix"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@,SecurityDomain%@"), componentName, v3));

  return (NSString *)v4;
}

- (NSString)securityModePropertyName
{
  NSString *componentName;
  void *v3;
  void *v4;

  componentName = self->_componentName;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRUPersonalizationInfo _propertyNameSuffix](self, "_propertyNameSuffix"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@,SecurityMode%@"), componentName, v3));

  return (NSString *)v4;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSNumber *tagNumber;
  id v12;
  void *v13;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("%@(\n"), v5));

  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[MRUHardwareInfo description](self->_hardwareInfo, "description")));
  objc_msgSend(v6, "appendFormat:", CFSTR("\thardwareInfo: %s\n"), objc_msgSend(v7, "UTF8String"));

  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[MRUPersonalizationInfo ticketName](self, "ticketName")));
  objc_msgSend(v6, "appendFormat:", CFSTR("\tticketName: %s\n"), objc_msgSend(v8, "UTF8String"));

  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[MRUPersonalizationInfo tag](self, "tag")));
  objc_msgSend(v6, "appendFormat:", CFSTR("\ttagName: %s\n"), objc_msgSend(v9, "UTF8String"));

  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSData description](self->_nonce, "description")));
  objc_msgSend(v6, "appendFormat:", CFSTR("\tnonce: %s\n"), objc_msgSend(v10, "UTF8String"));

  tagNumber = self->_tagNumber;
  if (tagNumber)
  {
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSNumber description](tagNumber, "description")));
    objc_msgSend(v6, "appendFormat:", CFSTR("\ttagNumber: %s\n"), objc_msgSend(v12, "UTF8String"));

  }
  objc_msgSend(v6, "appendString:", CFSTR(")"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v6));

  return v13;
}

- (MRUHardwareInfo)hardwareInfo
{
  return (MRUHardwareInfo *)objc_getProperty(self, a2, 32, 1);
}

- (NSData)nonce
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_hardwareInfo, 0);
  objc_storeStrong((id *)&self->_tagNumber, 0);
  objc_storeStrong((id *)&self->_objectName, 0);
  objc_storeStrong((id *)&self->_componentName, 0);
}

@end
