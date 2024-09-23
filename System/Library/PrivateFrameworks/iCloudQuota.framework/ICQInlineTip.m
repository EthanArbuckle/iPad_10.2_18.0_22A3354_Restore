@implementation ICQInlineTip

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("id: %@ anchor: %@, title: %@, subtitle: %@ actions: %@, criteria: %@, arrowConfiguration:%@ icon: %@ dismissURL:%@, displayURL: %@"), self->_id, self->_anchor, self->_title, self->_subTitle, self->_actions, self->_criteria, self->_arrowConfiguration, self->_icon, self->_dismissURL, self->_displayURL);
}

+ (NSArray)upwardArrowConfigurationStrings
{
  if (upwardArrowConfigurationStrings_onceToken != -1)
    dispatch_once(&upwardArrowConfigurationStrings_onceToken, &__block_literal_global_6);
  return (NSArray *)(id)upwardArrowConfigurationStrings_strings;
}

void __47__ICQInlineTip_upwardArrowConfigurationStrings__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("TOP");
  v2[1] = CFSTR("TOPLEFT");
  v2[2] = CFSTR("TOPRIGHT");
  v2[3] = CFSTR("NONE");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)upwardArrowConfigurationStrings_strings;
  upwardArrowConfigurationStrings_strings = v0;

}

+ (NSArray)downwardArrowConfigurationStrings
{
  if (downwardArrowConfigurationStrings_onceToken != -1)
    dispatch_once(&downwardArrowConfigurationStrings_onceToken, &__block_literal_global_178);
  return (NSArray *)(id)downwardArrowConfigurationStrings_strings;
}

void __49__ICQInlineTip_downwardArrowConfigurationStrings__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("BOTTOM");
  v2[1] = CFSTR("BOTTOMLEFT");
  v2[2] = CFSTR("BOTTOMRIGHT");
  v2[3] = CFSTR("NONE");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)downwardArrowConfigurationStrings_strings;
  downwardArrowConfigurationStrings_strings = v0;

}

- (id)copyWithZone:(_NSZone *)a3
{
  ICQInlineTip *v4;

  v4 = objc_alloc_init(ICQInlineTip);
  -[ICQInlineTip setId:](v4, "setId:", self->_id);
  -[ICQInlineTip setAnchor:](v4, "setAnchor:", self->_anchor);
  -[ICQInlineTip setTitle:](v4, "setTitle:", self->_title);
  -[ICQInlineTip setSubTitle:](v4, "setSubTitle:", self->_subTitle);
  -[ICQInlineTip setActions:](v4, "setActions:", self->_actions);
  -[ICQInlineTip setCriteria:](v4, "setCriteria:", self->_criteria);
  -[ICQInlineTip setIcon:](v4, "setIcon:", self->_icon);
  -[ICQInlineTip setArrowConfiguration:](v4, "setArrowConfiguration:", self->_arrowConfiguration);
  -[ICQInlineTip setDismissURL:](v4, "setDismissURL:", self->_dismissURL);
  -[ICQInlineTip setDisplayURL:](v4, "setDisplayURL:", self->_displayURL);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *id;
  id v5;

  id = self->_id;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", id, CFSTR("id"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_anchor, CFSTR("anchor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subTitle, CFSTR("subTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actions, CFSTR("actions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_criteria, CFSTR("criteria"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_arrowConfiguration, CFSTR("arrowConfiguration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_icon, CFSTR("icon"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dismissURL, CFSTR("dismissURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayURL, CFSTR("displayURL"));

}

- (ICQInlineTip)initWithCoder:(id)a3
{
  id v4;
  ICQInlineTip *v5;
  uint64_t v6;
  NSString *id;
  uint64_t v8;
  NSString *anchor;
  uint64_t v10;
  NSString *title;
  uint64_t v12;
  NSString *subTitle;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSArray *actions;
  uint64_t v19;
  ICQTipCriteria *criteria;
  uint64_t v21;
  NSString *arrowConfiguration;
  uint64_t v23;
  ICQTipIcon *icon;
  uint64_t v25;
  NSURL *dismissURL;
  uint64_t v27;
  NSURL *displayURL;
  objc_super v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)ICQInlineTip;
  v5 = -[ICQInlineTip init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("id"));
    v6 = objc_claimAutoreleasedReturnValue();
    id = v5->_id;
    v5->_id = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("anchor"));
    v8 = objc_claimAutoreleasedReturnValue();
    anchor = v5->_anchor;
    v5->_anchor = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v10 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subTitle"));
    v12 = objc_claimAutoreleasedReturnValue();
    subTitle = v5->_subTitle;
    v5->_subTitle = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("actions"));
    v17 = objc_claimAutoreleasedReturnValue();
    actions = v5->_actions;
    v5->_actions = (NSArray *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("criteria"));
    v19 = objc_claimAutoreleasedReturnValue();
    criteria = v5->_criteria;
    v5->_criteria = (ICQTipCriteria *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("arrowConfiguration"));
    v21 = objc_claimAutoreleasedReturnValue();
    arrowConfiguration = v5->_arrowConfiguration;
    v5->_arrowConfiguration = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icon"));
    v23 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (ICQTipIcon *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dismissURL"));
    v25 = objc_claimAutoreleasedReturnValue();
    dismissURL = v5->_dismissURL;
    v5->_dismissURL = (NSURL *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayURL"));
    v27 = objc_claimAutoreleasedReturnValue();
    displayURL = v5->_displayURL;
    v5->_displayURL = (NSURL *)v27;

  }
  return v5;
}

- (NSString)id
{
  return self->_id;
}

- (void)setId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)subTitle
{
  return self->_subTitle;
}

- (void)setSubTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (ICQTipIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (ICQTipCriteria)criteria
{
  return self->_criteria;
}

- (void)setCriteria:(id)a3
{
  objc_storeStrong((id *)&self->_criteria, a3);
}

- (NSString)arrowConfiguration
{
  return self->_arrowConfiguration;
}

- (void)setArrowConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSURL)dismissURL
{
  return self->_dismissURL;
}

- (void)setDismissURL:(id)a3
{
  objc_storeStrong((id *)&self->_dismissURL, a3);
}

- (NSURL)displayURL
{
  return self->_displayURL;
}

- (void)setDisplayURL:(id)a3
{
  objc_storeStrong((id *)&self->_displayURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayURL, 0);
  objc_storeStrong((id *)&self->_dismissURL, 0);
  objc_storeStrong((id *)&self->_arrowConfiguration, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

@end
