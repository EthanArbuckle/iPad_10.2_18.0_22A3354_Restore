@implementation IMPodcastFeed

- (IMPodcastFeed)init
{
  IMPodcastFeed *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMPodcastFeed;
  v2 = -[IMPodcastFeed init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMPodcastFeed setItems:](v2, "setItems:", v3);

  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[IMPodcastFeed feedDescription](self, "feedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMPodcastFeed feedDescription](self, "feedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7 || objc_msgSend(v6, "isEqual:", v7))
    {
      -[IMPodcastFeed author](self, "author");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "author");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == v9 || objc_msgSend(v8, "isEqual:", v9))
      {
        -[IMPodcastFeed category](self, "category");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "category");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 == v11 || objc_msgSend(v10, "isEqual:", v11))
        {
          v67 = v10;
          -[IMPodcastFeed imageURL](self, "imageURL");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "imageURL");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12 == v13 || objc_msgSend(v12, "isEqual:", v13))
          {
            v65 = v11;
            v66 = v13;
            -[IMPodcastFeed globalImageURL](self, "globalImageURL");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "globalImageURL");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14 == v15 || objc_msgSend(v14, "isEqual:", v15))
            {
              v63 = v8;
              v64 = v15;
              -[IMPodcastFeed items](self, "items");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "items");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16 == v17 || objc_msgSend(v16, "isEqual:", v17))
              {
                v61 = v9;
                v62 = v17;
                -[IMPodcastFeed provider](self, "provider");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "provider");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v60 = v18;
                if (v18 == v19 || objc_msgSend(v18, "isEqual:", v19))
                {
                  v59 = v19;
                  -[IMPodcastFeed category](self, "category");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "category");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v58 = v20;
                  if (v20 == v21 || objc_msgSend(v20, "isEqual:", v21))
                  {
                    v57 = v21;
                    -[IMPodcastFeed updatedFeedURL](self, "updatedFeedURL");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v5, "updatedFeedURL");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    v56 = v22;
                    if (v22 == v23 || objc_msgSend(v22, "isEqual:", v23))
                    {
                      v55 = v23;
                      -[IMPodcastFeed title](self, "title");
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v5, "title");
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      v54 = v24;
                      if (v24 == v25 || objc_msgSend(v24, "isEqual:", v25))
                      {
                        v53 = v25;
                        v26 = -[IMPodcastFeed isExplicit](self, "isExplicit");
                        if (v26 == objc_msgSend(v5, "isExplicit")
                          && (v27 = -[IMPodcastFeed isNotSubscribable](self, "isNotSubscribable"),
                              v27 == objc_msgSend(v5, "isNotSubscribable")))
                        {
                          -[IMPodcastFeed shareURL](self, "shareURL");
                          v29 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v5, "shareURL");
                          v30 = (void *)objc_claimAutoreleasedReturnValue();
                          v52 = v29;
                          if (v29 == v30 || objc_msgSend(v29, "isEqual:", v30))
                          {
                            v51 = v30;
                            -[IMPodcastFeed showType](self, "showType");
                            v31 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v5, "showType");
                            v32 = (void *)objc_claimAutoreleasedReturnValue();
                            v50 = v31;
                            if (v31 == v32 || objc_msgSend(v31, "isEqual:", v32))
                            {
                              v49 = v32;
                              -[IMPodcastFeed webpageURL](self, "webpageURL");
                              v33 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v5, "webpageURL");
                              v34 = (void *)objc_claimAutoreleasedReturnValue();
                              v48 = v33;
                              if (v33 == v34 || objc_msgSend(v33, "isEqual:", v34))
                              {
                                v47 = v34;
                                -[IMPodcastFeed displayType](self, "displayType");
                                v35 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v5, "displayType");
                                v36 = (void *)objc_claimAutoreleasedReturnValue();
                                v46 = v35;
                                if (v35 == v36 || objc_msgSend(v35, "isEqual:", v36))
                                {
                                  v45 = v36;
                                  -[IMPodcastFeed offers](self, "offers");
                                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                                  -[IMPodcastFeed offers](self, "offers");
                                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                                  if (v37 == v38 || objc_msgSend(v37, "isEqual:", v38))
                                  {
                                    v44 = v38;
                                    -[IMPodcastFeed showSpecificUpsellCopy](self, "showSpecificUpsellCopy");
                                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                                    -[IMPodcastFeed showSpecificUpsellCopy](self, "showSpecificUpsellCopy");
                                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                                    if (v39 == v40)
                                    {
                                      v28 = 1;
                                    }
                                    else
                                    {
                                      v41 = v40;
                                      v42 = objc_msgSend(v39, "isEqual:", v40);
                                      v40 = v41;
                                      v28 = v42;
                                    }

                                    v38 = v44;
                                  }
                                  else
                                  {
                                    v28 = 0;
                                  }

                                  v36 = v45;
                                }
                                else
                                {
                                  v28 = 0;
                                }

                                v34 = v47;
                              }
                              else
                              {
                                v28 = 0;
                              }

                              v32 = v49;
                            }
                            else
                            {
                              v28 = 0;
                            }

                            v30 = v51;
                          }
                          else
                          {
                            v28 = 0;
                          }

                        }
                        else
                        {
                          v28 = 0;
                        }
                        v25 = v53;
                      }
                      else
                      {
                        v28 = 0;
                      }

                      v23 = v55;
                    }
                    else
                    {
                      v28 = 0;
                    }

                    v21 = v57;
                  }
                  else
                  {
                    v28 = 0;
                  }

                  v19 = v59;
                }
                else
                {
                  v28 = 0;
                }

                v17 = v62;
                v9 = v61;
              }
              else
              {
                v28 = 0;
              }

              v8 = v63;
              v15 = v64;
            }
            else
            {
              v28 = 0;
            }

            v11 = v65;
            v13 = v66;
          }
          else
          {
            v28 = 0;
          }

          v10 = v67;
        }
        else
        {
          v28 = 0;
        }

      }
      else
      {
        v28 = 0;
      }

    }
    else
    {
      v28 = 0;
    }

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (unint64_t)offerTypesAsFlagBits
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[IMPodcastFeed offers](self, "offers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 |= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "offerTypeAsFlagBit");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasEpisodes
{
  void *v2;
  BOOL v3;

  -[IMPodcastFeed items](self, "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)preferredCategoryFound
{
  return self->_preferredCategoryFound;
}

- (void)setPreferredCategoryFound:(BOOL)a3
{
  self->_preferredCategoryFound = a3;
}

- (NSString)feedDescription
{
  return self->_feedDescription;
}

- (void)setFeedDescription:(id)a3
{
  objc_storeStrong((id *)&self->_feedDescription, a3);
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
  objc_storeStrong((id *)&self->_author, a3);
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_storeStrong((id *)&self->_category, a3);
}

- (NSString)globalImageURL
{
  return self->_globalImageURL;
}

- (void)setGlobalImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_globalImageURL, a3);
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (NSString)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
  objc_storeStrong((id *)&self->_provider, a3);
}

- (NSString)updatedFeedURL
{
  return self->_updatedFeedURL;
}

- (void)setUpdatedFeedURL:(id)a3
{
  objc_storeStrong((id *)&self->_updatedFeedURL, a3);
}

- (NSString)resolvedFeedURL
{
  return self->_resolvedFeedURL;
}

- (void)setResolvedFeedURL:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedFeedURL, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (BOOL)isExplicit
{
  return self->_isExplicit;
}

- (void)setIsExplicit:(BOOL)a3
{
  self->_isExplicit = a3;
}

- (BOOL)isNotSubscribable
{
  return self->_isNotSubscribable;
}

- (void)setIsNotSubscribable:(BOOL)a3
{
  self->_isNotSubscribable = a3;
}

- (NSString)shareURL
{
  return self->_shareURL;
}

- (void)setShareURL:(id)a3
{
  objc_storeStrong((id *)&self->_shareURL, a3);
}

- (NSString)showType
{
  return self->_showType;
}

- (void)setShowType:(id)a3
{
  objc_storeStrong((id *)&self->_showType, a3);
}

- (NSString)webpageURL
{
  return self->_webpageURL;
}

- (void)setWebpageURL:(id)a3
{
  objc_storeStrong((id *)&self->_webpageURL, a3);
}

- (NSString)podcastStoreId
{
  return self->_podcastStoreId;
}

- (void)setPodcastStoreId:(id)a3
{
  objc_storeStrong((id *)&self->_podcastStoreId, a3);
}

- (NSString)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(id)a3
{
  objc_storeStrong((id *)&self->_displayType, a3);
}

- (NSArray)offers
{
  return self->_offers;
}

- (void)setOffers:(id)a3
{
  objc_storeStrong((id *)&self->_offers, a3);
}

- (NSString)uberBackgroundImageURL
{
  return self->_uberBackgroundImageURL;
}

- (void)setUberBackgroundImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_uberBackgroundImageURL, a3);
}

