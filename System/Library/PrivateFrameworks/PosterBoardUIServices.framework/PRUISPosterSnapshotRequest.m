@implementation PRUISPosterSnapshotRequest

+ (id)snapshotRequestForPRPosterConfiguration:(id)a3 definition:(id)a4 interfaceOrientation:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPoster:definition:interfaceOrientation:", v9, v8, a5);

  return v10;
}

+ (id)snapshotRequestForPRSPosterConfiguration:(id)a3 definition:(id)a4 interfaceOrientation:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id result;
  void *v17;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v10 = v9;
    v11 = objc_alloc((Class)a1);
    v12 = objc_alloc(MEMORY[0x24BE74DE8]);
    objc_msgSend(v8, "_path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "_initWithPath:", v13);
    v15 = (void *)objc_msgSend(v11, "initWithPoster:definition:interfaceOrientation:", v14, v10, a5);

    return v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("poster"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PRUISPosterSnapshotRequest snapshotRequestForPRSPosterConfiguration:definition:interfaceOrientation:].cold.1();
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (id)snapshotRequestForPoster:(id)a3 definition:(id)a4 interfaceOrientation:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPoster:definition:interfaceOrientation:", v9, v8, a5);

  return v10;
}

- (PRUISPosterSnapshotRequest)initWithPoster:(id)a3 definition:(id)a4 interfaceOrientation:(int64_t)a5
{
  id v9;
  id v10;
  void *v11;
  char v12;
  PRUISPosterSnapshotRequest *v13;
  PRUISPosterSnapshotRequest *v14;
  void *v15;
  uint64_t v16;
  BSInvalidatable *sandboxExtension;
  int64_t v18;
  uint64_t v19;
  UIScreen *screen;
  void *v21;
  int v22;
  void *v23;
  void *v25;
  objc_super v26;

  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "_path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isServerPosterPath");

  if ((v12 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[[(id <PRPosterContentsInternal>)poster _path] isServerPosterPath]"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PRUISPosterSnapshotRequest initWithPoster:definition:interfaceOrientation:].cold.2();
LABEL_17:
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2446056C8);
  }
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("definition"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PRUISPosterSnapshotRequest initWithPoster:definition:interfaceOrientation:].cold.1();
    goto LABEL_17;
  }
  v26.receiver = self;
  v26.super_class = (Class)PRUISPosterSnapshotRequest;
  v13 = -[PRUISPosterSnapshotRequest init](&v26, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_poster, a3);
    objc_msgSend(v9, "_path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "extendValidityForReason:", CFSTR("Snapshot Request"));
    v16 = objc_claimAutoreleasedReturnValue();
    sandboxExtension = v14->_sandboxExtension;
    v14->_sandboxExtension = (BSInvalidatable *)v16;

    v14->_determineColorStatistics = 0;
    objc_storeStrong((id *)&v14->_definition, a4);
    if (BSInterfaceOrientationIsValid())
      v18 = a5;
    else
      v18 = 1;
    v14->_interfaceOrientation = v18;
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v19 = objc_claimAutoreleasedReturnValue();
    screen = v14->_screen;
    v14->_screen = (UIScreen *)v19;

    v14->_timeout = 120.0;
    v14->_priority = 0;
    objc_msgSend(v9, "role");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x24BE74E88]);

    if (v22)
    {
      v14->_userInterfaceStyle = 2;
    }
    else
    {
      -[UIScreen traitCollection](v14->_screen, "traitCollection");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v14->_userInterfaceStyle = objc_msgSend(v23, "userInterfaceStyle");

    }
  }

  return v14;
}

