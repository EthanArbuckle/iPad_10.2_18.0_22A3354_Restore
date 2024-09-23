@implementation SUDownload

- (SUDownload)init
{
  SUDownload *v2;
  SUDownload *v3;
  SUOperationProgress *progress;
  SUDescriptor *descriptor;
  SUDownloadOptions *downloadOptions;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUDownload;
  v2 = -[SUDownload init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    progress = v2->_progress;
    v2->_progress = 0;

    descriptor = v3->_descriptor;
    v3->_descriptor = 0;

    downloadOptions = v3->_downloadOptions;
    v3->_downloadOptions = 0;

    v3->_promoted = 0;
  }
  return v3;
}

- (SUDownloadMetadata)metadata
{
  SUMutableDownloadMetadata *v3;
  void *v4;

  v3 = objc_alloc_init(SUMutableDownloadMetadata);
  -[SUDownloadMetadata setAutoDownload:](v3, "setAutoDownload:", -[SUDownloadOptions isAutoDownload](self->_downloadOptions, "isAutoDownload"));
  -[SUDownloadMetadata setDownloadOnly:](v3, "setDownloadOnly:", -[SUDownloadOptions isDownloadOnly](self->_downloadOptions, "isDownloadOnly"));
  -[SUDownloadMetadata setDownloadFeeAgreementStatus:](v3, "setDownloadFeeAgreementStatus:", -[SUDownloadOptions downloadFeeAgreementStatus](self->_downloadOptions, "downloadFeeAgreementStatus"));
  -[SUDownloadMetadata setTermsAndConditionsAgreementStatus:](v3, "setTermsAndConditionsAgreementStatus:", -[SUDownloadOptions termsAndConditionsAgreementStatus](self->_downloadOptions, "termsAndConditionsAgreementStatus"));
  -[SUDownloadOptions activeDownloadPolicy](self->_downloadOptions, "activeDownloadPolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUMutableDownloadMetadata applyDownloadPolicy:](v3, "applyDownloadPolicy:", v4);

  return (SUDownloadMetadata *)v3;
}

- (SUDownload)initWithCoder:(id)a3
{
  id v4;
  SUDownload *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[SUDownload init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("progress"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDownload setProgress:](v5, "setProgress:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("descriptor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDownload setDescriptor:](v5, "setDescriptor:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("downloadOptions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDownload setDownloadOptions:](v5, "setDownloadOptions:", v8);

    -[SUDownload setPromoted:](v5, "setPromoted:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("promoted")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SUDownload progress](self, "progress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("progress"));

  -[SUDownload descriptor](self, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("descriptor"));

  -[SUDownload downloadOptions](self, "downloadOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("downloadOptions"));

  objc_msgSend(v7, "encodeBool:forKey:", -[SUDownload isPromoted](self, "isPromoted"), CFSTR("promoted"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)-[SUOperationProgress copy](self->_progress, "copy");
  objc_msgSend(v4, "setProgress:", v5);

  v6 = (void *)-[SUDescriptor copy](self->_descriptor, "copy");
  objc_msgSend(v4, "setDescriptor:", v6);

  v7 = (void *)-[SUDownloadOptions copy](self->_downloadOptions, "copy");
  objc_msgSend(v4, "setDownloadOptions:", v7);

  objc_msgSend(v4, "setPromoted:", self->_promoted);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)allowCellularDownload
{
  return -[SUDownloadOptions isEnabledForCellular](self->_downloadOptions, "isEnabledForCellular");
}

- (unint64_t)totalSpaceConsumed
{
  void *v3;
  SUDescriptor *descriptor;
  BOOL v5;
  uint64_t v6;
  unint64_t v7;
  _BOOL4 v8;
  unint64_t v9;
  unint64_t v10;
  float v11;
  float v12;
  float v13;
  float v14;
  SUDescriptor *v16;
  const char *v17;
  SUDescriptor *v18;
  unint64_t v19;
  float v20;

  if (self->_descriptor)
  {
    -[SUOperationProgress phase](self->_progress, "phase");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    descriptor = self->_descriptor;
    if (self->_progress)
      v5 = v3 == 0;
    else
      v5 = 1;
    if (v5)
    {
      v6 = -[SUDescriptor totalRequiredFreeSpace](descriptor, "totalRequiredFreeSpace");
    }
    else
    {
      v8 = -[SUDescriptor _isStreamingZipCapable](descriptor, "_isStreamingZipCapable");
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("SUDownloadPhasePreparingForInstallation")))
      {
        v9 = -[SUDescriptor _unarchiveSize](self->_descriptor, "_unarchiveSize");
        v10 = -[SUDescriptor _msuPrepareSize](self->_descriptor, "_msuPrepareSize");
LABEL_12:
        v11 = (float)v10;
        -[SUOperationProgress percentComplete](self->_progress, "percentComplete");
        v13 = fmaxf(fminf(v12, 1.0), 0.0);
        v14 = (float)v9;
LABEL_13:
        v7 = (unint64_t)(float)(v14 + (float)(v11 * v13));
        goto LABEL_14;
      }
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("SUDownloadPhaseExtracting")))
      {
        v16 = self->_descriptor;
        if (!v8)
        {
          v9 = -[SUDescriptor downloadSize](v16, "downloadSize");
          v10 = -[SUDescriptor _unarchiveSize](self->_descriptor, "_unarchiveSize");
          goto LABEL_12;
        }
      }
      else
      {
        if (!objc_msgSend(v3, "isEqualToString:", CFSTR("SUDownloadPhaseVerifying")))
        {
          if (!SUDownloadPhaseIsFetchingUpdate(v3, v17))
          {
            v7 = 0;
            goto LABEL_14;
          }
          v18 = self->_descriptor;
          if (v8)
            v19 = -[SUDescriptor _unarchiveSize](v18, "_unarchiveSize");
          else
            v19 = -[SUDescriptor downloadSize](v18, "downloadSize");
          v11 = (float)v19;
          -[SUOperationProgress percentComplete](self->_progress, "percentComplete");
          v14 = 0.0;
          v13 = fmaxf(fminf(v20, 1.0), 0.0);
          goto LABEL_13;
        }
        v16 = self->_descriptor;
        if (!v8)
        {
          v6 = -[SUDescriptor downloadSize](v16, "downloadSize");
          goto LABEL_8;
        }
      }
      v6 = -[SUDescriptor _unarchiveSize](v16, "_unarchiveSize");
    }
LABEL_8:
    v7 = v6;
LABEL_14:

    return v7;
  }
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SUDownload descriptor](self, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDownload downloadOptions](self, "downloadOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDownload progress](self, "progress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SUDownload isPromoted](self, "isPromoted");
  v8 = CFSTR("NO");
  if (v7)
    v8 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\n            Descriptor: %@\n            DownloadOptions: %@\n            Progress: %@\n            isPromoted: %@"), v4, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isValidDownload
{
  SUDescriptor *descriptor;

  descriptor = self->_descriptor;
  return descriptor
      && self->_downloadOptions
      && self->_progress
      && -[SUDescriptor isValidDescriptor](descriptor, "isValidDescriptor");
}

- (SUOperationProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (SUDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_descriptor, a3);
}

- (SUDownloadOptions)downloadOptions
{
  return self->_downloadOptions;
}

- (void)setDownloadOptions:(id)a3
{
  objc_storeStrong((id *)&self->_downloadOptions, a3);
}

- (BOOL)isPromoted
{
  return self->_promoted;
}

- (void)setPromoted:(BOOL)a3
{
  self->_promoted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadOptions, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
