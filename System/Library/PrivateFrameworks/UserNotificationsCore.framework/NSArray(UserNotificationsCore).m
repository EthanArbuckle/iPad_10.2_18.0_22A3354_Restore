@implementation NSArray(UserNotificationsCore)

- (id)unc_map:()UserNotificationsCore usingLibrarian:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __57__NSArray_UserNotificationsCore__unc_map_usingLibrarian___block_invoke;
    v11[3] = &unk_251AE0F60;
    v12 = v8;
    v14 = v6;
    v13 = v7;
    objc_msgSend(a1, "bs_each:", v11);

  }
  else
  {
    objc_msgSend(v8, "addObjectsFromArray:", a1);
  }

  return v9;
}

@end
