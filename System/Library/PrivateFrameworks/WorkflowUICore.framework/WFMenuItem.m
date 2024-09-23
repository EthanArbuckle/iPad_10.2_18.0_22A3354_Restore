@implementation WFMenuItem

- (WFMenuItem)initWithTitle:(id)a3 handler:(id)a4
{
  return -[WFMenuItem initWithTitle:subtitle:icon:state:isDestructive:handler:](self, "initWithTitle:subtitle:icon:state:isDestructive:handler:", a3, 0, 0, 0, 0, a4);
}

- (WFMenuItem)initWithTitle:(id)a3 subtitle:(id)a4 handler:(id)a5
{
  return -[WFMenuItem initWithTitle:subtitle:icon:state:isDestructive:handler:](self, "initWithTitle:subtitle:icon:state:isDestructive:handler:", a3, a4, 0, 0, 0, a5);
}

- (WFMenuItem)initWithTitle:(id)a3 icon:(id)a4 handler:(id)a5
{
  return -[WFMenuItem initWithTitle:subtitle:icon:state:isDestructive:handler:](self, "initWithTitle:subtitle:icon:state:isDestructive:handler:", a3, 0, a4, 0, 0, a5);
}

- (WFMenuItem)initWithTitle:(id)a3 state:(int64_t)a4 handler:(id)a5
{
  return -[WFMenuItem initWithTitle:subtitle:icon:state:isDestructive:handler:](self, "initWithTitle:subtitle:icon:state:isDestructive:handler:", a3, 0, 0, a4, 0, a5);
}

- (WFMenuItem)initWithTitle:(id)a3 subtitle:(id)a4 state:(int64_t)a5 handler:(id)a6
{
  return -[WFMenuItem initWithTitle:subtitle:icon:state:isDestructive:handler:](self, "initWithTitle:subtitle:icon:state:isDestructive:handler:", a3, a4, 0, a5, 0, a6);
}

- (WFMenuItem)initWithTitle:(id)a3 icon:(id)a4 state:(int64_t)a5 handler:(id)a6
{
  return -[WFMenuItem initWithTitle:subtitle:icon:state:isDestructive:handler:](self, "initWithTitle:subtitle:icon:state:isDestructive:handler:", a3, 0, a4, a5, 0, a6);
}

- (WFMenuItem)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5 handler:(id)a6
{
  return -[WFMenuItem initWithTitle:subtitle:icon:state:isDestructive:handler:](self, "initWithTitle:subtitle:icon:state:isDestructive:handler:", a3, a4, a5, 0, 0, a6);
}

- (WFMenuItem)initWithTitle:(id)a3 icon:(id)a4 isDestructive:(BOOL)a5 handler:(id)a6
{
  return -[WFMenuItem initWithTitle:subtitle:icon:state:isDestructive:handler:](self, "initWithTitle:subtitle:icon:state:isDestructive:handler:", a3, 0, a4, 0, 1, a6);
}

- (WFMenuItem)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5 state:(int64_t)a6 handler:(id)a7
{
  return -[WFMenuItem initWithTitle:subtitle:icon:state:isDestructive:handler:](self, "initWithTitle:subtitle:icon:state:isDestructive:handler:", a3, a4, a5, a6, 0, a7);
}

- (WFMenuItem)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5 state:(int64_t)a6 isDestructive:(BOOL)a7 handler:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  WFMenuItem *v19;
  uint64_t v20;
  NSString *title;
  uint64_t v22;
  NSString *subtitle;
  uint64_t v24;
  id handler;
  WFMenuItem *v26;
  void *v28;
  objc_super v29;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFMenuItem.m"), 125, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title"));

  }
  v29.receiver = self;
  v29.super_class = (Class)WFMenuItem;
  v19 = -[WFMenuItem init](&v29, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v15, "copy");
    title = v19->_title;
    v19->_title = (NSString *)v20;

    v22 = objc_msgSend(v16, "copy");
    subtitle = v19->_subtitle;
    v19->_subtitle = (NSString *)v22;

    objc_storeStrong((id *)&v19->_icon, a5);
    v19->_state = a6;
    v19->_isDestructive = a7;
    v24 = objc_msgSend(v18, "copy");
    handler = v19->_handler;
    v19->_handler = (id)v24;

    v26 = v19;
  }

  return v19;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (WFIcon)icon
{
  return self->_icon;
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)isDestructive
{
  return self->_isDestructive;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (id)platformImageForIcon:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v4 = 0;
    goto LABEL_10;
  }
  v4 = v3;
  if (!objc_msgSend(v3, "hasClearBackground"))
  {
LABEL_10:
    objc_msgSend(MEMORY[0x24BEC54D0], "loadIcon:size:style:", v3, 0, 25.0, 25.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_msgSend(v3, "symbolName");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString hasSuffix:](v5, "hasSuffix:", CFSTR(".fill")))
  {
    -[__CFString substringToIndex:](v5, "substringToIndex:", -[__CFString length](v5, "length") - objc_msgSend(CFSTR(".fill"), "length"));
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (__CFString *)v6;
  }
  if (-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("f.cursive")))
  {

    v5 = CFSTR("f.cursive.circle");
  }
  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v3;
