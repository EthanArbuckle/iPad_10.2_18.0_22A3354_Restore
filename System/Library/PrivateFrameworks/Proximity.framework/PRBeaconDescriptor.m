@implementation PRBeaconDescriptor

- (PRBeaconDescriptor)init
{
  -[PRBeaconDescriptor doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (id)_initWithUUID:(id)a3 major:(id)a4 minor:(id)a5
{
  id v9;
  id v10;
  id v11;
  PRBeaconDescriptor *v12;
  id *p_isa;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PRBeaconDescriptor;
  v12 = -[PRBeaconDescriptor init](&v15, sel_init);
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_UUID, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithUUID:major:minor:", self->_UUID, self->_major, self->_minor);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *UUID;
  id v5;

  UUID = self->_UUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", UUID, CFSTR("UUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_major, CFSTR("major"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_minor, CFSTR("minor"));

}

- (PRBeaconDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PRBeaconDescriptor *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("major"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PRBeaconDescriptor _initWithUUID:major:minor:](self, "_initWithUUID:major:minor:", v5, v6, v7);
  return v8;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)major
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)minor
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)macAddress
{
  return self->_macAddress;
}

- (void)setMacAddress:(unint64_t)a3
{
  self->_macAddress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minor, 0);
  objc_storeStrong((id *)&self->_major, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (PRBeaconDescriptor)initWithUUID:(id)a3
{
  return (PRBeaconDescriptor *)-[PRBeaconDescriptor _initWithUUID:major:minor:](self, "_initWithUUID:major:minor:", a3, 0, 0);
}

- (PRBeaconDescriptor)initWithUUID:(id)a3 major:(unsigned __int16)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  void *v8;
  PRBeaconDescriptor *v9;

  v4 = a4;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithUnsignedShort:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PRBeaconDescriptor _initWithUUID:major:minor:](self, "_initWithUUID:major:minor:", v7, v8, 0);

  return v9;
}

- (PRBeaconDescriptor)initWithUUID:(id)a3 major:(unsigned __int16)a4 minor:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  PRBeaconDescriptor *v12;

  v5 = a5;
  v6 = a4;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a3;
  objc_msgSend(v8, "numberWithUnsignedShort:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PRBeaconDescriptor _initWithUUID:major:minor:](self, "_initWithUUID:major:minor:", v9, v10, v11);

  return v12;
}

@end
