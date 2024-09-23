@implementation MTPodcastPlaylistSettings

- (void)setNeedsUpdate:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unsigned int v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings playlist](self, "playlist"));
  v6 = objc_msgSend(v5, "needsUpdate");

  v7 = (unint64_t)-[MTPodcastPlaylistSettings flags](self, "flags");
  if (((((v7 & 2) == 0) ^ v3) & 1) == 0)
  {
    v8 = v3 | v6;
    v9 = 2;
    if (!v3)
      v9 = 0;
    -[MTPodcastPlaylistSettings setFlags:](self, "setFlags:", v7 & 0xFFFFFFFFFFFFFFFDLL | v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings playlist](self, "playlist"));
    objc_msgSend(v10, "setNeedsUpdate:", v8);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings playlistIfDefault](self, "playlistIfDefault"));
    LODWORD(v10) = objc_msgSend(v11, "needsUpdate");

    v12 = (id)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings playlistIfDefault](self, "playlistIfDefault"));
    objc_msgSend(v12, "setNeedsUpdate:", v3 | v10);

  }
}

- (BOOL)needsUpdate
{
  return ((unint64_t)-[MTPodcastPlaylistSettings flags](self, "flags") >> 1) & 1;
}

- (int64_t)integerForEpisodesToShow
{
  int64_t result;
  void *v4;
  void *v5;
  id v6;

  result = (int64_t)-[MTPodcastPlaylistSettings episodesToShow](self, "episodesToShow");
  switch(result)
  {
    case 1:
    case 2:
    case 3:
      return result;
    case 4:
      result = 5;
      break;
    case 5:
      result = 10;
      break;
    case 6:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings playlist](self, "playlist"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "defaultSettings"));
      v6 = objc_msgSend(v5, "integerForEpisodesToShow");

      result = (int64_t)v6;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)predicateForSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings podcast](self, "podcast"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForAllEpisodesOnPodcastUuid:](MTEpisode, "predicateForAllEpisodesOnPodcastUuid:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForExternalType:](MTEpisode, "predicateForExternalType:", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "AND:", v6));

  if ((-[MTPodcastPlaylistSettings showPlayedEpisodes](self, "showPlayedEpisodes") & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForVisuallyPlayed:](MTEpisode, "predicateForVisuallyPlayed:", 0));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "AND:", v8));

    v7 = (void *)v9;
  }
  if ((+[PFRestrictionsUtil isExplicitContentAllowed](PFRestrictionsUtil, "isExplicitContentAllowed") & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings podcast](self, "podcast"));
    v11 = objc_msgSend(v10, "isExplicit");

    if (v11)
    {
      v12 = objc_claimAutoreleasedReturnValue(+[NSPredicate falsePredicate](NSPredicate, "falsePredicate"));
    }
    else
    {
      v13 = objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForExplicit:](MTEpisode, "predicateForExplicit:", 0));
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "AND:", v13));

      v7 = (void *)v13;
    }

    v7 = (void *)v12;
  }
  if (-[MTPodcastPlaylistSettings mediaType](self, "mediaType"))
  {
    v14 = -[MTPodcastPlaylistSettings mediaType](self, "mediaType");
    v15 = (id *)&kEpisodeAudio;
    if (v14 != (id)1)
      v15 = (id *)&kEpisodeVideo;
    v16 = *v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = 1"), v16));
    v34[0] = v17;
    v34[1] = v7;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 2));
    v19 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v18));

    v7 = (void *)v19;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForStationEligibleEpisodes](MTEpisode, "predicateForStationEligibleEpisodes"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "AND:", v20));

  v22 = -[MTPodcastPlaylistSettings downloaded](self, "downloaded");
  if (v22 == 1)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != nil"), kEpisodeAssetURL, v21));
    v32[1] = v23;
    v24 = v32;
    goto LABEL_16;
  }
  if (v22 == 2)
  {
    v33[0] = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = nil"), kEpisodeAssetURL));
    v33[1] = v23;
    v24 = v33;
LABEL_16:
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 2));
    v26 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v25));

    v21 = (void *)v26;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings podcast](self, "podcast"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "uuid"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForAllEpisodesOnPodcastUuid:](MTEpisode, "predicateForAllEpisodesOnPodcastUuid:", v28));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "AND:", v29));

  return v30;
}

- (double)oldestEpisodeDate
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings podcast](self, "podcast"));
  v4 = objc_msgSend(v3, "playbackNewestToOldest");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings episodes](self, "episodes"));
  v6 = v5;
  if (v4)
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
  else
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v8 = (void *)v7;

  objc_msgSend(v8, "firstTimeAvailable");
  v10 = v9;

  return v10;
}

- (double)latestEpisodeDate
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings podcast](self, "podcast"));
  v4 = objc_msgSend(v3, "playbackNewestToOldest");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings episodes](self, "episodes"));
  v6 = v5;
  if (v4)
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  else
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
  v8 = (void *)v7;

  objc_msgSend(v8, "firstTimeAvailable");
  v10 = v9;

  return v10;
}

+ (id)predicateForPlaylistSettingsUuid:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), kPlaylistSettingUuid, a3);
}

+ (id)_shortStringForEpisodes:(int64_t)a3 defaultValue:(int64_t)a4
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _UNKNOWN **v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  switch(a3)
  {
    case 0:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("EPISODE_ALL");
      goto LABEL_5;
    case 1:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("MOST_RECENT_SINGULAR");
LABEL_5:
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1004C6D40, 0));

      return v8;
    case 2:
      v7 = &off_1004D5FB0;
      goto LABEL_10;
    case 3:
      v7 = &off_1004D5F98;
      goto LABEL_10;
    case 4:
      v7 = &off_1004D5F80;
      goto LABEL_10;
    case 5:
      v7 = &off_1004D5F68;
      goto LABEL_10;
    case 6:
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringForEpisodes:short:defaultValue:", a4, 1, 0));
      return v8;
    default:
      v7 = 0;
