@implementation SUControllerScanOptions

- (SUControllerScanOptions)init
{
  SUControllerScanOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUControllerScanOptions;
  result = -[SUControllerScanOptions init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->_userInitiated = 257;
  return result;
}

- (SUControllerScanOptions)initWithCoder:(id)a3
{
  id v4;
  SUControllerScanOptions *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SUControllerScanOptions;
  v5 = -[SUControllerScanOptions init](&v7, sel_init);
  if (v5)
  {
    v5->_userInitiated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userInitiated"));
    v5->_downloadWhenFound = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("downloadWhenFound"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[SUControllerScanOptions userInitiated](self, "userInitiated"), CFSTR("userInitiated"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUControllerScanOptions downloadWhenFound](self, "downloadWhenFound"), CFSTR("downloadWhenFound"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int v6;
  _BOOL4 v7;

  v4 = a3;
  v5 = -[SUControllerScanOptions userInitiated](self, "userInitiated");
  if (v5 == objc_msgSend(v4, "userInitiated"))
  {
    v7 = -[SUControllerScanOptions downloadWhenFound](self, "downloadWhenFound");
    v6 = v7 ^ objc_msgSend(v4, "downloadWhenFound") ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  if (-[SUControllerScanOptions userInitiated](self, "userInitiated"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if (-[SUControllerScanOptions downloadWhenFound](self, "downloadWhenFound"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("\n        userInitiated: %@\n    downloadWhenFound: %@"), v4, v5);
}

- (id)summary
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  if (-[SUControllerScanOptions userInitiated](self, "userInitiated"))
    v4 = CFSTR("Y");
  else
    v4 = CFSTR("N");
  if (-[SUControllerScanOptions downloadWhenFound](self, "downloadWhenFound"))
    v5 = CFSTR("Y");
  else
    v5 = CFSTR("N");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("userInitiated:%@,downloadWhenFound:%@"), v4, v5);
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (BOOL)downloadWhenFound
{
  return self->_downloadWhenFound;
}

- (void)setDownloadWhenFound:(BOOL)a3
{
  self->_downloadWhenFound = a3;
}

@end
