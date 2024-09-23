@implementation MPMediaItem

+ (id)propertiesForUid
{
  _QWORD v3[3];

  v3[0] = MPMediaItemPropertyPersistentID;
  v3[1] = MPMediaItemPropertyStoreID;
  v3[2] = MPMediaItemPropertySubscriptionStoreItemID;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 3));
}

- (id)uid
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaItem propertiesForUid](MPMediaItem, "propertiesForUid", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v6)
        objc_enumerationMutation(v3);
      v8 = objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7)));
      if (v8)
        break;
      if (v5 == (id)++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyStoreRadioStationID));
    v8 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "hash")));
  }
  v9 = (void *)v8;

  return v9;
}

- (id)replyItemWithAttributeIDs:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[3];

  v4 = a3;
  v14[0] = &__kCFBooleanFalse;
  v13[0] = CFSTR("kIsFolder");
  v13[1] = CFSTR("kUid");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem uid](self, "uid"));
  v14[1] = v5;
  v13[2] = CFSTR("kName");
  v6 = objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyTitle));
  v7 = (void *)v6;
  v8 = &stru_1000195C0;
  if (v6)
    v8 = (const __CFString *)v6;
  v14[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 3));

  if (v4)
  {
    v10 = objc_msgSend(v9, "mutableCopy");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem replyAttributesForIDs:](self, "replyAttributesForIDs:", v4));
    objc_msgSend(v10, "setValue:forKey:", v11, CFSTR("kAttributes"));

    v9 = v10;
  }

  return v9;
}

- (id)replyAttributesForIDs:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000D1CC;
  v9[3] = &unk_100018A78;
  v9[4] = self;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v10 = v5;
  objc_msgSend(v4, "enumerateAttributeIDs:", v9);

  v6 = v10;
  v7 = v5;

  return v7;
}

- (void)setReplyAttributeForID:(unint64_t)a3 inReplyAttributes:(id)a4
{
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  id v15;

  v15 = a4;
  switch(a3)
  {
    case 1uLL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyTitle));
      if (!v6)
        goto LABEL_23;
      v7 = CFSTR("kTitle");
      goto LABEL_16;
    case 2uLL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyArtist));
      if (!v6)
        goto LABEL_23;
      v7 = CFSTR("kArtist");
      goto LABEL_16;
    case 3uLL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyAlbumTitle));
      if (!v6)
        goto LABEL_23;
      v7 = CFSTR("kAlbum");
      goto LABEL_16;
    case 4uLL:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyAlbumTrackNumber));
      v6 = v8;
      if (!v8 || !objc_msgSend(v8, "unsignedIntegerValue"))
        goto LABEL_23;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringValue"));
      v10 = CFSTR("kTrackNumber");
      goto LABEL_19;
    case 5uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyAlbumTrackCount));
      v6 = v11;
      if (!v11 || !objc_msgSend(v11, "unsignedIntegerValue"))
        goto LABEL_23;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringValue"));
      v10 = CFSTR("kTrackCount");
      goto LABEL_19;
    case 6uLL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyGenre));
      if (!v6)
        goto LABEL_23;
      v7 = CFSTR("kGenre");
LABEL_16:
      objc_msgSend(v15, "setValue:forKey:", v6, v7);
      goto LABEL_23;
    case 7uLL:
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyPlaybackDuration));
      v6 = v12;
      if (!v12)
        goto LABEL_23;
      objc_msgSend(v12, "doubleValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), (unint64_t)(v13 * 1000.0)));
      v10 = CFSTR("kPlayingTime");
LABEL_19:
      objc_msgSend(v15, "setValue:forKey:", v9, v10);
      goto LABEL_22;
    case 8uLL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem uid](self, "uid"));
      if (!objc_msgSend(v6, "unsignedIntegerValue"))
        goto LABEL_23;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (unint64_t)objc_msgSend(v6, "unsignedIntegerValue") % 0x989680));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%tu"), objc_msgSend(v9, "unsignedIntegerValue")));
      objc_msgSend(v15, "setValue:forKey:", v14, CFSTR("kImageHandle"));

LABEL_22:
LABEL_23:

LABEL_24:
      return;
    default:
      goto LABEL_24;
  }
}

@end