LABEL_10:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Recent %@"), &stru_1004C6D40, 0));

      v11 = IMAccessibilityLocalizedNumber(v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%@"), 0, v12));

      return v8;
  }
}

+ (id)_longStringForEpisodes:(int64_t)a3 defaultValue:(int64_t)a4
{
  int64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v14;
  void *v15;

  v4 = a3;
  switch(a3)
  {
    case 0:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("All Episodes");
      goto LABEL_5;
    case 1:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("Most recent episode");
LABEL_5:
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1004C6D40, 0));
      goto LABEL_9;
    case 2:
    case 3:
      goto LABEL_8;
    case 4:
      v4 = 5;
      goto LABEL_8;
    case 5:
      v4 = 10;
      goto LABEL_8;
    case 6:
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Default (%@)"), &stru_1004C6D40, 0));

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringForEpisodes:short:defaultValue:", a4, 1, 0));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%@"), 0, v15));

      goto LABEL_10;
    default:
      v4 = 0;
LABEL_8:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("MOST_RECENT_EPISODES"), &stru_1004C6D40, 0));

      v8 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%lu"), 0, v4));
LABEL_9:
      v10 = (void *)v8;
LABEL_10:

      return v10;
  }
}

+ (id)stringForEpisodes:(int64_t)a3 short:(BOOL)a4 defaultValue:(int64_t)a5
{
  void *v5;

  if (a4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_shortStringForEpisodes:defaultValue:", a3, a5));
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_longStringForEpisodes:defaultValue:", a3, a5));
  return v5;
}

+ (id)stringForMedia:(int)a3 short:(BOOL)a4
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;

  switch(a3)
  {
    case 2:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", *(_QWORD *)&a3, a4));
      v6 = v5;
      v7 = CFSTR("Video");
      goto LABEL_7;
    case 1:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", *(_QWORD *)&a3, a4));
      v6 = v5;
      v7 = CFSTR("Audio");
      goto LABEL_7;
    case 0:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", *(_QWORD *)&a3, a4));
      v6 = v5;
      v7 = CFSTR("MEDIA_ALL");
LABEL_7:
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1004C6D40, 0));

      break;
  }
  return v4;
}

+ (id)episodesOptionArray:(BOOL)a3 defaultValue:(int64_t)a4
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[7];

  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringForEpisodes:short:defaultValue:", 6, a3, a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringForEpisodes:short:defaultValue:", 1, v5, a4, v7));
  v16[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringForEpisodes:short:defaultValue:", 2, v5, a4));
  v16[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringForEpisodes:short:defaultValue:", 3, v5, a4));
  v16[3] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringForEpisodes:short:defaultValue:", 4, v5, a4));
  v16[4] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringForEpisodes:short:defaultValue:", 5, v5, a4));
  v16[5] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringForEpisodes:short:defaultValue:", 0, v5, a4));
  v16[6] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 7));

  return v14;
}

+ (id)episodesOptionValues
{
  return +[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", &off_1004D7530);
}

+ (id)mediaOptionArray:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringForMedia:short:", 0, a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringForMedia:short:", 1, v3, v5));
  v10[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringForMedia:short:", 2, v3));
  v10[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 3));

  return v8;
}

+ (id)mediaOptionValues
{
  return +[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", &off_1004D7548);
}

+ (id)insertNewSettingsInManagedObjectContext:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", kMTPodcastPlaylistSettingsEntityName, a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString UUID](NSString, "UUID"));
  objc_msgSend(v3, "setUuid:", v4);

  objc_msgSend(v3, "setEpisodesToShow:", 1);
  objc_msgSend(v3, "setMediaType:", 0);
  objc_msgSend(v3, "setShowPlayedEpisodes:", 0);
  objc_msgSend(v3, "setTracksDefault:", 1);
  objc_msgSend(v3, "setNeedsUpdate:", 1);
  objc_msgSend(v3, "setDownloaded:", 0);
  return v3;
}

- (void)setTracksDefault:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;

  v3 = a3;
  v5 = (unint64_t)-[MTPodcastPlaylistSettings flags](self, "flags");
  if (((((v5 & 1) == 0) ^ v3) & 1) == 0)
    -[MTPodcastPlaylistSettings setFlags:](self, "setFlags:", v5 & 0xFFFFFFFFFFFFFFFELL | v3);
}

- (BOOL)tracksDefault
{
  return -[MTPodcastPlaylistSettings flags](self, "flags") & 1;
}

- (void)takeValuesFromDefaultSettings:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTPodcastPlaylistSettings setMediaType:](self, "setMediaType:", objc_msgSend(v4, "mediaType"));
  v5 = objc_msgSend(v4, "showPlayedEpisodes");

  -[MTPodcastPlaylistSettings setShowPlayedEpisodes:](self, "setShowPlayedEpisodes:", v5);
  -[MTPodcastPlaylistSettings setNeedsUpdate:](self, "setNeedsUpdate:", 1);
}

- (id)metricsContentIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings playlist](self, "playlist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "metricsContentIdentifier"));

  return v3;
}

- (id)metricsAdditionalData
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings metricsKeys](self, "metricsKeys"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings dictionaryWithValuesForKeys:](self, "dictionaryWithValuesForKeys:", v3));
  v7 = CFSTR("settings");
  v8 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));

  return v5;
}

- (id)metricsKeys
{
  _QWORD v3[3];

  v3[0] = kPlaylistSettingEpisodesToShow;
  v3[1] = kPlaylistSettingMediaType;
  v3[2] = kPlaylistSettingShowPlayedEpisodes;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 3));
}

@end
