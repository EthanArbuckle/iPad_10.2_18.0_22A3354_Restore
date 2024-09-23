@implementation SBSCardItem

- (SBSCardItem)initWithIdentifier:(id)a3 categoryIdentifier:(id)a4 iconData:(id)a5 title:(id)a6 subtitle:(id)a7 body:(id)a8 requiresPasscode:(BOOL)a9 bundleName:(id)a10 userInfo:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  SBSCardItem *v25;
  objc_super v27;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a10;
  v24 = a11;
  v27.receiver = self;
  v27.super_class = (Class)SBSCardItem;
  v25 = -[SBSCardItem init](&v27, sel_init);
  if (v24 && (objc_msgSend(MEMORY[0x1E0CB38B0], "propertyList:isValidForFormat:", v24, 200) & 1) == 0)
  {

    v25 = 0;
  }
  else if (v25)
  {
    -[SBSCardItem setIdentifier:](v25, "setIdentifier:", v17);
    -[SBSCardItem setCategoryIdentifier:](v25, "setCategoryIdentifier:", v18);
    -[SBSCardItem setIconData:](v25, "setIconData:", v19);
    -[SBSCardItem setTitle:](v25, "setTitle:", v20);
    -[SBSCardItem setSubtitle:](v25, "setSubtitle:", v21);
    -[SBSCardItem setBody:](v25, "setBody:", v22);
    -[SBSCardItem setRequiresPasscode:](v25, "setRequiresPasscode:", a9);
    -[SBSCardItem setBundleName:](v25, "setBundleName:", v23);
    -[SBSCardItem setUserInfo:](v25, "setUserInfo:", v24);
  }

  return v25;
}

