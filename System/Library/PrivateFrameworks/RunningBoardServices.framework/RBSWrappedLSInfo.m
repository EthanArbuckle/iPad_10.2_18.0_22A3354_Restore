@implementation RBSWrappedLSInfo

- (id)_initWithBundleID:(id)a3 personaString:(id)a4 persistentJobLabel:(id)a5 platform:(int)a6 bundleInode:(unint64_t)a7 execInode:(unint64_t)a8
{
  id v15;
  id v16;
  id v17;
  RBSWrappedLSInfo *v18;
  RBSWrappedLSInfo *v19;
  RBSWrappedLSInfo *v20;
  objc_super v22;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v22.receiver = self;
  v22.super_class = (Class)RBSWrappedLSInfo;
  v18 = -[RBSWrappedLSInfo init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_bundleID, a3);
    objc_storeStrong((id *)&v19->_personaString, a4);
    objc_storeStrong((id *)&v19->_persistentJobLabel, a5);
    v19->_platform = a6;
    v19->_bundleInode = a7;
    v19->_execInode = a8;
    v20 = v19;
  }

  return v19;
}

+ (id)infoWithBundleID:(id)a3 personaString:(id)a4 persistentJobLabel:(id)a5 platform:(int)a6 bundleInode:(unint64_t)a7 execInode:(unint64_t)a8
{
  uint64_t v10;
  id v13;
  id v14;
  id v15;
  id v16;

  v10 = *(_QWORD *)&a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[RBSWrappedLSInfo _initWithBundleID:personaString:persistentJobLabel:platform:bundleInode:execInode:]([RBSWrappedLSInfo alloc], "_initWithBundleID:personaString:persistentJobLabel:platform:bundleInode:execInode:", v15, v14, v13, v10, a7, a8);

  return v16;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)personaString
{
  return self->_personaString;
}

- (NSString)persistentJobLabel
{
  return self->_persistentJobLabel;
}

- (int)platform
{
  return self->_platform;
}

- (unint64_t)bundleInode
{
  return self->_bundleInode;
}

- (unint64_t)execInode
{
  return self->_execInode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentJobLabel, 0);
  objc_storeStrong((id *)&self->_personaString, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
