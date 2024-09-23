@implementation THWAVController

+ (id)sharedController
{
  id result;

  result = (id)qword_5432B8;
  if (!qword_5432B8)
  {
    result = objc_alloc_init(THWAVController);
    qword_5432B8 = (uint64_t)result;
  }
  return result;
}

- (THWAVController)init
{
  THWAVController *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWAVController;
  v2 = -[THWAVController init](&v4, "init");
  if (v2)
  {
    -[THWAVController setActiveTransportControllers:](v2, "setActiveTransportControllers:", +[NSMutableArray array](NSMutableArray, "array"));
    -[THWAVController setAutoplayingTransportControllers:](v2, "setAutoplayingTransportControllers:", +[NSMutableSet set](NSMutableSet, "set"));
    -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", v2, "handleNotificationVantageDidChange:", CFSTR("THVantageDidChangeNotification"), 0);
    -[BCAudioMuxingCoordinator addAudioMuxingObserver:](+[BCAudioMuxingCoordinator sharedInstance](BCAudioMuxingCoordinator, "sharedInstance"), "addAudioMuxingObserver:", v2);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[BCAudioMuxingCoordinator removeAudioMuxingObserver:](+[BCAudioMuxingCoordinator sharedInstance](BCAudioMuxingCoordinator, "sharedInstance"), "removeAudioMuxingObserver:", self);
  -[THWAVController setActiveTransportControllers:](self, "setActiveTransportControllers:", 0);
  -[THWAVController setAutoplayingTransportControllers:](self, "setAutoplayingTransportControllers:", 0);
  -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CFSTR("THVantageDidChangeNotification"), 0);
  v3.receiver = self;
  v3.super_class = (Class)THWAVController;
  -[THWAVController dealloc](&v3, "dealloc");
}

- (id)newTransportController
{
  THWAVTransportController *v3;

  v3 = objc_alloc_init(THWAVTransportController);
  -[NSMutableArray addObject:](-[THWAVController activeTransportControllers](self, "activeTransportControllers"), "addObject:", v3);
  return v3;
}

- (BOOL)hasAVControllerActive
{
  return -[THWAVController playingTransportController](self, "playingTransportController") != 0;
}

- (void)togglePlayPause
{
  if (-[THWAVController playingTransportController](self, "playingTransportController"))
    -[THWAVTransportControllable togglePlayPause](-[THWAVController playingTransportController](self, "playingTransportController"), "togglePlayPause");
}

- (void)stopPlayer
{
  if (-[THWAVController playingTransportController](self, "playingTransportController"))
    -[THWAVTransportControllable stop](-[THWAVController playingTransportController](self, "playingTransportController"), "stop");
}

- (void)stopPlayerNotInDocumentRoot:(id)a3
{
  if (-[THWAVController playingTransportController](self, "playingTransportController"))
  {
    if (-[THWAVTransportControllable documentRoot](-[THWAVController playingTransportController](self, "playingTransportController"), "documentRoot") != a3)-[THWAVTransportControllable stop](-[THWAVController playingTransportController](self, "playingTransportController"), "stop");
  }
}

- (void)transportControllerDidStartPlaying:(id)a3
{
  _QWORD v3[7];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_151400;
  v3[3] = &unk_426F18;
  v3[5] = self;
  v3[6] = a3;
  -[BCAudioMuxingCoordinator beginLongAudioSessionWithIdentifier:completion:](+[BCAudioMuxingCoordinator sharedInstance](BCAudioMuxingCoordinator, "sharedInstance"), "beginLongAudioSessionWithIdentifier:completion:", CFSTR("THWAVController"), v3);
}

- (void)transportControllerDidStopPlaying:(id)a3
{
  if (-[THWAVController playingTransportController](self, "playingTransportController") == a3)
    -[THWAVController setPlayingTransportController:](self, "setPlayingTransportController:", 0);
  else
    -[NSMutableSet removeObject:](-[THWAVController autoplayingTransportControllers](self, "autoplayingTransportControllers"), "removeObject:", a3);
  -[BCAudioMuxingCoordinator endLongAudioSessionWithIdentifier:](+[BCAudioMuxingCoordinator sharedInstance](BCAudioMuxingCoordinator, "sharedInstance"), "endLongAudioSessionWithIdentifier:", CFSTR("THWAVController"));
}

- (void)transportControllerDidBecomeInvalid:(id)a3
{
  -[NSMutableArray removeObject:](-[THWAVController activeTransportControllers](self, "activeTransportControllers"), "removeObject:", a3);
  if (-[THWAVController playingTransportController](self, "playingTransportController") == a3)
    -[THWAVController setPlayingTransportController:](self, "setPlayingTransportController:", 0);
  -[BCAudioMuxingCoordinator endLongAudioSessionWithIdentifier:](+[BCAudioMuxingCoordinator sharedInstance](BCAudioMuxingCoordinator, "sharedInstance"), "endLongAudioSessionWithIdentifier:", CFSTR("THWAVController"));
}

- (void)transportControllerDidStartAutoplaying:(id)a3
{
  _QWORD v3[7];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1515E4;
  v3[3] = &unk_426F18;
  v3[5] = self;
  v3[6] = a3;
  -[BCAudioMuxingCoordinator beginLongAudioSessionWithIdentifier:completion:](+[BCAudioMuxingCoordinator sharedInstance](BCAudioMuxingCoordinator, "sharedInstance"), "beginLongAudioSessionWithIdentifier:completion:", CFSTR("THWAVController"), v3);
}

