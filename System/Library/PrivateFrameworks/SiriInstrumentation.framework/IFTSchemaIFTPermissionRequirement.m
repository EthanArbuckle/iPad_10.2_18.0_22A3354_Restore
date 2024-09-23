@implementation IFTSchemaIFTPermissionRequirement

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setSiriPermissionRequired:(BOOL)a3
{
  self->_shortcutsPermissionRequired = 0;
  self->_preciseLocationPermissionRequired = 0;
  self->_locationPermissionRequired = 0;
  self->_wifiPermissionRequired = 0;
  self->_bluetoothPermissionRequired = 0;
  self->_photosPermissionRequired = 0;
  self->_contactsPermissionRequired = 0;
  self->_whichOneof_Permissionrequirement = 1;
  self->_siriPermissionRequired = a3;
}

- (BOOL)siriPermissionRequired
{
  return self->_whichOneof_Permissionrequirement == 1 && self->_siriPermissionRequired;
}

- (void)deleteSiriPermissionRequired
{
  if (self->_whichOneof_Permissionrequirement == 1)
  {
    self->_whichOneof_Permissionrequirement = 0;
    self->_siriPermissionRequired = 0;
  }
}

- (void)setShortcutsPermissionRequired:(BOOL)a3
{
  self->_siriPermissionRequired = 0;
  self->_preciseLocationPermissionRequired = 0;
  self->_locationPermissionRequired = 0;
  self->_wifiPermissionRequired = 0;
  self->_bluetoothPermissionRequired = 0;
  self->_photosPermissionRequired = 0;
  self->_contactsPermissionRequired = 0;
  self->_whichOneof_Permissionrequirement = 2;
  self->_shortcutsPermissionRequired = a3;
}

- (BOOL)shortcutsPermissionRequired
{
  return self->_whichOneof_Permissionrequirement == 2 && self->_shortcutsPermissionRequired;
}

- (void)deleteShortcutsPermissionRequired
{
  if (self->_whichOneof_Permissionrequirement == 2)
  {
    self->_whichOneof_Permissionrequirement = 0;
    self->_shortcutsPermissionRequired = 0;
  }
}

- (void)setPreciseLocationPermissionRequired:(BOOL)a3
{
  self->_siriPermissionRequired = 0;
  self->_shortcutsPermissionRequired = 0;
  self->_locationPermissionRequired = 0;
  self->_wifiPermissionRequired = 0;
  self->_bluetoothPermissionRequired = 0;
  self->_photosPermissionRequired = 0;
  self->_contactsPermissionRequired = 0;
  self->_whichOneof_Permissionrequirement = 3;
  self->_preciseLocationPermissionRequired = a3;
}

- (BOOL)preciseLocationPermissionRequired
{
  return self->_whichOneof_Permissionrequirement == 3 && self->_preciseLocationPermissionRequired;
}

- (void)deletePreciseLocationPermissionRequired
{
  if (self->_whichOneof_Permissionrequirement == 3)
  {
    self->_whichOneof_Permissionrequirement = 0;
    self->_preciseLocationPermissionRequired = 0;
  }
}

- (void)setLocationPermissionRequired:(BOOL)a3
{
  self->_siriPermissionRequired = 0;
  self->_shortcutsPermissionRequired = 0;
  self->_preciseLocationPermissionRequired = 0;
  self->_wifiPermissionRequired = 0;
  self->_bluetoothPermissionRequired = 0;
  self->_photosPermissionRequired = 0;
  self->_contactsPermissionRequired = 0;
  self->_whichOneof_Permissionrequirement = 4;
  self->_locationPermissionRequired = a3;
}

- (BOOL)locationPermissionRequired
{
  return self->_whichOneof_Permissionrequirement == 4 && self->_locationPermissionRequired;
}

- (void)deleteLocationPermissionRequired
{
  if (self->_whichOneof_Permissionrequirement == 4)
  {
    self->_whichOneof_Permissionrequirement = 0;
    self->_locationPermissionRequired = 0;
  }
}

