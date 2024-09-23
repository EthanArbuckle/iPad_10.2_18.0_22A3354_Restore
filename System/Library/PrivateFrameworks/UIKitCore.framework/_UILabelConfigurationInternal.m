@implementation _UILabelConfigurationInternal

- (id)_resolvedCuiCatalog
{
  if (a1)
  {
    -[_UILabelConfigurationInternal _cuiCatalog](a1);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_resolvedCuiStyleEffectConfiguration
{
  if (a1)
  {
    -[_UILabelConfigurationInternal _cuiStyleEffectConfiguration](a1);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_UILabelConfigurationInternal)init
{
  _UILabelConfigurationInternal *v2;
  int v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UILabelConfigurationInternal;
  v2 = -[_UILabelConfigurationInternal init](&v5, sel_init);
  if (v2)
  {
    if (dyld_program_sdk_at_least())
      v3 = 128;
    else
      v3 = 0;
    v2->_configurationFlags = ($80F9FF894D804BF481F9E54DC1AB63BD)(*(_DWORD *)&v2->_configurationFlags & 0xFFFFFF7F | v3);
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  _UILabelConfigurationInternal *v4;
  $80F9FF894D804BF481F9E54DC1AB63BD configurationFlags;
  int v7;
  UIColor *v9;
  UIColor *v10;
  UIColor *v11;
  UIColor *v12;
  UIColor *v13;
  UIColor *v14;
  UIColor *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  UIColor *v19;
  void *v20;
  void *v21;

  v4 = (_UILabelConfigurationInternal *)a3;
  if (v4 == self)
  {
    LOBYTE(v7) = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    configurationFlags = self->_configurationFlags;
    if (configurationFlags == v4->_configurationFlags
      && ((*(_DWORD *)&configurationFlags ^ *(_DWORD *)&v4->_configurationFlags) & 0x300) == 0
      && v4->_lineSpacing == self->_lineSpacing)
    {
      v9 = v4->_disabledTextColor;
      v10 = self->_disabledTextColor;
      v11 = v9;
      v12 = v10;
      v13 = v12;
      if (v11 == v12)
      {

      }
      else
      {
        LOBYTE(v7) = 0;
        v14 = v12;
        v15 = v11;
        if (!v11 || !v12)
          goto LABEL_25;
        v16 = -[UIColor isEqual:](v11, "isEqual:", v12);

        if (!v16)
        {
          LOBYTE(v7) = 0;
LABEL_26:

          goto LABEL_10;
        }
      }
      -[_UILabelConfigurationInternal _cuiCatalog](v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UILabelConfigurationInternal _cuiCatalog](self);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v17;
      v19 = v18;
      v14 = v19;
      if (v15 == v19)
      {

      }
      else
      {
        LOBYTE(v7) = 0;
        v20 = v19;
        v21 = v15;
        if (!v15 || !v19)
          goto LABEL_24;
        v7 = -[UIColor isEqual:](v15, "isEqual:", v19);

        if (!v7)
          goto LABEL_25;
      }
      -[_UILabelConfigurationInternal _cuiStyleEffectConfiguration](v4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UILabelConfigurationInternal _cuiStyleEffectConfiguration](self);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v7) = CUIStyleEffectConfigurationEqualToStyleEffectConfiguration(v21, v20);
LABEL_24:

LABEL_25:
      goto LABEL_26;
    }
  }
  LOBYTE(v7) = 0;
LABEL_10:

  return v7;
}

- (id)_cuiCatalog
{
  if (a1)
  {
    objc_getAssociatedObject(a1, &cuiCatalogKey);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_cuiStyleEffectConfiguration
{
  if (a1)
  {
    objc_getAssociatedObject(a1, &cuiStyleEffectConfigurationKey);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (unint64_t)hash
{
  unint64_t configurationFlags;

  configurationFlags = self->_configurationFlags;
  return ((configurationFlags & 1) << 16) ^ ((uint64_t)(self->_lineSpacing * 100.0) << 8) ^ ((_DWORD)configurationFlags << 15) & 0x20000 ^ (unint64_t)(((_DWORD)configurationFlags << 15) & 0x40000) ^ ((_DWORD)configurationFlags << 15) & 0x80000 ^ ((_DWORD)configurationFlags << 15) & 0x100000 ^ (((configurationFlags >> 6) & 1) << 21) ^ (((configurationFlags >> 6) & 1) << 22);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  $80F9FF894D804BF481F9E54DC1AB63BD *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = ($80F9FF894D804BF481F9E54DC1AB63BD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[UIBarButtonItemGroup _customizationIdentifier]((id *)&self->super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UILabelConfigurationInternal _setDisabledTextColor:]((uint64_t)v4, v5);

  -[_UILabelConfigurationInternal _cuiCatalog](self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_setAssociatedObject(v4, &cuiCatalogKey, v6, (void *)1);

  -[_UILabelConfigurationInternal _cuiStyleEffectConfiguration](self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_setAssociatedObject(v4, &cuiStyleEffectConfigurationKey, v7, (void *)1);

  v4[6] = self->_configurationFlags;
  return v4;
}

- (void)_setDisabledTextColor:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 16), a2);
    *(_DWORD *)(a1 + 24) |= 0x400000u;
  }

}

- (_UILabelConfigurationInternal)initWithCoder:(id)a3
{
  id v4;
  _UILabelConfigurationInternal *v5;
  int v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  float v11;
  void *v12;
  int v13;
  int v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_UILabelConfigurationInternal;
  v5 = -[_UILabelConfigurationInternal init](&v16, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_autotracksTextToFit")))v5->_configurationFlags = ($80F9FF894D804BF481F9E54DC1AB63BD)(*(_DWORD *)&v5->_configurationFlags & 0xFFFFFFFE | objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UILabelConfiguration_autotracksTextToFit")) | 0x400);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_textAlignmentMirrored")))
    {
      if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UILabelConfiguration_textAlignmentMirrored")))
        v6 = 8200;
      else
        v6 = 0x2000;
      v5->_configurationFlags = ($80F9FF894D804BF481F9E54DC1AB63BD)(*(_DWORD *)&v5->_configurationFlags & 0xFFFFFFF7 | v6);
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_textAlignmentFollowsWritingDirection")))
    {
      if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UILabelConfiguration_textAlignmentFollowsWritingDirection")))v7 = 4100;
      else
        v7 = 4096;
      v5->_configurationFlags = ($80F9FF894D804BF481F9E54DC1AB63BD)(*(_DWORD *)&v5->_configurationFlags & 0xFFFFFFFB | v7);
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_usesSimpleTextEffects")))
    {
      if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UILabelConfiguration_usesSimpleTextEffects")))
        v8 = 16400;
      else
        v8 = 0x4000;
      v5->_configurationFlags = ($80F9FF894D804BF481F9E54DC1AB63BD)(*(_DWORD *)&v5->_configurationFlags & 0xFFFFFFEF | v8);
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_cuiCatalog")))
    {
      *(_DWORD *)&v5->_configurationFlags |= 0x8000u;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UILabelConfiguration_cuiCatalog"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setAssociatedObject(v5, &cuiCatalogKey, v9, (void *)1);

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_cuiStyleEffectConfiguration")))
    {
      *(_DWORD *)&v5->_configurationFlags |= 0x10000u;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UILabelConfiguration_cuiStyleEffectConfiguration"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setAssociatedObject(v5, &cuiStyleEffectConfigurationKey, v10, (void *)1);

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_lineSpacing")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UILabelConfiguration_lineSpacing"));
      v5->_lineSpacing = v11;
      *(_DWORD *)&v5->_configurationFlags |= 0x20000u;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_disabledTextColor")))
    {
      *(_DWORD *)&v5->_configurationFlags |= 0x400000u;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UILabelConfiguration_disabledTextColor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UILabelConfigurationInternal _setDisabledTextColor:]((uint64_t)v5, v12);

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_hyphenationFactorIgnoredIfURLsDetected")))
    {
      if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UILabelConfiguration_hyphenationFactorIgnoredIfURLsDetected")))v13 = 262208;
      else
        v13 = 0x40000;
      v5->_configurationFlags = ($80F9FF894D804BF481F9E54DC1AB63BD)(*(_DWORD *)&v5->_configurationFlags & 0xFFFFFFBF | v13);
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_overallWritingDirectionFollowsLayoutDirection")))
    {
      if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UILabelConfiguration_overallWritingDirectionFollowsLayoutDirection")))v14 = 1048608;
      else
        v14 = 0x100000;
      v5->_configurationFlags = ($80F9FF894D804BF481F9E54DC1AB63BD)(*(_DWORD *)&v5->_configurationFlags & 0xFFFFFFDF | v14);
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILabelConfiguration_hasCustomized_baselineAdjustment")))v5->_configurationFlags = ($80F9FF894D804BF481F9E54DC1AB63BD)(*(_DWORD *)&v5->_configurationFlags & 0xFFF7FFFF | ((objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UILabelConfiguration_baselineAdjustment")) & 1) << 19));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  $80F9FF894D804BF481F9E54DC1AB63BD configurationFlags;
  void *v5;
  void *v6;
  double lineSpacing;
  UIColor *v8;
  id v9;

  v9 = a3;
  configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x400) != 0)
  {
    objc_msgSend(v9, "encodeBool:forKey:", *(_BYTE *)&configurationFlags & 1, CFSTR("UILabelConfiguration_autotracksTextToFit"));
    objc_msgSend(v9, "encodeBool:forKey:", 1, CFSTR("UILabelConfiguration_hasCustomized_autotracksTextToFit"));
    configurationFlags = self->_configurationFlags;
    if ((*(_WORD *)&configurationFlags & 0x2000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&configurationFlags & 0x1000) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_WORD *)&configurationFlags & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v9, "encodeBool:forKey:", (*(unsigned int *)&configurationFlags >> 3) & 1, CFSTR("UILabelConfiguration_textAlignmentMirrored"));
  objc_msgSend(v9, "encodeBool:forKey:", 1, CFSTR("UILabelConfiguration_hasCustomized_textAlignmentMirrored"));
  configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x1000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&configurationFlags & 0x4000) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(v9, "encodeBool:forKey:", (*(unsigned int *)&configurationFlags >> 2) & 1, CFSTR("UILabelConfiguration_textAlignmentFollowsWritingDirection"));
  objc_msgSend(v9, "encodeBool:forKey:", 1, CFSTR("UILabelConfiguration_hasCustomized_textAlignmentFollowsWritingDirection"));
  configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x4000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&configurationFlags & 0x8000) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v9, "encodeBool:forKey:", (*(unsigned int *)&configurationFlags >> 4) & 1, CFSTR("UILabelConfiguration_usesSimpleTextEffects"));
  objc_msgSend(v9, "encodeBool:forKey:", 1, CFSTR("UILabelConfiguration_hasCustomized_usesSimpleTextEffects"));
  configurationFlags = self->_configurationFlags;
  if ((*(_WORD *)&configurationFlags & 0x8000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&configurationFlags & 0x10000) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  -[_UILabelConfigurationInternal _cuiCatalog](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("UILabelConfiguration_cuiCatalog"));

  objc_msgSend(v9, "encodeBool:forKey:", 1, CFSTR("UILabelConfiguration_hasCustomized_cuiCatalog"));
  configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x10000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&configurationFlags & 0x20000) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  -[_UILabelConfigurationInternal _cuiStyleEffectConfiguration](self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("UILabelConfiguration_cuiStyleEffectConfiguration"));

  objc_msgSend(v9, "encodeBool:forKey:", 1, CFSTR("UILabelConfiguration_hasCustomized_cuiStyleEffectConfiguration"));
  configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x20000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&configurationFlags & 0x400000) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  lineSpacing = self->_lineSpacing;
  *(float *)&lineSpacing = lineSpacing;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("UILabelConfiguration_lineSpacing"), lineSpacing);
  objc_msgSend(v9, "encodeBool:forKey:", 1, CFSTR("UILabelConfiguration_hasCustomized_lineSpacing"));
  configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x400000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&configurationFlags & 0x40000) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  v8 = self->_disabledTextColor;
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("UILabelConfiguration_disabledTextColor"));

  objc_msgSend(v9, "encodeBool:forKey:", 1, CFSTR("UILabelConfiguration_hasCustomized_disabledTextColor"));
  configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x40000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&configurationFlags & 0x100000) == 0)
      goto LABEL_11;
