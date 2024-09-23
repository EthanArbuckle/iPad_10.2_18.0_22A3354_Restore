@implementation ICLinkLinkAVPlaybackCoordinatorMedium

- (ICLinkLinkAVPlaybackCoordinatorMedium)initWithPlaybackCoordinator:(id)a3 liveLink:(id)a4
{
  id v7;
  ICLinkLinkAVPlaybackCoordinatorMedium *v8;
  ICLinkLinkAVPlaybackCoordinatorMedium *v9;
  void *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICLinkLinkAVPlaybackCoordinatorMedium;
  v8 = -[ICLiveLinkPlaybackCoordinatorMedium initWithLiveLink:](&v12, sel_initWithLiveLink_, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_playbackCoordinator, a3);
    -[AVPlayerPlaybackCoordinator setCoordinationMediumDelegate:](v9->_playbackCoordinator, "setCoordinationMediumDelegate:", v9);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v9, sel__playbackCoordinatorDidIssueCommandToPlaybackObjectNotification_, *MEMORY[0x1E0C8ABF8], v7);

    -[ICLiveLinkPlaybackCoordinatorMedium synchronizePlaybackStateForReason:](v9, "synchronizePlaybackStateForReason:", CFSTR("InitialSync"));
  }

  return v9;
}

- (BOOL)isCoordinatorSuspended
{
  void *v2;
  BOOL v3;

  -[AVPlayerPlaybackCoordinator suspensionReasons](self->_playbackCoordinator, "suspensionReasons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)_playbackCoordinatorDidIssueCommandToPlaybackObjectNotification:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  double v8;
  double v9;
  ICLiveLinkPlaybackEvent *v10;
  uint64_t v11;
  ICLiveLinkPlaybackEvent *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  ICLinkLinkAVPlaybackCoordinatorMedium *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C8ABE8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C8ABE0]);
    v6 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0C8AC08]) & 1) != 0
      || -[NSObject isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0C8AC10]))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C8ABF0]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      v9 = v8;
      v10 = [ICLiveLinkPlaybackEvent alloc];
      if (v9 > 0.0)
        v11 = 1;
      else
        v11 = 2;
      v12 = -[ICLiveLinkPlaybackEvent initWithKind:](v10, "initWithKind:", v11);

      if (!v12)
        goto LABEL_15;
    }
    else
    {
      if (!-[NSObject isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0C8AC18]))
        goto LABEL_15;
      v12 = -[ICLiveLinkPlaybackEvent initWithKind:]([ICLiveLinkPlaybackEvent alloc], "initWithKind:", 3);
      if (!v12)
        goto LABEL_15;
    }
    -[ICLiveLinkPlaybackCoordinatorMedium liveLink](self, "liveLink");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "participantForParticipantUUID:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICLiveLinkEvent eventWithPlaybackEvent:participant:](ICLiveLinkEvent, "eventWithPlaybackEvent:participant:", v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = 134218498;
      v18 = self;
      v19 = 2114;
      v20 = v15;
      v21 = 2114;
      v22 = v4;
      _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_INFO, "MLLM %p: _playbackCoordinatorDidIssueCommandToPlaybackObjectNotification [produced event] event=%{public}@ userInfo=%{public}@", (uint8_t *)&v17, 0x20u);
    }

    objc_msgSend(v13, "receivedEvent:", v15);
  }
  else
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v17 = 134218242;
      v18 = self;
      v19 = 2114;
      v20 = v4;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_INFO, "MLLM %p: _playbackCoordinatorDidIssueCommandToPlaybackObjectNotification [ignoring local event] userInfo=%{public}@", (uint8_t *)&v17, 0x16u);
    }
  }
LABEL_15:

}

- (void)handleNewParticipantStateDictionary:(id)a3
{
  -[AVPlayerPlaybackCoordinator handleNewParticipantStateDictionary:](self->_playbackCoordinator, "handleNewParticipantStateDictionary:", a3);
}

- (void)handleNewTransportControlStateDictionary:(id)a3
{
  -[AVPlayerPlaybackCoordinator handleNewTransportControlStateDictionary:](self->_playbackCoordinator, "handleNewTransportControlStateDictionary:", a3);
}

- (void)removeParticipant:(id)a3
{
  -[AVPlayerPlaybackCoordinator handleRemovalOfParticipant:](self->_playbackCoordinator, "handleRemovalOfParticipant:", a3);
}

- (void)clearCoordinationMediumDelegate
{
  -[AVPlayerPlaybackCoordinator setCoordinationMediumDelegate:](self->_playbackCoordinator, "setCoordinationMediumDelegate:", 0);
}

- (id)localParticipantUUIDForPlaybackCoordinator:(id)a3
{
  void *v4;
  NSObject *v5;
  int v7;
  ICLinkLinkAVPlaybackCoordinatorMedium *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[ICLiveLinkPlaybackCoordinatorMedium localParticipantUUID](self, "localParticipantUUID", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218242;
    v8 = self;
    v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "MLLM %p: localParticipantUUIDForPlaybackCoordinator localParticipantUUID=%{public}@", (uint8_t *)&v7, 0x16u);
  }

  return v4;
}

- (void)playbackCoordinator:(id)a3 broadcastLocalParticipantStateDictionary:(id)a4
{
  -[ICLiveLinkPlaybackCoordinatorMedium _broadcastLocalParticipantStateDictionary:](self, "_broadcastLocalParticipantStateDictionary:", a4);
}

- (void)playbackCoordinator:(id)a3 broadcastTransportControlStateDictionary:(id)a4 forItemWithIdentifier:(id)a5
{
  -[ICLiveLinkPlaybackCoordinatorMedium _broadcastTransportControlStateDictionary:forItemWithIdentifier:](self, "_broadcastTransportControlStateDictionary:forItemWithIdentifier:", a4, a5);
}

- (void)playbackCoordinator:(id)a3 reloadTransportControlStateForItemWithIdentifier:(id)a4 completionHandler:(id)a5
{
  -[ICLiveLinkPlaybackCoordinatorMedium _reloadTransportControlStateForItemWithIdentifier:completionHandler:](self, "_reloadTransportControlStateForItemWithIdentifier:completionHandler:", a4, a5);
}

- (AVPlayerPlaybackCoordinator)playbackCoordinator
{
  return self->_playbackCoordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackCoordinator, 0);
}

@end