- (SBSCardItem)initWithIdentifier:(id)a3 iconData:(id)a4 title:(id)a5 body:(id)a6 requiresPasscode:(BOOL)a7 bundleName:(id)a8 userInfo:(id)a9
{
  uint64_t v10;

  LOBYTE(v10) = a7;
  return -[SBSCardItem initWithIdentifier:categoryIdentifier:iconData:title:subtitle:body:requiresPasscode:bundleName:userInfo:](self, "initWithIdentifier:categoryIdentifier:iconData:title:subtitle:body:requiresPasscode:bundleName:userInfo:", a3, 0, a4, a5, 0, a6, v10, a8, a9);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SBSCardItem)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  SBSCardItem *v13;
  uint64_t v15;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("categoryIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("description"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("requiresPasscode"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodePropertyListForKey:", CFSTR("userInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v15) = v10;
  v13 = -[SBSCardItem initWithIdentifier:categoryIdentifier:iconData:title:subtitle:body:requiresPasscode:bundleName:userInfo:](self, "initWithIdentifier:categoryIdentifier:iconData:title:subtitle:body:requiresPasscode:bundleName:userInfo:", v4, v5, v6, v7, v8, v9, v15, v11, v12);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[SBSCardItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[SBSCardItem categoryIdentifier](self, "categoryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("categoryIdentifier"));

  -[SBSCardItem iconData](self, "iconData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("iconData"));

  -[SBSCardItem title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("title"));

  -[SBSCardItem subtitle](self, "subtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("subtitle"));

  -[SBSCardItem body](self, "body");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("description"));

  objc_msgSend(v4, "encodeBool:forKey:", -[SBSCardItem requiresPasscode](self, "requiresPasscode"), CFSTR("requiresPasscode"));
  -[SBSCardItem bundleName](self, "bundleName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("bundleName"));

  -[SBSCardItem userInfo](self, "userInfo");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("userInfo"));

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
  void *v11;
  void *v12;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SBSCardItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v5);

  -[SBSCardItem categoryIdentifier](self, "categoryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCategoryIdentifier:", v6);

  -[SBSCardItem iconData](self, "iconData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIconData:", v7);

  -[SBSCardItem title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v8);

  -[SBSCardItem subtitle](self, "subtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubtitle:", v9);

  -[SBSCardItem body](self, "body");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBody:", v10);

  objc_msgSend(v4, "setRequiresPasscode:", -[SBSCardItem requiresPasscode](self, "requiresPasscode"));
  -[SBSCardItem bundleName](self, "bundleName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBundleName:", v11);

  -[SBSCardItem userInfo](self, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInfo:", v12);

  return v4;
}

- (id)sortDate
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingTimeInterval:", 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  unint64_t v21;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSCardItem identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[SBSCardItem categoryIdentifier](self, "categoryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:", v6);

  -[SBSCardItem iconData](self, "iconData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:", v8);

  -[SBSCardItem title](self, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:", v10);

  -[SBSCardItem subtitle](self, "subtitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendObject:", v12);

  -[SBSCardItem body](self, "body");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v3, "appendObject:", v14);

  v16 = (id)objc_msgSend(v3, "appendBool:", -[SBSCardItem requiresPasscode](self, "requiresPasscode"));
  -[SBSCardItem bundleName](self, "bundleName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v3, "appendObject:", v17);

  -[SBSCardItem userInfo](self, "userInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v3, "appendObject:", v19);

  v21 = objc_msgSend(v3, "hash");
  return v21;
}

- (BOOL)isEqual:(id)a3
{
  SBSCardItem *v4;
  void *v5;
  SBSCardItem *v6;
  void *v7;
  uint64_t v8;
  SBSCardItem *v9;
  id v10;
  void *v11;
  SBSCardItem *v12;
  id v13;
  void *v14;
  SBSCardItem *v15;
  id v16;
  void *v17;
  SBSCardItem *v18;
  id v19;
  void *v20;
  SBSCardItem *v21;
  id v22;
  void *v23;
  SBSCardItem *v24;
  id v25;
  _BOOL8 v26;
  SBSCardItem *v27;
  id v28;
  void *v29;
  SBSCardItem *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  char v35;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  SBSCardItem *v42;
  _QWORD v43[4];
  SBSCardItem *v44;
  _QWORD v45[4];
  SBSCardItem *v46;
  _QWORD v47[4];
  SBSCardItem *v48;
  _QWORD v49[4];
  SBSCardItem *v50;
  _QWORD v51[4];
  SBSCardItem *v52;
  _QWORD v53[4];
  SBSCardItem *v54;

  v4 = (SBSCardItem *)a3;
  if (self == v4)
  {
    v35 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    -[SBSCardItem identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __23__SBSCardItem_isEqual___block_invoke;
    v53[3] = &unk_1E288EEB0;
    v9 = v6;
    v54 = v9;
    v10 = (id)objc_msgSend(v5, "appendString:counterpart:", v7, v53);

    -[SBSCardItem categoryIdentifier](self, "categoryIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v8;
    v51[1] = 3221225472;
    v51[2] = __23__SBSCardItem_isEqual___block_invoke_2;
    v51[3] = &unk_1E288EEB0;
    v12 = v9;
    v52 = v12;
    v13 = (id)objc_msgSend(v5, "appendString:counterpart:", v11, v51);

    -[SBSCardItem iconData](self, "iconData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v8;
    v49[1] = 3221225472;
    v49[2] = __23__SBSCardItem_isEqual___block_invoke_3;
    v49[3] = &unk_1E288F278;
    v15 = v12;
    v50 = v15;
    v16 = (id)objc_msgSend(v5, "appendObject:counterpart:", v14, v49);

    -[SBSCardItem title](self, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v8;
    v47[1] = 3221225472;
    v47[2] = __23__SBSCardItem_isEqual___block_invoke_4;
    v47[3] = &unk_1E288EEB0;
    v18 = v15;
    v48 = v18;
    v19 = (id)objc_msgSend(v5, "appendString:counterpart:", v17, v47);

    -[SBSCardItem subtitle](self, "subtitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v8;
    v45[1] = 3221225472;
    v45[2] = __23__SBSCardItem_isEqual___block_invoke_5;
    v45[3] = &unk_1E288EEB0;
    v21 = v18;
    v46 = v21;
    v22 = (id)objc_msgSend(v5, "appendString:counterpart:", v20, v45);

    -[SBSCardItem body](self, "body");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v8;
    v43[1] = 3221225472;
    v43[2] = __23__SBSCardItem_isEqual___block_invoke_6;
    v43[3] = &unk_1E288EEB0;
    v24 = v21;
    v44 = v24;
    v25 = (id)objc_msgSend(v5, "appendString:counterpart:", v23, v43);

    v26 = -[SBSCardItem requiresPasscode](self, "requiresPasscode");
    v41[0] = v8;
    v41[1] = 3221225472;
    v41[2] = __23__SBSCardItem_isEqual___block_invoke_7;
    v41[3] = &unk_1E288F2C8;
    v27 = v24;
    v42 = v27;
    v28 = (id)objc_msgSend(v5, "appendBool:counterpart:", v26, v41);
    -[SBSCardItem bundleName](self, "bundleName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v8;
    v39[1] = 3221225472;
    v39[2] = __23__SBSCardItem_isEqual___block_invoke_8;
    v39[3] = &unk_1E288EEB0;
    v30 = v27;
    v40 = v30;
    v31 = (id)objc_msgSend(v5, "appendString:counterpart:", v29, v39);

    -[SBSCardItem userInfo](self, "userInfo");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v8;
    v37[1] = 3221225472;
    v37[2] = __23__SBSCardItem_isEqual___block_invoke_9;
    v37[3] = &unk_1E288F748;
    v38 = v30;
    v33 = v30;
    v34 = (id)objc_msgSend(v5, "appendObject:counterpart:", v32, v37);

    v35 = objc_msgSend(v5, "isEqual");
  }

  return v35;
}

uint64_t __23__SBSCardItem_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "identifier");
}

uint64_t __23__SBSCardItem_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "categoryIdentifier");
}

uint64_t __23__SBSCardItem_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "iconData");
}

uint64_t __23__SBSCardItem_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "title");
}

uint64_t __23__SBSCardItem_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "subtitle");
}

uint64_t __23__SBSCardItem_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "body");
}

uint64_t __23__SBSCardItem_isEqual___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "requiresPasscode");
}

uint64_t __23__SBSCardItem_isEqual___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "bundleName");
}

uint64_t __23__SBSCardItem_isEqual___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "userInfo");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[SBSCardItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSCardItem categoryIdentifier](self, "categoryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSCardItem title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSCardItem body](self, "body");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBSCardItem requiresPasscode](self, "requiresPasscode");
  -[SBSCardItem bundleName](self, "bundleName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSCardItem userInfo](self, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p {identifier=%@ categoryIdentifier:=%@ title=%@ body=%@ requiresPasscode=%d bundleName=%@ userInfo=%@}>"), v4, self, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (void)setCategoryIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)iconData
{
  return self->_iconData;
}

- (void)setIconData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)requiresPasscode
{
  return self->_requiresPasscode;
}

- (void)setRequiresPasscode:(BOOL)a3
{
  self->_requiresPasscode = a3;
}

- (NSString)bundleName
{
  return self->_bundleName;
}

- (void)setBundleName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (UIImage)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_bundleName, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