- (void)transportControllerDidStopAutoplaying:(id)a3
{
  -[NSMutableSet removeObject:](-[THWAVController autoplayingTransportControllers](self, "autoplayingTransportControllers"), "removeObject:", a3);
  -[BCAudioMuxingCoordinator endLongAudioSessionWithIdentifier:](+[BCAudioMuxingCoordinator sharedInstance](BCAudioMuxingCoordinator, "sharedInstance"), "endLongAudioSessionWithIdentifier:", CFSTR("THWAVController"));
}

- (id)p_documentNavigatorFromNotification:(id)a3
{
  uint64_t v4;
  id result;
  double v6;

  v4 = objc_opt_class(THDocumentNavigator);
  *(_QWORD *)&v6 = TSUDynamicCast(v4, objc_msgSend(a3, "object")).n128_u64[0];
  if (!result)
    return objc_msgSend((id)TSUProtocolCast(&OBJC_PROTOCOL___THVantageChangeInitiator, objc_msgSend(a3, "object", v6)), "documentNavigator");
  return result;
}

- (BOOL)p_shouldHandleVantageDidChangeNotification:(id)a3
{
  id v5;
  id v7;
  unsigned int v8;

  v5 = objc_msgSend(objc_msgSend(a3, "userInfo"), "valueForKey:", CFSTR("THVantageChangeReason"));
  if (objc_msgSend(-[THWAVTransportControllable movieLayout](-[THWAVController playingTransportController](self, "playingTransportController"), "movieLayout"), "isExpanded"))return objc_msgSend(v5, "isEqualToString:", CFSTR("THVantageChangeReasonNavigation"));
  v7 = objc_msgSend(-[THWAVController p_documentNavigatorFromNotification:](self, "p_documentNavigatorFromNotification:", a3), "currentAbsolutePageIndex");
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("THVantageChangeReasonWindowResize")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("THVantageChangeReasonRotation")) & 1) != 0)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    v8 = objc_msgSend(v5, "isEqualToString:", CFSTR("THVantageChangeReasonScrolling")) ^ 1;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("THVantageChangeReasonScrolling")))
    LOBYTE(v8) = v7 != (id)self->_currentAbsolutePageIndex;
  self->_currentAbsolutePageIndex = (unint64_t)v7;
  return v8;
}

- (void)handleNotificationVantageDidChange:(id)a3
{
  if (-[THWAVController p_shouldHandleVantageDidChangeNotification:](self, "p_shouldHandleVantageDidChangeNotification:", a3))
  {
    if (-[THWAVController playingTransportController](self, "playingTransportController"))
    {
      -[THWAVTransportControllable stop](-[THWAVController playingTransportController](self, "playingTransportController"), "stop");
      -[THWAVController setPlayingTransportController:](self, "setPlayingTransportController:", 0);
    }
  }
}

- (void)audioPlaybackWillStart:(id)a3
{
  uint64_t v5;
  void *v6;
  double v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  id v11;
  unsigned __int8 v12;

  v5 = objc_opt_class(THWiOSExpandedMovieViewController);
  *(_QWORD *)&v7 = TSUDynamicCast(v5, a3).n128_u64[0];
  if (v6)
  {
    v8 = v6;
    v9 = objc_msgSend(objc_msgSend(objc_msgSend(v6, "movieInfo", v7), "movieRemoteURL"), "isEqual:", objc_msgSend(objc_msgSend(-[THWAVTransportControllable movieLayout](-[THWAVController playingTransportController](self, "playingTransportController"), "movieLayout"), "movieInfo"), "movieRemoteURL"));
    v10 = objc_msgSend(objc_msgSend(v8, "movieInfo"), "movieData");
    v11 = objc_msgSend(objc_msgSend(-[THWAVTransportControllable movieLayout](-[THWAVController playingTransportController](self, "playingTransportController"), "movieLayout"), "movieInfo"), "movieData");
    if ((v9 & 1) == 0)
    {
      v12 = objc_msgSend(v10, "isEqual:", v11);
      if (a3 != self && (v12 & 1) == 0)
        goto LABEL_5;
    }
  }
  else if (a3 != self)
  {
LABEL_5:
    -[THWAVController stopPlayer](self, "stopPlayer");
  }
}

- (NSMutableArray)activeTransportControllers
{
  return self->activeTransportControllers;
}

- (void)setActiveTransportControllers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (THWAVTransportControllable)playingTransportController
{
  return self->_playingTransportController;
}

- (void)setPlayingTransportController:(id)a3
{
  self->_playingTransportController = (THWAVTransportControllable *)a3;
}

- (NSMutableSet)autoplayingTransportControllers
{
  return self->_autoplayingTransportControllers;
}

- (void)setAutoplayingTransportControllers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (unint64_t)currentAbsolutePageIndex
{
  return self->_currentAbsolutePageIndex;
}

- (void)setCurrentAbsolutePageIndex:(unint64_t)a3
{
  self->_currentAbsolutePageIndex = a3;
}

@end
