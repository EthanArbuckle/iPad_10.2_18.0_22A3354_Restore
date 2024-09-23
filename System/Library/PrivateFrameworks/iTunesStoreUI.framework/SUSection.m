@implementation SUSection

- (void)setSelectedImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (void)setImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (SUSection)initWithClientInterface:(id)a3 sectionType:(int64_t)a4 defaultPNGStyle:(int64_t)a5
{
  SUSection *v8;
  NSMutableDictionary *dictionary;
  const __CFString *v10;
  const __CFString *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SUSection;
  v8 = -[SUSection init](&v13, sel_init);
  if (!v8)
    return v8;
  v8->_clientInterface = (SUClientInterface *)a3;
  dictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v8->_dictionary = dictionary;
  if (a5)
  {
    if (a5 != 1)
      goto LABEL_7;
    -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", &unk_24DEDC608, CFSTR("background-gradient"));
    -[NSMutableDictionary setObject:forKey:](v8->_dictionary, "setObject:forKey:", CFSTR("dark"), CFSTR("default-png-style"));
    -[NSMutableDictionary setObject:forKey:](v8->_dictionary, "setObject:forKey:", CFSTR("white"), CFSTR("loading-indicator-color"));
    dictionary = v8->_dictionary;
    v10 = CFSTR("loading-text-color");
    v11 = CFSTR("white");
  }
  else
  {
    v11 = (const __CFString *)&unk_24DEDC630;
    v10 = CFSTR("background-gradient");
  }
  -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", v11, v10);
LABEL_7:
  if ((unint64_t)(a4 - 1) <= 5)
    -[NSMutableDictionary setObject:forKey:](v8->_dictionary, "setObject:forKey:", off_24DE7B590[a4 - 1], CFSTR("canonical-name"));
  return v8;
}

