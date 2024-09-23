@implementation WLKBasicContentMetadata

+ (unint64_t)contentTypeForString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqual:", CFSTR("Movie")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("Show")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("Season")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("Episode")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqual:", CFSTR("SportingEvent")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (Class)_classForContentType:(unint64_t)a3
{
  if (a3 - 1 > 4)
    return (Class)0;
  else
    return (Class)(id)objc_opt_class();
}

- (WLKBasicContentMetadata)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  WLKBasicContentMetadata *v10;
  WLKBasicContentMetadata *v11;
  uint64_t v12;
  NSString *contentTypeString;
  void *v14;
  uint64_t v15;
  NSString *canonicalID;
  void *v17;
  uint64_t v18;
  NSString *title;
  void *v20;
  uint64_t v21;
  NSString *shortTitle;
  void *v23;
  uint64_t v24;
  NSString *descriptiveText;
  uint64_t v26;
  WLKArtworkVariantListing *images;
  uint64_t v28;
  NSNumber *commonSenseRecommendedAge;
  uint64_t v30;
  NSArray *categories;
  void *v32;
  void *v33;
  uint64_t v34;
  NSArray *genres;
  void *v36;
  uint64_t v37;
  NSURL *tvAppDeeplinkURL;
  WLKVideo *v39;
  void *v40;
  uint64_t v41;
  WLKVideo *backgroundVideo;
  void *v43;
  void *v44;
  uint64_t v45;
  NSArray *trailers;
  uint64_t v47;
  NSDictionary *rolesSummary;
  void *v49;
  WLKContentRating *v50;
  WLKContentRating *contentRating;
  WLKBasicContentMetadata *v52;
  WLKBasicContentMetadata *v53;
  objc_super v55;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend((id)objc_opt_class(), "contentTypeForString:", v6);
    v8 = objc_msgSend((id)objc_opt_class(), "_classForContentType:", v7);
    if (v8 && (v9 = (objc_class *)v8, (objc_opt_isKindOfClass() & 1) == 0))
    {
      v52 = (WLKBasicContentMetadata *)objc_msgSend([v9 alloc], "initWithDictionary:", v5);
    }
    else
    {
      v55.receiver = self;
      v55.super_class = (Class)WLKBasicContentMetadata;
      v10 = -[WLKBasicContentMetadata init](&v55, sel_init);
      v11 = v10;
      if (v10)
      {
        v10->_contentType = v7;
        v12 = objc_msgSend(v6, "copy");
        contentTypeString = v11->_contentTypeString;
        v11->_contentTypeString = (NSString *)v12;

        objc_msgSend(v5, "wlk_stringForKey:", CFSTR("id"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "copy");
        canonicalID = v11->_canonicalID;
        v11->_canonicalID = (NSString *)v15;

        objc_msgSend(v5, "wlk_stringForKey:", CFSTR("title"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "copy");
        title = v11->_title;
        v11->_title = (NSString *)v18;

        objc_msgSend(v5, "wlk_stringForKey:", CFSTR("shortTitle"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "copy");
        shortTitle = v11->_shortTitle;
        v11->_shortTitle = (NSString *)v21;

        objc_msgSend(v5, "wlk_stringForKey:", CFSTR("description"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "copy");
        descriptiveText = v11->_descriptiveText;
        v11->_descriptiveText = (NSString *)v24;

        objc_msgSend(v5, "wlk_artworkVariantListingForKey:", CFSTR("images"));
        v26 = objc_claimAutoreleasedReturnValue();
        images = v11->_images;
        v11->_images = (WLKArtworkVariantListing *)v26;

        objc_msgSend(v5, "wlk_numberForKey:", CFSTR("commonSenseRecommendedAge"));
        v28 = objc_claimAutoreleasedReturnValue();
        commonSenseRecommendedAge = v11->_commonSenseRecommendedAge;
        v11->_commonSenseRecommendedAge = (NSNumber *)v28;

        objc_msgSend(v5, "wlk_arrayForKey:", CFSTR("categories"));
        v30 = objc_claimAutoreleasedReturnValue();
        categories = v11->_categories;
        v11->_categories = (NSArray *)v30;

        v11->_isEvod = objc_msgSend(v5, "wlk_BOOLForKey:defaultValue:", CFSTR("isEVOD"), 0);
        v11->_appleOriginal = objc_msgSend(v5, "wlk_BOOLForKey:defaultValue:", CFSTR("isAppleOriginal"), 0);
        objc_msgSend(v5, "wlk_arrayForKey:", CFSTR("genres"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        +[WLKGenre genresWithDictionaries:](WLKGenre, "genresWithDictionaries:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "copy");
        genres = v11->_genres;
        v11->_genres = (NSArray *)v34;

        objc_msgSend(v5, "wlk_stringForKey:", CFSTR("shareUrl"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36
          || (objc_msgSend(v5, "wlk_stringForKey:", CFSTR("url")),
              (v36 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v36);
          v37 = objc_claimAutoreleasedReturnValue();
          tvAppDeeplinkURL = v11->_tvAppDeeplinkURL;
          v11->_tvAppDeeplinkURL = (NSURL *)v37;

        }
        v39 = [WLKVideo alloc];
        objc_msgSend(v5, "wlk_dictionaryForKey:", CFSTR("backgroundVideo"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = -[WLKVideo initWithDictionary:](v39, "initWithDictionary:", v40);
        backgroundVideo = v11->_backgroundVideo;
        v11->_backgroundVideo = (WLKVideo *)v41;

        objc_msgSend(v5, "wlk_arrayForKey:", CFSTR("trailers"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        +[WLKVideo videosWithDictionaries:](WLKVideo, "videosWithDictionaries:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "copy");
        trailers = v11->_trailers;
        v11->_trailers = (NSArray *)v45;

        objc_msgSend(v5, "wlk_dictionaryForKey:", CFSTR("rolesSummary"));
        v47 = objc_claimAutoreleasedReturnValue();
        rolesSummary = v11->_rolesSummary;
        v11->_rolesSummary = (NSDictionary *)v47;

        objc_msgSend(v5, "wlk_dictionaryForKey:", CFSTR("rating"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (v49)
        {
          v50 = -[WLKContentRating initWithDictionary:]([WLKContentRating alloc], "initWithDictionary:", v49);
          contentRating = v11->_contentRating;
          v11->_contentRating = v50;

        }
      }
      v52 = v11;
      self = v52;
    }
    v53 = v52;

  }
  else
  {
    v53 = 0;
  }

  return v53;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSString *title;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)WLKBasicContentMetadata;
  -[WLKBasicContentMetadata description](&v9, sel_description);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  title = self->_title;
  if (!title)
    title = self->_shortTitle;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ contentType:%@ canonical:%@ title:%@"), v4, self->_contentTypeString, self->_canonicalID, title);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (WLKBasicContentMetadata)init
{
  return -[WLKBasicContentMetadata initWithDictionary:](self, "initWithDictionary:", 0);
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (NSURL)tvAppDeeplinkURL
{
  return self->_tvAppDeeplinkURL;
}

- (BOOL)isEvod
{
  return self->_isEvod;
}

- (BOOL)isAppleOriginal
{
  return self->_appleOriginal;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)shortTitle
{
  return self->_shortTitle;
}

- (NSString)descriptiveText
{
  return self->_descriptiveText;
}

- (WLKArtworkVariantListing)images
{
  return self->_images;
}

- (NSNumber)commonSenseRecommendedAge
{
  return self->_commonSenseRecommendedAge;
}

- (NSArray)categories
{
  return self->_categories;
}

- (NSArray)genres
{
  return self->_genres;
}

- (WLKVideo)backgroundVideo
{
  return self->_backgroundVideo;
}

- (NSArray)trailers
{
  return self->_trailers;
}

- (NSDictionary)rolesSummary
{
  return self->_rolesSummary;
}

- (WLKContentRating)contentRating
{
  return self->_contentRating;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentRating, 0);
  objc_storeStrong((id *)&self->_rolesSummary, 0);
  objc_storeStrong((id *)&self->_trailers, 0);
  objc_storeStrong((id *)&self->_backgroundVideo, 0);
  objc_storeStrong((id *)&self->_genres, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_commonSenseRecommendedAge, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_descriptiveText, 0);
  objc_storeStrong((id *)&self->_shortTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_tvAppDeeplinkURL, 0);
  objc_storeStrong((id *)&self->_canonicalID, 0);
  objc_storeStrong((id *)&self->_contentTypeString, 0);
}

@end
