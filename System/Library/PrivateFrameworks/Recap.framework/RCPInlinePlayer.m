@implementation RCPInlinePlayer

+ (void)playEventStream:(id)a3 options:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[RCPInlinePlayer sharedInstance](RCPInlinePlayer, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "prewarmForEventStream:completion:", v9, 0);

  +[RCPInlinePlayer sharedInstance](RCPInlinePlayer, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "playEventStream:options:completion:", v9, v8, v7);

  +[RCPInlinePlayer sharedInstance](RCPInlinePlayer, "sharedInstance");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tearDown");

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  return (id)instance;
}

- (void)tearDown
{
  NSObject *v3;
  _QWORD block[5];

  -[RCPInlinePlayer replayQueue](self, "replayQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__RCPInlinePlayer_tearDown__block_invoke;
  block[3] = &unk_1E4FC1FB8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)playEventStream:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[RCPInlinePlayer _doInitialDelayIfNeeded](self, "_doInitialDelayIfNeeded");
  if (!v9)
    v9 = (id)objc_opt_new();
  -[RCPInlinePlayer replayQueue](self, "replayQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__RCPInlinePlayer_playEventStream_options_completion___block_invoke;
  v15[3] = &unk_1E4FC2148;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)prewarmForEventStream:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RCPInlinePlayer _doInitialDelayIfNeeded](self, "_doInitialDelayIfNeeded");
  -[RCPInlinePlayer replayQueue](self, "replayQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__RCPInlinePlayer_prewarmForEventStream_completion___block_invoke;
  block[3] = &unk_1E4FC20D8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (OS_dispatch_queue)replayQueue
{
  return self->_replayQueue;
}

- (void)_doInitialDelayIfNeeded
{
  NSObject *v3;

  if (self->_needsInitialDelay)
  {
    -[RCPInlinePlayer replayQueue](self, "replayQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v3, &__block_literal_global_7);

    self->_needsInitialDelay = 0;
  }
}

void __27__RCPInlinePlayer_tearDown__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "underlyingPlayer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "tearDown");

}

void __52__RCPInlinePlayer_prewarmForEventStream_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "underlyingPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v8 = 0;
  objc_msgSend(v2, "prewarmForEventStream:withError:", v3, &v8);
  v4 = v8;

  if (*(_QWORD *)(a1 + 48))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__RCPInlinePlayer_prewarmForEventStream_completion___block_invoke_2;
    block[3] = &unk_1E4FC20B0;
    v7 = *(id *)(a1 + 48);
    v6 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __54__RCPInlinePlayer_playEventStream_options_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id *v4;
  dispatch_time_t v5;
  _QWORD v6[5];
  id v7;
  _QWORD block[5];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "underlyingPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playEventStream:withOptions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  if (*(_QWORD *)(a1 + 56))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "ignoresCompletionDelay"))
    {
      objc_msgSend(*(id *)(a1 + 32), "replayQueue");
      v3 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54__RCPInlinePlayer_playEventStream_options_completion___block_invoke_2;
      block[3] = &unk_1E4FC2120;
      block[4] = *(_QWORD *)(a1 + 32);
      v4 = &v9;
      v9 = *(id *)(a1 + 56);
      dispatch_async(v3, block);
    }
    else
    {
      v5 = dispatch_time(0, 200000000);
      objc_msgSend(*(id *)(a1 + 32), "replayQueue");
      v3 = objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __54__RCPInlinePlayer_playEventStream_options_completion___block_invoke_3;
      v6[3] = &unk_1E4FC2120;
      v6[4] = *(_QWORD *)(a1 + 32);
      v4 = &v7;
      v7 = *(id *)(a1 + 56);
      dispatch_after(v5, v3, v6);
    }

  }
}

- (RCPPlayer)underlyingPlayer
{
  return self->_underlyingPlayer;
}

void __33__RCPInlinePlayer_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)instance;
  instance = v0;

}

+ (void)setNeedsInitialDelay
{
  if (instance)
  {
    objc_msgSend((id)instance, "setNeedsInitialDelay:", 1);
    objc_msgSend((id)instance, "setIgnoresCompletionDelay:", __ignoresCompletionDelay);
  }
}

