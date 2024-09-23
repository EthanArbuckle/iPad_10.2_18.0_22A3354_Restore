@implementation TUIMicaPlayer

- (TUIMicaPlayer)initWithFileName:(id)a3 retinaScale:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  TUIMicaPlayer *v9;
  TUIMicaPlayer *v10;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLForResource:withExtension:", v6, CFSTR("caar")));

  if (v8)
  {
    v9 = (TUIMicaPlayer *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
    v10 = -[TUIMicaPlayer initWithPath:retinaScale:](self, "initWithPath:retinaScale:", v9, a4);
    self = v9;
  }
  else
  {
    NSLog(CFSTR("Unable to find Mica document: %@"), v6);
    v10 = 0;
  }

  return v10;
}

- (TUIMicaPlayer)initWithPath:(id)a3 retinaScale:(double)a4
{
  id v6;
  void *v7;
  TUIMicaPlayer *v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUIMicaPlayer rootDictForPath:fileProvider:](TUIMicaPlayer, "rootDictForPath:fileProvider:", v6, 0));
  v8 = -[TUIMicaPlayer _initWithPath:retinaScale:rootDict:](self, "_initWithPath:retinaScale:rootDict:", v6, v7, a4);

  return v8;
}

- (TUIMicaPlayer)initWithPath:(id)a3 retinaScale:(double)a4 rootLayer:(id)a5 publishedObjects:(id)a6
{
  id v10;
  id v11;
  id v12;
  TUIMicaPlayer *v13;
  TUIMicaPlayer *v14;
  double v15;
  objc_super v17;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)TUIMicaPlayer;
  v13 = -[TUIMicaPlayer init](&v17, "init");
  v14 = v13;
  if (v13)
  {
    -[TUIMicaPlayer setPath:](v13, "setPath:", v10);
    -[TUIMicaPlayer setRootLayer:](v14, "setRootLayer:", v11);
    -[TUIMicaPlayer setPublishedObjects:](v14, "setPublishedObjects:", v12);
    LODWORD(v15) = 1.0;
    -[TUIMicaPlayer setPreferredPlaybackSpeed:](v14, "setPreferredPlaybackSpeed:", v15);
    -[TUIMicaPlayer setRetinaScale:](v14, "setRetinaScale:", a4);
    objc_msgSend(v11, "duration");
    -[TUIMicaPlayer setDocumentDuration:](v14, "setDocumentDuration:");
    -[CALayer setDuration:](v14->_rootLayer, "setDuration:", INFINITY);
  }

  return v14;
}

- (TUIMicaPlayer)initWithPath:(id)a3 retinaScale:(double)a4 fileProvider:(id)a5
{
  id v8;
  void *v9;
  TUIMicaPlayer *v10;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TUIMicaPlayer rootDictForPath:fileProvider:](TUIMicaPlayer, "rootDictForPath:fileProvider:", v8, a5));
  v10 = -[TUIMicaPlayer _initWithPath:retinaScale:rootDict:](self, "_initWithPath:retinaScale:rootDict:", v8, v9, a4);

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[TUIMicaPlayer stopPlayTimer](self, "stopPlayTimer");
  v3.receiver = self;
  v3.super_class = (Class)TUIMicaPlayer;
  -[TUIMicaPlayer dealloc](&v3, "dealloc");
}

- (id)_initWithPath:(id)a3 retinaScale:(double)a4 rootDict:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  TUIMicaPlayer *v15;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (!v9
    || (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("rootLayer")))) == 0)
  {

LABEL_6:
    NSLog(CFSTR("Unable to load Mica document with path: %@"), v8);
    v15 = 0;
    goto LABEL_7;
  }
  v12 = v11;
  objc_msgSend(v11, "setGeometryFlipped:", +[TUIMicaPlayer BOOLFromDictionary:key:defaultValue:](TUIMicaPlayer, "BOOLFromDictionary:key:defaultValue:", v10, CFSTR("geometryFlipped"), 0) ^ 1);
  objc_msgSend(v12, "setMasksToBounds:", 1);
  LODWORD(v13) = 0;
  objc_msgSend(v12, "setRepeatCount:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("publishedObjects")));
  v15 = -[TUIMicaPlayer initWithPath:retinaScale:rootLayer:publishedObjects:](self, "initWithPath:retinaScale:rootLayer:publishedObjects:", v8, v12, v14, a4);

  if (!v15)
    goto LABEL_6;
LABEL_7:

  return v15;
}

