@implementation WFShareSheetWorkflow

- (WFShareSheetWorkflow)initWithIdentifier:(id)a3 name:(id)a4 glyphCharacter:(unsigned __int16)a5
{
  id v9;
  id v10;
  void *v11;
  WFShareSheetWorkflow *v12;
  uint64_t v13;
  NSString *identifier;
  uint64_t v15;
  NSString *name;
  WFShareSheetWorkflow *v17;
  void *v19;
  void *v20;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFShareSheetWorkflow.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFShareSheetWorkflow.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)WFShareSheetWorkflow;
  v12 = -[WFShareSheetWorkflow init](&v21, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v13;

    v15 = objc_msgSend(v11, "copy");
    name = v12->_name;
    v12->_name = (NSString *)v15;

    v12->_glyphCharacter = a5;
    v17 = v12;
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_iconImage);
  v3.receiver = self;
  v3.super_class = (Class)WFShareSheetWorkflow;
  -[WFShareSheetWorkflow dealloc](&v3, sel_dealloc);
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
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[WFShareSheetWorkflow identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[WFShareSheetWorkflow name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("name"));

  objc_msgSend(v6, "encodeInt32:forKey:", -[WFShareSheetWorkflow glyphCharacter](self, "glyphCharacter"), CFSTR("glyphCharacter"));
}

- (WFShareSheetWorkflow)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int16 v7;
  BOOL v8;
  WFShareSheetWorkflow *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("glyphCharacter"));

  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    self = -[WFShareSheetWorkflow initWithIdentifier:name:glyphCharacter:](self, "initWithIdentifier:name:glyphCharacter:", v5, v6, v7);
    v9 = self;
  }

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (CGImage)iconImage
{
  return self->_iconImage;
}

- (double)iconScale
{
  return self->_iconScale;
}

- (unsigned)glyphCharacter
{
  return self->_glyphCharacter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
