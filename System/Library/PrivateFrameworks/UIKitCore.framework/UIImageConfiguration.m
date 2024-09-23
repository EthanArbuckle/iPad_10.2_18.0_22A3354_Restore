@implementation UIImageConfiguration

- (UIImageConfiguration)configurationByApplyingConfiguration:(UIImageConfiguration *)otherConfiguration
{
  UIImageConfiguration *v4;
  UIImageConfiguration *v5;

  v4 = otherConfiguration;
  if (-[UIImageConfiguration _shouldApplyConfiguration:](self, "_shouldApplyConfiguration:", v4))
  {
    v5 = (UIImageConfiguration *)-[UIImageConfiguration copy](self, "copy");
    -[UIImageConfiguration _applyConfigurationValuesTo:](v4, "_applyConfigurationValuesTo:", v5);
  }
  else
  {
    v5 = self;
  }

  return v5;
}

- (BOOL)_shouldApplyConfiguration:(id)a3
{
  if (a3)
    return objc_msgSend(a3, "_isUnspecified") ^ 1;
  else
    return 0;
}

- (BOOL)_isUnspecified
{
  return !self->_traitCollection && !self->_locale && !self->_ignoresDynamicType;
}

- (void)_applyConfigurationValuesTo:(id)a3
{
  UITraitCollection *v4;
  UITraitCollection *v5;
  UITraitCollection *v6;
  UITraitCollection *v7;
  UITraitCollection *v8;
  id v9;
  NSLocale *locale;
  id *v11;
  _QWORD v12[6];

  v11 = (id *)a3;
  objc_msgSend(v11, "traitCollection");
  v4 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
  v5 = self->_traitCollection;
  v6 = v5;
  if (v4 && v5)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __96__UITraitCollection__traitCollectionByPopulatingUnspecifiedTraitsWithValuesFromTraitCollection___block_invoke;
    v12[3] = &unk_1E16CC518;
    v12[4] = v5;
    v12[5] = v4;
    v7 = (UITraitCollection *)-[UITraitCollection _traitCollectionByModifyingTraitsCopyOnWrite:](v5, (uint64_t)v12);
  }
  else
  {
    if (v4)
      v8 = v4;
    else
      v8 = v5;
    v7 = v8;
  }
  v9 = v11[2];
  v11[2] = v7;

  locale = self->_locale;
  if (locale)
    objc_storeStrong(v11 + 3, locale);
  if (!dyld_program_sdk_at_least() || self->_ignoresDynamicType)
    *((_BYTE *)v11 + 8) = self->_ignoresDynamicType;

}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (BOOL)_ignoresDynamicType
{
  return self->_ignoresDynamicType;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_init");
  objc_storeStrong((id *)(v4 + 16), self->_traitCollection);
  objc_storeStrong((id *)(v4 + 24), self->_locale);
  *(_BYTE *)(v4 + 8) = self->_ignoresDynamicType;
  return (id)v4;
}

- (id)_initWithTraitCollection:(id)a3
{
  char *v4;
  UIImageConfiguration *v5;
  uint64_t v6;
  UITraitCollection *traitCollection;
  objc_super v9;

  v4 = (char *)a3;
  v9.receiver = self;
  v9.super_class = (Class)UIImageConfiguration;
  v5 = -[UIImageConfiguration init](&v9, sel_init);
  if (v5)
  {
    -[UITraitCollection _traitCollectionRelevantForImageConfiguration](v4);
    v6 = objc_claimAutoreleasedReturnValue();
    traitCollection = v5->_traitCollection;
    v5->_traitCollection = (UITraitCollection *)v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

+ (id)_completeConfiguration:(void *)a3 fromConfiguration:
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  id v14;

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  if (v5)
  {
    if (v4)
      goto LABEL_3;
  }
  else
  {
    _UICurrentImageTraitCollection();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageConfiguration");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
LABEL_3:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v6 = objc_alloc((Class)objc_opt_class());
        v7 = -[UIImageConfiguration _initWithConfiguration:](v6, v5);

        v5 = (id)v7;
      }
      v8 = v4;
      v9 = v5;
      v10 = v9;
      if (v9 == v8)
      {

      }
      else
      {
        if (!v9)
        {

LABEL_14:
          objc_msgSend(v10, "configurationByApplyingConfiguration:", v8);
          v14 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        }
        v11 = objc_msgSend(v8, "isEqual:", v9);

        if (!v11)
          goto LABEL_14;
      }
      v14 = v8;
LABEL_15:
      v13 = v14;
      goto LABEL_16;
    }
  }
  v13 = v5;
  v10 = v13;
LABEL_16:

  return v13;
}