+ (id)rootDictForPath:(id)a3 fileProvider:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v20;
  id v21;
  _QWORD v22[5];

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v6)
  {
    if (v5)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v5));
      if (v16)
      {
        v21 = 0;
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v16, 1, &v21));
        v17 = v21;
        v9 = v17;
        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedDescription"));
          NSLog(CFSTR("Error: %@"), v18);

        }
LABEL_12:

        if (v8)
          goto LABEL_3;
LABEL_13:
        v15 = 0;
        v11 = v9;
        goto LABEL_14;
      }
    }
    else
    {
      v16 = 0;
    }
    v9 = 0;
    v8 = 0;
    goto LABEL_12;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataFor:", v5));
  v9 = 0;
  if (!v8)
    goto LABEL_13;
LABEL_3:
  v20 = v9;
  v10 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v8, &v20);
  v11 = v20;

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedDescription"));
    NSLog(CFSTR("Error: %@"), v12);

  }
  v22[0] = objc_opt_class(CALayer);
  v22[1] = objc_opt_class(NSDictionary);
  v22[2] = objc_opt_class(NSArray);
  v22[3] = objc_opt_class(NSString);
  v22[4] = objc_opt_class(NSNumber);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 5));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v14, CFSTR("root")));

  objc_msgSend(v10, "finishDecoding");
LABEL_14:

  return v15;
}

+ (BOOL)BOOLFromDictionary:(id)a3 key:(id)a4 defaultValue:(BOOL)a5
{
  void *v6;
  void *v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", a4));
  v7 = v6;
  if (v6)
    a5 = objc_msgSend(v6, "BOOLValue");

  return a5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIMicaPlayer path](self, "path"));
  v6 = objc_msgSend(v5, "copy");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIMicaPlayer rootLayer](self, "rootLayer"));
  v8 = objc_msgSend(v7, "tui_deepCopyLayer");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIMicaPlayer publishedObjects](self, "publishedObjects"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIMicaPlayer rootLayer](self, "rootLayer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TUIMicaPlayer updatePublishedObjects:toReferenceLayersInTree:ratherThanLayersInTree:](TUIMicaPlayer, "updatePublishedObjects:toReferenceLayersInTree:ratherThanLayersInTree:", v9, v8, v10));

  v12 = objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3);
  -[TUIMicaPlayer retinaScale](self, "retinaScale");
  v13 = objc_msgSend(v12, "initWithPath:retinaScale:rootLayer:publishedObjects:", v6, v8, v11);

  return v13;
}

+ (id)updatePublishedObjects:(id)a3 toReferenceLayersInTree:(id)a4 ratherThanLayersInTree:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  char isKindOfClass;
  void *v20;
  void *v21;
  uint64_t v22;
  char v23;
  void *v24;
  id v26;
  void *v27;
  void *v28;
  id obj;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v30 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (v7 && objc_msgSend(v7, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tui_allLayersInTree"));
    v26 = v9;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tui_allAnimationsInTree"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tui_allLayersInTree"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tui_allAnimationsInTree"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v14)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v16));
          v18 = objc_opt_class(CALayer);
          isKindOfClass = objc_opt_isKindOfClass(v17, v18);
          v20 = v10;
          v21 = v11;
          if ((isKindOfClass & 1) != 0
            || (v22 = objc_opt_class(CAAnimation),
                v23 = objc_opt_isKindOfClass(v17, v22),
                v21 = v27,
                v20 = v28,
                (v23 & 1) != 0))
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", objc_msgSend(v20, "indexOfObjectIdenticalTo:", v17)));
            objc_msgSend(v30, "setObject:forKeyedSubscript:", v24, v16);

          }
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v13);
    }

    v9 = v26;
  }

  return v30;
}

- (void)addToLayer:(id)a3 onTop:(BOOL)a4 gravity:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  CALayer *rootLayer;
  id v11;

  v6 = a4;
  v11 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer superlayer](self->_rootLayer, "superlayer"));

  if (!v9)
  {
    -[TUIMicaPlayer pause](self, "pause");
    -[TUIMicaPlayer setPlaybackTime:](self, "setPlaybackTime:", 0.0);
    -[TUIMicaPlayer moveAndResizeWithinParentLayer:usingGravity:animate:](self, "moveAndResizeWithinParentLayer:usingGravity:animate:", v11, v8, 0);
    rootLayer = self->_rootLayer;
    if (v6)
      objc_msgSend(v11, "addSublayer:", rootLayer);
    else
      objc_msgSend(v11, "insertSublayer:atIndex:", rootLayer, 0);
  }

}

