@implementation WBSInternalFeedbackRadar

- (WBSInternalFeedbackRadar)initWithComponent:(id)a3 title:(id)a4 descriptionTemplate:(id)a5
{
  id v8;
  id v9;
  id v10;
  WBSInternalFeedbackRadar *result;
  WBSInternalFeedbackRadar *v12;
  uint64_t v13;
  WBSInternalFeedbackRadarComponent *component;
  uint64_t v15;
  NSString *title;
  uint64_t v17;
  NSString *descriptionTemplate;
  WBSInternalFeedbackRadar *v19;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  result = (WBSInternalFeedbackRadar *)objc_msgSend(MEMORY[0x1E0D89BE8], "isInternalInstall");
  if ((result & 1) != 0)
  {
    v20.receiver = self;
    v20.super_class = (Class)WBSInternalFeedbackRadar;
    v12 = -[WBSInternalFeedbackRadar init](&v20, sel_init);
    if (v12)
    {
      v13 = objc_msgSend(v8, "copy");
      component = v12->_component;
      v12->_component = (WBSInternalFeedbackRadarComponent *)v13;

      v15 = objc_msgSend(v9, "copy");
      title = v12->_title;
      v12->_title = (NSString *)v15;

      v17 = objc_msgSend(v10, "copy");
      descriptionTemplate = v12->_descriptionTemplate;
      v12->_descriptionTemplate = (NSString *)v17;

      v19 = v12;
    }

    return v12;
  }
  else
  {
    __break(0xC471u);
  }
  return result;
}

- (NSURL)continueInTapToRadarURL
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v3, "setScheme:", CFSTR("tap-to-radar"));
  objc_msgSend(v3, "setHost:", CFSTR("new"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSInternalFeedbackRadarComponent identifier](self->_component, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  appendToQueryItems(v4, (uint64_t)CFSTR("ComponentID"), (uint64_t)v5);

  -[WBSInternalFeedbackRadarComponent name](self->_component, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  appendToQueryItems(v4, (uint64_t)CFSTR("ComponentName"), (uint64_t)v6);

  -[WBSInternalFeedbackRadarComponent version](self->_component, "version");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  appendToQueryItems(v4, (uint64_t)CFSTR("ComponentVersion"), (uint64_t)v7);

  appendToQueryItems(v4, (uint64_t)CFSTR("Title"), (uint64_t)self->_title);
  appendToQueryItems(v4, (uint64_t)CFSTR("Description"), (uint64_t)self->_descriptionTemplate);
  appendToQueryItems(v4, (uint64_t)CFSTR("Classification"), (uint64_t)self->_classification);
  appendToQueryItems(v4, (uint64_t)CFSTR("Reproducibility"), (uint64_t)self->_reproducibility);
  -[NSArray componentsJoinedByString:](self->_keywords, "componentsJoinedByString:", CFSTR(","));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  appendToQueryItems(v4, (uint64_t)CFSTR("Keywords"), (uint64_t)v8);

  -[NSArray componentsJoinedByString:](self->_attachmentPaths, "componentsJoinedByString:", CFSTR(","));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  appendToQueryItems(v4, (uint64_t)CFSTR("Attachments"), (uint64_t)v9);

  objc_msgSend(v3, "setQueryItems:", v4);
  objc_msgSend(v3, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v10;
}

- (WBSInternalFeedbackRadarComponent)component
{
  return self->_component;
}

- (void)setComponent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)descriptionTemplate
{
  return self->_descriptionTemplate;
}

- (void)setDescriptionTemplate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)classification
{
  return self->_classification;
}

- (void)setClassification:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)reproducibility
{
  return self->_reproducibility;
}

- (void)setReproducibility:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)keywords
{
  return self->_keywords;
}

- (void)setKeywords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)attachmentPaths
{
  return self->_attachmentPaths;
}

- (void)setAttachmentPaths:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentPaths, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_reproducibility, 0);
  objc_storeStrong((id *)&self->_classification, 0);
  objc_storeStrong((id *)&self->_descriptionTemplate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_component, 0);
}

@end
