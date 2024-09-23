@implementation PKLibraryPreview

- (PKLibraryPreview)initWithShows:(id)a3 stations:(id)a4
{
  id v6;
  id v7;
  PKLibraryPreview *v8;
  PKLibraryPreview *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKLibraryPreview;
  v8 = -[PKLibraryPreview init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[PKLibraryPreview setShows:](v8, "setShows:", v6);
    -[PKLibraryPreview setStations:](v9, "setStations:", v7);
  }

  return v9;
}

+ (id)readPlistWithPath:(id)a3
{
  id v4;
  PODataSource *v5;
  void *v6;

  v4 = a3;
  v5 = -[PODataSource initWithPlistPath:]([PODataSource alloc], "initWithPlistPath:", v4);

  objc_msgSend(a1, "_readFromPodcastsContainerWithDataSource:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)readFromPodcastsContainer
{
  PODataSource *v3;
  void *v4;

  v3 = objc_alloc_init(PODataSource);
  objc_msgSend(a1, "_readFromPodcastsContainerWithDataSource:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_readFromPodcastsContainerWithDataSource:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  PKShowPreview *v20;
  void *v21;
  void *v22;
  int *v23;
  void *v24;
  PKShowPreview *v25;
  NSObject *v26;
  void *v27;
  PKStationPreview *v28;
  PKStationPreview *v29;
  PKStationPreview *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  PKStationPreview *v47;
  void *v48;
  PKStationPreview *v49;
  NSObject *v50;
  PKStationPreview *v51;
  PKStationPreview *v52;
  PKLibraryPreview *v53;
  void *v54;
  NSObject *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t v70[128];
  uint8_t buf[4];
  PKStationPreview *v72;
  __int16 v73;
  void *v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v60 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v57 = v3;
  objc_msgSend(v3, "podcastCollections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
  v59 = v4;
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v67;
    v8 = &dword_22FB0C000;
    v58 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v67 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          -[NSObject uuid](v11, "uuid");
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12
            && (v13 = (void *)v12,
                -[NSObject uuid](v11, "uuid"),
                v14 = (void *)objc_claimAutoreleasedReturnValue(),
                v15 = objc_msgSend(v14, "length"),
                v14,
                v13,
                v15))
          {
            v16 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend((id)objc_opt_class(), "uriScheme");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject uuid](v11, "uuid");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "stringWithFormat:", CFSTR("%@://device/%@"), v17, v18);
            v19 = objc_claimAutoreleasedReturnValue();

            v20 = [PKShowPreview alloc];
            -[NSObject title](v11, "title");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject storeId](v11, "storeId");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject feedUrl](v11, "feedUrl");
            v23 = v8;
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = -[PKShowPreview initWithTitle:storeId:feedUrl:uuid:](v20, "initWithTitle:storeId:feedUrl:uuid:", v21, v22, v24, v19);

            v8 = v23;
            objc_msgSend(v60, "addObject:", v25);
            _MTLogCategorySiri();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              -[NSObject feedUrl](v11, "feedUrl");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v72 = (PKStationPreview *)v19;
              v73 = 2112;
              v74 = v27;
              _os_log_impl(v23, v26, OS_LOG_TYPE_DEFAULT, "Created library preview for podcast %@ - %@", buf, 0x16u);

            }
            v7 = v58;
            v4 = v59;
          }
          else
          {
            _MTLogCategorySiri();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              -[NSObject feedUrl](v11, "feedUrl");
              v30 = (PKStationPreview *)objc_claimAutoreleasedReturnValue();
              -[NSObject storeId](v11, "storeId");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v72 = v30;
              v73 = 2112;
              v74 = v31;
              _os_log_impl(v8, v19, OS_LOG_TYPE_ERROR, "Library Preview: Cannot create show preview because found nil uuid for podcast: %@ - %@", buf, 0x16u);

            }
          }

        }
        else
        {
          _MTLogCategorySiri();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            v28 = (PKStationPreview *)objc_opt_class();
            *(_DWORD *)buf = 138412290;
            v72 = v28;
            v29 = v28;
            _os_log_impl(v8, v11, OS_LOG_TYPE_ERROR, "Library Preview: Expected podcast to be of type POPodcastCollection but got type of %@", buf, 0xCu);

          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
    }
    while (v6);
  }
  v61 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v57, "podcastStations");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v63;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v63 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v38 = v37;
          -[NSObject uuid](v38, "uuid");
          v39 = objc_claimAutoreleasedReturnValue();
          if (v39
            && (v40 = (void *)v39,
                -[NSObject uuid](v38, "uuid"),
                v41 = (void *)objc_claimAutoreleasedReturnValue(),
                v42 = objc_msgSend(v41, "length"),
                v41,
                v40,
                v42))
          {
            v43 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend((id)objc_opt_class(), "uriScheme");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject uuid](v38, "uuid");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "stringWithFormat:", CFSTR("%@://device/%@"), v44, v45);
            v46 = objc_claimAutoreleasedReturnValue();

            v47 = [PKStationPreview alloc];
            -[NSObject title](v38, "title");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = -[PKStationPreview initWithTitle:uuid:](v47, "initWithTitle:uuid:", v48, v46);

            objc_msgSend(v61, "addObject:", v49);
            _MTLogCategorySiri();
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v72 = (PKStationPreview *)v46;
              _os_log_impl(&dword_22FB0C000, v50, OS_LOG_TYPE_DEFAULT, "Created library preview for station %@", buf, 0xCu);
            }

LABEL_34:
          }
          else
          {
            _MTLogCategorySiri();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              -[NSObject title](v38, "title");
              v49 = (PKStationPreview *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v72 = v49;
              _os_log_impl(&dword_22FB0C000, v46, OS_LOG_TYPE_ERROR, "Library Preview: Cannot create station preview because found nil uuid for station: %@", buf, 0xCu);
              goto LABEL_34;
            }
          }

          goto LABEL_36;
        }
        _MTLogCategorySiri();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v51 = (PKStationPreview *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v72 = v51;
          v52 = v51;
          _os_log_impl(&dword_22FB0C000, v38, OS_LOG_TYPE_ERROR, "Library Preview: Expected station to be of type POPodcastStation but got type of %@", buf, 0xCu);

        }
LABEL_36:

      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    }
    while (v34);
  }
  if (objc_msgSend(v60, "count") || objc_msgSend(v61, "count"))
  {
    v53 = -[PKLibraryPreview initWithShows:stations:]([PKLibraryPreview alloc], "initWithShows:stations:", v60, v61);
    v54 = v59;
  }
  else
  {
    _MTLogCategorySiri();
    v56 = objc_claimAutoreleasedReturnValue();
    v54 = v59;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22FB0C000, v56, OS_LOG_TYPE_DEFAULT, "Library Preview: Not creating Library Preview because there are no podcasts and no stations.", buf, 2u);
    }

    v53 = 0;
  }

  return v53;
}

- (NSArray)shows
{
  return self->_shows;
}

- (void)setShows:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)stations
{
  return self->_stations;
}

- (void)setStations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stations, 0);
  objc_storeStrong((id *)&self->_shows, 0);
}

@end
