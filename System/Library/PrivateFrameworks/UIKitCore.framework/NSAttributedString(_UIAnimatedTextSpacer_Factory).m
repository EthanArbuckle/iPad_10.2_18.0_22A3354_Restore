@implementation NSAttributedString(_UIAnimatedTextSpacer_Factory)

+ (const)_animatedTextSpacerAttributeKey
{
  return CFSTR("_UIAnimatedTextSpacer");
}

+ (id)attributedStringWithAnimatedTextSpacer:()_UIAnimatedTextSpacer_Factory attributes:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_animatedTextSpacerAttributeKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v8;
  v15[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    v10 = (id)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(a1, "_animatedTextSpacerAttributeKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, v11);

  }
  else
  {
    v10 = v9;
  }

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR("\uFFFC\n"), v10);
  return v12;
}

@end
