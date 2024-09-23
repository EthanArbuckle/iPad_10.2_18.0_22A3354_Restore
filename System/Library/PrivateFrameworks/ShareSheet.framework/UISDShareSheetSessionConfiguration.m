@implementation UISDShareSheetSessionConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UISDShareSheetSessionConfiguration)initWithCoder:(id)a3
{
  id v4;
  UISDShareSheetSessionConfiguration *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *peopleProxies;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *shareProxies;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSArray *actionProxies;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSNumber *nearbyCountSlotID;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSNumber *nearbyCountBadge;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSArray *peopleSuggestions;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSArray *restrictedActivityTypes;
  void *v46;

  v4 = a3;
  v5 = -[UISDShareSheetSessionConfiguration init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_peopleProxies);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    peopleProxies = v5->_peopleProxies;
    v5->_peopleProxies = (NSArray *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_shareProxies);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    shareProxies = v5->_shareProxies;
    v5->_shareProxies = (NSArray *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_actionProxies);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    actionProxies = v5->_actionProxies;
    v5->_actionProxies = (NSArray *)v22;

    v24 = objc_opt_class();
    NSStringFromSelector(sel_nearbyCountSlotID);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    nearbyCountSlotID = v5->_nearbyCountSlotID;
    v5->_nearbyCountSlotID = (NSNumber *)v26;

    v28 = objc_opt_class();
    NSStringFromSelector(sel_nearbyCountBadge);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v28, v29);
    v30 = objc_claimAutoreleasedReturnValue();
    nearbyCountBadge = v5->_nearbyCountBadge;
    v5->_nearbyCountBadge = (NSNumber *)v30;

    NSStringFromSelector(sel_wantsAnimation);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_wantsAnimation = objc_msgSend(v4, "decodeBoolForKey:", v32);

    NSStringFromSelector(sel_reloadData);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_reloadData = objc_msgSend(v4, "decodeBoolForKey:", v33);

    v34 = (void *)MEMORY[0x1E0C99E60];
    v35 = objc_opt_class();
    objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_peopleSuggestions);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, v37);
    v38 = objc_claimAutoreleasedReturnValue();
    peopleSuggestions = v5->_peopleSuggestions;
    v5->_peopleSuggestions = (NSArray *)v38;

    v40 = (void *)MEMORY[0x1E0C99E60];
    v41 = objc_opt_class();
    objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_restrictedActivityTypes);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v42, v43);
    v44 = objc_claimAutoreleasedReturnValue();
    restrictedActivityTypes = v5->_restrictedActivityTypes;
    v5->_restrictedActivityTypes = (NSArray *)v44;

    NSStringFromSelector(sel_shouldBlockPresentation);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldBlockPresentation = objc_msgSend(v4, "decodeBoolForKey:", v46);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *peopleProxies;
  id v5;
  void *v6;
  NSArray *shareProxies;
  void *v8;
  NSArray *actionProxies;
  void *v10;
  NSNumber *nearbyCountSlotID;
  void *v12;
  NSNumber *nearbyCountBadge;
  void *v14;
  _BOOL8 wantsAnimation;
  void *v16;
  _BOOL8 reloadData;
  void *v18;
  NSArray *peopleSuggestions;
  void *v20;
  NSArray *restrictedActivityTypes;
  void *v22;
  _BOOL8 shouldBlockPresentation;
  id v24;

  peopleProxies = self->_peopleProxies;
  v5 = a3;
  NSStringFromSelector(sel_peopleProxies);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", peopleProxies, v6);

  shareProxies = self->_shareProxies;
  NSStringFromSelector(sel_shareProxies);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", shareProxies, v8);

  actionProxies = self->_actionProxies;
  NSStringFromSelector(sel_actionProxies);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", actionProxies, v10);

  nearbyCountSlotID = self->_nearbyCountSlotID;
  NSStringFromSelector(sel_nearbyCountSlotID);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", nearbyCountSlotID, v12);

  nearbyCountBadge = self->_nearbyCountBadge;
  NSStringFromSelector(sel_nearbyCountBadge);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", nearbyCountBadge, v14);

  wantsAnimation = self->_wantsAnimation;
  NSStringFromSelector(sel_wantsAnimation);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", wantsAnimation, v16);

  reloadData = self->_reloadData;
  NSStringFromSelector(sel_reloadData);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", reloadData, v18);

  peopleSuggestions = self->_peopleSuggestions;
  NSStringFromSelector(sel_peopleSuggestions);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", peopleSuggestions, v20);

  restrictedActivityTypes = self->_restrictedActivityTypes;
  NSStringFromSelector(sel_restrictedActivityTypes);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", restrictedActivityTypes, v22);

  shouldBlockPresentation = self->_shouldBlockPresentation;
  NSStringFromSelector(sel_shouldBlockPresentation);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", shouldBlockPresentation, v24);

}

- (NSNumber)nearbyCountSlotID
{
  return self->_nearbyCountSlotID;
}

- (void)setNearbyCountSlotID:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyCountSlotID, a3);
}

- (NSNumber)nearbyCountBadge
{
  return self->_nearbyCountBadge;
}

- (void)setNearbyCountBadge:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyCountBadge, a3);
}

- (NSArray)peopleProxies
{
  return self->_peopleProxies;
}

- (void)setPeopleProxies:(id)a3
{
  objc_storeStrong((id *)&self->_peopleProxies, a3);
}

- (NSArray)shareProxies
{
  return self->_shareProxies;
}

- (void)setShareProxies:(id)a3
{
  objc_storeStrong((id *)&self->_shareProxies, a3);
}

- (NSArray)actionProxies
{
  return self->_actionProxies;
}

- (void)setActionProxies:(id)a3
{
  objc_storeStrong((id *)&self->_actionProxies, a3);
}

- (BOOL)wantsAnimation
{
  return self->_wantsAnimation;
}

- (void)setWantsAnimation:(BOOL)a3
{
  self->_wantsAnimation = a3;
}

- (BOOL)reloadData
{
  return self->_reloadData;
}

- (void)setReloadData:(BOOL)a3
{
  self->_reloadData = a3;
}

- (NSArray)peopleSuggestions
{
  return self->_peopleSuggestions;
}

- (void)setPeopleSuggestions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)restrictedActivityTypes
{
  return self->_restrictedActivityTypes;
}

- (void)setRestrictedActivityTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)shouldBlockPresentation
{
  return self->_shouldBlockPresentation;
}

- (void)setShouldBlockPresentation:(BOOL)a3
{
  self->_shouldBlockPresentation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictedActivityTypes, 0);
  objc_storeStrong((id *)&self->_peopleSuggestions, 0);
  objc_storeStrong((id *)&self->_actionProxies, 0);
  objc_storeStrong((id *)&self->_shareProxies, 0);
  objc_storeStrong((id *)&self->_peopleProxies, 0);
  objc_storeStrong((id *)&self->_nearbyCountBadge, 0);
  objc_storeStrong((id *)&self->_nearbyCountSlotID, 0);
}

@end
