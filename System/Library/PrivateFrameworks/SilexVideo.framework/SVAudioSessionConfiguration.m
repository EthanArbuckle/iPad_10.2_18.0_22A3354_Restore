@implementation SVAudioSessionConfiguration

- (SVAudioSessionConfiguration)initWithCategory:(id)a3 mode:(id)a4 policy:(unint64_t)a5
{
  id v9;
  id v10;
  SVAudioSessionConfiguration *v11;
  SVAudioSessionConfiguration *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SVAudioSessionConfiguration;
  v11 = -[SVAudioSessionConfiguration init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_category, a3);
    objc_storeStrong((id *)&v12->_mode, a4);
    v12->_routeSharingPolicy = a5;
  }

  return v12;
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  BOOL v10;

  v4 = a3;
  -[SVAudioSessionConfiguration category](self, "category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[SVAudioSessionConfiguration mode](self, "mode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      v9 = -[SVAudioSessionConfiguration routeSharingPolicy](self, "routeSharingPolicy");
      v10 = v9 == objc_msgSend(v4, "routeSharingPolicy");
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)mode
{
  return self->_mode;
}

- (void)setMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)routeSharingPolicy
{
  return self->_routeSharingPolicy;
}

- (void)setRouteSharingPolicy:(unint64_t)a3
{
  self->_routeSharingPolicy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mode, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

@end
