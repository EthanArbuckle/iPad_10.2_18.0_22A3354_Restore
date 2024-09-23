@implementation PCDisplayContext

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSURL *legacyAttachmentURL;
  NSURL *v8;
  NSURL *v9;
  NSURL *v10;
  int v11;
  BOOL v12;
  void *v13;
  NSString *legacyBodyText;
  NSString *v15;
  int v16;
  void *v17;
  NSString *localizedPrimaryAltText;
  NSString *v19;
  int v20;
  void *v21;
  NSString *localizedSecondaryAltText;
  NSString *v23;
  int v24;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "legacyAttachmentURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    legacyAttachmentURL = self->_legacyAttachmentURL;
    v8 = v6;
    v9 = legacyAttachmentURL;
    if (v8 == v9)
    {

    }
    else
    {
      v10 = v9;
      if ((v8 == 0) == (v9 != 0))
        goto LABEL_22;
      v11 = -[NSURL isEqual:](v8, "isEqual:", v9);

      if (!v11)
        goto LABEL_23;
    }
    objc_msgSend(v5, "legacyBodyText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    legacyBodyText = self->_legacyBodyText;
    v8 = v13;
    v15 = legacyBodyText;
    if (v8 == (NSURL *)v15)
    {

    }
    else
    {
      v10 = (NSURL *)v15;
      if ((v8 == 0) == (v15 != 0))
        goto LABEL_22;
      v16 = -[NSURL isEqual:](v8, "isEqual:", v15);

      if (!v16)
        goto LABEL_23;
    }
    objc_msgSend(v5, "localizedPrimaryAltText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    localizedPrimaryAltText = self->_localizedPrimaryAltText;
    v8 = v17;
    v19 = localizedPrimaryAltText;
    if (v8 == (NSURL *)v19)
    {

    }
    else
    {
      v10 = (NSURL *)v19;
      if ((v8 == 0) == (v19 != 0))
        goto LABEL_22;
      v20 = -[NSURL isEqual:](v8, "isEqual:", v19);

      if (!v20)
        goto LABEL_23;
    }
    objc_msgSend(v5, "localizedSecondaryAltText");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    localizedSecondaryAltText = self->_localizedSecondaryAltText;
    v8 = v21;
    v23 = localizedSecondaryAltText;
    if (v8 == (NSURL *)v23)
    {

LABEL_27:
      if (objc_msgSend(v5, "interactionBehavior") == self->_interactionBehavior)
      {
        v12 = objc_msgSend(v5, "interactionDirection") == self->_interactionDirection;
        goto LABEL_24;
      }
LABEL_23:
      v12 = 0;
LABEL_24:

      goto LABEL_25;
    }
    v10 = (NSURL *)v23;
    if ((v8 == 0) != (v23 != 0))
    {
      v24 = -[NSURL isEqual:](v8, "isEqual:", v23);

      if (!v24)
        goto LABEL_23;
      goto LABEL_27;
    }
LABEL_22:

    goto LABEL_23;
  }
  v12 = 0;
LABEL_25:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PCDisplayContext *v4;

  v4 = objc_alloc_init(PCDisplayContext);
  -[PCDisplayContext setInteractionBehavior:](v4, "setInteractionBehavior:", self->_interactionBehavior);
  -[PCDisplayContext setInteractionDirection:](v4, "setInteractionDirection:", self->_interactionDirection);
  -[PCDisplayContext setLegacyAttachmentURL:](v4, "setLegacyAttachmentURL:", self->_legacyAttachmentURL);
  -[PCDisplayContext setLegacyBodyText:](v4, "setLegacyBodyText:", self->_legacyBodyText);
  -[PCDisplayContext setLocalizedPrimaryAltText:](v4, "setLocalizedPrimaryAltText:", self->_localizedPrimaryAltText);
  -[PCDisplayContext setLocalizedSecondaryAltText:](v4, "setLocalizedSecondaryAltText:", self->_localizedSecondaryAltText);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  int64_t interactionBehavior;
  int64_t interactionDirection;
  NSURL *legacyAttachmentURL;
  NSString *legacyBodyText;
  NSString *localizedPrimaryAltText;
  NSString *localizedSecondaryAltText;
  id v11;

  v4 = a3;
  interactionBehavior = self->_interactionBehavior;
  v11 = v4;
  if (interactionBehavior)
  {
    objc_msgSend(v4, "encodeInteger:forKey:", interactionBehavior, CFSTR("be"));
    v4 = v11;
  }
  interactionDirection = self->_interactionDirection;
  if (interactionDirection)
  {
    objc_msgSend(v11, "encodeInteger:forKey:", interactionDirection, CFSTR("dir"));
    v4 = v11;
  }
  legacyAttachmentURL = self->_legacyAttachmentURL;
  if (legacyAttachmentURL)
  {
    objc_msgSend(v11, "encodeObject:forKey:", legacyAttachmentURL, CFSTR("lu"));
    v4 = v11;
  }
  legacyBodyText = self->_legacyBodyText;
  if (legacyBodyText)
  {
    objc_msgSend(v11, "encodeObject:forKey:", legacyBodyText, CFSTR("lb"));
    v4 = v11;
  }
  localizedPrimaryAltText = self->_localizedPrimaryAltText;
  if (localizedPrimaryAltText)
  {
    objc_msgSend(v11, "encodeObject:forKey:", localizedPrimaryAltText, CFSTR("prime"));
    v4 = v11;
  }
  localizedSecondaryAltText = self->_localizedSecondaryAltText;
  if (localizedSecondaryAltText)
  {
    objc_msgSend(v11, "encodeObject:forKey:", localizedSecondaryAltText, CFSTR("sec"));
    v4 = v11;
  }

}

- (PCDisplayContext)initWithCoder:(id)a3
{
  id v4;
  PCDisplayContext *v5;
  id v6;
  id v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PCDisplayContext;
  v5 = -[PCDisplayContext init](&v9, sel_init);
  if (v5)
  {
    v6 = v4;
    if (objc_msgSend(v6, "containsValueForKey:", CFSTR("be")))
      v5->_interactionBehavior = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("be"));

    v7 = v6;
    if (objc_msgSend(v7, "containsValueForKey:", CFSTR("dir")))
      v5->_interactionDirection = objc_msgSend(v7, "decodeIntegerForKey:", CFSTR("dir"));

    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
  }

  return v5;
}

- (NSURL)legacyAttachmentURL
{
  return self->_legacyAttachmentURL;
}

- (void)setLegacyAttachmentURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)legacyBodyText
{
  return self->_legacyBodyText;
}

- (void)setLegacyBodyText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)localizedPrimaryAltText
{
  return self->_localizedPrimaryAltText;
}

- (void)setLocalizedPrimaryAltText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)localizedSecondaryAltText
{
  return self->_localizedSecondaryAltText;
}

- (void)setLocalizedSecondaryAltText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)interactionBehavior
{
  return self->_interactionBehavior;
}

- (void)setInteractionBehavior:(int64_t)a3
{
  self->_interactionBehavior = a3;
}

- (int64_t)interactionDirection
{
  return self->_interactionDirection;
}

- (void)setInteractionDirection:(int64_t)a3
{
  self->_interactionDirection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedSecondaryAltText, 0);
  objc_storeStrong((id *)&self->_localizedPrimaryAltText, 0);
  objc_storeStrong((id *)&self->_legacyBodyText, 0);
  objc_storeStrong((id *)&self->_legacyAttachmentURL, 0);
}

@end
