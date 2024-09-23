@implementation SESExpressConfiguration

+ (id)withState:(int64_t)a3 passConfigs:(id)a4
{
  NSArray *v5;
  SESExpressConfiguration *v6;
  NSArray *passConfigs;

  v5 = (NSArray *)a4;
  v6 = objc_opt_new(SESExpressConfiguration);
  passConfigs = v6->_passConfigs;
  v6->_state = a3;
  v6->_passConfigs = v5;

  return v6;
}

- (int64_t)state
{
  return self->_state;
}

- (NSArray)passConfigs
{
  return self->_passConfigs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passConfigs, 0);
}

@end
