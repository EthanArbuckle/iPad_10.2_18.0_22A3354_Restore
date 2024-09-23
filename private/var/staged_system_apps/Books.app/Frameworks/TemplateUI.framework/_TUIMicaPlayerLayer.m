@implementation _TUIMicaPlayerLayer

- (void)configWithURL:(id)a3 gravity:(id)a4 textKey:(id)a5 textValue:(id)a6 shouldStartAtEnd:(BOOL)a7 triggerName:(id)a8 targetTriggerState:(unint64_t)a9 triggerDelay:(double)a10 fontSpec:(id)a11 fileProvider:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  TUIMicaPlayer *player;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  TUIMicaPlayer *v28;
  void *v29;
  TUIMicaPlayer *v30;
  TUIMicaPlayer *v31;
  void *v32;
  unsigned __int8 v33;
  BOOL v34;
  char v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  id v47;
  TUIMicaPlayer *v48;
  double v49;
  id v50;
  _BOOL4 v51;
  void *v52;
  id v53;
  NSAttributedStringKey v54;
  void *v55;

  v51 = a7;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v50 = a8;
  v22 = a11;
  v53 = a12;
  objc_storeStrong((id *)&self->_triggerName, a8);
  self->_targetTriggerState = a9;
  self->_triggerDelay = a10;
  objc_storeStrong((id *)&self->_gravity, a4);
  player = self->_player;
  v52 = v18;
  if (player)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TUIMicaPlayer path](player, "path"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "path"));
    v26 = objc_msgSend(v24, "isEqualToString:", v25);

    v27 = v19;
    if ((v26 & 1) != 0)
      goto LABEL_6;
    player = self->_player;
    v18 = v52;
  }
  else
  {
    v27 = v19;
  }
  -[TUIMicaPlayer removeFromSuperlayer](player, "removeFromSuperlayer");
  v28 = [TUIMicaPlayer alloc];
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "path"));
  v30 = -[TUIMicaPlayer initWithPath:retinaScale:fileProvider:](v28, "initWithPath:retinaScale:fileProvider:", v29, v53, 1.0);
  v31 = self->_player;
  self->_player = v30;

LABEL_6:
  -[TUIMicaPlayer addToLayer:onTop:gravity:](self->_player, "addToLayer:onTop:gravity:", self, 0, v27);
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec defaultFontSpec](TUIFontSpec, "defaultFontSpec"));
  v33 = objc_msgSend(v22, "isEqual:", v32);

  if (v20)
    v34 = v21 == 0;
  else
    v34 = 1;
  v35 = v34;
  if (v34 || (v33 & 1) != 0)
  {
    if ((v35 & 1) != 0)
      goto LABEL_19;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[TUIMicaPlayer publishedLayerWithKey:required:](self->_player, "publishedLayerWithKey:required:", v20, 1));
    v44 = objc_opt_class(CATextLayer);
    v45 = TUIDynamicCast(v44, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v45);
    -[_TUIMicaPlayerLayer contentsScale](self, "contentsScale");
    objc_msgSend(v37, "setContentsScale:");
    -[_TUIMicaPlayerLayer rasterizationScale](self, "rasterizationScale");
    objc_msgSend(v37, "setRasterizationScale:");
    objc_msgSend(v37, "setString:", v21);
    v46 = objc_opt_class(NSString);
    v47 = TUIDynamicCast(v46, objc_msgSend(v37, "font"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(v47);
    if (objc_msgSend(v40, "isEqualToString:", CFSTR("Serif UI Display Bold")))
    {
      objc_msgSend(v37, "fontSize");
      objc_msgSend(v37, "setFont:", +[UIFont systemFontOfSize:weight:design:](UIFont, "systemFontOfSize:weight:design:", kCTFontUIFontDesignSerif));
    }
  }
  else
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "font"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[TUIMicaPlayer publishedLayerWithKey:required:](self->_player, "publishedLayerWithKey:required:", v20, 1));
    v38 = objc_opt_class(CATextLayer);
    v39 = TUIDynamicCast(v38, v37);
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    -[_TUIMicaPlayerLayer contentsScale](self, "contentsScale");
    objc_msgSend(v40, "setContentsScale:");
    -[_TUIMicaPlayerLayer rasterizationScale](self, "rasterizationScale");
    objc_msgSend(v40, "setRasterizationScale:");
    objc_msgSend(v40, "setString:", v21);
    objc_msgSend(v40, "setFont:", v36);
    objc_msgSend(v22, "pointSize");
    objc_msgSend(v40, "setFontSize:");
    v54 = NSFontAttributeName;
    v55 = v36;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1));
    objc_msgSend(v21, "sizeWithAttributes:", v41);
    objc_msgSend(v40, "setBounds:", 0.0, 0.0, v42, v43);

    v27 = v19;
  }