+ (void)playCommandString:(id)a3 options:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v7 = a5;
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(" "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[RCPSyntheticEventStream eventStreamWithCLIArguments:](RCPSyntheticEventStream, "eventStreamWithCLIArguments:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[RCPInlinePlayer sharedInstance](RCPInlinePlayer, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "prewarmForEventStream:completion:", v9, 0);

    +[RCPInlinePlayer sharedInstance](RCPInlinePlayer, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "playEventStream:options:completion:", v9, v13, v7);

    +[RCPInlinePlayer sharedInstance](RCPInlinePlayer, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tearDown");

  }
  else
  {
    NSLog(CFSTR("Recap event stream is empty. Please verify the commands"));
  }

}

+ (void)playEventActions:(id)a3 options:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a5;
  v8 = a4;
  +[RCPSyntheticEventStream eventStreamWithEventActions:](RCPSyntheticEventStream, "eventStreamWithEventActions:", a3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  +[RCPInlinePlayer sharedInstance](RCPInlinePlayer, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "prewarmForEventStream:completion:", v12, 0);

  +[RCPInlinePlayer sharedInstance](RCPInlinePlayer, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "playEventStream:options:completion:", v12, v8, v7);

  +[RCPInlinePlayer sharedInstance](RCPInlinePlayer, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tearDown");

}

+ (void)setIgnoresCompletionDelay:(BOOL)a3
{
  if (instance)
    objc_msgSend((id)instance, "setIgnoresCompletionDelay:", a3);
  else
    __ignoresCompletionDelay = a3;
}

- (RCPInlinePlayer)init
{
  RCPInlinePlayer *v2;
  RCPInlinePlayer *v3;
  RCPPlayer *v4;
  RCPPlayer *underlyingPlayer;
  NSObject *v6;
  dispatch_queue_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RCPInlinePlayer;
  v2 = -[RCPInlinePlayer init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_needsInitialDelay = 1;
    v4 = objc_alloc_init(RCPPlayer);
    underlyingPlayer = v3->_underlyingPlayer;
    v3->_underlyingPlayer = v4;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.recap.inline-replay", v6);

    -[RCPInlinePlayer setReplayQueue:](v3, "setReplayQueue:", v7);
  }
  return v3;
}

uint64_t __52__RCPInlinePlayer_prewarmForEventStream_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __42__RCPInlinePlayer__doInitialDelayIfNeeded__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", 0.1);
}

- (void)playCommandString:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v8 = a5;
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(" "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[RCPSyntheticEventStream eventStreamWithCLIArguments:](RCPSyntheticEventStream, "eventStreamWithCLIArguments:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    -[RCPInlinePlayer playEventStream:options:completion:](self, "playEventStream:options:completion:", v10, v11, v8);
  else
    NSLog(CFSTR("Recap event stream is empty. Please verify the commands"));

}

- (void)playEventActions:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  +[RCPSyntheticEventStream eventStreamWithEventActions:](RCPSyntheticEventStream, "eventStreamWithEventActions:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[RCPInlinePlayer playEventStream:options:completion:](self, "playEventStream:options:completion:", v10, v9, v8);

}

void __54__RCPInlinePlayer_playEventStream_options_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)MEMORY[0x1A85B7660](*(_QWORD *)(a1 + 40));
  objc_msgSend(v1, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__callBlock_, v2, 0);

}

void __54__RCPInlinePlayer_playEventStream_options_completion___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)MEMORY[0x1A85B7660](*(_QWORD *)(a1 + 40));
  objc_msgSend(v1, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__callBlock_, v2, 0);

}

- (void)_callBlock:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (BOOL)needsInitialDelay
{
  return self->_needsInitialDelay;
}

- (void)setNeedsInitialDelay:(BOOL)a3
{
  self->_needsInitialDelay = a3;
}

- (BOOL)ignoresCompletionDelay
{
  return self->_ignoresCompletionDelay;
}

- (void)setIgnoresCompletionDelay:(BOOL)a3
{
  self->_ignoresCompletionDelay = a3;
}

- (void)setUnderlyingPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingPlayer, a3);
}

- (void)setReplayQueue:(id)a3
{
  objc_storeStrong((id *)&self->_replayQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replayQueue, 0);
  objc_storeStrong((id *)&self->_underlyingPlayer, 0);
}

@end
