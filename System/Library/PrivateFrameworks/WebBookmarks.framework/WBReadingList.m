@implementation WBReadingList

+ (BOOL)supportsURL:(id)a3
{
  return objc_msgSend(a3, "_webBookmarks_isHTTPFamilyURL");
}

+ (WBReadingList)defaultReadingList
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__WBReadingList_defaultReadingList__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultReadingList_onceToken != -1)
    dispatch_once(&defaultReadingList_onceToken, block);
  return (WBReadingList *)(id)defaultReadingList_wbReadingList;
}

void __35__WBReadingList_defaultReadingList__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)defaultReadingList_wbReadingList;
  defaultReadingList_wbReadingList = v1;

}

- (WBReadingList)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("Misuse of WBReadingList interface. Use class method defaultReadingList."), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)_init
{
  WBReadingList *v2;
  WBReadingListPrivate *v3;
  WBReadingListPrivate *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *serialQueue;
  WBReadingList *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WBReadingList;
  v2 = -[WBReadingList init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(WBReadingListPrivate);
    v4 = v2->_private;
    v2->_private = v3;

    v5 = dispatch_queue_create("com.apple.WebBookmarks.AddToReadingListQueue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

    v7 = v2;
  }

  return v2;
}

- (BOOL)addReadingListItemWithURL:(id)a3 title:(id)a4 previewText:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  BOOL v13;
  NSObject *serialQueue;
  NSObject *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = +[WBReadingList supportsURL:](WBReadingList, "supportsURL:", v10);
  if (!v13)
  {
    v15 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[WBReadingList addReadingListItemWithURL:title:previewText:error:].cold.1(v15);
      if (!a6)
        goto LABEL_6;
    }
    else if (!a6)
    {
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("WBErrorDomain"), 1, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  serialQueue = self->_serialQueue;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __67__WBReadingList_addReadingListItemWithURL_title_previewText_error___block_invoke;
  v17[3] = &unk_24CB32408;
  v17[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  dispatch_async(serialQueue, v17);

LABEL_6:
  return v13;
}

uint64_t __67__WBReadingList_addReadingListItemWithURL_title_previewText_error___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 8), "_addReadingListItemWithURL:title:previewText:", a1[5], a1[6], a1[7]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_private, 0);
}

- (void)addReadingListItemWithURL:(os_log_t)log title:previewText:error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_211022000, log, OS_LOG_TYPE_ERROR, "Cannot create a Reading List item. URLs must begin with http or https.", v1, 2u);
}

@end
