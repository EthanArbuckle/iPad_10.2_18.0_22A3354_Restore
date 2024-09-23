@implementation SLCollaborationAttributionRecipientDrawingMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLCollaborationAttributionRecipientDrawingMetadata)initWithContact:(id)a3 contactImageData:(id)a4
{
  id v7;
  id v8;
  SLCollaborationAttributionRecipientDrawingMetadata *v9;
  SLCollaborationAttributionRecipientDrawingMetadata *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SLCollaborationAttributionRecipientDrawingMetadata;
  v9 = -[SLCollaborationAttributionRecipientDrawingMetadata init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contact, a3);
    objc_storeStrong((id *)&v10->_contactImageData, a4);
  }

  return v10;
}

- (SLCollaborationAttributionRecipientDrawingMetadata)initWithCoder:(id)a3
{
  id v4;
  SLCollaborationAttributionRecipientDrawingMetadata *v5;
  uint64_t v6;
  CNContact *contact;
  uint64_t v8;
  NSData *contactImageData;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SLCollaborationAttributionRecipientDrawingMetadata;
  v5 = -[SLCollaborationAttributionRecipientDrawingMetadata init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contact"));
    v6 = objc_claimAutoreleasedReturnValue();
    contact = v5->_contact;
    v5->_contact = (CNContact *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactImageData"));
    v8 = objc_claimAutoreleasedReturnValue();
    contactImageData = v5->_contactImageData;
    v5->_contactImageData = (NSData *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SLCollaborationAttributionRecipientDrawingMetadata contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("contact"));

  -[SLCollaborationAttributionRecipientDrawingMetadata contactImageData](self, "contactImageData");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("contactImageData"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[SLCollaborationAttributionRecipientDrawingMetadata contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLCollaborationAttributionRecipientDrawingMetadata contactImageData](self, "contactImageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithContact:contactImageData:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  SLCollaborationAttributionRecipientDrawingMetadata *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (SLCollaborationAttributionRecipientDrawingMetadata *)v5;
    if (v6 == self)
    {
      v20 = 1;
LABEL_21:

      goto LABEL_22;
    }
    -[SLCollaborationAttributionRecipientDrawingMetadata contact](self, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      -[SLCollaborationAttributionRecipientDrawingMetadata contact](v6, "contact");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
        goto LABEL_9;
    }
    -[SLCollaborationAttributionRecipientDrawingMetadata contact](self, "contact");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_18;
    v9 = (void *)v8;
    -[SLCollaborationAttributionRecipientDrawingMetadata contact](v6, "contact");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_17;
    v11 = (void *)v10;
    -[SLCollaborationAttributionRecipientDrawingMetadata contact](self, "contact");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLCollaborationAttributionRecipientDrawingMetadata contact](v6, "contact");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

    if (v7)
    {

      if (v14)
        goto LABEL_9;
    }
    else
    {

      if ((v14 & 1) != 0)
      {
LABEL_9:
        -[SLCollaborationAttributionRecipientDrawingMetadata contactImageData](self, "contactImageData");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v7)
        {
          -[SLCollaborationAttributionRecipientDrawingMetadata contactImageData](v6, "contactImageData");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v3)
          {
            v20 = 1;
            goto LABEL_19;
          }
        }
        -[SLCollaborationAttributionRecipientDrawingMetadata contactImageData](self, "contactImageData");
        v15 = objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
LABEL_18:
          v20 = 0;
          if (v7)
            goto LABEL_20;
LABEL_19:

          goto LABEL_20;
        }
        v9 = (void *)v15;
        -[SLCollaborationAttributionRecipientDrawingMetadata contactImageData](v6, "contactImageData");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          -[SLCollaborationAttributionRecipientDrawingMetadata contactImageData](self, "contactImageData");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[SLCollaborationAttributionRecipientDrawingMetadata contactImageData](v6, "contactImageData");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "isEqualToData:", v19);

          if (!v7)
            goto LABEL_19;
LABEL_20:

          goto LABEL_21;
        }
LABEL_17:

        goto LABEL_18;
      }
    }
    v20 = 0;
    goto LABEL_21;
  }
  v20 = 0;
LABEL_22:

  return v20;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[SLCollaborationAttributionRecipientDrawingMetadata contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SLCollaborationAttributionRecipientDrawingMetadata contactImageData](self, "contactImageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSData)contactImageData
{
  return self->_contactImageData;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_contactImageData, 0);
}

@end
