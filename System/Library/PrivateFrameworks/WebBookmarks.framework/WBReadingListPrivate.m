@implementation WBReadingListPrivate

- (WBReadingListPrivate)init
{
  WBReadingListPrivate *v2;
  WebBookmarksXPCConnection *v3;
  uint64_t v4;
  WebBookmarksXPCConnection *connection;
  WBReadingListPrivate *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WBReadingListPrivate;
  v2 = -[WBReadingListPrivate init](&v8, sel_init);
  if (v2)
  {
    v3 = [WebBookmarksXPCConnection alloc];
    v4 = -[WebBookmarksXPCConnection initClientForMachService:](v3, "initClientForMachService:", kWebBookmarksdServiceName);
    connection = v2->_connection;
    v2->_connection = (WebBookmarksXPCConnection *)v4;

    v6 = v2;
  }

  return v2;
}

- (void)_addReadingListItemWithURL:(id)a3 title:(id)a4 previewText:(id)a5
{
  id v8;
  id v9;
  xpc_object_t v10;
  void *v11;
  id v12;
  const char *v13;
  id v14;
  const char *v15;
  id v16;
  const char *v17;
  void *v18;
  void *v19;
  int v20;
  SafariFetcherServerProxy *v21;
  id v22;

  v22 = a4;
  v8 = a5;
  v9 = a3;
  v10 = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(v9, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_retainAutorelease(v11);
  v13 = (const char *)objc_msgSend(v12, "UTF8String");

  if (v22)
  {
    +[WebBookmark _trimmedTitle:](WebBookmark, "_trimmedTitle:");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (const char *)objc_msgSend(v14, "UTF8String");

    if (v8)
    {
LABEL_3:
      +[WebBookmark _trimmedPreviewText:](WebBookmark, "_trimmedPreviewText:", v8);
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v17 = (const char *)objc_msgSend(v16, "UTF8String");

      goto LABEL_6;
    }
  }
  else
  {
    v15 = "";
    if (v8)
      goto LABEL_3;
  }
  v17 = "";
LABEL_6:
  xpc_dictionary_set_string(v10, kWebBookmarksAddressKey, v13);
  xpc_dictionary_set_string(v10, kWebBookmarksTitleKey, v15);
  xpc_dictionary_set_string(v10, kWebBookmarksPreviewTextKey, v17);
  -[WebBookmarksXPCConnection messageWithName:](self->_connection, "messageWithName:", kWebBookmarksAddToReadingListMessageName);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_value(v18, kWebBookmarksItemKey, v10);
  -[WebBookmarksXPCConnection sendMessage:](self->_connection, "sendMessage:", v18);
  +[WBFeatureManager sharedFeatureManager](WBFeatureManager, "sharedFeatureManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isOfflineReadingListAvailable");

  if (v20)
  {
    v21 = objc_alloc_init(SafariFetcherServerProxy);
    -[SafariFetcherServerProxy startReadingListFetcher](v21, "startReadingListFetcher");

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
