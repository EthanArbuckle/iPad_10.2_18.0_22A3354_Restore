@implementation _UIImageSystemImageVisualStyle

+ (id)_iosVisualStyle
{
  objc_opt_self();
  if (_MergedGlobals_1258 != -1)
    dispatch_once(&_MergedGlobals_1258, &__block_literal_global_562);
  return (id)qword_1ECD81BC8;
}

- (_QWORD)actionsImage
{
  _QWORD *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[1];
    if (!v2)
    {
      +[UIImageSymbolConfiguration configurationPreferringMulticolor](UIImageSymbolConfiguration, "configurationPreferringMulticolor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("ellipsis.circle.fill"), v3);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v1[1];
      v1[1] = v4;

      v2 = (void *)v1[1];
    }
    a1 = v2;
  }
  return a1;
}

- (_QWORD)addImage
{
  _QWORD *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[2];
    if (!v2)
    {
      +[UIImageSymbolConfiguration configurationPreferringMulticolor](UIImageSymbolConfiguration, "configurationPreferringMulticolor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("plus.circle.fill"), v3);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v1[2];
      v1[2] = v4;

      v2 = (void *)v1[2];
    }
    a1 = v2;
  }
  return a1;
}

- (_QWORD)removeImage
{
  _QWORD *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[3];
    if (!v2)
    {
      +[UIImageSymbolConfiguration configurationPreferringMulticolor](UIImageSymbolConfiguration, "configurationPreferringMulticolor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("minus.circle.fill"), v3);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v1[3];
      v1[3] = v4;

      v2 = (void *)v1[3];
    }
    a1 = v2;
  }
  return a1;
}

- (_QWORD)checkmarkImage
{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[4];
    if (!v2)
    {
      +[UIColor systemWhiteColor](UIColor, "systemWhiteColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = v3;
      +[UIColor tintColor](UIColor, "tintColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v10[1] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIImageSymbolConfiguration configurationWithPaletteColors:](UIImageSymbolConfiguration, "configurationWithPaletteColors:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("checkmark.circle.fill"), v6);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v1[4];
      v1[4] = v7;

      v2 = (void *)v1[4];
    }
    a1 = v2;
  }
  return a1;
}

- (_QWORD)strokedCheckmarkImage
{
  _QWORD *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[5];
    if (!v2)
    {
      +[UIImageSymbolConfiguration configurationPreferringMulticolor](UIImageSymbolConfiguration, "configurationPreferringMulticolor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", CFSTR("checkmark.circle.platter"), v3);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v1[5];
      v1[5] = v4;

      v2 = (void *)v1[5];
    }
    a1 = v2;
  }
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokedCheckmarkImage, 0);
  objc_storeStrong((id *)&self->_checkmarkImage, 0);
  objc_storeStrong((id *)&self->_removeImage, 0);
  objc_storeStrong((id *)&self->_addImage, 0);
  objc_storeStrong((id *)&self->_actionsImage, 0);
}

@end
