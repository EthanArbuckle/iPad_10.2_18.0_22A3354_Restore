@implementation ICQUIManageStorageTipViewModel

- (ICQUIManageStorageTipViewModel)initWithTipInfo:(id)a3
{
  id v4;
  id v5;
  ICQUIManageStorageTipViewModel *v6;
  uint64_t v7;
  NSString *title;
  uint64_t v9;
  NSString *subTitle;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *systemIconName;
  uint64_t v17;
  uint64_t v18;
  char v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSArray *actions;
  NSObject *v24;
  NSString *systemColor;
  objc_super v27;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BEC72D8]);
  v27.receiver = self;
  v27.super_class = (Class)ICQUIManageStorageTipViewModel;
  v6 = -[ICQUIInlineTipViewModel initWithInlineTip:](&v27, sel_initWithInlineTip_, v5);

  if (!v6)
    goto LABEL_11;
  objc_msgSend(v4, "title");
  v7 = objc_claimAutoreleasedReturnValue();
  title = v6->_title;
  v6->_title = (NSString *)v7;

  objc_msgSend(v4, "subtitle");
  v9 = objc_claimAutoreleasedReturnValue();
  subTitle = v6->_subTitle;
  v6->_subTitle = (NSString *)v9;

  objc_msgSend(v4, "icon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v4, "icon");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v13, "path");
    v15 = objc_claimAutoreleasedReturnValue();
    systemIconName = v6->_systemIconName;
    v6->_systemIconName = (NSString *)v15;

    objc_msgSend(v14, "systemColorName");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 48;
  }
  else
  {
    objc_opt_class();
    v19 = objc_opt_isKindOfClass();

    if ((v19 & 1) == 0)
      goto LABEL_7;
    objc_msgSend(v4, "icon");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "imageURL");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 56;
  }
  v20 = *(Class *)((char *)&v6->super.super.isa + v18);
  *(Class *)((char *)&v6->super.super.isa + v18) = (Class)v17;

LABEL_7:
  objc_msgSend(v4, "actions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICQUIManageStorageTipAction actionsFromActionInfos:](ICQUIManageStorageTipAction, "actionsFromActionInfos:", v21);
  v22 = objc_claimAutoreleasedReturnValue();
  actions = v6->_actions;
  v6->_actions = (NSArray *)v22;

  if (!v6->_systemColor)
  {
    _ICQGetLogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[ICQUIManageStorageTipViewModel initWithTipInfo:].cold.1();

    systemColor = v6->_systemColor;
    v6->_systemColor = (NSString *)CFSTR("labelColor");

  }
LABEL_11:

  return v6;
}

- (ICQUIManageStorageTipViewModel)initWithSectionAttributes:(id)a3 rows:(id)a4
{
  id v6;
  id v7;
  id v8;
  ICQUIManageStorageTipViewModel *v9;
  uint64_t v10;
  NSString *title;
  uint64_t v12;
  NSString *subTitle;
  uint64_t v14;
  NSString *systemIconName;
  uint64_t v16;
  NSString *sectionID;
  uint64_t v18;
  NSString *systemColor;
  void *v20;
  id v21;
  uint64_t v22;
  NSArray *actions;
  NSObject *v24;
  NSString *v25;
  _QWORD v27[4];
  id v28;
  objc_super v29;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BEC72D8]);
  v29.receiver = self;
  v29.super_class = (Class)ICQUIManageStorageTipViewModel;
  v9 = -[ICQUIInlineTipViewModel initWithInlineTip:](&v29, sel_initWithInlineTip_, v8);

  if (v9)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("title"));
    v10 = objc_claimAutoreleasedReturnValue();
    title = v9->_title;
    v9->_title = (NSString *)v10;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subTitle"));
    v12 = objc_claimAutoreleasedReturnValue();
    subTitle = v9->_subTitle;
    v9->_subTitle = (NSString *)v12;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("systemIcon"));
    v14 = objc_claimAutoreleasedReturnValue();
    systemIconName = v9->_systemIconName;
    v9->_systemIconName = (NSString *)v14;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("id"));
    v16 = objc_claimAutoreleasedReturnValue();
    sectionID = v9->_sectionID;
    v9->_sectionID = (NSString *)v16;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("systemColor"));
    v18 = objc_claimAutoreleasedReturnValue();
    systemColor = v9->_systemColor;
    v9->_systemColor = (NSString *)v18;

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __65__ICQUIManageStorageTipViewModel_initWithSectionAttributes_rows___block_invoke;
    v27[3] = &unk_24E3F4670;
    v21 = v20;
    v28 = v21;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v27);
    v22 = objc_msgSend(v21, "copy");
    actions = v9->_actions;
    v9->_actions = (NSArray *)v22;

    if (!v9->_systemColor)
    {
      _ICQGetLogSystem();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[ICQUIManageStorageTipViewModel initWithSectionAttributes:rows:].cold.1();

      v25 = v9->_systemColor;
      v9->_systemColor = (NSString *)CFSTR("labelColor");

    }
  }

  return v9;
}

void __65__ICQUIManageStorageTipViewModel_initWithSectionAttributes_rows___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = -[ICQUIManageStorageTipAction initFromRUITableViewRow:]([ICQUIManageStorageTipAction alloc], "initFromRUITableViewRow:", v3);

  objc_msgSend(v2, "addObject:", v4);
}

- (AMSUIMessageRequest)request
{
  NSString *systemColor;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *actions;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  v17[0] = CFSTR("background");
  v17[1] = CFSTR("imageStyle");
  v18[0] = &unk_24E4363A8;
  v18[1] = &unk_24E435EF0;
  v17[2] = CFSTR("imageTintColor");
  v15[0] = CFSTR("type");
  v15[1] = CFSTR("name");
  systemColor = self->_systemColor;
  v16[0] = CFSTR("named");
  v16[1] = systemColor;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08658]), "initWithTitle:message:appearanceInfo:", self->_title, self->_subTitle, v5);
  if (self->_systemIconName)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIconImage:", v7);
LABEL_5:

    goto LABEL_6;
  }
  if (self->_iconURL)
  {
    +[_ICQUIHelperFunctions scaledImageURL:](_ICQUIHelperFunctions, "scaledImageURL:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIconURL:", v7);
    goto LABEL_5;
  }
LABEL_6:
  actions = self->_actions;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __41__ICQUIManageStorageTipViewModel_request__block_invoke;
  v13[3] = &unk_24E3F4698;
  v13[4] = self;
  v9 = v6;
  v14 = v9;
  -[NSArray enumerateObjectsUsingBlock:](actions, "enumerateObjectsUsingBlock:", v13);
  v10 = v14;
  v11 = v9;

  return (AMSUIMessageRequest *)v11;
}

void __41__ICQUIManageStorageTipViewModel_request__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v3 = (void *)MEMORY[0x24BE08128];
  v4 = a2;
  objc_msgSend(v4, "actionButtonText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionWithTitle:identifier:", v5, v7);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "actionURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDeepLink:", v8);

  objc_msgSend(v4, "actionName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("actionName"));

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(v14, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("id"));

  objc_msgSend(v14, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("isManageStorageTip"));

  objc_msgSend(*(id *)(a1 + 40), "addButtonAction:", v14);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_systemColor, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_systemIconName, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)initWithTipInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_21F2CC000, v0, v1, "%s no image system color provided in tipInfo %@, using UIColor labelColor.", v2, v3, v4, v5, 2u);
}

- (void)initWithSectionAttributes:rows:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_21F2CC000, v0, v1, "%s no image system color provided in attributes %@, using UIColor labelColor.", v2, v3, v4, v5, 2u);
}

@end
