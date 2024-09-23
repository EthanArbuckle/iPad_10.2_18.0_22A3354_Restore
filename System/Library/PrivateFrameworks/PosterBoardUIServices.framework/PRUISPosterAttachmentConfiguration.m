@implementation PRUISPosterAttachmentConfiguration

+ (id)attachmentConfigurationWithHostWindowScene:(id)a3 attachments:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  PRUISPosterAttachmentConfiguration *v9;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  NSClassFromString(CFSTR("UIWindowScene"));
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PRUISPosterAttachmentConfiguration attachmentConfigurationWithHostWindowScene:attachments:].cold.1();
LABEL_17:
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2445F7DB4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:UIWindowSceneClass]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PRUISPosterAttachmentConfiguration attachmentConfigurationWithHostWindowScene:attachments:].cold.1();
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2445F7E18);
  }

  v8 = v6;
  NSClassFromString(CFSTR("NSArray"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PRUISPosterAttachmentConfiguration attachmentConfigurationWithHostWindowScene:attachments:].cold.2();
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2445F7E7CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSArrayClass]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PRUISPosterAttachmentConfiguration attachmentConfigurationWithHostWindowScene:attachments:].cold.2();
    goto LABEL_17;
  }

  v9 = objc_alloc_init(PRUISPosterAttachmentConfiguration);
  -[PRUISPosterAttachmentConfiguration setAttachments:](v9, "setAttachments:", v8);
  -[PRUISPosterAttachmentConfiguration setAttachmentHostWindowScene:](v9, "setAttachmentHostWindowScene:", v7);

  return v9;
}

- (PRUISPosterAttachmentConfiguration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRUISPosterAttachmentConfiguration;
  return -[PRUISPosterAttachmentConfiguration init](&v3, sel_init);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v7 = v4;
    objc_msgSend(v7, "attachmentHostWindowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRUISPosterAttachmentConfiguration attachmentHostWindowScene](self, "attachmentHostWindowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqual:", v9))
    {
      objc_msgSend(v7, "attachments");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRUISPosterAttachmentConfiguration attachments](self, "attachments");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToArray:", v11);

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

- (void)setAttachments:(id)a3
{
  id v4;
  NSArray **p_attachments;
  NSArray *attachments;
  void *v7;
  id v8;

  v4 = a3;
  attachments = self->_attachments;
  p_attachments = &self->_attachments;
  v8 = v4;
  if ((objc_msgSend(v4, "isEqualToArray:", attachments) & 1) == 0)
  {
    if (v8)
      v7 = v8;
    else
      v7 = (void *)MEMORY[0x24BDBD1A8];
    objc_storeStrong((id *)p_attachments, v7);
  }

}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRUISPosterAttachmentConfiguration attachments](self, "attachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[PRUISPosterAttachmentConfiguration attachmentHostWindowScene](self, "attachmentHostWindowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:", v6);

  v8 = objc_msgSend(v3, "hash");
  return v8;
}

- (UIWindowScene)attachmentHostWindowScene
{
  return self->_attachmentHostWindowScene;
}

- (void)setAttachmentHostWindowScene:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentHostWindowScene, a3);
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_attachmentHostWindowScene, 0);
}

+ (void)attachmentConfigurationWithHostWindowScene:attachments:.cold.1()
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
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1(&dword_2445ED000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)attachmentConfigurationWithHostWindowScene:attachments:.cold.2()
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
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1(&dword_2445ED000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
