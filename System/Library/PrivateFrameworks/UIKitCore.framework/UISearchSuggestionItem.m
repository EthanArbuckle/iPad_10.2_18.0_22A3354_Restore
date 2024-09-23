@implementation UISearchSuggestionItem

+ (NSCopying)visualStyleRegistryIdentity
{
  return (NSCopying *)CFSTR("UISearchSuggestionItem");
}

+ (UISearchSuggestionItem)suggestionWithLocalizedAttributedSuggestion:(NSAttributedString *)suggestion
{
  return +[UISearchSuggestionItem suggestionWithLocalizedAttributedSuggestion:descriptionString:iconImage:](UISearchSuggestionItem, "suggestionWithLocalizedAttributedSuggestion:descriptionString:iconImage:", suggestion, 0, 0);
}

+ (UISearchSuggestionItem)suggestionWithLocalizedAttributedSuggestion:(NSAttributedString *)suggestion descriptionString:(NSString *)description
{
  return +[UISearchSuggestionItem suggestionWithLocalizedAttributedSuggestion:descriptionString:iconImage:](UISearchSuggestionItem, "suggestionWithLocalizedAttributedSuggestion:descriptionString:iconImage:", suggestion, description, 0);
}

+ (UISearchSuggestionItem)suggestionWithLocalizedAttributedSuggestion:(NSAttributedString *)suggestion descriptionString:(NSString *)description iconImage:(UIImage *)iconImage
{
  UIImage *v7;
  NSString *v8;
  NSAttributedString *v9;
  UISearchSuggestionItem *v10;

  v7 = iconImage;
  v8 = description;
  v9 = suggestion;
  v10 = -[UISearchSuggestionItem initWithLocalizedAttributedSuggestion:localizedDescription:iconImage:]([UISearchSuggestionItem alloc], "initWithLocalizedAttributedSuggestion:localizedDescription:iconImage:", v9, v8, v7);

  return v10;
}

+ (UISearchSuggestionItem)suggestionWithLocalizedSuggestion:(NSString *)suggestion
{
  return +[UISearchSuggestionItem suggestionWithLocalizedSuggestion:descriptionString:iconImage:](UISearchSuggestionItem, "suggestionWithLocalizedSuggestion:descriptionString:iconImage:", suggestion, 0, 0);
}

+ (UISearchSuggestionItem)suggestionWithLocalizedSuggestion:(NSString *)suggestion descriptionString:(NSString *)description
{
  return +[UISearchSuggestionItem suggestionWithLocalizedSuggestion:descriptionString:iconImage:](UISearchSuggestionItem, "suggestionWithLocalizedSuggestion:descriptionString:iconImage:", suggestion, description, 0);
}

+ (UISearchSuggestionItem)suggestionWithLocalizedSuggestion:(NSString *)suggestion descriptionString:(NSString *)description iconImage:(UIImage *)iconImage
{
  UIImage *v7;
  NSString *v8;
  NSString *v9;
  UISearchSuggestionItem *v10;

  v7 = iconImage;
  v8 = description;
  v9 = suggestion;
  v10 = -[UISearchSuggestionItem initWithLocalizedSuggestion:localizedDescription:iconImage:]([UISearchSuggestionItem alloc], "initWithLocalizedSuggestion:localizedDescription:iconImage:", v9, v8, v7);

  return v10;
}

- (UISearchSuggestionItem)initWithLocalizedAttributedSuggestion:(NSAttributedString *)suggestion
{
  return -[UISearchSuggestionItem initWithLocalizedAttributedSuggestion:localizedDescription:iconImage:](self, "initWithLocalizedAttributedSuggestion:localizedDescription:iconImage:", suggestion, 0, 0);
}

- (UISearchSuggestionItem)initWithLocalizedAttributedSuggestion:(NSAttributedString *)suggestion localizedDescription:(NSString *)description
{
  return -[UISearchSuggestionItem initWithLocalizedAttributedSuggestion:localizedDescription:iconImage:](self, "initWithLocalizedAttributedSuggestion:localizedDescription:iconImage:", suggestion, description, 0);
}

