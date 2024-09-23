@implementation IMPodcastFeedItem

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)IMPodcastFeedItem;
  -[IMPodcastFeedItem description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMPodcastFeedItem title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMPodcastFeedItem guid](self, "guid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMPodcastFeedItem uti](self, "uti");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ Title: %@ GUID: %@ uti: %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  BOOL v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  int64_t v53;
  int64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[IMPodcastFeedItem author](self, "author");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "author");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 == v7 || objc_msgSend(v6, "isEqual:", v7))
      && (v8 = -[IMPodcastFeedItem byteSize](self, "byteSize"), v8 == objc_msgSend(v5, "byteSize")))
    {
      -[IMPodcastFeedItem category](self, "category");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "category");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v9 == v10 || objc_msgSend(v9, "isEqual:", v10))
        && (-[IMPodcastFeedItem duration](self, "duration"), v12 = v11, objc_msgSend(v5, "duration"), v12 == v13))
      {
        -[IMPodcastFeedItem enclosureParameterString](self, "enclosureParameterString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "enclosureParameterString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14 == v15 || objc_msgSend(v14, "isEqual:", v15))
        {
          v113 = v14;
          -[IMPodcastFeedItem enclosureURL](self, "enclosureURL");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "enclosureURL");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16 == v17 || objc_msgSend(v16, "isEqual:", v17))
          {
            v111 = v17;
            v112 = v16;
            v18 = -[IMPodcastFeedItem isExplicit](self, "isExplicit");
            if (v18 == objc_msgSend(v5, "isExplicit"))
            {
              -[IMPodcastFeedItem guid](self, "guid");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "guid");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v110 = v20;
              if (v20 == v21 || objc_msgSend(v20, "isEqual:", v21))
              {
                v108 = v15;
                v109 = v21;
                -[IMPodcastFeedItem itemDescription](self, "itemDescription");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "itemDescription");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v107 = v22;
                if (v22 == v23 || objc_msgSend(v22, "isEqual:", v23))
                {
                  v106 = v23;
                  -[IMPodcastFeedItem itemDescriptionSourceElement](self, "itemDescriptionSourceElement");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "itemDescriptionSourceElement");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v105 = v24;
                  if (v24 == v25 || (v26 = v25, v27 = objc_msgSend(v24, "isEqual:", v25), v25 = v26, v27))
                  {
                    v104 = v25;
                    -[IMPodcastFeedItem pubDate](self, "pubDate");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v5, "pubDate");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    v103 = v28;
                    if (v28 == v29 || (v30 = v29, v31 = objc_msgSend(v28, "isEqual:", v29), v29 = v30, v31))
                    {
                      v101 = v29;
                      -[IMPodcastFeedItem firstTimeAvailableAsPaid](self, "firstTimeAvailableAsPaid");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v5, "firstTimeAvailableAsPaid");
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      v100 = v32;
                      if (v32 == v33 || (v34 = v33, v35 = objc_msgSend(v32, "isEqual:", v33), v33 = v34, v35))
                      {
                        v99 = v33;
                        -[IMPodcastFeedItem firstTimeAvailableAsFree](self, "firstTimeAvailableAsFree");
                        v36 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v5, "firstTimeAvailableAsFree");
                        v98 = v36;
                        v102 = objc_claimAutoreleasedReturnValue();
                        if (v36 == (void *)v102 || (v37 = objc_msgSend(v36, "isEqual:", v102), v38 = (void *)v102, v37))
                        {
                          -[IMPodcastFeedItem title](self, "title");
                          v39 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v5, "title");
                          v40 = (void *)objc_claimAutoreleasedReturnValue();
                          if ((v39 == v40 || objc_msgSend(v39, "isEqual:", v40))
                            && (v41 = -[IMPodcastFeedItem trackNum](self, "trackNum"),
                                v41 == objc_msgSend(v5, "trackNum")))
                          {
                            v96 = v40;
                            v97 = v39;
                            -[IMPodcastFeedItem uti](self, "uti");
                            v42 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v5, "uti");
                            v43 = (void *)objc_claimAutoreleasedReturnValue();
                            v16 = v112;
                            v95 = v42;
                            if (v42 == v43 || objc_msgSend(v42, "isEqual:", v43))
                            {
                              v93 = v43;
                              -[IMPodcastFeedItem itunesTitle](self, "itunesTitle");
                              v44 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v5, "itunesTitle");
                              v45 = (void *)objc_claimAutoreleasedReturnValue();
                              v94 = v44;
                              if (v44 == v45 || objc_msgSend(v44, "isEqual:", v45))
                              {
                                -[IMPodcastFeedItem itemSummary](self, "itemSummary");
                                v46 = objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v5, "itemSummary");
                                v47 = objc_claimAutoreleasedReturnValue();
                                v92 = (void *)v46;
                                v48 = v46 == v47;
                                v49 = (void *)v47;
                                if (v48 || objc_msgSend(v92, "isEqual:", v47))
                                {
                                  v90 = v45;
                                  -[IMPodcastFeedItem itemSummarySourceElement](self, "itemSummarySourceElement");
                                  v50 = objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v5, "itemSummarySourceElement");
                                  v51 = objc_claimAutoreleasedReturnValue();
                                  v91 = (void *)v50;
                                  v48 = v50 == v51;
                                  v52 = (void *)v51;
                                  if (v48 || objc_msgSend(v91, "isEqual:", v51))
                                  {
                                    v53 = -[IMPodcastFeedItem seasonNumber](self, "seasonNumber");
                                    if (v53 == objc_msgSend(v5, "seasonNumber"))
                                    {
                                      v89 = v49;
                                      v54 = -[IMPodcastFeedItem episodeNumber](self, "episodeNumber");
                                      if (v54 == objc_msgSend(v5, "episodeNumber"))
                                      {
                                        -[IMPodcastFeedItem episodeType](self, "episodeType");
                                        v55 = (void *)objc_claimAutoreleasedReturnValue();
                                        objc_msgSend(v5, "episodeType");
                                        v87 = (void *)objc_claimAutoreleasedReturnValue();
                                        v88 = v55;
                                        if (v55 == v87 || objc_msgSend(v55, "isEqual:", v87))
                                        {
                                          -[IMPodcastFeedItem webpageURL](self, "webpageURL");
                                          v56 = (void *)objc_claimAutoreleasedReturnValue();
                                          objc_msgSend(v5, "webpageURL");
                                          v85 = (void *)objc_claimAutoreleasedReturnValue();
                                          v86 = v56;
                                          if (v56 == v85 || objc_msgSend(v56, "isEqual:", v85))
                                          {
                                            -[IMPodcastFeedItem priceType](self, "priceType");
                                            v57 = (void *)objc_claimAutoreleasedReturnValue();
                                            objc_msgSend(v5, "priceType");
                                            v83 = (void *)objc_claimAutoreleasedReturnValue();
                                            v84 = v57;
                                            if (v57 == v83 || objc_msgSend(v57, "isEqual:", v83))
                                            {
                                              -[IMPodcastFeedItem entitledPriceType](self, "entitledPriceType");
                                              v58 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_msgSend(v5, "entitledPriceType");
                                              v81 = (void *)objc_claimAutoreleasedReturnValue();
                                              v82 = v58;
                                              if (v58 == v81 || objc_msgSend(v58, "isEqual:", v81))
                                              {
                                                -[IMPodcastFeedItem entitledEnclosureURL](self, "entitledEnclosureURL");
                                                v59 = (void *)objc_claimAutoreleasedReturnValue();
                                                objc_msgSend(v5, "entitledEnclosureURL");
                                                v79 = (void *)objc_claimAutoreleasedReturnValue();
                                                v80 = v59;
                                                if ((v59 == v79 || objc_msgSend(v59, "isEqual:", v79))
                                                  && (-[IMPodcastFeedItem entitledDuration](self, "entitledDuration"),
                                                      v61 = v60,
                                                      objc_msgSend(v5, "entitledDuration"),
                                                      v61 == v62))
                                                {
                                                  -[IMPodcastFeedItem freeTranscriptIdentifier](self, "freeTranscriptIdentifier");
                                                  v63 = objc_claimAutoreleasedReturnValue();
                                                  objc_msgSend(v5, "freeTranscriptIdentifier");
                                                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                                                  v78 = (void *)v63;
                                                  if ((void *)v63 == v77)
                                                  {
                                                    -[IMPodcastFeedItem entitledTranscriptIdentifier](self, "entitledTranscriptIdentifier");
                                                    v64 = objc_claimAutoreleasedReturnValue();
                                                    objc_msgSend(v5, "entitledTranscriptIdentifier");
                                                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                                                    v76 = (void *)v64;
                                                    if ((void *)v64 == v75)
                                                    {
                                                      -[IMPodcastFeedItem freeTranscriptSnippet](self, "freeTranscriptSnippet");
                                                      v65 = (void *)objc_claimAutoreleasedReturnValue();
                                                      objc_msgSend(v5, "freeTranscriptSnippet");
                                                      v74 = (void *)objc_claimAutoreleasedReturnValue();
                                                      if (v65 == v74)
                                                      {
                                                        -[IMPodcastFeedItem entitledTranscriptSnippet](self, "entitledTranscriptSnippet");
                                                        v66 = objc_claimAutoreleasedReturnValue();
                                                        objc_msgSend(v5, "entitledTranscriptSnippet");
                                                        v72 = (void *)objc_claimAutoreleasedReturnValue();
                                                        v73 = (void *)v66;
                                                        if ((void *)v66 == v72)
                                                        {
                                                          -[IMPodcastFeedItem freeTranscriptProvider](self, "freeTranscriptProvider");
                                                          v67 = (void *)objc_claimAutoreleasedReturnValue();
                                                          objc_msgSend(v5, "freeTranscriptProvider");
                                                          v71 = (void *)objc_claimAutoreleasedReturnValue();
                                                          if (v67 == v71)
                                                          {
                                                            -[IMPodcastFeedItem entitledTranscriptProvider](self, "entitledTranscriptProvider");
                                                            v70 = (void *)objc_claimAutoreleasedReturnValue();
                                                            objc_msgSend(v5, "entitledTranscriptProvider");
                                                            v68 = (void *)objc_claimAutoreleasedReturnValue();
                                                            v19 = v70 == v68;

                                                          }
                                                          else
                                                          {
                                                            v19 = 0;
                                                          }

                                                        }
                                                        else
                                                        {
                                                          v19 = 0;
                                                        }

                                                      }
                                                      else
                                                      {
                                                        v19 = 0;
                                                      }

                                                    }
                                                    else
                                                    {
                                                      v19 = 0;
                                                    }

                                                  }
                                                  else
                                                  {
                                                    v19 = 0;
                                                  }

                                                }
                                                else
                                                {
                                                  v19 = 0;
                                                }

                                              }
                                              else
                                              {
                                                v19 = 0;
                                              }

                                            }
                                            else
                                            {
                                              v19 = 0;
                                            }

                                          }
                                          else
                                          {
                                            v19 = 0;
                                          }

                                        }
                                        else
                                        {
                                          v19 = 0;
                                        }

                                      }
                                      else
                                      {
                                        v19 = 0;
                                      }
                                      v16 = v112;
                                      v49 = v89;
                                    }
                                    else
                                    {
                                      v19 = 0;
                                      v16 = v112;
                                    }
                                  }
                                  else
                                  {
                                    v19 = 0;
                                  }

                                  v45 = v90;
                                }
                                else
                                {
                                  v19 = 0;
                                }

                              }
                              else
                              {
                                v19 = 0;
                              }

                              v43 = v93;
                            }
                            else
                            {
                              v19 = 0;
                            }

                            v40 = v96;
                            v39 = v97;
                          }
                          else
                          {
                            v19 = 0;
                            v16 = v112;
                          }

                          v38 = (void *)v102;
                        }
                        else
                        {
                          v19 = 0;
                          v16 = v112;
                        }

                        v33 = v99;
                      }
                      else
                      {
                        v19 = 0;
                        v16 = v112;
                      }

                      v29 = v101;
                    }
                    else
                    {
                      v19 = 0;
                      v16 = v112;
                    }

                    v25 = v104;
                  }
                  else
                  {
                    v19 = 0;
                    v16 = v112;
                  }

                  v23 = v106;
                }
                else
                {
                  v19 = 0;
                  v16 = v112;
                }

                v15 = v108;
                v21 = v109;
              }
              else
              {
                v19 = 0;
                v16 = v112;
              }

            }
            else
            {
              v19 = 0;
              v16 = v112;
            }
            v17 = v111;
          }
          else
          {
            v19 = 0;
          }

          v14 = v113;
        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (NSString)resolvedEnclosureUrl
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[IMPodcastFeedItem enclosureParameterString](self, "enclosureParameterString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMPodcastFeedItem enclosureURL](self, "enclosureURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[IMPodcastFeedItem enclosureParameterString](self, "enclosureParameterString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("?%@"), v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return (NSString *)v4;
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
  objc_storeStrong((id *)&self->_author, a3);
}

- (unint64_t)byteSize
{
  return self->_byteSize;
}

- (void)setByteSize:(unint64_t)a3
{
  self->_byteSize = a3;
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_storeStrong((id *)&self->_category, a3);
}

- (NSString)enclosureParameterString
{
  return self->_enclosureParameterString;
}

- (void)setEnclosureParameterString:(id)a3
{
  objc_storeStrong((id *)&self->_enclosureParameterString, a3);
}

- (BOOL)isExplicit
{
  return self->_isExplicit;
}

- (void)setIsExplicit:(BOOL)a3
{
  self->_isExplicit = a3;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_storeStrong((id *)&self->_guid, a3);
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (void)setItemDescription:(id)a3
{
  objc_storeStrong((id *)&self->_itemDescription, a3);
}

- (NSString)itemDescriptionSourceElement
{
  return self->_itemDescriptionSourceElement;
}

- (void)setItemDescriptionSourceElement:(id)a3
{
  objc_storeStrong((id *)&self->_itemDescriptionSourceElement, a3);
}

- (NSDate)pubDate
{
  return self->_pubDate;
}

- (void)setPubDate:(id)a3
{
  objc_storeStrong((id *)&self->_pubDate, a3);
}

- (NSDate)firstTimeAvailableAsPaid
{
  return self->_firstTimeAvailableAsPaid;
}

- (void)setFirstTimeAvailableAsPaid:(id)a3
{
  objc_storeStrong((id *)&self->_firstTimeAvailableAsPaid, a3);
}

- (NSDate)firstTimeAvailableAsFree
{
  return self->_firstTimeAvailableAsFree;
}

- (void)setFirstTimeAvailableAsFree:(id)a3
{
  objc_storeStrong((id *)&self->_firstTimeAvailableAsFree, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (unsigned)trackNum
{
  return self->_trackNum;
}

- (void)setTrackNum:(unsigned int)a3
{
  self->_trackNum = a3;
}

- (NSString)uti
{
  return self->_uti;
}

- (void)setUti:(id)a3
{
  objc_storeStrong((id *)&self->_uti, a3);
}

- (NSString)itunesTitle
{
  return self->_itunesTitle;
}

- (void)setItunesTitle:(id)a3
{
  objc_storeStrong((id *)&self->_itunesTitle, a3);
}

- (NSString)itemSummary
{
  return self->_itemSummary;
}

- (void)setItemSummary:(id)a3
{
  objc_storeStrong((id *)&self->_itemSummary, a3);
}

- (NSString)itemSummarySourceElement
{
  return self->_itemSummarySourceElement;
}

- (void)setItemSummarySourceElement:(id)a3
{
  objc_storeStrong((id *)&self->_itemSummarySourceElement, a3);
}

- (int64_t)seasonNumber
{
  return self->_seasonNumber;
}

- (void)setSeasonNumber:(int64_t)a3
{
  self->_seasonNumber = a3;
}

- (int64_t)episodeNumber
{
  return self->_episodeNumber;
}

- (void)setEpisodeNumber:(int64_t)a3
{
  self->_episodeNumber = a3;
}

- (NSString)episodeType
{
  return self->_episodeType;
}

- (void)setEpisodeType:(id)a3
{
  objc_storeStrong((id *)&self->_episodeType, a3);
}

- (NSString)webpageURL
{
  return self->_webpageURL;
}

- (void)setWebpageURL:(id)a3
{
  objc_storeStrong((id *)&self->_webpageURL, a3);
}

- (NSString)episodeStoreId
{
  return self->_episodeStoreId;
}

- (void)setEpisodeStoreId:(id)a3
{
  objc_storeStrong((id *)&self->_episodeStoreId, a3);
}

- (NSString)priceType
{
  return self->_priceType;
}

- (void)setPriceType:(id)a3
{
  objc_storeStrong((id *)&self->_priceType, a3);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSString)enclosureURL
{
  return self->_enclosureURL;
}

- (void)setEnclosureURL:(id)a3
{
  objc_storeStrong((id *)&self->_enclosureURL, a3);
}

- (NSString)entitledPriceType
{
  return self->_entitledPriceType;
}

- (void)setEntitledPriceType:(id)a3
{
  objc_storeStrong((id *)&self->_entitledPriceType, a3);
}

- (double)entitledDuration
{
  return self->_entitledDuration;
}

- (void)setEntitledDuration:(double)a3
{
  self->_entitledDuration = a3;
}

- (NSString)entitledEnclosureURL
{
  return self->_entitledEnclosureURL;
}

- (void)setEntitledEnclosureURL:(id)a3
{
  objc_storeStrong((id *)&self->_entitledEnclosureURL, a3);
}

- (NSString)artworkTemplateURL
{
  return self->_artworkTemplateURL;
}

- (void)setArtworkTemplateURL:(id)a3
{
  objc_storeStrong((id *)&self->_artworkTemplateURL, a3);
}

- (double)artworkWidth
{
  return self->_artworkWidth;
}

- (void)setArtworkWidth:(double)a3
{
  self->_artworkWidth = a3;
}

- (double)artworkHeight
{
  return self->_artworkHeight;
}

- (void)setArtworkHeight:(double)a3
{
  self->_artworkHeight = a3;
}

- (NSString)artworkBackgroundColor
{
  return self->_artworkBackgroundColor;
}

- (void)setArtworkBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_artworkBackgroundColor, a3);
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

- (NSString)freeTranscriptIdentifier
{
  return self->_freeTranscriptIdentifier;
}

- (void)setFreeTranscriptIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_freeTranscriptIdentifier, a3);
}

- (NSString)entitledTranscriptIdentifier
{
  return self->_entitledTranscriptIdentifier;
}

- (void)setEntitledTranscriptIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_entitledTranscriptIdentifier, a3);
}

