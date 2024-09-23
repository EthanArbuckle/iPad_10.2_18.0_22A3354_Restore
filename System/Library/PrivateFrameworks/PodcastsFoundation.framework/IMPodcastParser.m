@implementation IMPodcastParser

- (IMPodcastParser)init
{
  IMPodcastParser *v2;
  void *v3;
  NSDateFormatter *v4;
  NSDateFormatter *rssDateFormatter;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMPodcastParser;
  v2 = -[IMPodcastParser init](&v7, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en"));
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    rssDateFormatter = v2->_rssDateFormatter;
    v2->_rssDateFormatter = v4;

    -[NSDateFormatter setDateFormat:](v2->_rssDateFormatter, "setDateFormat:", CFSTR("EEE, dd MMM yyyy HH:mm:ss zzz"));
    -[NSDateFormatter setLocale:](v2->_rssDateFormatter, "setLocale:", v3);

  }
  return v2;
}

- (id)parseWithData:(id)a3
{
  id v4;
  IMPodcastFeed *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v4 = a3;
    -[IMPodcastParser setFeedType:](self, "setFeedType:", -1);
    v5 = objc_alloc_init(IMPodcastFeed);
    -[IMPodcastParser setParsedFeed:](self, "setParsedFeed:", v5);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B28]), "initWithData:", v4);
    objc_msgSend(v6, "setShouldResolveExternalEntities:", 0);
    objc_msgSend(v6, "setDelegate:", self);
    objc_msgSend(v6, "setShouldProcessNamespaces:", 1);
    objc_msgSend(v6, "parse");

  }
  NSPersistentStringForMTDisplayType(0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMPodcastParser parsedFeed](self, "parsedFeed");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDisplayType:", v7);

  return -[IMPodcastParser parsedFeed](self, "parsedFeed");
}

- (void)parseStreamFromURL:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  IMPodcastFeed *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  IMPodcastParser *v16;
  id v17;

  v6 = a4;
  v7 = a3;
  -[IMPodcastParser setFeedType:](self, "setFeedType:", -1);
  v8 = objc_alloc_init(IMPodcastFeed);
  -[IMPodcastParser setParsedFeed:](self, "setParsedFeed:", v8);

  +[IMXMLStreamOperation operationWithURL:parseDelegate:](IMXMLStreamOperation, "operationWithURL:parseDelegate:", v7, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __58__IMPodcastParser_parseStreamFromURL_withCompletionBlock___block_invoke;
  v15 = &unk_1E54D1148;
  v16 = self;
  v17 = v6;
  v10 = v6;
  objc_msgSend(v9, "setCompletionBlock:", &v12);
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue", v12, v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addOperation:", v9);

}

void __58__IMPodcastParser_parseStreamFromURL_withCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "parsedFeed");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (id)dateFromRSSDateString:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v9;
  id v10;
  _QWORD v11[2];

  v4 = a3;
  v11[0] = 0;
  v11[1] = objc_msgSend(v4, "length");
  -[IMPodcastParser rssDateFormatter](self, "rssDateFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = 0;
  objc_msgSend(v5, "getObjectValue:forString:range:error:", &v10, v4, v11, &v9);

  v6 = v10;
  v7 = v9;

  return v6;
}

- (id)removeLastColonOfString:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:options:", CFSTR(":"), 4);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL && v5 == 1)
  {
    v8 = v4;
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "substringToIndex:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "substringFromIndex:", v8 + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@%@"), v10, v11);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v3;
  }

  return v7;
}

- (id)dateFromAtomDateString:(id)a3
{
  id v3;
  const char *v4;
  void *v5;
  tm v7;

  -[IMPodcastParser removeLastColonOfString:](self, "removeLastColonOfString:", a3);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v3, "cStringUsingEncoding:", 4);

  if (v4)
  {
    memset(&v7, 0, sizeof(v7));
    v5 = strptime_l(v4, "%Y-%m-%dT%T%z", &v7, 0);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)mktime(&v7));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  IMPodcastParser *v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (-[IMPodcastParser feedType](self, "feedType"))
  {
    if (-[IMPodcastParser feedType](self, "feedType") == 1)
    {
      -[IMPodcastParser atomParser:didStartElement:namespaceURI:qualifiedName:attributes:](self, "atomParser:didStartElement:namespaceURI:qualifiedName:attributes:", v18, v12, v13, v14, v15);
    }
    else if (-[IMPodcastParser feedType](self, "feedType") == -1)
    {
      if (objc_msgSend(v12, "isEqualToString:", CFSTR("rss")))
      {
        v16 = self;
        v17 = 0;
      }
      else
      {
        if (!objc_msgSend(v12, "isEqualToString:", CFSTR("feed")))
          goto LABEL_11;
        v16 = self;
        v17 = 1;
      }
      -[IMPodcastParser setFeedType:](v16, "setFeedType:", v17);
    }
  }
  else
  {
    -[IMPodcastParser rssParser:didStartElement:namespaceURI:qualifiedName:attributes:](self, "rssParser:didStartElement:namespaceURI:qualifiedName:attributes:", v18, v12, v13, v14, v15);
  }
LABEL_11:

}