- (UISearchSuggestionItem)initWithLocalizedAttributedSuggestion:(NSAttributedString *)suggestion localizedDescription:(NSString *)description iconImage:(UIImage *)iconImage
{
  NSAttributedString *v8;
  NSString *v9;
  UIImage *v10;
  UISearchSuggestionItem *v11;
  uint64_t v12;
  NSAttributedString *localizedAttributedSuggestion;
  uint64_t v14;
  NSString *localizedSuggestion;
  uint64_t v16;
  NSString *localizedDescription;
  objc_super v19;

  v8 = suggestion;
  v9 = description;
  v10 = iconImage;
  v19.receiver = self;
  v19.super_class = (Class)UISearchSuggestionItem;
  v11 = -[UISearchSuggestionItem init](&v19, sel_init);
  if (v11)
  {
    v12 = -[NSAttributedString copy](v8, "copy");
    localizedAttributedSuggestion = v11->_localizedAttributedSuggestion;
    v11->_localizedAttributedSuggestion = (NSAttributedString *)v12;

    -[NSAttributedString string](v8, "string");
    v14 = objc_claimAutoreleasedReturnValue();
    localizedSuggestion = v11->_localizedSuggestion;
    v11->_localizedSuggestion = (NSString *)v14;

    v16 = -[NSString copy](v9, "copy");
    localizedDescription = v11->_localizedDescription;
    v11->_localizedDescription = (NSString *)v16;

    objc_storeStrong((id *)&v11->_iconImage, iconImage);
  }

  return v11;
}

- (UISearchSuggestionItem)initWithLocalizedSuggestion:(NSString *)suggestion
{
  return -[UISearchSuggestionItem initWithLocalizedSuggestion:localizedDescription:iconImage:](self, "initWithLocalizedSuggestion:localizedDescription:iconImage:", suggestion, 0, 0);
}

- (UISearchSuggestionItem)initWithLocalizedSuggestion:(NSString *)suggestion localizedDescription:(NSString *)description
{
  return -[UISearchSuggestionItem initWithLocalizedSuggestion:localizedDescription:iconImage:](self, "initWithLocalizedSuggestion:localizedDescription:iconImage:", suggestion, description, 0);
}

- (UISearchSuggestionItem)initWithLocalizedSuggestion:(NSString *)suggestion localizedDescription:(NSString *)description iconImage:(UIImage *)iconImage
{
  NSString *v8;
  NSString *v9;
  UIImage *v10;
  UISearchSuggestionItem *v11;
  uint64_t v12;
  NSString *localizedSuggestion;
  uint64_t v14;
  NSString *localizedDescription;
  objc_super v17;

  v8 = suggestion;
  v9 = description;
  v10 = iconImage;
  v17.receiver = self;
  v17.super_class = (Class)UISearchSuggestionItem;
  v11 = -[UISearchSuggestionItem init](&v17, sel_init);
  if (v11)
  {
    v12 = -[NSString copy](v8, "copy");
    localizedSuggestion = v11->_localizedSuggestion;
    v11->_localizedSuggestion = (NSString *)v12;

    v14 = -[NSString copy](v9, "copy");
    localizedDescription = v11->_localizedDescription;
    v11->_localizedDescription = (NSString *)v14;

    objc_storeStrong((id *)&v11->_iconImage, iconImage);
  }

  return v11;
}

- (void)setRepresentedObject:(id)representedObject
{
  id v5;
  id v6;
  void *v7;

  v5 = representedObject;
  if (v5 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISearchSuggestion.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("representedObject == nil || [representedObject respondsToSelector:@selector(isEqual:)]"));

  }
  v6 = self->_representedObject;
  self->_representedObject = v5;

}

