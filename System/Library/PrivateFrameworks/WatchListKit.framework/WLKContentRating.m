@implementation WLKContentRating

- (WLKContentRating)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("WLKContentRatingException"), CFSTR("-init not supported"));

  return 0;
}

- (WLKContentRating)initWithDictionary:(id)a3
{
  id v4;
  WLKContentRating *v5;
  uint64_t v6;
  NSString *contentRatingSystem;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *displayName;
  void *v12;
  uint64_t v13;
  NSString *name;
  void *v15;
  uint64_t v16;
  WLKContentRating *v17;
  objc_super v19;

  v4 = a3;
  if (v4)
  {
    v19.receiver = self;
    v19.super_class = (Class)WLKContentRating;
    v5 = -[WLKContentRating init](&v19, sel_init);
    if (!v5)
    {
LABEL_11:
      self = v5;
      v17 = self;
      goto LABEL_12;
    }
    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("system"));
    v6 = objc_claimAutoreleasedReturnValue();
    contentRatingSystem = v5->_contentRatingSystem;
    v5->_contentRatingSystem = (NSString *)v6;

    objc_msgSend(v4, "wlk_numberForKey:", CFSTR("value"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_ratingValue = objc_msgSend(v8, "unsignedIntegerValue");

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("displayName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v10;

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("name"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v13;

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("systemType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("movies")))
    {
      v16 = 1;
    }
    else
    {
      if (!objc_msgSend(v15, "isEqualToString:", CFSTR("tv")))
      {
        v5->_systemType = 0;
        goto LABEL_10;
      }
      v16 = 2;
    }
    v5->_systemType = v16;
LABEL_10:

    goto LABEL_11;
  }
  v17 = 0;
LABEL_12:

  return v17;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (unint64_t)ratingValue
{
  return self->_ratingValue;
}

- (NSString)contentRatingSystem
{
  return self->_contentRatingSystem;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)systemType
{
  return self->_systemType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_contentRatingSystem, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