- (void)setWifiPermissionRequired:(BOOL)a3
{
  self->_siriPermissionRequired = 0;
  self->_shortcutsPermissionRequired = 0;
  self->_preciseLocationPermissionRequired = 0;
  self->_locationPermissionRequired = 0;
  self->_bluetoothPermissionRequired = 0;
  self->_photosPermissionRequired = 0;
  self->_contactsPermissionRequired = 0;
  self->_whichOneof_Permissionrequirement = 5;
  self->_wifiPermissionRequired = a3;
}

- (BOOL)wifiPermissionRequired
{
  return self->_whichOneof_Permissionrequirement == 5 && self->_wifiPermissionRequired;
}

- (void)deleteWifiPermissionRequired
{
  if (self->_whichOneof_Permissionrequirement == 5)
  {
    self->_whichOneof_Permissionrequirement = 0;
    self->_wifiPermissionRequired = 0;
  }
}

- (void)setBluetoothPermissionRequired:(BOOL)a3
{
  self->_siriPermissionRequired = 0;
  self->_shortcutsPermissionRequired = 0;
  self->_preciseLocationPermissionRequired = 0;
  self->_locationPermissionRequired = 0;
  self->_wifiPermissionRequired = 0;
  self->_photosPermissionRequired = 0;
  self->_contactsPermissionRequired = 0;
  self->_whichOneof_Permissionrequirement = 6;
  self->_bluetoothPermissionRequired = a3;
}

- (BOOL)bluetoothPermissionRequired
{
  return self->_whichOneof_Permissionrequirement == 6 && self->_bluetoothPermissionRequired;
}

- (void)deleteBluetoothPermissionRequired
{
  if (self->_whichOneof_Permissionrequirement == 6)
  {
    self->_whichOneof_Permissionrequirement = 0;
    self->_bluetoothPermissionRequired = 0;
  }
}

- (void)setPhotosPermissionRequired:(BOOL)a3
{
  self->_siriPermissionRequired = 0;
  self->_shortcutsPermissionRequired = 0;
  self->_preciseLocationPermissionRequired = 0;
  self->_locationPermissionRequired = 0;
  self->_wifiPermissionRequired = 0;
  self->_bluetoothPermissionRequired = 0;
  self->_contactsPermissionRequired = 0;
  self->_whichOneof_Permissionrequirement = 7;
  self->_photosPermissionRequired = a3;
}

- (BOOL)photosPermissionRequired
{
  return self->_whichOneof_Permissionrequirement == 7 && self->_photosPermissionRequired;
}

- (void)deletePhotosPermissionRequired
{
  if (self->_whichOneof_Permissionrequirement == 7)
  {
    self->_whichOneof_Permissionrequirement = 0;
    self->_photosPermissionRequired = 0;
  }
}

- (void)setContactsPermissionRequired:(BOOL)a3
{
  self->_siriPermissionRequired = 0;
  self->_shortcutsPermissionRequired = 0;
  self->_preciseLocationPermissionRequired = 0;
  self->_locationPermissionRequired = 0;
  self->_wifiPermissionRequired = 0;
  self->_bluetoothPermissionRequired = 0;
  self->_photosPermissionRequired = 0;
  self->_whichOneof_Permissionrequirement = 8;
  self->_contactsPermissionRequired = a3;
}

- (BOOL)contactsPermissionRequired
{
  return self->_whichOneof_Permissionrequirement == 8 && self->_contactsPermissionRequired;
}

