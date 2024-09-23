@implementation SBSSoftwareUpdateService

- (int64_t)passcodePolicy
{
  void *v2;
  int64_t v3;

  -[SBSAbstractSystemService client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "passcodePolicy");

  return v3;
}

- (void)setPasscodePolicy:(int64_t)a3
{
  id v4;

  -[SBSAbstractSystemService client](self, "client");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPasscodePolicy:", a3);

}

@end
