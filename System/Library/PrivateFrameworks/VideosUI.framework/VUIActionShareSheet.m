@implementation VUIActionShareSheet

- (VUIActionShareSheet)initWithContextData:(id)a3 sourceView:(id)a4
{
  id v6;
  id v7;
  VUIActionShareSheet *v8;
  uint64_t v9;
  NSString *urlString;
  uint64_t v11;
  NSString *title;
  uint64_t v13;
  NSString *subtitle;
  uint64_t v15;
  NSString *imageURLStr;
  uint64_t v17;
  NSString *sharedWatchId;
  uint64_t v19;
  NSURL *sharedWatchUrl;
  uint64_t v21;
  NSDictionary *groupActivityMetadata;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  uint64_t v27;
  NSString *previewUrlStr;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  objc_super v38;

  v6 = a3;
  v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)VUIActionShareSheet;
  v8 = -[VUIActionShareSheet init](&v38, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "vui_stringForKey:", CFSTR("shareURL"));
    v9 = objc_claimAutoreleasedReturnValue();
    urlString = v8->_urlString;
    v8->_urlString = (NSString *)v9;

    objc_msgSend(v6, "vui_stringForKey:", CFSTR("shareTitle"));
    v11 = objc_claimAutoreleasedReturnValue();
    title = v8->_title;
    v8->_title = (NSString *)v11;

    objc_msgSend(v6, "vui_stringForKey:", CFSTR("shareSubtitle"));
    v13 = objc_claimAutoreleasedReturnValue();
    subtitle = v8->_subtitle;
    v8->_subtitle = (NSString *)v13;

    objc_msgSend(v6, "vui_stringForKey:", CFSTR("shareImageURL"));
    v15 = objc_claimAutoreleasedReturnValue();
    imageURLStr = v8->_imageURLStr;
    v8->_imageURLStr = (NSString *)v15;

    objc_msgSend(v6, "vui_stringForKey:", CFSTR("shareSharedWatchId"));
    v17 = objc_claimAutoreleasedReturnValue();
    sharedWatchId = v8->_sharedWatchId;
    v8->_sharedWatchId = (NSString *)v17;

    objc_msgSend(v6, "vui_URLForKey:", CFSTR("shareSharedWatchUrl"));
    v19 = objc_claimAutoreleasedReturnValue();
    sharedWatchUrl = v8->_sharedWatchUrl;
    v8->_sharedWatchUrl = (NSURL *)v19;

    objc_msgSend(v6, "vui_dictionaryForKey:", CFSTR("groupActivityMetadata"));
    v21 = objc_claimAutoreleasedReturnValue();
    groupActivityMetadata = v8->_groupActivityMetadata;
    v8->_groupActivityMetadata = (NSDictionary *)v21;

    objc_storeStrong((id *)&v8->_sourceView, a4);
    objc_msgSend(v7, "bounds");
    v8->_sourceRect.origin.x = v23;
    v8->_sourceRect.origin.y = v24;
    v8->_sourceRect.size.width = v25;
    v8->_sourceRect.size.height = v26;
    objc_msgSend(v6, "vui_stringForKey:", CFSTR("previewURL"));
    v27 = objc_claimAutoreleasedReturnValue();
    previewUrlStr = v8->_previewUrlStr;
    v8->_previewUrlStr = (NSString *)v27;

    if (!v8->_urlString || !v8->_sourceView || !-[NSString length](v8->_imageURLStr, "length"))
    {
      VUIDefaultLogObject();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[VUIActionShareSheet initWithContextData:sourceView:].cold.1(v29, v30, v31, v32, v33, v34, v35, v36);

    }
  }

  return v8;
}

- (VUIActionShareSheet)initWithContextData:(id)a3 sourceRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  VUIActionShareSheet *v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v10 = -[VUIActionShareSheet initWithContextData:sourceView:]([VUIActionShareSheet alloc], "initWithContextData:sourceView:", v9, 0);

  -[VUIActionShareSheet setSourceRect:](v10, "setSourceRect:", x, y, width, height);
  return v10;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  UIView *v6;
  void (**v7)(id, uint64_t);
  char isKindOfClass;
  UIView *sourceView;
  UIView *v10;
  NSDictionary *groupActivityMetadata;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = (UIView *)a3;
  v7 = (void (**)(id, uint64_t))a4;
  if (self->_urlString)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    sourceView = v6;
    if ((isKindOfClass & 1) == 0)
      sourceView = self->_sourceView;
    v10 = sourceView;
    groupActivityMetadata = self->_groupActivityMetadata;
    if (groupActivityMetadata && -[NSDictionary count](groupActivityMetadata, "count"))
      +[VUIShareActivityViewController_iOS shareMediaItem:previewURLString:title:subtitle:imageURLStr:groupActivityMetadata:sourceView:completionHandler:](VUIShareActivityViewController_iOS, "shareMediaItem:previewURLString:title:subtitle:imageURLStr:groupActivityMetadata:sourceView:completionHandler:", self->_urlString, 0, self->_title, self->_subtitle, self->_imageURLStr, self->_groupActivityMetadata, v10, v7);
    else
      +[VUIShareActivityViewController_iOS shareMediaItem:previewURLString:title:subtitle:imageURLStr:sharedWatchId:sharedWatchUrl:sourceView:completionHandler:](VUIShareActivityViewController_iOS, "shareMediaItem:previewURLString:title:subtitle:imageURLStr:sharedWatchId:sharedWatchUrl:sourceView:completionHandler:", self->_urlString, 0, self->_title, self->_subtitle, self->_imageURLStr, self->_sharedWatchId, self->_sharedWatchUrl, v10, v7);

  }
  else
  {
    VUIDefaultLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[VUIActionShareSheet performWithTargetResponder:completionHandler:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    if (v7)
      v7[2](v7, 1);
  }

}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
  objc_storeStrong((id *)&self->_urlString, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (NSString)imageURLStr
{
  return self->_imageURLStr;
}

- (void)setImageURLStr:(id)a3
{
  objc_storeStrong((id *)&self->_imageURLStr, a3);
}

- (NSString)sharedWatchId
{
  return self->_sharedWatchId;
}

- (void)setSharedWatchId:(id)a3
{
  objc_storeStrong((id *)&self->_sharedWatchId, a3);
}

- (NSURL)sharedWatchUrl
{
  return self->_sharedWatchUrl;
}

- (void)setSharedWatchUrl:(id)a3
{
  objc_storeStrong((id *)&self->_sharedWatchUrl, a3);
}

- (NSString)previewUrlStr
{
  return self->_previewUrlStr;
}

- (void)setPreviewUrlStr:(id)a3
{
  objc_storeStrong((id *)&self->_previewUrlStr, a3);
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_sourceView, a3);
}

- (CGRect)sourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (NSDictionary)groupActivityMetadata
{
  return self->_groupActivityMetadata;
}

- (void)setGroupActivityMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_groupActivityMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupActivityMetadata, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_previewUrlStr, 0);
  objc_storeStrong((id *)&self->_sharedWatchUrl, 0);
  objc_storeStrong((id *)&self->_sharedWatchId, 0);
  objc_storeStrong((id *)&self->_imageURLStr, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
}

- (void)initWithContextData:(uint64_t)a3 sourceView:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, a1, a3, "SHARESHEET: One of required params to share (URL, source view, image) are missing", a5, a6, a7, a8, 0);
}

- (void)performWithTargetResponder:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, a1, a3, "SHARESHEET: Required params Share URL and Source View are missing", a5, a6, a7, a8, 0);
}

@end
