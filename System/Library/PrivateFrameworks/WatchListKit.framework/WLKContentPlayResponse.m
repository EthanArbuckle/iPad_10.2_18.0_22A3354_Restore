@implementation WLKContentPlayResponse

- (WLKContentPlayResponse)initWithDictionary:(id)a3
{
  id v5;
  WLKContentPlayResponse *v6;
  WLKContentPlayResponse *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  WLKPlayable *v12;
  WLKPlayable *playable;
  objc_super v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WLKContentPlayResponse;
  v6 = -[WLKContentPlayResponse init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dictionary, a3);
    objc_msgSend(v5, "wlk_dictionaryForKey:", CFSTR("data"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[WLKChannelsResponse parseChannelsFromPayload:](WLKChannelsResponse, "parseChannelsFromPayload:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
    {
      v16 = CFSTR("WLKModelContextKeyChannels");
      v17[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    v12 = -[WLKPlayable initWithDictionary:context:]([WLKPlayable alloc], "initWithDictionary:context:", v8, v11);
    playable = v7->_playable;
    v7->_playable = v12;

  }
  return v7;
}

- (WLKContentPlayResponse)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("WLKContentPlayResponse"), CFSTR("-init is not supported"));

  return 0;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (WLKPlayable)playable
{
  return self->_playable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playable, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
