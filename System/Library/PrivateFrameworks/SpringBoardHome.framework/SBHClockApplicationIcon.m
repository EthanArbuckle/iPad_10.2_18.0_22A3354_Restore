@implementation SBHClockApplicationIcon

- (Class)iconImageViewClassForLocation:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "_shouldAnimateInLocation:", v4))
  {
    objc_opt_self();
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBHClockApplicationIcon;
    -[SBIcon iconImageViewClassForLocation:](&v8, sel_iconImageViewClassForLocation_, v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return (Class)v6;
}

+ (BOOL)_shouldAnimateInLocation:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("SBIconLocationAppLibrarySearch")) ^ 1;
}

@end