- (void)dealloc
{
  BSInvalidatable *sandboxExtension;
  objc_super v4;

  -[BSInvalidatable invalidate](self->_sandboxExtension, "invalidate");
  sandboxExtension = self->_sandboxExtension;
  self->_sandboxExtension = 0;

  v4.receiver = self;
  v4.super_class = (Class)PRUISPosterSnapshotRequest;
  -[PRUISPosterSnapshotRequest dealloc](&v4, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  PRUISPosterSnapshotRequest *v4;
  uint64_t v5;
  UIScreen *screen;

  v4 = -[PRUISPosterSnapshotRequest initWithPoster:definition:interfaceOrientation:](+[PRUISPosterSnapshotRequest allocWithZone:](PRUISPosterSnapshotRequest, "allocWithZone:", a3), "initWithPoster:definition:interfaceOrientation:", self->_poster, self->_definition, self->_interfaceOrientation);
  -[PRUISPosterSnapshotRequest screen](self, "screen");
  v5 = objc_claimAutoreleasedReturnValue();
  screen = v4->_screen;
  v4->_screen = (UIScreen *)v5;

  v4->_timeout = self->_timeout;
  v4->_priority = self->_priority;
  v4->_userInterfaceStyle = self->_userInterfaceStyle;
  v4->_determineColorStatistics = self->_determineColorStatistics;
  objc_storeStrong((id *)&v4->_attachmentConfiguration, self->_attachmentConfiguration);
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PRUISMutablePosterSnapshotRequest *v4;
  void *v5;

  v4 = -[PRUISPosterSnapshotRequest initWithPoster:definition:interfaceOrientation:](+[PRUISMutablePosterSnapshotRequest allocWithZone:](PRUISMutablePosterSnapshotRequest, "allocWithZone:", a3), "initWithPoster:definition:interfaceOrientation:", self->_poster, self->_definition, self->_interfaceOrientation);
  -[PRUISPosterSnapshotRequest screen](self, "screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRUISPosterSnapshotRequest setScreen:](v4, "setScreen:", v5);

  -[PRUISPosterSnapshotRequest setTimeout:](v4, "setTimeout:", self->_timeout);
  -[PRUISPosterSnapshotRequest setPriority:](v4, "setPriority:", self->_priority);
  -[PRUISPosterSnapshotRequest setUserInterfaceStyle:](v4, "setUserInterfaceStyle:", self->_userInterfaceStyle);
  -[PRUISPosterSnapshotRequest setDetermineColorStatistics:](v4, "setDetermineColorStatistics:", self->_determineColorStatistics);
  -[PRUISPosterSnapshotRequest setAttachmentConfiguration:](v4, "setAttachmentConfiguration:", self->_attachmentConfiguration);
  return v4;
}

- (void)setScreen:(id)a3
{
  id v4;
  UIScreen **p_screen;
  UIScreen *screen;
  id obj;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  screen = self->_screen;
  p_screen = &self->_screen;
  obj = v4;
  if ((-[UIScreen isEqual:](screen, "isEqual:", v4) & 1) == 0)
    objc_storeStrong((id *)p_screen, obj);

}

- (UIScreen)screen
{
  UIScreen *screen;
  UIScreen *v4;
  UIScreen *v5;

  screen = self->_screen;
  if (!screen)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v4 = (UIScreen *)objc_claimAutoreleasedReturnValue();
    v5 = self->_screen;
    self->_screen = v4;

    screen = self->_screen;
  }
  return screen;
}

- (void)setAttachments:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[PRUISPosterSnapshotRequest attachmentConfiguration](self, "attachmentConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attachmentHostWindowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      goto LABEL_8;
    -[PRUISPosterSnapshotRequest screen](self, "screen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    _findUIWindowSceneForUIScreen(v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)

    if (v6)
    {
LABEL_8:
      +[PRUISPosterAttachmentConfiguration attachmentConfigurationWithHostWindowScene:attachments:](PRUISPosterAttachmentConfiguration, "attachmentConfigurationWithHostWindowScene:attachments:", v6, v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRUISPosterSnapshotRequest setAttachmentConfiguration:](self, "setAttachmentConfiguration:", v9);

    }
    else
    {
      PRUISLogAttachments();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[PRUISPosterSnapshotRequest setAttachments:].cold.1(v10);

      -[PRUISPosterSnapshotRequest setAttachmentConfiguration:](self, "setAttachmentConfiguration:", 0);
    }

  }
  else
  {
    -[PRUISPosterSnapshotRequest setAttachmentConfiguration:](self, "setAttachmentConfiguration:", 0);
  }

}

- (NSArray)attachments
{
  void *v2;
  void *v3;

  -[PRUISPosterSnapshotRequest attachmentConfiguration](self, "attachmentConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setAttachmentConfiguration:(id)a3
{
  BOOL v4;
  PRUISPosterAttachmentConfiguration *v5;
  PRUISPosterAttachmentConfiguration *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  PRUISPosterAttachmentConfiguration *attachmentConfiguration;
  void *v12;
  PRUISPosterAttachmentConfiguration *v13;

  v13 = (PRUISPosterAttachmentConfiguration *)a3;
  v4 = -[PRUISPosterAttachmentConfiguration isEqual:](self->_attachmentConfiguration, "isEqual:", v13);
  v5 = v13;
  if (v4)
    goto LABEL_6;
  v6 = v13;
  if (!v13)
  {
LABEL_5:
    attachmentConfiguration = self->_attachmentConfiguration;
    self->_attachmentConfiguration = v6;

    v5 = v13;
LABEL_6:

    return;
  }
  -[PRUISPosterAttachmentConfiguration attachmentHostWindowScene](v13, "attachmentHostWindowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "screen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRUISPosterSnapshotRequest screen](self, "screen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if ((v10 & 1) != 0)
  {
    v6 = v13;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[[[attachmentConfiguration attachmentHostWindowScene] screen] isEqual:[self screen]]"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[PRUISPosterSnapshotRequest setAttachmentConfiguration:].cold.1();
  objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  id v36;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0BE20], "builderWithObject:ofExpectedClass:", self, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __38__PRUISPosterSnapshotRequest_isEqual___block_invoke;
  v35[3] = &unk_251535990;
  v35[4] = self;
  v8 = v6;
  v36 = v8;
  v9 = (id)objc_msgSend(v5, "appendEqualsBlocks:", v35, 0);
  v33[0] = v7;
  v33[1] = 3221225472;
  v33[2] = __38__PRUISPosterSnapshotRequest_isEqual___block_invoke_2;
  v33[3] = &unk_251535990;
  v33[4] = self;
  v10 = v8;
  v34 = v10;
  v11 = (id)objc_msgSend(v5, "appendEqualsBlocks:", v33, 0);
  v31[0] = v7;
  v31[1] = 3221225472;
  v31[2] = __38__PRUISPosterSnapshotRequest_isEqual___block_invoke_3;
  v31[3] = &unk_251535990;
  v31[4] = self;
  v12 = v10;
  v32 = v12;
  v13 = (id)objc_msgSend(v5, "appendEqualsBlocks:", v31, 0);
  v29[0] = v7;
  v29[1] = 3221225472;
  v29[2] = __38__PRUISPosterSnapshotRequest_isEqual___block_invoke_4;
  v29[3] = &unk_251535990;
  v29[4] = self;
  v14 = v12;
  v30 = v14;
  v15 = (id)objc_msgSend(v5, "appendEqualsBlocks:", v29, 0);
  v27[0] = v7;
  v27[1] = 3221225472;
  v27[2] = __38__PRUISPosterSnapshotRequest_isEqual___block_invoke_5;
  v27[3] = &unk_251535990;
  v27[4] = self;
  v16 = v14;
  v28 = v16;
  v17 = (id)objc_msgSend(v5, "appendEqualsBlocks:", v27, 0);
  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __38__PRUISPosterSnapshotRequest_isEqual___block_invoke_6;
  v25[3] = &unk_251535990;
  v25[4] = self;
  v18 = v16;
  v26 = v18;
  v19 = (id)objc_msgSend(v5, "appendEqualsBlocks:", v25, 0);
  v23[0] = v7;
  v23[1] = 3221225472;
  v23[2] = __38__PRUISPosterSnapshotRequest_isEqual___block_invoke_7;
  v23[3] = &unk_251535990;
  v23[4] = self;
  v24 = v18;
  v20 = v18;
  v21 = (id)objc_msgSend(v5, "appendEqualsBlocks:", v23, 0);
  LOBYTE(v18) = objc_msgSend(v5, "isEqual:", v20);

  return (char)v18;
}

uint64_t __38__PRUISPosterSnapshotRequest_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "serverPosterPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "serverPosterPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = BSEqualObjects();
  if (v2)
    v5 = v4;
  else
    v5 = 0;
  if (v3)
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

uint64_t __38__PRUISPosterSnapshotRequest_isEqual___block_invoke_2()
{
  return BSEqualObjects();
}

BOOL __38__PRUISPosterSnapshotRequest_isEqual___block_invoke_3(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
}

uint64_t __38__PRUISPosterSnapshotRequest_isEqual___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

BOOL __38__PRUISPosterSnapshotRequest_isEqual___block_invoke_5(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
}

uint64_t __38__PRUISPosterSnapshotRequest_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80));
}

BOOL __38__PRUISPosterSnapshotRequest_isEqual___block_invoke_7(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 16) == *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 16);
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRUISPosterSnapshotRequest poster](self, "poster");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[PRUISPosterSnapshotRequest definition](self, "definition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:", v6);

  -[PRUISPosterSnapshotRequest screen](self, "screen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:", v8);

  -[PRUISPosterSnapshotRequest attachmentConfiguration](self, "attachmentConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:", v10);

  v12 = (id)objc_msgSend(v3, "appendInteger:", -[PRUISPosterSnapshotRequest userInterfaceStyle](self, "userInterfaceStyle"));
  v13 = (id)objc_msgSend(v3, "appendInteger:", -[PRUISPosterSnapshotRequest interfaceOrientation](self, "interfaceOrientation"));
  v14 = (id)objc_msgSend(v3, "appendBool:", -[PRUISPosterSnapshotRequest determineColorStatistics](self, "determineColorStatistics"));
  v15 = (id)objc_msgSend(v3, "appendInt64:", -[PRUISPosterSnapshotRequest priority](self, "priority"));
  v16 = objc_msgSend(v3, "hash");

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRUISPosterSnapshotRequest poster](self, "poster");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("poster"));

  -[PRUISPosterSnapshotRequest definition](self, "definition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("definition"));

  -[PRUISPosterSnapshotRequest screen](self, "screen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("screen"));

  -[PRUISPosterSnapshotRequest attachmentConfiguration](self, "attachmentConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v10, CFSTR("attachmentConfiguration"), 1);

  v12 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __41__PRUISPosterSnapshotRequest_description__block_invoke;
  v21[3] = &unk_2515359B8;
  objc_copyWeak(&v22, &location);
  __41__PRUISPosterSnapshotRequest_description__block_invoke((uint64_t)v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v3, "appendObject:withName:", v13, CFSTR("interfaceOrientation"));

  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __41__PRUISPosterSnapshotRequest_description__block_invoke_2;
  v19[3] = &unk_2515359B8;
  objc_copyWeak(&v20, &location);
  __41__PRUISPosterSnapshotRequest_description__block_invoke_2((uint64_t)v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v3, "appendObject:withName:", v15, CFSTR("userInterfaceStyle"));

  objc_msgSend(v3, "build");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&location);
  return v17;
}

const __CFString *__41__PRUISPosterSnapshotRequest_description__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "interfaceOrientation");

  if ((unint64_t)(v2 - 1) > 3)
    return CFSTR("Unknown");
  else
    return off_251535A40[v2 - 1];
}

