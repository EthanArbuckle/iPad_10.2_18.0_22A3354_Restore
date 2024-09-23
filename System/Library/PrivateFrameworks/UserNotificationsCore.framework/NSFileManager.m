@implementation NSFileManager

uint64_t __104__NSFileManager_UserNotificationsCore__unc_contentsSortedByLastModificationDateOfDirectoryAtPath_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("lastModDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastModDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __104__NSFileManager_UserNotificationsCore__unc_contentsSortedByLastModificationDateOfDirectoryAtPath_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("path"));
}

@end
