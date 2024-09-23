@implementation NSURL

- (BOOL)rd_isExcludedFromBackup
{
  NSURL *v2;
  char isExcludedFrom;

  v2 = self;
  isExcludedFrom = NSURL.rd_isExcludedFromBackup.getter();

  return isExcludedFrom & 1;
}

- (void)setRd_isExcludedFromBackup:(BOOL)a3
{
  NSURL *v4;

  v4 = self;
  NSURL.rd_isExcludedFromBackup.setter(a3);

}

@end
