@implementation RPPerson

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPPerson)initWithCoder:(id)a3
{
  id v4;
  RPPerson *v5;
  id v6;
  id v7;
  id v8;
  RPPerson *v9;
  void *v10;
  objc_super v12;
  uint64_t v13;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RPPerson;
  v5 = -[RPPerson init](&v12, sel_init);
  if (!v5)
    goto LABEL_11;
  v13 = 0;
  if (NSDecodeSInt64RangedIfPresent())
    v5->_activityLevel = v13;
  v6 = v4;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  objc_opt_class();
  NSDecodeNSArrayOfClassIfPresent();
  v13 = 0;
  if (NSDecodeSInt64RangedIfPresent())
    v5->_flags = v13;
  v7 = v6;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  if (!v5->_identifier)
  {
    RPErrorF();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "failWithError:", v10);

LABEL_11:
    v9 = 0;
    goto LABEL_12;
  }
  v8 = v7;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  v13 = 0;
  if (NSDecodeSInt64RangedIfPresent())
    v5->_proximity = v13;
  objc_opt_class();
  NSDecodeObjectIfPresent();
  v9 = v5;
LABEL_12:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t activityLevel;
  NSString *contactID;
  NSArray *devices;
  uint64_t flags;
  NSString *identifier;
  NSString *name;
  uint64_t proximity;
  CURangingMeasurement *relativeLocation;
  id v13;

  v4 = a3;
  activityLevel = self->_activityLevel;
  v13 = v4;
  if ((_DWORD)activityLevel)
  {
    objc_msgSend(v4, "encodeInteger:forKey:", activityLevel, CFSTR("al"));
    v4 = v13;
  }
  contactID = self->_contactID;
  if (contactID)
  {
    objc_msgSend(v13, "encodeObject:forKey:", contactID, CFSTR("cnid"));
    v4 = v13;
  }
  devices = self->_devices;
  if (devices)
  {
    objc_msgSend(v13, "encodeObject:forKey:", devices, CFSTR("dv"));
    v4 = v13;
  }
  flags = self->_flags;
  if ((_DWORD)flags)
  {
    objc_msgSend(v13, "encodeInt64:forKey:", flags, CFSTR("fl"));
    v4 = v13;
  }
  identifier = self->_identifier;
  if (identifier)
  {
    objc_msgSend(v13, "encodeObject:forKey:", identifier, CFSTR("id"));
    v4 = v13;
  }
  name = self->_name;
  if (name)
  {
    objc_msgSend(v13, "encodeObject:forKey:", name, CFSTR("nm"));
    v4 = v13;
  }
  proximity = self->_proximity;
  if ((_DWORD)proximity)
  {
    objc_msgSend(v13, "encodeInteger:forKey:", proximity, CFSTR("px"));
    v4 = v13;
  }
  relativeLocation = self->_relativeLocation;
  if (relativeLocation)
  {
    objc_msgSend(v13, "encodeObject:forKey:", relativeLocation, CFSTR("rl"));
    v4 = v13;
  }

}

