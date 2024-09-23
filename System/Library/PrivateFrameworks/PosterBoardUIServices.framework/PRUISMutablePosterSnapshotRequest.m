@implementation PRUISMutablePosterSnapshotRequest

- (void)appendAttachment:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  if (v19)
  {
    -[PRUISPosterSnapshotRequest attachmentConfiguration](self, "attachmentConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attachments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    v7 = v6;
    if (v6)
      v8 = v6;
    else
      v8 = (id)objc_opt_new();
    v9 = v8;

    objc_msgSend(v9, "addObject:", v19);
    -[PRUISPosterSnapshotRequest attachmentConfiguration](self, "attachmentConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attachmentHostWindowScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      -[PRUISPosterSnapshotRequest screen](self, "screen");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (!v14)
      {
        objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      _findUIWindowSceneForUIScreen(v15);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (!v14)

    }
    v16 = (void *)objc_msgSend(v9, "copy");
    +[PRUISPosterAttachmentConfiguration attachmentConfigurationWithHostWindowScene:attachments:](PRUISPosterAttachmentConfiguration, "attachmentConfigurationWithHostWindowScene:attachments:", v13, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[PRUISPosterSnapshotRequest setAttachmentConfiguration:](self, "setAttachmentConfiguration:", v17);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("attachment"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PRUISMutablePosterSnapshotRequest appendAttachment:].cold.1();
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)appendAttachment:.cold.1()
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