- (NSString)uberBackgroundJoeColor
{
  return self->_uberBackgroundJoeColor;
}

- (void)setUberBackgroundJoeColor:(id)a3
{
  objc_storeStrong((id *)&self->_uberBackgroundJoeColor, a3);
}

- (NSString)uberArtworkTextPrimaryColor
{
  return self->_uberArtworkTextPrimaryColor;
}

- (void)setUberArtworkTextPrimaryColor:(id)a3
{
  objc_storeStrong((id *)&self->_uberArtworkTextPrimaryColor, a3);
}

- (NSString)uberArtworkTextSecondaryColor
{
  return self->_uberArtworkTextSecondaryColor;
}

- (void)setUberArtworkTextSecondaryColor:(id)a3
{
  objc_storeStrong((id *)&self->_uberArtworkTextSecondaryColor, a3);
}

- (NSString)uberArtworkTextTertiaryColor
{
  return self->_uberArtworkTextTertiaryColor;
}

- (void)setUberArtworkTextTertiaryColor:(id)a3
{
  objc_storeStrong((id *)&self->_uberArtworkTextTertiaryColor, a3);
}

- (NSString)uberArtworkTextQuaternaryColor
{
  return self->_uberArtworkTextQuaternaryColor;
}

- (void)setUberArtworkTextQuaternaryColor:(id)a3
{
  objc_storeStrong((id *)&self->_uberArtworkTextQuaternaryColor, a3);
}