- (BOOL)isEqual:(id)a3
{
  UISearchSuggestionItem *v4;
  UISearchSuggestionItem *v5;
  NSAttributedString *localizedAttributedSuggestion;
  NSAttributedString *v7;
  NSAttributedString *v8;
  NSAttributedString *v9;
  int v10;
  NSString *localizedSuggestion;
  NSAttributedString *v12;
  NSString *localizedDescription;
  NSAttributedString *v14;
  UIImage *iconImage;
  NSAttributedString *v16;
  id representedObject;
  id v18;
  NSAttributedString *v19;

  v4 = (UISearchSuggestionItem *)a3;
  if (self == v4)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      localizedAttributedSuggestion = v5->_localizedAttributedSuggestion;
      v7 = self->_localizedAttributedSuggestion;
      v8 = localizedAttributedSuggestion;
      if (v7 == v8)
      {

      }
      else
      {
        v9 = v8;
        LOBYTE(v10) = 0;
        if (!v7 || !v8)
          goto LABEL_34;
        v10 = -[NSAttributedString isEqual:](v7, "isEqual:", v8);

        if (!v10)
          goto LABEL_35;
      }
      localizedSuggestion = v5->_localizedSuggestion;
      v7 = self->_localizedSuggestion;
      v12 = localizedSuggestion;
      if (v7 == v12)
      {

      }
      else
      {
        v9 = v12;
        LOBYTE(v10) = 0;
        if (!v7 || !v12)
          goto LABEL_34;
        v10 = -[NSAttributedString isEqual:](v7, "isEqual:", v12);

        if (!v10)
          goto LABEL_35;
      }
      localizedDescription = v5->_localizedDescription;
      v7 = self->_localizedDescription;
      v14 = localizedDescription;
      if (v7 == v14)
      {

      }
      else
      {
        v9 = v14;
        LOBYTE(v10) = 0;
        if (!v7 || !v14)
          goto LABEL_34;
        v10 = -[NSAttributedString isEqual:](v7, "isEqual:", v14);

        if (!v10)
          goto LABEL_35;
      }
      iconImage = v5->_iconImage;
      v7 = self->_iconImage;
      v16 = iconImage;
      if (v7 == v16)
      {

LABEL_29:
        representedObject = self->_representedObject;
        v18 = v5->_representedObject;
        v7 = (NSAttributedString *)representedObject;
        v19 = (NSAttributedString *)v18;
        if (v7 == v19)
        {
          LOBYTE(v10) = 1;
          v9 = v7;
        }
        else
        {
          v9 = v19;
          LOBYTE(v10) = 0;
          if (v7 && v19)
            LOBYTE(v10) = -[NSAttributedString isEqual:](v7, "isEqual:", v19);
        }
        goto LABEL_34;
      }
      v9 = v16;
      LOBYTE(v10) = 0;
      if (v7 && v16)
      {
        v10 = -[NSAttributedString isEqual:](v7, "isEqual:", v16);

        if (!v10)
          goto LABEL_35;
        goto LABEL_29;
      }
LABEL_34:

LABEL_35:
      goto LABEL_36;
    }
    LOBYTE(v10) = 0;
  }
LABEL_36:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSAttributedString hash](self->_localizedAttributedSuggestion, "hash");
  return -[NSString hash](self->_localizedSuggestion, "hash") ^ v3;
}

- (NSString)debugDescription
{
  void *v3;
  NSAttributedString *localizedAttributedSuggestion;
  void *v5;
  UIImage *iconImage;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  localizedAttributedSuggestion = self->_localizedAttributedSuggestion;
  if (localizedAttributedSuggestion)
  {
    -[NSAttributedString string](localizedAttributedSuggestion, "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" '%@'"), v5);

  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR(" '%@'"), self->_localizedSuggestion);
  }
  if (self->_localizedAttributedSuggestion)
    objc_msgSend(v3, "appendFormat:", CFSTR(" attributedSuggestion=%p"), self->_localizedAttributedSuggestion);
  if (self->_localizedDescription)
    objc_msgSend(v3, "appendFormat:", CFSTR(" description='%@'"), self->_localizedDescription);
  iconImage = self->_iconImage;
  if (iconImage)
  {
    _UIImageName(self->_iconImage);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      _UIImageName(self->_iconImage);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR(" '%@'"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR(" image=%p%@"), iconImage, v10);

    }
    else
    {
      objc_msgSend(v3, "appendFormat:", CFSTR(" image=%p%@"), iconImage, &stru_1E16EDF20);
    }

  }
  if (self->_representedObject)
    objc_msgSend(v3, "appendFormat:", CFSTR(" representedObject=%p"), self->_representedObject);
  return (NSString *)v3;
}

- (NSAttributedString)localizedAttributedSuggestion
{
  return self->_localizedAttributedSuggestion;
}

- (NSString)localizedSuggestion
{
  return self->_localizedSuggestion;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (id)representedObject
{
  return self->_representedObject;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_representedObject, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedSuggestion, 0);
  objc_storeStrong((id *)&self->_localizedAttributedSuggestion, 0);
}

@end
