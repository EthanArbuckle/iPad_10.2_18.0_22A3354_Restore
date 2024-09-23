@implementation WLKChannelResponse

- (WLKChannelResponse)initWithDictionary:(id)a3 expirationDate:(id)a4 environmentHash:(unint64_t)a5
{
  id v6;
  WLKChannelResponse *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  WLKChannelResponse *v12;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WLKChannelResponse;
  v7 = -[WLKChannelResponse init](&v13, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "wlk_dictionaryForKey:", CFSTR("channel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__WLKChannelResponse_initWithDictionary_expirationDate_environmentHash___block_invoke;
    v11[3] = &unk_1E68A8DD8;
    v12 = v7;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v11);

  }
  return v7;
}

void __72__WLKChannelResponse_initWithDictionary_expirationDate_environmentHash___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v7, "wlk_stringForKey:", CFSTR("title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v6, "setChannelTitle:", v9);

  v10 = *(void **)(a1 + 32);
  objc_msgSend(v7, "wlk_stringForKey:", CFSTR("url"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v10, "setChannelLink:", v12);

  *a4 = 1;
}

- (NSString)channelTitle
{
  return self->_channelTitle;
}

- (void)setChannelTitle:(id)a3
{
  objc_storeStrong((id *)&self->_channelTitle, a3);
}

- (NSString)channelLink
{
  return self->_channelLink;
}

- (void)setChannelLink:(id)a3
{
  objc_storeStrong((id *)&self->_channelLink, a3);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)environmentHash
{
  return self->_environmentHash;
}

- (void)setEnvironmentHash:(unint64_t)a3
{
  self->_environmentHash = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_channelLink, 0);
  objc_storeStrong((id *)&self->_channelTitle, 0);
}

@end
