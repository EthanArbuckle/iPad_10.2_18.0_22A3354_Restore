@implementation SFMapCardSectionEngagementFeedback

- (SFMapCardSectionEngagementFeedback)initWithCoder:(id)a3
{
  id v4;
  SFMapCardSectionEngagementFeedback *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSData *modifiedPlacemarkData;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFMapCardSectionEngagementFeedback;
  v5 = -[SFCardSectionEngagementFeedback initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_modifiedPlacemarkData);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    modifiedPlacemarkData = v5->_modifiedPlacemarkData;
    v5->_modifiedPlacemarkData = (NSData *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSData *modifiedPlacemarkData;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFMapCardSectionEngagementFeedback;
  v4 = a3;
  -[SFCardSectionEngagementFeedback encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  modifiedPlacemarkData = self->_modifiedPlacemarkData;
  NSStringFromSelector(sel_modifiedPlacemarkData);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", modifiedPlacemarkData, v6, v7.receiver, v7.super_class);

}

- (NSData)modifiedPlacemarkData
{
  return self->_modifiedPlacemarkData;
}

- (void)setModifiedPlacemarkData:(id)a3
{
  objc_storeStrong((id *)&self->_modifiedPlacemarkData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedPlacemarkData, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
