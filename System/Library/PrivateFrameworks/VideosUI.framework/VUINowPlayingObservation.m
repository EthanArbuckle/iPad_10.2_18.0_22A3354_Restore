@implementation VUINowPlayingObservation

- (VUINowPlayingObservation)initWithBundleIdentifier:(id)a3 isPlaying:(BOOL)a4
{
  id v6;
  VUINowPlayingObservation *v7;
  VUINowPlayingObservation *v8;
  uint64_t v9;
  NSString *nowPlayingAppBundleIdentifier;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VUINowPlayingObservation;
  v7 = -[VUINowPlayingObservation init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_playing = a4;
    v9 = objc_msgSend(v6, "copy");
    nowPlayingAppBundleIdentifier = v8->_nowPlayingAppBundleIdentifier;
    v8->_nowPlayingAppBundleIdentifier = (NSString *)v9;

  }
  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[VUINowPlayingObservation isPlaying](self, "isPlaying");
  -[VUINowPlayingObservation nowPlayingAppBundleIdentifier](self, "nowPlayingAppBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  VUINowPlayingObservation *v4;
  VUINowPlayingObservation *v5;
  VUINowPlayingObservation *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  _BOOL4 v13;
  _BOOL4 v14;

  v4 = (VUINowPlayingObservation *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        -[VUINowPlayingObservation nowPlayingAppBundleIdentifier](self, "nowPlayingAppBundleIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUINowPlayingObservation nowPlayingAppBundleIdentifier](v6, "nowPlayingAppBundleIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v7;
        v10 = v8;
        if (v9 == v10)
        {

        }
        else
        {
          v11 = v10;
          if (!v9 || !v10)
          {

LABEL_14:
            LOBYTE(v13) = 0;
            goto LABEL_15;
          }
          v12 = objc_msgSend(v9, "isEqual:", v10);

          if ((v12 & 1) == 0)
            goto LABEL_14;
        }
        v14 = -[VUINowPlayingObservation isPlaying](self, "isPlaying");
        v13 = v14 ^ -[VUINowPlayingObservation isPlaying](v6, "isPlaying") ^ 1;
LABEL_15:

        goto LABEL_16;
      }
    }
    LOBYTE(v13) = 0;
  }
LABEL_16:

  return v13;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15.receiver = self;
  v15.super_class = (Class)VUINowPlayingObservation;
  -[VUINowPlayingObservation description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[VUINowPlayingObservation nowPlayingAppBundleIdentifier](self, "nowPlayingAppBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("nowPlayingAppBundleIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[VUINowPlayingObservation isPlaying](self, "isPlaying");
  VUIBoolLogString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("isPlaying"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@>"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (void)setPlaying:(BOOL)a3
{
  self->_playing = a3;
}

- (NSString)nowPlayingAppBundleIdentifier
{
  return self->_nowPlayingAppBundleIdentifier;
}

- (void)setNowPlayingAppBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingAppBundleIdentifier, 0);
}

@end
