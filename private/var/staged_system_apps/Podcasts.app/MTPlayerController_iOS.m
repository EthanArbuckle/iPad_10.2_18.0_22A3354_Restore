@implementation MTPlayerController_iOS

- (NSString)volumeAudioCategory
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController_iOS volumeController](self, "volumeController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "volumeAudioCategory"));

  return (NSString *)v3;
}

- (MPVolumeController)volumeController
{
  return self->_volumeController;
}

- (MTPlayerController_iOS)init
{
  MTPlayerController_iOS *v2;
  MTPlayerController_iOS *v3;
  MTPlayerController_iOS *v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  _QWORD v8[4];
  MTPlayerController_iOS *v9;
  _QWORD v10[4];
  MTPlayerController_iOS *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTPlayerController_iOS;
  v2 = -[MTPlayerController init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000092E8;
    v10[3] = &unk_1004A6200;
    v4 = v2;
    v11 = v4;
    +[IMAVPlayer performOnMainQueue:](IMAVPlayer, "performOnMainQueue:", v10);
    global_queue = dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue(global_queue);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100004C98;
    v8[3] = &unk_1004A6200;
    v9 = v4;
    dispatch_async(v6, v8);

  }
  return v3;
}

- (void)setVolumeController:(id)a3
{
  objc_storeStrong((id *)&self->_volumeController, a3);
}

+ (void)setDefaultInstance:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MTPlayerController_iOS;
  objc_msgSendSuper2(&v4, "setDefaultInstance:", a3);
  v3 = +[MTAppShortcutManager sharedInstance](MTAppShortcutManager, "sharedInstance");
}

- (BOOL)shouldPresentNowPlayingForItem:(id)a3 presentationType:(unint64_t)a4
{
  id v6;
  unsigned int v7;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTPlayerController_iOS;
  if (-[MTPlayerController shouldPresentNowPlayingForItem:presentationType:](&v9, "shouldPresentNowPlayingForItem:presentationType:", v6, a4))
  {
    v7 = objc_msgSend(v6, "isVideo") ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)dismissNowPlayingAnimated:(BOOL)a3
{
  -[MTPlayerController_iOS dismissNowPlayingAnimated:completion:](self, "dismissNowPlayingAnimated:completion:", a3, 0);
}

- (void)dismissNowPlayingAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void (**v8)(void);

  v4 = a3;
  v8 = (void (**)(void))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController_iOS _nowPlayingRootViewController](self, "_nowPlayingRootViewController"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController_iOS _nowPlayingRootViewController](self, "_nowPlayingRootViewController"));
    objc_msgSend(v7, "dismissNowPlayingWithAnimated:completion:", v4, v8);

  }
  else if (v8)
  {
    v8[2]();
  }

}

- (void)presentNowPlayingAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerController_iOS _nowPlayingRootViewController](self, "_nowPlayingRootViewController"));
  objc_msgSend(v4, "presentNowPlayingWithAnimated:completion:", v3, 0);

}

- (BOOL)isTargetPlaying
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PodcastsPlayerAdapter sharedInstance](_TtC8Podcasts21PodcastsPlayerAdapter, "sharedInstance"));
  v3 = objc_msgSend(v2, "isTargetPlaying");

  return v3;
}

- (id)playerPath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PodcastsPlayerAdapter sharedInstance](_TtC8Podcasts21PodcastsPlayerAdapter, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "playbackPlayerPath"));

  return v3;
}

- (void)setPlayerRoute:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[PodcastsPlayerAdapter sharedInstance](_TtC8Podcasts21PodcastsPlayerAdapter, "sharedInstance"));
  objc_msgSend(v4, "setRoute:", v3);

}

- (BOOL)volumeControlAvailable
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController_iOS volumeController](self, "volumeController"));
  v3 = objc_msgSend(v2, "isVolumeControlAvailable");

  return v3;
}

