@implementation XBApplicationLaunchCompatibilityInfo

- (XBApplicationLaunchCompatibilityInfo)initWithCoder:(id)a3
{
  id v5;
  XBApplicationLaunchCompatibilityInfo *v6;
  void *v7;
  uint64_t v8;
  NSString *bundleIdentifier;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *bundlePath;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *sandboxPath;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *bundleContainerPath;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSArray *launchInterfaces;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  objc_super v35;

  v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)XBApplicationLaunchCompatibilityInfo;
  v6 = -[XBApplicationLaunchCompatibilityInfo init](&v35, sel_init);
  if (v6)
  {
    if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("XBApplicationLaunchCompatibilityInfo.m"), 573, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[coder allowsKeyedCoding]"));

    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "bundleIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), v34);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v8;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "bundlePath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    bundlePath = v6->_bundlePath;
    v6->_bundlePath = (NSString *)v12;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "sandboxPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    sandboxPath = v6->_sandboxPath;
    v6->_sandboxPath = (NSString *)v16;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "bundleContainerPath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    bundleContainerPath = v6->_bundleContainerPath;
    v6->_bundleContainerPath = (NSString *)v20;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "launchInterfaces");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x24BDBCF20];
    v24 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v25, v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "copy");
    launchInterfaces = v6->_launchInterfaces;
    v6->_launchInterfaces = (NSArray *)v27;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "launchesOpaque");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_launchesOpaque = objc_msgSend(v5, "decodeBoolForKey:", v29);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "hasKnownBadLaunchImage");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_hasKnownBadLaunchImage = objc_msgSend(v5, "decodeBoolForKey:", v30);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BadLaunchImageCandidateCount");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_badLaunchImageCandidateCount = objc_msgSend(v5, "decodeInt64ForKey:", v31);

  }
  return v6;
}

+ (id)compatibilityInfoForAppInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  int v18;
  void *v19;

  v4 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  +[XBApplicationDataStore sharedInstance](XBApplicationDataStore, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "beginAccessBlockForBundleIdentifier:", v6);
  objc_msgSend(v7, "_loadCompatibilityInfoForBundleIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "dataContainerURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "bundleContainerURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    && (objc_msgSend(v8, "bundlePath"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v10, "isEqualToString:", v15),
        v15,
        (v16 & 1) != 0))
  {
    v17 = v8;
    v18 = 0;
  }
  else
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE38370]), "initWithPath:", v10);
    v17 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithBundle:", v19);

    v18 = 1;
  }
  objc_msgSend(v17, "setSandboxPath:", v12);
  objc_msgSend(v17, "setBundleContainerPath:", v14);
  objc_msgSend(v17, "setDefaultGroupIdentifier:", v6);
  if (v18)
    objc_msgSend(v7, "_persistCompatibilityInfo:forBundleIdentifier:", v17, v6);
  objc_msgSend(v7, "endAccessBlockForBundleIdentifier:", v6);

  return v17;
}

- (void)setSandboxPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setDefaultGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setBundleContainerPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleContainerPath, 0);
  objc_storeStrong((id *)&self->_sandboxPath, 0);
  objc_storeStrong((id *)&self->_bundlePath, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_launchInterfaces, 0);
  objc_storeStrong((id *)&self->_defaultInterface, 0);
}

- (id)launchInterfaceIdentifierForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSArray *launchInterfaces;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  objc_msgSend(v4, "launchInterfaceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[XBApplicationLaunchCompatibilityInfo launchInterfaceWithIdentifier:](self, "launchInterfaceWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (!v8)
  {
    objc_msgSend(v4, "urlSchemeName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      launchInterfaces = self->_launchInterfaces;
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __76__XBApplicationLaunchCompatibilityInfo_launchInterfaceIdentifierForRequest___block_invoke;
      v17[3] = &unk_24D7F4250;
      v18 = v9;
      -[NSArray bs_firstObjectPassingTest:](launchInterfaces, "bs_firstObjectPassingTest:", v17);
      v11 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v11;
    }

  }
  objc_msgSend(v6, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (!v13)
  {
    -[XBApplicationLaunchCompatibilityInfo defaultLaunchInterface](self, "defaultLaunchInterface");
    v14 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v14;
  }
  objc_msgSend(v6, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (XBLaunchInterface)defaultLaunchInterface
{
  XBLaunchInterface *defaultInterface;
  XBLaunchInterface *v4;
  XBLaunchInterface *v5;

  defaultInterface = self->_defaultInterface;
  if (!defaultInterface)
  {
    -[NSArray bs_firstObjectPassingTest:](self->_launchInterfaces, "bs_firstObjectPassingTest:", &__block_literal_global_0);
    v4 = (XBLaunchInterface *)objc_claimAutoreleasedReturnValue();
    v5 = self->_defaultInterface;
    self->_defaultInterface = v4;

    defaultInterface = self->_defaultInterface;
  }
  return defaultInterface;
}

- (id)launchInterfaceWithIdentifier:(id)a3
{
  id v4;
  NSArray *launchInterfaces;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    launchInterfaces = self->_launchInterfaces;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __70__XBApplicationLaunchCompatibilityInfo_launchInterfaceWithIdentifier___block_invoke;
    v8[3] = &unk_24D7F4250;
    v9 = v4;
    -[NSArray bs_firstObjectPassingTest:](launchInterfaces, "bs_firstObjectPassingTest:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)hasKnownBadLaunchImage
{
  return self->_hasKnownBadLaunchImage;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (XBApplicationLaunchCompatibilityInfo)initWithXPCDictionary:(id)a3
{
  id v4;
  XBApplicationLaunchCompatibilityInfo *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  uint64_t v8;
  NSString *bundlePath;
  uint64_t v10;
  NSString *sandboxPath;
  uint64_t v12;
  NSString *bundleContainerPath;
  void *v14;
  uint64_t v15;
  NSArray *launchInterfaces;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)XBApplicationLaunchCompatibilityInfo;
  v5 = -[XBApplicationLaunchCompatibilityInfo init](&v18, sel_init);
  if (v5)
  {
    v6 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    v8 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    bundlePath = v5->_bundlePath;
    v5->_bundlePath = (NSString *)v8;

    v10 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    sandboxPath = v5->_sandboxPath;
    v5->_sandboxPath = (NSString *)v10;

    v12 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    bundleContainerPath = v5->_bundleContainerPath;
    v5->_bundleContainerPath = (NSString *)v12;

    BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    launchInterfaces = v5->_launchInterfaces;
    v5->_launchInterfaces = (NSArray *)v15;

    v5->_launchesOpaque = xpc_dictionary_get_BOOL(v4, "launchesOpaque");
    v5->_hasKnownBadLaunchImage = xpc_dictionary_get_BOOL(v4, "hasKnownBadLaunchImage");
    v5->_badLaunchImageCandidateCount = xpc_dictionary_get_int64(v4, "BadLaunchImageCandidateCount");
  }

  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict;

  xdict = a3;
  BSSerializeCFValueToXPCDictionaryWithKey();
  BSSerializeCFValueToXPCDictionaryWithKey();
  BSSerializeCFValueToXPCDictionaryWithKey();
  BSSerializeCFValueToXPCDictionaryWithKey();
  BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey();
  xpc_dictionary_set_BOOL(xdict, "launchesOpaque", self->_launchesOpaque);
  xpc_dictionary_set_BOOL(xdict, "hasKnownBadLaunchImage", self->_hasKnownBadLaunchImage);
  xpc_dictionary_set_int64(xdict, "BadLaunchImageCandidateCount", self->_badLaunchImageCandidateCount);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a3;
  if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationLaunchCompatibilityInfo.m"), 597, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[coder allowsKeyedCoding]"));

  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "bundleIdentifier");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifier, v14);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "bundlePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundlePath, v6);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "sandboxPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", self->_sandboxPath, v7);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "bundleContainerPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleContainerPath, v8);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "launchInterfaces");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", self->_launchInterfaces, v9);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "launchesOpaque");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", self->_launchesOpaque, v10);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "hasKnownBadLaunchImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasKnownBadLaunchImage, v11);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BadLaunchImageCandidateCount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInt64:forKey:", self->_badLaunchImageCandidateCount, v12);

}

- (void)_setLaunchInterfaces:(id)a3
{
  objc_storeStrong((id *)&self->_launchInterfaces, a3);
}