const __CFString *__41__PRUISPosterSnapshotRequest_description__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  const __CFString *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "userInterfaceStyle");

  v3 = CFSTR("Unspecified");
  if (v2 == 1)
    v3 = CFSTR("Light");
  if (v2 == 2)
    return CFSTR("Dark");
  else
    return v3;
}

- (id)serverPosterPath
{
  void *v2;
  void *v3;

  -[PRUISPosterSnapshotRequest poster](self, "poster");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)buildPosterKitSnapshotRequestForOutput:(unint64_t)a3 priority:(int64_t)a4 sceneAttachments:(id)a5 error:(id *)a6
{
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int64_t v21;
  int64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  int64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  PRUISPosterSnapshotRequest *v33;
  int64_t v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  unint64_t v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  uint64_t v54;
  _QWORD v55[3];

  v55[1] = *MEMORY[0x24BDAC8D0];
  v50 = a5;
  -[PRUISPosterSnapshotRequest serverPosterPath](self, "serverPosterPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isServerPosterPath") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[path isServerPosterPath]"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PRUISPosterSnapshotRequest buildPosterKitSnapshotRequestForOutput:priority:sceneAttachments:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v43), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24460690CLL);
  }
  -[PRUISPosterSnapshotRequest definition](self, "definition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE74E08], "modelObjectCacheForPath:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configuredProperties");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v53 = 0;
    objc_msgSend(MEMORY[0x24BE74E10], "loadConfiguredPropertiesForPath:error:", v10, &v53);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v53;

    if (v14)
    {
      v44 = v15;
      goto LABEL_6;
    }
    if (v15)
    {
      if (a6)
      {
LABEL_23:
        v15 = objc_retainAutorelease(v15);
        v39 = 0;
        *a6 = v15;
        goto LABEL_20;
      }
    }
    else
    {
      v41 = (void *)MEMORY[0x24BDD1540];
      v54 = *MEMORY[0x24BDD0FD8];
      v55[0] = CFSTR("Unable to load configured properties for path.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoardUIServices.errorDomain"), -1, v42);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      if (a6)
        goto LABEL_23;
    }
    v39 = 0;
    goto LABEL_20;
  }
  v14 = v13;

  v44 = 0;