- (void)deleteContactsPermissionRequired
{
  if (self->_whichOneof_Permissionrequirement == 8)
  {
    self->_whichOneof_Permissionrequirement = 0;
    self->_contactsPermissionRequired = 0;
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTPermissionRequirementReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  unint64_t whichOneof_Permissionrequirement;
  id v5;

  v5 = a3;
  whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  if (whichOneof_Permissionrequirement == 1)
  {
    PBDataWriterWriteBOOLField();
    whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  }
  if (whichOneof_Permissionrequirement == 2)
  {
    PBDataWriterWriteBOOLField();
    whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  }
  if (whichOneof_Permissionrequirement == 3)
  {
    PBDataWriterWriteBOOLField();
    whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  }
  if (whichOneof_Permissionrequirement == 4)
  {
    PBDataWriterWriteBOOLField();
    whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  }
  if (whichOneof_Permissionrequirement == 5)
  {
    PBDataWriterWriteBOOLField();
    whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  }
  if (whichOneof_Permissionrequirement == 6)
  {
    PBDataWriterWriteBOOLField();
    whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  }
  if (whichOneof_Permissionrequirement == 7)
  {
    PBDataWriterWriteBOOLField();
    whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  }
  if (whichOneof_Permissionrequirement == 8)
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichOneof_Permissionrequirement;
  int siriPermissionRequired;
  int shortcutsPermissionRequired;
  int preciseLocationPermissionRequired;
  int locationPermissionRequired;
  int wifiPermissionRequired;
  int bluetoothPermissionRequired;
  int photosPermissionRequired;
  int contactsPermissionRequired;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  if (whichOneof_Permissionrequirement != objc_msgSend(v4, "whichOneof_Permissionrequirement"))
    goto LABEL_11;
  siriPermissionRequired = self->_siriPermissionRequired;
  if (siriPermissionRequired == objc_msgSend(v4, "siriPermissionRequired")
    && (shortcutsPermissionRequired = self->_shortcutsPermissionRequired,
        shortcutsPermissionRequired == objc_msgSend(v4, "shortcutsPermissionRequired"))
    && (preciseLocationPermissionRequired = self->_preciseLocationPermissionRequired,
        preciseLocationPermissionRequired == objc_msgSend(v4, "preciseLocationPermissionRequired"))
    && (locationPermissionRequired = self->_locationPermissionRequired,
        locationPermissionRequired == objc_msgSend(v4, "locationPermissionRequired"))
    && (wifiPermissionRequired = self->_wifiPermissionRequired,
        wifiPermissionRequired == objc_msgSend(v4, "wifiPermissionRequired"))
    && (bluetoothPermissionRequired = self->_bluetoothPermissionRequired,
        bluetoothPermissionRequired == objc_msgSend(v4, "bluetoothPermissionRequired"))
    && (photosPermissionRequired = self->_photosPermissionRequired,
        photosPermissionRequired == objc_msgSend(v4, "photosPermissionRequired")))
  {
    contactsPermissionRequired = self->_contactsPermissionRequired;
    v14 = contactsPermissionRequired == objc_msgSend(v4, "contactsPermissionRequired");
  }
  else
  {
LABEL_11:
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = self->_whichOneof_Permissionrequirement - 1;
  if (v2 > 7)
    return 0;
  else
    return 2654435761 * *((unsigned __int8 *)&self->super.super.super.isa + *off_1E563DB98[v2]);
}

- (id)dictionaryRepresentation
{
  void *v3;
  unint64_t whichOneof_Permissionrequirement;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  if (whichOneof_Permissionrequirement == 6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTPermissionRequirement bluetoothPermissionRequired](self, "bluetoothPermissionRequired"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("bluetoothPermissionRequired"));

    whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  }
  if (whichOneof_Permissionrequirement == 8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTPermissionRequirement contactsPermissionRequired](self, "contactsPermissionRequired"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("contactsPermissionRequired"));

    whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  }
  if (whichOneof_Permissionrequirement == 4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTPermissionRequirement locationPermissionRequired](self, "locationPermissionRequired"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("locationPermissionRequired"));

    whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  }
  if (whichOneof_Permissionrequirement == 7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTPermissionRequirement photosPermissionRequired](self, "photosPermissionRequired"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("photosPermissionRequired"));

    whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  }
  if (whichOneof_Permissionrequirement == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTPermissionRequirement preciseLocationPermissionRequired](self, "preciseLocationPermissionRequired"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("preciseLocationPermissionRequired"));

    whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  }
  if (whichOneof_Permissionrequirement == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTPermissionRequirement shortcutsPermissionRequired](self, "shortcutsPermissionRequired"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("shortcutsPermissionRequired"));

    whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  }
  if (whichOneof_Permissionrequirement == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTPermissionRequirement siriPermissionRequired](self, "siriPermissionRequired"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("siriPermissionRequired"));

    whichOneof_Permissionrequirement = self->_whichOneof_Permissionrequirement;
  }
  if (whichOneof_Permissionrequirement == 5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTPermissionRequirement wifiPermissionRequired](self, "wifiPermissionRequired"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("wifiPermissionRequired"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTPermissionRequirement dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (IFTSchemaIFTPermissionRequirement)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTPermissionRequirement *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[IFTSchemaIFTPermissionRequirement initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTPermissionRequirement)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTPermissionRequirement *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  IFTSchemaIFTPermissionRequirement *v14;
  void *v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IFTSchemaIFTPermissionRequirement;
  v5 = -[IFTSchemaIFTPermissionRequirement init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriPermissionRequired"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTPermissionRequirement setSiriPermissionRequired:](v5, "setSiriPermissionRequired:", objc_msgSend(v6, "BOOLValue"));
    v16 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shortcutsPermissionRequired"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTPermissionRequirement setShortcutsPermissionRequired:](v5, "setShortcutsPermissionRequired:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preciseLocationPermissionRequired"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTPermissionRequirement setPreciseLocationPermissionRequired:](v5, "setPreciseLocationPermissionRequired:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locationPermissionRequired"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTPermissionRequirement setLocationPermissionRequired:](v5, "setLocationPermissionRequired:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wifiPermissionRequired"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTPermissionRequirement setWifiPermissionRequired:](v5, "setWifiPermissionRequired:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bluetoothPermissionRequired"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTPermissionRequirement setBluetoothPermissionRequired:](v5, "setBluetoothPermissionRequired:", objc_msgSend(v11, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("photosPermissionRequired"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTPermissionRequirement setPhotosPermissionRequired:](v5, "setPhotosPermissionRequired:", objc_msgSend(v12, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactsPermissionRequired"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTPermissionRequirement setContactsPermissionRequired:](v5, "setContactsPermissionRequired:", objc_msgSend(v13, "BOOLValue"));
    v14 = v5;

  }
  return v5;
}