- (void)rssParser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v10;
  id v11;
  _BOOL4 v12;
  _BOOL4 v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  char v20;
  int v21;
  IMPodcastFeedItem *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v32 = a4;
  v10 = a5;
  v11 = a7;
  v12 = +[IMPodcastParser isITunesNamespace:](IMPodcastParser, "isITunesNamespace:", v10);
  v13 = +[IMPodcastParser isContentNamespace:](IMPodcastParser, "isContentNamespace:", v10);
  if (v10)
    v14 = objc_msgSend(v10, "isWhitespace");
  else
    v14 = 1;
  if (self->_inGlobalImageElement && objc_msgSend(v32, "isEqualToString:", CFSTR("url")))
    -[IMPodcastParser startBufferingElementChars](self, "startBufferingElementChars");
  if (-[IMPodcastParser itemElementNestCount](self, "itemElementNestCount"))
  {
    if (-[IMPodcastParser itemElementNestCount](self, "itemElementNestCount") != 1)
    {
LABEL_34:
      -[IMPodcastParser setItemElementNestCount:](self, "setItemElementNestCount:", -[IMPodcastParser itemElementNestCount](self, "itemElementNestCount") + 1);
      goto LABEL_51;
    }
    -[IMPodcastParser parsedFeed](self, "parsedFeed");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "items");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (rssParser_didStartElement_namespaceURI_qualifiedName_attributes__onceToken_globalElementsToCapture != -1)
      dispatch_once(&rssParser_didStartElement_namespaceURI_qualifiedName_attributes__onceToken_globalElementsToCapture, &__block_literal_global_577);
    v18 = v32;
    if (rssParser_didStartElement_namespaceURI_qualifiedName_attributes__onceToken_itunesElementsToCapture != -1)
    {
      dispatch_once(&rssParser_didStartElement_namespaceURI_qualifiedName_attributes__onceToken_itunesElementsToCapture, &__block_literal_global_579);
      v18 = v32;
    }
    if (rssParser_didStartElement_namespaceURI_qualifiedName_attributes__onceToken_contentElementsToCapture == -1)
    {
      if (v14)
        goto LABEL_15;
    }
    else
    {
      dispatch_once(&rssParser_didStartElement_namespaceURI_qualifiedName_attributes__onceToken_contentElementsToCapture, &__block_literal_global_580);
      v18 = v32;
      if (v14)
      {
LABEL_15:
        v19 = objc_msgSend((id)rssParser_didStartElement_namespaceURI_qualifiedName_attributes__globalElementsToCapture, "containsObject:", v18);
        v18 = v32;
        if ((v19 & 1) != 0)
          goto LABEL_20;
      }
    }
    if (!v12
      || (v20 = objc_msgSend((id)rssParser_didStartElement_namespaceURI_qualifiedName_attributes__itunesElementsToCapture, "containsObject:", v18), v18 = v32, (v20 & 1) == 0))
    {
      if (!v13
        || (v21 = objc_msgSend((id)rssParser_didStartElement_namespaceURI_qualifiedName_attributes__contentElementsToCapture, "containsObject:", v18), v18 = v32, !v21))
      {
        if (v12 && (v25 = objc_msgSend(v18, "isEqualToString:", CFSTR("category")), v18 = v32, v25))
        {
          if (!-[IMPodcastParser preferredItemCategoryFound](self, "preferredItemCategoryFound"))
          {
            objc_msgSend(v11, "valueForKey:", CFSTR("text"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "stringByTrimmingCharactersInSet:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setCategory:", v28);

          }
        }
        else if (objc_msgSend(v18, "isEqualToString:", CFSTR("enclosure")))
        {
          -[IMPodcastParser _parseEnclosureElement:forFeedItem:](self, "_parseEnclosureElement:forFeedItem:", v11, v17);
        }
        goto LABEL_33;
      }
    }
LABEL_20:
    -[IMPodcastParser startBufferingElementChars](self, "startBufferingElementChars");
LABEL_33:

    goto LABEL_34;
  }
  if (rssParser_didStartElement_namespaceURI_qualifiedName_attributes__onceToken_subelement_globalElementsToCapture != -1)
    dispatch_once(&rssParser_didStartElement_namespaceURI_qualifiedName_attributes__onceToken_subelement_globalElementsToCapture, &__block_literal_global_582);
  if (rssParser_didStartElement_namespaceURI_qualifiedName_attributes__onceToken_subelement_itunesElementsToCapture == -1)
  {
    if (!v14)
      goto LABEL_36;
  }
  else
  {
    dispatch_once(&rssParser_didStartElement_namespaceURI_qualifiedName_attributes__onceToken_subelement_itunesElementsToCapture, &__block_literal_global_583);
    if (!v14)
      goto LABEL_36;
  }
  if (objc_msgSend(v32, "isEqualToString:", CFSTR("item")))
  {
    -[IMPodcastParser setItemElementNestCount:](self, "setItemElementNestCount:", 1);
    -[IMPodcastParser setPreferredItemCategoryFound:](self, "setPreferredItemCategoryFound:", 0);
    v22 = objc_alloc_init(IMPodcastFeedItem);
    -[IMPodcastParser parsedFeed](self, "parsedFeed");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "items");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v22);

LABEL_43:
    goto LABEL_51;
  }
LABEL_36:
  if (v12)
  {
    if (objc_msgSend(v32, "isEqualToString:", CFSTR("category")))
    {
      if (-[IMPodcastParser preferredFeedCategoryFound](self, "preferredFeedCategoryFound"))
        goto LABEL_51;
      objc_msgSend(v11, "valueForKey:", CFSTR("text"));
      v22 = (IMPodcastFeedItem *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMPodcastFeedItem stringByTrimmingCharactersInSet:](v22, "stringByTrimmingCharactersInSet:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMPodcastParser parsedFeed](self, "parsedFeed");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setCategory:", v30);
      goto LABEL_42;
    }
    if (objc_msgSend(v32, "isEqualToString:", CFSTR("image")))
    {
      objc_msgSend(v11, "valueForKey:", CFSTR("href"));
      v22 = (IMPodcastFeedItem *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMPodcastFeedItem stringByTrimmingCharactersInSet:](v22, "stringByTrimmingCharactersInSet:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMPodcastParser parsedFeed](self, "parsedFeed");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setImageURL:", v30);
LABEL_42:

      goto LABEL_43;
    }
  }
  if (v14)
  {
    if (objc_msgSend(v32, "isEqualToString:", CFSTR("image")))
    {
      self->_inGlobalImageElement = 1;
      goto LABEL_51;
    }
    if ((objc_msgSend((id)rssParser_didStartElement_namespaceURI_qualifiedName_attributes__subelement_globalElementsToCapture, "containsObject:", v32) & 1) != 0)goto LABEL_50;
  }
  if (v12
    && objc_msgSend((id)rssParser_didStartElement_namespaceURI_qualifiedName_attributes__subelement_itunesElementsToCapture, "containsObject:", v32))
  {
LABEL_50:
    -[IMPodcastParser startBufferingElementChars](self, "startBufferingElementChars");
  }
