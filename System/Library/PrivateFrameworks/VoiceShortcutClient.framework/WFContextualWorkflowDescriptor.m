@implementation WFContextualWorkflowDescriptor

- (WFContextualWorkflowDescriptor)initWithDescriptor:(id)a3 serializedRepresentation:(id)a4
{
  id v7;
  id v8;
  WFContextualWorkflowDescriptor *v9;
  WFContextualWorkflowDescriptor *v10;
  WFContextualWorkflowDescriptor *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFContextualWorkflowDescriptor;
  v9 = -[WFContextualWorkflowDescriptor init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_descriptor, a3);
    objc_storeStrong((id *)&v10->_serializedRepresentation, a4);
    v11 = v10;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WFContextualWorkflowDescriptor *v4;
  void *v5;
  void *v6;
  WFContextualWorkflowDescriptor *v7;

  v4 = [WFContextualWorkflowDescriptor alloc];
  -[WFContextualWorkflowDescriptor descriptor](self, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContextualWorkflowDescriptor serializedRepresentation](self, "serializedRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFContextualWorkflowDescriptor initWithDescriptor:serializedRepresentation:](v4, "initWithDescriptor:serializedRepresentation:", v5, v6);

  return v7;
}

- (WFContextualWorkflowDescriptor)initWithCoder:(id)a3
{
  id v4;
  WFContextualWorkflowDescriptor *v5;
  uint64_t v6;
  WFWorkflowDescriptor *descriptor;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  WFPropertyListObject *serializedRepresentation;
  WFContextualWorkflowDescriptor *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WFContextualWorkflowDescriptor;
  v5 = -[WFContextualWorkflowDescriptor init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("descriptor"));
    v6 = objc_claimAutoreleasedReturnValue();
    descriptor = v5->_descriptor;
    v5->_descriptor = (WFWorkflowDescriptor *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("serializedRepresentation"));
    v15 = objc_claimAutoreleasedReturnValue();
    serializedRepresentation = v5->_serializedRepresentation;
    v5->_serializedRepresentation = (WFPropertyListObject *)v15;

    v17 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFContextualWorkflowDescriptor descriptor](self, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("descriptor"));

  -[WFContextualWorkflowDescriptor serializedRepresentation](self, "serializedRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("serializedRepresentation"));

}

- (WFWorkflowDescriptor)descriptor
{
  return self->_descriptor;
}

- (WFPropertyListObject)serializedRepresentation
{
  return self->_serializedRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedRepresentation, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
