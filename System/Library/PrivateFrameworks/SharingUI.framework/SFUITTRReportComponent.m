@implementation SFUITTRReportComponent

+ (id)peopleSuggesterComponent
{
  return -[SFUITTRReportComponent initWithIdentifier:name:version:]([SFUITTRReportComponent alloc], "initWithIdentifier:name:version:", CFSTR("655674"), CFSTR("CoreDuet"), CFSTR("PeopleSuggester"));
}

- (SFUITTRReportComponent)initWithIdentifier:(id)a3 name:(id)a4 version:(id)a5
{
  id v8;
  id v9;
  id v10;
  SFUITTRReportComponent *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  NSString *name;
  uint64_t v16;
  NSString *version;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SFUITTRReportComponent;
  v11 = -[SFUITTRReportComponent init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    version = v11->_version;
    v11->_version = (NSString *)v16;

  }
  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
