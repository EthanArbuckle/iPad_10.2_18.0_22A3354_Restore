@implementation MTAToneManager

- (MTAToneManager)init
{
  MTAToneManager *v2;
  MTAToneManager *v3;
  TLAlert *alert;
  MTATone *v5;
  MTATone *v6;
  MTATone *stopPlaying;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTAToneManager;
  v2 = -[MTAToneManager init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    alert = v2->_alert;
    v2->_alert = 0;

    v3->_previewAudioVolume = 1.0;
    -[MTAToneManager loadAvailableTones](v3, "loadAvailableTones");
    v5 = [MTATone alloc];
    v6 = -[MTATone initWithIdentifier:](v5, "initWithIdentifier:", TLToneIdentifierNone);
    stopPlaying = v3->_stopPlaying;
    v3->_stopPlaying = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("STOP_PLAYING"), &stru_10009A4D0, 0));
    -[MTATone setToneName:](v3->_stopPlaying, "setToneName:", v9);

  }
  return v3;
}

- (void)loadAvailableTones
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  MTATone *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  uint64_t v23;
  MTATone *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id obj;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TLToneManager sharedToneManager](TLToneManager, "sharedToneManager"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/ToneKit.framework")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "URLForResource:withExtension:", CFSTR("TKRingtones-EncoreInfinitum"), CFSTR("plist")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:](NSDictionary, "dictionaryWithContentsOfURL:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TLToneManager sharedToneManager](TLToneManager, "sharedToneManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "defaultToneIdentifierForAlertType:", 13));

  v28 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modern")));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v7, "count")));
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        v13 = -[MTATone initWithIdentifier:]([MTATone alloc], "initWithIdentifier:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "nameForToneIdentifier:", v12));
        -[MTATone setToneName:](v13, "setToneName:", v14);

        -[MTATone setDefaultTone:](v13, "setDefaultTone:", objc_msgSend(v6, "isEqualToString:", v12));
        objc_msgSend(v31, "addObject:", v13);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v9);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "sortedArrayUsingComparator:", &stru_100099420));
  -[MTAToneManager setModernTones:](self, "setModernTones:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("classic")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v16, "count")));
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v18 = v16;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(_QWORD *)v33 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)j);
        v24 = -[MTATone initWithIdentifier:]([MTATone alloc], "initWithIdentifier:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "nameForToneIdentifier:", v23));
        -[MTATone setToneName:](v24, "setToneName:", v25);

        -[MTATone setDefaultTone:](v24, "setDefaultTone:", objc_msgSend(v6, "isEqualToString:", v23));
        objc_msgSend(v17, "addObject:", v24);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v20);
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sortedArrayUsingComparator:", &stru_100099420));
  -[MTAToneManager setClassicTones:](self, "setClassicTones:", v26);

}

+ (MTAToneManager)sharedManager
{
  if (qword_1000BFB68 != -1)
    dispatch_once(&qword_1000BFB68, &stru_100099460);
  return (MTAToneManager *)(id)qword_1000BFB60;
}

- (BOOL)isPlayingTone
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTAToneManager alert](self, "alert"));
  v3 = v2 != 0;

  return v3;
}

- (void)previewTone:(id)a3 forType:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAToneManager alert](self, "alert"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "toneIdentifier"));
  v9 = objc_msgSend(v8, "isEqualToString:", v6);

  if (v9)
  {
    -[MTAToneManager stopPreviewingTone](self, "stopPreviewingTone");
  }
  else
  {
    v10 = objc_msgSend(objc_alloc((Class)TLAlertConfiguration), "initWithType:", a4);
    objc_msgSend(v10, "setToneIdentifier:", v6);
    -[MTAToneManager previewAudioVolume](self, "previewAudioVolume");
    objc_msgSend(v10, "setAudioVolume:");
    objc_msgSend(v10, "setForPreview:", 1);
    objc_msgSend(v10, "setShouldRepeat:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAToneManager alert](self, "alert"));
    objc_msgSend(v11, "stop");

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TLAlert alertWithConfiguration:](TLAlert, "alertWithConfiguration:", v10));
    -[MTAToneManager setAlert:](self, "setAlert:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAToneManager alert](self, "alert"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000151B4;
    v14[3] = &unk_100099488;
    v14[4] = self;
    objc_msgSend(v13, "playWithCompletionHandler:", v14);

  }
}

- (void)stopPreviewingTone
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAToneManager alert](self, "alert"));
  objc_msgSend(v3, "stop");

  -[MTAToneManager setAlert:](self, "setAlert:", 0);
}

- (NSArray)modernTones
{
  return self->_modernTones;
}

- (void)setModernTones:(id)a3
{
  objc_storeStrong((id *)&self->_modernTones, a3);
}

- (NSArray)classicTones
{
  return self->_classicTones;
}

- (void)setClassicTones:(id)a3
{
  objc_storeStrong((id *)&self->_classicTones, a3);
}

- (MTATone)stopPlaying
{
  return self->_stopPlaying;
}

- (NSString)selectedToneIdentifier
{
  return self->_selectedToneIdentifier;
}

- (void)setSelectedToneIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (float)previewAudioVolume
{
  return self->_previewAudioVolume;
}

- (void)setPreviewAudioVolume:(float)a3
{
  self->_previewAudioVolume = a3;
}

- (TLAlert)alert
{
  return self->_alert;
}

- (void)setAlert:(id)a3
{
  objc_storeStrong((id *)&self->_alert, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong((id *)&self->_selectedToneIdentifier, 0);
  objc_storeStrong((id *)&self->_stopPlaying, 0);
  objc_storeStrong((id *)&self->_classicTones, 0);
  objc_storeStrong((id *)&self->_modernTones, 0);
}

@end
