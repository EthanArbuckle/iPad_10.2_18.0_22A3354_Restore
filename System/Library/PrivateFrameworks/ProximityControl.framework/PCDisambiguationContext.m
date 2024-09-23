@implementation PCDisambiguationContext

- (PCDisambiguationContext)initWithIdentifier:(id)a3 direction:(int64_t)a4 activityData:(id)a5
{
  id v9;
  id v10;
  PCDisambiguationContext *v11;
  PCDisambiguationContext *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PCDisambiguationContext;
  v11 = -[PCDisambiguationContext init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_deviceIdentifier, a3);
    v12->_interactionDirection = a4;
    -[PCDisambiguationContext cacheActivityData:](v12, "cacheActivityData:", v10);
  }

  return v12;
}

- (void)cacheActivityData:(id)a3
{
  NSData *v4;
  NSData *activityData;
  PCActivity *v6;
  PCActivity *activity;
  id v8;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  activityData = self->_activityData;
  self->_activityData = v4;

  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1960]), "_initWithUserActivityData:", self->_activityData);
  +[PCActivityUtility activityFrom:](PCActivityUtility, "activityFrom:", v8);
  v6 = (PCActivity *)objc_claimAutoreleasedReturnValue();
  activity = self->_activity;
  self->_activity = v6;

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PCDisambiguationContext initWithIdentifier:direction:activityData:]([PCDisambiguationContext alloc], "initWithIdentifier:direction:activityData:", self->_deviceIdentifier, self->_interactionDirection, self->_activityData);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  PCDeviceIdentifier *deviceIdentifier;
  int64_t interactionDirection;
  NSData *activityData;
  id v8;

  v4 = a3;
  deviceIdentifier = self->_deviceIdentifier;
  v8 = v4;
  if (deviceIdentifier)
  {
    objc_msgSend(v4, "encodeObject:forKey:", deviceIdentifier, CFSTR("did"));
    v4 = v8;
  }
  interactionDirection = self->_interactionDirection;
  if (interactionDirection)
  {
    objc_msgSend(v8, "encodeInteger:forKey:", interactionDirection, CFSTR("id"));
    v4 = v8;
  }
  activityData = self->_activityData;
  if (activityData)
  {
    objc_msgSend(v8, "encodeObject:forKey:", activityData, CFSTR("act"));
    v4 = v8;
  }

}

- (PCDisambiguationContext)initWithCoder:(id)a3
{
  id v4;
  PCDisambiguationContext *v5;
  id v6;
  objc_super v8;
  id v9;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PCDisambiguationContext;
  v9 = 0;
  v5 = -[PCDisambiguationContext init](&v8, sel_init);
  if (v5)
  {
    objc_opt_class();
    NSDecodeObjectIfPresent();
    v6 = v4;
    if (objc_msgSend(v6, "containsValueForKey:", CFSTR("id")))
      v5->_interactionDirection = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("id"));

    objc_opt_class();
    NSDecodeObjectIfPresent();
    -[PCDisambiguationContext cacheActivityData:](v5, "cacheActivityData:", v9);
  }

  return v5;
}

- (id)titleText
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  if (-[PCDisambiguationContext interactionDirection](self, "interactionDirection") == 2)
  {
    +[PCLocalizedString localizedStringForKey:](PCLocalizedString, "localizedStringForKey:", 11);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v3);
  }
  else
  {
    if (-[PCDisambiguationContext interactionDirection](self, "interactionDirection") != 1)
    {
      v4 = objc_alloc_init(MEMORY[0x24BDD1458]);
      return v4;
    }
    +[PCLocalizedString localizedStringForKey:](PCLocalizedString, "localizedStringForKey:", 10);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v3);
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("iphone"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithTintColor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc_init(MEMORY[0x24BDF6768]);
    objc_msgSend(v9, "setImage:", v8);
    objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x24BDD1688]);
    objc_msgSend(v11, "appendAttributedString:", v10);
    objc_msgSend(v11, "appendAttributedString:", v5);
    v4 = (id)objc_msgSend(v11, "copy");

  }
  return v4;
}

- (id)subtitleText
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  if (-[PCDisambiguationContext interactionDirection](self, "interactionDirection") == 2)
    return 0;
  -[PCDisambiguationContext activity](self, "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PCDisambiguationContext activity](self, "activity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "pcactivityType");

    if (v6)
    {
      if (v6 != 1)
        return 0;
      -[PCDisambiguationContext activity](self, "activity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "shortDescription");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PCDisambiguationContext activity](self, "activity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "description");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v4 = (void *)v8;

  }
  return v4;
}

- (id)leadingImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v19;

  -[PCDisambiguationContext activity](self, "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDF6AE0];
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 26.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configurationWithFont:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:withConfiguration:", CFSTR("iphone.and.arrow.forward"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageWithTintColor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PCDisambiguationContext activity](self, "activity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "pcactivityType");

    -[PCDisambiguationContext activity](self, "activity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11 == 1)
    {
      if (objc_msgSend(v12, "direction") == 2)
      {
        v14 = v9;
      }
      else
      {
        -[PCDisambiguationContext activity](self, "activity");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[PCActivityUtility disambiguationButtonImageForActivity:](PCActivityUtility, "disambiguationButtonImageForActivity:", v17);
        v14 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_13;
    }
    v15 = objc_msgSend(v12, "pcactivityType");

    if (v15)
    {
      v16 = objc_alloc_init(MEMORY[0x24BDF6AC8]);
    }
    else
    {
      if (-[PCDisambiguationContext interactionDirection](self, "interactionDirection") != 2)
      {
        -[PCDisambiguationContext activity](self, "activity");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[PCActivityUtility disambiguationButtonImageForActivity:](PCActivityUtility, "disambiguationButtonImageForActivity:", v19);
        v14 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_13;
      }
      v16 = v9;
    }
    v14 = v16;
LABEL_13:

    return v14;
  }
  v14 = objc_alloc_init(MEMORY[0x24BDF6AC8]);
  return v14;
}

- (PCHomeKitIdentifier)identifier
{
  return self->_identifier;
}

- (PCDeviceIdentifier)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (int64_t)interactionDirection
{
  return self->_interactionDirection;
}

- (PCActivity)activity
{
  return self->_activity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_activityData, 0);
}

@end