LABEL_6:
  v16 = objc_alloc_init(MEMORY[0x24BE74E18]);
  objc_msgSend(v16, "setSnapshotOptions:", objc_msgSend(MEMORY[0x24BE74E28], "snapshotOptionsForDefinition:", v11));
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", -[PRUISPosterSnapshotRequest userInterfaceStyle](self, "userInterfaceStyle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTraitCollection:", v17);

  v18 = (void *)MEMORY[0x24BE38078];
  -[PRUISPosterSnapshotRequest screen](self, "screen");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "pui_displayConfigurationForScreen:", v19);
  v20 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setDisplayConfiguration:", v20);
  v21 = -[PRUISPosterSnapshotRequest interfaceOrientation](self, "interfaceOrientation");
  v47 = (void *)v20;
  if (v21)
  {
    v22 = v21;
    if (MEMORY[0x249513C30]())
      v23 = 1;
    else
      v23 = v22;
  }
  else
  {
    objc_msgSend(v10, "role");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqualToString:", *MEMORY[0x24BE74E88]);

    if (v25)
      v23 = 4;
    else
      v23 = 1;
    v22 = v23;
  }
  v26 = a4;
  v49 = a3;
  objc_msgSend(v16, "setInterfaceOrientation:", v23);
  objc_msgSend(v16, "setDeviceOrientation:", v22);
  if (v50)
  {
    v51[0] = MEMORY[0x24BDAC760];
    v51[1] = 3221225472;
    v51[2] = __101__PRUISPosterSnapshotRequest_buildPosterKitSnapshotRequestForOutput_priority_sceneAttachments_error___block_invoke;
    v51[3] = &unk_2515359E0;
    v52 = v50;
    objc_msgSend(v16, "applySceneSettings:", v51);

  }
  objc_msgSend(v10, "serverIdentity");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "provider");
  v28 = objc_claimAutoreleasedReturnValue();

  v46 = (void *)v28;
  v48 = (void *)v14;
  objc_msgSend(v16, "buildWithPath:provider:configuredProperties:snapshotDefinition:", v10, v28, v14, v11);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE380A8], "settings");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v29;
  objc_msgSend(v29, "applyToMutableSceneSettings:", v30);
  objc_msgSend(v11, "levelSets");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bs_mapNoNulls:", &__block_literal_global_12);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = self;
  v34 = v26;
  if (-[PRUISPosterSnapshotRequest determineColorStatistics](self, "determineColorStatistics"))
  {
    objc_msgSend(MEMORY[0x24BE74EE8], "defaultLegibilityProcessingRequest");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = 0;
  }
  v36 = objc_alloc(MEMORY[0x24BE74EF0]);
  objc_msgSend(v11, "uniqueIdentifier");
  v37 = v11;
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRUISPosterSnapshotRequest timeout](v33, "timeout");
  v39 = (void *)objc_msgSend(v36, "initWithPath:snapshotCacheIdentifier:settings:output:priority:snapshotLevelSets:snapshotLegibilityProcessingRequest:attachments:timeout:", v10, v38, v30, v49, v34, v32, v35, v50);

  v11 = v37;
  v15 = v44;