- (void)removeFromSuperlayer
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer superlayer](self->_rootLayer, "superlayer"));

  if (v3)
  {
    -[TUIMicaPlayer pause](self, "pause");
    -[CALayer removeFromSuperlayer](self->_rootLayer, "removeFromSuperlayer");
  }
}

- (void)moveAndResizeWithinParentLayer:(id)a3 usingGravity:(id)a4 animate:(BOOL)a5
{
  _BOOL8 v5;
  CALayer *rootLayer;
  id v9;
  id v10;

  v5 = a5;
  rootLayer = self->_rootLayer;
  v9 = a4;
  v10 = a3;
  -[TUIMicaPlayer retinaScale](self, "retinaScale");
  -[CALayer tui_moveAndResizeWithinParentLayer:usingGravity:geometryFlipped:retinaScale:animate:](rootLayer, "tui_moveAndResizeWithinParentLayer:usingGravity:geometryFlipped:retinaScale:animate:", v10, v9, 1, v5);

}

- (id)publishedLayerWithKey:(id)a3 required:(BOOL)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIMicaPlayer publishedObjectWithKey:required:](self, "publishedObjectWithKey:required:", a3, a4));
  if (v4)
  {
    v5 = objc_opt_class(CALayer);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
    {

      v4 = 0;
    }
  }
  return v4;
}

- (id)publishedObjectWithKey:(id)a3 required:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_publishedObjects, "objectForKeyedSubscript:", v6));
  v8 = (void *)v7;
  if (v4 && !v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSString lastPathComponent](self->_path, "lastPathComponent"));
    NSLog(CFSTR("Missing published object '%@' in Mica document '%@'"), v6, v9);

  }
  return v8;
}

- (void)play
{
  double v3;
  double v4;
  double v5;

  if (!-[TUIMicaPlayer isPlaying](self, "isPlaying"))
  {
    v3 = CACurrentMediaTime();
    -[TUIMicaPlayer playbackTime](self, "playbackTime");
    -[CALayer setBeginTime:](self->_rootLayer, "setBeginTime:", v3 - v4 / self->_preferredPlaybackSpeed);
    -[CALayer setTimeOffset:](self->_rootLayer, "setTimeOffset:", 0.0);
    *(float *)&v5 = self->_preferredPlaybackSpeed;
    -[CALayer setSpeed:](self->_rootLayer, "setSpeed:", v5);
    -[TUIMicaPlayer startPlayTimer](self, "startPlayTimer");
    -[TUIMicaPlayer notifyDelegateDidStartPlaying](self, "notifyDelegateDidStartPlaying");
  }
}

- (void)pause
{
  double v3;

  if (-[TUIMicaPlayer isPlaying](self, "isPlaying"))
  {
    -[TUIMicaPlayer playbackTime](self, "playbackTime");
    -[CALayer setTimeOffset:](self->_rootLayer, "setTimeOffset:");
    -[CALayer setBeginTime:](self->_rootLayer, "setBeginTime:", 0.0);
    LODWORD(v3) = 0;
    -[CALayer setSpeed:](self->_rootLayer, "setSpeed:", v3);
    -[TUIMicaPlayer stopPlayTimer](self, "stopPlayTimer");
    -[TUIMicaPlayer notifyDelegateDidStopPlaying](self, "notifyDelegateDidStopPlaying");
  }
}

- (BOOL)isPlaying
{
  float v2;

  -[CALayer speed](self->_rootLayer, "speed");
  return v2 != 0.0;
}

- (void)setPreferredPlaybackSpeed:(float)a3
{
  float v4;
  double v5;

  if (a3 <= 0.0)
    v4 = 1.0;
  else
    v4 = a3;
  self->_preferredPlaybackSpeed = v4;
  if (-[TUIMicaPlayer isPlaying](self, "isPlaying"))
  {
    *(float *)&v5 = v4;
    -[CALayer setSpeed:](self->_rootLayer, "setSpeed:", v5);
  }
}

- (double)playbackTime
{
  double v3;
  double v4;
  double v5;
  float v6;
  double result;

  if (-[TUIMicaPlayer isPlaying](self, "isPlaying"))
  {
    v3 = CACurrentMediaTime();
    -[CALayer beginTime](self->_rootLayer, "beginTime");
    v5 = v3 - v4;
    -[CALayer speed](self->_rootLayer, "speed");
    return v5 * v6;
  }
  else
  {
    -[CALayer timeOffset](self->_rootLayer, "timeOffset");
  }
  return result;
}