LABEL_19:
  v48 = self->_player;
  if (v51)
  {
    -[TUIMicaPlayer documentDuration](v48, "documentDuration");
    v48 = self->_player;
  }
  else
  {
    v49 = 0.0;
  }
  -[TUIMicaPlayer setPlaybackTime:](v48, "setPlaybackTime:", v49);

}

- (void)updateContent
{
  TUIMicaPlayer *player;

  player = self->_player;
  if (player)
  {
    -[TUIMicaPlayer removeFromSuperlayer](player, "removeFromSuperlayer");
    -[TUIMicaPlayer addToLayer:onTop:gravity:](self->_player, "addToLayer:onTop:gravity:", self, 0, self->_gravity);
    -[TUIMicaPlayer documentDuration](self->_player, "documentDuration");
    -[TUIMicaPlayer setPlaybackTime:](self->_player, "setPlaybackTime:");
    -[TUIMicaPlayer play](self->_player, "play");
  }
}

- (void)didAddLayerWithFeedControllerHost:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIMicaPlayerLayer triggerName](self, "triggerName"));
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "triggerStateManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIMicaPlayerLayer triggerName](self, "triggerName"));
    objc_msgSend(v6, "addObserver:forTrigger:", self, v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "triggerStateManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIMicaPlayerLayer triggerName](self, "triggerName"));
    v10 = objc_msgSend(v8, "stateForTriggerWithName:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIMicaPlayerLayer triggerName](self, "triggerName"));
    -[_TUIMicaPlayerLayer handleTrigger:didChangeState:updateEvent:](self, "handleTrigger:didChangeState:updateEvent:", v11, v10, 2);

  }
}

- (void)willRemoveLayerWithFeedControllerHost:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIMicaPlayerLayer triggerName](self, "triggerName"));
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "triggerStateManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIMicaPlayerLayer triggerName](self, "triggerName"));
    objc_msgSend(v6, "removeObserver:forTrigger:", self, v7);

  }
}

- (void)handleTrigger:(id)a3 didChangeState:(unint64_t)a4 updateEvent:(unint64_t)a5
{
  id v7;
  unint64_t v8;
  void *v9;
  unsigned int v10;
  double v11;
  double v12;
  dispatch_time_t v13;
  _QWORD block[5];

  v7 = a3;
  v8 = -[_TUIMicaPlayerLayer targetTriggerState](self, "targetTriggerState");
  if (a4)
  {
    if (v8 == a4)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIMicaPlayerLayer triggerName](self, "triggerName"));
      v10 = objc_msgSend(v9, "isEqualToString:", v7);

      if (v10)
      {
        -[_TUIMicaPlayerLayer triggerDelay](self, "triggerDelay");
        if (v11 <= 0.0)
        {
          -[TUIMicaPlayer play](self->_player, "play");
        }
        else
        {
          -[_TUIMicaPlayerLayer triggerDelay](self, "triggerDelay");
          v13 = dispatch_time(0, (uint64_t)(v12 * 1000000000.0));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_948F8;
          block[3] = &unk_23D938;
          block[4] = self;
          dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, block);
        }
      }
    }
  }

}

- (NSString)triggerName
{
  return self->_triggerName;
}

- (void)setTriggerName:(id)a3
{
  objc_storeStrong((id *)&self->_triggerName, a3);
}

- (unint64_t)targetTriggerState
{
  return self->_targetTriggerState;
}

- (void)setTargetTriggerState:(unint64_t)a3
{
  self->_targetTriggerState = a3;
}

- (double)triggerDelay
{
  return self->_triggerDelay;
}

- (void)setTriggerDelay:(double)a3
{
  self->_triggerDelay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerName, 0);
  objc_storeStrong((id *)&self->_gravity, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end
