@implementation SKUIReportAConcernConfiguration

+ (SKUIReportAConcernConfiguration)configurationWithTemplateElement:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v32[4];
  id v33;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
      {
        +[SKUIReportAConcernConfiguration configurationWithTemplateElement:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
        if (v4)
          goto LABEL_5;
LABEL_7:
        v13 = 0;
        goto LABEL_8;
      }
    }
  }
  if (!v4)
    goto LABEL_7;
LABEL_5:
  v13 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "reportConcernURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setReportConcernURL:", v14);

  objc_msgSend(v13, "setItemIdentifier:", objc_msgSend(v4, "itemIdentifier"));
  objc_msgSend(v4, "reportConcernExplanation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setReportConcernExplanation:", v15);

  objc_msgSend(v4, "firstChildForElementName:", CFSTR("title"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "text");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "attributedString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "string");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSelectReasonTitle:", v19);

  objc_msgSend(v4, "firstChildForElementName:", CFSTR("subtitle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "text");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "attributedString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "string");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSelectReasonSubtitle:", v23);

  objc_msgSend(v4, "firstChildForElementName:", CFSTR("text"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "text");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "attributedString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "string");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPrivacyNote:", v27);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reasonElements");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __68__SKUIReportAConcernConfiguration_configurationWithTemplateElement___block_invoke;
  v32[3] = &unk_1E73A7FC8;
  v33 = v28;
  v30 = v28;
  objc_msgSend(v29, "enumerateObjectsUsingBlock:", v32);

  objc_msgSend(v13, "setReasons:", v30);
LABEL_8:

  return (SKUIReportAConcernConfiguration *)v13;
}

void __68__SKUIReportAConcernConfiguration_configurationWithTemplateElement___block_invoke(uint64_t a1, void *a2)
{
  SKUIReportAConcernReason *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = objc_alloc_init(SKUIReportAConcernReason);
  objc_msgSend(v9, "reasonID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReportAConcernReason setReasonID:](v3, "setReasonID:", v4);

  objc_msgSend(v9, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReportAConcernReason setName:](v3, "setName:", v5);

  objc_msgSend(v9, "uppercaseName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SKUIReportAConcernReason setUppercaseName:](v3, "setUppercaseName:", v6);
  }
  else
  {
    objc_msgSend(v9, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uppercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIReportAConcernReason setUppercaseName:](v3, "setUppercaseName:", v8);

  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        -[SKUIReportAConcernConfiguration copyWithZone:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = objc_alloc_init((Class)objc_opt_class());
  -[SKUIReportAConcernConfiguration reportConcernURL](self, "reportConcernURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setReportConcernURL:", v13);

  objc_msgSend(v12, "setItemIdentifier:", -[SKUIReportAConcernConfiguration itemIdentifier](self, "itemIdentifier"));
  -[SKUIReportAConcernConfiguration reportConcernExplanation](self, "reportConcernExplanation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setReportConcernExplanation:", v14);

  -[SKUIReportAConcernConfiguration selectReasonTitle](self, "selectReasonTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSelectReasonTitle:", v15);

  -[SKUIReportAConcernConfiguration selectReasonSubtitle](self, "selectReasonSubtitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSelectReasonSubtitle:", v16);

  -[SKUIReportAConcernConfiguration privacyNote](self, "privacyNote");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPrivacyNote:", v17);

  -[SKUIReportAConcernConfiguration reasons](self, "reasons");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setReasons:", v18);

  return v12;
}

- (NSURL)reportConcernURL
{
  return self->_reportConcernURL;
}

- (void)setReportConcernURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(int64_t)a3
{
  self->_itemIdentifier = a3;
}

- (NSString)reportConcernExplanation
{
  return self->_reportConcernExplanation;
}

- (void)setReportConcernExplanation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)selectReasonTitle
{
  return self->_selectReasonTitle;
}

- (void)setSelectReasonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)selectReasonSubtitle
{
  return self->_selectReasonSubtitle;
}

- (void)setSelectReasonSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)privacyNote
{
  return self->_privacyNote;
}

- (void)setPrivacyNote:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)reasons
{
  return self->_reasons;
}

- (void)setReasons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasons, 0);
  objc_storeStrong((id *)&self->_privacyNote, 0);
  objc_storeStrong((id *)&self->_selectReasonSubtitle, 0);
  objc_storeStrong((id *)&self->_selectReasonTitle, 0);
  objc_storeStrong((id *)&self->_reportConcernExplanation, 0);
  objc_storeStrong((id *)&self->_reportConcernURL, 0);
}

+ (void)configurationWithTemplateElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)copyWithZone:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
