@implementation BAAppExtensionInfo

- (BAAppExtensionInfo)initWithApplicationInfo:(id)a3
{
  id v4;
  BAAppExtensionInfo *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BAAppExtensionInfo;
  v5 = -[BAAppExtensionInfo init](&v9, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasLaunchedApplication"))
    {
      -[BAAppExtensionInfo setRestrictedDownloadSizeRemaining:](v5, "setRestrictedDownloadSizeRemaining:", 0);
      -[BAAppExtensionInfo setRestrictedEssentialDownloadSizeRemaining:](v5, "setRestrictedEssentialDownloadSizeRemaining:", 0);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "remainingDownloadAllowanceWithNecessity:", 0)));
      -[BAAppExtensionInfo setRestrictedDownloadSizeRemaining:](v5, "setRestrictedDownloadSizeRemaining:", v6);

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "remainingDownloadAllowanceWithNecessity:", 1)));
      -[BAAppExtensionInfo setRestrictedEssentialDownloadSizeRemaining:](v5, "setRestrictedEssentialDownloadSizeRemaining:", v7);

    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BAAppExtensionInfo)init
{
  BAAppExtensionInfo *result;
  int v3;
  const char *v4;

  result = (BAAppExtensionInfo *)os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
  if ((_DWORD)result)
  {
    v3 = 136315138;
    v4 = "BAAppExtensionInfo cannot be constructed using -init.";
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF BackgroundAssets: %s", (uint8_t *)&v3, 0xCu);
  }
  qword_1000654C8 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: BAAppExtensionInfo cannot be constructed using -init.";
  __break(1u);
  return result;
}

- (BAAppExtensionInfo)initWithCoder:(id)a3
{
  id v4;
  BAAppExtensionInfo *v5;
  uint64_t v6;
  NSSet *v7;
  void *v8;
  uint64_t v9;
  NSNumber *restrictedDownloadSizeRemaining;
  uint64_t v11;
  NSSet *v12;
  void *v13;
  uint64_t v14;
  NSNumber *restrictedEssentialDownloadSizeRemaining;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BAAppExtensionInfo;
  v5 = -[BAAppExtensionInfo init](&v17, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("restrictedDownloadSizeRemaining")))
    {
      v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSNumber, v6), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("restrictedDownloadSizeRemaining")));
      restrictedDownloadSizeRemaining = v5->_restrictedDownloadSizeRemaining;
      v5->_restrictedDownloadSizeRemaining = (NSNumber *)v9;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("restrictedEssentialDownloadSizeRemaining")))
    {
      v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSNumber, v11), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("restrictedEssentialDownloadSizeRemaining")));
      restrictedEssentialDownloadSizeRemaining = v5->_restrictedEssentialDownloadSizeRemaining;
      v5->_restrictedEssentialDownloadSizeRemaining = (NSNumber *)v14;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAAppExtensionInfo restrictedDownloadSizeRemaining](self, "restrictedDownloadSizeRemaining"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAAppExtensionInfo restrictedDownloadSizeRemaining](self, "restrictedDownloadSizeRemaining"));
    objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("restrictedDownloadSizeRemaining"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BAAppExtensionInfo restrictedEssentialDownloadSizeRemaining](self, "restrictedEssentialDownloadSizeRemaining"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAAppExtensionInfo restrictedEssentialDownloadSizeRemaining](self, "restrictedEssentialDownloadSizeRemaining"));
    objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("restrictedEssentialDownloadSizeRemaining"));

  }
}

- (NSNumber)restrictedDownloadSizeRemaining
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRestrictedDownloadSizeRemaining:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSNumber)restrictedEssentialDownloadSizeRemaining
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRestrictedEssentialDownloadSizeRemaining:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictedEssentialDownloadSizeRemaining, 0);
  objc_storeStrong((id *)&self->_restrictedDownloadSizeRemaining, 0);
}

@end
