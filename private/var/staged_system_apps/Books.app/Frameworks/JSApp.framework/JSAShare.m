@implementation JSAShare

+ (void)shareURL:(id)a3 fromViewController:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;

  v13 = a4;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", a3));
  if (v12)
    sub_CAF4((uint64_t)a1, v12, v13, v10, v11);

}

+ (void)shareURL:(id)a3 fromViewController:(id)a4 sourceView:(id)a5 sourceBarButtonItem:(id)a6
{
  id v10;
  id v11;
  void *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  id v15;

  v15 = a4;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", a3));
  if (v12)
  {
    v13 = objc_opt_new(NSMutableDictionary);
    v14 = v13;
    if (v10)
      -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v10, CFSTR("sourceView"));
    if (v11)
      -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v11, CFSTR("sourceBarButtonItem"));
    sub_CAF4((uint64_t)a1, v12, v15, v14, 0);

  }
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return objc_alloc_init((Class)NSString);
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[JSAShare options](self, "options", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("linkPresentation")));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[JSAShare options](self, "options"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("linkPresentation")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("title")));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[JSAShare options](self, "options"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("linkPresentation")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("title")));

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)activityViewControllerLinkPresentationMetadata:(void *)a1
{
  id v2;
  void *v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  float v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v34;
  id v35;

  if (!a1)
  {
    v2 = 0;
    return v2;
  }
  v2 = objc_alloc_init((Class)LPLinkMetadata);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "options"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("linkPresentation")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title")));
  objc_msgSend(v2, "setTitle:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "options"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("linkPresentation")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("summary")));
  objc_msgSend(v2, "setSummary:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "options"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("linkPresentation")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("imageUrl")));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "options"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("linkPresentation")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("artworkUrl")));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "options"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("linkPresentation")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("artworkAspect")));

    if (v17)
    {
      objc_msgSend(v17, "floatValue");
      v19 = v18 * 80.0;
    }
    else
    {
      v19 = 80.0;
    }
    v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "jsa_normalizedArtworkURLOfSize:withFormat:", CFSTR("jpg"), v19, v19));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v27));
    if (v28)
    {
      v29 = sub_D6B0((uint64_t)a1, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      v31 = (void *)objc_opt_new(LPImageProperties);
      v32 = objc_msgSend(objc_alloc((Class)LPImage), "initWithItemProvider:properties:placeholderImage:", v30, v31, 0);
      objc_msgSend(v2, "setImage:", v32);

    }
    goto LABEL_15;
  }
  if (v11)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v11));
    v17 = v20;
    if (!v20)
    {
LABEL_16:

      goto LABEL_17;
    }
    if (objc_msgSend(v20, "isFileURL"))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "options"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("linkPresentation")));
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("imageMIMEType")));
      v24 = (void *)v23;
      v25 = CFSTR("image/png");
      if (v23)
        v25 = (__CFString *)v23;
      v26 = v25;

      v27 = objc_msgSend(objc_alloc((Class)LPImage), "initByReferencingFileURL:MIMEType:", v17, v26);
      objc_msgSend(v2, "setImage:", v27);
    }
    else
    {
      v34 = sub_D6B0((uint64_t)a1, v17);
      v27 = (id)objc_claimAutoreleasedReturnValue(v34);
      v35 = objc_msgSend(objc_alloc((Class)LPImage), "initWithItemProvider:properties:placeholderImage:", v27, 0, 0);
      objc_msgSend(v2, "setImage:", v35);

    }
LABEL_15:

    goto LABEL_16;
  }
LABEL_17:

  return v2;
}

- (id)activityItem
{
  return self->_activityItem;
}

- (void)setActivityItem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (JSValue)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  objc_storeStrong((id *)&self->_callback, a3);
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_callback, 0);
  objc_storeStrong(&self->_activityItem, 0);
}

@end