LABEL_11:

  return v7;
}

- (id)menuElementRepresentationShowingStatus:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[5];

  v4 = objc_alloc(MEMORY[0x24BDD16A8]);
  -[WFMenuItem title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithString:", v5);

  v7 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __60__WFMenuItem_UIKit__menuElementRepresentationShowingStatus___block_invoke;
  v29[3] = &unk_24EF607B0;
  v29[4] = self;
  objc_msgSend(MEMORY[0x24BEBD388], "actionWithTitle:image:identifier:handler:", v6, 0, 0, v29);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFMenuItem subtitle](self, "subtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSubtitle:", v9);

  v10 = -[WFMenuItem state](self, "state");
  if (v10 == 2)
    v11 = 2;
  else
    v11 = v10 == 1;
  objc_msgSend(v8, "setState:", v11);
  -[WFMenuItem handler](self, "handler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    objc_msgSend(v8, "setAttributes:", objc_msgSend(v8, "attributes") | 1);
  if (-[WFMenuItem isDestructive](self, "isDestructive"))
    objc_msgSend(v8, "setAttributes:", objc_msgSend(v8, "attributes") | 2);
  -[WFMenuItem title](self, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", &stru_24EF60C48);

  if (v14)
    objc_msgSend(v8, "setAttributes:", 4);
  -[WFMenuItem icon](self, "icon");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[WFMenuItem icon](self, "icon");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFMenuItem platformImageForIcon:](WFMenuItem, "platformImageForIcon:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v17);

  }
  -[WFMenuItem icon](self, "icon");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
  }
  else
  {
    v19 = 0;
  }
  v20 = v19;

  objc_msgSend(v20, "bundleIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v8, "image");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      v23 = (void *)MEMORY[0x24BEBD528];
      v26[0] = v7;
      v26[1] = 3221225472;
      v26[2] = __60__WFMenuItem_UIKit__menuElementRepresentationShowingStatus___block_invoke_2;
      v26[3] = &unk_24EF60828;
      v27 = v21;
      v28 = v8;
      v24 = v8;
      objc_msgSend(v23, "elementWithProvider:", v26);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v8;
}

- (id)generateAttributedStringForText:(id)a3 font:(id)a4 color:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;

  v8 = a5;
  v9 = (objc_class *)MEMORY[0x24BDD1688];
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend([v9 alloc], "initWithString:", v11);

  v13 = objc_msgSend(v12, "length");
  objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x24BEBB360], v10, 0, v13);

  -[WFMenuItem handler](self, "handler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;
  objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x24BEBB368], v15, 0, v13);

  return v12;
}

void __60__WFMenuItem_UIKit__menuElementRepresentationShowingStatus___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "handler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "handler");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

void __60__WFMenuItem_UIKit__menuElementRepresentationShowingStatus___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  int64x2_t v13;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screenScale");
  v6 = v5;

  v7 = (void *)MEMORY[0x24BEC14E0];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __60__WFMenuItem_UIKit__menuElementRepresentationShowingStatus___block_invoke_3;
  v10[3] = &unk_24EF60800;
  v13 = vdupq_n_s64(0x404A000000000000uLL);
  v8 = *(_QWORD *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = v3;
  v9 = v3;
  objc_msgSend(v7, "applicationIconImageForBundleIdentifier:length:scale:completionHandler:", v8, v10, 52.0, v6);

}

void __60__WFMenuItem_UIKit__menuElementRepresentationShowingStatus___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  __int128 v9;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__WFMenuItem_UIKit__menuElementRepresentationShowingStatus___block_invoke_4;
  block[3] = &unk_24EF607D8;
  v9 = *(_OWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __60__WFMenuItem_UIKit__menuElementRepresentationShowingStatus___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 40), "roundedWithContinuousCornerRadius:size:", *(double *)(a1 + 64) * 0.95 * 0.225, *(double *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "platformImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setImage:", v3);

  v4 = *(_QWORD *)(a1 + 48);
  v6[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

}

@end
