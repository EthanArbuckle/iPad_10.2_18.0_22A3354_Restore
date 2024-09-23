@implementation TVPPlaybackState

void __27__TVPPlaybackState_stopped__block_invoke()
{
  TVPPlaybackState *v0;
  void *v1;

  v0 = -[TVPPlaybackState initWithName:]([TVPPlaybackState alloc], "initWithName:", CFSTR("Stopped"));
  v1 = (void *)stopped_state;
  stopped_state = (uint64_t)v0;

}

void __27__TVPPlaybackState_playing__block_invoke()
{
  TVPPlaybackState *v0;
  void *v1;

  v0 = -[TVPPlaybackState initWithName:]([TVPPlaybackState alloc], "initWithName:", CFSTR("Playing"));
  v1 = (void *)playing_state;
  playing_state = (uint64_t)v0;

}

void __27__TVPPlaybackState_loading__block_invoke()
{
  TVPPlaybackState *v0;
  void *v1;

  v0 = -[TVPPlaybackState initWithName:]([TVPPlaybackState alloc], "initWithName:", CFSTR("Loading"));
  v1 = (void *)loading_state;
  loading_state = (uint64_t)v0;

}

void __26__TVPPlaybackState_paused__block_invoke()
{
  TVPPlaybackState *v0;
  void *v1;

  v0 = -[TVPPlaybackState initWithName:]([TVPPlaybackState alloc], "initWithName:", CFSTR("Paused"));
  v1 = (void *)paused_state;
  paused_state = (uint64_t)v0;

}

- (NSString)name
{
  return self->_name;
}

- (TVPPlaybackState)initWithName:(id)a3
{
  id v5;
  TVPPlaybackState *v6;
  TVPPlaybackState *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVPPlaybackState;
  v6 = -[TVPPlaybackState init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_name, a3);

  return v7;
}

+ (id)stopped
{
  if (stopped_onceToken != -1)
    dispatch_once(&stopped_onceToken, &__block_literal_global_1);
  return (id)stopped_state;
}

+ (id)playing
{
  if (playing_onceToken != -1)
    dispatch_once(&playing_onceToken, &__block_literal_global_8);
  return (id)playing_state;
}

+ (id)paused
{
  if (paused_onceToken != -1)
    dispatch_once(&paused_onceToken, &__block_literal_global_5);
  return (id)paused_state;
}

+ (id)loading
{
  if (loading_onceToken != -1)
    dispatch_once(&loading_onceToken, &__block_literal_global_2);
  return (id)loading_state;
}

+ (id)scanning
{
  if (scanning_onceToken != -1)
    dispatch_once(&scanning_onceToken, &__block_literal_global_11);
  return (id)scanning_state;
}

void __28__TVPPlaybackState_scanning__block_invoke()
{
  TVPPlaybackState *v0;
  void *v1;

  v0 = -[TVPPlaybackState initWithName:]([TVPPlaybackState alloc], "initWithName:", CFSTR("Scanning"));
  v1 = (void *)scanning_state;
  scanning_state = (uint64_t)v0;

}

- (TVPPlaybackState)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("Unimplemented"), CFSTR("-[ATVPlaybackState init] not supported, use singletons instead"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPPlaybackState name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
