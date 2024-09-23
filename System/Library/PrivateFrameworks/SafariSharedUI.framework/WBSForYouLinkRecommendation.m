@implementation WBSForYouLinkRecommendation

- (WBSForYouLinkRecommendation)initWithTitle:(id)a3 url:(id)a4 lastSeenDate:(id)a5 source:(unint64_t)a6 topicSource:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  WBSForYouLinkRecommendation *v15;
  uint64_t v16;
  NSString *title;
  uint64_t v18;
  NSUUID *uniqueIdentifier;
  uint64_t v20;
  NSMutableSet *originalQueries;
  WBSForYouLinkRecommendation *v22;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v24.receiver = self;
  v24.super_class = (Class)WBSForYouLinkRecommendation;
  v15 = -[WBSForYouLinkRecommendation init](&v24, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    title = v15->_title;
    v15->_title = (NSString *)v16;

    objc_storeStrong((id *)&v15->_pageURL, a4);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v18 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v15->_uniqueIdentifier;
    v15->_uniqueIdentifier = (NSUUID *)v18;

    objc_storeStrong((id *)&v15->_lastSeenDate, a5);
    v15->_source = a6;
    v15->_topicSource = a7;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v20 = objc_claimAutoreleasedReturnValue();
    originalQueries = v15->_originalQueries;
    v15->_originalQueries = (NSMutableSet *)v20;

    v22 = v15;
  }

  return v15;
}

- (NSString)simplifiedURLString
{
  NSString *simplifiedURLString;
  NSString *v4;
  NSString *v5;

  simplifiedURLString = self->_simplifiedURLString;
  if (!simplifiedURLString)
  {
    -[NSURL safari_simplifiedURLStringForDeduping](self->_pageURL, "safari_simplifiedURLStringForDeduping");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_simplifiedURLString;
    self->_simplifiedURLString = v4;

    simplifiedURLString = self->_simplifiedURLString;
  }
  return simplifiedURLString;
}

- (BOOL)prefersLeadImage
{
  unint64_t v2;

  v2 = -[WBSForYouLinkRecommendation source](self, "source");
  return v2 == 2 || (v2 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (UIImage)appIcon
{
  UIImage *appIcon;
  void *v4;
  void *v5;
  void *v6;
  UIImage *v7;
  UIImage *v8;

  appIcon = self->_appIcon;
  if (!appIcon)
  {
    -[WBSForYouLinkRecommendation badgeBundleIdentifier](self, "badgeBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      v5 = (void *)MEMORY[0x1E0CEA638];
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "scale");
      objc_msgSend(v5, "_applicationIconImageForBundleIdentifier:format:scale:", v4, 5);
      v7 = (UIImage *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
    v8 = self->_appIcon;
    self->_appIcon = v7;

    appIcon = self->_appIcon;
  }
  return appIcon;
}

- (UIImage)sourceIcon
{
  UIImage *contactImage;
  void *v4;
  const __CFString *v5;

  contactImage = self->_contactImage;
  if (contactImage)
    return contactImage;
  switch(self->_source)
  {
    case 0uLL:
      v4 = (void *)MEMORY[0x1E0CEA638];
      v5 = CFSTR("book");
      goto LABEL_9;
    case 1uLL:
      v4 = (void *)MEMORY[0x1E0CEA638];
      v5 = CFSTR("eyeglasses");
      goto LABEL_9;
    case 2uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      v4 = (void *)MEMORY[0x1E0CEA638];
      v5 = CFSTR("clock");
      goto LABEL_9;
    case 3uLL:
      +[WBSImageUtilities handoffIconForDeviceType:](WBSImageUtilities, "handoffIconForDeviceType:", self->_secondarySourceIdentifier);
      self = (WBSForYouLinkRecommendation *)objc_claimAutoreleasedReturnValue();
      return (UIImage *)self;
    case 4uLL:
      v4 = (void *)MEMORY[0x1E0CEA638];
      v5 = CFSTR("icloud");
LABEL_9:
      objc_msgSend(v4, "systemImageNamed:", v5);
      self = (WBSForYouLinkRecommendation *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return (UIImage *)self;
  }
  return (UIImage *)self;
}

- (NSString)badgeBundleIdentifier
{
  unsigned int (**v2)(_QWORD, _QWORD);
  const __CFString *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__WBSForYouLinkRecommendation_badgeBundleIdentifier__block_invoke;
  v5[3] = &unk_1E54438A0;
  v5[4] = self;
  v2 = (unsigned int (**)(_QWORD, _QWORD))MEMORY[0x1A85D45E4](v5, a2);
  if ((((uint64_t (*)(_QWORD, const __CFString *))v2[2])(v2, CFSTR("apple.news")) & 1) != 0)
  {
    v3 = CFSTR("com.apple.news");
  }
  else if (((unsigned int (**)(_QWORD, const __CFString *))v2)[2](v2, CFSTR("maps.apple.com")))
  {
    v3 = CFSTR("com.apple.Maps");
  }
  else
  {
    v3 = 0;
  }

  return &v3->isa;
}

uint64_t __52__WBSForYouLinkRecommendation_badgeBundleIdentifier__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v3 = a2;
  objc_msgSend(v2, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_stringByRemovingWwwDotPrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v3);

  return v7;
}

- (NSSet)originalQueries
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_originalQueries, "copy");
}

- (NSString)originalQueriesString
{
  void *v2;
  void *v3;

  -[NSMutableSet allObjects](self->_originalQueries, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)addOriginalQueries:(id)a3
{
  -[NSMutableSet unionSet:](self->_originalQueries, "unionSet:", a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)footnote
{
  return self->_footnote;
}

- (void)setFootnote:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)pageURL
{
  return self->_pageURL;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_imageURL, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (UIImage)contactImage
{
  return self->_contactImage;
}

- (void)setContactImage:(id)a3
{
  objc_storeStrong((id *)&self->_contactImage, a3);
}

- (NSDate)lastSeenDate
{
  return self->_lastSeenDate;
}

- (id)sourceID
{
  return self->_sourceID;
}

- (void)setSourceID:(id)a3
{
  objc_storeStrong(&self->_sourceID, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)secondarySourceIdentifier
{
  return self->_secondarySourceIdentifier;
}

- (void)setSecondarySourceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (unint64_t)source
{
  return self->_source;
}

- (unint64_t)topicSource
{
  return self->_topicSource;
}

- (void)setTopicSource:(unint64_t)a3
{
  self->_topicSource = a3;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSNumber)cachedScore
{
  return self->_cachedScore;
}

- (void)setCachedScore:(id)a3
{
  objc_storeStrong((id *)&self->_cachedScore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedScore, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_secondarySourceIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong(&self->_sourceID, 0);
  objc_storeStrong((id *)&self->_lastSeenDate, 0);
  objc_storeStrong((id *)&self->_contactImage, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_pageURL, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_simplifiedURLString, 0);
  objc_storeStrong((id *)&self->_appIcon, 0);
  objc_storeStrong((id *)&self->_originalQueries, 0);
}

@end
