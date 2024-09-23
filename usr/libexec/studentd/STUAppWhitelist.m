@implementation STUAppWhitelist

+ (STUAppWhitelist)sharedWhitelist
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100058540;
  block[3] = &unk_1000C9FE0;
  block[4] = a1;
  if (qword_1000FC4C0 != -1)
    dispatch_once(&qword_1000FC4C0, block);
  return (STUAppWhitelist *)(id)qword_1000FC4C8;
}

- (id)_init
{
  STUAppWhitelist *v2;
  NSSet *v3;
  NSSet *bundleIdentifiers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STUAppWhitelist;
  v2 = -[STUAppWhitelist init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSSet);
    bundleIdentifiers = v2->_bundleIdentifiers;
    v2->_bundleIdentifiers = v3;

    -[STUAppWhitelist updateChangeToken](v2, "updateChangeToken");
  }
  return v2;
}

- (BOOL)setBundleIdentifiers:(id)a3 error:(id *)a4
{
  unint64_t v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  BOOL v13;
  void *v15;
  uint8_t buf[16];

  v7 = (unint64_t)a3;
  if (!v7)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUAppWhitelist.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifiers"));

  }
  v8 = objc_claimAutoreleasedReturnValue(-[STUAppWhitelist bundleIdentifiers](self, "bundleIdentifiers"));
  if (v7 | v8 && (v9 = (void *)v8, v10 = objc_msgSend((id)v8, "isEqual:", v7), v9, !v10))
  {
    if (!-[STUAppWhitelist forceSetBundleIdentifiers:error:](self, "forceSetBundleIdentifiers:error:", v7, a4))
    {
      v13 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    v11 = sub_100058700();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Bailing on applying client restrictions because the bundle identifiers didn't change", buf, 2u);
    }

  }
  -[STUAppWhitelist updateChangeToken](self, "updateChangeToken");
  v13 = 1;
LABEL_9:

  return v13;
}

- (void)forceReset
{
  NSSet *v3;
  unsigned int v4;
  id v5;
  id v6;
  NSObject *v7;
  id v8;

  v3 = objc_opt_new(NSSet);
  v8 = 0;
  v4 = -[STUAppWhitelist forceSetBundleIdentifiers:error:](self, "forceSetBundleIdentifiers:error:", v3, &v8);
  v5 = v8;

  if (v4)
  {
    -[STUAppWhitelist updateChangeToken](self, "updateChangeToken");
  }
  else
  {
    v6 = sub_100058700();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10007D060(v5, v7);

  }
}

- (void)updateChangeToken
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[STUAppWhitelist changeIndex](self, "changeIndex")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@"), v3, v5));
  -[STUAppWhitelist setChangeToken:](self, "setChangeToken:", v6);

  -[STUAppWhitelist setChangeIndex:](self, "setChangeIndex:", (char *)-[STUAppWhitelist changeIndex](self, "changeIndex") + 1);
  v7 = sub_100058700();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppWhitelist changeToken](self, "changeToken"));
    *(_DWORD *)buf = 138543362;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Updated change token to %{public}@", buf, 0xCu);

  }
}

- (BOOL)forceSetBundleIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  STUAppLockClientRestrictions *v7;
  void *v8;
  STUAppLockClientRestrictions *v9;
  unsigned int v10;
  id v11;

  v6 = a3;
  v7 = [STUAppLockClientRestrictions alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
  v9 = -[STUAppLockClientRestrictions initWithBundleIdentifiers:](v7, "initWithBundleIdentifiers:", v8);

  v10 = -[STUAppLockClientRestrictions applyWithError:](v9, "applyWithError:", a4);
  if (v10)
  {
    v11 = objc_msgSend(v6, "copy");
    -[STUAppWhitelist setBundleIdentifiers:](self, "setBundleIdentifiers:", v11);

  }
  return v10;
}

- (NSSet)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (void)setBundleIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)changeToken
{
  return self->_changeToken;
}

- (void)setChangeToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)changeIndex
{
  return self->_changeIndex;
}

- (void)setChangeIndex:(unint64_t)a3
{
  self->_changeIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeToken, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
}

@end
