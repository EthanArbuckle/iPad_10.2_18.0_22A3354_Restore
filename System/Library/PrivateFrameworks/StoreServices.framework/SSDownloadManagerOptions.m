@implementation SSDownloadManagerOptions

- (void)setPrefetchedDownloadProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setDownloadKinds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setPrefetchedDownloadExternalProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setShouldFilterExternalOriginatedDownloads:(BOOL)a3
{
  self->_filterExternalOriginatedDownloads = a3;
}

- (NSArray)downloadKinds
{
  return self->_downloadKinds;
}

- (BOOL)shouldFilterExternalOriginatedDownloads
{
  return self->_filterExternalOriginatedDownloads;
}

- (NSArray)prefetchedDownloadProperties
{
  return self->_prefetchedDownloadProperties;
}

- (NSArray)prefetchedDownloadExternalProperties
{
  return self->_prefetchedDownloadExternalProperties;
}

- (NSString)persistenceIdentifier
{
  return self->_persistenceIdentifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSArray copyWithZone:](self->_downloadKinds, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  *(_BYTE *)(v5 + 16) = self->_filterExternalOriginatedDownloads;
  *(_BYTE *)(v5 + 48) = self->_ignoreDivertedDownloads;
  v8 = -[NSString copyWithZone:](self->_persistenceIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSArray copyWithZone:](self->_prefetchedDownloadExternalProperties, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v12 = -[NSArray copyWithZone:](self->_prefetchedDownloadProperties, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  return (id)v5;
}

- (void)setPersistenceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchedDownloadProperties, 0);
  objc_storeStrong((id *)&self->_prefetchedDownloadExternalProperties, 0);
  objc_storeStrong((id *)&self->_persistenceIdentifier, 0);
  objc_storeStrong((id *)&self->_downloadKinds, 0);
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_downloadKinds, "hash");
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  uint64_t v7;
  int v8;
  int v9;
  char v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v6 = a3;
  v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    v8 = -[SSDownloadManagerOptions shouldFilterExternalOriginatedDownloads](self, "shouldFilterExternalOriginatedDownloads");
    if (v8 == objc_msgSend(v6, "shouldFilterExternalOriginatedDownloads"))
    {
      v9 = -[SSDownloadManagerOptions ignoreDivertedDownloads](self, "ignoreDivertedDownloads");
      if (v9 == objc_msgSend(v6, "ignoreDivertedDownloads"))
      {
        -[SSDownloadManagerOptions persistenceIdentifier](self, "persistenceIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "persistenceIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 != v13)
        {
          -[SSDownloadManagerOptions persistenceIdentifier](self, "persistenceIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "persistenceIdentifier");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v14;
          if (!objc_msgSend(v14, "isEqual:", v3))
          {
            v10 = 0;
            goto LABEL_26;
          }
        }
        -[SSDownloadManagerOptions downloadKinds](self, "downloadKinds");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "downloadKinds");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15 != v16)
        {
          -[SSDownloadManagerOptions downloadKinds](self, "downloadKinds");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "downloadKinds");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v17, "isEqualToArray:", v4))
          {
            v10 = 0;
LABEL_24:

LABEL_25:
            if (v12 == v13)
            {
LABEL_27:

              goto LABEL_5;
            }
LABEL_26:

            goto LABEL_27;
          }
          v35 = v17;
        }
        -[SSDownloadManagerOptions prefetchedDownloadExternalProperties](self, "prefetchedDownloadExternalProperties");
        v18 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "prefetchedDownloadExternalProperties");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)v18;
        if ((void *)v18 == v19)
        {
          v31 = v4;
          v32 = v16;
        }
        else
        {
          -[SSDownloadManagerOptions prefetchedDownloadExternalProperties](self, "prefetchedDownloadExternalProperties");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "prefetchedDownloadExternalProperties");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v20;
          if (!objc_msgSend(v20, "isEqualToArray:"))
          {
            v10 = 0;
            v29 = v36;
            goto LABEL_22;
          }
          v31 = v4;
          v32 = v16;
        }
        -[SSDownloadManagerOptions prefetchedDownloadProperties](self, "prefetchedDownloadProperties");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "prefetchedDownloadProperties");
        v22 = objc_claimAutoreleasedReturnValue();
        if (v21 == (void *)v22)
        {

          v10 = 1;
        }
        else
        {
          v23 = (void *)v22;
          -[SSDownloadManagerOptions prefetchedDownloadProperties](self, "prefetchedDownloadProperties");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "prefetchedDownloadProperties");
          v30 = v13;
          v25 = v12;
          v26 = v15;
          v27 = v3;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v24, "isEqualToArray:", v28);

          v3 = v27;
          v15 = v26;
          v12 = v25;
          v13 = v30;

        }
        v29 = v36;
        v4 = v31;
        v16 = v32;
        if (v36 == v19)
        {
LABEL_23:

          v17 = v35;
          if (v15 == v16)
            goto LABEL_25;
          goto LABEL_24;
        }
LABEL_22:

        goto LABEL_23;
      }
    }
  }
  v10 = 0;
LABEL_5:

  return v10;
}

- (BOOL)ignoreDivertedDownloads
{
  return self->_ignoreDivertedDownloads;
}

- (void)setIgnoreDivertedDownloads:(BOOL)a3
{
  self->_ignoreDivertedDownloads = a3;
}

@end