LABEL_51:

}

void __83__IMPodcastParser_rssParser_didStartElement_namespaceURI_qualifiedName_attributes___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("title");
  v2[1] = CFSTR("pubDate");
  v2[2] = CFSTR("link");
  v2[3] = CFSTR("description");
  v2[4] = CFSTR("guid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)rssParser_didStartElement_namespaceURI_qualifiedName_attributes__globalElementsToCapture;
  rssParser_didStartElement_namespaceURI_qualifiedName_attributes__globalElementsToCapture = v0;

}

void __83__IMPodcastParser_rssParser_didStartElement_namespaceURI_qualifiedName_attributes___block_invoke_2()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[11];

  v2[10] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("duration");
  v2[1] = CFSTR("author");
  v2[2] = CFSTR("order");
  v2[3] = CFSTR("explicit");
  v2[4] = CFSTR("summary");
  v2[5] = CFSTR("title");
  v2[6] = CFSTR("subtitle");
  v2[7] = CFSTR("season");
  v2[8] = CFSTR("episode");
  v2[9] = CFSTR("episodeType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)rssParser_didStartElement_namespaceURI_qualifiedName_attributes__itunesElementsToCapture;
  rssParser_didStartElement_namespaceURI_qualifiedName_attributes__itunesElementsToCapture = v0;

}

void __83__IMPodcastParser_rssParser_didStartElement_namespaceURI_qualifiedName_attributes___block_invoke_3()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("encoded");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)rssParser_didStartElement_namespaceURI_qualifiedName_attributes__contentElementsToCapture;
  rssParser_didStartElement_namespaceURI_qualifiedName_attributes__contentElementsToCapture = v0;

}

void __83__IMPodcastParser_rssParser_didStartElement_namespaceURI_qualifiedName_attributes___block_invoke_4()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];

  v2[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("description");
  v2[1] = CFSTR("title");
  v2[2] = CFSTR("link");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)rssParser_didStartElement_namespaceURI_qualifiedName_attributes__subelement_globalElementsToCapture;
  rssParser_didStartElement_namespaceURI_qualifiedName_attributes__subelement_globalElementsToCapture = v0;

}

void __83__IMPodcastParser_rssParser_didStartElement_namespaceURI_qualifiedName_attributes___block_invoke_5()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];

  v2[6] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("summary");
  v2[1] = CFSTR("new-feed-url");
  v2[2] = CFSTR("author");
  v2[3] = CFSTR("provider");
  v2[4] = CFSTR("explicit");
  v2[5] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)rssParser_didStartElement_namespaceURI_qualifiedName_attributes__subelement_itunesElementsToCapture;
  rssParser_didStartElement_namespaceURI_qualifiedName_attributes__subelement_itunesElementsToCapture = v0;

}

- (void)_parseEnclosureElement:(id)a3 forFeedItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;

  v35 = a3;
  v5 = a4;
  objc_msgSend(v35, "valueForKey:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "valueForKey:", CFSTR("url"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_msgSend(v11, "rangeOfString:", CFSTR("?"));
    v14 = v13;
    v15 = v11;
    v16 = v15;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = 0;
    }
    else
    {
      objc_msgSend(v15, "substringFromIndex:", v12 + v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "substringToIndex:", v12);
      v18 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v18;
    }
    objc_msgSend(MEMORY[0x1E0CB3780], "URLAllowedCharacterSet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "mutableCopy");

    objc_msgSend(v20, "addCharactersInString:", CFSTR("%"));
    objc_msgSend(v16, "stringByAddingPercentEncodingWithAllowedCharacters:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      v23 = v21;

      v16 = v23;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      objc_msgSend(v24, "scheme");
      v26 = objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v27 = (void *)v26;
        objc_msgSend(v25, "host");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          objc_msgSend(v35, "valueForKey:", CFSTR("length"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v34, "longLongValue");
          v33 = v29 & ~(v29 >> 63);
          objc_msgSend(v16, "pathExtension");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          +[IMUTITypes UTIByExtension:](IMUTITypes, "UTIByExtension:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
          {
            objc_msgSend(v5, "setUti:", v31);
          }
          else
          {
            +[IMUTITypes UTIFromMIMEType:](IMUTITypes, "UTIFromMIMEType:", v8);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setUti:", v32);

          }
          objc_msgSend(v5, "setEnclosureURL:", v16);
          objc_msgSend(v5, "setEnclosureParameterString:", v17);
          objc_msgSend(v5, "setByteSize:", v33);

        }
      }
    }

  }
}

