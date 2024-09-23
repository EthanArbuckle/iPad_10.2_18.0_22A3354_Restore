@implementation STUIStatusBarItemUpdate

- (void)setPlacementInfo:(id)a3
{
  objc_storeStrong((id *)&self->_placementInfo, a3);
}

- (BOOL)enablementChanged
{
  return self->_enablementChanged;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)styleAttributesChanged
{
  return self->_styleAttributesChanged;
}

- (STStatusBarData)data
{
  return self->_data;
}

- (void)setStyleAttributesChanged:(BOOL)a3
{
  self->_styleAttributesChanged = a3;
}

- (void)setStyleAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_styleAttributes, a3);
}

- (void)setEnablementChanged:(BOOL)a3
{
  self->_enablementChanged = a3;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)setDataChanged:(BOOL)a3
{
  self->_dataChanged = a3;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (BOOL)dataChanged
{
  return self->_dataChanged;
}

- (STUIStatusBarStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placementInfo, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  STUIStatusBarItemUpdate *v4;

  v4 = objc_alloc_init(STUIStatusBarItemUpdate);
  -[STUIStatusBarItemUpdate setEnablementChanged:](v4, "setEnablementChanged:", self->_enablementChanged);
  -[STUIStatusBarItemUpdate setEnabled:](v4, "setEnabled:", self->_enabled);
  -[STUIStatusBarItemUpdate setDataChanged:](v4, "setDataChanged:", self->_dataChanged);
  -[STUIStatusBarItemUpdate setData:](v4, "setData:", self->_data);
  -[STUIStatusBarItemUpdate setStyleAttributesChanged:](v4, "setStyleAttributesChanged:", self->_styleAttributesChanged);
  -[STUIStatusBarItemUpdate setStyleAttributes:](v4, "setStyleAttributes:", self->_styleAttributes);
  -[STUIStatusBarItemUpdate setPlacementInfo:](v4, "setPlacementInfo:", self->_placementInfo);
  return v4;
}

- (NSString)description
{
  return (NSString *)-[STUIStatusBarItemUpdate descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (NSString)debugDescription
{
  return (NSString *)-[STUIStatusBarItemUpdate debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STUIStatusBarItemUpdate succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STUIStatusBarItemUpdate descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STUIStatusBarItemUpdate _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STUIStatusBarItemUpdate _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 0);
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  STUIStatusBarItemUpdate *v14;

  v4 = a4;
  v6 = a3;
  -[STUIStatusBarItemUpdate succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUseDebugDescription:", v4);
  objc_msgSend(v7, "setActiveMultilinePrefix:", v6);

  objc_msgSend(v7, "activeMultilinePrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__STUIStatusBarItemUpdate__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
  v12[3] = &unk_1E8D62C88;
  v9 = v7;
  v13 = v9;
  v14 = self;
  objc_msgSend(v9, "appendBodySectionWithName:multilinePrefix:block:", 0, v8, v12);

  v10 = v9;
  return v10;
}

void __75__STUIStatusBarItemUpdate__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "enablementChanged"), CFSTR("enablementChanged"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "enabled"), CFSTR("enabled"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "dataChanged"), CFSTR("dataChanged"));
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:skipIfNil:", v6, CFSTR("data"), 1);

  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "styleAttributesChanged"), CFSTR("styleAttributesChanged"));
  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "styleAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v9, "appendObject:withName:skipIfNil:", v10, CFSTR("styleAttributes"), 1);

  v12 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "placementInfo");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendDictionarySection:withName:skipIfEmpty:", v13, CFSTR("placementInfo"), 1);

}

- (NSDictionary)placementInfo
{
  return self->_placementInfo;
}

@end
