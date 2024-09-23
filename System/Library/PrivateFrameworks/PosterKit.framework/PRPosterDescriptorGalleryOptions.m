@implementation PRPosterDescriptorGalleryOptions

+ (id)galleryOptionsFromDictionaryRepresentation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  PRPosterDescriptorGalleryOptions *v8;
  void *v9;
  PRPosterDescriptorGalleryOptions *v10;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("presentationStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("displayStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = PRPosterGalleryPresentationStyleFromString(v4);
  v7 = PRPosterGalleryDisplayStyleFromString(v5);
  v8 = [PRPosterDescriptorGalleryOptions alloc];
  +[PRPosterDescriptorGalleryAssetLookupInfo defaultLookupInfo](PRPosterDescriptorGalleryAssetLookupInfo, "defaultLookupInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PRPosterDescriptorGalleryOptions initWithAssetLookupInfo:galleryPresentationStyle:galleryDisplayStyle:](v8, "initWithAssetLookupInfo:galleryPresentationStyle:galleryDisplayStyle:", v9, v6, v7);

  return v10;
}

+ (PRPosterDescriptorGalleryOptions)galleryOptionsWithAssetLookupInfo:(id)a3
{
  id v3;
  PRPosterDescriptorGalleryOptions *v4;
  PRPosterDescriptorGalleryOptions *v5;
  PRPosterDescriptorGalleryOptions *v6;
  void *v7;

  v3 = a3;
  v4 = [PRPosterDescriptorGalleryOptions alloc];
  v5 = v4;
  if (v3)
  {
    v6 = -[PRPosterDescriptorGalleryOptions initWithAssetLookupInfo:galleryPresentationStyle:galleryDisplayStyle:](v4, "initWithAssetLookupInfo:galleryPresentationStyle:galleryDisplayStyle:", v3, 0, 0);
  }
  else
  {
    +[PRPosterDescriptorGalleryAssetLookupInfo defaultLookupInfo](PRPosterDescriptorGalleryAssetLookupInfo, "defaultLookupInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PRPosterDescriptorGalleryOptions initWithAssetLookupInfo:galleryPresentationStyle:galleryDisplayStyle:](v5, "initWithAssetLookupInfo:galleryPresentationStyle:galleryDisplayStyle:", v7, 0, 0);

  }
  return v6;
}

+ (PRPosterDescriptorGalleryOptions)galleryOptionsWithAssetLookupInfo:(id)a3 galleryPresentationStyle:(unint64_t)a4
{
  id v5;
  PRPosterDescriptorGalleryOptions *v6;
  PRPosterDescriptorGalleryOptions *v7;
  PRPosterDescriptorGalleryOptions *v8;
  void *v9;

  v5 = a3;
  v6 = [PRPosterDescriptorGalleryOptions alloc];
  v7 = v6;
  if (v5)
  {
    v8 = -[PRPosterDescriptorGalleryOptions initWithAssetLookupInfo:galleryPresentationStyle:galleryDisplayStyle:](v6, "initWithAssetLookupInfo:galleryPresentationStyle:galleryDisplayStyle:", v5, a4, 0);
  }
  else
  {
    +[PRPosterDescriptorGalleryAssetLookupInfo defaultLookupInfo](PRPosterDescriptorGalleryAssetLookupInfo, "defaultLookupInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PRPosterDescriptorGalleryOptions initWithAssetLookupInfo:galleryPresentationStyle:galleryDisplayStyle:](v7, "initWithAssetLookupInfo:galleryPresentationStyle:galleryDisplayStyle:", v9, a4, 0);

  }
  return v8;
}

+ (PRPosterDescriptorGalleryOptions)galleryOptionsWithAssetLookupInfo:(id)a3 galleryPresentationStyle:(unint64_t)a4 galleryDisplayStyle:(unint64_t)a5
{
  id v7;
  PRPosterDescriptorGalleryOptions *v8;

  v7 = a3;
  v8 = -[PRPosterDescriptorGalleryOptions initWithAssetLookupInfo:galleryPresentationStyle:galleryDisplayStyle:]([PRPosterDescriptorGalleryOptions alloc], "initWithAssetLookupInfo:galleryPresentationStyle:galleryDisplayStyle:", v7, a4, a5);

  return v8;
}

- (PRPosterDescriptorGalleryOptions)initWithAssetLookupInfo:(id)a3 galleryPresentationStyle:(unint64_t)a4 galleryDisplayStyle:(unint64_t)a5
{
  id v8;
  PRPosterDescriptorGalleryOptions *v9;
  uint64_t v10;
  PRPosterDescriptorGalleryAssetLookupInfo *galleryAssetLookupInfo;
  void *v13;
  void *v14;
  objc_super v15;

  v8 = a3;
  NSClassFromString(CFSTR("PRPosterDescriptorGalleryAssetLookupInfo"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterDescriptorGalleryOptions initWithAssetLookupInfo:galleryPresentationStyle:galleryDisplayStyle:].cold.1();
LABEL_15:
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6B5438);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterDescriptorGalleryAssetLookupInfoClass]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterDescriptorGalleryOptions initWithAssetLookupInfo:galleryPresentationStyle:galleryDisplayStyle:].cold.1();
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6B549CLL);
  }

  if (a4 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("presentationStyle == PRPosterGalleryPresentationStyleDefault || presentationStyle == PRPosterGalleryPresentationStyleSlideUp"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterDescriptorGalleryOptions initWithAssetLookupInfo:galleryPresentationStyle:galleryDisplayStyle:].cold.2();
    goto LABEL_15;
  }
  v15.receiver = self;
  v15.super_class = (Class)PRPosterDescriptorGalleryOptions;
  v9 = -[PRPosterDescriptorGalleryOptions init](&v15, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    galleryAssetLookupInfo = v9->_galleryAssetLookupInfo;
    v9->_galleryAssetLookupInfo = (PRPosterDescriptorGalleryAssetLookupInfo *)v10;

    v9->_presentationStyle = a4;
    v9->_displayStyle = a5;
  }

  return v9;
}

- (PRPosterDescriptorGalleryOptions)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  PRPosterDescriptorGalleryOptions *v9;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("galleryAssetLookupInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("presentationStyle"));
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("displayStyle"));

  v9 = -[PRPosterDescriptorGalleryOptions initWithAssetLookupInfo:galleryPresentationStyle:galleryDisplayStyle:](self, "initWithAssetLookupInfo:galleryPresentationStyle:galleryDisplayStyle:", v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  PRPosterDescriptorGalleryAssetLookupInfo *galleryAssetLookupInfo;
  id v5;

  galleryAssetLookupInfo = self->_galleryAssetLookupInfo;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", galleryAssetLookupInfo, CFSTR("galleryAssetLookupInfo"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_presentationStyle, CFSTR("presentationStyle"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_displayStyle, CFSTR("displayStyle"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithAssetLookupInfo:galleryPresentationStyle:galleryDisplayStyle:", self->_galleryAssetLookupInfo, self->_presentationStyle, self->_displayStyle);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRPosterDescriptorGalleryAssetLookupInfo)galleryAssetLookupInfo
{
  return self->_galleryAssetLookupInfo;
}

- (unint64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_galleryAssetLookupInfo, 0);
}

- (void)initWithAssetLookupInfo:galleryPresentationStyle:galleryDisplayStyle:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithAssetLookupInfo:galleryPresentationStyle:galleryDisplayStyle:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
