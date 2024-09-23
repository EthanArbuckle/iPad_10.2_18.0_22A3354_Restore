@implementation IntentHandler

- (void)handlePlayMedia:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler _playbackRequestURLForIntent:](self, "_playbackRequestURLForIntent:", v6));
  if (objc_msgSend(v8, "length"))
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10011AA1C;
    v13[3] = &unk_1004ABD60;
    v13[4] = self;
    v14 = v7;
    +[MTExtensionPlaybackController setQueueWithPlaybackRequestIdentifier:mrCompletion:](MTExtensionPlaybackController, "setQueueWithPlaybackRequestIdentifier:mrCompletion:", v8, v13);
    v9 = v14;
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    v10 = _MTLogCategorySiri(0);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mediaContainer"));
      *(_DWORD *)buf = 134217984;
      v16 = objc_msgSend(v12, "type");
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Siri Actions failed to play media.  Unhandled media container type: %lu", buf, 0xCu);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler _responseForCode:](self, "_responseForCode:", 6));
    (*((void (**)(id, void *))v7 + 2))(v7, v9);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)confirmPlayMedia:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  MTExtensionPlaybackController *v9;
  MTExtensionPlaybackController *playbackController;
  void *v11;
  void *v12;
  MTExtensionPlaybackController *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  if (!os_feature_enabled_bluemoon(v7))
  {
    if (!self->_playbackController)
    {
      v9 = objc_alloc_init(MTExtensionPlaybackController);
      playbackController = self->_playbackController;
      self->_playbackController = v9;

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mediaContainer"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));

    if (objc_msgSend(v8, "length"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler _playbackRequestURLForIntent:](self, "_playbackRequestURLForIntent:", v6));
      v13 = self->_playbackController;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10011AC10;
      v15[3] = &unk_1004ABD88;
      v15[4] = self;
      v16 = v6;
      v17 = v12;
      v18 = v7;
      v14 = v12;
      -[MTExtensionPlaybackController populateMagicMomentInfoCenterWithPlaybackRequestIdentifier:mrCompletion:](v13, "populateMagicMomentInfoCenterWithPlaybackRequestIdentifier:mrCompletion:", v14, v15);

    }
    else
    {
      if (!v7)
        goto LABEL_10;
      v14 = (id)objc_claimAutoreleasedReturnValue(-[IntentHandler _responseForCode:](self, "_responseForCode:", 6));
      (*((void (**)(id, id))v7 + 2))(v7, v14);
    }

    goto LABEL_10;
  }
  v8 = objc_msgSend(objc_alloc((Class)INPlayMediaIntentResponse), "initWithCode:userActivity:", 1, 0);
  (*((void (**)(id, id))v7 + 2))(v7, v8);
LABEL_10:

}

- (id)_playbackRequestURLForIntent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MTURLCommandRequest *v9;
  unint64_t v10;
  id v11;
  MTURLCommandRequest *v12;
  unint64_t v13;
  void *v14;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mediaContainer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mediaItems"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));

  v9 = -[MTURLCommandRequest initWithURLString:]([MTURLCommandRequest alloc], "initWithURLString:", v8);
  v10 = -[MTURLCommandRequest playQueueType](v9, "playQueueType");

  if (v10)
  {
    v11 = v8;
LABEL_5:
    v14 = v11;
    goto LABEL_6;
  }
  v12 = -[MTURLCommandRequest initWithURLString:]([MTURLCommandRequest alloc], "initWithURLString:", v5);
  v13 = -[MTURLCommandRequest playQueueType](v12, "playQueueType");

  if (v13)
  {
    v11 = v5;
    goto LABEL_5;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mediaContainer"));
  v17 = objc_msgSend(v16, "type");

  if (v17 == (id)6)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance"));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localPlaybackQueueIdentifierForPodcastUuid:episodeUuid:sampPlaybackOrder:", v5, v8, SAMPEpisodePlaybackOrderAPPLICATION_DEFAULTValue));
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mediaContainer"));
    v21 = objc_msgSend(v20, "type");

    if (v21 != (id)8)
    {
      v14 = 0;
      goto LABEL_6;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance"));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localPlaybackQueueIdentifierForStationUuid:episodeUuid:", v5, v8));
  }
  v14 = (void *)v19;

LABEL_6:
  return v14;
}

- (BOOL)_intentWantsPlaybackQueueIncludedInNowPlayingInfo:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "mediaContainer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  v5 = objc_msgSend(v4, "containsString:", CFSTR("&includePlaybackQueue=true"));

  return v5;
}

- (id)_responseForMediaRemoteStatus:(unsigned int)a3 error:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 4;
  v5 = 10;
  v6 = 6;
  if (a3 == 1)
    v6 = 9;
  if (a3 != 10)
    v5 = v6;
  if (a3)
    v4 = v5;
  if (a4)
    v7 = 6;
  else
    v7 = v4;
  return (id)objc_claimAutoreleasedReturnValue(-[IntentHandler _responseForCode:](self, "_responseForCode:", v7));
}

- (id)_responseForCode:(int64_t)a3
{
  return objc_msgSend(objc_alloc((Class)INPlayMediaIntentResponse), "initWithCode:userActivity:", a3, 0);
}

- (MTExtensionPlaybackController)playbackController
{
  return self->_playbackController;
}

- (void)setPlaybackController:(id)a3
{
  objc_storeStrong((id *)&self->_playbackController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackController, 0);
}

@end
