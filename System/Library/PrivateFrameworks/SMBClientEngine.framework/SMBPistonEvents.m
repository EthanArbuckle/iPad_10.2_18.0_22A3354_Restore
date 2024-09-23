@implementation SMBPistonEvents

- (smb_lease_break)leaseBreak
{
  smb_lease_break *result;

  objc_copyStruct(retstr, &self->_leaseBreak, 32, 1, 0);
  return result;
}

- (void)setLeaseBreak:(smb_lease_break *)a3
{
  objc_copyStruct(&self->_leaseBreak, a3, 32, 1, 0);
}

@end
