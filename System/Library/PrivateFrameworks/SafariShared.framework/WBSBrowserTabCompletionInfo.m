@implementation WBSBrowserTabCompletionInfo

- (WBSBrowserTabCompletionInfo)initWithUUID:(id)a3 windowUUID:(id)a4 tabIndex:(unint64_t)a5 url:(id)a6 title:(id)a7
{
  return -[WBSBrowserTabCompletionInfo initWithUUID:windowUUID:tabGroupUUID:tabGroupTitle:tabIndex:url:title:pageStatus:](self, "initWithUUID:windowUUID:tabGroupUUID:tabGroupTitle:tabIndex:url:title:pageStatus:", a3, a4, 0, 0, a5, a6, a7, 0);
}

- (WBSBrowserTabCompletionInfo)initWithUUID:(id)a3 windowUUID:(id)a4 tabGroupUUID:(id)a5 tabGroupTitle:(id)a6 tabIndex:(unint64_t)a7 url:(id)a8 title:(id)a9 pageStatus:(int64_t)a10
{
  id v17;
  id v18;
  id v19;
  WBSBrowserTabCompletionInfo *v20;
  WBSBrowserTabCompletionInfo *v21;
  uint64_t v22;
  NSString *tabGroupTitle;
  uint64_t v24;
  NSString *title;
  WBSBrowserTabCompletionInfo *v26;
  id v28;
  id v29;
  id v30;
  objc_super v31;

  v30 = a3;
  v29 = a4;
  v28 = a5;
  v17 = a6;
  v18 = a8;
  v19 = a9;
  v31.receiver = self;
  v31.super_class = (Class)WBSBrowserTabCompletionInfo;
  v20 = -[WBSBrowserTabCompletionInfo init](&v31, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_uuid, a3);
    objc_storeStrong((id *)&v21->_windowUUID, a4);
    objc_storeStrong((id *)&v21->_tabGroupUUID, a5);
    v22 = objc_msgSend(v17, "copy");
    tabGroupTitle = v21->_tabGroupTitle;
    v21->_tabGroupTitle = (NSString *)v22;

    v21->_tabIndex = a7;
    objc_storeStrong((id *)&v21->_url, a8);
    v24 = objc_msgSend(v19, "copy");
    title = v21->_title;
    v21->_title = (NSString *)v24;

    v21->_pageStatus = a10;
    v26 = v21;
  }

  return v21;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSUUID)windowUUID
{
  return self->_windowUUID;
}

- (NSUUID)tabGroupUUID
{
  return self->_tabGroupUUID;
}

- (NSString)tabGroupTitle
{
  return self->_tabGroupTitle;
}

- (unint64_t)tabIndex
{
  return self->_tabIndex;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)pageStatus
{
  return self->_pageStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_tabGroupTitle, 0);
  objc_storeStrong((id *)&self->_tabGroupUUID, 0);
  objc_storeStrong((id *)&self->_windowUUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
