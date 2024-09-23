@implementation UISwipeActionVisualStyleProvider

+ (id)visualStyleForIdiom:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  +[UISwipeActionVisualStyleProvider idiomToVisualStyleClassMap]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "objectForKey:", v5);

  if (!v6)
    objc_opt_class();
  return (id)objc_opt_new();
}

+ (id)idiomToVisualStyleClassMap
{
  objc_opt_self();
  if (_MergedGlobals_1007 != -1)
    dispatch_once(&_MergedGlobals_1007, &__block_literal_global_142);
  return (id)qword_1ECD7D5B8;
}

void __62__UISwipeActionVisualStyleProvider_idiomToVisualStyleClassMap__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = &unk_1E1A97518;
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "mutableCopy");
  v2 = (void *)qword_1ECD7D5B8;
  qword_1ECD7D5B8 = v1;

}

+ (void)registerVisualStyle:(Class)a3 forIdiom:(int64_t)a4
{
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if ((-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EDEE8E58) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UISwipeActionVisualStyle.m"), 134, CFSTR("visualStyle of type %@ does not conform to UISwipeActionVisualStyle."), v10);

  }
  +[UISwipeActionVisualStyleProvider idiomToVisualStyleClassMap]();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", a3, v8);

}

@end
