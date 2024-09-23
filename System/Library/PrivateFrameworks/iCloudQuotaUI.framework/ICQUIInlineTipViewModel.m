@implementation ICQUIInlineTipViewModel

- (ICQUIInlineTipViewModel)initWithInlineTip:(id)a3
{
  id v5;
  ICQUIInlineTipViewModel *v6;
  ICQUIInlineTipViewModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICQUIInlineTipViewModel;
  v6 = -[ICQUIInlineTipViewModel init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_tip, a3);

  return v7;
}

- (AMSUIMessageRequest)request
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char isKindOfClass;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v26[5];
  id v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[3];
  _QWORD v31[4];

  v31[3] = *MEMORY[0x24BDAC8D0];
  v30[0] = CFSTR("background");
  v30[1] = CFSTR("imageStyle");
  v31[0] = &unk_24E4363F8;
  v31[1] = &unk_24E435F08;
  v30[2] = CFSTR("imageTintColor");
  v28[0] = CFSTR("type");
  v28[1] = CFSTR("name");
  v29[0] = CFSTR("named");
  -[ICQUIInlineTipViewModel _tipTintColorName](self, "_tipTintColorName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x24BE08658]);
  -[ICQInlineTip title](self->_tip, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInlineTip subTitle](self->_tip, "subTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithTitle:message:appearanceInfo:", v7, v8, v5);

  objc_msgSend(MEMORY[0x24BE08128], "actionWithTitle:style:", 0, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BE07D00];
  objc_msgSend(v10, "setIdentifier:", *MEMORY[0x24BE07D00]);
  objc_msgSend(v10, "userInfo");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v12, "setObject:forKeyedSubscript:", v11, CFSTR("actionName"));

  objc_msgSend(v9, "addButtonAction:", v10);
  -[ICQInlineTip icon](self->_tip, "icon");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v12) = objc_opt_isKindOfClass();

  -[ICQInlineTip icon](self->_tip, "icon");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((v12 & 1) != 0)
  {
    v16 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(v14, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "systemImageNamed:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setIconImage:", v18);
LABEL_5:

    goto LABEL_6;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[ICQInlineTip icon](self->_tip, "icon");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ICQUIHelperFunctions scaledImageURL:](_ICQUIHelperFunctions, "scaledImageURL:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIconURL:", v20);

    goto LABEL_5;
  }
LABEL_6:
  -[ICQInlineTip actions](self->_tip, "actions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __34__ICQUIInlineTipViewModel_request__block_invoke;
  v26[3] = &unk_24E3F46E8;
  v26[4] = self;
  v22 = v9;
  v27 = v22;
  objc_msgSend(v21, "enumerateObjectsUsingBlock:", v26);

  v23 = v27;
  v24 = v22;

  return (AMSUIMessageRequest *)v24;
}

void __34__ICQUIInlineTipViewModel_request__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v3 = (void *)MEMORY[0x24BE08128];
  v4 = a2;
  objc_msgSend(v4, "buttonTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionWithTitle:identifier:", v5, v7);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "actionURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDeepLink:", v8);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "criteria");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "excludeApps");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("excludeApps"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "criteria");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12 != 0;

  objc_msgSend(v4, "actionName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "userInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("actionName"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "id");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "userInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("id"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "userInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("isTurnOnApps"));

  objc_msgSend(*(id *)(a1 + 40), "addButtonAction:", v20);
}

- (AMSUIBubbleTipInlineAnchorInfo)tipArrow
{
  void *v3;
  int v4;
  id v5;
  double v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v15;
  int v16;
  void *v17;
  int v18;

  -[ICQInlineTip arrowConfiguration](self->_tip, "arrowConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BEC7260]);

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BE08620]);
    v6 = 0.5;
LABEL_10:
    v9 = 0;
    return (AMSUIBubbleTipInlineAnchorInfo *)(id)objc_msgSend(v5, "initWithArrowDirection:relativeArrowOffset:", v9, v6);
  }
  -[ICQInlineTip arrowConfiguration](self->_tip, "arrowConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BEC7248]);

  if (v8)
  {
    v5 = objc_alloc(MEMORY[0x24BE08620]);
    v6 = 0.5;
  }
  else
  {
    -[ICQInlineTip arrowConfiguration](self->_tip, "arrowConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BEC7268]);

    if (v11)
    {
      v5 = objc_alloc(MEMORY[0x24BE08620]);
      v6 = 0.1;
      goto LABEL_10;
    }
    -[ICQInlineTip arrowConfiguration](self->_tip, "arrowConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BEC7270]);

    if (v13)
    {
      v5 = objc_alloc(MEMORY[0x24BE08620]);
      v6 = 0.9;
      goto LABEL_10;
    }
    -[ICQInlineTip arrowConfiguration](self->_tip, "arrowConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BEC7250]);

    if (v16)
    {
      v5 = objc_alloc(MEMORY[0x24BE08620]);
      v6 = 0.1;
    }
    else
    {
      -[ICQInlineTip arrowConfiguration](self->_tip, "arrowConfiguration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BEC7258]);

      v5 = objc_alloc(MEMORY[0x24BE08620]);
      if (!v18)
      {
        v6 = 0.0;
        v9 = -1;
        return (AMSUIBubbleTipInlineAnchorInfo *)(id)objc_msgSend(v5, "initWithArrowDirection:relativeArrowOffset:", v9, v6);
      }
      v6 = 0.9;
    }
  }
  v9 = 1;
  return (AMSUIBubbleTipInlineAnchorInfo *)(id)objc_msgSend(v5, "initWithArrowDirection:relativeArrowOffset:", v9, v6);
}

- (id)_tipTintColorName
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  __CFString *v7;

  -[ICQInlineTip icon](self->_tip, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[ICQInlineTip icon](self->_tip, "icon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemColorName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "systemColorName");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = CFSTR("blue");
    }

  }
  else
  {
    v7 = CFSTR("blue");
  }
  return v7;
}

- (ICQInlineTip)tip
{
  return self->_tip;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tip, 0);
}

@end
