@implementation UISceneSession

- (id)mf_objectForSessionInfoKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UISceneSession userInfo](self, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (NSString)mf_activeDraftIdentifier
{
  return (NSString *)-[UISceneSession mf_objectForSessionInfoKey:](self, "mf_objectForSessionInfoKey:", MailSceneSessionInfoActiveDraftIdentifier);
}

- (void)mf_setActiveDraftIdentifier:(id)a3
{
  -[UISceneSession mf_setObject:forSessionInfoKey:](self, "mf_setObject:forSessionInfoKey:", a3, MailSceneSessionInfoActiveDraftIdentifier);
}

- (void)mf_setObject:(id)a3 forSessionInfoKey:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(-[UISceneSession userInfo](self, "userInfo"));
  v8 = (void *)v7;
  v9 = &__NSDictionary0__struct;
  if (v7)
    v9 = (void *)v7;
  v10 = v9;

  v11 = objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, v6);
  -[UISceneSession setUserInfo:](self, "setUserInfo:", v11);

}

- (id)mf_debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  id v10;
  const __CFString *v11;
  void *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;

  v3 = objc_alloc_init((Class)NSMutableString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UISceneSession configuration](self, "configuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UISceneSession persistentIdentifier](self, "persistentIdentifier"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\t%@ (ID: %@)\n"), v5, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UISceneSession mf_activeDraftIdentifier](self, "mf_activeDraftIdentifier"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\t - Active Draft ID: %@\n"), v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UISceneSession scene](self, "scene"));
  v9 = CFSTR("YES");
  if (!v8)
    v9 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("\t - Attached: %@\n"), v9);
  if (v8)
  {
    v10 = objc_msgSend(v8, "activationState");
    if ((unint64_t)v10 > 2)
      v11 = CFSTR("Unattached");
    else
      v11 = *(&off_100523B70 + (_QWORD)v10);
    objc_msgSend(v3, "appendFormat:", CFSTR("\t - Activation State: %@\n"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
    objc_msgSend(v3, "appendFormat:", CFSTR("\t - Title: %@\n"), v12);

    v13 = (objc_class *)objc_opt_class(v8);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_msgSend(v3, "appendFormat:", CFSTR("\t - Scene Instance: <%@: %p>\n"), v15, v8);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "delegate"));
    v17 = (objc_class *)objc_opt_class(v16);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    objc_msgSend(v3, "appendFormat:", CFSTR("\t - Scene Delegate: <%@: %p>\n"), v19, v16);

  }
  return v3;
}

@end
