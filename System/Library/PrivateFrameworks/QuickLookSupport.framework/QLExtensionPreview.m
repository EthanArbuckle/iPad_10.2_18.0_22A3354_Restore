@implementation QLExtensionPreview

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (QLExtensionPreview)initWithDescription:(id)a3
{
  id v5;
  QLExtensionPreview *v6;
  QLExtensionPreview *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLExtensionPreview;
  v6 = -[QLExtensionPreview init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_previewDescription, a3);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[QLExtensionPreview previewDescription](self, "previewDescription");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("previewDescription"));

}

- (QLExtensionPreview)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  QLExtensionPreview *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previewDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[QLExtensionPreview initWithDescription:](self, "initWithDescription:", v5);
  return v6;
}

- (NSString)previewDescription
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPreviewDescription:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewDescription, 0);
}

@end
