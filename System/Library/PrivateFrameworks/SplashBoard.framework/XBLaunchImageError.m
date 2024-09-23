@implementation XBLaunchImageError

- (XBLaunchImageError)initWithCode:(int64_t)a3 bundleID:(id)a4 reason:(id)a5 fatal:(BOOL)a6
{
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  XBLaunchImageError *v15;
  objc_super v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  self->_fatal = a6;
  v9 = *MEMORY[0x24BDD0FD8];
  v18[0] = *MEMORY[0x24BDD0FC8];
  v18[1] = v9;
  v19[0] = CFSTR("Unable to generate launch image");
  v19[1] = a5;
  v18[2] = CFSTR("XBApplicationBundleIdentifier");
  if (a4)
    v10 = (const __CFString *)a4;
  else
    v10 = CFSTR("Unknown application");
  v19[2] = v10;
  v11 = (void *)MEMORY[0x24BDBCE70];
  v12 = a5;
  v13 = a4;
  objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)XBLaunchImageError;
  v15 = -[XBLaunchImageError initWithDomain:code:userInfo:](&v17, sel_initWithDomain_code_userInfo_, CFSTR("XBLaunchStoryboardErrorDomain"), a3, v14);

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (XBLaunchImageError)initWithCoder:(id)a3
{
  id v4;
  XBLaunchImageError *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)XBLaunchImageError;
  v5 = -[XBLaunchImageError initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_fatal = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("fatal"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)XBLaunchImageError;
  v4 = a3;
  -[XBLaunchImageError encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_fatal, CFSTR("fatal"), v5.receiver, v5.super_class);

}

- (BOOL)isFatal
{
  return self->_fatal;
}

- (BOOL)shouldDeny
{
  return self->_shouldDeny;
}

@end
