@implementation SearchUIPlayMediaHandler

- (id)intent
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CBDA70]);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9E0]), "initWithIdentifier:title:type:artwork:", 0, &stru_1EA1FB118, 0, 0);
  v12[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICommandHandler command](self, "command");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (int)objc_msgSend(v6, "playbackLocation");
  -[SearchUIPlayMediaHandler mediaMetadata](self, "mediaMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIMediaUtilities mediaSearchForMetadata:](SearchUIMediaUtilities, "mediaSearchForMetadata:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithMediaItems:mediaContainer:playShuffled:playbackRepeatMode:resumePlayback:playbackQueueLocation:playbackSpeed:mediaSearch:", v5, 0, 0, 1, 0, v7, 0, v9);

  return v10;
}

- (id)mediaMetadata
{
  void *v2;
  void *v3;

  -[SearchUICommandHandler command](self, "command");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)supportsIntentPath
{
  void *v2;
  BOOL v3;

  -[SearchUIMediaHandler clientSelectedBundleIdentifier](self, "clientSelectedBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[SearchUIMediaUtilities bundleIdentifierSupportsPlayIntent:](SearchUIMediaUtilities, "bundleIdentifierSupportsPlayIntent:", v2);

  return v3;
}

- (unint64_t)destination
{
  return 3;
}

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;
  _QWORD v20[4];
  id v21;
  SearchUIPlayMediaHandler *v22;
  _QWORD v23[5];
  _QWORD v24[4];
  id v25;

  v8 = a3;
  v9 = a5;
  -[SearchUIPlayMediaHandler mediaMetadata](self, "mediaMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "audioData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "shouldPause");
  v13 = v12;
  if (v11)
  {
    +[SearchUITTSUtilities ttsAudioDataWithSfAudioData:](_TtC8SearchUI20SearchUITTSUtilities, "ttsAudioDataWithSfAudioData:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
LABEL_19:

      goto LABEL_20;
    }
    objc_msgSend(v9, "feedbackDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v15, "stopPlaybackForAudioData:", v14);
LABEL_18:

        goto LABEL_19;
      }
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __68__SearchUIPlayMediaHandler_performCommand_triggerEvent_environment___block_invoke;
      v24[3] = &unk_1EA1F73D0;
      v25 = v11;
      +[SearchUITTSUtilities stopWithCompletionHandler:](_TtC8SearchUI20SearchUITTSUtilities, "stopWithCompletionHandler:", v24);
      v18 = v25;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __68__SearchUIPlayMediaHandler_performCommand_triggerEvent_environment___block_invoke_18;
        v23[3] = &unk_1EA1F62F0;
        v23[4] = self;
        objc_msgSend(v15, "performPlaybackForAudioData:completionHandler:", v14, v23);
        goto LABEL_18;
      }
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __68__SearchUIPlayMediaHandler_performCommand_triggerEvent_environment___block_invoke_2;
      v20[3] = &unk_1EA1F6F30;
      v21 = v11;
      v22 = self;
      +[SearchUITTSUtilities playWithAudioData:completionHandler:](_TtC8SearchUI20SearchUITTSUtilities, "playWithAudioData:completionHandler:", v14, v20);
      v18 = v21;
    }

    goto LABEL_18;
  }
  if (v12)
  {
    if (objc_msgSend(v10, "mediaType") == 100)
      +[SearchUIVoicemailUtilities pauseVoicemail](_TtC8SearchUI26SearchUIVoicemailUtilities, "pauseVoicemail");
    else
      +[SearchUIMediaUtilities pausePlayback](SearchUIMediaUtilities, "pausePlayback");
  }
  else if (-[SearchUIPlayMediaHandler canPlayIntent](self, "canPlayIntent")
         || (-[SearchUIPlayMediaHandler mediaMetadata](self, "mediaMetadata"),
             v16 = (void *)objc_claimAutoreleasedReturnValue(),
             objc_msgSend(v16, "mediaIdentifier"),
             v17 = (void *)objc_claimAutoreleasedReturnValue(),
             v17,
             v16,
             !v17))
  {
    v19.receiver = self;
    v19.super_class = (Class)SearchUIPlayMediaHandler;
    -[SearchUIMediaHandler performCommand:triggerEvent:environment:](&v19, sel_performCommand_triggerEvent_environment_, v8, a4, v9);
  }
  else
  {
    +[SearchUIMediaUtilities playMedia:](SearchUIMediaUtilities, "playMedia:", v10);
  }
LABEL_20:

}

void __68__SearchUIPlayMediaHandler_performCommand_triggerEvent_environment___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    SearchUIGeneralLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __68__SearchUIPlayMediaHandler_performCommand_triggerEvent_environment___block_invoke_cold_1();

  }
}

uint64_t __68__SearchUIPlayMediaHandler_performCommand_triggerEvent_environment___block_invoke_18(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendPlaybackFinishedNotification");
}

void __68__SearchUIPlayMediaHandler_performCommand_triggerEvent_environment___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    SearchUIGeneralLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __68__SearchUIPlayMediaHandler_performCommand_triggerEvent_environment___block_invoke_2_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 40), "sendPlaybackFinishedNotification");

}

- (void)sendPlaybackFinishedNotification
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("SearchUITTSPlaybackDidFinishNotification"), 0);

}

- (BOOL)canPlayIntent
{
  void *v2;
  void *v3;
  void *v4;

  -[SearchUIPlayMediaHandler mediaMetadata](self, "mediaMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "artistName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 || (objc_msgSend(v2, "albumName"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    objc_msgSend(v2, "mediaName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      goto LABEL_5;
  }
  LODWORD(v4) = objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS") ^ 1;
LABEL_5:

  return (char)v4;
}

- (void)performIntent:(id)a3 withBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  if (!-[SearchUIPlayMediaHandler canPlayIntent](self, "canPlayIntent"))
    goto LABEL_4;
  +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", v8) & 1) == 0)
  {

    goto LABEL_6;
  }
  -[SearchUIPlayMediaHandler mediaMetadata](self, "mediaMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mediaIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_6:
    v12.receiver = self;
    v12.super_class = (Class)SearchUIPlayMediaHandler;
    -[SearchUIMediaHandler performIntent:withBundleIdentifier:](&v12, sel_performIntent_withBundleIdentifier_, v6, v7);
    goto LABEL_7;
  }
LABEL_4:
  -[SearchUIPlayMediaHandler mediaMetadata](self, "mediaMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIMediaUtilities playMedia:](SearchUIMediaUtilities, "playMedia:", v11);

LABEL_7:
}

void __68__SearchUIPlayMediaHandler_performCommand_triggerEvent_environment___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2(&dword_1DAD39000, v0, v1, "Error stopping audio data (%@): %@");
}

void __68__SearchUIPlayMediaHandler_performCommand_triggerEvent_environment___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2(&dword_1DAD39000, v0, v1, "Error playing audio data (%@): %@");
}

@end