- (void)atomParser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v10;
  id v11;
  _BOOL4 v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  IMPodcastFeedItem *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;

  v37 = a4;
  v10 = a5;
  v11 = a7;
  v12 = +[IMPodcastParser isITunesNamespace:](IMPodcastParser, "isITunesNamespace:", v10);
  if (!v10)
  {
    if (!-[IMPodcastParser itemElementNestCount](self, "itemElementNestCount"))
      goto LABEL_18;
    v13 = 1;
LABEL_8:
    if (-[IMPodcastParser itemElementNestCount](self, "itemElementNestCount") == 1)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("title"), CFSTR("published"), CFSTR("id"), CFSTR("summary"), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v13 && (objc_msgSend(v15, "containsObject:", v37) & 1) != 0
        || v12 && objc_msgSend(v37, "isEqualToString:", CFSTR("author")))
      {
        -[IMPodcastParser startBufferingElementChars](self, "startBufferingElementChars");
      }
      else if (v13)
      {
        if (objc_msgSend(v37, "isEqualToString:", CFSTR("author")))
        {
          -[IMPodcastParser setInAuthorElement:](self, "setInAuthorElement:", 1);
        }
        else if (objc_msgSend(v37, "isEqualToString:", CFSTR("link")))
        {
          objc_msgSend(v11, "valueForKey:", CFSTR("href"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringByTrimmingCharactersInSet:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "valueForKey:", CFSTR("rel"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringByTrimmingCharactersInSet:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "valueForKey:", CFSTR("length"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "longLongValue");
          if (objc_msgSend(v25, "isEqualToString:", CFSTR("enclosure"))
            && v22
            && (objc_msgSend(v22, "isWhitespace") & 1) == 0)
          {
            v36 = v27;
            -[IMPodcastParser parsedFeed](self, "parsedFeed");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "items");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "lastObject");
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            v31 = v30;
            objc_msgSend(v30, "enclosureURL");
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v32)
            {
              objc_msgSend(v30, "enclosureURL");
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              if (v33)
              {
                objc_msgSend(v30, "setByteSize:", 0);
                objc_msgSend(v30, "setUti:", 0);
              }
              objc_msgSend(v30, "setEnclosureURL:", v22);
              objc_msgSend(v30, "setByteSize:", v36 & ~(v36 >> 63));
              objc_msgSend(v22, "pathExtension");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              +[IMUTITypes UTIByExtension:](IMUTITypes, "UTIByExtension:", v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "setUti:", v35);

            }
          }

        }
      }

    }
    else if (-[IMPodcastParser itemElementNestCount](self, "itemElementNestCount") == 2
           && (-[IMPodcastParser inAuthorElement](self, "inAuthorElement") & v13) == 1
           && objc_msgSend(v37, "isEqualToString:", CFSTR("name")))
    {
      -[IMPodcastParser startBufferingElementChars](self, "startBufferingElementChars");
    }
    -[IMPodcastParser setItemElementNestCount:](self, "setItemElementNestCount:", -[IMPodcastParser itemElementNestCount](self, "itemElementNestCount") + 1);
    goto LABEL_41;
  }
  v13 = objc_msgSend(v10, "isWhitespace");
  if (-[IMPodcastParser itemElementNestCount](self, "itemElementNestCount"))
    goto LABEL_8;
  if (!v13)
  {
    v14 = 0;
    if (!v12)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_18:
  if (objc_msgSend(v37, "isEqualToString:", CFSTR("entry")))
  {
    -[IMPodcastParser setItemElementNestCount:](self, "setItemElementNestCount:", 1);
    -[IMPodcastParser setPreferredItemCategoryFound:](self, "setPreferredItemCategoryFound:", 0);
    v17 = objc_alloc_init(IMPodcastFeedItem);
    -[IMPodcastParser parsedFeed](self, "parsedFeed");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "items");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v17);

    goto LABEL_41;
  }
  if ((objc_msgSend(v37, "isEqualToString:", CFSTR("title")) & 1) != 0)
    goto LABEL_28;
  v14 = 1;
  if (v12)
  {
LABEL_25:
    if (!objc_msgSend(v37, "isEqualToString:", CFSTR("summary")))
      goto LABEL_26;
LABEL_28:
    -[IMPodcastParser startBufferingElementChars](self, "startBufferingElementChars");
    goto LABEL_41;
  }
LABEL_26:
  if (v14 && objc_msgSend(v37, "isEqualToString:", CFSTR("logo")))
    goto LABEL_28;
LABEL_41:

}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v13 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (-[IMPodcastParser feedType](self, "feedType"))
  {
    if (-[IMPodcastParser feedType](self, "feedType") == 1)
      -[IMPodcastParser atomParser:didEndElement:namespaceURI:qualifiedName:](self, "atomParser:didEndElement:namespaceURI:qualifiedName:", v13, v10, v11, v12);
  }
  else
  {
    -[IMPodcastParser rssParser:didEndElement:namespaceURI:qualifiedName:](self, "rssParser:didEndElement:namespaceURI:qualifiedName:", v13, v10, v11, v12);
  }

}

