@implementation PFAIDocument

+ (void)initialize
{
  uint64_t v2;

  if ((id)objc_opt_class(PFAIDocument, a2) == a1)
    objc_opt_class(PFXConstants, v2);
}

+ (BOOL)mapArchive:(id)a3 toDocumentRoot:(id)a4 withUrl:(id)a5 isUpdate:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  PFAIPackageState *v11;
  unsigned __int8 v12;
  BOOL v13;

  v6 = a6;
  v10 = objc_alloc_init((Class)NSAutoreleasePool);
  v11 = -[PFAIPackageState initWithDocumentRoot:applePubURL:archive:]([PFAIPackageState alloc], "initWithDocumentRoot:applePubURL:archive:", a4, a5, a3);
  if (+[PFAIPackage readWithState:](PFAIPackage, "readWithState:", v11))
  {
    if (-[PFAIPackageState requiredVersion](v11, "requiredVersion") >= 3)
      +[NSException raise:format:](NSException, "raise:format:", NSGenericException, CFSTR("Wrong applepub version"));
    if (v6)
      v12 = +[PFAINavigation updateDocumentWithState:](PFAINavigation, "updateDocumentWithState:", v11);
    else
      v12 = +[PFAINavigation readDocumentWithState:](PFAINavigation, "readDocumentWithState:", v11);
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)readDocumentRoot:(id)a3 applePubURL:(id)a4 fromArchive:(id)a5
{
  return objc_msgSend(a1, "mapArchive:toDocumentRoot:withUrl:isUpdate:", a5, a3, a4, 0);
}

+ (BOOL)updateDocumentRoot:(id)a3 applePubURL:(id)a4 fromArchive:(id)a5
{
  return objc_msgSend(a1, "mapArchive:toDocumentRoot:withUrl:isUpdate:", a5, a3, a4, 1);
}

@end