- (XBApplicationLaunchCompatibilityInfo)initWithBundle:(id)a3
{
  id v5;
  XBApplicationLaunchCompatibilityInfo *v6;
  void *v7;
  uint64_t v8;
  NSString *bundleIdentifier;
  void *v10;
  uint64_t v11;
  NSString *bundlePath;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  void *v17;
  int v18;
  XBLaunchInterface *v19;
  uint64_t v20;
  XBLaunchInterface *defaultInterface;
  uint64_t v22;
  XBLaunchInterface *v23;
  XBLaunchInterfaceConfiguration *v24;
  XBLaunchInterface *v25;
  XBLaunchInterface *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  int v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  XBLaunchInterface *v44;
  XBLaunchInterface *v45;
  id *p_defaultInterface;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id *v59;
  uint64_t j;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  id v65;
  id v66;
  XBLaunchInterfaceConfiguration *v67;
  XBLaunchInterface *v68;
  void *v69;
  void *v70;
  char v71;
  NSArray *launchInterfaces;
  NSArray *v73;
  SEL v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  XBApplicationLaunchCompatibilityInfo *v80;
  uint64_t v81;
  XBLaunchInterface *v82;
  XBLaunchInterface *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  id *location;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  NSArray *v94;
  _QWORD v95[4];
  id v96;
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _QWORD v102[4];
  id v103;
  id v104;
  id v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  id v110;
  uint64_t v111;
  objc_super v112;
  _BYTE v113[128];
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v112.receiver = self;
  v112.super_class = (Class)XBApplicationLaunchCompatibilityInfo;
  v6 = -[XBApplicationLaunchCompatibilityInfo init](&v112, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v8;

    objc_msgSend(v5, "bundlePath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    bundlePath = v6->_bundlePath;
    v6->_bundlePath = (NSString *)v11;

    objc_msgSend(v5, "infoDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    objc_msgSend(v5, "localizedInfoDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addEntriesFromDictionary:", v15);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "valueForKey:", CFSTR("UILaunchStoryboardName"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = a2;
    if (objc_msgSend(v17, "length"))
    {
      v110 = v17;
      v111 = 0;
      v18 = _XBInterfaceWithNameExistsInBundle(&v110, v5, &v111);
      v78 = v110;

      if (v18)
      {
        v19 = [XBLaunchInterface alloc];
        v20 = -[XBLaunchInterface initWithType:name:identifier:urlSchemes:isDefault:](v19, "initWithType:name:identifier:urlSchemes:isDefault:", v111, v78, CFSTR("__from_UILaunchStoryboardName__"), 0, 1);
        defaultInterface = v6->_defaultInterface;
        v6->_defaultInterface = (XBLaunchInterface *)v20;

        -[NSArray addObject:](v16, "addObject:", v6->_defaultInterface);
      }
    }
    else
    {
      v78 = v17;
    }
    objc_msgSend(v14, "valueForKey:", CFSTR("UILaunchScreen"));
    v22 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v79 = (void *)v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = v6->_defaultInterface;
      if (v23)
        -[XBLaunchInterface set_default:](v23, "set_default:", 0);
      v24 = -[XBLaunchInterfaceConfiguration initWithConfigurationDictionary:]([XBLaunchInterfaceConfiguration alloc], "initWithConfigurationDictionary:", v22);
      v25 = -[XBLaunchInterface initWithConfiguration:identifier:urlSchemes:isDefault:]([XBLaunchInterface alloc], "initWithConfiguration:identifier:urlSchemes:isDefault:", v24, CFSTR("__from_UILaunchStoryboardName__"), 0, 1);
      v26 = v6->_defaultInterface;
      v6->_defaultInterface = v25;

      -[NSArray addObject:](v16, "addObject:", v6->_defaultInterface);
    }
    v80 = v6;
    objc_msgSend(v14, "valueForKey:", CFSTR("UILaunchStoryboards"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    v94 = v16;
    v88 = v5;
    v76 = v27;
    v77 = v14;
    if (v27)
    {
      objc_msgSend(v27, "valueForKey:", CFSTR("UILaunchStoryboardDefinitions"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "valueForKey:", CFSTR("UIURLToLaunchStoryboardAssociations"));
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "valueForKey:", CFSTR("UIDefaultLaunchStoryboard"));
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = 0u;
      v107 = 0u;
      v108 = 0u;
      v109 = 0u;
      v30 = v29;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v107;
        location = (id *)&v6->_defaultInterface;
        v84 = v30;
        do
        {
          for (i = 0; i != v32; ++i)
          {
            if (*(_QWORD *)v107 != v33)
              objc_enumerationMutation(v30);
            v35 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v111 = 0;
              objc_msgSend(v35, "valueForKey:", CFSTR("UILaunchStoryboardFile"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "valueForKey:", CFSTR("UILaunchStoryboardIdentifier"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v92, "containsObject:", v37) & 1) != 0)
              {
                v38 = v36;
              }
              else
              {
                v105 = v36;
                v39 = _XBInterfaceWithNameExistsInBundle(&v105, v5, &v111);
                v38 = v105;

                if (v39)
                {
                  v40 = objc_msgSend(v37, "isEqualToString:", v85);
                  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  v102[0] = MEMORY[0x24BDAC760];
                  v102[1] = 3221225472;
                  v102[2] = __55__XBApplicationLaunchCompatibilityInfo_initWithBundle___block_invoke;
                  v102[3] = &unk_24D7F41E8;
                  v42 = v37;
                  v103 = v42;
                  v43 = v41;
                  v104 = v43;
                  objc_msgSend(v86, "enumerateKeysAndObjectsUsingBlock:", v102);
                  v44 = [XBLaunchInterface alloc];
                  v45 = -[XBLaunchInterface initWithType:name:identifier:urlSchemes:isDefault:](v44, "initWithType:name:identifier:urlSchemes:isDefault:", v111, v38, v42, v43, v40);
                  objc_msgSend(v92, "addObject:", v42);
                  -[NSArray addObject:](v94, "addObject:", v45);
                  if ((_DWORD)v40)
                  {
                    p_defaultInterface = (id *)&v80->_defaultInterface;
                    if (*location)
                    {
                      v82 = [XBLaunchInterface alloc];
                      v81 = objc_msgSend(*location, "type");
                      objc_msgSend(*location, "name");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(*location, "identifier");
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(*location, "urlSchemes");
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      v83 = -[XBLaunchInterface initWithType:name:identifier:urlSchemes:isDefault:](v82, "initWithType:name:identifier:urlSchemes:isDefault:", v81, v47, v48, v49, 0);

                      v50 = -[NSArray indexOfObjectIdenticalTo:](v94, "indexOfObjectIdenticalTo:", *location);
                      if (v50 == 0x7FFFFFFFFFFFFFFFLL)
                      {
                        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
                        v51 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", v75, v80, CFSTR("XBApplicationLaunchCompatibilityInfo.m"), 756, CFSTR("attempting to replace non-existent pre-existing default interface."));

                      }
                      -[NSArray replaceObjectAtIndex:withObject:](v94, "replaceObjectAtIndex:withObject:", v50, v83);

                      p_defaultInterface = (id *)&v80->_defaultInterface;
                    }
                    objc_storeStrong(p_defaultInterface, v45);
                  }

                  v5 = v88;
                  v30 = v84;
                }
              }

            }
          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
        }
        while (v32);
      }

      v28 = v76;
      v14 = v77;
      v16 = v94;
    }
    objc_msgSend(v14, "valueForKey:", CFSTR("UILaunchScreens"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v52;
    if (v52)
    {
      objc_msgSend(v52, "valueForKey:", CFSTR("UILaunchScreenDefinitions"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "valueForKey:", CFSTR("UIURLToLaunchScreenAssociations"));
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = v53;
      objc_msgSend(v53, "valueForKey:", CFSTR("UIDefaultLaunchScreen"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = 0u;
      v99 = 0u;
      v100 = 0u;
      v101 = 0u;
      v55 = v54;
      v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v98, v113, 16);
      if (v56)
      {
        v57 = v56;
        v58 = *(_QWORD *)v99;
        v59 = (id *)&v80->_defaultInterface;
        do
        {
          for (j = 0; j != v57; ++j)
          {
            if (*(_QWORD *)v99 != v58)
              objc_enumerationMutation(v55);
            v61 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v61, "valueForKey:", CFSTR("UILaunchScreenIdentifier"));
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              v63 = objc_msgSend(v62, "isEqualToString:", v91);
              objc_msgSend(MEMORY[0x24BDBCEB8], "array");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              v95[0] = MEMORY[0x24BDAC760];
              v95[1] = 3221225472;
              v95[2] = __55__XBApplicationLaunchCompatibilityInfo_initWithBundle___block_invoke_2;
              v95[3] = &unk_24D7F41E8;
              v65 = v62;
              v96 = v65;
              v66 = v64;
              v97 = v66;
              objc_msgSend(v93, "enumerateKeysAndObjectsUsingBlock:", v95);
              v67 = -[XBLaunchInterfaceConfiguration initWithConfigurationDictionary:]([XBLaunchInterfaceConfiguration alloc], "initWithConfigurationDictionary:", v61);
              v68 = -[XBLaunchInterface initWithConfiguration:identifier:urlSchemes:isDefault:]([XBLaunchInterface alloc], "initWithConfiguration:identifier:urlSchemes:isDefault:", v67, v65, v66, v63);
              objc_msgSend(v90, "addObject:", v65);
              -[NSArray addObject:](v94, "addObject:", v68);
              if ((_DWORD)v63)
              {
                if (*v59)
                  objc_msgSend(*v59, "set_default:", 0);
                objc_storeStrong(v59, v68);
              }

            }
          }
          v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v98, v113, 16);
        }
        while (v57);
      }

      v53 = v87;
      v5 = v88;
      v28 = v76;
      v14 = v77;
      v16 = v94;
    }
    objc_msgSend(v14, "valueForKey:", *MEMORY[0x24BDF7600]);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v69;
    if (v69)
      v71 = objc_msgSend(v69, "isEqualToString:", *MEMORY[0x24BDF75F8]);
    else
      v71 = 1;
    v6 = v80;
    v80->_launchesOpaque = v71;
    launchInterfaces = v80->_launchInterfaces;
    v80->_launchInterfaces = v16;
    v73 = v16;

  }
  return v6;
}

void __55__XBApplicationLaunchCompatibilityInfo_initWithBundle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "isEqualToString:", *(_QWORD *)(a1 + 32)))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

void __55__XBApplicationLaunchCompatibilityInfo_initWithBundle___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "isEqualToString:", *(_QWORD *)(a1 + 32)))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BE38380], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_bundlePath, CFSTR("bundlePath"));
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", self->_sandboxPath, CFSTR("sandboxPath"));
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", self->_launchInterfaces, CFSTR("launchInterfaces"));
  v8 = (id)objc_msgSend(v3, "appendBool:withName:", self->_launchesOpaque, CFSTR("launchesOpaque"));
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (BOOL)allowsSavingLaunchImages
{
  return -[NSArray count](self->_launchInterfaces, "count") != 0;
}

