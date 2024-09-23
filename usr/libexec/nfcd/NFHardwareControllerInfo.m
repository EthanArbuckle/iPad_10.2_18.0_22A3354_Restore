@implementation NFHardwareControllerInfo

- (NFHardwareControllerInfo)initWithDictionary:(id)a3
{
  id v4;
  NFHardwareControllerInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NFHardwareControllerInfo;
  v5 = -[NFHardwareControllerInfo init](&v20, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siliconVersion")));
    v5->_siliconVersion = (unint64_t)objc_msgSend(v6, "unsignedIntegerValue");

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siliconName")));
    v5->_siliconName = (unint64_t)objc_msgSend(v7, "unsignedIntegerValue");

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ROMVersion")));
    v5->_ROMVersion = (unint64_t)objc_msgSend(v8, "unsignedIntegerValue");

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firmwareVersion")));
    v5->_firmwareVersion = (unint64_t)objc_msgSend(v9, "unsignedIntegerValue");

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firmwareRevision")));
    v5->_firmwareRevision = (unint64_t)objc_msgSend(v10, "unsignedIntegerValue");

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("middlewareVersion")));
    v5->_middlewareVersion = (unint64_t)objc_msgSend(v11, "unsignedIntegerValue");

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasAntenna")));
    v5->_hasAntenna = objc_msgSend(v12, "BOOLValue");

    v5->_hasIcfResistor = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasMFW")));
    v5->_hasMFW = objc_msgSend(v13, "BOOLValue");

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasHLMSupport")));
    v5->_hasHLMSupport = objc_msgSend(v14, "BOOLValue");

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasLPEMSupport")));
    v5->_hasLPEMSupport = objc_msgSend(v15, "BOOLValue");

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasCarKeySupport")));
    v5->_hasCarKeySupport = objc_msgSend(v16, "BOOLValue");

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasReaderModeSupport")));
    v5->_hasReaderModeSupport = objc_msgSend(v17, "BOOLValue");

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("poweredRunDuringSleep")));
    v5->_poweredRunDuringSleep = objc_msgSend(v18, "BOOLValue");

  }
  return v5;
}

- (NFHardwareControllerInfo)initWithCoder:(id)a3
{
  id v4;
  NFHardwareControllerInfo *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NFHardwareControllerInfo;
  v5 = -[NFHardwareControllerInfo init](&v7, "init");
  if (v5)
  {
    v5->_siliconVersion = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("siliconVersion"));
    v5->_siliconName = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("siliconName"));
    v5->_ROMVersion = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ROMVersion"));
    v5->_firmwareVersion = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("firmwareVersion"));
    v5->_firmwareRevision = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("firmwareRevision"));
    v5->_middlewareVersion = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("middlewareVersion"));
    v5->_hasAntenna = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasAntenna"));
    v5->_hasIcfResistor = 0;
    v5->_hasMFW = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasMFW"));
    v5->_hasHLMSupport = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasHLMSupport"));
    v5->_hasLPEMSupport = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasLPEMSupport"));
    v5->_hasCarKeySupport = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasCarKeySupport"));
    v5->_hasReaderModeSupport = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasReaderModeSupport"));
    v5->_poweredRunDuringSleep = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("poweredRunDuringSleep"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t siliconVersion;
  id v5;

  siliconVersion = self->_siliconVersion;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", siliconVersion, CFSTR("siliconVersion"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_siliconName, CFSTR("siliconName"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_ROMVersion, CFSTR("ROMVersion"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_firmwareVersion, CFSTR("firmwareVersion"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_firmwareRevision, CFSTR("firmwareRevision"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_middlewareVersion, CFSTR("middlewareVersion"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasAntenna, CFSTR("hasAntenna"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasMFW, CFSTR("hasMFW"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasHLMSupport, CFSTR("hasHLMSupport"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasLPEMSupport, CFSTR("hasLPEMSupport"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasCarKeySupport, CFSTR("hasCarKeySupport"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasReaderModeSupport, CFSTR("hasReaderModeSupport"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_poweredRunDuringSleep, CFSTR("poweredRunDuringSleep"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)asDictionary
{
  NSMutableDictionary *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("0x%04x"), self->_siliconVersion);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, CFSTR("siliconVersion"));

  v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("0x%04x"), self->_siliconName);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, CFSTR("siliconName"));

  v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("0x%04x"), self->_ROMVersion);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, CFSTR("ROMVersion"));

  v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("0x%04x"), self->_firmwareVersion);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, CFSTR("firmwareVersion"));

  v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("0x%04x"), self->_firmwareRevision);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v8, CFSTR("firmwareRevision"));

  v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("0x%04x"), self->_middlewareVersion);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, CFSTR("middlewareVersion"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_hasAntenna));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v10, CFSTR("hasAntenna"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_hasMFW));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v11, CFSTR("hasMFW"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_hasHLMSupport));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v12, CFSTR("hasHLMSupport"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_hasLPEMSupport));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v13, CFSTR("hasLPEMSupport"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_hasCarKeySupport));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v14, CFSTR("hasCarKeySupport"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_hasReaderModeSupport));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v15, CFSTR("hasReaderModeSupport"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_poweredRunDuringSleep));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v16, CFSTR("poweredRunDuringSleep"));

  return v3;
}

- (unint64_t)siliconVersion
{
  return self->_siliconVersion;
}

- (unint64_t)siliconName
{
  return self->_siliconName;
}

- (unint64_t)ROMVersion
{
  return self->_ROMVersion;
}

- (unint64_t)firmwareVersion
{
  return self->_firmwareVersion;
}

- (unint64_t)firmwareRevision
{
  return self->_firmwareRevision;
}

- (unint64_t)middlewareVersion
{
  return self->_middlewareVersion;
}

- (BOOL)hasAntenna
{
  return self->_hasAntenna;
}

- (BOOL)hasIcfResistor
{
  return self->_hasIcfResistor;
}

- (BOOL)hasMFW
{
  return self->_hasMFW;
}

- (BOOL)hasHLMSupport
{
  return self->_hasHLMSupport;
}

- (BOOL)hasLPEMSupport
{
  return self->_hasLPEMSupport;
}

- (BOOL)poweredRunDuringSleep
{
  return self->_poweredRunDuringSleep;
}

- (BOOL)hasCarKeySupport
{
  return self->_hasCarKeySupport;
}

- (BOOL)hasReaderModeSupport
{
  return self->_hasReaderModeSupport;
}

@end
