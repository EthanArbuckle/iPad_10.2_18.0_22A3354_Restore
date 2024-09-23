@implementation UMDPersonaState

- (NSMutableDictionary)userPersonas
{
  return self->_userPersonas;
}

- (UMDPersonaState)init
{
  UMDPersonaState *v2;
  UMDPersonaState *v3;
  uint64_t v4;
  NSMutableDictionary *userPersonas;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UMDPersonaState;
  v2 = -[UMDPersonaState init](&v7, "init");
  if (!v2)
    sub_1000ACE0C();
  v3 = v2;
  v4 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  userPersonas = v3->_userPersonas;
  v3->_userPersonas = (NSMutableDictionary *)v4;

  return v3;
}

- (void)setUserPersonas:(id)a3
{
  objc_storeStrong((id *)&self->_userPersonas, a3);
}

- (NSMutableDictionary)asidMap
{
  return self->_asidMap;
}

- (void)setAsidMap:(id)a3
{
  objc_storeStrong((id *)&self->_asidMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asidMap, 0);
  objc_storeStrong((id *)&self->_userPersonas, 0);
}

@end
