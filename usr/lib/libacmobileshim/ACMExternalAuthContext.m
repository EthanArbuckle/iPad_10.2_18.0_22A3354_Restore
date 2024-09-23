@implementation ACMExternalAuthContext

- (id)parametersDictionary
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ACMExternalAuthContext;
  v3 = -[ACMAuthContext parametersDictionary](&v5, sel_parametersDictionary);
  objc_msgSend(v3, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0), CFSTR("s"));
  if (-[NSNumber BOOLValue](-[ACCAuthContext touchIDSupport](self, "touchIDSupport"), "BOOLValue"))
    objc_msgSend(v3, "setValue:forKey:", &unk_24FD172A0, CFSTR("tid"));
  return v3;
}

@end
