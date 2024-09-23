@implementation PRUISPosterAttachment

+ (id)attachmentWithImage:(id)a3 level:(int64_t)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v6 = (objc_class *)MEMORY[0x24BDF6AE8];
    v7 = a3;
    v8 = (void *)objc_msgSend([v6 alloc], "initWithImage:", v7);

    objc_msgSend(v8, "sizeToFit");
    objc_msgSend(a1, "attachmentWithView:level:", v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

+ (id)attachmentWithView:(id)a3 level:(int64_t)a4
{
  id v7;
  void *v8;
  PRUISPosterAttachment *v9;
  void *v11;
  void *v12;
  void *v13;

  v7 = a3;
  if (PUIPosterLevelIsDefined())
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    NSStringFromPUIPosterLevel();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Level %lu is already in-use as %@"), a4, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PRUISPosterAttachment attachmentWithView:level:].cold.1(a2);
LABEL_12:
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2445F41A0);
  }
  if (!v7)
  {
    v9 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v7, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[view superview] == nil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PRUISPosterAttachment attachmentWithView:level:].cold.2(a2);
    goto LABEL_12;
  }
  v9 = objc_alloc_init(PRUISPosterAttachment);
  objc_storeStrong((id *)&v9->_view, a3);
  v9->_level = a4;
LABEL_6:

  return v9;
}

- (int64_t)compare:(id)a3
{
  _QWORD *v5;
  int64_t level;
  int64_t v7;
  BOOL v8;
  BOOL v9;
  uint64_t v10;
  int64_t v11;
  int64_t result;
  void *v13;

  v5 = a3;
  if (v5)
  {
    level = self->_level;
    v7 = v5[2];
    v8 = level == v7;
    v9 = level < v7;
    v10 = -1;
    if (!v9)
      v10 = 1;
    if (v8)
      v11 = 0;
    else
      v11 = v10;

    return v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("other"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PRUISPosterAttachment compare:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (UIView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
  objc_storeStrong((id *)&self->_view, a3);
}

- (int64_t)level
{
  return self->_level;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
}

+ (void)attachmentWithView:(const char *)a1 level:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
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

+ (void)attachmentWithView:(const char *)a1 level:.cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
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

- (void)compare:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
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
