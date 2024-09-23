@implementation TUIElementVideo

+ (unint64_t)definesScopes
{
  return 63;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIVideoBox, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(TUIBoxAndActionBuilder, a2);
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  var0 = a4.var0;
  v9 = a6;
  v10 = a5;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringForAttribute:node:", 218, var0));
  objc_msgSend(v11, "setVideoId:", v12);

  objc_msgSend(v11, "setMuted:", objc_msgSend(v10, "BOOLForAttribute:withDefault:node:", 136, 1, var0));
  objc_msgSend(v11, "setLoop:", objc_msgSend(v10, "BOOLForAttribute:withDefault:node:", 125, 1, var0));
  objc_msgSend(v11, "setAllowFullScreen:", objc_msgSend(v10, "BOOLForAttribute:withDefault:node:", 4, 1, var0));
  objc_msgSend(v11, "setAutoPlay:", objc_msgSend(v10, "BOOLForAttribute:withDefault:node:", 15, 1, var0));
  objc_msgSend(v11, "setShowPlaybackControls:", objc_msgSend(v10, "BOOLForAttribute:withDefault:node:", 191, 1, var0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringForAttribute:node:", 118, var0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[TUIBox videoGravityFromString:](TUIBox, "videoGravityFromString:", v13));
  objc_msgSend(v11, "setGravity:", v14);

  objc_msgSend(v10, "floatForAttribute:node:", 60, var0);
  objc_msgSend(v11, "setCornerRadius:");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringForAttribute:node:", 213, var0));
  objc_msgSend(v11, "setUrlString:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringForAttribute:node:", 154, var0));
  objc_msgSend(v11, "setPosterFrameUrlString:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "baseURLForNode:", var0));
  objc_msgSend(v11, "setBaseUrl:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "tui_identifierByAppendingString:", CFSTR("top")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "tui_identifierToString"));
  objc_msgSend(v11, "setTopTriggerName:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "tui_identifierByAppendingString:", CFSTR("bottom")));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "tui_identifierToString"));
  objc_msgSend(v11, "setBottomTriggerName:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "tui_identifierByAppendingString:", CFSTR("left")));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "tui_identifierToString"));
  objc_msgSend(v11, "setLeftTriggerName:", v26);

  v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "tui_identifierByAppendingString:", CFSTR("right")));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "tui_identifierToString"));
  objc_msgSend(v11, "setRightTriggerName:", v28);

}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  TUIElementActionTriggerHandler *v9;
  void *v10;
  void *v11;
  void *v12;
  TUIElementActionTriggerHandler *v13;
  id v14;
  id v15;

  v15 = a3;
  v7 = a4;
  v8 = a5;
  v9 = [TUIElementActionTriggerHandler alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "finalizeTriggers"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "actionObject"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "actionDelegate"));
  v13 = -[TUIElementActionTriggerHandler initWithActionsData:actionObject:actionDelegate:](v9, "initWithActionsData:actionObject:actionDelegate:", v10, v11, v12);
  objc_msgSend(v15, "setActionHandler:", v13);

  v14 = objc_msgSend(v7, "finalizeModelsWithParent:box:context:", v15, v15, v8);
}

@end