- (void)rssParser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v8;
  _BOOL4 v9;
  _BOOL4 v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  int v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  id v65;

  v65 = a4;
  v8 = a5;
  v9 = +[IMPodcastParser isITunesNamespace:](IMPodcastParser, "isITunesNamespace:", v8);
  v10 = +[IMPodcastParser isContentNamespace:](IMPodcastParser, "isContentNamespace:", v8);
  if (v8)
    v11 = objc_msgSend(v8, "isWhitespace");
  else
    v11 = 1;
  if (self->_inGlobalImageElement && objc_msgSend(v65, "isEqualToString:", CFSTR("url")))
  {
    -[IMPodcastParser elementCharBufferTrimmed](self, "elementCharBufferTrimmed");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMPodcastParser parsedFeed](self, "parsedFeed");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setGlobalImageURL:", v12);

    -[IMPodcastParser endBufferingElementChars](self, "endBufferingElementChars");
  }
  if (-[IMPodcastParser itemElementNestCount](self, "itemElementNestCount"))
  {
    -[IMPodcastParser parsedFeed](self, "parsedFeed");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "items");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[IMPodcastParser itemElementNestCount](self, "itemElementNestCount") != 2)
    {
      if (v11)
      {
        v20 = objc_msgSend(v65, "isEqualToString:", CFSTR("item"));
        if (-[IMPodcastParser itemElementNestCount](self, "itemElementNestCount") == v20)
        {
          -[IMPodcastParser setItemElementNestCount:](self, "setItemElementNestCount:", 0);
          -[IMPodcastParser postProcessItemElement:](self, "postProcessItemElement:", v16);
        }
      }
      goto LABEL_75;
    }
    v17 = v65;
    if (v11)
    {
      if (objc_msgSend(v65, "isEqualToString:", CFSTR("title")))
      {
        -[IMPodcastParser elementCharBufferTrimmed](self, "elementCharBufferTrimmed");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setTitle:", v18);
        goto LABEL_74;
      }
      v26 = objc_msgSend(v65, "isEqualToString:", CFSTR("guid"));
      v17 = v65;
      if (v26)
      {
        -[IMPodcastParser elementCharBufferTrimmed](self, "elementCharBufferTrimmed");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setGuid:", v18);
        goto LABEL_74;
      }
    }
    if (v9)
    {
      if (objc_msgSend(v17, "isEqualToString:", CFSTR("duration")))
      {
        -[IMPodcastParser elementCharBuffer](self, "elementCharBuffer");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsSeparatedByString:", CFSTR(":"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v18, "count") && (unint64_t)objc_msgSend(v18, "count") <= 3)
        {
          v28 = (void *)MEMORY[0x1E0CB3940];
          -[IMPodcastParser elementCharBuffer](self, "elementCharBuffer");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "durationWithHMSString:", v29);
          objc_msgSend(v16, "setDuration:");

        }
        goto LABEL_74;
      }
      v30 = objc_msgSend(v65, "isEqualToString:", CFSTR("author"));
      v17 = v65;
      if (v30)
      {
        -[IMPodcastParser elementCharBufferTrimmed](self, "elementCharBufferTrimmed");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setAuthor:", v18);
        goto LABEL_74;
      }
    }
    if (v11)
    {
      if (objc_msgSend(v17, "isEqualToString:", CFSTR("pubDate")))
      {
        -[IMPodcastParser elementCharBuffer](self, "elementCharBuffer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMPodcastParser dateFromRSSDateString:](self, "dateFromRSSDateString:", v18);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setPubDate:", v31);

        goto LABEL_74;
      }
      v41 = objc_msgSend(v65, "isEqualToString:", CFSTR("link"));
      v17 = v65;
      if (v41)
      {
        -[IMPodcastParser elementCharBufferTrimmed](self, "elementCharBufferTrimmed");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setWebpageURL:", v18);
        goto LABEL_74;
      }
    }
    if (v9)
    {
      if (objc_msgSend(v17, "isEqualToString:", CFSTR("category")))
      {
        objc_msgSend(v16, "category");
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
          -[IMPodcastParser setPreferredItemCategoryFound:](self, "setPreferredItemCategoryFound:", 1);
        goto LABEL_75;
      }
      if (objc_msgSend(v65, "isEqualToString:", CFSTR("summary")))
      {
        -[IMPodcastParser elementCharBufferTrimmed](self, "elementCharBufferTrimmed");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v18, "length"))
          goto LABEL_74;
        objc_msgSend(v16, "setItemSummary:", v18);
        v45 = CFSTR("summary");
LABEL_69:
        objc_msgSend(v16, "setItemSummarySourceElement:", v45);
        goto LABEL_74;
      }
      v46 = objc_msgSend(v65, "isEqualToString:", CFSTR("subtitle"));
      v17 = v65;
      if (v46)
      {
        objc_msgSend(v16, "itemSummary");
        v47 = objc_claimAutoreleasedReturnValue();
        if (!v47
          || (v48 = (void *)v47,
              objc_msgSend(v16, "itemSummarySourceElement"),
              v49 = (void *)objc_claimAutoreleasedReturnValue(),
              v50 = objc_msgSend(v49, "isEqualToString:", CFSTR("description")),
              v49,
              v48,
              v17 = v65,
              v50))
        {
          -[IMPodcastParser elementCharBufferTrimmed](self, "elementCharBufferTrimmed");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v18, "length"))
            goto LABEL_74;
          objc_msgSend(v16, "setItemSummary:", v18);
          v45 = CFSTR("subtitle");
          goto LABEL_69;
        }
      }
    }
    if (v10 && objc_msgSend(v17, "isEqualToString:", CFSTR("encoded")))
    {
      -[IMPodcastParser elementCharBufferTrimmed](self, "elementCharBufferTrimmed");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "length"))
      {
        objc_msgSend(v16, "setItemDescription:", v18);
        objc_msgSend(v16, "setItemDescriptionSourceElement:", CFSTR("encoded"));
      }
    }
    else
    {
      if (v11 && objc_msgSend(v65, "isEqualToString:", CFSTR("description")))
      {
        objc_msgSend(v16, "itemDescription");
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v51)
        {
          -[IMPodcastParser elementCharBufferTrimmed](self, "elementCharBufferTrimmed");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setItemDescription:", v52);

          objc_msgSend(v16, "setItemDescriptionSourceElement:", CFSTR("description"));
        }
        objc_msgSend(v16, "itemSummary");
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v53)
        {
          -[IMPodcastParser elementCharBufferTrimmed](self, "elementCharBufferTrimmed");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setItemSummary:", v54);

          objc_msgSend(v16, "setItemSummarySourceElement:", CFSTR("description"));
        }
        goto LABEL_75;
      }
      if (!v9)
      {
LABEL_75:
        if (-[IMPodcastParser itemElementNestCount](self, "itemElementNestCount"))
          -[IMPodcastParser setItemElementNestCount:](self, "setItemElementNestCount:", -[IMPodcastParser itemElementNestCount](self, "itemElementNestCount") - 1);
        goto LABEL_97;
      }
      if (objc_msgSend(v65, "isEqualToString:", CFSTR("order")))
      {
        -[IMPodcastParser elementCharBuffer](self, "elementCharBuffer");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v55, "intValue");

        if ((v56 - 1) <= 0x7FFE)
          objc_msgSend(v16, "setTrackNum:", v56);
        goto LABEL_75;
      }
      if (objc_msgSend(v65, "isEqualToString:", CFSTR("explicit")))
      {
        -[IMPodcastParser elementCharBufferTrimmed](self, "elementCharBufferTrimmed");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "lowercaseString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v18, "isEqualToString:", CFSTR("yes")))
          objc_msgSend(v16, "setIsExplicit:", 1);
      }
      else if (objc_msgSend(v65, "isEqualToString:", CFSTR("title")))
      {
        -[IMPodcastParser elementCharBufferTrimmed](self, "elementCharBufferTrimmed");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setItunesTitle:", v18);
      }
      else
      {
        if (!objc_msgSend(v65, "isEqualToString:", CFSTR("episodeType")))
        {
          if (objc_msgSend(v65, "isEqualToString:", CFSTR("season")))
          {
            -[IMPodcastParser elementCharBuffer](self, "elementCharBuffer");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = objc_msgSend(v61, "longLongValue");

            if ((unint64_t)(v62 - 1) <= 0x7FFFFFFFFFFFFFFDLL)
              objc_msgSend(v16, "setSeasonNumber:", v62);
          }
          else if (objc_msgSend(v65, "isEqualToString:", CFSTR("episode")))
          {
            -[IMPodcastParser elementCharBuffer](self, "elementCharBuffer");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = objc_msgSend(v63, "longLongValue");

            if ((unint64_t)(v64 - 1) <= 0x7FFFFFFFFFFFFFFDLL)
              objc_msgSend(v16, "setEpisodeNumber:", v64);
          }
          goto LABEL_75;
        }
        -[IMPodcastParser elementCharBufferTrimmed](self, "elementCharBufferTrimmed");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setEpisodeType:", v18);
      }
    }
