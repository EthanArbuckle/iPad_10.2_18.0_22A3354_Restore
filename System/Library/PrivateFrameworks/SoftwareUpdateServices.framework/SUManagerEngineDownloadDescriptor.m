@implementation SUManagerEngineDownloadDescriptor

- (SUManagerEngineDownloadDescriptor)initWithAsset:(id)a3 releaseDate:(id)a4 sessionID:(id)a5 scanOptions:(id)a6 downloadOptions:(id)a7 installTonightConfig:(id)a8 coreDescriptor:(id)a9 downloadAtPhase:(int64_t)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  SUManagerEngineDownloadDescriptor *v23;
  SUManagerEngineDownloadDescriptor *v24;
  SUManagerEngineDownloadDescriptor *v25;
  objc_super v27;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v27.receiver = self;
  v27.super_class = (Class)SUManagerEngineDownloadDescriptor;
  v23 = -[SUManagerEngineDownloadDescriptor init](&v27, sel_init);
  v24 = v23;
  if (v23)
  {
    -[SUManagerEngineDownloadDescriptor setAsset:](v23, "setAsset:", v16);
    -[SUManagerEngineDownloadDescriptor setReleaseDate:](v24, "setReleaseDate:", v17);
    -[SUManagerEngineDownloadDescriptor setSessionID:](v24, "setSessionID:", v18);
    -[SUManagerEngineDownloadDescriptor setScanOptions:](v24, "setScanOptions:", v19);
    -[SUManagerEngineDownloadDescriptor setDownloadOptions:](v24, "setDownloadOptions:", v20);
    -[SUManagerEngineDownloadDescriptor setInstallOptions:](v24, "setInstallOptions:", 0);
    -[SUManagerEngineDownloadDescriptor setInstallTonightConfig:](v24, "setInstallTonightConfig:", v21);
    -[SUManagerEngineDownloadDescriptor setCoreDescriptor:](v24, "setCoreDescriptor:", v22);
    -[SUManagerEngineDownloadDescriptor setAtPhase:](v24, "setAtPhase:", a10);
    v25 = v24;
  }

  return v24;
}

+ (id)phaseToString:(int64_t)a3
{
  if ((unint64_t)a3 > 6)
    return CFSTR("DownloadPhaseUndefined");
  else
    return off_24CE3C7C8[a3];
}

- (id)summary
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

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[SUManagerEngineDownloadDescriptor asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUManagerEngineDownloadDescriptor releaseDate](self, "releaseDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUManagerEngineDownloadDescriptor sessionID](self, "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUManagerEngineDownloadDescriptor scanOptions](self, "scanOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUManagerEngineDownloadDescriptor downloadOptions](self, "downloadOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUManagerEngineDownloadDescriptor installTonightConfig](self, "installTonightConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUManagerEngineDownloadDescriptor phaseToString:](SUManagerEngineDownloadDescriptor, "phaseToString:", -[SUManagerEngineDownloadDescriptor atPhase](self, "atPhase"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUManagerEngineDownloadDescriptor coreDescriptor](self, "coreDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "summary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("asset:%@ releaseDate:%@ sessionID:%@ scanOptions:%@ downloadOptions:%@ installTonightConfig:%@ atPhase:%@, coreDescriptor:%@"), v4, v5, v6, v7, v8, v9, v10, v12);

  return v13;
}

- (void)resetPhase
{
  -[SUManagerEngineDownloadDescriptor setAtPhase:](self, "setAtPhase:", 1);
}

- (BOOL)armInstall:(id)a3
{
  id v4;
  BOOL v5;
  id v6;

  v4 = a3;
  if (-[SUManagerEngineDownloadDescriptor atPhase](self, "atPhase") == 5
    || -[SUManagerEngineDownloadDescriptor atPhase](self, "atPhase") == 6)
  {
    -[SUManagerEngineDownloadDescriptor setAtPhase:](self, "setAtPhase:", 6);
    v5 = 1;
    v6 = v4;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  -[SUManagerEngineDownloadDescriptor setInstallOptions:](self, "setInstallOptions:", v6);

  return v5;
}

- (BOOL)disarmInstall
{
  int64_t v3;

  -[SUManagerEngineDownloadDescriptor setInstallOptions:](self, "setInstallOptions:", 0);
  v3 = -[SUManagerEngineDownloadDescriptor atPhase](self, "atPhase");
  if (v3 == 6)
    -[SUManagerEngineDownloadDescriptor setAtPhase:](self, "setAtPhase:", 5);
  return v3 == 6;
}

- (MAAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (void)setReleaseDate:(id)a3
{
  objc_storeStrong((id *)&self->_releaseDate, a3);
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (SUScanOptions)scanOptions
{
  return self->_scanOptions;
}

- (void)setScanOptions:(id)a3
{
  objc_storeStrong((id *)&self->_scanOptions, a3);
}

- (SUDownloadOptions)downloadOptions
{
  return self->_downloadOptions;
}

- (void)setDownloadOptions:(id)a3
{
  objc_storeStrong((id *)&self->_downloadOptions, a3);
}

- (SUInstallOptions)installOptions
{
  return self->_installOptions;
}

- (void)setInstallOptions:(id)a3
{
  objc_storeStrong((id *)&self->_installOptions, a3);
}

- (NSString)installTonightConfig
{
  return self->_installTonightConfig;
}

- (void)setInstallTonightConfig:(id)a3
{
  objc_storeStrong((id *)&self->_installTonightConfig, a3);
}

- (SUCoreDescriptor)coreDescriptor
{
  return self->_coreDescriptor;
}

- (void)setCoreDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_coreDescriptor, a3);
}

- (int64_t)atPhase
{
  return self->_atPhase;
}

- (void)setAtPhase:(int64_t)a3
{
  self->_atPhase = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreDescriptor, 0);
  objc_storeStrong((id *)&self->_installTonightConfig, 0);
  objc_storeStrong((id *)&self->_installOptions, 0);
  objc_storeStrong((id *)&self->_downloadOptions, 0);
  objc_storeStrong((id *)&self->_scanOptions, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
