@implementation AVAsset

- (CGSize)naturalSizeWithPreferredTransforms
{
  CGFloat height;
  CGFloat width;
  void *v4;
  id v5;
  id v6;
  CGFloat x;
  CGFloat y;
  uint64_t v9;
  void *i;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  CGAffineTransform v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  CGSize result;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AVAsset tracksWithMediaType:](self, "tracksWithMediaType:", AVMediaTypeVideo));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "isEnabled", *(_OWORD *)&v18.a, *(_OWORD *)&v18.c, *(_OWORD *)&v18.tx))
        {
          objc_msgSend(v11, "naturalSize");
          v13 = v12;
          v15 = v14;
          if (v11)
            objc_msgSend(v11, "preferredTransform");
          else
            memset(&v18, 0, sizeof(v18));
          v25.origin.x = 0.0;
          v25.origin.y = 0.0;
          v25.size.width = v13;
          v25.size.height = v15;
          v28 = CGRectApplyAffineTransform(v25, &v18);
          v26.origin.x = x;
          v26.origin.y = y;
          v26.size.width = width;
          v26.size.height = height;
          v27 = CGRectUnion(v26, v28);
          x = v27.origin.x;
          y = v27.origin.y;
          width = v27.size.width;
          height = v27.size.height;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  v16 = width;
  v17 = height;
  result.height = v17;
  result.width = v16;
  return result;
}

+ (id)keyPathsForValuesAffectingNaturalSizeWithPreferredTransforms
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("tracks"));
}

+ (id)crl_playableKeysWithKeys:(id)a3
{
  return _objc_msgSend(&off_1000644B0, "crl_arrayByAddingNonContainedObjectsFromArray:", a3);
}

+ (id)crl_codecTypesForProRes
{
  return &off_1000644C8;
}

- (BOOL)crl_isPlayable
{
  return -[AVAsset isPlayable](self, "isPlayable");
}

+ (id)keyPathsForValuesAffectingTsu_isPlayable
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "crl_playableKeysWithKeys:", &__NSArray0__struct));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v2));

  return v3;
}

- (BOOL)p_doesTrack:(id)a3 matchCodecTypes:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  NSNumber *v10;
  void *v11;
  unsigned __int8 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "formatDescriptions", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", CMFormatDescriptionGetMediaSubType(*(CMFormatDescriptionRef *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i)));
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        v12 = objc_msgSend(v5, "containsObject:", v11);

        if ((v12 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v7;
}

- (void)crl_loadValuesAsynchronouslyForKeys:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000C430;
  v10[3] = &unk_1000619A0;
  v11 = a4;
  v12 = a5;
  v8 = v11;
  v9 = v12;
  -[AVAsset loadValuesAsynchronouslyForKeys:completionHandler:](self, "loadValuesAsynchronouslyForKeys:completionHandler:", a3, v10);

}

- (BOOL)crl_containsHDRContent
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AVAsset tracksWithMediaCharacteristic:](self, "tracksWithMediaCharacteristic:", AVMediaCharacteristicContainsHDRVideo));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

+ (id)crl_containsHDRContentKeys
{
  return &off_1000644E0;
}

- (BOOL)crl_containsVideoTracks
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AVAsset crl_firstTrackWithMediaType:](self, "crl_firstTrackWithMediaType:", AVMediaTypeVideo));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)crl_containsAudioTracks
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AVAsset crl_firstTrackWithMediaType:](self, "crl_firstTrackWithMediaType:", AVMediaTypeAudio));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)crl_containsTracksWithVisualCharacteristics
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue(-[AVAsset tracksWithMediaCharacteristic:](self, "tracksWithMediaCharacteristic:", AVMediaCharacteristicVisual));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "isEnabled", (_QWORD)v9) & 1) != 0)
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (id)crl_firstTrackWithMediaType:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[AVAsset tracksWithMediaType:](self, "tracksWithMediaType:", a3));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "isEnabled", (_QWORD)v9))
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)crl_creatorArtistOrAuthor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AVAsset metadata](self, "metadata"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVAsset crl_creatorArtistOrAuthorWithMetadataArray:](AVAsset, "crl_creatorArtistOrAuthorWithMetadataArray:", v2));

  return v3;
}

+ (id)crl_creatorArtistOrAuthorWithMetadataArray:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  _QWORD v18[18];

  v3 = a3;
  v18[0] = AVMetadataCommonIdentifierCreator;
  v18[1] = AVMetadataCommonIdentifierArtist;
  v18[2] = AVMetadataCommonIdentifierAuthor;
  v18[3] = CFSTR("caaf/info-author");
  v18[4] = AVMetadataIdentifierQuickTimeUserDataArtist;
  v18[5] = AVMetadataIdentifierQuickTimeUserDataAuthor;
  v18[6] = AVMetadataIdentifierQuickTimeUserDataComposer;
  v18[7] = AVMetadataIdentifierQuickTimeUserDataDirector;
  v18[8] = AVMetadataIdentifierQuickTimeUserDataOriginalArtist;
  v18[9] = AVMetadataIdentifier3GPUserDataAuthor;
  v18[10] = AVMetadataIdentifier3GPUserDataPerformer;
  v18[11] = AVMetadataIdentifierQuickTimeMetadataAuthor;
  v18[12] = AVMetadataIdentifierQuickTimeMetadataDirector;
  v18[13] = AVMetadataIdentifierQuickTimeMetadataArtist;
  v18[14] = AVMetadataIdentifierQuickTimeMetadataArranger;
  v18[15] = AVMetadataIdentifierQuickTimeMetadataOriginalArtist;
  v18[16] = AVMetadataIdentifierQuickTimeMetadataPerformer;
  v18[17] = AVMetadataIdentifierQuickTimeMetadataComposer;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 18));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v7)
        objc_enumerationMutation(v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[AVMetadataItem metadataItemsFromArray:filteredByIdentifier:](AVMetadataItem, "metadataItemsFromArray:filteredByIdentifier:", v3, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8), (_QWORD)v13));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));

      if (v10)
        break;
      if (v6 == (id)++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));
  return v11;
}

- (id)crl_title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AVAsset metadata](self, "metadata"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVAsset crl_titleWithMetadataArray:](AVAsset, "crl_titleWithMetadataArray:", v2));

  return v3;
}

+ (id)crl_titleWithMetadataArray:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  _QWORD v18[10];

  v3 = a3;
  v18[0] = AVMetadataCommonIdentifierTitle;
  v18[1] = CFSTR("caaf/info-title");
  v18[2] = AVMetadataCommonIdentifierAlbumName;
  v18[3] = CFSTR("caaf/info-parent_title");
  v18[4] = AVMetadataIdentifierQuickTimeUserDataTrackName;
  v18[5] = AVMetadataIdentifier3GPUserDataTitle;
  v18[6] = AVMetadataIdentifier3GPUserDataAlbumAndTrack;
  v18[7] = AVMetadataIdentifierQuickTimeMetadataDisplayName;
  v18[8] = AVMetadataIdentifierQuickTimeMetadataAlbum;
  v18[9] = AVMetadataIdentifierQuickTimeMetadataTitle;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 10));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v7)
        objc_enumerationMutation(v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[AVMetadataItem metadataItemsFromArray:filteredByIdentifier:](AVMetadataItem, "metadataItemsFromArray:filteredByIdentifier:", v3, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8), (_QWORD)v13));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));

      if (v10)
        break;
      if (v6 == (id)++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));
  return v11;
}

@end
