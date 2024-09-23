@implementation THApplePubController

+ (BOOL)readAppPubFileToDocumentRoot:(id)a3 url:(id)a4 error:(id *)a5
{
  if (a5)
    *a5 = 0;
  objc_msgSend(a3, "setZipPackage:", a4);
  return objc_msgSend(a3, "readStructureFromURL:error:", a4, a5);
}

@end
