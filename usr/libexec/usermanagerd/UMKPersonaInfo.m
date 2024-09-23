@implementation UMKPersonaInfo

- (UMKPersonaInfo)init
{
  UMKPersonaInfo *v2;
  UMKPersonaInfo *v3;
  NSString *name;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UMKPersonaInfo;
  v2 = -[UMKPersonaInfo init](&v6, "init");
  if (!v2)
    sub_1000ACE0C();
  v3 = v2;

  *(_QWORD *)&v3->_id = 0xFFFFFFFFLL;
  name = v3->_name;
  v3->_name = (NSString *)&stru_1000D4C60;

  v3->_uid = -101;
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