LABEL_74:

    goto LABEL_75;
  }
  if (v9)
  {
    if (objc_msgSend(v65, "isEqualToString:", CFSTR("author")))
    {
      -[IMPodcastParser elementCharBufferTrimmed](self, "elementCharBufferTrimmed");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMPodcastParser parsedFeed](self, "parsedFeed");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAuthor:", v16);
      goto LABEL_96;
    }
    if (objc_msgSend(v65, "isEqualToString:", CFSTR("provider")))
    {
      -[IMPodcastParser elementCharBufferTrimmed](self, "elementCharBufferTrimmed");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMPodcastParser parsedFeed](self, "parsedFeed");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setProvider:", v16);
      goto LABEL_96;
    }
    if (objc_msgSend(v65, "isEqualToString:", CFSTR("summary")))
    {
      -[IMPodcastParser elementCharBuffer](self, "elementCharBuffer");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "isWhitespace");

      if ((v35 & 1) == 0)
      {
        -[IMPodcastParser parsedFeed](self, "parsedFeed");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "feedDescription");
        v37 = objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          v38 = (void *)v37;
          -[IMPodcastParser feedDescriptionSourceElement](self, "feedDescriptionSourceElement");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("description"));

          if (!v40)
            goto LABEL_98;
        }
        else
        {

        }
        v25 = CFSTR("summary");
        goto LABEL_95;
      }
      goto LABEL_98;
    }
    if (objc_msgSend(v65, "isEqualToString:", CFSTR("category")))
    {
      -[IMPodcastParser parsedFeed](self, "parsedFeed");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "category");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (v44)
        -[IMPodcastParser setPreferredFeedCategoryFound:](self, "setPreferredFeedCategoryFound:", 1);
      goto LABEL_98;
    }
    if (objc_msgSend(v65, "isEqualToString:", CFSTR("new-feed-url")))
    {
      -[IMPodcastParser elementCharBufferTrimmed](self, "elementCharBufferTrimmed");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMPodcastParser parsedFeed](self, "parsedFeed");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setUpdatedFeedURL:", v16);
      goto LABEL_96;
    }
    if (!objc_msgSend(v65, "isEqualToString:", CFSTR("title")))
    {
      if (objc_msgSend(v65, "isEqualToString:", CFSTR("explicit")))
      {
        -[IMPodcastParser elementCharBufferTrimmed](self, "elementCharBufferTrimmed");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "lowercaseString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v16, "isEqualToString:", CFSTR("yes")))
          goto LABEL_97;
        -[IMPodcastParser parsedFeed](self, "parsedFeed");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setIsExplicit:", 1);
      }
      else
      {
        if (!objc_msgSend(v65, "isEqualToString:", CFSTR("type")))
          goto LABEL_98;
        -[IMPodcastParser elementCharBufferTrimmed](self, "elementCharBufferTrimmed");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMPodcastParser parsedFeed](self, "parsedFeed");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setShowType:", v16);
      }
LABEL_96:

LABEL_97:
      goto LABEL_98;
    }
    -[IMPodcastParser parsedFeed](self, "parsedFeed");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "title");
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v59)
    {
      -[IMPodcastParser elementCharBufferTrimmed](self, "elementCharBufferTrimmed");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_40;
    }
  }
  else
  {
    if (!v11)
      goto LABEL_98;
    if (!objc_msgSend(v65, "isEqualToString:", CFSTR("description")))
    {
      if (!objc_msgSend(v65, "isEqualToString:", CFSTR("title")))
      {
        if (objc_msgSend(v65, "isEqualToString:", CFSTR("link")))
        {
          -[IMPodcastParser elementCharBufferTrimmed](self, "elementCharBufferTrimmed");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMPodcastParser parsedFeed](self, "parsedFeed");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setWebpageURL:", v16);
          goto LABEL_96;
        }
        if (objc_msgSend(v65, "isEqualToString:", CFSTR("image")))
          self->_inGlobalImageElement = 0;
        goto LABEL_98;
      }
      -[IMPodcastParser elementCharBufferTrimmed](self, "elementCharBufferTrimmed");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v16, "length"))
        goto LABEL_97;
      -[IMPodcastParser parsedFeed](self, "parsedFeed");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "title");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
        goto LABEL_97;