- (id)description
{
  return -[RPPerson descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v5;
  NSArray *v6;
  NSArray *v7;
  NSString *flags;
  NSArray *v9;
  NSString *name;
  NSArray *v11;
  NSString *contactID;
  NSArray *v13;
  int proximity;
  const char *v15;
  NSArray *v16;
  CURangingMeasurement *relativeLocation;
  NSArray *v18;
  unsigned int activityLevel;
  const char *v20;
  NSArray *v21;
  NSArray *v22;
  NSArray *v23;
  uint64_t v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  NSArray *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  NSArray *v38;
  NSArray *v39;
  NSString *identifier;
  const char *v42;
  NSString *v43;
  NSArray *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  NSArray *v49;
  NSArray *v50;
  NSArray *v51;
  NSArray *v52;
  NSArray *v53;
  NSArray *v54;
  uint64_t v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (a3 <= 49)
    v5 = 100;
  else
    v5 = 8;
  v55 = 0;
  identifier = self->_identifier;
  NSAppendPrintF();
  v6 = (NSArray *)0;
  v7 = v6;
  flags = (NSString *)self->_flags;
  if ((_DWORD)flags)
  {
    v54 = v6;
    identifier = flags;
    v43 = (NSString *)&unk_1AF3079BE;
    NSAppendPrintF();
    v9 = v54;

    v7 = v9;
  }
  name = self->_name;
  if (name)
  {
    v53 = v7;
    identifier = name;
    NSAppendPrintF();
    v11 = v7;

    v7 = v11;
  }
  contactID = self->_contactID;
  if (contactID)
  {
    v52 = v7;
    identifier = (NSString *)v5;
    v43 = contactID;
    NSAppendPrintF();
    v13 = v7;

    v7 = v13;
  }
  proximity = self->_proximity;
  if (proximity)
  {
    v51 = v7;
    switch(proximity)
    {
      case 10:
        v15 = "Immed";
        break;
      case 30:
        v15 = "Far";
        break;
      case 20:
        v15 = "Near";
        break;
      default:
        v15 = "?";
        break;
    }
    identifier = (NSString *)v15;
    NSAppendPrintF();
    v16 = v51;

    v7 = v16;
  }
  relativeLocation = self->_relativeLocation;
  if (relativeLocation)
  {
    v50 = v7;
    identifier = relativeLocation;
    NSAppendPrintF();
    v18 = v7;

    v7 = v18;
  }
  activityLevel = self->_activityLevel;
  if (activityLevel)
  {
    v49 = v7;
    if (activityLevel > 0xE)
      v20 = "?";
    else
      v20 = off_1E5F50A28[activityLevel - 1];
    identifier = (NSString *)v20;
    NSAppendPrintF();
    v21 = v49;

    v7 = v21;
  }
  v22 = self->_devices;
  v23 = v22;
  if (v22)
  {
    v24 = -[NSArray count](v22, "count", identifier);
    if (a3 > 49)
    {
      NSAppendPrintF();
      v39 = v7;
    }
    else
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v25 = v23;
      v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
      if (!v26)
      {
LABEL_44:

        goto LABEL_45;
      }
      v27 = v26;
      v44 = v23;
      v28 = 0;
      v29 = 1;
      v30 = v24;
      v31 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v46 != v31)
            objc_enumerationMutation(v25);
          v33 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          if ((v29 & 1) != 0)
          {
            v42 = (const char *)v30;
            NSAppendPrintF();
            v34 = v7;

            v7 = v34;
          }
          objc_msgSend(v33, "name", v42, v43);
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = (void *)v35;
          if (v35)
          {
            v37 = ", ";
            if (!v28)
              v37 = "";
            v42 = v37;
            v43 = (NSString *)v35;
            NSAppendPrintF();
            v38 = v7;

            ++v28;
            v7 = v38;
          }

          v29 = 0;
        }
        v27 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
        v29 = 0;
      }
      while (v27);

      NSAppendPrintF();
      v39 = v7;
      v23 = v44;
    }
    v25 = v7;
    v7 = v39;
    goto LABEL_44;
  }
LABEL_45:

  return v7;
}

- (unsigned)removeRPDevice:(id)a3
{
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *devices;
  unsigned int v8;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceDict, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceDict, "setObject:forKeyedSubscript:", 0, v4);
    -[NSMutableDictionary allValues](self->_deviceDict, "allValues");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    devices = self->_devices;
    self->_devices = v6;

    v8 = -[RPPerson _updateDeviceDerivedInfo](self, "_updateDeviceDerivedInfo") | 2;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unsigned)updateWithRPDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableDictionary *deviceDict;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NSArray *v10;
  NSArray *devices;
  unsigned int v12;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceDict, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  deviceDict = self->_deviceDict;
  if (!deviceDict)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_deviceDict;
    self->_deviceDict = v8;

    deviceDict = self->_deviceDict;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](deviceDict, "setObject:forKeyedSubscript:", v4, v5);
  -[NSMutableDictionary allValues](self->_deviceDict, "allValues");
  v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
  devices = self->_devices;
  self->_devices = v10;

  v12 = -[RPPerson _updateDeviceDerivedInfo](self, "_updateDeviceDerivedInfo") | (2 * (v6 == 0));
  return v12;
}

