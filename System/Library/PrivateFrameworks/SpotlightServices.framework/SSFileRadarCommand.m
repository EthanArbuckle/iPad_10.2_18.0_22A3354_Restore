@implementation SSFileRadarCommand

+ (id)buildVersion
{
  if (buildVersion_onceToken != -1)
    dispatch_once(&buildVersion_onceToken, &__block_literal_global_9);
  return (id)buildVersion_buildVersion;
}

void __34__SSFileRadarCommand_buildVersion__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Build>"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)buildVersion_buildVersion;
  buildVersion_buildVersion = v0;

  v3 = (id)_CFCopySupplementalVersionDictionary();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB90]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_storeStrong((id *)&buildVersion_buildVersion, v2);

}

+ (id)internalReleaseAgreement
{
  return CFSTR("I agree that Apple and its strategic partners may use, adapt, modify, reproduce, and distribute internally in perpetuity, the images that I am providing with this bug report (“Images”), for the purpose of improving the machine vision capabilities of Apple products. Apple may not use the Images in any other fashion than as provided herein.  Please do not provide any images that contain third parties or for which you do not have sufficient rights.\n\nI represent that the Images are original to and/or owned by me and that I have the rights necessary to grant to Apple the rights provided herein.  I release Apple, its agents, employees, licensees and assigns from any and all claims I may have now or in the future for invasion of privacy, right of publicity, trademark infringement, copyright infringement, defamation or any other cause of action arising out of the use or reproduction of the Images.\n\nI have read and fully understand the foregoing and hereby acknowledge my agreement to its terms.");
}

- (SSFileRadarCommand)init
{
  return -[SSFileRadarCommand initWithQueryString:](self, "initWithQueryString:", 0);
}

- (SSFileRadarCommand)initWithQueryString:(id)a3
{
  __CFString *v4;
  SPSearchQueryContext *v5;
  const __CFString *v6;
  SPSearchQueryContext *v7;
  SSFileRadarCommand *v8;

  v4 = (__CFString *)a3;
  v5 = [SPSearchQueryContext alloc];
  if (v4)
    v6 = v4;
  else
    v6 = &stru_1E6E549F0;
  v7 = -[SPSearchQueryContext initWithSearchString:](v5, "initWithSearchString:", v6);

  v8 = -[SSFileRadarCommand initWithQueryContext:](self, "initWithQueryContext:", v7);
  return v8;
}

- (SSFileRadarCommand)initWithQueryContext:(id)a3
{
  id v4;
  SSFileRadarCommand *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SSFileRadarCommand;
  v5 = -[SSFileRadarCommand init](&v28, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "queryKind");
    objc_msgSend(v4, "searchEntities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "searchString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(v8, "searchString");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v12)
        v14 = (__CFString *)v12;
      else
        v14 = &stru_1E6E549F0;
      v11 = v14;

    }
    objc_msgSend(v8, "tokenText");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = (__CFString *)v15;
    else
      v17 = &stru_1E6E549F0;
    v18 = v17;

    v19 = (void *)MEMORY[0x1E0CB37A0];
    objc_msgSend((id)objc_opt_class(), "internalReleaseAgreement");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("Problem Summary: \n\nSteps to Reproduce: \n\nRegression Information: \n\n*** Note: Debug info contains the titles of items in the UI. Please review for confidential information. \n\n%@ \n***\n\n===  DEBUG INFO  ===\n\n"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "buildVersion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "appendFormat:", CFSTR("Build: %@\n\n"), v22);

    objc_msgSend(v21, "appendFormat:", CFSTR("Query: %@\n"), v11);
    objc_msgSend(v21, "appendFormat:", CFSTR("Token: %@\n"), v18);

    objc_msgSend(v21, "appendFormat:", CFSTR("Committed search: %d\n"), (unint64_t)(v6 - 5) < 4);
    objc_msgSend(v21, "appendFormat:", CFSTR("Query kind: %lu\n\n"), v6);
    -[SSFileRadarCommand setQueryContext:](v5, "setQueryContext:", v4);
    -[SSFileRadarCommand setComponentName:](v5, "setComponentName:", CFSTR("Spotlight (New Bugs)"));
    if (isMacOS())
      v23 = CFSTR("macOS");
    else
      v23 = CFSTR("iOS");
    -[SSFileRadarCommand setComponentVersion:](v5, "setComponentVersion:", v23);
    if (isMacOS())
      v24 = 624062;
    else
      v24 = 312963;
    -[SSFileRadarCommand setComponentID:](v5, "setComponentID:", v24);
    -[SSFileRadarCommand setClassification:](v5, "setClassification:", CFSTR("Other Bug"));
    -[SSFileRadarCommand setReproducibility:](v5, "setReproducibility:", CFSTR("I Didn't Try"));
    -[SSFileRadarCommand setTitle:](v5, "setTitle:", &stru_1E6E549F0);
    -[SSFileRadarCommand setProblemDescription:](v5, "setProblemDescription:", v21);
    -[SSFileRadarCommand sections](v5, "sections");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    SSExtensionIdentifiersForSections(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSFileRadarCommand setExtensionIdentifiers:](v5, "setExtensionIdentifiers:", v26);

  }
  return v5;
}

