@implementation BKAudiobookUtil

+ (id)currentChapterInAudiobook:(id)a3
{
  id v3;
  Float64 v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  CMTime v11;
  CMTimeRange range;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CMTime v17;
  _BYTE v18[128];

  v3 = a3;
  memset(&v17, 0, sizeof(v17));
  objc_msgSend(v3, "bookmarkTime");
  CMTimeMakeWithSeconds(&v17, v4, 1000000000);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "chapters"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (v9)
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "timeRangeInAudiobook");
        else
          memset(&range, 0, sizeof(range));
        v11 = v17;
        if (CMTimeRangeContainsTime(&range, &v11))
        {
          v6 = v9;
          goto LABEL_14;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_14:

  return v6;
}

+ (id)generateShortTimeRemainingStringFromControls:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = BKAudiobooksBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("You\\U2019ve finished this audiobook"), &stru_39448, &stru_39448));
  v8 = BKAudiobooksBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("%@ left"), &stru_39448, &stru_39448));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_generateShortTimeRemainingStringFromControls:finishedString:unfinishedStringFormat:", v4, v7, v10));

  return v11;
}

+ (id)generateShorterTimeRemainingStringFromControls:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = BKAudiobooksBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("You\\U2019ve finished!"), &stru_39448, &stru_39448));
  v8 = BKAudiobooksBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("%@ left"), &stru_39448, &stru_39448));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_generateShortTimeRemainingStringFromControls:finishedString:unfinishedStringFormat:", v4, v7, v10));

  return v11;
}

+ (id)_generateShortTimeRemainingStringFromControls:(id)a3 finishedString:(id)a4 unfinishedStringFormat:(id)a5
{
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  float v12;
  float v13;
  uint64_t *v14;
  void *v15;
  __CFString *v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (qword_44E90 != -1)
    dispatch_once(&qword_44E90, &stru_39018);
  objc_msgSend(v7, "timeRemainingInCurrentAudiobook");
  v11 = v10;
  objc_msgSend(v7, "playbackRate");
  if (v12 > 0.0)
  {
    objc_msgSend(v7, "playbackRate");
    v11 = v11 / v13;
  }
  if (v11 <= 0.0)
  {
    v16 = (__CFString *)v8;
  }
  else
  {
    v14 = &qword_44E80;
    if (v11 < 60.0)
      v14 = &qword_44E88;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)*v14, "stringFromTimeInterval:", v11));
    if (objc_msgSend(v15, "length"))
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v15));
    else
      v16 = &stru_39448;

  }
  return v16;
}

@end
