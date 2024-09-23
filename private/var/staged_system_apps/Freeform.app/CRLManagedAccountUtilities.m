@implementation CRLManagedAccountUtilities

+ (BOOL)loggedInUserHasManagedAppleID
{
  BOOL v2;
  id v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v12;

  v12 = 0;
  v2 = +[CRLManagedAccountUtilities loggedInUserHasManagedAppleIDWithError:](CRLManagedAccountUtilities, "loggedInUserHasManagedAppleIDWithError:", &v12);
  v3 = v12;
  if (v3)
  {
    v4 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012490F8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E13A40(v5, v3, v4);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101249118);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE81F0(v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLManagedAccountUtilities loggedInUserHasManagedAppleID]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLManagedAccountUtilities.m"));
    v9 = objc_msgSend(v3, "code");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 26, 0, "Could not determine if iCloud account is Managed Apple ID, error: %zd %{public}@ %@", v9, v10, v3);

  }
  return v2;
}

+ (BOOL)loggedInUserHasPolicyRestriction
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AADataclassManager sharedManager](AADataclassManager, "sharedManager"));
  v3 = objc_msgSend(v2, "policyRestrictsDataclass:", ACAccountDataclassFreeform);

  return v3;
}

+ (BOOL)loggedInUserHasManagedAppleIDWithError:(id *)a3
{
  int HasManagedAppleID;
  BOOL v5;
  id v6;
  void *v7;
  unsigned int v8;
  char v10;

  v10 = 0;
  HasManagedAppleID = BRLoggedInUserHasManagedAppleID(&v10, a3);
  v5 = HasManagedAppleID;
  if (a3 && HasManagedAppleID)
  {
    v6 = 0;
    *a3 = 0;
  }
  else
  {
    if (!a3)
      return v10 && v5;
    v6 = *a3;
  }
  if (objc_msgSend(v6, "code") == (id)2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a3, "domain"));
    v8 = objc_msgSend(v7, "isEqualToString:", BRCloudDocsErrorDomain);

    if (v8)
    {
      *a3 = 0;
      v10 = 0;
    }
  }
  return v10 && v5;
}

@end
