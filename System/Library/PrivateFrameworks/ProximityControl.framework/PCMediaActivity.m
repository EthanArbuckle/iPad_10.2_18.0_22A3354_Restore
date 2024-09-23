@implementation PCMediaActivity

- (PCMediaActivity)initWithDisplayContext:(id)a3 response:(id)a4
{
  id v6;
  id v7;
  PCMediaActivity *v8;
  PCMediaActivity *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PCMediaActivity;
  v8 = -[PCMediaActivity initWithActivityType:](&v16, sel_initWithActivityType_, CFSTR("com.apple.ProximityControl.activity.media"));
  v9 = v8;
  if (v8)
  {
    makeIneligibleForProcessing(v8);
    objc_msgSend(v7, "playbackQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentItemWithOffset:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PCMediaActivity titleForContentItem:](PCMediaActivity, "titleForContentItem:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCMediaActivity setTitle:](v9, "setTitle:", v12);

    +[PCMediaActivity userActivityInfoFor:inContext:](PCMediaActivity, "userActivityInfoFor:inContext:", v7, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    -[PCMediaActivity setUserInfo:](v9, "setUserInfo:", v14);

  }
  return v9;
}

+ (id)userActivityInfoFor:(id)a3 inContext:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
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
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v5, "playbackQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "contentItemWithOffset:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = objc_msgSend(v5, "playbackState");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v12, CFSTR("playbackState"));

      objc_msgSend(v5, "destination");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "origin");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14 != 0;

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v16, CFSTR("destinationOriginExists"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "interactionDirection"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v17, CFSTR("mediaDirection"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "interactionBehavior"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v18, CFSTR("mediaBehavior"));

      objc_msgSend(v10, "artwork");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "imageData");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
        objc_msgSend(v7, "setObject:forKey:", v20, CFSTR("artworkKey"));

      objc_msgSend(v10, "metadata");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "userInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
        objc_msgSend(v7, "setObject:forKey:", v22, CFSTR("metadataKey"));

      objc_msgSend(v5, "playerPath");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "client");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "bundleIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
        objc_msgSend(v7, "setObject:forKey:", v25, CFSTR("bundleIdentifierKey"));

      objc_msgSend(v10, "metadata");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "title");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
        objc_msgSend(v7, "setObject:forKey:", v27, CFSTR("mediaTitle"));

      objc_msgSend(v10, "metadata");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "mediaType");

      if (v29)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v30, CFSTR("mediaType"));

      }
      v31 = (void *)objc_msgSend(v7, "copy");
    }
    else
    {
      v31 = 0;
    }

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

+ (id)titleForContentItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trackArtistName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      objc_msgSend(v7, "trackArtistName");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v7, "albumArtistName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "metadata");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v12;
      if (v11)
      {
        objc_msgSend(v12, "albumArtistName");
        v9 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v12, "radioStationName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
          goto LABEL_11;
        objc_msgSend(v4, "metadata");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "radioStationName");
        v9 = objc_claimAutoreleasedReturnValue();
      }
    }
    v14 = (void *)v9;

    if (v14)
    {
      +[PCLocalizedString localizedStringForKey:](PCLocalizedString, "localizedStringForKey:", 6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v4, "metadata");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedTitle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@%@%@"), v18, v15, v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
      goto LABEL_13;
    }
LABEL_11:
    objc_msgSend(v4, "metadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  +[PCLocalizedString localizedStringForKey:](PCLocalizedString, "localizedStringForKey:", 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v10;
}

- (PCMediaActivity)initWithActivity:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  PCMediaActivity *v8;
  void *v9;
  void *v10;
  PCMediaActivity *v11;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(CFSTR("com.apple.ProximityControl.activity.media"), "isEqualToString:", v5);

  if (v6)
  {
    objc_msgSend(v4, "activityType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13.receiver = self;
    v13.super_class = (Class)PCMediaActivity;
    v8 = -[PCMediaActivity initWithActivityType:](&v13, sel_initWithActivityType_, v7);

    if (v8)
    {
      makeIneligibleForProcessing(v8);
      objc_msgSend(v4, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCMediaActivity setUserInfo:](v8, "setUserInfo:", v9);

      objc_msgSend(v4, "title");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCMediaActivity setTitle:](v8, "setTitle:", v10);

    }
    self = v8;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  void *v3;

  -[PCMediaActivity title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[PCMediaActivity title](self, "title");
  else
    +[PCLocalizedString localizedStringForKey:](PCLocalizedString, "localizedStringForKey:", 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)pcactivityType
{
  return 1;
}

- (id)activityString
{
  uint64_t v2;

  if (-[PCMediaActivity playbackState](self, "playbackState") == 1)
    v2 = 8;
  else
    v2 = 9;
  +[PCLocalizedString localizedStringForKey:](PCLocalizedString, "localizedStringForKey:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)bundleIdentifier
{
  void *v2;
  void *v3;
  __CFString *v4;

  -[PCMediaActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("bundleIdentifierKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = v3;
  else
    v4 = CFSTR("unknown");

  return v4;
}

- (id)artWork
{
  void *v2;
  void *v3;
  void *v4;

  -[PCMediaActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("artworkKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithData:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)direction
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PCMediaActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("mediaDirection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (int64_t)behavior
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PCMediaActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("mediaBehavior"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (unsigned)playbackState
{
  void *v2;
  void *v3;
  unsigned int v4;

  -[PCMediaActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("playbackState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)destinationOriginExists
{
  void *v2;
  void *v3;
  char v4;

  -[PCMediaActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("destinationOriginExists"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (int64_t)mediaType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PCMediaActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("mediaType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (id)shortDescription
{
  void *v2;
  void *v3;

  -[PCMediaActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("mediaTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  int64_t v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  char v19;

  v4 = a3;
  v5 = objc_msgSend(v4, "pcactivityType");
  if (v5 == -[PCMediaActivity pcactivityType](self, "pcactivityType"))
  {
    v6 = v4;
    -[PCMediaActivity description](self, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if (v9
      && (v10 = -[PCMediaActivity direction](self, "direction"), v10 == objc_msgSend(v6, "direction"))
      && (v11 = -[PCMediaActivity playbackState](self, "playbackState"),
          v11 == objc_msgSend(v6, "playbackState")))
    {
      -[PCMediaActivity userInfo](self, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", CFSTR("artworkKey"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", CFSTR("artworkKey"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v13;
      v17 = v15;
      v18 = v17;
      if (v16 == v17)
      {
        v19 = 1;
      }
      else if ((v16 == 0) == (v17 != 0))
      {
        v19 = 0;
      }
      else
      {
        v19 = objc_msgSend(v16, "isEqual:", v17);
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

@end