LABEL_23:
    objc_msgSend(v9, "encodeBool:forKey:", (*(unsigned int *)&configurationFlags >> 5) & 1, CFSTR("UILabelConfiguration_overallWritingDirectionFollowsLayoutDirection"));
    objc_msgSend(v9, "encodeBool:forKey:", 1, CFSTR("UILabelConfiguration_hasCustomized_overallWritingDirectionFollowsLayoutDirection"));
    configurationFlags = self->_configurationFlags;
    if ((*(_DWORD *)&configurationFlags & 0x80000) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_22:
  objc_msgSend(v9, "encodeBool:forKey:", (*(unsigned int *)&configurationFlags >> 6) & 1, CFSTR("UILabelConfiguration_hyphenationFactorIgnoredIfURLsDetected"));
  objc_msgSend(v9, "encodeBool:forKey:", 1, CFSTR("UILabelConfiguration_hasCustomized_hyphenationFactorIgnoredIfURLsDetected"));
  configurationFlags = self->_configurationFlags;
  if ((*(_DWORD *)&configurationFlags & 0x100000) != 0)
    goto LABEL_23;
LABEL_11:
  if ((*(_DWORD *)&configurationFlags & 0x80000) != 0)
  {
LABEL_12:
    objc_msgSend(v9, "encodeInt:forKey:", (*(unsigned int *)&configurationFlags >> 8) & 3, CFSTR("UILabelConfiguration_baselineAdjustment"));
    objc_msgSend(v9, "encodeBool:forKey:", (*(_DWORD *)&self->_configurationFlags >> 19) & 1, CFSTR("UILabelConfiguration_hasCustomized_baselineAdjustment"));
  }
LABEL_13:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledTextColor, 0);
}

@end
