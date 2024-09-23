@implementation PUIStylePickerConfiguration

+ (id)defaultStylePickerConfigurationForRole:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_msgSend(v4, "initWithPreviewTextString:defaultRole:components:defaultContentsLuminance:styleConfiguration:textLayoutConfiguration:", 0, v3, v5, v6, v7, 0.5);

  return v8;
}

- (PUIStylePickerConfiguration)initWithPreviewTextString:(id)a3 defaultRole:(id)a4 components:(id)a5 defaultContentsLuminance:(double)a6 styleConfiguration:(id)a7 textLayoutConfiguration:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  PUIStylePickerConfiguration *v24;
  uint64_t v25;
  NSString *previewTextString;
  uint64_t v27;
  PUIStyleConfiguration *styleConfiguration;
  uint64_t v29;
  PUITextLayoutConfiguration *textLayoutConfiguration;
  PUIStylePickerConfiguration *result;
  void *v32;
  objc_super v33;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v20 = objc_msgSend(v17, "containsComponent:", 4);
  if (v18 && (v20 & 1) == 0)
  {
    objc_msgSend(v17, "componentsByAddingComponent:", 4);
    v21 = objc_claimAutoreleasedReturnValue();

    v17 = (id)v21;
  }
  v22 = objc_msgSend(v17, "containsComponent:", 1);
  if (v19 && (v22 & 1) == 0)
  {
    objc_msgSend(v17, "componentsByAddingComponent:", 1);
    v23 = objc_claimAutoreleasedReturnValue();

    v17 = (id)v23;
  }
  if (v17)
  {
    v33.receiver = self;
    v33.super_class = (Class)PUIStylePickerConfiguration;
    v24 = -[PUIStylePickerConfiguration init](&v33, sel_init);
    if (v24)
    {
      v25 = objc_msgSend(v15, "copy");
      previewTextString = v24->_previewTextString;
      v24->_previewTextString = (NSString *)v25;

      v24->_defaultContentsLuminance = a6;
      v27 = objc_msgSend(v18, "copy");
      styleConfiguration = v24->_styleConfiguration;
      v24->_styleConfiguration = (PUIStyleConfiguration *)v27;

      v29 = objc_msgSend(v19, "copy");
      textLayoutConfiguration = v24->_textLayoutConfiguration;
      v24->_textLayoutConfiguration = (PUITextLayoutConfiguration *)v29;

      objc_storeStrong((id *)&v24->_components, v17);
      *(_OWORD *)&v24->_edgeInsets.top = 0u;
      *(_OWORD *)&v24->_edgeInsets.bottom = 0u;
    }

    return v24;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("components != 0"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIStylePickerConfiguration initWithPreviewTextString:defaultRole:components:defaultContentsLuminance:styleConfiguration:textLayoutConfiguration:].cold.1(a2, (uint64_t)self, (uint64_t)v32);
    objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
    result = (PUIStylePickerConfiguration *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (PUIStylePickerConfiguration)init
{
  void *v3;
  PUIStylePickerConfiguration *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[PUIStylePickerConfiguration initWithPreviewTextString:defaultRole:components:defaultContentsLuminance:styleConfiguration:textLayoutConfiguration:](self, "initWithPreviewTextString:defaultRole:components:defaultContentsLuminance:styleConfiguration:textLayoutConfiguration:", 0, 0, v3, 0, 0, 0.5);

  return v4;
}

- (NSString)description
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  PUIStylePickerConfiguration *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x24BE0BE10]);
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __42__PUIStylePickerConfiguration_description__block_invoke;
  v10 = &unk_25154BFC0;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __42__PUIStylePickerConfiguration_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDescriptionToStream:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isEqual:(id)a3
{
  PUIStylePickerConfiguration *v4;
  PUIStylePickerConfiguration *v5;
  BOOL v6;

  v4 = (PUIStylePickerConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PUIStylePickerConfiguration isEqualToStylePickerConfiguration:](self, "isEqualToStylePickerConfiguration:", v5);

  return v6;
}

