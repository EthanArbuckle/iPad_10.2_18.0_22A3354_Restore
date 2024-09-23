@implementation MTUpNextResultsController

- (MTUpNextResultsController)initWithPlayerController:(id)a3
{
  id v4;
  MTUpNextResultsController *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTUpNextResultsController;
  v5 = -[MTManifestResultsController initWithPlayerController:](&v8, "initWithPlayerController:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "upNextManifest"));
    -[MTManifestResultsController setManifest:](v5, "setManifest:", v6);

    -[MTUpNextResultsController setPlayerController:](v5, "setPlayerController:", v4);
  }

  return v5;
}

- (unint64_t)startingIndexForDisplay
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTUpNextResultsController;
  v3 = -[MTManifestResultsController startingIndexForDisplay](&v8, "startingIndexForDisplay");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextResultsController playerController](self, "playerController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "compositeManifest"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTManifestResultsController manifest](self, "manifest"));
  LODWORD(v4) = objc_msgSend(v5, "isPlayingFromManifest:", v6);

  return (unint64_t)v3 + v4;
}

- (MTPlayerController)playerController
{
  return (MTPlayerController *)objc_loadWeakRetained((id *)&self->_playerController);
}

- (void)setPlayerController:(id)a3
{
  objc_storeWeak((id *)&self->_playerController, a3);
}

- (id)title
{
  unint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  v3 = -[MTResultsController numberOfObjects](self, "numberOfObjects");
  v4 = objc_msgSend((id)objc_opt_class(self), "numberFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromNumber:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = v8;
  if (v3 == 1)
    v10 = CFSTR("QUEUE_SONGS_SINGULAR");
  else
    v10 = CFSTR("QUEUE_SONGS_PLURAL");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1004C6D40, 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v7));

  return v12;
}

+ (id)numberFormatter
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)qword_100567568;
  if (!qword_100567568)
  {
    v3 = objc_alloc_init((Class)NSNumberFormatter);
    v4 = (void *)qword_100567568;
    qword_100567568 = (uint64_t)v3;

    objc_msgSend((id)qword_100567568, "setNumberStyle:", 1);
    v5 = (void *)qword_100567568;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    objc_msgSend(v5, "setLocale:", v6);

    objc_msgSend((id)qword_100567568, "setMaximumFractionDigits:", 0);
    v2 = (void *)qword_100567568;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_playerController);
}

@end
