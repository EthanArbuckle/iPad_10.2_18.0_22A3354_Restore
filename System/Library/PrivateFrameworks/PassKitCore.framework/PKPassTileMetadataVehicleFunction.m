@implementation PKPassTileMetadataVehicleFunction

- (BOOL)_setUpWithDictionary:(id)a3 privateDictionary:(id)a4
{
  id v6;
  NSArray *v7;
  NSArray *vehicleFunctions;
  BOOL v9;
  NSObject *v10;
  void *v11;
  objc_super v13;
  uint8_t buf[4];
  PKPassTileMetadataVehicleFunction *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPassTileMetadataVehicleFunction;
  if (!-[PKPassTileMetadata _setUpWithDictionary:privateDictionary:](&v13, sel__setUpWithDictionary_privateDictionary_, v6, a4))
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("vehicleFunctions"));
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  vehicleFunctions = self->_vehicleFunctions;
  self->_vehicleFunctions = v7;

  if (!-[NSArray count](self->_vehicleFunctions, "count"))
  {
    PKLogFacilityTypeGetObject(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[PKPassTileMetadata identifier](self, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v15 = self;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "PKPassTileMetadataVehicleFunction (%p): tile %@ invalid - must have vehicle functions.", buf, 0x16u);

    }
    goto LABEL_7;
  }
  v9 = 1;
LABEL_8:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileMetadataVehicleFunction)initWithCoder:(id)a3
{
  id v4;
  PKPassTileMetadataVehicleFunction *v5;
  uint64_t v6;
  NSArray *vehicleFunctions;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassTileMetadataVehicleFunction;
  v5 = -[PKPassTileMetadata initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("vehicleFunctions"));
    v6 = objc_claimAutoreleasedReturnValue();
    vehicleFunctions = v5->_vehicleFunctions;
    v5->_vehicleFunctions = (NSArray *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassTileMetadataVehicleFunction;
  v4 = a3;
  -[PKPassTileMetadata encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_vehicleFunctions, CFSTR("vehicleFunctions"), v5.receiver, v5.super_class);

}

- (NSArray)vehicleFunctions
{
  return self->_vehicleFunctions;
}

- (void)setVehicleFunctions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleFunctions, 0);
}

@end
