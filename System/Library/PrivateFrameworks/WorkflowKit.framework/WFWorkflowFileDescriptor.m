@implementation WFWorkflowFileDescriptor

- (WFWorkflowFileDescriptor)initWithFile:(id)a3 name:(id)a4
{
  return -[WFWorkflowFileDescriptor initWithFile:name:sourceAppIdentifier:](self, "initWithFile:name:sourceAppIdentifier:", a3, a4, 0);
}

- (WFWorkflowFileDescriptor)initWithFile:(id)a3 name:(id)a4 sourceAppIdentifier:(id)a5
{
  id v10;
  id v11;
  id v12;
  WFWorkflowFileDescriptor *v13;
  WFWorkflowFileDescriptor *v14;
  uint64_t v15;
  NSString *name;
  uint64_t v17;
  NSString *sourceAppIdentifier;
  WFWorkflowFileDescriptor *v19;
  void *v21;
  void *v22;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowFile.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("file"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowFile.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)WFWorkflowFileDescriptor;
  v13 = -[WFWorkflowFileDescriptor init](&v23, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_file, a3);
    v15 = objc_msgSend(v11, "copy");
    name = v14->_name;
    v14->_name = (NSString *)v15;

    v17 = objc_msgSend(v12, "copy");
    sourceAppIdentifier = v14->_sourceAppIdentifier;
    v14->_sourceAppIdentifier = (NSString *)v17;

    v19 = v14;
  }

  return v14;
}

- (WFWorkflowFileDescriptor)initWithCoder:(id)a3
{
  id v4;
  WFWorkflowFileDescriptor *v5;
  uint64_t v6;
  WFFileRepresentation *file;
  uint64_t v8;
  NSString *name;
  uint64_t v10;
  NSString *sourceAppIdentifier;
  WFWorkflowFileDescriptor *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFWorkflowFileDescriptor;
  v5 = -[WFWorkflowFileDescriptor init](&v14, sel_init);
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("file"));
  v6 = objc_claimAutoreleasedReturnValue();
  file = v5->_file;
  v5->_file = (WFFileRepresentation *)v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v8 = objc_claimAutoreleasedReturnValue();
  name = v5->_name;
  v5->_name = (NSString *)v8;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceAppIdentifier"));
  v10 = objc_claimAutoreleasedReturnValue();
  sourceAppIdentifier = v5->_sourceAppIdentifier;
  v5->_sourceAppIdentifier = (NSString *)v10;

  if (!v5->_file)
    goto LABEL_5;
  if (v5->_name)
    v12 = v5;
  else
LABEL_5:
    v12 = 0;

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[WFWorkflowFileDescriptor file](self, "file");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("file"));

  -[WFWorkflowFileDescriptor name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("name"));

  -[WFWorkflowFileDescriptor sourceAppIdentifier](self, "sourceAppIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("sourceAppIdentifier"));

}

- (WFFileRepresentation)file
{
  return self->_file;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)sourceAppIdentifier
{
  return self->_sourceAppIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceAppIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_file, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