- (void)increaseVolume
{
  double v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerController_iOS volumeController](self, "volumeController"));
  LODWORD(v2) = 1031798784;
  objc_msgSend(v3, "adjustVolumeValue:", v2);

}

- (void)decreaseVolume
{
  double v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerController_iOS volumeController](self, "volumeController"));
  LODWORD(v2) = -1115684864;
  objc_msgSend(v3, "adjustVolumeValue:", v2);

}

- (void)playerViewController:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  id v5;

  -[MTPlayerController_iOS setOnScreenForVolumeDisplay:](self, "setOnScreenForVolumeDisplay:", 1, a4);
  -[MTPlayerController setIsPlayingFullScreenVideo:](self, "setIsPlayingFullScreenVideo:", 1);
  v5 = (id)objc_claimAutoreleasedReturnValue(+[MPVolumeHUDController sharedInstance](MPVolumeHUDController, "sharedInstance"));
  objc_msgSend(v5, "setNeedsUpdate");

}

- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  id v5;

  -[MTPlayerController setIsPlayingFullScreenVideo:](self, "setIsPlayingFullScreenVideo:", 0, a4);
  -[MTPlayerController_iOS setOnScreenForVolumeDisplay:](self, "setOnScreenForVolumeDisplay:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue(+[MPVolumeHUDController sharedInstance](MPVolumeHUDController, "sharedInstance"));
  objc_msgSend(v5, "setNeedsUpdate");

}

- (void)playerViewController:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerController_iOS _nowPlayingRootViewController](self, "_nowPlayingRootViewController"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10010884C;
  v8[3] = &unk_1004A6378;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "presentNowPlayingWithAnimated:completion:", 1, v8);

}

- (void)playerViewController:(id)a3 failedToStartPictureInPictureWithError:(id)a4
{
  NSLog(CFSTR("PIP Failed: %@"), a2, a3, a4);
}

- (void)playerViewControllerDidStartPictureInPicture:(id)a3
{
  id v4;

  NSLog(CFSTR("PIP Started"), a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTPlayerController_iOS _nowPlayingRootViewController](self, "_nowPlayingRootViewController"));
  objc_msgSend(v4, "dismissNowPlayingWithAnimated:completion:", 1, 0);

}

- (void)playerViewControllerWillStartPictureInPicture:(id)a3
{
  NSLog(CFSTR("PIP Will Start"), a2, a3);
}

- (void)playerViewControllerWillStopPictureInPicture:(id)a3
{
  NSLog(CFSTR("PIP Will Stop"), a2, a3);
}

- (void)playerViewControllerDidStopPictureInPicture:(id)a3
{
  NSLog(CFSTR("PIP Did Stop"), a2, a3);
}

- (id)_nowPlayingRootViewController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootViewController"));

  v6 = objc_opt_class(_TtC12NowPlayingUI23NowPlayingTabController);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = v5;
  }
  else
  {
    v8 = objc_opt_class(UISplitViewController);
    if ((objc_opt_isKindOfClass(v5, v8) & 1) != 0)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewControllers", 0));
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v18;
        while (2)
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v18 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v13);
            v15 = objc_opt_class(_TtC12NowPlayingUI23NowPlayingTabController);
            if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
            {
              v7 = v14;

              goto LABEL_15;
            }
            v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v11)
            continue;
          break;
        }
      }

    }
    v7 = 0;
  }
LABEL_15:

  return v7;
}

- (BOOL)isOnScreenForVolumeDisplay
{
  return self->_onScreenForVolumeDisplay;
}

- (void)setOnScreenForVolumeDisplay:(BOOL)a3
{
  self->_onScreenForVolumeDisplay = a3;
}

- (void)setVolumeAudioCategory:(id)a3
{
  objc_storeStrong((id *)&self->_volumeAudioCategory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeController, 0);
  objc_storeStrong((id *)&self->_volumeAudioCategory, 0);
}

@end
