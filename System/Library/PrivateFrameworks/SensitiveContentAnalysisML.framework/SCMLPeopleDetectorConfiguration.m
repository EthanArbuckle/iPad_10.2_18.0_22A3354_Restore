@implementation SCMLPeopleDetectorConfiguration

- (SCMLPeopleDetectorConfiguration)init
{
  return -[SCMLPeopleDetectorConfiguration initWithModelManagerServicesUseCaseID:](self, "initWithModelManagerServicesUseCaseID:", CFSTR("Safety.unspecified"));
}

- (SCMLPeopleDetectorConfiguration)initWithModelManagerServicesUseCaseID:(id)a3
{
  id v4;
  SCMLPeopleDetectorConfiguration *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SCMLPeopleDetectorConfiguration;
  v5 = -[SCMLPeopleDetectorConfiguration init](&v8, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US"));
    -[SCMLPeopleDetectorConfiguration setLocale:](v5, "setLocale:", v6);

    -[SCMLPeopleDetectorConfiguration setOnBehalfOfProcessID:](v5, "setOnBehalfOfProcessID:", 0xFFFFFFFFLL);
    -[SCMLPeopleDetectorConfiguration setModelManagerServicesUseCaseID:](v5, "setModelManagerServicesUseCaseID:", v4);
  }

  return v5;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (int)onBehalfOfProcessID
{
  return self->_onBehalfOfProcessID;
}

- (void)setOnBehalfOfProcessID:(int)a3
{
  self->_onBehalfOfProcessID = a3;
}

- (NSString)modelManagerServicesUseCaseID
{
  return self->_modelManagerServicesUseCaseID;
}

- (void)setModelManagerServicesUseCaseID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelManagerServicesUseCaseID, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