LABEL_40:
      -[IMPodcastParser parsedFeed](self, "parsedFeed");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setTitle:", v16);
      goto LABEL_96;
    }
    -[IMPodcastParser elementCharBuffer](self, "elementCharBuffer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isWhitespace");

    if ((v22 & 1) == 0)
    {
      -[IMPodcastParser parsedFeed](self, "parsedFeed");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "feedDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
      {
        v25 = CFSTR("description");
LABEL_95:
        -[IMPodcastParser setFeedDescriptionSourceElement:](self, "setFeedDescriptionSourceElement:", v25);
        -[IMPodcastParser elementCharBufferTrimmed](self, "elementCharBufferTrimmed");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMPodcastParser parsedFeed](self, "parsedFeed");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setFeedDescription:", v16);
        goto LABEL_96;
      }
    }
  }
LABEL_98:
  -[IMPodcastParser endBufferingElementChars](self, "endBufferingElementChars");

}

- (void)atomParser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v8;
  _BOOL4 v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  char v34;
  id v35;

  v35 = a4;
  v8 = a5;
  v9 = +[IMPodcastParser isITunesNamespace:](IMPodcastParser, "isITunesNamespace:", v8);
  if (v8)
  {
    v10 = objc_msgSend(v8, "isWhitespace");
    if (!-[IMPodcastParser itemElementNestCount](self, "itemElementNestCount"))
    {
      if (!v10)
        goto LABEL_22;
      goto LABEL_16;
    }
LABEL_7:
    -[IMPodcastParser parsedFeed](self, "parsedFeed");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "items");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[IMPodcastParser itemElementNestCount](self, "itemElementNestCount") == 2)
    {
      v14 = v35;
      if (v10)
      {
        if (objc_msgSend(v35, "isEqualToString:", CFSTR("title")))
        {
          -[IMPodcastParser elementCharBufferTrimmed](self, "elementCharBufferTrimmed");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setTitle:", v15);
LABEL_40:

          goto LABEL_41;
        }
        v29 = objc_msgSend(v35, "isEqualToString:", CFSTR("id"));
        v14 = v35;
        if (v29)
        {
          -[IMPodcastParser elementCharBufferTrimmed](self, "elementCharBufferTrimmed");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setGuid:", v15);
          goto LABEL_40;
        }
      }
      if (v9 && objc_msgSend(v14, "isEqualToString:", CFSTR("author")))
      {
        objc_msgSend(v13, "author");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isNotWhitespace");

        if ((v31 & 1) != 0)
          goto LABEL_41;
        goto LABEL_33;
      }
      if (!v10)
        goto LABEL_41;
      if (objc_msgSend(v35, "isEqualToString:", CFSTR("published")))
      {
        -[IMPodcastParser elementCharBuffer](self, "elementCharBuffer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMPodcastParser dateFromAtomDateString:](self, "dateFromAtomDateString:", v15);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setPubDate:", v32);

        goto LABEL_40;
      }
      if (!objc_msgSend(v35, "isEqualToString:", CFSTR("summary")))
      {
        if (objc_msgSend(v35, "isEqualToString:", CFSTR("entry")))
        {
          -[IMPodcastParser setItemElementNestCount:](self, "setItemElementNestCount:", 0);
          -[IMPodcastParser postProcessItemElement:](self, "postProcessItemElement:", v13);
        }
        goto LABEL_41;
      }
      objc_msgSend(v13, "itemDescription");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "isNotWhitespace");

      if ((v34 & 1) == 0)
      {
        -[IMPodcastParser elementCharBufferTrimmed](self, "elementCharBufferTrimmed");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setItemDescription:", v15);
        goto LABEL_40;
      }
    }
    else if (-[IMPodcastParser itemElementNestCount](self, "itemElementNestCount") == 3
           && (-[IMPodcastParser inAuthorElement](self, "inAuthorElement") & v10) == 1)
    {
      if (!objc_msgSend(v35, "isEqualToString:", CFSTR("name")))
      {
        if (objc_msgSend(v35, "isEqualToString:", CFSTR("author")))
          -[IMPodcastParser setInAuthorElement:](self, "setInAuthorElement:", 0);
        goto LABEL_41;
      }
LABEL_33:
      -[IMPodcastParser elementCharBufferTrimmed](self, "elementCharBufferTrimmed");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAuthor:", v15);
      goto LABEL_40;
    }
LABEL_41:
    if (-[IMPodcastParser itemElementNestCount](self, "itemElementNestCount"))
      -[IMPodcastParser setItemElementNestCount:](self, "setItemElementNestCount:", -[IMPodcastParser itemElementNestCount](self, "itemElementNestCount") - 1);
    goto LABEL_49;
  }
  if (-[IMPodcastParser itemElementNestCount](self, "itemElementNestCount"))
  {
    v10 = 1;
    goto LABEL_7;
  }
LABEL_16:
  if (objc_msgSend(v35, "isEqualToString:", CFSTR("title")))
  {
    -[IMPodcastParser elementCharBuffer](self, "elementCharBuffer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isWhitespace");

    if ((v17 & 1) == 0)
    {
      -[IMPodcastParser parsedFeed](self, "parsedFeed");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "feedDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        v20 = CFSTR("title");
LABEL_47:
        -[IMPodcastParser setFeedDescriptionSourceElement:](self, "setFeedDescriptionSourceElement:", v20);
        -[IMPodcastParser elementCharBufferTrimmed](self, "elementCharBufferTrimmed");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMPodcastParser parsedFeed](self, "parsedFeed");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setFeedDescription:", v13);
        goto LABEL_48;
      }
    }
    goto LABEL_50;
  }
  if (objc_msgSend(v35, "isEqualToString:", CFSTR("logo")))
  {
    -[IMPodcastParser elementCharBufferTrimmed](self, "elementCharBufferTrimmed");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMPodcastParser parsedFeed](self, "parsedFeed");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setImageURL:", v13);
