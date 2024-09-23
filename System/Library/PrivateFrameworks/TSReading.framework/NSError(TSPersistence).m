@implementation NSError(TSPersistence)

+ (uint64_t)tsp_errorWithCode:()TSPersistence
{
  return objc_msgSend(a1, "tsp_errorWithCode:underlyingError:", a3, 0);
}

+ (id)tsp_errorWithCode:()TSPersistence underlyingError:
{
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v6 = a4;
  v7 = 0;
  v8 = CFSTR("The document was created with an unsupported application version");
  switch(a3)
  {
    case 0:
      UnsafePointer();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("This document is corrupt."), &stru_24D82FEB0, CFSTR("TSPersistence"));
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 1:
      UnsafePointer();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("An error occurred while reading the document."), &stru_24D82FEB0, CFSTR("TSPersistence"));
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 2:
    case 3:
      UnsafePointer();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Couldn\\U2019t auto-save document."), &stru_24D82FEB0, CFSTR("TSPersistence"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      UnsafePointer();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (a3 == 2)
        objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Your most recent changes might be lost."), &stru_24D82FEB0, CFSTR("TSPersistence"));
      else
        objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("The disk is full. Free up some space, then return to your presentation. Your most recent changes might be lost."), &stru_24D82FEB0, CFSTR("TSPersistence"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 4:
    case 5:
    case 6:
      UnsafePointer();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Encountered a critical error."), &stru_24D82FEB0, CFSTR("TSPersistence"));
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 7:
      UnsafePointer();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("To open this document, download the latest version of the app from the App Store."), &stru_24D82FEB0, CFSTR("TSPersistence"));
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 8:
      UnsafePointer();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("The document was created with an unsupported old application version"), &stru_24D82FEB0, CFSTR("TSPersistence"));
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 9:
      break;
    case 10:
      UnsafePointer();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Can\\U2019t open document without password."), &stru_24D82FEB0, CFSTR("TSPersistence"));
      v15 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v8 = (__CFString *)v15;

      v7 = 0;
      break;
    case 11:
      v7 = 0;
      v8 = CFSTR("View state version UUID does not match document's.");
      break;
    default:
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[NSError(TSPersistence) tsp_errorWithCode:underlyingError:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/NSError_TSPersistence.mm");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, v13, 83, CFSTR("Bad error code"));

      v7 = 0;
      v8 = 0;
      break;
  }
  objc_msgSend(a1, "tsu_errorWithDomain:code:alertTitle:alertMessage:underlyingError:", CFSTR("com.apple.iWork.TSPersistence"), a3, v8, v7, v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)tsp_recoverableErrorWithCode:()TSPersistence
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "tsp_errorWithCode:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tsp_recoverableErrorWithError:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)tsp_recoverableErrorWithError:()TSPersistence
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "userInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "mutableCopy");

    }
    else
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 1);
    }

    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("TSPErrorIsRecoverable"));
    v9 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v4, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, objc_msgSend(v4, "code"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (uint64_t)tsp_isRecoverable
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_msgSend(a1, "code");
  if (v3 == 11)
  {
    objc_msgSend(a1, "domain");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.iWork.TSPersistence")) & 1) != 0)
    {
      v4 = 1;
LABEL_5:

      return v4;
    }
  }
  objc_msgSend(a1, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("TSPErrorIsRecoverable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v6, "BOOLValue");

  if (v3 == 11)
    goto LABEL_5;
  return v4;
}

@end
