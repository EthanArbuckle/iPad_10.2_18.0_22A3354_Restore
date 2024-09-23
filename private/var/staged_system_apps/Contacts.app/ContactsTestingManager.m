@implementation ContactsTestingManager

+ (id)defaultTestingManager
{
  if (qword_100025B98 != -1)
    dispatch_once(&qword_100025B98, &stru_10001C7C0);
  return (id)qword_100025B90;
}

- (BOOL)runTest:(id)a3 options:(id)a4 splitViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *v15;
  id v16;
  void *v17;
  unsigned __int8 v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsTestingManager currentTest](self, "currentTest"));
  objc_msgSend(v11, "prepareForNextTest");

  -[ContactsTestingManager setCurrentTest:](self, "setCurrentTest:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("testClass")));
  v13 = v12;
  if (v12)
    v14 = v12;
  else
    v14 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingString:", CFSTR("Test")));
  v15 = v14;

  v16 = -[objc_class testWithSplitViewController:](NSClassFromString(v15), "testWithSplitViewController:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  -[ContactsTestingManager setCurrentTest:](self, "setCurrentTest:", v17);
  v18 = objc_msgSend(v17, "prepareForTestWithOptions:", v9);

  return v18;
}

+ (id)contactToShowForLaunchTestWithStore:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v3 = a3;
  v4 = (void *)CFPreferencesCopyValue(CFSTR("LaunchToCard"), CFSTR("com.apple.PeoplePicker"), kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    v6 = (void *)CFPreferencesCopyValue(CFSTR("ContactToShow"), CFSTR("com.apple.PeoplePicker"), kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactViewController descriptorForRequiredKeys](CNContactViewController, "descriptorForRequiredKeys"));
      v11 = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "unifiedContactWithIdentifier:keysToFetch:error:", v6, v8, 0));

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)currentTest
{
  return self->_currentTest;
}

- (void)setCurrentTest:(id)a3
{
  objc_storeStrong(&self->_currentTest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentTest, 0);
}

@end
