@implementation BKPreviewAudiobookProducer

- (void)audiobookForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_class(BKAVAudiobookPreviewURLIdentifier);
  v9 = BUDynamicCast(v8, v7);
  v11 = (id)objc_claimAutoreleasedReturnValue(v9);

  if (v11)
  {
    -[BKPreviewAudiobookProducer _previewAudiobookForIdentifier:completion:](self, "_previewAudiobookForIdentifier:completion:", v11, v6);
  }
  else
  {
    v10 = objc_retainBlock(v6);

    if (v10)
      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
    v6 = v10;
  }

}

- (void)_previewAudiobookForIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  BKAVAudiobook *v7;
  void *v8;
  BKAVAudiobook *v9;
  void *v10;
  void *v11;
  BKAVAudiobookTrack *v12;
  void *v13;
  BKAVAudiobookTrack *v14;
  void *v15;
  void *v16;
  BKAVAudiobookChapter *v17;
  double v18;
  Float64 v19;
  void (**v20)(id, id, _QWORD);
  _OWORD v21[3];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  CMTimeRange v25;
  CMTime start;
  CMTime duration;
  CMTimeRange v28;

  v5 = a4;
  v6 = a3;
  v7 = [BKAVAudiobook alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storeID"));
  v9 = -[BKAVAudiobook initWithAssetID:](v7, "initWithAssetID:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  -[BKAVAudiobook setTitle:](v9, "setTitle:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "author"));
  -[BKAVAudiobook setAuthor:](v9, "setAuthor:", v11);

  -[BKAVAudiobook setAudiobookPreview:](v9, "setAudiobookPreview:", 1);
  v12 = [BKAVAudiobookTrack alloc];
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previewURL"));
  v14 = -[BKAVAudiobookTrack initWithAssetURL:](v12, "initWithAssetURL:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  -[BKAVAudiobookTrack setTitle:](v14, "setTitle:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "author"));
  -[BKAVAudiobookTrack setAuthor:](v14, "setAuthor:", v16);

  objc_msgSend(v6, "duration");
  -[BKAVAudiobookTrack setDuration:](v14, "setDuration:");
  -[BKAVAudiobookTrack setAudiobook:](v14, "setAudiobook:", v9);
  v17 = objc_opt_new(BKAVAudiobookChapter);
  objc_msgSend(v6, "duration");
  -[BKAVAudiobookChapter setDuration:](v17, "setDuration:");
  objc_msgSend(v6, "duration");
  v19 = v18;

  CMTimeMakeWithSeconds(&duration, v19, 1000000);
  start = kCMTimeZero;
  CMTimeRangeMake(&v28, &start, &duration);
  v25 = v28;
  -[BKAVAudiobookChapter setTimeRangeInTrack:](v17, "setTimeRangeInTrack:", &v25);
  if (v17)
  {
    -[BKAVAudiobookChapter timeRangeInTrack](v17, "timeRangeInTrack");
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v22 = 0u;
  }
  v21[0] = v22;
  v21[1] = v23;
  v21[2] = v24;
  -[BKAVAudiobookChapter setTimeRangeInAudiobook:](v17, "setTimeRangeInAudiobook:", v21);
  -[BKAVAudiobookChapter setTrack:](v17, "setTrack:", v14);
  -[BKAVAudiobookTrack addChapter:](v14, "addChapter:", v17);
  -[BKAVAudiobook addTrack:](v9, "addTrack:", v14);
  v20 = (void (**)(id, id, _QWORD))objc_retainBlock(v5);

  if (v20)
    v20[2](v20, v9, 0);

}

@end
