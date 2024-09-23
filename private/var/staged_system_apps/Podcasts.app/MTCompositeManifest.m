@implementation MTCompositeManifest

- (id)metricsAdditionalData
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest currentManifest](self, "currentManifest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "metricsAdditionalData"));

  return v3;
}

- (void)_load:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  MTCompositeManifest *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = sub_100012188;
  v5[3] = &unk_1004A63C8;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)MTCompositeManifest;
  v5[0] = _NSConcreteStackBlock;
  v3 = v7;
  -[MTCompositeManifest _load:](&v4, "_load:", v5);

}

- (id)metricsContentIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest currentManifest](self, "currentManifest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "metricsContentIdentifier"));

  return v3;
}

- (void)_setupManifestDefaults
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest userManifest](self, "userManifest"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest userManifest](self, "userManifest"));
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest upNextManifest](self, "upNextManifest"));
  v6 = v5;
  -[MTCompositeManifest setCurrentIndex:](self, "setCurrentIndex:", objc_msgSend(v5, "currentIndex"));

}

- (id)currentItem
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest currentManifest](self, "currentManifest"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest currentManifest](self, "currentManifest"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentItem"));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)activity
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest currentManifest](self, "currentManifest"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest userManifest](self, "userManifest"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activity"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest upNextManifest](self, "upNextManifest"));
    v6 = -[MTCompositeManifest isPlayingFromManifest:](self, "isPlayingFromManifest:", v5);

    if (v6)
    {
      objc_msgSend(v3, "setEligibleForHandoff:", 0);
      objc_msgSend(v3, "setEligibleForSearch:", 0);
      objc_msgSend(v3, "setEligibleForPublicIndexing:", 0);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6));
    objc_msgSend(v3, "setValue:forKey:", v7, CFSTR("MTCompositeManifestIsPlayingFromUpNext"));

  }
  return v3;
}

- (BOOL)isPlayingFromManifest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest currentManifest](self, "currentManifest"));

  return v5 == v4;
}

- (void)setCurrentIndex:(unint64_t)a3
{
  NSObject *v5;
  id v6;
  id v7;
  NSObject *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  unint64_t v23;
  __int16 v24;
  NSObject *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL || -[MTCompositeManifest count](self, "count") <= a3)
  {
    -[MTCompositeManifest setCurrentManifest:](self, "setCurrentManifest:", 0);
    -[MTCompositeManifest notifyCurrentItemDidChange](self, "notifyCurrentItemDidChange");
    v5 = objc_claimAutoreleasedReturnValue(+[IMLogCategory player](IMLogCategory, "player"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v23 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setCurrentIndex: %lu, not found", buf, 0xCu);
    }
  }
  else
  {
    v20 = 0;
    v21 = 0;
    -[MTCompositeManifest _determineManifest:scalledIndex:forIndex:](self, "_determineManifest:scalledIndex:forIndex:", &v20, &v21, a3);
    v5 = v20;
    v6 = -[NSObject currentIndex](v5, "currentIndex");
    -[MTCompositeManifest setCurrentManifest:](self, "setCurrentManifest:", v5);
    v7 = -[NSObject setCurrentIndex:](v5, "setCurrentIndex:", v21);
    if (v21 == v6)
      v7 = -[MTCompositeManifest notifyCurrentItemDidChange](self, "notifyCurrentItemDidChange");
    if ((os_feature_enabled_red_sun(v7) & 1) == 0)
    {
      v8 = objc_claimAutoreleasedReturnValue(-[MTCompositeManifest userManifest](self, "userManifest"));
      v9 = (unint64_t)v21;

      if (v5 == v8 && v9 > (unint64_t)v6)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](MTPlayerController, "defaultInstance"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "player"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "manifest"));
        v13 = objc_msgSend(v12, "isEqual:", self);

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](MTPlayerController, "defaultInstance"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "upNextController"));
          objc_msgSend(v15, "clear");

        }
      }
    }
    v16 = objc_claimAutoreleasedReturnValue(+[IMLogCategory player](IMLogCategory, "player"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v21;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject currentItem](v5, "currentItem"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "title"));
      *(_DWORD *)buf = 134218754;
      v23 = a3;
      v24 = 2112;
      v25 = v5;
      v26 = 2048;
      v27 = v17;
      v28 = 2112;
      v29 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "setCurrentIndex: %lu, manifest: %@ scalled: %lu, item: %@", buf, 0x2Au);

    }
  }

}

