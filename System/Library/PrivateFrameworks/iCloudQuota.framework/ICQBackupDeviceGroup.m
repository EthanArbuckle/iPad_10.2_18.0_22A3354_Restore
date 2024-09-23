@implementation ICQBackupDeviceGroup

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sectionHeader: %@, sectionFooter: %@, backupDevices: %@"), self->_sectionHeader, self->_sectionFooter, self->_backupDevices);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICQBackupDeviceGroup *v4;

  v4 = objc_alloc_init(ICQBackupDeviceGroup);
  -[ICQBackupDeviceGroup setSectionHeader:](v4, "setSectionHeader:", self->_sectionHeader);
  -[ICQBackupDeviceGroup setSectionFooter:](v4, "setSectionFooter:", self->_sectionFooter);
  -[ICQBackupDeviceGroup setBackupDevices:](v4, "setBackupDevices:", self->_backupDevices);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *sectionHeader;
  id v5;

  sectionHeader = self->_sectionHeader;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sectionHeader, CFSTR("sectionHeader"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sectionFooter, CFSTR("sectionFooter"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_backupDevices, CFSTR("backupDevices"));

}

- (ICQBackupDeviceGroup)initWithCoder:(id)a3
{
  id v4;
  ICQBackupDeviceGroup *v5;
  uint64_t v6;
  NSString *sectionHeader;
  uint64_t v8;
  NSString *sectionFooter;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *backupDevices;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ICQBackupDeviceGroup;
  v5 = -[ICQBackupDeviceGroup init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sectionHeader"));
    v6 = objc_claimAutoreleasedReturnValue();
    sectionHeader = v5->_sectionHeader;
    v5->_sectionHeader = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sectionFooter"));
    v8 = objc_claimAutoreleasedReturnValue();
    sectionFooter = v5->_sectionFooter;
    v5->_sectionFooter = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("backupDevices"));
    v13 = objc_claimAutoreleasedReturnValue();
    backupDevices = v5->_backupDevices;
    v5->_backupDevices = (NSArray *)v13;

  }
  return v5;
}

- (NSString)sectionHeader
{
  return self->_sectionHeader;
}

- (void)setSectionHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)sectionFooter
{
  return self->_sectionFooter;
}

- (void)setSectionFooter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)backupDevices
{
  return self->_backupDevices;
}

- (void)setBackupDevices:(id)a3
{
  objc_storeStrong((id *)&self->_backupDevices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupDevices, 0);
  objc_storeStrong((id *)&self->_sectionFooter, 0);
  objc_storeStrong((id *)&self->_sectionHeader, 0);
}

@end