- (int64_t)defaultPNGStyle
{
  void *v2;

  v2 = (void *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("default-png-style"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(v2, "isEqualToString:", CFSTR("dark"));
  else
    return 0;
}

- (void)setSearchFieldConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (SUSection)initWithClientInterface:(id)a3
{
  SUSection *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUSection;
  v4 = -[SUSection init](&v6, sel_init);
  if (v4)
    v4->_clientInterface = (SUClientInterface *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUSection;
  -[SUSection dealloc](&v3, sel_dealloc);
}

- (id)description
{
  NSURL *v3;
  void *v4;
  id v5;
  NSString *v6;
  objc_super v8;

  v3 = -[SUSection urlBagKey](self, "urlBagKey");
  v4 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)SUSection;
  v5 = -[SUSection description](&v8, sel_description);
  v6 = -[SUSection identifier](self, "identifier");
  if (!v3)
    v3 = -[SUSection url](self, "url");
  return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("%@: %@: %@"), v5, v6, v3);
}

- (SUGradient)backgroundGradient
{
  uint64_t v2;
  SUGradient *v3;

  v2 = -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("background-gradient"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = -[SUGradient initWithPropertyList:]([SUGradient alloc], "initWithPropertyList:", v2);
  else
    v3 = 0;
  return v3;
}

- (NSString)identifier
{
  return (NSString *)-[SUSection valueForProperty:](self, "valueForProperty:", CFSTR("canonical-name"));
}

- (UIImage)image
{
  UIImage *image;
  id v3;
  BOOL v4;

  image = self->_image;
  v3 = -[SUSection _imageBaseName](self, "_imageBaseName");
  if (image)
    v4 = 1;
  else
    v4 = v3 == 0;
  if (v4)
    return image;
  else
    return (UIImage *)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.png"), v3));
}

- (id)imageForSectionButtonWithTag:(int64_t)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", a3);
  v5 = (id)-[NSMutableDictionary objectForKey:](self->_sectionButtonImages, "objectForKey:", v4);

  return v5;
}

- (BOOL)isDefaultSection
{
  void *v2;

  v2 = (void *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("active-tab"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "BOOLValue");
  else
    return 0;
}

- (BOOL)isTransient
{
  return -[SUSection partnerHeader](self, "partnerHeader") != 0;
}

- (BOOL)isUsingLocalArtwork
{
  return -[SUSection _imageBaseName](self, "_imageBaseName") != 0;
}

- (NSArray)itemImages
{
  void *v2;
  NSArray *v3;

  v2 = (void *)objc_msgSend(+[SUItemDataSource sharedDataSource](SUItemDataSource, "sharedDataSource"), "newItemWithItemDictionary:", self->_dictionary);
  v3 = (NSArray *)(id)objc_msgSend((id)objc_msgSend(v2, "itemImageCollection"), "itemImages");

  return v3;
}

- (NSArray)leftSectionButtons
{
  return (NSArray *)-[SUSection _sectionButtonsForKey:](self, "_sectionButtonsForKey:", CFSTR("left-navigation-items"));
}

- (BOOL)loadFromDictionary:(id)a3 searchField:(id)a4
{
  NSMutableDictionary *v7;
  uint64_t v8;
  SUSearchFieldConfiguration *v9;
  SUSearchFieldConfiguration *v10;
  BOOL v11;

  v7 = self->_dictionary;

  self->_dictionary = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
  if (-[SUSection identifier](self, "identifier")
    && (-[SUSection title](self, "title") || -[SUSection urlBagKey](self, "urlBagKey") || -[SUSection url](self, "url")))
  {
    v8 = objc_msgSend(a3, "objectForKey:", CFSTR("search-field"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (SUSearchFieldConfiguration *)objc_msgSend(a4, "copy");
      if (v9)
      {
        v10 = v9;
        -[SUSearchFieldConfiguration loadFromDictionary:](v9, "loadFromDictionary:", v8);
      }
      else
      {
        v10 = -[SUSearchFieldConfiguration initWithDictionary:clientInterface:]([SUSearchFieldConfiguration alloc], "initWithDictionary:clientInterface:", v8, self->_clientInterface);
      }
      -[SUSection setSearchFieldConfiguration:](self, "setSearchFieldConfiguration:", v10);

    }
    else
    {
      -[SUSection setSearchFieldConfiguration:](self, "setSearchFieldConfiguration:", a4);
    }
    v11 = 1;
  }
  else
  {

    v11 = 0;
    self->_dictionary = v7;
  }

  return v11;
}

- (UIColor)loadingIndicatorColor
{
  return (UIColor *)-[SUSection _colorForKey:](self, "_colorForKey:", CFSTR("loading-indicator-color"));
}

- (UIColor)loadingTextColor
{
  return (UIColor *)-[SUSection _colorForKey:](self, "_colorForKey:", CFSTR("loading-text-color"));
}

- (UIColor)loadingTextShadowColor
{
  return (UIColor *)-[SUSection _colorForKey:](self, "_colorForKey:", CFSTR("loading-text-shadow-color"));
}

- (int64_t)minimumNetworkType
{
  uint64_t v3;

  v3 = -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("allowed-connection-types"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[SUSection _minimumNetworkTypeFromDictionary:](self, "_minimumNetworkTypeFromDictionary:", v3);
  else
    return 0;
}

- (UIImage)moreListImage
{
  UIImage *moreListImage;
  id v3;
  BOOL v4;

  moreListImage = self->_moreListImage;
  v3 = -[SUSection _imageBaseName](self, "_imageBaseName");
  if (moreListImage)
    v4 = 1;
  else
    v4 = v3 == 0;
  if (v4)
    return moreListImage;
  else
    return (UIImage *)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MoreList%@.png"), v3));
}

- (SUPageSectionGroup)pageSectionGroup
{
  uint64_t v2;
  SUPageSectionGroup *v3;

  v2 = -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("tabs"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = -[SUPageSectionGroup initWithSectionsDictionary:]([SUPageSectionGroup alloc], "initWithSectionsDictionary:", v2);
  else
    v3 = 0;
  return v3;
}

- (NSString)partnerHeader
{
  return (NSString *)-[SUSection valueForProperty:](self, "valueForProperty:", CFSTR("partner-header"));
}

- (NSArray)rightSectionButtons
{
  return (NSArray *)-[SUSection _sectionButtonsForKey:](self, "_sectionButtonsForKey:", CFSTR("right-navigation-items"));
}

- (UIImage)selectedImage
{
  UIImage *selectedImage;
  id v3;
  BOOL v4;

  selectedImage = self->_selectedImage;
  v3 = -[SUSection _imageBaseName](self, "_imageBaseName");
  if (selectedImage)
    v4 = 1;
  else
    v4 = v3 == 0;
  if (v4)
    return selectedImage;
  else
    return (UIImage *)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@Selected.png"), v3));
}

- (UIImage)selectedMoreListImage
{
  UIImage *selectedMoreListImage;
  id v3;
  BOOL v4;

  selectedMoreListImage = self->_selectedMoreListImage;
  v3 = -[SUSection _imageBaseName](self, "_imageBaseName");
  if (selectedMoreListImage)
    v4 = 1;
  else
    v4 = v3 == 0;
  if (v4)
    return selectedMoreListImage;
  else
    return (UIImage *)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MoreList%@Selected.png"), v3));
}

- (void)setSectionButtonImage:(id)a3 forTag:(int64_t)a4
{
  uint64_t v6;
  NSMutableDictionary *sectionButtonImages;
  id v8;

  v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", a4);
  sectionButtonImages = self->_sectionButtonImages;
  v8 = (id)v6;
  if (a3)
  {
    if (!sectionButtonImages)
    {
      sectionButtonImages = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      self->_sectionButtonImages = sectionButtonImages;
    }
    -[NSMutableDictionary setObject:forKey:](sectionButtonImages, "setObject:forKey:", a3, v8);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](sectionButtonImages, "removeObjectForKey:");
  }

}

- (NSString)title
{
  NSString *v3;

  v3 = -[SUSection valueForProperty:](self, "valueForProperty:", CFSTR("title"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v3;
  else
    return (NSString *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "localizedStringForKey:value:table:", -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("_title")), &stru_24DE83F60, 0);
}

- (int64_t)type
{
  uint64_t v3;

  v3 = -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("canonical-name"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[SUSection _typeForString:](self, "_typeForString:", v3);
  else
    return 0;
}

- (NSURL)url
{
  uint64_t v2;

  v2 = -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("url"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSURL *)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v2);
  else
    return 0;
}

- (NSString)urlBagKey
{
  return (NSString *)-[SUSection valueForProperty:](self, "valueForProperty:", CFSTR("url-bag-key"));
}

- (id)valueForProperty:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", a3);
}

- (id)_colorForKey:(id)a3
{
  void *v3;
  CGColorRef v4;
  CGColor *v5;
  void *v6;

  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v4 = SUCreateColorFromStyleString(v3);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = (void *)objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:", v4);
  CGColorRelease(v5);
  return v6;
}

- (id)_imageBaseName
{
  return (id)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("_iconBase"));
}

- (int64_t)_minimumNetworkTypeFromDictionary:(id)a3
{
  int64_t v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1000;
  SSNetworkTypeApplyBlock();
  v3 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v3;
}

uint64_t __47__SUSection__minimumNetworkTypeFromDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  result = SSGetStringForNetworkType();
  if (result)
  {
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", result);
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
    {
      result = objc_msgSend(v5, "BOOLValue");
      if ((_DWORD)result)
      {
        v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v7 = *(_QWORD *)(v6 + 24);
        if (v7 >= a2)
          v7 = a2;
        *(_QWORD *)(v6 + 24) = v7;
      }
    }
  }
  return result;
}

- (id)_sectionButtonsForKey:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  SUSectionButton *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = -[SUSectionButton initWithSectionButtonDictionary:]([SUSectionButton alloc], "initWithSectionButtonDictionary:", v11);
            v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", -[SUSectionButton tag](v12, "tag"));
            -[SUSectionButton setImage:](v12, "setImage:", -[NSMutableDictionary objectForKey:](self->_sectionButtonImages, "objectForKey:", v13));
            objc_msgSend(v5, "addObject:", v12);

          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }
  }
  return v5;
}

- (int64_t)_typeForString:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("downloads")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("search")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("updates")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("podcasts")) & 1) != 0)
    return 4;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("iTunesU")) & 1) != 0)
    return 5;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("purchases")))
    return 6;
  return 0;
}

- (void)setMoreListImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (SUSearchFieldConfiguration)searchFieldConfiguration
{
  return self->_searchFieldConfiguration;
}

- (void)setSelectedMoreListImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

@end
