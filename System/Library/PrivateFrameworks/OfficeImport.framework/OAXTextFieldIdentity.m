@implementation OAXTextFieldIdentity

+ (id)identityWithGuid:(id)a3 type:(id)a4
{
  id v5;
  id v6;
  OAXTextFieldIdentity *v7;

  v5 = a3;
  v6 = a4;
  v7 = -[OITSUPair initWithFirst:second:]([OAXTextFieldIdentity alloc], "initWithFirst:second:", v5, v6);

  return v7;
}

@end
