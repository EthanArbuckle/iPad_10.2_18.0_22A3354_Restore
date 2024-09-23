@implementation PXMetadataDisplayItem

- (BOOL)isEmpty
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;

  -[PXMetadataDisplayItem content](self, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqual:", &stru_1E5149688))
  {
    -[PXMetadataDisplayItem accessibilityDescription](self, "accessibilityDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = 0;
    }
    else
    {
      -[PXMetadataDisplayItem accessoryImageSystemName](self, "accessoryImageSystemName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v6 == 0;

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (PXMetadataDisplayItem)initWithContent:(id)a3 accessibilityDescription:(id)a4 accessibilityValue:(id)a5 accessibilityIdentifier:(id)a6 accessoryImageSystemName:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PXMetadataDisplayItem *v17;
  PXMetadataDisplayItem *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PXMetadataDisplayItem;
  v17 = -[PXMetadataDisplayItem init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong(&v17->_content, a3);
    objc_storeStrong((id *)&v18->_accessibilityDescription, a4);
    objc_storeStrong((id *)&v18->_accessibilityValue, a5);
    objc_storeStrong((id *)&v18->_accessibilityIdentifier, a6);
    objc_storeStrong((id *)&v18->_accessoryImageSystemName, a7);
  }

  return v18;
}

- (PXMetadataDisplayItem)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMetadataUtilities.m"), 1448, CFSTR("%s is not available as initializer"), "-[PXMetadataDisplayItem init]");

  abort();
}

- (id)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong(&self->_content, a3);
}

- (NSString)accessoryImageSystemName
{
  return self->_accessoryImageSystemName;
}

- (NSString)accessibilityDescription
{
  return self->_accessibilityDescription;
}

- (void)setAccessibilityDescription:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityDescription, a3);
}

- (NSString)accessibilityValue
{
  return self->_accessibilityValue;
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_accessibilityValue, 0);
  objc_storeStrong((id *)&self->_accessibilityDescription, 0);
  objc_storeStrong((id *)&self->_accessoryImageSystemName, 0);
  objc_storeStrong(&self->_content, 0);
}

+ (id)emptyItem
{
  return -[PXMetadataDisplayItem initWithContent:accessibilityDescription:accessibilityValue:accessibilityIdentifier:accessoryImageSystemName:]([PXMetadataDisplayItem alloc], "initWithContent:accessibilityDescription:accessibilityValue:accessibilityIdentifier:accessoryImageSystemName:", &stru_1E5149688, 0, 0, 0, 0);
}

@end