- (UIImageConfiguration)configurationWithTraitCollection:(UITraitCollection *)traitCollection
{
  void *v4;
  UITraitCollection *v5;
  UITraitCollection *v6;
  UITraitCollection *v7;
  UITraitCollection *v8;
  BOOL v9;
  UIImageConfiguration *v10;

  -[UITraitCollection _traitCollectionRelevantForImageConfiguration]((char *)traitCollection);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self->_traitCollection;
  v6 = v4;
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (!v6 || !v7)
    {

LABEL_9:
      v10 = (UIImageConfiguration *)-[UIImageConfiguration copy](self, "copy");
      objc_storeStrong((id *)&v10->_traitCollection, v4);
      goto LABEL_10;
    }
    v9 = -[UITraitCollection isEqual:](v6, "isEqual:", v7);

    if (!v9)
      goto LABEL_9;
  }
  v10 = self;
LABEL_10:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[UITraitCollection hash](self->_traitCollection, "hash");
  return -[NSLocale hash](self->_locale, "hash") ^ v3;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (id)_init
{
  return -[UIImageConfiguration _initWithTraitCollection:](self, "_initWithTraitCollection:", 0);
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  UIImageConfiguration *v4;
  uint64_t v5;
  UITraitCollection *traitCollection;
  UITraitCollection *v7;
  UITraitCollection *v8;
  UITraitCollection *v9;
  _BOOL4 v10;
  NSLocale *locale;
  NSLocale *v12;
  UITraitCollection *v13;

  v4 = (UIImageConfiguration *)a3;
  if (self == v4)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class() && v4->_ignoresDynamicType == self->_ignoresDynamicType)
    {
      traitCollection = v4->_traitCollection;
      v7 = self->_traitCollection;
      v8 = traitCollection;
      if (v7 == v8)
      {

      }
      else
      {
        v9 = v8;
        LOBYTE(v10) = 0;
        if (!v7 || !v8)
        {
LABEL_17:

          goto LABEL_18;
        }
        v10 = -[UITraitCollection isEqual:](v7, "isEqual:", v8);

        if (!v10)
          goto LABEL_18;
      }
      locale = self->_locale;
      v12 = v4->_locale;
      v7 = locale;
      v13 = v12;
      if (v7 == v13)
      {
        LOBYTE(v10) = 1;
        v9 = v7;
      }
      else
      {
        v9 = v13;
        LOBYTE(v10) = 0;
        if (v7 && v13)
          LOBYTE(v10) = -[UITraitCollection isEqual:](v7, "isEqual:", v13);
      }
      goto LABEL_17;
    }
    LOBYTE(v10) = 0;
  }
LABEL_18:

  return v10;
}

- (UIImageConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UIImageConfiguration *v7;
  void *v8;
  uint64_t v9;
  NSLocale *locale;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("UITraitCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[UIImageConfiguration _initWithTraitCollection:](self, "_initWithTraitCollection:", v6);
  if (v7)
  {
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("NSLocale"));
    v9 = objc_claimAutoreleasedReturnValue();
    locale = v7->_locale;
    v7->_locale = (NSLocale *)v9;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIIgnoresDynamicType")))
      v7->_ignoresDynamicType = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIIgnoresDynamicType"));
  }

  return v7;
}

- (uint64_t)_initWithConfiguration:(void *)a1
{
  id v3;
  void *v4;
  uint64_t v5;

  if (a1)
  {
    v3 = a2;
    objc_msgSend((id)objc_opt_class(), "_unspecifiedConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configurationByApplyingConfiguration:", v3);
    v5 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_unspecifiedConfiguration
{
  if (_MergedGlobals_1099 != -1)
    dispatch_once(&_MergedGlobals_1099, &__block_literal_global_296);
  return (id)qword_1ECD7E908;
}

void __49__UIImageConfiguration__unspecifiedConfiguration__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[UIImageConfiguration _init]([UIImageConfiguration alloc], "_init");
  v1 = (void *)qword_1ECD7E908;
  qword_1ECD7E908 = (uint64_t)v0;

}

+ (UIImageConfiguration)configurationWithTraitCollection:(UITraitCollection *)traitCollection
{
  UITraitCollection *v4;
  void *v5;

  v4 = traitCollection;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithTraitCollection:", v4);

  return (UIImageConfiguration *)v5;
}

- (UIImageConfiguration)configurationWithLocale:(NSLocale *)locale
{
  NSLocale *v5;
  NSLocale *v6;
  NSLocale *v7;
  NSLocale *v8;
  NSLocale *v9;
  char v10;
  UIImageConfiguration *v11;

  v5 = locale;
  v6 = self->_locale;
  v7 = v5;
  v8 = v6;
  if (v8 == v7)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
    {

LABEL_9:
      v11 = (UIImageConfiguration *)-[UIImageConfiguration copy](self, "copy");
      objc_storeStrong((id *)&v11->_locale, locale);
      goto LABEL_10;
    }
    v10 = -[NSLocale isEqual:](v7, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_9;
  }
  v11 = self;
LABEL_10:

  return v11;
}

+ (UIImageConfiguration)configurationWithLocale:(NSLocale *)locale
{
  NSLocale *v4;
  _QWORD *v5;
  void *v6;

  v4 = locale;
  v5 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "_init");
  v6 = (void *)v5[3];
  v5[3] = v4;

  return (UIImageConfiguration *)v5;
}

