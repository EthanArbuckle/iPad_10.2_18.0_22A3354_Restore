@implementation BKMLAudiobookProducer

- (BKMLAudiobookProducer)initWithStoreDemoMode:(BOOL)a3
{
  BKMLAudiobookProducer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKMLAudiobookProducer;
  result = -[BKMLAudiobookProducer init](&v5, "init");
  if (result)
    result->_storeDemoMode = a3;
  return result;
}

- (void)audiobookForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BKMLAudiobook *v18;
  void *v19;
  char *v20;
  void *v21;
  char *i;
  void *v23;
  BKAudiobookSupplementalContent *v24;
  NSMutableArray *v25;
  char *v26;
  char *v27;
  char *v28;
  uint64_t v29;
  double v30;
  BKMLAudiobookTrack *v31;
  void *v32;
  BKMLAudiobookTrack *v33;
  double v34;
  void *v35;
  void *v36;
  const __CFString **v37;
  NSErrorUserInfoKey *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  unsigned int v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  NSErrorUserInfoKey v52;
  const __CFString *v53;
  NSErrorUserInfoKey v54;
  const __CFString *v55;
  NSErrorUserInfoKey v56;
  const __CFString *v57;
  NSErrorUserInfoKey v58;
  void *v59;
  NSErrorUserInfoKey v60;
  void *v61;

  v6 = a3;
  v7 = a4;
  v8 = -[BKMLAudiobookProducer isStoreDemoMode](self, "isStoreDemoMode");
  v9 = objc_opt_class(BKMLAudiobookIdentifier);
  v10 = BUDynamicCast(v9, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (objc_msgSend(v11, "isValid"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "audiobookQuery"));
    v13 = v12;
    if (v12)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "collections"));
      if (objc_msgSend(v14, "count"))
      {
        v51 = v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", 0));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "items"));

        v17 = v16;
        if (objc_msgSend(v16, "count"))
        {
          v46 = v8;
          v47 = v13;
          v49 = v7;
          v50 = v6;
          v18 = objc_alloc_init(BKMLAudiobook);
          v48 = v11;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "supplementalAssetIdentifiers"));
          v20 = (char *)objc_msgSend(v19, "count");
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v20));
          if (v20)
          {
            for (i = 0; i != v20; ++i)
            {
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", i));
              v24 = -[BKAudiobookSupplementalContent initWithTitle:assetIdentifier:]([BKAudiobookSupplementalContent alloc], "initWithTitle:assetIdentifier:", &stru_39448, v23);
              objc_msgSend(v21, "addObject:", v24);

            }
          }
          -[BKMLAudiobook setSupplementalContents:](v18, "setSupplementalContents:", v21);
          v25 = objc_opt_new(NSMutableArray);
          v26 = (char *)objc_msgSend(v17, "count");
          if (v26)
          {
            v27 = v26;
            v28 = 0;
            v29 = 0;
            v30 = 0.0;
            do
            {
              v31 = [BKMLAudiobookTrack alloc];
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v28));
              v33 = -[BKMLAudiobookTrack initWithAudiobook:mediaItem:startTime:startChapterNumber:trackNumber:trackCount:storeDemoMode:](v31, "initWithAudiobook:mediaItem:startTime:startChapterNumber:trackNumber:trackCount:storeDemoMode:", v18, v32, v29, v28, v27, v46, v30);

              -[NSMutableArray addObject:](v25, "addObject:", v33);
              -[BKMLAudiobookTrack duration](v33, "duration");
              v30 = v30 + v34;
              v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookTrack chapters](v33, "chapters"));
              v29 += (uint64_t)objc_msgSend(v35, "count");

              ++v28;
            }
            while (v27 != v28);
          }
          -[BKMLAudiobook addTracks:](v18, "addTracks:", v25);

          v36 = 0;
          v7 = v49;
          v6 = v50;
          v13 = v47;
          v11 = v48;
        }
        else
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No media items found for %@"), v11));
          v60 = NSLocalizedDescriptionKey;
          v61 = v42;
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1));
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BKAudiobooksError"), 0, v43));

          v18 = 0;
        }
        v14 = v51;
      }
      else
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "persistentID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No albums found for %@"), v39));

        v58 = NSLocalizedDescriptionKey;
        v59 = v17;
        v40 = v6;
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1));
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BKAudiobooksError"), 0, v41));

        v6 = v40;
        v18 = 0;
      }

    }
    else
    {
      v56 = NSLocalizedDescriptionKey;
      v57 = CFSTR("Query creation failed");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1));
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BKAudiobooksError"), 0, v14));
      v18 = 0;
    }

  }
  else
  {
    if (v11)
    {
      v54 = NSLocalizedDescriptionKey;
      v55 = CFSTR("Audiobook identifier has no persistentID nor assetID");
      v37 = &v55;
      v38 = &v54;
    }
    else
    {
      v52 = NSLocalizedDescriptionKey;
      v53 = CFSTR("Audiobook identifier is not instance of BKMLAudiobookIdentifier");
      v37 = &v53;
      v38 = &v52;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v38, 1));
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BKAudiobooksError"), 0, v13));
    v18 = 0;
  }

  v44 = objc_retainBlock(v7);
  v45 = v44;
  if (v44)
    (*((void (**)(id, BKMLAudiobook *, void *))v44 + 2))(v44, v18, v36);

}

- (BOOL)isStoreDemoMode
{
  return self->_storeDemoMode;
}

@end
