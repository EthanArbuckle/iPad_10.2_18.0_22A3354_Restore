@implementation WFLinkFavoriteEntityAction

+ (id)overrideInputParameterName
{
  return CFSTR("entities");
}

- (id)entityParameterName
{
  return CFSTR("entities");
}

- (id)verb
{
  return CFSTR("favorite");
}

- (id)overrideLabelsByParameter
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[WFLinkEntityAction capitalizedEntityName](self, "capitalizedEntityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v7 = CFSTR("entities");
  -[WFLinkEntityAction capitalizedEntityName](self, "capitalizedEntityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)overrideDefaultValuesByParameter
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("operation");
  v4[0] = CFSTR("add");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