- (void)setSections:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_sections, a3);
  v5 = a3;
  SSExtensionIdentifiersForSections(v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[SSFileRadarCommand setExtensionIdentifiers:](self, "setExtensionIdentifiers:", v6);
}

- (unint64_t)componentID
{
  return self->_componentID;
}

- (void)setComponentID:(unint64_t)a3
{
  self->_componentID = a3;
}

- (NSString)componentName
{
  return self->_componentName;
}

- (void)setComponentName:(id)a3
{
  objc_storeStrong((id *)&self->_componentName, a3);
}

- (NSString)componentVersion
{
  return self->_componentVersion;
}

- (void)setComponentVersion:(id)a3
{
  objc_storeStrong((id *)&self->_componentVersion, a3);
}

- (NSString)classification
{
  return self->_classification;
}

- (void)setClassification:(id)a3
{
  objc_storeStrong((id *)&self->_classification, a3);
}

- (NSString)reproducibility
{
  return self->_reproducibility;
}

- (void)setReproducibility:(id)a3
{
  objc_storeStrong((id *)&self->_reproducibility, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)problemDescription
{
  return self->_problemDescription;
}

- (void)setProblemDescription:(id)a3
{
  objc_storeStrong((id *)&self->_problemDescription, a3);
}

- (NSArray)extensionIdentifiers
{
  return self->_extensionIdentifiers;
}

- (void)setExtensionIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_extensionIdentifiers, a3);
}

- (NSArray)attachmentPaths
{
  return self->_attachmentPaths;
}

- (void)setAttachmentPaths:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentPaths, a3);
}

- (NSArray)sections
{
  return self->_sections;
}

- (SSRankingManager)rankingManager
{
  return self->_rankingManager;
}

- (void)setRankingManager:(id)a3
{
  objc_storeStrong((id *)&self->_rankingManager, a3);
}

- (SPSearchQueryContext)queryContext
{
  return self->_queryContext;
}

- (void)setQueryContext:(id)a3
{
  objc_storeStrong((id *)&self->_queryContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryContext, 0);
  objc_storeStrong((id *)&self->_rankingManager, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_attachmentPaths, 0);
  objc_storeStrong((id *)&self->_extensionIdentifiers, 0);
  objc_storeStrong((id *)&self->_problemDescription, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_reproducibility, 0);
  objc_storeStrong((id *)&self->_classification, 0);
  objc_storeStrong((id *)&self->_componentVersion, 0);
  objc_storeStrong((id *)&self->_componentName, 0);
}

@end
