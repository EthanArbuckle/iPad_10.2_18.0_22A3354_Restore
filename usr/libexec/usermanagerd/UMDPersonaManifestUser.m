@implementation UMDPersonaManifestUser

- (UMDPersonaManifestUser)init
{
  UMDPersonaManifestUser *v2;
  UMDPersonaManifestUser *v3;
  uint64_t v4;
  NSSet *personas;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UMDPersonaManifestUser;
  v2 = -[UMDPersonaManifestUser init](&v7, "init");
  if (!v2)
    sub_1000ACF54();
  v3 = v2;
  v4 = objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  personas = v3->_personas;
  v3->_personas = (NSSet *)v4;

  v3->_asid = -1;
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_personas, 0);
}

@end