- (BOOL)isEqualToStylePickerConfiguration:(id)a3
{
  PUIStylePickerConfiguration *v4;
  PUIStylePickerConfiguration *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  BOOL v35;
  double v36;
  BOOL v37;

  v4 = (PUIStylePickerConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v37 = 1;
  }
  else
  {
    if (!v4)
      goto LABEL_19;
    -[PUIStylePickerConfiguration components](v4, "components");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIStylePickerConfiguration components](self, "components");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if (!v8)
      goto LABEL_19;
    -[PUIStylePickerConfiguration previewTextString](v5, "previewTextString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIStylePickerConfiguration previewTextString](self, "previewTextString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    if (!v11)
      goto LABEL_19;
    -[PUIStylePickerConfiguration defaultContentsLuminance](v5, "defaultContentsLuminance");
    v13 = v12 == 0.0 ? 1.0 : 0.0;
    -[PUIStylePickerConfiguration defaultContentsLuminance](self, "defaultContentsLuminance");
    if (v14 == v13)
      goto LABEL_19;
    -[PUIStylePickerConfiguration textLayoutConfiguration](v5, "textLayoutConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIStylePickerConfiguration textLayoutConfiguration](self, "textLayoutConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_19;
    -[PUIStylePickerConfiguration styleConfiguration](v5, "styleConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIStylePickerConfiguration styleConfiguration](self, "styleConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if (!v20)
      goto LABEL_19;
    -[PUIStylePickerConfiguration homeScreenConfiguration](v5, "homeScreenConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIStylePickerConfiguration homeScreenConfiguration](self, "homeScreenConfiguration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (v23)
    {
      -[PUIStylePickerConfiguration edgeInsets](v5, "edgeInsets");
      v25 = v24;
      v27 = v26;
      v29 = v28;
      v31 = v30;
      -[PUIStylePickerConfiguration edgeInsets](self, "edgeInsets");
      v35 = v27 == v34;
      if (v25 != v36)
        v35 = 0;
      if (v31 != v33)
        v35 = 0;
      v37 = v29 == v32 && v35;
    }
    else
    {
LABEL_19:
      v37 = 0;
    }
  }

  return v37;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;

  v3 = -[PUIStylePickerComponents hash](self->_components, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_defaultContentsLuminance);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v3 ^ -[PUITextLayoutConfiguration hash](self->_textLayoutConfiguration, "hash");
  v7 = v5 ^ v6 ^ -[PUIStyleConfiguration hash](self->_styleConfiguration, "hash");
  v8 = -[NSString hash](self->_previewTextString, "hash");
  v9 = v8 ^ -[NSString hash](self->_defaultRole, "hash");
  NSStringFromDirectionalEdgeInsets(self->_edgeInsets);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  v12 = v7 ^ v11 ^ -[PUIStylePickerHomeScreenConfiguration hash](self->_homeScreenConfiguration, "hash");

  return v12;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  float64x2_t v9;
  float64x2_t v10;
  CGFloat leading;
  CGFloat trailing;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v17 = a3;
  v4 = (id)objc_msgSend(v17, "appendObject:withName:", self->_previewTextString, CFSTR("_previewTextString"));
  v5 = (id)objc_msgSend(v17, "appendObject:withName:", self->_components, CFSTR("_components"));
  v6 = (id)objc_msgSend(v17, "appendDouble:withName:decimalPrecision:", CFSTR("_defaultContentsLuminance"), 5, self->_defaultContentsLuminance);
  v7 = (id)objc_msgSend(v17, "appendObject:withName:", self->_textLayoutConfiguration, CFSTR("_textLayoutConfiguration"));
  v8 = (id)objc_msgSend(v17, "appendObject:withName:", self->_styleConfiguration, CFSTR("_styleConfiguration"));
  v9 = *(float64x2_t *)&self->_edgeInsets.top;
  v10 = *(float64x2_t *)&self->_edgeInsets.bottom;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*MEMORY[0x24BDF65E8], v9), (int32x4_t)vceqq_f64(*(float64x2_t *)(MEMORY[0x24BDF65E8] + 16), v10))), 0xFuLL))) & 1) == 0)
  {
    leading = self->_edgeInsets.leading;
    trailing = self->_edgeInsets.trailing;
    NSStringFromDirectionalEdgeInsets(*(NSDirectionalEdgeInsets *)v9.f64);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v17, "appendObject:withName:", v13, CFSTR("_edgeInsets"));

  }
  v15 = (id)objc_msgSend(v17, "appendObject:withName:", self->_styleConfiguration, CFSTR("_styleConfiguration"));
  if (-[PUIStylePickerComponents containsComponent:](self->_components, "containsComponent:", 32))
    v16 = (id)objc_msgSend(v17, "appendObject:withName:", self->_homeScreenConfiguration, CFSTR("_homeScreenConfiguration"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[PUIStylePickerConfiguration previewTextString](self, "previewTextString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreviewTextString:", v5);

  -[PUIStylePickerConfiguration defaultContentsLuminance](self, "defaultContentsLuminance");
  objc_msgSend(v4, "setDefaultContentsLuminance:");
  -[PUIStylePickerConfiguration styleConfiguration](self, "styleConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStyleConfiguration:", v6);

  -[PUIStylePickerConfiguration textLayoutConfiguration](self, "textLayoutConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextLayoutConfiguration:", v7);

  -[PUIStylePickerConfiguration defaultRole](self, "defaultRole");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultRole:", v8);

  -[PUIStylePickerConfiguration components](self, "components");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setComponents:", v9);

  -[PUIStylePickerConfiguration edgeInsets](self, "edgeInsets");
  objc_msgSend(v4, "setEdgeInsets:");
  -[PUIStylePickerConfiguration homeScreenConfiguration](self, "homeScreenConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHomeScreenConfiguration:", v10);

  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PUIMutableStylePickerConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = -[PUIStylePickerConfiguration init](+[PUIMutableStylePickerConfiguration allocWithZone:](PUIMutableStylePickerConfiguration, "allocWithZone:", a3), "init");
  -[PUIStylePickerConfiguration previewTextString](self, "previewTextString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStylePickerConfiguration setPreviewTextString:](v4, "setPreviewTextString:", v5);

  -[PUIStylePickerConfiguration defaultContentsLuminance](self, "defaultContentsLuminance");
  -[PUIStylePickerConfiguration setDefaultContentsLuminance:](v4, "setDefaultContentsLuminance:");
  -[PUIStylePickerConfiguration styleConfiguration](self, "styleConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStylePickerConfiguration setStyleConfiguration:](v4, "setStyleConfiguration:", v6);

  -[PUIStylePickerConfiguration textLayoutConfiguration](self, "textLayoutConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStylePickerConfiguration setTextLayoutConfiguration:](v4, "setTextLayoutConfiguration:", v7);

  -[PUIStylePickerConfiguration defaultRole](self, "defaultRole");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStylePickerConfiguration setDefaultRole:](v4, "setDefaultRole:", v8);

  -[PUIStylePickerConfiguration components](self, "components");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStylePickerConfiguration setComponents:](v4, "setComponents:", v9);

  -[PUIStylePickerConfiguration edgeInsets](self, "edgeInsets");
  -[PUIStylePickerConfiguration setEdgeInsets:](v4, "setEdgeInsets:");
  -[PUIStylePickerConfiguration homeScreenConfiguration](self, "homeScreenConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStylePickerConfiguration setHomeScreenConfiguration:](v4, "setHomeScreenConfiguration:", v10);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUIStylePickerConfiguration)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PUIStylePickerConfiguration *v18;
  void *v19;
  NSString *v20;

  v4 = a3;
  objc_msgSend(v4, "_ui_decodeCGFloatForKey:", CFSTR("_defaultContentsLuminance"));
  v6 = v5;
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("_defaultRole"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_components"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, CFSTR("_previewTextString"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, CFSTR("_styleConfiguration"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, CFSTR("_textLayoutConfiguration"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, CFSTR("_homeScreenConfiguration"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[PUIStylePickerConfiguration initWithPreviewTextString:defaultRole:components:defaultContentsLuminance:styleConfiguration:textLayoutConfiguration:](self, "initWithPreviewTextString:defaultRole:components:defaultContentsLuminance:styleConfiguration:textLayoutConfiguration:", v11, v8, v9, v13, v15, v6);
  if (v18)
  {
    objc_opt_self();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v19, CFSTR("_edgeInsets"));
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    v18->_edgeInsets = NSDirectionalEdgeInsetsFromString(v20);

    objc_storeStrong((id *)&v18->_homeScreenConfiguration, v17);
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  double defaultContentsLuminance;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSDirectionalEdgeInsets v12;

  defaultContentsLuminance = self->_defaultContentsLuminance;
  v5 = a3;
  objc_msgSend(v5, "_ui_encodeCGFloat:forKey:", CFSTR("_defaultContentsLuminance"), defaultContentsLuminance);
  -[PUIStylePickerConfiguration defaultRole](self, "defaultRole");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("_defaultRole"));

  -[PUIStylePickerConfiguration previewTextString](self, "previewTextString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("_previewTextString"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_components, CFSTR("_components"));
  -[PUIStylePickerConfiguration styleConfiguration](self, "styleConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("_styleConfiguration"));

  -[PUIStylePickerConfiguration textLayoutConfiguration](self, "textLayoutConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("_textLayoutConfiguration"));

  -[PUIStylePickerConfiguration edgeInsets](self, "edgeInsets");
  NSStringFromDirectionalEdgeInsets(v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("_edgeInsets"));

  -[PUIStylePickerConfiguration homeScreenConfiguration](self, "homeScreenConfiguration");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("_homeScreenConfiguration"));

}

- (NSString)previewTextString
{
  return self->_previewTextString;
}

- (void)setPreviewTextString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)defaultContentsLuminance
{
  return self->_defaultContentsLuminance;
}

- (void)setDefaultContentsLuminance:(double)a3
{
  self->_defaultContentsLuminance = a3;
}

- (NSString)defaultRole
{
  return self->_defaultRole;
}

- (void)setDefaultRole:(id)a3
{
  objc_storeStrong((id *)&self->_defaultRole, a3);
}

- (PUIStylePickerComponents)components
{
  return self->_components;
}

- (void)setComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (PUIStyleConfiguration)styleConfiguration
{
  return self->_styleConfiguration;
}

- (void)setStyleConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (PUITextLayoutConfiguration)textLayoutConfiguration
{
  return self->_textLayoutConfiguration;
}

- (void)setTextLayoutConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDirectionalEdgeInsets)edgeInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_edgeInsets.top;
  leading = self->_edgeInsets.leading;
  bottom = self->_edgeInsets.bottom;
  trailing = self->_edgeInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)setEdgeInsets:(NSDirectionalEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (PUIStylePickerHomeScreenConfiguration)homeScreenConfiguration
{
  return self->_homeScreenConfiguration;
}

- (void)setHomeScreenConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeScreenConfiguration, 0);
  objc_storeStrong((id *)&self->_textLayoutConfiguration, 0);
  objc_storeStrong((id *)&self->_styleConfiguration, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_defaultRole, 0);
  objc_storeStrong((id *)&self->_previewTextString, 0);
}

- (void)initWithPreviewTextString:(uint64_t)a3 defaultRole:components:defaultContentsLuminance:styleConfiguration:textLayoutConfiguration:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
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

  v20 = *MEMORY[0x24BDAC8D0];
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
  v15 = CFSTR("PUIStylePickerConfiguration.m");
  v16 = 1024;
  v17 = 84;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_24464E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
