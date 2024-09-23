@implementation SPRMeta

+ (SPRMeta)current
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2159711D8;
  block[3] = &unk_24D3CCD88;
  block[4] = a1;
  if (qword_253F0F460 != -1)
    dispatch_once(&qword_253F0F460, block);
  return (SPRMeta *)(id)qword_253F0F458;
}

- (NSString)bundleIdentifier
{
  return (NSString *)((uint64_t (*)(NSBundle *, char *, const __CFString *))MEMORY[0x24BEDD108])(self->_bundle, sel_objectForInfoDictionaryKey_, CFSTR("CFBundleIdentifier"));
}

- (NSString)bundleVersion
{
  return (NSString *)((uint64_t (*)(NSBundle *, char *, const __CFString *))MEMORY[0x24BEDD108])(self->_bundle, sel_objectForInfoDictionaryKey_, CFSTR("CFBundleVersion"));
}

- (NSDate)buildDate
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)objc_opt_new();
  objc_msgSend_setDateFormat_(v3, v4, (uint64_t)CFSTR("EEE MMM dd HH:mm:ss yyyy"), v5, v6, v7);
  objc_msgSend_dateFromString_(v3, v8, (uint64_t)self->_timestamp, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v12;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_bundleIdentifier(self, a2, v2, v3, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bundleVersion(self, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_buildDate(self, v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v7, v21, (uint64_t)CFSTR("SPRMeta(bundleIdentifier: %@, bundleVersion: %@, buildDate: %@)"), v22, v23, v24, v8, v14, v20);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (SPRMeta)initWithBundle:(id)a3 timestamp:(id)a4
{
  NSBundle *v6;
  NSString *v7;
  NSBundle *bundle;
  NSBundle *v9;
  NSString *timestamp;

  v6 = (NSBundle *)a3;
  v7 = (NSString *)a4;
  bundle = self->_bundle;
  self->_bundle = v6;
  v9 = v6;

  timestamp = self->_timestamp;
  self->_timestamp = v7;

  return self;
}

- (NSBundle)bundle
{
  return (NSBundle *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
