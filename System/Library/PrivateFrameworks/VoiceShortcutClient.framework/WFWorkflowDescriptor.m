@implementation WFWorkflowDescriptor

- (WFWorkflowDescriptor)initWithIdentifier:(id)a3 name:(id)a4 color:(int64_t)a5 glyphCharacter:(unsigned __int16)a6 associatedAppBundleIdentifier:(id)a7
{
  id v13;
  id v14;
  id v15;
  WFWorkflowDescriptor *v16;
  uint64_t v17;
  NSString *name;
  uint64_t v19;
  NSString *associatedAppBundleIdentifier;
  WFWorkflowDescriptor *v21;
  void *v23;
  void *v24;
  objc_super v25;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowDescriptor.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowDescriptor.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

LABEL_3:
  v25.receiver = self;
  v25.super_class = (Class)WFWorkflowDescriptor;
  v16 = -[WFDatabaseObjectDescriptor initWithIdentifier:objectType:](&v25, sel_initWithIdentifier_objectType_, v13, 0);
  if (v16)
  {
    v17 = objc_msgSend(v14, "copy");
    name = v16->_name;
    v16->_name = (NSString *)v17;

    v16->_color = a5;
    v16->_glyphCharacter = a6;
    v19 = objc_msgSend(v15, "copy");
    associatedAppBundleIdentifier = v16->_associatedAppBundleIdentifier;
    v16->_associatedAppBundleIdentifier = (NSString *)v19;

    v21 = v16;
  }

  return v16;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  int64_t v6;
  int64_t v7;
  __CFString *v8;
  __CFString *v9;
  unint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WFWorkflowDescriptor;
  v3 = -[WFDatabaseObjectDescriptor hash](&v12, sel_hash);
  -[WFWorkflowDescriptor name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ -[WFWorkflowDescriptor color](self, "color");
  v7 = v6 ^ -[WFWorkflowDescriptor glyphCharacter](self, "glyphCharacter");
  -[WFWorkflowDescriptor associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = &stru_1E5FC92C0;
  v10 = v7 ^ -[__CFString hash](v8, "hash") ^ v3;

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)associatedAppBundleIdentifier
{
  return self->_associatedAppBundleIdentifier;
}

- (unsigned)glyphCharacter
{
  return self->_glyphCharacter;
}

- (int64_t)color
{
  return self->_color;
}

- (id)externalURLForViewing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0C99E98];
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[WFWorkflowDescriptor name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAddingPercentEncodingWithAllowedCharacters:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDatabaseObjectDescriptor identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAddingPercentEncodingWithAllowedCharacters:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("shortcuts://open-shortcut?name=%@&id=%@"), v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  WFWorkflowDescriptor *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  void *v11;
  id v12;
  int v13;
  int64_t v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  char v19;
  void *v20;
  void *v21;
  objc_super v23;

  v4 = (WFWorkflowDescriptor *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23.receiver = self;
      v23.super_class = (Class)WFWorkflowDescriptor;
      if (-[WFDatabaseObjectDescriptor isEqual:](&v23, sel_isEqual_, v4))
      {
        -[WFWorkflowDescriptor name](self, "name");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWorkflowDescriptor name](v4, "name");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v5;
        v8 = v6;
        v9 = v8;
        if (v7 == v8)
        {

        }
        else
        {
          v10 = 0;
          v11 = v8;
          v12 = v7;
          if (!v7 || !v8)
            goto LABEL_27;
          v13 = objc_msgSend(v7, "isEqualToString:", v8);

          if (!v13)
          {
LABEL_19:
            v10 = 0;
LABEL_28:

            goto LABEL_29;
          }
        }
        v14 = -[WFWorkflowDescriptor color](self, "color");
        if (v14 != -[WFWorkflowDescriptor color](v4, "color"))
          goto LABEL_19;
        v15 = -[WFWorkflowDescriptor glyphCharacter](self, "glyphCharacter");
        if (v15 != -[WFWorkflowDescriptor glyphCharacter](v4, "glyphCharacter"))
          goto LABEL_19;
        -[WFWorkflowDescriptor associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWorkflowDescriptor associatedAppBundleIdentifier](v4, "associatedAppBundleIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v16;
        v18 = v17;
        v11 = v18;
        if (v12 == v18)
        {
          v10 = 1;
          v20 = v12;
          v21 = v12;
        }
        else
        {
          if (v12 && v18)
          {
            v19 = objc_msgSend(v12, "isEqualToString:", v18);

            if ((v19 & 1) != 0)
            {
              v10 = 1;
LABEL_27:

              goto LABEL_28;
            }
          }
          else
          {

          }
          -[WFWorkflowDescriptor associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v21, "length"))
          {
            v10 = 0;
LABEL_26:

            goto LABEL_27;
          }
          -[WFWorkflowDescriptor associatedAppBundleIdentifier](v4, "associatedAppBundleIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v20, "length") == 0;
        }

        goto LABEL_26;
      }
    }
    v10 = 0;
  }
LABEL_29:

  return v10;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDatabaseObjectDescriptor identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowDescriptor name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, identifier: %@, name: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_iconImage);
  v3.receiver = self;
  v3.super_class = (Class)WFWorkflowDescriptor;
  -[WFWorkflowDescriptor dealloc](&v3, sel_dealloc);
}

- (WFColor)backgroundColor
{
  return +[WFColor colorWithRGBAValue:](WFColor, "colorWithRGBAValue:", -[WFWorkflowDescriptor color](self, "color"));
}

- (void)setIconImage:(CGImage *)a3 scale:(double)a4
{
  self->_iconImage = CGImageRetain(a3);
  self->_iconImageScale = a4;
}

- (WFWorkflowDescriptor)initWithCoder:(id)a3
{
  id v4;
  WFWorkflowDescriptor *v5;
  uint64_t v6;
  NSString *name;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *associatedAppBundleIdentifier;
  WFWorkflowDescriptor *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFWorkflowDescriptor;
  v5 = -[WFDatabaseObjectDescriptor initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("color"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_color = objc_msgSend(v8, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("glyphCharacter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_glyphCharacter = objc_msgSend(v9, "unsignedLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedAppBundleIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    associatedAppBundleIdentifier = v5->_associatedAppBundleIdentifier;
    v5->_associatedAppBundleIdentifier = (NSString *)v10;

    v12 = v5;
  }

  return v5;
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
  v9.super_class = (Class)WFWorkflowDescriptor;
  v4 = a3;
  -[WFDatabaseObjectDescriptor encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[WFWorkflowDescriptor name](self, "name", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[WFWorkflowDescriptor color](self, "color"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("color"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[WFWorkflowDescriptor glyphCharacter](self, "glyphCharacter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("glyphCharacter"));

  -[WFWorkflowDescriptor associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("associatedAppBundleIdentifier"));

}

- (CGImage)iconImage
{
  return self->_iconImage;
}

- (double)iconImageScale
{
  return self->_iconImageScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
