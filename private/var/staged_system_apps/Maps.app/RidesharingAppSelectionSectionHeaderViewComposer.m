@implementation RidesharingAppSelectionSectionHeaderViewComposer

+ (void)configureHeader:(id)a3 withPrimaryText:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "localizedUppercaseString"));
  objc_msgSend(v5, "setMajorString:", v6);

}

@end
