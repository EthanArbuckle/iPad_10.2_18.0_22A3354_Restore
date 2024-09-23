@implementation MBBooksPlugin

- (id)_standardizePath:(id)a3 fromDomain:(id)a4
{
  id v7;

  v7 = objc_msgSend(a3, "stringByStandardizingPath");
  if (!objc_msgSend(v7, "isAbsolutePath"))
    return v7;
  if ((objc_msgSend(v7, "hasPrefix:", objc_msgSend(a4, "rootPath")) & 1) == 0)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBBooksPlugin.m"), 23, CFSTR("Absolute path doesn't have domain root %@ as prefix: %@"), objc_msgSend(a4, "rootPath"), v7);
  return objc_msgSend(v7, "substringFromIndex:", (char *)objc_msgSend(objc_msgSend(a4, "rootPath"), "length") + 1);
}

- (void)_populatePathsForEngine:(id)a3 domainName:(id)a4
{
  id v5;
  NSMutableSet *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v10[16];

  v5 = objc_msgSend(objc_msgSend(a3, "domainManager"), "domainForName:", a4);
  v6 = objc_opt_new(NSMutableSet);
  v7 = objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isEnterpriseBookBackupAllowed");
  if ((v7 & 1) == 0)
  {
    v9 = MBGetDefaultLog(v7, v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Managed books backup disallowed. Excluding from backup.", v10, 2u);
      _MBLog(CFSTR("INFO"), "Managed books backup disallowed. Excluding from backup.");
    }
    -[NSMutableSet addObject:](v6, "addObject:", -[MBBooksPlugin _standardizePath:fromDomain:](self, "_standardizePath:fromDomain:", CFSTR("/var/mobile/Media/Books/Managed"), v5));
  }
  if (objc_msgSend(v5, "relativePathsNotToBackup"))
    -[NSMutableSet unionSet:](v6, "unionSet:", objc_msgSend(v5, "relativePathsNotToBackup"));
  objc_msgSend(v5, "setRelativePathsNotToBackup:", v6);
}

- (id)startingBackupWithEngine:(id)a3
{
  if (objc_msgSend(a3, "backsUpPrimaryAccount"))
    -[MBBooksPlugin _populatePathsForEngine:domainName:](self, "_populatePathsForEngine:domainName:", a3, CFSTR("BooksDomain"));
  return 0;
}

@end
