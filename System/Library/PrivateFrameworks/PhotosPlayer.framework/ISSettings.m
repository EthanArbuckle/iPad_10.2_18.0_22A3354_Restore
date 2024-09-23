@implementation ISSettings

+ (id)sharedInstance
{
  return 0;
}

- (void)save
{
  id v2;

  +[ISRootSettings sharedInstance](ISRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "save");

}

@end
