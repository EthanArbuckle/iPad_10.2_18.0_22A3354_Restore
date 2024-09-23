@implementation WFLinkEnumerationParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFLinkEnumerationParameter)initWithDefinition:(id)a3
{
  id v4;
  WFLinkEnumerationParameter *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSArray *v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSArray *displayImages;
  WFLinkEnumerationParameter *v14;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFLinkEnumerationParameter;
  v5 = -[WFEnumerationParameter initWithDefinition:](&v16, sel_initWithDefinition_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("ItemImages"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    v8 = v6;
    if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      getWFGeneralLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v11 = (void *)objc_opt_class();
        *(_DWORD *)buf = 136315906;
        v18 = "WFEnforceClass";
        v19 = 2114;
        v20 = v8;
        v21 = 2114;
        v22 = v11;
        v23 = 2114;
        v24 = v7;
        v12 = v11;
        _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

      }
      v9 = 0;
    }
    else
    {
      v9 = (NSArray *)v8;
    }

    displayImages = v5->_displayImages;
    v5->_displayImages = v9;

    v14 = v5;
  }

  return v5;
}

- (id)accessoryImageForPossibleState:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  id v17;
  objc_super v19;

  v4 = a3;
  -[WFEnumerationParameter possibleStates](self, "possibleStates");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_8;
  v6 = (void *)v5;
  -[WFLinkEnumerationParameter displayImages](self, "displayImages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  -[WFEnumerationParameter possibleStates](self, "possibleStates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v8 != v10)
    goto LABEL_8;
  -[WFEnumerationParameter possibleStates](self, "possibleStates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "indexOfObject:", v4);

  -[WFLinkEnumerationParameter displayImages](self, "displayImages");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v12 >= v14)
    goto LABEL_8;
  -[WFLinkEnumerationParameter displayImages](self, "displayImages");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

LABEL_8:
    v19.receiver = self;
    v19.super_class = (Class)WFLinkEnumerationParameter;
    -[WFEnumerationParameter accessoryImageForPossibleState:](&v19, sel_accessoryImageForPossibleState_, v4);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v17 = v16;

LABEL_9:
  return v17;
}

- (NSArray)displayImages
{
  return self->_displayImages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayImages, 0);
}

@end
