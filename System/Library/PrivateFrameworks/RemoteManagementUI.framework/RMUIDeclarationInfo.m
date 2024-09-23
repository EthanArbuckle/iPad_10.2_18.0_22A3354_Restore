@implementation RMUIDeclarationInfo

- (RMUIDeclarationInfo)initWithDeclarationIdentifier:(id)a3 declarationServerToken:(id)a4 declarationType:(id)a5 label:(id)a6 descriptor:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  RMUIDeclarationInfo *v17;
  RMUIDeclarationInfo *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)RMUIDeclarationInfo;
  v17 = -[RMUIDeclarationInfo init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_declarationIdentifier, a3);
    objc_storeStrong((id *)&v18->_declarationServerToken, a4);
    objc_storeStrong((id *)&v18->_declarationType, a5);
    objc_storeStrong((id *)&v18->_label, a6);
    objc_storeStrong((id *)&v18->_descriptor, a7);
  }

  return v18;
}

- (RMUIDeclarationInfo)initWithDeclaration:(id)a3 label:(id)a4 descriptor:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  RMUIDeclarationInfo *v15;

  v9 = a3;
  v10 = a5;
  v11 = a4;
  objc_msgSend(v9, "declarationIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "declarationServerToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "declarationType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[RMUIDeclarationInfo initWithDeclarationIdentifier:declarationServerToken:declarationType:label:descriptor:](self, "initWithDeclarationIdentifier:declarationServerToken:declarationType:label:descriptor:", v12, v13, v14, v11, v10);

  if (v15)
    objc_storeStrong((id *)&v15->_declaration, a3);

  return v15;
}

- (RMUIDeclarationInfo)initWithProfileDeclaration:(id)a3 label:(id)a4 profileIdentifier:(id)a5 isRequired:(BOOL)a6 isActive:(BOOL)a7
{
  id v13;
  RMUIDeclarationInfo *v14;
  RMUIDeclarationInfo *v15;

  v13 = a5;
  v14 = -[RMUIDeclarationInfo initWithDeclaration:label:descriptor:](self, "initWithDeclaration:label:descriptor:", a3, a4, 0);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_profileIdentifier, a5);
    v15->_isRequired = a6;
    v15->_isActive = a7;
  }

  return v15;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSString)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_descriptor, a3);
}

- (RMModelDeclarationBase)declaration
{
  return self->_declaration;
}

- (void)setDeclaration:(id)a3
{
  objc_storeStrong((id *)&self->_declaration, a3);
}

- (NSString)declarationIdentifier
{
  return self->_declarationIdentifier;
}

- (void)setDeclarationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_declarationIdentifier, a3);
}

- (NSString)declarationServerToken
{
  return self->_declarationServerToken;
}

- (void)setDeclarationServerToken:(id)a3
{
  objc_storeStrong((id *)&self->_declarationServerToken, a3);
}

- (NSString)declarationType
{
  return self->_declarationType;
}

- (void)setDeclarationType:(id)a3
{
  objc_storeStrong((id *)&self->_declarationType, a3);
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (void)setProfileIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_profileIdentifier, a3);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (BOOL)isRequired
{
  return self->_isRequired;
}

- (void)setIsRequired:(BOOL)a3
{
  self->_isRequired = a3;
}

- (NSArray)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
  objc_storeStrong((id *)&self->_details, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_declarationType, 0);
  objc_storeStrong((id *)&self->_declarationServerToken, 0);
  objc_storeStrong((id *)&self->_declarationIdentifier, 0);
  objc_storeStrong((id *)&self->_declaration, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
