@implementation WBSCRDTGeneration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

- (WBSCRDTGeneration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  WBSCRDTGeneration *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("generation"));

  v7 = -[WBSCRDTGeneration initWithDeviceIdentifier:generation:](self, "initWithDeviceIdentifier:generation:", v5, v6);
  return v7;
}

- (WBSCRDTGeneration)initWithDeviceIdentifier:(id)a3 generation:(unint64_t)a4
{
  id v6;
  WBSCRDTGeneration *v7;
  uint64_t v8;
  NSString *deviceIdentifier;
  WBSCRDTGeneration *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSCRDTGeneration;
  v7 = -[WBSCRDTGeneration init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    deviceIdentifier = v7->_deviceIdentifier;
    v7->_deviceIdentifier = (NSString *)v8;

    v7->_generation = a4;
    v10 = v7;
  }

  return v7;
}

- (WBSCRDTGeneration)init
{
  return -[WBSCRDTGeneration initWithDeviceIdentifier:generation:](self, "initWithDeviceIdentifier:generation:", &stru_1E4B40D18, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)incrementedGenerationWithDeviceIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDeviceIdentifier:generation:", v4, self->_generation + 1);

  return v5;
}

- (BOOL)isValid
{
  return self->_generation && -[NSString length](self->_deviceIdentifier, "length") != 0;
}

- (int64_t)compare:(id)a3
{
  _QWORD *v4;
  unint64_t generation;
  unint64_t v6;
  NSComparisonResult v7;

  v4 = a3;
  generation = self->_generation;
  v6 = v4[2];
  if (generation >= v6)
  {
    if (generation > v6)
      v7 = NSOrderedDescending;
    else
      v7 = -[NSString compare:](self->_deviceIdentifier, "compare:", v4[1]);
  }
  else
  {
    v7 = NSOrderedAscending;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  WBSCRDTGeneration *v4;
  WBSCRDTGeneration *v5;
  WBSCRDTGeneration *v6;
  char v7;

  v4 = (WBSCRDTGeneration *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && self->_generation == v6->_generation)
      v7 = -[NSString isEqual:](self->_deviceIdentifier, "isEqual:", v6->_deviceIdentifier);
    else
      v7 = 0;

  }
  return v7;
}

- (unint64_t)hash
{
  return self->_generation ^ -[NSString hash](self->_deviceIdentifier, "hash");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("< %ld, %@ >"), self->_generation, self->_deviceIdentifier);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *deviceIdentifier;
  id v5;

  deviceIdentifier = self->_deviceIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", deviceIdentifier, CFSTR("deviceIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_generation, CFSTR("generation"));

}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (unint64_t)generation
{
  return self->_generation;
}

@end
