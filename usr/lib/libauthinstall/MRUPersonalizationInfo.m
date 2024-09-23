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
  v15 = -[MRUPersonalizationInfo init](&v19, sel_init);
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
  v5 = -[MRUPersonalizationInfo init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("hardwareInfo"));
    v6 = objc_claimAutoreleasedReturnValue();
    hardwareInfo = v5->_hardwareInfo;
    v5->_hardwareInfo = (MRUHardwareInfo *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("componentName"));
    v8 = objc_claimAutoreleasedReturnValue();
    componentName = v5->_componentName;
    v5->_componentName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("objectName"));
    v10 = objc_claimAutoreleasedReturnValue();
    objectName = v5->_objectName;
    v5->_objectName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("nonce"));
    v12 = objc_claimAutoreleasedReturnValue();
    nonce = v5->_nonce;
    v5->_nonce = (NSData *)v12;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("tagNumber")))
    {
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("tagNumber"));
      v14 = objc_claimAutoreleasedReturnValue();
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
  void *tagNumber;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  MRUPersonalizationInfo *v23;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  objc_super v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  _QWORD v37[2];
  _QWORD v38[2];
  uint64_t v39;
  _QWORD v40[3];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)MRUPersonalizationInfo;
  v7 = -[MRUPersonalizationInfo init](&v30, sel_init);
  if (!v7)
    goto LABEL_26;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HardwareInfo"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (*a4)
    {
      v18 = (void *)MEMORY[0x24BDD1540];
      v39 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No hardwareInfo in options dict"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Manta.MantaRestoreUtils"), 2, v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_25;
  }
  v9 = (void *)v8;
  v29 = 0;
  v10 = -[MRUHardwareInfo initWithOptions:error:]([MRUHardwareInfo alloc], "initWithOptions:error:", v8, &v29);
  v11 = v29;
  if (v10)
  {
    objc_storeStrong((id *)&v7->_hardwareInfo, v10);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ComponentName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      if (!*a4)
      {
        v16 = 1;
        goto LABEL_23;
      }
      v25 = (void *)MEMORY[0x24BDD1540];
      v28 = v11;
      v35 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No component name in options dict"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v13;
      v16 = 1;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Manta.MantaRestoreUtils"), 2, v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    v28 = v11;
    objc_storeStrong((id *)&v7->_componentName, v12);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ObjectName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_storeStrong((id *)&v7->_objectName, v13);
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Nonce"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_storeStrong((id *)&v7->_nonce, v14);
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TagNumber"));
        v15 = objc_claimAutoreleasedReturnValue();
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
        v27 = (void *)MEMORY[0x24BDD1540];
        v31 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No nonce in options dict"));
        tagNumber = (void *)objc_claimAutoreleasedReturnValue();
        v32 = tagNumber;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Manta.MantaRestoreUtils"), 2, v22);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        v16 = 1;
      }
LABEL_20:

