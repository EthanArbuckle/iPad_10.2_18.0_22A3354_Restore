@implementation SESViewInformation

+ (id)withViewName:(id)a3 currentTLK:(id)a4 tlkShares:(id)a5 previousTLKs:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SESViewInformation *v14;
  id *p_isa;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_opt_new(SESViewInformation);
  p_isa = (id *)&v14->super.isa;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_viewName, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
  }

  return p_isa;
}

- (NSString)viewName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (SESTLKRecord)currentTLK
{
  return (SESTLKRecord *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)tlkShares
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)previousTLKs
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousTLKs, 0);
  objc_storeStrong((id *)&self->_tlkShares, 0);
  objc_storeStrong((id *)&self->_currentTLK, 0);
  objc_storeStrong((id *)&self->_viewName, 0);
}

- (NSString)description
{
  return (NSString *)sub_1001BFB2C(self, (uint64_t)a2, (void (*)(void))SESViewInformation.description.getter);
}

- (NSDictionary)dumpState
{
  SESViewInformation *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1001BDEDC();

  return (NSDictionary *)v3;
}

@end
