@implementation PFXConstants

+ (void)initialize
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;

  if ((id)objc_opt_class(PFXConstants) == a1)
  {
    objc_opt_class(TCCommonMessages);
    PFXPropValApplePubDoubleParen = (uint64_t)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("-ibooks-%s"), "double-paren");
    PFXPropValApplePubRightParen = (uint64_t)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("-ibooks-%s"), "right-paren");
    v2 = objc_alloc((Class)NSString);
    PFXCommonEpubPackageStringNS = (uint64_t)objc_msgSend(v2, "initWithXmlString:", PFXCommonEpubOpfNS[0]);
    v3 = objc_alloc((Class)NSString);
    PFXCommonDublinCoreMetadataStringNS = (uint64_t)objc_msgSend(v3, "initWithXmlString:", PFXCommonDublinCoreMetadataNS[0]);
    v4 = objc_alloc((Class)NSString);
    PFXCommonEpubNavigationStringNS = (uint64_t)objc_msgSend(v4, "initWithXmlString:", PFXCommonEpubNavigationNS[0]);
    v5 = objc_alloc((Class)NSString);
    PFXCommonApplePubStringNS = (uint64_t)objc_msgSend(v5, "initWithXmlString:", PFXCommonApplePubNS[0]);
    v6 = objc_alloc((Class)NSString);
    PFXCommonOEBPSPackageMediaType = (uint64_t)objc_msgSend(v6, "initWithXmlString:", PFXCommonOEBPSPackageMediaTypeXmlChars);
  }
}

@end