uint64_t __62__XBApplicationLaunchCompatibilityInfo_defaultLaunchInterface__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_isDefault");
}

uint64_t __70__XBApplicationLaunchCompatibilityInfo_launchInterfaceWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __76__XBApplicationLaunchCompatibilityInfo_launchInterfaceIdentifierForRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "urlSchemes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)launchInterfaceExistsForScheme:(id)a3
{
  id v4;
  NSArray *launchInterfaces;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  launchInterfaces = self->_launchInterfaces;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __71__XBApplicationLaunchCompatibilityInfo_launchInterfaceExistsForScheme___block_invoke;
  v8[3] = &unk_24D7F4278;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  -[NSArray enumerateObjectsUsingBlock:](launchInterfaces, "enumerateObjectsUsingBlock:", v8);
  LOBYTE(launchInterfaces) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)launchInterfaces;
}

void __71__XBApplicationLaunchCompatibilityInfo_launchInterfaceExistsForScheme___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;

  objc_msgSend(a2, "urlSchemes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (NSArray)launchInterfaces
{
  return self->_launchInterfaces;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setBundlePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)sandboxPath
{
  return self->_sandboxPath;
}

- (BOOL)launchesOpaque
{
  return self->_launchesOpaque;
}

- (void)setLaunchesOpaque:(BOOL)a3
{
  self->_launchesOpaque = a3;
}

- (void)setHasKnownBadLaunchImage:(BOOL)a3
{
  self->_hasKnownBadLaunchImage = a3;
}

- (int64_t)badLaunchImageCandidateCount
{
  return self->_badLaunchImageCandidateCount;
}

- (void)setBadLaunchImageCandidateCount:(int64_t)a3
{
  self->_badLaunchImageCandidateCount = a3;
}

- (NSString)bundleContainerPath
{
  return self->_bundleContainerPath;
}

- (NSString)defaultGroupIdentifier
{
  return self->_defaultGroupIdentifier;
}

@end
