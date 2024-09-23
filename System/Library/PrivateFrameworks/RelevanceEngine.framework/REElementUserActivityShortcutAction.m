@implementation REElementUserActivityShortcutAction

- (REElementUserActivityShortcutAction)initWithUserActivity:(id)a3 applicationID:(id)a4 isLocalDonation:(BOOL)a5
{
  REElementUserActivityShortcutAction *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REElementUserActivityShortcutAction;
  result = -[REElementUserActivityAction initWithUserActivity:applicationID:](&v7, sel_initWithUserActivity_applicationID_, a3, a4);
  if (result)
    result->_isLocalDonation = a5;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REElementUserActivityShortcutAction;
  result = -[REElementUserActivityShortcutAction copy](&v5, sel_copy, a3);
  *((_BYTE *)result + 40) = self->_isLocalDonation;
  return result;
}

- (void)_submitMetricsWithSuccess:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  __CFString **v6;
  __CFString **v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  id v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 6);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", CFSTR("activityAppLaunch"), CFSTR("actionType"));
  v5 = -[REElementUserActivityShortcutAction isLocalDonation](self, "isLocalDonation");
  v6 = RELocal;
  if (!v5)
    v6 = RERemote;
  objc_msgSend(v12, "setObject:forKey:", *v6, CFSTR("deviceSource"));
  v7 = RETrue;
  if (!v3)
    v7 = REFalse;
  objc_msgSend(v12, "setObject:forKey:", *v7, CFSTR("success"));
  -[REElementUserActivityAction applicationID](self, "applicationID");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = CFSTR("unknown");
  if (v8)
    v10 = (__CFString *)v8;
  v11 = v10;

  objc_msgSend(v12, "setObject:forKey:", v11, CFSTR("bundleID"));
  RESubmitShortcutExecution(v12);

}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)REElementUserActivityShortcutAction;
  return -[REElementUserActivityAction hash](&v3, sel_hash) ^ self->_isLocalDonation;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (unsigned __int8 *)v4;
    v8.receiver = self;
    v8.super_class = (Class)REElementUserActivityShortcutAction;
    if (-[REElementUserActivityAction isEqual:](&v8, sel_isEqual_, v5))
      v6 = self->_isLocalDonation == v5[40];
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isLocalDonation
{
  return self->_isLocalDonation;
}

@end
