@implementation SXLinkActionActivityProvider

- (SXLinkActionActivityProvider)initWithURLHandler:(id)a3 URLPreviewing:(id)a4 host:(id)a5 URLQualifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SXLinkActionActivityProvider *v15;
  SXLinkActionActivityProvider *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SXLinkActionActivityProvider;
  v15 = -[SXLinkActionActivityProvider init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_URLHandler, a3);
    objc_storeStrong((id *)&v16->_URLPreviewing, a4);
    objc_storeStrong((id *)&v16->_host, a5);
    objc_storeStrong((id *)&v16->_URLQualifier, a6);
  }

  return v16;
}

- (id)activityGroupForAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SXActionActivityGroup *v10;
  SXBlockActionActivity *v11;
  void *v12;
  void *v13;
  SXBlockActionActivity *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  SXBlockActionActivity *v19;
  void *v20;
  void *v21;
  SXBlockActionActivity *v22;
  void *v23;
  void *v24;
  int v25;
  SXBlockActionActivity *v26;
  void *v27;
  void *v28;
  SXBlockActionActivity *v29;
  void *v30;
  void *v31;
  int v32;
  SXPasteboardActionActivity *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  SXPasteboardActionActivity *v39;
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD v43[5];

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD1808];
  objc_msgSend(v4, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsWithURL:resolvingAgainstBaseURL:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setQuery:", 0);
  objc_msgSend(v7, "setFragment:", 0);
  objc_msgSend(v7, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SXActionActivityGroup initWithTitle:]([SXActionActivityGroup alloc], "initWithTitle:", v9);
  v11 = [SXBlockActionActivity alloc];
  SXBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SXLinkActionOpen"), &stru_24D68E0F8, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __55__SXLinkActionActivityProvider_activityGroupForAction___block_invoke;
  v43[3] = &unk_24D688798;
  v43[4] = self;
  v14 = -[SXBlockActionActivity initWithLabel:type:block:](v11, "initWithLabel:type:block:", v13, 0, v43);
  -[SXActionActivityGroup addActivity:](v10, "addActivity:", v14);

  -[SXLinkActionActivityProvider URLQualifier](self, "URLQualifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SXLinkActionActivityProvider URLQualifier](self, "URLQualifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "allowOpenInNewWindowForURL:", v17);

    if (v18)
    {
      v19 = [SXBlockActionActivity alloc];
      SXBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Open In New Window"), &stru_24D68E0F8, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x24BDAC760];
      v42[1] = 3221225472;
      v42[2] = __55__SXLinkActionActivityProvider_activityGroupForAction___block_invoke_2;
      v42[3] = &unk_24D688798;
      v42[4] = self;
      v22 = -[SXBlockActionActivity initWithLabel:type:block:](v19, "initWithLabel:type:block:", v21, 0, v42);
      -[SXActionActivityGroup addActivity:](v10, "addActivity:", v22);

    }
  }
  else
  {

  }
  -[SXLinkActionActivityProvider URLQualifier](self, "URLQualifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "allowOpenInSafariForURL:", v24);

  if (v25)
  {
    v26 = [SXBlockActionActivity alloc];
    SXBundle();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Open in Safari"), &stru_24D68E0F8, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __55__SXLinkActionActivityProvider_activityGroupForAction___block_invoke_3;
    v41[3] = &unk_24D688798;
    v41[4] = self;
    v29 = -[SXBlockActionActivity initWithLabel:type:block:](v26, "initWithLabel:type:block:", v28, 1, v41);
    -[SXActionActivityGroup addActivity:](v10, "addActivity:", v29);

  }
  -[SXLinkActionActivityProvider URLQualifier](self, "URLQualifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v30, "allowCopyingOfURL:", v31);

  if (v32)
  {
    v33 = [SXPasteboardActionActivity alloc];
    SXBundle();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("Copy Link"), &stru_24D68E0F8, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6C40], "generalPasteboard");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URL");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "absoluteString");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[SXPasteboardActionActivity initWithLabel:type:pasteboard:string:](v33, "initWithLabel:type:pasteboard:string:", v35, 1, v36, v38);
    -[SXActionActivityGroup addActivity:](v10, "addActivity:", v39);

  }
  return v10;
}

void __55__SXLinkActionActivityProvider_activityGroupForAction___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "URL");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "open:", v3);

}

void __55__SXLinkActionActivityProvider_activityGroupForAction___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "URL");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openInNewWindow:", v3);

}

void __55__SXLinkActionActivityProvider_activityGroupForAction___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "URL");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openInSafari:", v3);

}

- (id)previewActivityForAction:(id)a3
{
  id v4;
  SXURLPreviewActivity *v5;
  void *v6;
  void *v7;
  SXURLPreviewActivity *v8;

  v4 = a3;
  v5 = [SXURLPreviewActivity alloc];
  -[SXLinkActionActivityProvider URLPreviewing](self, "URLPreviewing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SXURLPreviewActivity initWithURLPreviewing:URL:](v5, "initWithURLPreviewing:URL:", v6, v7);
  return v8;
}

- (void)open:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SXLinkActionActivityProvider URLHandler](self, "URLHandler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openURL:", v4);

}

- (void)openInNewWindow:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SXLinkActionActivityProvider URLHandler](self, "URLHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SXLinkActionActivityProvider URLHandler](self, "URLHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "openNewWindowWithURL:", v7);

  }
}

- (void)openInSafari:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SXLinkActionActivityProvider host](self, "host");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openURL:completion:", v4, 0);

}

- (SXURLHandling)URLHandler
{
  return self->_URLHandler;
}

- (SXURLPreviewing)URLPreviewing
{
  return self->_URLPreviewing;
}

- (SXHost)host
{
  return self->_host;
}

- (SXLinkActionURLQualifier)URLQualifier
{
  return self->_URLQualifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLQualifier, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_URLPreviewing, 0);
  objc_storeStrong((id *)&self->_URLHandler, 0);
}

@end
