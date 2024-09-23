@implementation FBSDisplayLayoutPublisherConfiguration(SBSContinuityDisplayLayout)

+ (id)configurationForContinuityDisplay
{
  id v0;

  v0 = objc_alloc_init(MEMORY[0x1E0D230F8]);
  objc_msgSend(v0, "setDomainIdentifier:", CFSTR("com.apple.frontboard"));
  objc_msgSend(v0, "setInstanceIdentifier:", CFSTR("com.apple.SpringBoard.continuity-display"));
  return v0;
}

@end
