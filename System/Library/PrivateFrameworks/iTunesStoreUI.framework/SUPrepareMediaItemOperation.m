@implementation SUPrepareMediaItemOperation

- (SUPrepareMediaItemOperation)init
{
  return -[SUPrepareMediaItemOperation initWithMediaPlayerItem:](self, "initWithMediaPlayerItem:", 0);
}

- (SUPrepareMediaItemOperation)initWithMediaPlayerItem:(id)a3
{
  SUPrepareMediaItemOperation *v5;
  objc_super v7;

  if (!objc_msgSend(a3, "URL"))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Must have a URL to prepare a media item"));
  v7.receiver = self;
  v7.super_class = (Class)SUPrepareMediaItemOperation;
  v5 = -[SUPrepareMediaItemOperation init](&v7, sel_init);
  if (v5)
    v5->_mediaItem = (SUMediaPlayerItem *)objc_msgSend(a3, "copy");
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUPrepareMediaItemOperation;
  -[SUPrepareMediaItemOperation dealloc](&v3, sel_dealloc);
}

- (void)run
{
  _BOOL8 v3;
  uint64_t v4;

  v4 = 0;
  v3 = -[SUPrepareMediaItemOperation _runHEADRequest:](self, "_runHEADRequest:", &v4);
  -[SUPrepareMediaItemOperation setError:](self, "setError:", v4);
  -[SUPrepareMediaItemOperation setSuccess:](self, "setSuccess:", v3);
}

- (BOOL)_runHEADRequest:(id *)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  char v13;
  int *v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  v5 = objc_alloc_init(MEMORY[0x24BEC8C58]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F30]), "initWithURL:", -[SUMediaPlayerItem URL](self->_mediaItem, "URL"));
  objc_msgSend(v6, "setAllowedRetryCount:", 0);
  objc_msgSend(v6, "setHTTPMethod:", CFSTR("HEAD"));
  objc_msgSend(v5, "setRequestProperties:", v6);
  v7 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v9 = v8 | 2;
  else
    v9 = v8;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_DEBUG))
    v9 &= 2u;
  if (v9)
  {
    v18 = 138412546;
    v19 = objc_opt_class();
    v20 = 2112;
    v21 = objc_msgSend(v6, "URL");
    LODWORD(v16) = 22;
    v15 = &v18;
    v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      v11 = (void *)v10;
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, &v18, v16);
      free(v11);
      v15 = (int *)v12;
      SSFileLog();
    }
  }
  v13 = -[SUPrepareMediaItemOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v5, &v17, v15);

  if (a3)
    *a3 = v17;
  return v13;
}

- (SUMediaPlayerItem)mediaPlayerItem
{
  return self->_mediaItem;
}

@end
