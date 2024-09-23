@implementation RBSIdentityAndRecordInfoProvider

- (id)_initWithIdentity:(id)a3 record:(id)a4
{
  id v7;
  id v8;
  void *v9;
  RBSIdentityAndRecordInfoProvider *v10;
  uint64_t v11;
  NSString *personaString;
  uint64_t v13;
  NSString *bundleID;
  uint64_t v15;
  NSString *persistentJobLabel;
  void *v18;
  void *v19;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSProcessIdentity.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identity"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSProcessIdentity.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("record"));

LABEL_3:
  v10 = -[RBSIdentityAndRecordInfoProvider init](self, "init");
  if (v10)
  {
    objc_msgSend(v7, "personaUniqueString");
    v11 = objc_claimAutoreleasedReturnValue();
    personaString = v10->_personaString;
    v10->_personaString = (NSString *)v11;

    objc_msgSend(v9, "bundleIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    bundleID = v10->_bundleID;
    v10->_bundleID = (NSString *)v13;

    objc_msgSend(v9, "jobLabel");
    v15 = objc_claimAutoreleasedReturnValue();
    persistentJobLabel = v10->_persistentJobLabel;
    v10->_persistentJobLabel = (NSString *)v15;

    v10->_platform = objc_msgSend(v9, "platform");
  }

  return v10;
}

+ (id)_providerWithIdentity:(id)a3 record:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[RBSIdentityAndRecordInfoProvider _initWithIdentity:record:]([RBSIdentityAndRecordInfoProvider alloc], "_initWithIdentity:record:", v6, v5);

  return v7;
}

- (id)fetchWrappedInfoWithError:(id *)a3
{
  return +[RBSWrappedLSInfo infoWithBundleID:personaString:persistentJobLabel:platform:bundleInode:execInode:](RBSWrappedLSInfo, "infoWithBundleID:personaString:persistentJobLabel:platform:bundleInode:execInode:", self->_bundleID, self->_personaString, self->_persistentJobLabel, self->_platform, self->_bundleInode, self->_execInode);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentJobLabel, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_personaString, 0);
}

@end