- (unsigned)_updateDeviceDerivedInfo
{
  unsigned int flags;
  NSMutableDictionary *deviceDict;
  int v5;
  uint64_t *v6;
  unsigned int v7;
  int v8;
  unsigned int v9;
  _QWORD v11[9];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  flags = self->_flags;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  deviceDict = self->_deviceDict;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __36__RPPerson__updateDeviceDerivedInfo__block_invoke;
  v11[3] = &unk_1E5F50A08;
  v11[4] = self;
  v11[5] = &v20;
  v11[6] = &v24;
  v11[7] = &v16;
  v11[8] = &v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceDict, "enumerateKeysAndObjectsUsingBlock:", v11);
  v5 = *((_DWORD *)v21 + 6);
  v6 = v25;
  if (v5 != self->_activityLevel)
  {
    self->_activityLevel = v5;
    *((_DWORD *)v6 + 6) |= 1u;
  }
  v7 = *((_DWORD *)v17 + 6);
  if (v7 != flags)
  {
    self->_flags = v7;
    *((_DWORD *)v6 + 6) |= 1u;
  }
  v8 = *((_DWORD *)v13 + 6);
  if (v8 == self->_proximity)
  {
    v9 = *((_DWORD *)v6 + 6);
  }
  else
  {
    self->_proximity = v8;
    v9 = *((_DWORD *)v6 + 6) | 4;
    *((_DWORD *)v6 + 6) = v9;
  }
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v9;
}

void __36__RPPerson__updateDeviceDerivedInfo__block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  int v4;
  uint64_t v5;
  void *v6;
  __int16 v7;
  int v8;
  uint64_t v9;
  int v10;
  id v11;

  v11 = a3;
  v4 = objc_msgSend(v11, "activityLevel");
  v5 = *(_QWORD *)(a1[5] + 8);
  if (v4 > *(_DWORD *)(v5 + 24))
    *(_DWORD *)(v5 + 24) = v4;
  if (!*(_QWORD *)(a1[4] + 24))
  {
    objc_msgSend(v11, "contactID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_storeStrong((id *)(a1[4] + 24), v6);
      *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) |= 1u;
    }

  }
  v7 = objc_msgSend(v11, "flags");
  if ((v7 & 8) != 0)
  {
    *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) |= 8u;
    if ((v7 & 0x10) == 0)
    {
LABEL_9:
      if ((v7 & 4) == 0)
        goto LABEL_10;
      goto LABEL_24;
    }
  }
  else if ((v7 & 0x10) == 0)
  {
    goto LABEL_9;
  }
  *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) |= 0x10u;
  if ((v7 & 4) == 0)
  {
LABEL_10:
    if ((v7 & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) |= 4u;
  if ((v7 & 0x20) == 0)
  {
LABEL_11:
    if ((v7 & 1) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) |= 0x20u;
  if ((v7 & 1) == 0)
  {
LABEL_12:
    if ((v7 & 2) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) |= 1u;
  if ((v7 & 2) == 0)
  {
LABEL_13:
    if ((v7 & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_28;
  }
LABEL_27:
  *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) |= 2u;
  if ((v7 & 0x40) == 0)
  {
LABEL_14:
    if ((v7 & 0x80) == 0)
      goto LABEL_15;
LABEL_29:
    *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) |= 0x80u;
    if ((v7 & 0x1000) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_28:
  *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) |= 0x40u;
  if ((v7 & 0x80) != 0)
    goto LABEL_29;
LABEL_15:
  if ((v7 & 0x1000) != 0)
LABEL_16:
    *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) |= 0x100u;
LABEL_17:
  v8 = objc_msgSend(v11, "proximity");
  if (v8)
  {
    v9 = *(_QWORD *)(a1[8] + 8);
    v10 = *(_DWORD *)(v9 + 24);
    if (!v10 || v8 < v10)
      *(_DWORD *)(v9 + 24) = v8;
  }

}

- (int)activityLevel
{
  return self->_activityLevel;
}

- (NSString)contactID
{
  return self->_contactID;
}

- (NSArray)devices
{
  return self->_devices;
}

- (unsigned)flags
{
  return self->_flags;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)name
{
  return self->_name;
}

- (int)proximity
{
  return self->_proximity;
}

- (CURangingMeasurement)relativeLocation
{
  return (CURangingMeasurement *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRelativeLocation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableDictionary)deviceDict
{
  return self->_deviceDict;
}

- (void)setDeviceDict:(id)a3
{
  objc_storeStrong((id *)&self->_deviceDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceDict, 0);
  objc_storeStrong((id *)&self->_relativeLocation, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_contactID, 0);
}

@end
