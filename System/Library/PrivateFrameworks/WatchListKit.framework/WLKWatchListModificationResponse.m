@implementation WLKWatchListModificationResponse

- (WLKWatchListModificationResponse)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("WLKWatchListModificationResponse"), CFSTR("-init is not supported"));

  return 0;
}

- (WLKWatchListModificationResponse)initWithDictionary:(id)a3
{
  id v4;
  WLKWatchListModificationResponse *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WLKWatchListModificationResponse;
  v5 = -[WLKWatchListModificationResponse init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "wlk_dictionaryForKey:", CFSTR("data"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "wlk_BOOLForKey:defaultValue:", CFSTR("alreadyOnList"), 0) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      if (!objc_msgSend(v6, "wlk_BOOLForKey:defaultValue:", CFSTR("notOnList"), 0))
      {
LABEL_7:

        goto LABEL_8;
      }
      v7 = 2;
    }
    v5->_responseType = v7;
    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

- (int64_t)responseType
{
  return self->_responseType;
}

@end