- (void)setPlaybackTime:(double)a3
{
  unsigned int v5;
  double v6;

  v5 = -[TUIMicaPlayer isPlaying](self, "isPlaying");
  v6 = 0.0;
  if (v5)
  {
    v6 = CACurrentMediaTime() - a3;
    a3 = 0.0;
  }
  -[CALayer setBeginTime:](self->_rootLayer, "setBeginTime:", v6);
  -[CALayer setTimeOffset:](self->_rootLayer, "setTimeOffset:", a3);
  -[TUIMicaPlayer notifyDelegateDidChangePlaybackTime](self, "notifyDelegateDidChangePlaybackTime");
}

- (BOOL)isPlaybackAtEnd
{
  double v3;
  double v4;
  double v5;

  -[TUIMicaPlayer playbackTime](self, "playbackTime");
  v4 = v3;
  -[TUIMicaPlayer documentDuration](self, "documentDuration");
  return v4 >= v5 + -0.001;
}

- (void)notifyDelegateDidStartPlaying
{
  MicaPlayerDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)p_delegate);
    v7 = objc_opt_respondsToSelector(v6, "micaPlayerDidStartPlaying:");

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v8, "micaPlayerDidStartPlaying:", self);

    }
  }
}

- (void)notifyDelegateDidStopPlaying
{
  MicaPlayerDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)p_delegate);
    v7 = objc_opt_respondsToSelector(v6, "micaPlayerDidStopPlaying:");

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v8, "micaPlayerDidStopPlaying:", self);

    }
  }
}

- (void)notifyDelegateDidChangePlaybackTime
{
  MicaPlayerDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)p_delegate);
    v7 = objc_opt_respondsToSelector(v6, "micaPlayerDidChangePlaybackTime:");

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v8, "micaPlayerDidChangePlaybackTime:", self);

    }
  }
}

- (void)startPlayTimer
{
  NSTimer *v3;
  NSTimer *playTimer;
  id v5;

  if (!self->_playTimer)
  {
    v3 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "runPlayTimer:", 0, 1, 0.0333333333));
    playTimer = self->_playTimer;
    self->_playTimer = v3;

    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    objc_msgSend(v5, "addTimer:forMode:", self->_playTimer, NSRunLoopCommonModes);

  }
}

- (void)stopPlayTimer
{
  NSTimer *playTimer;
  NSTimer *v4;

  playTimer = self->_playTimer;
  if (playTimer)
  {
    -[NSTimer invalidate](playTimer, "invalidate");
    v4 = self->_playTimer;
    self->_playTimer = 0;

  }
}

- (void)runPlayTimer:(id)a3
{
  if (-[TUIMicaPlayer isPlaybackAtEnd](self, "isPlaybackAtEnd", a3))
  {
    if (self->_loopDuringPlayback)
      -[TUIMicaPlayer setPlaybackTime:](self, "setPlaybackTime:", 0.0);
    else
      -[TUIMicaPlayer pause](self, "pause");
  }
  -[TUIMicaPlayer notifyDelegateDidChangePlaybackTime](self, "notifyDelegateDidChangePlaybackTime");
}

- (MicaPlayerDelegate)delegate
{
  return (MicaPlayerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (CALayer)rootLayer
{
  return self->_rootLayer;
}

- (void)setRootLayer:(id)a3
{
  objc_storeStrong((id *)&self->_rootLayer, a3);
}

- (double)retinaScale
{
  return self->_retinaScale;
}

- (void)setRetinaScale:(double)a3
{
  self->_retinaScale = a3;
}

- (double)documentDuration
{
  return self->_documentDuration;
}

- (void)setDocumentDuration:(double)a3
{
  self->_documentDuration = a3;
}

- (float)preferredPlaybackSpeed
{
  return self->_preferredPlaybackSpeed;
}

- (BOOL)loopDuringPlayback
{
  return self->_loopDuringPlayback;
}

- (void)setLoopDuringPlayback:(BOOL)a3
{
  self->_loopDuringPlayback = a3;
}

- (NSDictionary)publishedObjects
{
  return self->_publishedObjects;
}

- (void)setPublishedObjects:(id)a3
{
  objc_storeStrong((id *)&self->_publishedObjects, a3);
}

- (NSTimer)playTimer
{
  return self->_playTimer;
}

- (void)setPlayTimer:(id)a3
{
  objc_storeStrong((id *)&self->_playTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playTimer, 0);
  objc_storeStrong((id *)&self->_publishedObjects, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
