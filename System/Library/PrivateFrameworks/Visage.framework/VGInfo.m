@implementation VGInfo

- (VGInfo)init
{
  VGInfo *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSDictionary *framework;
  void *v8;
  uint64_t v9;
  NSDictionary *models;
  VGInfo *v11;
  objc_super v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)VGInfo;
  v2 = -[VGInfo init](&v13, sel_init);
  if (v2)
  {
    v14 = CFSTR("version");
    objc_msgSend(MEMORY[0x24BDD1488], "vg_bundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "infoDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKey:", CFSTR("CFBundleVersion"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    framework = v2->_framework;
    v2->_framework = (NSDictionary *)v6;

    v8 = (void *)objc_opt_new();
    v9 = objc_msgSend(v8, "copy");
    models = v2->_models;
    v2->_models = (NSDictionary *)v9;

    v11 = v2;
  }

  return v2;
}

- (NSDictionary)framework
{
  return self->_framework;
}

- (NSDictionary)models
{
  return self->_models;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_models, 0);
  objc_storeStrong((id *)&self->_framework, 0);
}

@end
