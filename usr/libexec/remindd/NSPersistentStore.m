@implementation NSPersistentStore

- (NSCoreDataCoreSpotlightDelegate)rd_associatedCoreSpotlightDelegate
{
  return (NSCoreDataCoreSpotlightDelegate *)objc_getAssociatedObject(self, "rd_associatedCoreSpotlightDelegate");
}

- (void)setRd_associatedCoreSpotlightDelegate:(id)a3
{
  objc_setAssociatedObject(self, "rd_associatedCoreSpotlightDelegate", a3, (void *)1);
}

@end