- (NSString)freeTranscriptSnippet
{
  return self->_freeTranscriptSnippet;
}

- (void)setFreeTranscriptSnippet:(id)a3
{
  objc_storeStrong((id *)&self->_freeTranscriptSnippet, a3);
}

- (NSString)entitledTranscriptSnippet
{
  return self->_entitledTranscriptSnippet;
}

- (void)setEntitledTranscriptSnippet:(id)a3
{
  objc_storeStrong((id *)&self->_entitledTranscriptSnippet, a3);
}

- (NSString)freeTranscriptProvider
{
  return self->_freeTranscriptProvider;
}

- (void)setFreeTranscriptProvider:(id)a3
{
  objc_storeStrong((id *)&self->_freeTranscriptProvider, a3);
}

- (NSString)entitledTranscriptProvider
{
  return self->_entitledTranscriptProvider;
}

- (void)setEntitledTranscriptProvider:(id)a3
{
  objc_storeStrong((id *)&self->_entitledTranscriptProvider, a3);
}

- (BOOL)preferredCategoryFound
{
  return self->_preferredCategoryFound;
}

- (void)setPreferredCategoryFound:(BOOL)a3
{
  self->_preferredCategoryFound = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitledTranscriptProvider, 0);
  objc_storeStrong((id *)&self->_freeTranscriptProvider, 0);
  objc_storeStrong((id *)&self->_entitledTranscriptSnippet, 0);
  objc_storeStrong((id *)&self->_freeTranscriptSnippet, 0);
  objc_storeStrong((id *)&self->_entitledTranscriptIdentifier, 0);
  objc_storeStrong((id *)&self->_freeTranscriptIdentifier, 0);
  objc_storeStrong((id *)&self->_artworkTextQuaternaryColor, 0);
  objc_storeStrong((id *)&self->_artworkTextTertiaryColor, 0);
  objc_storeStrong((id *)&self->_artworkTextSecondaryColor, 0);
  objc_storeStrong((id *)&self->_artworkTextPrimaryColor, 0);
  objc_storeStrong((id *)&self->_artworkBackgroundColor, 0);
  objc_storeStrong((id *)&self->_artworkTemplateURL, 0);
  objc_storeStrong((id *)&self->_entitledEnclosureURL, 0);
  objc_storeStrong((id *)&self->_entitledPriceType, 0);
  objc_storeStrong((id *)&self->_enclosureURL, 0);
  objc_storeStrong((id *)&self->_priceType, 0);
  objc_storeStrong((id *)&self->_episodeStoreId, 0);
  objc_storeStrong((id *)&self->_webpageURL, 0);
  objc_storeStrong((id *)&self->_episodeType, 0);
  objc_storeStrong((id *)&self->_itemSummarySourceElement, 0);
  objc_storeStrong((id *)&self->_itemSummary, 0);
  objc_storeStrong((id *)&self->_itunesTitle, 0);
  objc_storeStrong((id *)&self->_uti, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_firstTimeAvailableAsFree, 0);
  objc_storeStrong((id *)&self->_firstTimeAvailableAsPaid, 0);
  objc_storeStrong((id *)&self->_pubDate, 0);
  objc_storeStrong((id *)&self->_itemDescriptionSourceElement, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_enclosureParameterString, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_author, 0);
}

@end
