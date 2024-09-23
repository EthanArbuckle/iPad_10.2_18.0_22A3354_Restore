@implementation SBFMutablePhysicalButtonSceneTarget

- (void)addButtonTarget:(id)a3
{
  NSMutableDictionary *targetsByButton;
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    targetsByButton = self->super._targetsByButton;
    v4 = (void *)MEMORY[0x1E0CB37E8];
    v5 = a3;
    objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "button"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](targetsByButton, "setObject:forKey:", v5, v6);

  }
}

+ (id)targetWithScene:(id)a3
{
  id v5;
  void *v6;
  id *v7;
  void *v8;
  id *v9;
  id result;
  void *v11;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v7 = (id *)objc_alloc((Class)a1);
    objc_msgSend(v6, "identity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SBFPhysicalButtonSceneTarget _initWithScene:sceneIdentity:targetsByButton:](v7, v6, v8, 0);

    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("scene != ((void *)0)"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[SBFMutablePhysicalButtonSceneTarget targetWithScene:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (id)targetWithSceneIdentity:(id)a3
{
  id v5;
  void *v6;
  id *v7;
  id result;
  void *v9;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v7 = -[SBFPhysicalButtonSceneTarget _initWithScene:sceneIdentity:targetsByButton:]((id *)objc_alloc((Class)a1), 0, v5, 0);

    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("sceneIdentity != ((void *)0)"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[SBFMutablePhysicalButtonSceneTarget targetWithSceneIdentity:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)removeButtonTargetForButton:(unint64_t)a3
{
  NSMutableDictionary *targetsByButton;
  id v4;

  targetsByButton = self->super._targetsByButton;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](targetsByButton, "removeObjectForKey:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  SBFPhysicalButtonSceneTarget *v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;

  v4 = [SBFPhysicalButtonSceneTarget alloc];
  -[SBFPhysicalButtonSceneTarget scene](self, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFPhysicalButtonSceneTarget sceneIdentity](self, "sceneIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)-[NSMutableDictionary mutableCopy](self->super._targetsByButton, "mutableCopy");
  v8 = -[SBFPhysicalButtonSceneTarget _initWithScene:sceneIdentity:targetsByButton:]((id *)&v4->super.isa, v5, v6, v7);

  return v8;
}

+ (void)targetWithScene:(const char *)a1 .cold.1(const char *a1)
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_2(&dword_18AB69000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_3();
}

+ (void)targetWithSceneIdentity:(const char *)a1 .cold.1(const char *a1)
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_2(&dword_18AB69000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_3();
}

@end
