@implementation FBScene(PaperBoard)

- (uint64_t)pb_activate:()PaperBoard
{
  return objc_msgSend(a1, "pb_activate:withCompletion:", a3, 0);
}

- (uint64_t)pb_update:()PaperBoard
{
  return objc_msgSend(a1, "pb_update:withCompletion:", a3, 0);
}

- (void)pb_update:()PaperBoard withCompletion:
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD block[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = v8;
    if (objc_msgSend(a1, "isActive"))
    {
      objc_msgSend(a1, "performUpdate:withCompletion:", v7, v9);
    }
    else
    {
      v10 = MEMORY[0x1E0C809B0];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __48__FBScene_PaperBoard__pb_update_withCompletion___block_invoke;
      v14[3] = &unk_1E6B95168;
      v15 = v7;
      objc_msgSend(a1, "updateSettingsWithBlock:", v14);
      if (v9)
      {
        block[0] = v10;
        block[1] = 3221225472;
        block[2] = __48__FBScene_PaperBoard__pb_update_withCompletion___block_invoke_2;
        block[3] = &unk_1E6B94FA0;
        v13 = v9;
        dispatch_async(MEMORY[0x1E0C80D38], block);

      }
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("updater != nil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBScene(PaperBoard) pb_update:withCompletion:].cold.1(a2, (uint64_t)a1, (uint64_t)v11);
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)pb_update:()PaperBoard withCompletion:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("PBUIPosterSceneTypes.m");
  v16 = 1024;
  v17 = 118;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1B71C0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