- (NSString)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_imageURL, a3);
}

- (NSString)artworkTemplateURL
{
  return self->_artworkTemplateURL;
}

- (void)setArtworkTemplateURL:(id)a3
{
  objc_storeStrong((id *)&self->_artworkTemplateURL, a3);
}

- (NSString)artworkPrimaryColor
{
  return self->_artworkPrimaryColor;
}

- (void)setArtworkPrimaryColor:(id)a3
{
  objc_storeStrong((id *)&self->_artworkPrimaryColor, a3);
}

- (NSString)artworkTextPrimaryColor
{
  return self->_artworkTextPrimaryColor;
}

- (void)setArtworkTextPrimaryColor:(id)a3
{
  objc_storeStrong((id *)&self->_artworkTextPrimaryColor, a3);
}

- (NSString)artworkTextSecondaryColor
{
  return self->_artworkTextSecondaryColor;
}

- (void)setArtworkTextSecondaryColor:(id)a3
{
  objc_storeStrong((id *)&self->_artworkTextSecondaryColor, a3);
}

- (NSString)artworkTextTertiaryColor
{
  return self->_artworkTextTertiaryColor;
}

- (void)setArtworkTextTertiaryColor:(id)a3
{
  objc_storeStrong((id *)&self->_artworkTextTertiaryColor, a3);
}

- (NSString)artworkTextQuaternaryColor
{
  return self->_artworkTextQuaternaryColor;
}

- (void)setArtworkTextQuaternaryColor:(id)a3
{
  objc_storeStrong((id *)&self->_artworkTextQuaternaryColor, a3);
}

- (IMPodcastFeedChannelItem)channelItem
{
  return self->_channelItem;
}

- (void)setChannelItem:(id)a3
{
  objc_storeStrong((id *)&self->_channelItem, a3);
}

- (NSOrderedSet)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
  objc_storeStrong((id *)&self->_categories, a3);
}

- (NSString)showSpecificUpsellCopy
{
  return self->_showSpecificUpsellCopy;
}

- (void)setShowSpecificUpsellCopy:(id)a3
{
  objc_storeStrong((id *)&self->_showSpecificUpsellCopy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showSpecificUpsellCopy, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_channelItem, 0);
  objc_storeStrong((id *)&self->_artworkTextQuaternaryColor, 0);
  objc_storeStrong((id *)&self->_artworkTextTertiaryColor, 0);
  objc_storeStrong((id *)&self->_artworkTextSecondaryColor, 0);
  objc_storeStrong((id *)&self->_artworkTextPrimaryColor, 0);
  objc_storeStrong((id *)&self->_artworkPrimaryColor, 0);
  objc_storeStrong((id *)&self->_artworkTemplateURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_uberArtworkTextQuaternaryColor, 0);
  objc_storeStrong((id *)&self->_uberArtworkTextTertiaryColor, 0);
  objc_storeStrong((id *)&self->_uberArtworkTextSecondaryColor, 0);
  objc_storeStrong((id *)&self->_uberArtworkTextPrimaryColor, 0);
  objc_storeStrong((id *)&self->_uberBackgroundJoeColor, 0);
  objc_storeStrong((id *)&self->_uberBackgroundImageURL, 0);
  objc_storeStrong((id *)&self->_offers, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_podcastStoreId, 0);
  objc_storeStrong((id *)&self->_webpageURL, 0);
  objc_storeStrong((id *)&self->_showType, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_resolvedFeedURL, 0);
  objc_storeStrong((id *)&self->_updatedFeedURL, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_globalImageURL, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_feedDescription, 0);
}

@end
