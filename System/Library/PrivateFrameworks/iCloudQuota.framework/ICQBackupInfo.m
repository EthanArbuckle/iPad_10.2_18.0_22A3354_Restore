@implementation ICQBackupInfo

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("noOfBackupDevices: %@, deviceGroups: %@"), self->_noOfBackupDevices, self->_deviceGroups);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICQBackupInfo *v4;

  v4 = objc_alloc_init(ICQBackupInfo);
  -[ICQBackupInfo setNoOfBackupDevices:](v4, "setNoOfBackupDevices:", self->_noOfBackupDevices);
  -[ICQBackupInfo setDeviceGroups:](v4, "setDeviceGroups:", self->_deviceGroups);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *noOfBackupDevices;
  id v5;

  noOfBackupDevices = self->_noOfBackupDevices;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", noOfBackupDevices, CFSTR("noOfBackupDevices"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceGroups, CFSTR("deviceGroups"));

}

- (ICQBackupInfo)initWithCoder:(id)a3
{
  id v4;
  ICQBackupInfo *v5;
  uint64_t v6;
  NSNumber *noOfBackupDevices;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *deviceGroups;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ICQBackupInfo;
  v5 = -[ICQBackupInfo init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("noOfBackupDevices"));
    v6 = objc_claimAutoreleasedReturnValue();
    noOfBackupDevices = v5->_noOfBackupDevices;
    v5->_noOfBackupDevices = (NSNumber *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("deviceGroups"));
    v11 = objc_claimAutoreleasedReturnValue();
    deviceGroups = v5->_deviceGroups;
    v5->_deviceGroups = (NSArray *)v11;

  }
  return v5;
}

- (NSNumber)noOfBackupDevices
{
  return self->_noOfBackupDevices;
}

- (void)setNoOfBackupDevices:(id)a3
{
  objc_storeStrong((id *)&self->_noOfBackupDevices, a3);
}

- (NSArray)deviceGroups
{
  return self->_deviceGroups;
}

- (void)setDeviceGroups:(id)a3
{
  objc_storeStrong((id *)&self->_deviceGroups, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceGroups, 0);
  objc_storeStrong((id *)&self->_noOfBackupDevices, 0);
}

@end