- (id)_configurationIgnoringDynamicType
{
  _BYTE *v3;

  if (self->_ignoresDynamicType)
    return self;
  v3 = (_BYTE *)-[UIImageConfiguration copy](self, "copy");
  v3[8] = 1;
  return v3;
}

- (BOOL)_isEquivalentToConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  char v18;

  v4 = a3;
  if (!v4)
    goto LABEL_19;
  -[UIImageConfiguration traitCollection](self, "traitCollection");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[UIImageConfiguration traitCollection](self, "traitCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "traitCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[UITraitCollection _matchesIntersectionWithTraitCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly:]((uint64_t)v7, (uint64_t)v8);

      if (!v9)
        goto LABEL_19;
      LODWORD(v5) = 1;
    }
    else
    {
      LODWORD(v5) = 0;
    }
  }
  -[UIImageConfiguration locale](self, "locale");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(v4, "locale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[UIImageConfiguration locale](self, "locale");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "locale");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v13;
      v16 = v14;
      if (v15 == v16)
      {

LABEL_15:
        LODWORD(v5) = 1;
        goto LABEL_16;
      }
      v17 = v16;
      if (v15 && v16)
      {
        v18 = objc_msgSend(v15, "isEqual:", v16);

        if ((v18 & 1) == 0)
          goto LABEL_19;
        goto LABEL_15;
      }

LABEL_19:
      LOBYTE(v5) = 0;
      goto LABEL_20;
    }
  }
LABEL_16:
  if (-[UIImageConfiguration _ignoresDynamicType](self, "_ignoresDynamicType"))
    LODWORD(v5) = v5 | objc_msgSend(v4, "_ignoresDynamicType");
LABEL_20:

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  UITraitCollection *traitCollection;
  NSLocale *locale;
  id v6;

  v6 = a3;
  traitCollection = self->_traitCollection;
  if (traitCollection)
    objc_msgSend(v6, "encodeObject:forKey:", traitCollection, CFSTR("UITraitCollection"));
  locale = self->_locale;
  if (locale)
    objc_msgSend(v6, "encodeObject:forKey:", locale, CFSTR("NSLocale"));
  if (-[UIImageConfiguration _ignoresDynamicType](self, "_ignoresDynamicType"))
    objc_msgSend(v6, "encodeBool:forKey:", self->_ignoresDynamicType, CFSTR("UIIgnoresDynamicType"));

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  UITraitCollection *traitCollection;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  traitCollection = self->_traitCollection;
  if (traitCollection)
  {
    -[UITraitCollection _traitsDescription](traitCollection, "_traitsDescription");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" traits=(%@)"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  else
  {
    objc_msgSend(v6, "stringByAppendingString:", CFSTR(" no traits"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (self->_locale)
  {
    objc_msgSend(v9, "stringByAppendingFormat:", CFSTR(" locale=(%@)"), self->_locale);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  if (self->_ignoresDynamicType)
  {
    objc_msgSend(v9, "stringByAppendingString:", CFSTR(" (ignores DT)"));
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  objc_msgSend(v9, "stringByAppendingString:", CFSTR(">"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (UITraitCollection)_effectiveTraitCollectionForImageLookup
{
  UITraitCollection *traitCollection;
  UITraitCollection *v4;
  void *v5;
  id v6;
  uint64_t v7;

  traitCollection = self->_traitCollection;
  if (traitCollection)
  {
    v4 = traitCollection;
  }
  else
  {
    +[UITraitCollection _emptyTraitCollection]();
    v4 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  if (self->_ignoresDynamicType)
  {
    if (qword_1ECD7E918 != -1)
      dispatch_once(&qword_1ECD7E918, &__block_literal_global_21_4);
    v6 = (id)qword_1ECD7E910;
    objc_msgSend(v5, "_traitCollectionByReplacingObject:forTraitToken:", v6, 0x1E1A99540);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  return (UITraitCollection *)v5;
}

@end
