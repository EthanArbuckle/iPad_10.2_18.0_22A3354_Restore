@implementation SUCoreUpdateDownloaderParam

- (SUCoreUpdateDownloaderParam)initWithProgress:(id)a3
{
  id v5;
  SUCoreUpdateDownloaderParam *v6;
  SUCoreUpdateDownloaderParam *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUCoreUpdateDownloaderParam;
  v6 = -[SUCoreUpdateDownloaderParam init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_progress, a3);
    v7->_type = 1;
  }

  return v7;
}

- (SUCoreUpdateDownloaderParam)initWithError:(id)a3
{
  id v5;
  SUCoreUpdateDownloaderParam *v6;
  SUCoreUpdateDownloaderParam *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUCoreUpdateDownloaderParam;
  v6 = -[SUCoreUpdateDownloaderParam init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_error, a3);
    v7->_type = 2;
  }

  return v7;
}

- (SUCoreUpdateDownloaderParam)initWithNote:(id)a3
{
  id v5;
  SUCoreUpdateDownloaderParam *v6;
  SUCoreUpdateDownloaderParam *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUCoreUpdateDownloaderParam;
  v6 = -[SUCoreUpdateDownloaderParam init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_note, a3);
    v7->_type = 3;
  }

  return v7;
}

- (SUCoreUpdateDownloaderParam)init
{
  SUCoreUpdateDownloaderParam *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUCoreUpdateDownloaderParam;
  result = -[SUCoreUpdateDownloaderParam init](&v3, sel_init);
  if (result)
    result->_type = 0;
  return result;
}

- (id)description
{
  uint64_t type;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  type = self->_type;
  if ((_DWORD)type == 3)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[SUCoreUpdateDownloaderParam note](self, "note");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("\n[>>>\n    note: %@\n<<<]"), v4);
LABEL_7:
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if ((_DWORD)type == 2)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    -[SUCoreUpdateDownloaderParam error](self, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("\n[>>>\n    error: %@\n<<<]"), v4);
    goto LABEL_7;
  }
  if ((_DWORD)type != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NO_INFO[%d]"), type);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SUCoreUpdateDownloaderParam progress](self, "progress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "summary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\n[>>>\n    progress: %@\n<<<]"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v6;
}

- (SUCoreProgress)progress
{
  return self->_progress;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)note
{
  return self->_note;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

@end