- (unint64_t)whichOneof_Permissionrequirement
{
  return self->_whichOneof_Permissionrequirement;
}

- (BOOL)hasSiriPermissionRequired
{
  return self->_hasSiriPermissionRequired;
}

- (void)setHasSiriPermissionRequired:(BOOL)a3
{
  self->_hasSiriPermissionRequired = a3;
}

- (BOOL)hasShortcutsPermissionRequired
{
  return self->_hasShortcutsPermissionRequired;
}

- (void)setHasShortcutsPermissionRequired:(BOOL)a3
{
  self->_hasShortcutsPermissionRequired = a3;
}

- (BOOL)hasPreciseLocationPermissionRequired
{
  return self->_hasPreciseLocationPermissionRequired;
}

- (void)setHasPreciseLocationPermissionRequired:(BOOL)a3
{
  self->_hasPreciseLocationPermissionRequired = a3;
}

- (BOOL)hasLocationPermissionRequired
{
  return self->_hasLocationPermissionRequired;
}

- (void)setHasLocationPermissionRequired:(BOOL)a3
{
  self->_hasLocationPermissionRequired = a3;
}

- (BOOL)hasWifiPermissionRequired
{
  return self->_hasWifiPermissionRequired;
}

- (void)setHasWifiPermissionRequired:(BOOL)a3
{
  self->_hasWifiPermissionRequired = a3;
}

- (BOOL)hasBluetoothPermissionRequired
{
  return self->_hasBluetoothPermissionRequired;
}

- (void)setHasBluetoothPermissionRequired:(BOOL)a3
{
  self->_hasBluetoothPermissionRequired = a3;
}

- (BOOL)hasPhotosPermissionRequired
{
  return self->_hasPhotosPermissionRequired;
}

- (void)setHasPhotosPermissionRequired:(BOOL)a3
{
  self->_hasPhotosPermissionRequired = a3;
}

- (BOOL)hasContactsPermissionRequired
{
  return self->_hasContactsPermissionRequired;
}

- (void)setHasContactsPermissionRequired:(BOOL)a3
{
  self->_hasContactsPermissionRequired = a3;
}

@end
