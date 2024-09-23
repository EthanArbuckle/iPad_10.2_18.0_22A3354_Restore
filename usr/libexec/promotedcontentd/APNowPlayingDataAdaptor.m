@implementation APNowPlayingDataAdaptor

+ (id)identifier
{
  return CFSTR("com.apple.ap.nowplaying");
}

- (BOOL)_validateParameters:(id *)a3
{
  void *v3;
  void *v4;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  unsigned int v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)APNowPlayingDataAdaptor;
  if (!-[APBiomeDataAdaptor _validateParameters:](&v22, "_validateParameters:"))
    return 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("artist")));
  v9 = -[APDataAdaptor _checkClassType:name:expectedClass:error:](self, "_checkClassType:name:expectedClass:error:", v8, CFSTR("artist"), objc_opt_class(NSString), a3);
  if ((v9 & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("genre")));
    if (!-[APDataAdaptor _checkClassType:name:expectedClass:error:](self, "_checkClassType:name:expectedClass:error:", v4, CFSTR("genre"), objc_opt_class(NSString), a3))
    {

      v13 = 0;
      goto LABEL_10;
    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("minCount")));
  v12 = -[APDataAdaptor _checkClassType:name:expectedClass:error:](self, "_checkClassType:name:expectedClass:error:", v11, CFSTR("minCount"), objc_opt_class(NSNumber), a3);

  if ((v9 & 1) == 0)
  {

    if ((v12 & 1) == 0)
      return 0;
    goto LABEL_8;
  }

  if (v12)
  {
LABEL_8:
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("artist")));
    -[APNowPlayingDataAdaptor setArtist:](self, "setArtist:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("genre")));
    -[APNowPlayingDataAdaptor setGenre:](self, "setGenre:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("minCount")));
    -[APNowPlayingDataAdaptor setMinCount:](self, "setMinCount:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[APNowPlayingDataAdaptor setFoundArtists:](self, "setFoundArtists:", v20);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[APNowPlayingDataAdaptor setFoundGenres:](self, "setFoundGenres:", v7);
    v13 = 1;
LABEL_10:

    return v13;
  }
  return 0;
}

- (id)_biomeStream
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = BiomeLibrary(self, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "Media"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "NowPlaying"));

  return v5;
}

- (id)calculateResultFromEvents
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  char v7;
  uint64_t v8;
  void *i;
  int v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  int v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APNowPlayingDataAdaptor foundArtists](self, "foundArtists"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v4);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i), "intValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[APNowPlayingDataAdaptor minCount](self, "minCount"));
        v7 |= v10 > (int)objc_msgSend(v11, "intValue");

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v6);

    if ((v7 & 1) != 0)
    {
      v12 = 1;
      return (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v12 & 1));
    }
  }
  else
  {

  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[APNowPlayingDataAdaptor foundGenres](self, "foundGenres", 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allValues"));

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v15)
  {
    v16 = v15;
    v12 = 0;
    v17 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)j), "intValue");
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[APNowPlayingDataAdaptor minCount](self, "minCount"));
        v12 |= v19 > (int)objc_msgSend(v20, "intValue");

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v16);
  }
  else
  {
    v12 = 0;
  }

  return (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v12 & 1));
}

- (void)eventReceived:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD block[4];
  id v23;

  v21 = a3;
  v4 = objc_opt_class(BMStoreEvent);
  if ((objc_opt_isKindOfClass(v21, v4) & 1) != 0
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "eventBody")),
        v6 = objc_opt_class(BMMediaNowPlaying),
        isKindOfClass = objc_opt_isKindOfClass(v5, v6),
        v5,
        (isKindOfClass & 1) != 0))
  {
    v8 = v21;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "eventBody"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "artist"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[APNowPlayingDataAdaptor artist](self, "artist"));
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[APNowPlayingDataAdaptor foundArtists](self, "foundArtists"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[APNowPlayingDataAdaptor artist](self, "artist"));
      -[APNowPlayingDataAdaptor _incrementCount:forKey:](self, "_incrementCount:forKey:", v13, v14);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "eventBody", v21));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "genre"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[APNowPlayingDataAdaptor genre](self, "genre"));
    v18 = objc_msgSend(v16, "isEqualToString:", v17);

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[APNowPlayingDataAdaptor foundGenres](self, "foundGenres"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[APNowPlayingDataAdaptor genre](self, "genre"));
      -[APNowPlayingDataAdaptor _incrementCount:forKey:](self, "_incrementCount:forKey:", v19, v20);

    }
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100088C84;
    block[3] = &unk_100212FE0;
    v23 = v21;
    if (qword_100268758 != -1)
      dispatch_once(&qword_100268758, block);
    v8 = v23;
  }

}

- (void)_incrementCount:(id)a3 forKey:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v5));
  if (!v6)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
    objc_msgSend(v8, "setObject:forKey:", v6, v5);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v6, "intValue") + 1));

  objc_msgSend(v8, "setObject:forKey:", v7, v5);
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
  objc_storeStrong((id *)&self->_artist, a3);
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
  objc_storeStrong((id *)&self->_genre, a3);
}

- (NSNumber)minCount
{
  return self->_minCount;
}

- (void)setMinCount:(id)a3
{
  objc_storeStrong((id *)&self->_minCount, a3);
}

- (NSMutableDictionary)foundArtists
{
  return self->_foundArtists;
}

- (void)setFoundArtists:(id)a3
{
  objc_storeStrong((id *)&self->_foundArtists, a3);
}

- (NSMutableDictionary)foundGenres
{
  return self->_foundGenres;
}

- (void)setFoundGenres:(id)a3
{
  objc_storeStrong((id *)&self->_foundGenres, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foundGenres, 0);
  objc_storeStrong((id *)&self->_foundArtists, 0);
  objc_storeStrong((id *)&self->_minCount, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_artist, 0);
}

@end
