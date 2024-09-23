@implementation VCConfiguredSleepWorkflow

- (VCConfiguredSleepWorkflow)initWithWorkflowIdentifier:(id)a3 bundleIdentifierForDisplay:(id)a4 summaryString:(id)a5 name:(id)a6 actionIdentifier:(id)a7 glyphCharacter:(unsigned __int16)a8 backgroundColorValue:(int64_t)a9 isAppLaunchWorkflow:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  VCConfiguredSleepWorkflow *v20;
  uint64_t v21;
  NSString *bundleIdentifierForDisplay;
  uint64_t v23;
  NSString *summaryString;
  uint64_t v25;
  NSString *name;
  uint64_t v27;
  NSString *actionIdentifier;
  VCConfiguredSleepWorkflow *v29;
  objc_super v31;

  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v31.receiver = self;
  v31.super_class = (Class)VCConfiguredSleepWorkflow;
  v20 = -[WFDatabaseObjectDescriptor initWithIdentifier:objectType:](&v31, sel_initWithIdentifier_objectType_, a3, 0);
  if (v20)
  {
    v21 = objc_msgSend(v16, "copy");
    bundleIdentifierForDisplay = v20->_bundleIdentifierForDisplay;
    v20->_bundleIdentifierForDisplay = (NSString *)v21;

    v23 = objc_msgSend(v17, "copy");
    summaryString = v20->_summaryString;
    v20->_summaryString = (NSString *)v23;

    v25 = objc_msgSend(v18, "copy");
    name = v20->_name;
    v20->_name = (NSString *)v25;

    v27 = objc_msgSend(v19, "copy");
    actionIdentifier = v20->_actionIdentifier;
    v20->_actionIdentifier = (NSString *)v27;

    v20->_glyphCharacter = a8;
    v20->_backgroundColorValue = a9;
    v20->_isAppLaunchWorkflow = a10;
    v29 = v20;
  }

  return v20;
}

- (void)setIconImage:(CGImage *)a3 scale:(double)a4
{
  CGImageRelease(self->_iconImage);
  self->_iconImage = a3;
  self->_iconScale = a4;
  CGImageRetain(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VCConfiguredSleepWorkflow;
  v4 = a3;
  -[WFDatabaseObjectDescriptor encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[VCConfiguredSleepWorkflow bundleIdentifierForDisplay](self, "bundleIdentifierForDisplay", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleIdentifierForDisplay"));

  -[VCConfiguredSleepWorkflow summaryString](self, "summaryString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("summaryString"));

  -[VCConfiguredSleepWorkflow name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("name"));

  -[VCConfiguredSleepWorkflow actionIdentifier](self, "actionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("actionIdentifier"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[VCConfiguredSleepWorkflow backgroundColorValue](self, "backgroundColorValue"), CFSTR("backgroundColorValue"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[VCConfiguredSleepWorkflow glyphCharacter](self, "glyphCharacter"), CFSTR("glyphCharacter"));
  objc_msgSend(v4, "encodeBool:forKey:", -[VCConfiguredSleepWorkflow isAppLaunchWorkflow](self, "isAppLaunchWorkflow"), CFSTR("isAppLaunchWorkflow"));

}

- (VCConfiguredSleepWorkflow)initWithCoder:(id)a3
{
  id v4;
  VCConfiguredSleepWorkflow *v5;
  uint64_t v6;
  NSString *bundleIdentifierForDisplay;
  uint64_t v8;
  NSString *summaryString;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  NSString *actionIdentifier;
  VCConfiguredSleepWorkflow *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VCConfiguredSleepWorkflow;
  v5 = -[WFDatabaseObjectDescriptor initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifierForDisplay"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleIdentifierForDisplay = v5->_bundleIdentifierForDisplay;
    v5->_bundleIdentifierForDisplay = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("summaryString"));
    v8 = objc_claimAutoreleasedReturnValue();
    summaryString = v5->_summaryString;
    v5->_summaryString = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v10 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    actionIdentifier = v5->_actionIdentifier;
    v5->_actionIdentifier = (NSString *)v12;

    v5->_glyphCharacter = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("glyphCharacter"));
    v5->_backgroundColorValue = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("backgroundColorValue"));
    v5->_isAppLaunchWorkflow = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAppLaunchWorkflow"));
    v14 = v5;
  }

  return v5;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[WFDatabaseObjectDescriptor identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCConfiguredSleepWorkflow summaryString](self, "summaryString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCConfiguredSleepWorkflow bundleIdentifierForDisplay](self, "bundleIdentifierForDisplay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCConfiguredSleepWorkflow name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCConfiguredSleepWorkflow actionIdentifier](self, "actionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, identifier: %@, summaryString: %@, bundleIdentifierForDisplay: %@, name: %@, actionIdentifier: %@, isAppLaunchWorkflow: %d>"), v4, self, v5, v6, v7, v8, v9, -[VCConfiguredSleepWorkflow isAppLaunchWorkflow](self, "isAppLaunchWorkflow"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (unsigned)glyphCharacter
{
  return self->_glyphCharacter;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)bundleIdentifierForDisplay
{
  return self->_bundleIdentifierForDisplay;
}

- (NSString)summaryString
{
  return self->_summaryString;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (CGImage)iconImage
{
  return self->_iconImage;
}

- (double)iconScale
{
  return self->_iconScale;
}

- (BOOL)isAppLaunchWorkflow
{
  return self->_isAppLaunchWorkflow;
}

- (int64_t)backgroundColorValue
{
  return self->_backgroundColorValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_summaryString, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierForDisplay, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (CGSize)glyphSize
{
  void *v2;
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  CGSize result;

  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v2 = (void *)getISImageDescriptorClass_softClass_14456;
  v23 = getISImageDescriptorClass_softClass_14456;
  if (!getISImageDescriptorClass_softClass_14456)
  {
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = (uint64_t)__getISImageDescriptorClass_block_invoke_14457;
    v18 = &unk_1E5FC8858;
    v19 = &v20;
    __getISImageDescriptorClass_block_invoke_14457((uint64_t)&v15);
    v2 = (void *)v21[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v20, 8);
  v15 = 0;
  v16 = (uint64_t)&v15;
  v17 = 0x2020000000;
  v4 = (_QWORD *)getkISImageDescriptorHomeScreenSymbolLoc_ptr_14458;
  v18 = (void *)getkISImageDescriptorHomeScreenSymbolLoc_ptr_14458;
  if (!getkISImageDescriptorHomeScreenSymbolLoc_ptr_14458)
  {
    v5 = IconServicesLibrary_14459();
    v4 = dlsym(v5, "kISImageDescriptorHomeScreen");
    *(_QWORD *)(v16 + 24) = v4;
    getkISImageDescriptorHomeScreenSymbolLoc_ptr_14458 = (uint64_t)v4;
  }
  _Block_object_dispose(&v15, 8);
  if (v4)
  {
    objc_msgSend(v3, "imageDescriptorNamed:", *v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "size");
    v8 = v7;
    v10 = v9;

    v11 = v8;
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkISImageDescriptorHomeScreen(void)");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("VCConfiguredSleepWorkflow.m"), 19, CFSTR("%s"), dlerror(), v15);

    __break(1u);
  }
  result.height = v12;
  result.width = v11;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