LABEL_48:

LABEL_49:
    goto LABEL_50;
  }
LABEL_22:
  if (v9)
  {
    if (objc_msgSend(v35, "isEqualToString:", CFSTR("summary")))
    {
      -[IMPodcastParser elementCharBuffer](self, "elementCharBuffer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isWhitespace");

      if ((v23 & 1) == 0)
      {
        -[IMPodcastParser parsedFeed](self, "parsedFeed");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "feedDescription");
        v25 = objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          v26 = (void *)v25;
          -[IMPodcastParser feedDescriptionSourceElement](self, "feedDescriptionSourceElement");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("title"));

          if (!v28)
            goto LABEL_50;
        }
        else
        {

        }
        v20 = CFSTR("summary");
        goto LABEL_47;
      }
    }
  }
LABEL_50:
  -[IMPodcastParser endBufferingElementChars](self, "endBufferingElementChars");

}

- (void)postProcessItemElement:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "guid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    objc_msgSend(v16, "enclosureURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_3;
    objc_msgSend(v16, "enclosureParameterString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v16, "enclosureURL");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "enclosureParameterString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@?%@"), v4, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setGuid:", v15);

    }
    else
    {
      objc_msgSend(v16, "enclosureURL");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setGuid:", v4);
    }
  }

LABEL_3:
  objc_msgSend(v16, "title");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        objc_msgSend(v16, "title"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isWhitespace"),
        v7,
        v6,
        v8))
  {
    -[IMPodcastParser parsedFeed](self, "parsedFeed");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "items");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", v16);

  }
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  if (-[IMPodcastParser shouldBufferElementChars](self, "shouldBufferElementChars"))
  {
    -[IMPodcastParser elementCharBuffer](self, "elementCharBuffer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v6);

  }
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  -[IMPodcastParser setParseError:](self, "setParseError:", a4);
}

+ (BOOL)isITunesNamespace:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("http://www.itunes.com/dtds/podcast-1.0.dtd")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("http://www.itunes.com/DTDs/Podcast-1.0.dtd")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("http://www.itunes.com/DTDs/PodCast-1.0.dtd"));
  }

  return v4;
}

+ (BOOL)isContentNamespace:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("http://purl.org/rss/1.0/modules/content/"));
}

- (void)startBufferingElementChars
{
  id v3;

  if (-[IMPodcastParser shouldBufferElementChars](self, "shouldBufferElementChars"))
    -[IMPodcastParser endBufferingElementChars](self, "endBufferingElementChars");
  -[IMPodcastParser setShouldBufferElementChars:](self, "setShouldBufferElementChars:", 1);
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[IMPodcastParser setElementCharBuffer:](self, "setElementCharBuffer:", v3);

}

- (void)endBufferingElementChars
{
  -[IMPodcastParser setShouldBufferElementChars:](self, "setShouldBufferElementChars:", 0);
}

- (id)elementCharBufferTrimmed
{
  void *v2;
  void *v3;
  void *v4;

  -[IMPodcastParser elementCharBuffer](self, "elementCharBuffer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "im_stringByMemoryEfficientTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSError)parseError
{
  return self->_parseError;
}

- (void)setParseError:(id)a3
{
  objc_storeStrong((id *)&self->_parseError, a3);
}

- (IMPodcastFeed)parsedFeed
{
  return self->_parsedFeed;
}

- (void)setParsedFeed:(id)a3
{
  objc_storeStrong((id *)&self->_parsedFeed, a3);
}

- (NSDateFormatter)rssDateFormatter
{
  return self->_rssDateFormatter;
}

- (void)setRssDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_rssDateFormatter, a3);
}

- (BOOL)shouldBufferElementChars
{
  return self->_shouldBufferElementChars;
}

- (void)setShouldBufferElementChars:(BOOL)a3
{
  self->_shouldBufferElementChars = a3;
}

- (NSMutableString)elementCharBuffer
{
  return self->_elementCharBuffer;
}

- (void)setElementCharBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_elementCharBuffer, a3);
}

- (unint64_t)itemElementNestCount
{
  return self->_itemElementNestCount;
}

- (void)setItemElementNestCount:(unint64_t)a3
{
  self->_itemElementNestCount = a3;
}

- (BOOL)inAuthorElement
{
  return self->_inAuthorElement;
}

- (void)setInAuthorElement:(BOOL)a3
{
  self->_inAuthorElement = a3;
}

- (NSString)feedDescriptionSourceElement
{
  return self->_feedDescriptionSourceElement;
}

- (void)setFeedDescriptionSourceElement:(id)a3
{
  objc_storeStrong((id *)&self->_feedDescriptionSourceElement, a3);
}

- (BOOL)preferredFeedCategoryFound
{
  return self->_preferredFeedCategoryFound;
}

- (void)setPreferredFeedCategoryFound:(BOOL)a3
{
  self->_preferredFeedCategoryFound = a3;
}

- (BOOL)preferredItemCategoryFound
{
  return self->_preferredItemCategoryFound;
}

- (void)setPreferredItemCategoryFound:(BOOL)a3
{
  self->_preferredItemCategoryFound = a3;
}

- (int64_t)feedType
{
  return self->_feedType;
}

- (void)setFeedType:(int64_t)a3
{
  self->_feedType = a3;
}

- (BOOL)inGlobalImageElement
{
  return self->_inGlobalImageElement;
}

- (void)setInGlobalImageElement:(BOOL)a3
{
  self->_inGlobalImageElement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parseError, 0);
  objc_storeStrong((id *)&self->_feedDescriptionSourceElement, 0);
  objc_storeStrong((id *)&self->_elementCharBuffer, 0);
  objc_storeStrong((id *)&self->_rssDateFormatter, 0);
  objc_storeStrong((id *)&self->_parsedFeed, 0);
}

@end
