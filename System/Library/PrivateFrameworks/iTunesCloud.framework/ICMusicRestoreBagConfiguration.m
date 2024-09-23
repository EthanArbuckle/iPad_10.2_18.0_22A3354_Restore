@implementation ICMusicRestoreBagConfiguration

- (ICMusicRestoreBagConfiguration)initWithServerConfiguration:(id)a3
{
  id v4;
  ICMusicRestoreBagConfiguration *v5;
  uint64_t v6;
  NSArray *allowedKinds;
  uint64_t v8;
  NSArray *allowedMatchStatus;
  uint64_t v10;
  NSArray *v11;
  void *v12;
  uint64_t v13;
  NSURL *restoreURL;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ICMusicRestoreBagConfiguration;
  v5 = -[ICMusicRestoreBagConfiguration init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "ic_arrayValueForKey:", CFSTR("allowed-kinds"));
    v6 = objc_claimAutoreleasedReturnValue();
    allowedKinds = v5->_allowedKinds;
    v5->_allowedKinds = (NSArray *)v6;

    objc_msgSend(v4, "ic_arrayValueForKey:", CFSTR("allowed-match-status"));
    v8 = objc_claimAutoreleasedReturnValue();
    allowedMatchStatus = v5->_allowedMatchStatus;
    v5->_allowedMatchStatus = (NSArray *)v8;

    if (!v5->_allowedMatchStatus)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", &unk_1E43E65C8, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v5->_allowedMatchStatus;
      v5->_allowedMatchStatus = (NSArray *)v10;

    }
    v5->_shouldGZip = objc_msgSend(v4, "ic_BOOLValueForKey:", CFSTR("gzip"));
    objc_msgSend(v4, "ic_stringValueForKey:", CFSTR("url"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      restoreURL = v5->_restoreURL;
      v5->_restoreURL = (NSURL *)v13;

    }
  }

  return v5;
}

- (NSArray)allowedKinds
{
  return self->_allowedKinds;
}

- (NSArray)allowedMatchStatus
{
  return self->_allowedMatchStatus;
}

- (NSURL)restoreURL
{
  return self->_restoreURL;
}

- (BOOL)shouldGZip
{
  return self->_shouldGZip;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restoreURL, 0);
  objc_storeStrong((id *)&self->_allowedMatchStatus, 0);
  objc_storeStrong((id *)&self->_allowedKinds, 0);
}

@end
