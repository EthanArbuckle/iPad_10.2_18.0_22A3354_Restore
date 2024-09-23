@implementation SKGAttributeProcessor

+ (id)sharedProcessor
{
  if (sharedProcessor_onceToken_0 != -1)
    dispatch_once(&sharedProcessor_onceToken_0, &__block_literal_global_1);
  return (id)sharedProcessor_sSharedProcessor;
}

void __40__SKGAttributeProcessor_sharedProcessor__block_invoke()
{
  SKGAttributeProcessor *v0;
  void *v1;

  v0 = objc_alloc_init(SKGAttributeProcessor);
  v1 = (void *)sharedProcessor_sSharedProcessor;
  sharedProcessor_sSharedProcessor = (uint64_t)v0;

}

+ (id)sharedImporterProcessor
{
  if (sharedImporterProcessor_onceToken != -1)
    dispatch_once(&sharedImporterProcessor_onceToken, &__block_literal_global_1);
  return (id)sharedImporterProcessor_sSharedProcessor;
}

void __48__SKGAttributeProcessor_sharedImporterProcessor__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[SKGAttributeProcessor initForImporter]([SKGAttributeProcessor alloc], "initForImporter");
  v1 = (void *)sharedImporterProcessor_sSharedProcessor;
  sharedImporterProcessor_sSharedProcessor = (uint64_t)v0;

}

- (SKGAttributeProcessor)init
{
  SKGAttributeProcessor *v2;
  SKGProcessorConnection *v3;
  SKGProcessorConnection *connection;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKGAttributeProcessor;
  v2 = -[SKGAttributeProcessor init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SKGProcessorConnection);
    connection = v2->_connection;
    v2->_connection = v3;

  }
  return v2;
}

- (id)initForImporter
{
  SKGAttributeProcessor *v2;
  SKGProcessorConnection *v3;
  SKGProcessorConnection *connection;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKGAttributeProcessor;
  v2 = -[SKGAttributeProcessor init](&v6, sel_init);
  if (v2)
  {
    v3 = -[SKGProcessorConnection initForImporter]([SKGProcessorConnection alloc], "initForImporter");
    connection = v2->_connection;
    v2->_connection = v3;

  }
  return v2;
}

- (id)processorAttributesForRecord:(id)a3 bundleID:(id)a4 protectionClass:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_kMDItemNeedsEmbeddings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11
    || (objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_kMDItemNeedsPriority")),
        (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_4:
    v12 = (id)MEMORY[0x24BDBD1B8];
    goto LABEL_5;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_kMDItemNeedsKeyphrases"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    goto LABEL_4;
  +[SKGProcessorContext sharedContext](SKGProcessorContext, "sharedContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "enableEmbeddings");

  if (v16)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_kMDItemEmbeddingsSN"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {

    }
    else
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kMDItemEmbeddingVersion"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        +[SKGProcessor sharedProcessor](SKGProcessor, "sharedProcessor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "needsEmbeddingsForRecord:", v7);

        +[SKGProcessor sharedProcessor](SKGProcessor, "sharedProcessor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "shouldGenerateEmbeddingsForRecord:bundleID:", v7, v8);

        if (v20 && v22)
        {
          objc_msgSend(v10, "setObject:forKey:", &unk_251904E40, CFSTR("_kMDItemNeedsEmbeddings"));
          +[SKGProcessor sharedProcessor](SKGProcessor, "sharedProcessor");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "needsPriorityForRecord:bundleID:", v7, v8);

          if (v24)
            objc_msgSend(v10, "setObject:forKey:", &unk_251904E40, CFSTR("_kMDItemNeedsPriority"));
        }
        else
        {
          v25 = (void *)MEMORY[0x24BDD16E0];
          +[SKGProcessorContext sharedContext](SKGProcessorContext, "sharedContext");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "numberWithInteger:", objc_msgSend(v26, "embeddingVersion"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKey:", v27, CFSTR("kMDItemEmbeddingVersion"));

        }
      }
    }
  }
  +[SKGProcessorContext sharedContext](SKGProcessorContext, "sharedContext");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "enableKeyphrases");

  if (v29)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_kMDItemKeyphrasesSN"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {

    }
    else
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kMDItemKeyphraseVersion"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v31)
      {
        if (v9)
        {
          if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD0CD0]) & 1) != 0)
            v32 = 0;
          else
            v32 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD0CD8]) ^ 1;
        }
        else
        {
          v32 = 1;
        }
        +[SKGProcessor sharedProcessor](SKGProcessor, "sharedProcessor");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "needsKeyphrasesForRecord:", v7);

        +[SKGProcessor sharedProcessor](SKGProcessor, "sharedProcessor");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "shouldGenerateKeyphrasesForRecord:bundleID:", v7, v8);

        if (v34 && v36 && v32)
        {
          objc_msgSend(v10, "setObject:forKey:", &unk_251904E40, CFSTR("_kMDItemNeedsKeyphrases"));
        }
        else
        {
          v37 = (void *)MEMORY[0x24BDD16E0];
          +[SKGProcessorContext sharedContext](SKGProcessorContext, "sharedContext");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "numberWithInteger:", objc_msgSend(v38, "keyphraseVersion"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKey:", v39, CFSTR("kMDItemKeyphraseVersion"));

        }
      }
    }
  }
  v12 = v10;
LABEL_5:

  return v12;
}

- (id)addUpdaterAttributesForMDPlistRecord:(id *)a3 bundleID:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  $B6B5D22F3C895CC76FFD52FC98D9FBEB v9;

  v9 = *a3;
  v5 = a4;
  v6 = (void *)_MDPlistContainerCopyObject();
  -[SKGAttributeProcessor processorAttributesForRecord:bundleID:protectionClass:](self, "processorAttributesForRecord:bundleID:protectionClass:", v6, v5, 0, *(_OWORD *)&v9.var0, *(_QWORD *)&v9.var2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)processRecord:(id)a3 referenceIdentifier:(id)a4 protectionClass:(id)a5 includeEmbeddings:(BOOL)a6 includeKeyphrases:(BOOL)a7 includePeople:(BOOL)a8 completionHandler:(id)a9
{
  -[SKGProcessorConnection processRecord:referenceIdentifier:protectionClass:includeEmbeddings:includeKeyphrases:includePeople:completionHandler:](self->_connection, "processRecord:referenceIdentifier:protectionClass:includeEmbeddings:includeKeyphrases:includePeople:completionHandler:", a3, a4, a5, a6, a7, a8);
}

- (void)updateCheckedInClientWithBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  -[SKGProcessorConnection updateCheckedInClientWithBundleIdentifier:completionHandler:](self->_connection, "updateCheckedInClientWithBundleIdentifier:completionHandler:", a3, a4);
}

- (void)setTurboMode:(BOOL)a3
{
  -[SKGProcessorConnection setTurboMode:](self->_connection, "setTurboMode:", a3);
}

- (void)checkProcessingReportForBundleIdentifier:(id)a3 flags:(unint64_t)a4 timeout:(unint64_t)a5 completion:(id)a6
{
  -[SKGProcessorConnection checkProcessingReportForBundleIdentifier:flags:timeout:completion:](self->_connection, "checkProcessingReportForBundleIdentifier:flags:timeout:completion:", a3, a4, a5, a6);
}

- (void)getEmbeddingProgressReport:(id)a3
{
  -[SKGProcessorConnection getEmbeddingGenerationProgressReport:](self->_connection, "getEmbeddingGenerationProgressReport:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
