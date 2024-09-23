@implementation PXManualAVResourceReclamationController

- (void)reclaimResources
{
  id v3;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXConcreteAVResourceReclamationController reclamationEventDidOccur:](self, "reclamationEventDidOccur:", v3);

}

@end
