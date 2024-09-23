@implementation UAPBIRIdentityConverter

+ (void)registerConverter
{
  id v3;

  +[UASharedPasteboardIRManager sharedIRManager](UASharedPasteboardIRManager, "sharedIRManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerIRHandlerClass:forType:", a1, CFSTR("public.data"));

}

- (id)typeString
{
  return CFSTR("public.data");
}

- (id)convertPlatformDataToIR:(id)a3
{
  return a3;
}

- (id)convertIRDataToPlatform:(id)a3
{
  return a3;
}

@end