LABEL_20:

  return v39;
}

uint64_t __101__PRUISPosterSnapshotRequest_buildPosterKitSnapshotRequestForOutput_priority_sceneAttachments_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pui_setSceneAttachments:", *(_QWORD *)(a1 + 32));
}

id __101__PRUISPosterSnapshotRequest_buildPosterKitSnapshotRequestForOutput_priority_sceneAttachments_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x24BE74EB8];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "levels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithSet:", v5);
  return v6;
}

- (PRPosterContents)poster
{
  return self->_poster;
}

- (PRPosterSnapshotDefinition)definition
{
  return self->_definition;
}

- (void)setDefinition:(id)a3
{
  objc_storeStrong((id *)&self->_definition, a3);
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (PRUISPosterAttachmentConfiguration)attachmentConfiguration
{
  return self->_attachmentConfiguration;
}

- (BOOL)determineColorStatistics
{
  return self->_determineColorStatistics;
}

- (void)setDetermineColorStatistics:(BOOL)a3
{
  self->_determineColorStatistics = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentConfiguration, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_poster, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_sandboxExtension, 0);
}

+ (void)snapshotRequestForPRSPosterConfiguration:definition:interfaceOrientation:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_2445ED000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithPoster:definition:interfaceOrientation:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_2445ED000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithPoster:definition:interfaceOrientation:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_2445ED000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setAttachments:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_2445ED000, log, OS_LOG_TYPE_FAULT, "Failed to resolve a window scene for attachments.", v1, 2u);
}

- (void)setAttachmentConfiguration:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_2445ED000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)buildPosterKitSnapshotRequestForOutput:priority:sceneAttachments:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_2445ED000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