- (MTCompositeManifest)initWithUpNextManifest:(id)a3 userManifest:(id)a4 loadQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  MTCompositeManifest *v12;
  MTCompositeManifest *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MTCompositeManifest;
  v12 = -[MTPlayerManifest init](&v18, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_upNextManifest, a3);
    objc_storeStrong((id *)&v13->_userManifest, a4);
    objc_storeStrong((id *)&v13->_loadQueue, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v15 = IMPlayerManifestCurrentItemDidChange;
    objc_msgSend(v14, "addObserver:selector:name:object:", v13, "_currentItemDidChange:", IMPlayerManifestCurrentItemDidChange, v13->_upNextManifest);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v16, "addObserver:selector:name:object:", v13, "_currentItemDidChange:", v15, v13->_userManifest);

  }
  return v13;
}

- (void)_determineManifest:(id *)a3 scalledIndex:(unint64_t *)a4 forIndex:(unint64_t)a5
{
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int64_t v15;
  void *v16;
  char *v17;
  id v18;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest upNextManifest](self, "upNextManifest"));
  v10 = objc_msgSend(v9, "count");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest userManifest](self, "userManifest"));
  v12 = v11;
  if (!v10)
    goto LABEL_11;
  v13 = objc_msgSend(v11, "count");

  if (!v13)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest upNextManifest](self, "upNextManifest"));
LABEL_11:
    *a3 = v11;
    *a4 = a5;
    return;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest userManifest](self, "userManifest"));
  v15 = (int64_t)objc_msgSend(v14, "currentIndex");

  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    v15 = -1;
  if (v15 >= (uint64_t)a5)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest userManifest](self, "userManifest"));
    goto LABEL_11;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest upNextManifest](self, "upNextManifest"));
  v17 = (char *)objc_msgSend(v16, "count") + v15;

  if ((unint64_t)v17 >= a5)
  {
    *a3 = (id)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest upNextManifest](self, "upNextManifest"));
    *a4 = ~v15 + a5;
  }
  else
  {
    *a3 = (id)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest userManifest](self, "userManifest"));
    v18 = (id)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest upNextManifest](self, "upNextManifest"));
    *a4 = a5 - (_QWORD)objc_msgSend(v18, "count");

  }
}

- (unint64_t)currentIndex
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest currentManifest](self, "currentManifest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest upNextManifest](self, "upNextManifest"));

  if (v3 == v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest userManifest](self, "userManifest"));
    v9 = objc_msgSend(v8, "currentIndex");

    if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest userManifest](self, "userManifest"));
      v12 = objc_msgSend(v11, "currentIndex");
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest upNextManifest](self, "upNextManifest"));
      v7 = (char *)objc_msgSend(v13, "currentIndex") + (_QWORD)v12 + 1;

      goto LABEL_9;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest upNextManifest](self, "upNextManifest"));
LABEL_7:
    v11 = v10;
    v7 = (char *)objc_msgSend(v10, "currentIndex");
LABEL_9:

    return (unint64_t)v7;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest currentManifest](self, "currentManifest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest userManifest](self, "userManifest"));

  if (v5 == v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest userManifest](self, "userManifest"));
    goto LABEL_7;
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (MTPlayerManifest)userManifest
{
  return self->_userManifest;
}

- (MTPlayerManifest)currentManifest
{
  return self->_currentManifest;
}

- (MTPlayerManifest)upNextManifest
{
  return self->_upNextManifest;
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  id v4;
  void ***v5;
  void *v6;
  void *v7;
  void **v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t, _BYTE *);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_100042C18;
  v11 = &unk_1004AADD8;
  v4 = a3;
  v12 = v4;
  v13 = &v14;
  v5 = objc_retainBlock(&v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest userManifest](self, "userManifest", v8, v9, v10, v11));
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v5);

  if (!*((_BYTE *)v15 + 24))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest upNextManifest](self, "upNextManifest"));
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v4);

  }
  _Block_object_dispose(&v14, 8);

}