LABEL_21:
      goto LABEL_22;
    }
    if (*a4)
    {
      v26 = (void *)MEMORY[0x24BDD1540];
      v33 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No object name in options dict"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v14;
      v16 = 1;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      tagNumber = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Manta.MantaRestoreUtils"), 2, tagNumber);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
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
    v21 = (void *)MEMORY[0x24BDD1540];
    v37[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to create hardwareInfo, options: %@"), v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = *MEMORY[0x24BDD1398];
    v38[0] = v12;
    v28 = v11;
    v38[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Manta.MantaRestoreUtils"), 3, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = 1;
LABEL_22:

  v11 = v28;
LABEL_23:

LABEL_24:
  if (!v16)
  {
LABEL_26:
    v23 = v7;
    goto LABEL_27;
  }
LABEL_25:
  v23 = 0;
LABEL_27:

  return v23;
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
  void *v5;
  NSNumber *tagNumber;
  void *v7;
  _QWORD v9[4];
  void *v10;
  __int128 v11;
  NSData *nonce;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("HardwareInfo");
  -[MRUHardwareInfo asDictionary](self->_hardwareInfo, "asDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v3;
  v11 = *(_OWORD *)&self->_componentName;
  v9[1] = CFSTR("ComponentName");
  v9[2] = CFSTR("ObjectName");
  v9[3] = CFSTR("Nonce");
  nonce = self->_nonce;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v10, v9, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  tagNumber = self->_tagNumber;
  if (tagNumber)
    objc_msgSend(v5, "setObject:forKey:", tagNumber, CFSTR("TagNumber"));
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v7;
}

- (NSString)_componentNameSuffix
{
  NSNumber *tagNumber;
  __CFString *v3;

  tagNumber = self->_tagNumber;
  if (tagNumber)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), -[NSNumber intValue](tagNumber, "intValue"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_24C5FF9F0;
  }
  return (NSString *)v3;
}

- (NSString)_propertyNameSuffix
{
  NSNumber *tagNumber;
  __CFString *v3;

  tagNumber = self->_tagNumber;
  if (tagNumber)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(",%d"), -[NSNumber intValue](tagNumber, "intValue"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_24C5FF9F0;
  }
  return (NSString *)v3;
}

- (NSString)ticketName
{
  void *v2;
  NSString *componentName;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  componentName = self->_componentName;
  -[MRUPersonalizationInfo _componentNameSuffix](self, "_componentNameSuffix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@%@,Ticket"), componentName, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)tag
{
  void *v2;
  NSString *componentName;
  NSString *objectName;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  componentName = self->_componentName;
  objectName = self->_objectName;
  -[MRUPersonalizationInfo _propertyNameSuffix](self, "_propertyNameSuffix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@,%@%@"), componentName, objectName, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)objectName
{
  return self->_objectName;
}

- (NSString)boardIDPropertyName
{
  void *v2;
  NSString *componentName;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  componentName = self->_componentName;
  -[MRUPersonalizationInfo _propertyNameSuffix](self, "_propertyNameSuffix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@,BoardID%@"), componentName, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)chipIDPropertyName
{
  void *v2;
  NSString *componentName;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  componentName = self->_componentName;
  -[MRUPersonalizationInfo _propertyNameSuffix](self, "_propertyNameSuffix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@,ChipID%@"), componentName, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)ecidPropertyName
{
  void *v2;
  NSString *componentName;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  componentName = self->_componentName;
  -[MRUPersonalizationInfo _propertyNameSuffix](self, "_propertyNameSuffix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@,ECID%@"), componentName, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)noncePropertyName
{
  void *v2;
  NSString *componentName;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  componentName = self->_componentName;
  -[MRUPersonalizationInfo _propertyNameSuffix](self, "_propertyNameSuffix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@,Nonce%@"), componentName, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)productionModePropertyName
{
  void *v2;
  NSString *componentName;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  componentName = self->_componentName;
  -[MRUPersonalizationInfo _propertyNameSuffix](self, "_propertyNameSuffix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@,ProductionMode%@"), componentName, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)securityDomainPropertyName
{
  void *v2;
  NSString *componentName;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  componentName = self->_componentName;
  -[MRUPersonalizationInfo _propertyNameSuffix](self, "_propertyNameSuffix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@,SecurityDomain%@"), componentName, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)securityModePropertyName
{
  void *v2;
  NSString *componentName;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  componentName = self->_componentName;
  -[MRUPersonalizationInfo _propertyNameSuffix](self, "_propertyNameSuffix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@,SecurityMode%@"), componentName, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSNumber *tagNumber;
  id v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(\n"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUHardwareInfo description](self->_hardwareInfo, "description");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "appendFormat:", CFSTR("\thardwareInfo: %s\n"), objc_msgSend(v7, "UTF8String"));

  -[MRUPersonalizationInfo ticketName](self, "ticketName");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "appendFormat:", CFSTR("\tticketName: %s\n"), objc_msgSend(v8, "UTF8String"));

  -[MRUPersonalizationInfo tag](self, "tag");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "appendFormat:", CFSTR("\ttagName: %s\n"), objc_msgSend(v9, "UTF8String"));

  -[NSData description](self->_nonce, "description");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "appendFormat:", CFSTR("\tnonce: %s\n"), objc_msgSend(v10, "UTF8String"));

  tagNumber = self->_tagNumber;
  if (tagNumber)
  {
    -[NSNumber description](tagNumber, "description");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "appendFormat:", CFSTR("\ttagNumber: %s\n"), objc_msgSend(v12, "UTF8String"));

  }
  objc_msgSend(v6, "appendString:", CFSTR(")"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

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
