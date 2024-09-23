@implementation VCIDApplicationSyncState

+ (id)JSONKeyPathsByPropertyKey
{
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("checksum");
  v3[1] = CFSTR("registeredDate");
  v4[0] = CFSTR("checksum");
  v4[1] = CFSTR("registeredDate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)checksum
{
  return self->_checksum;
}

- (void)setChecksum:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)registeredDate
{
  return self->_registeredDate;
}

- (void)setRegisteredDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredDate, 0);
  objc_storeStrong((id *)&self->_checksum, 0);
}

@end