- (unint64_t)count
{
  id v3;

  v3 = -[MTPlayerManifest count](self->_userManifest, "count");
  return (unint64_t)v3 + (_QWORD)-[MTPlayerManifest count](self->_upNextManifest, "count");
}

- (id)objectAtIndex:(unint64_t)a3
{
  id v3;
  void *v4;
  id v6;
  uint64_t v7;

  v6 = 0;
  v7 = 0;
  -[MTCompositeManifest _determineManifest:scalledIndex:forIndex:](self, "_determineManifest:scalledIndex:forIndex:", &v6, &v7, a3);
  v3 = v6;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", v7));

  return v4;
}

- (id)identifier
{
  MTPlayerManifest **p_upNextManifest;
  MTPlayerManifest *upNextManifest;

  p_upNextManifest = &self->_upNextManifest;
  upNextManifest = self->_upNextManifest;
  if (!upNextManifest || !-[MTPlayerManifest count](upNextManifest, "count"))
    p_upNextManifest = &self->_userManifest;
  return (id)objc_claimAutoreleasedReturnValue(-[MTPlayerManifest identifier](*p_upNextManifest, "identifier"));
}

- (void)setCurrentManifest:(id)a3
{
  objc_storeStrong((id *)&self->_currentManifest, a3);
}

- (void)notifyCurrentItemDidChange
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "postNotificationName:object:", IMPlayerManifestCurrentItemDidChange, self);

}

- (OS_dispatch_queue)loadQueue
{
  return self->_loadQueue;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MTCompositeManifest;
  -[MTCompositeManifest dealloc](&v4, "dealloc");
}

- (BOOL)isIndexFromUpNext:(unint64_t)a3
{
  id v4;
  id v5;
  id v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  -[MTCompositeManifest _determineManifest:scalledIndex:forIndex:](self, "_determineManifest:scalledIndex:forIndex:", &v7, &v8, a3);
  v4 = v7;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest upNextManifest](self, "upNextManifest"));

  return v4 == v5;
}

- (BOOL)networkUPPEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest userManifest](self, "userManifest"));
  v3 = objc_msgSend(v2, "networkUPPEnabled");

  return v3;
}

- (unint64_t)determineCompositeIndexWithIndex:(unint64_t)a3 fromManifest:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  unsigned int v11;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest userManifest](self, "userManifest"));
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (!v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest upNextManifest](self, "upNextManifest"));
    v11 = objc_msgSend(v6, "isEqual:", v10);

    if (!v11)
    {
      a3 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_8;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest userManifest](self, "userManifest"));
    a3 += (unint64_t)objc_msgSend(v9, "currentIndex") + 1;
    goto LABEL_6;
  }
  if ((unint64_t)objc_msgSend(v6, "currentIndex") < a3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest upNextManifest](self, "upNextManifest"));
    a3 += (unint64_t)objc_msgSend(v9, "count");
LABEL_6:

  }
LABEL_8:

  return a3;
}

- (void)_currentItemDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest currentManifest](self, "currentManifest"));

  if (!v4)
    -[MTCompositeManifest _setupManifestDefaults](self, "_setupManifestDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "object"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTCompositeManifest currentManifest](self, "currentManifest"));

  if (v5 == v6)
    -[MTCompositeManifest notifyCurrentItemDidChange](self, "notifyCurrentItemDidChange");

}

- (BOOL)isPlayingFromUpNext
{
  return self->_isPlayingFromUpNext;
}

- (void)setUpNextManifest:(id)a3
{
  objc_storeStrong((id *)&self->_upNextManifest, a3);
}

- (void)setUserManifest:(id)a3
{
  objc_storeStrong((id *)&self->_userManifest, a3);
}

- (void)setLoadQueue:(id)a3
{
  objc_storeStrong((id *)&self->_loadQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadQueue, 0);
  objc_storeStrong((id *)&self->_userManifest, 0);
  objc_storeStrong((id *)&self->_upNextManifest, 0);
  objc_storeStrong((id *)&self->_currentManifest, 0);
}

@end
