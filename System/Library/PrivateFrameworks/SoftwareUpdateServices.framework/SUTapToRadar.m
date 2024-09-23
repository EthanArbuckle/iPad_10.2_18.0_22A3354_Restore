@implementation SUTapToRadar

- (SUTapToRadar)init
{
  SUTapToRadar *v2;
  SUTapToRadar *v3;
  NSString *componentName;
  NSString *componentVersion;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUTapToRadar;
  v2 = -[SUTapToRadar init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_classification = 0;
    v2->_reproducibility = 0;
    componentName = v2->_componentName;
    v2->_componentName = (NSString *)CFSTR("SoftwareUpdateServices");

    componentVersion = v3->_componentVersion;
    v3->_componentVersion = (NSString *)CFSTR("all");

    v3->_componentID = 435644;
  }
  return v3;
}

+ (id)_stringOfClassification:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 9)
    return 0;
  else
    return off_24CE3DDE0[a3 - 1];
}

+ (id)_stringOfReproducibility:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
    return 0;
  else
    return off_24CE3DE30[a3 - 1];
}

- (void)file
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSString *componentName;
  int64_t componentID;
  void *v16;
  void *v17;
  id v18;

  if ((MGGetBoolAnswer() & 1) != 0)
  {
    v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("tap-to-radar://new?"));
    if (self->_title)
      objc_msgSend(v18, "appendFormat:", CFSTR("Title=%@&"), self->_title);
    if (self->_message)
      objc_msgSend(v18, "appendFormat:", CFSTR("Description=%@&"), self->_message);
    +[SUTapToRadar _stringOfClassification:](SUTapToRadar, "_stringOfClassification:", self->_classification);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      objc_msgSend(v18, "appendFormat:", CFSTR("Classification=%@&"), v10);
    +[SUTapToRadar _stringOfReproducibility:](SUTapToRadar, "_stringOfReproducibility:", self->_reproducibility);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      objc_msgSend(v18, "appendFormat:", CFSTR("Reproducibility=%@&"), v12);
    componentName = self->_componentName;
    if (componentName && self->_componentVersion)
    {
      componentID = self->_componentID;
      if (componentID)
        objc_msgSend(v18, "appendFormat:", CFSTR("ComponentName=%@&ComponentVersion=%@&ComponentID=%ld"), componentName, self->_componentVersion, componentID);
    }
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v18);
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "openURL:configuration:completionHandler:", v16, 0, 0);

  }
  else
  {
    SULogInfo(CFSTR("%s: Shouldn't try to file a radar on an external device..."), v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUTapToRadar file]");
  }
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (int64_t)classification
{
  return self->_classification;
}

- (void)setClassification:(int64_t)a3
{
  self->_classification = a3;
}

- (int64_t)reproducibility
{
  return self->_reproducibility;
}

- (void)setReproducibility:(int64_t)a3
{
  self->_reproducibility = a3;
}

- (NSString)componentName
{
  return self->_componentName;
}

- (void)setComponentName:(id)a3
{
  objc_storeStrong((id *)&self->_componentName, a3);
}

- (NSString)componentVersion
{
  return self->_componentVersion;
}

- (void)setComponentVersion:(id)a3
{
  objc_storeStrong((id *)&self->_componentVersion, a3);
}

- (int64_t)componentID
{
  return self->_componentID;
}

- (void)setComponentID:(int64_t)a3
{
  self->_componentID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentVersion, 0);
  objc_storeStrong((id *)&self->_componentName, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
