@implementation NSURL(TSUUTIUtilities)

- (uint64_t)tsu_UTI
{
  return objc_msgSend((id)objc_msgSend(a1, "path"), "tsu_pathUTI");
}

- (uint64_t)tsu_conformsToUTI:()TSUUTIUtilities
{
  return objc_msgSend((id)objc_msgSend(a1, "pathExtension"), "tsu_pathExtensionConformsToUTI:", a3);
}

@end
