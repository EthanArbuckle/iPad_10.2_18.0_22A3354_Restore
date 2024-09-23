@implementation UISDShareSheetSessionConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UISDShareSheetSessionConfiguration)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  UISDShareSheetSessionConfiguration *v6;
  uint64_t v7;
  uint64_t v8;
  NSSet *v9;
  void *v10;
  NSString *v11;
  void *v12;
  uint64_t v13;
  NSArray *peopleProxies;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSSet *v18;
  void *v19;
  NSString *v20;
  void *v21;
  uint64_t v22;
  NSArray *shareProxies;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSSet *v27;
  void *v28;
  NSString *v29;
  void *v30;
  uint64_t v31;
  NSArray *actionProxies;
  uint64_t v33;
  uint64_t v34;
  NSString *v35;
  void *v36;
  uint64_t v37;
  NSNumber *nearbyCountSlotID;
  uint64_t v39;
  uint64_t v40;
  NSString *v41;
  void *v42;
  uint64_t v43;
  NSNumber *nearbyCountBadge;
  NSString *v45;
  void *v46;
  NSString *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSSet *v52;
  void *v53;
  NSString *v54;
  void *v55;
  uint64_t v56;
  NSArray *peopleSuggestions;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSSet *v61;
  void *v62;
  NSString *v63;
  void *v64;
  uint64_t v65;
  NSArray *restrictedActivityTypes;
  NSString *v67;
  void *v68;

  v4 = a3;
  v6 = -[UISDShareSheetSessionConfiguration init](self, "init");
  if (v6)
  {
    v7 = objc_opt_class(NSArray, v5);
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, objc_opt_class(UIAirDropNode, v8), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = NSStringFromSelector("peopleProxies");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, v12));
    peopleProxies = v6->_peopleProxies;
    v6->_peopleProxies = (NSArray *)v13;

    v16 = objc_opt_class(NSArray, v15);
    v18 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v16, objc_opt_class(_UIHostActivityProxy, v17), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = NSStringFromSelector("shareProxies");
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, v21));
    shareProxies = v6->_shareProxies;
    v6->_shareProxies = (NSArray *)v22;

    v25 = objc_opt_class(NSArray, v24);
    v27 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v25, objc_opt_class(_UIHostActivityProxy, v26), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v29 = NSStringFromSelector("actionProxies");
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, v30));
    actionProxies = v6->_actionProxies;
    v6->_actionProxies = (NSArray *)v31;

    v34 = objc_opt_class(NSNumber, v33);
    v35 = NSStringFromSelector("nearbyCountSlotID");
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v34, v36));
    nearbyCountSlotID = v6->_nearbyCountSlotID;
    v6->_nearbyCountSlotID = (NSNumber *)v37;

    v40 = objc_opt_class(NSNumber, v39);
    v41 = NSStringFromSelector("nearbyCountBadge");
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v40, v42));
    nearbyCountBadge = v6->_nearbyCountBadge;
    v6->_nearbyCountBadge = (NSNumber *)v43;

    v45 = NSStringFromSelector("wantsAnimation");
    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
    v6->_wantsAnimation = objc_msgSend(v4, "decodeBoolForKey:", v46);

    v47 = NSStringFromSelector("reloadData");
    v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
    v6->_reloadData = objc_msgSend(v4, "decodeBoolForKey:", v48);

    v50 = objc_opt_class(NSArray, v49);
    v52 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v50, objc_opt_class(SFPeopleSuggestion, v51), 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
    v54 = NSStringFromSelector("peopleSuggestions");
    v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
    v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v53, v55));
    peopleSuggestions = v6->_peopleSuggestions;
    v6->_peopleSuggestions = (NSArray *)v56;

    v59 = objc_opt_class(NSArray, v58);
    v61 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v59, objc_opt_class(NSString, v60), 0);
    v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
    v63 = NSStringFromSelector("restrictedActivityTypes");
    v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
    v65 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v62, v64));
    restrictedActivityTypes = v6->_restrictedActivityTypes;
    v6->_restrictedActivityTypes = (NSArray *)v65;

    v67 = NSStringFromSelector("shouldBlockPresentation");
    v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
    v6->_shouldBlockPresentation = objc_msgSend(v4, "decodeBoolForKey:", v68);

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *peopleProxies;
  id v5;
  NSString *v6;
  void *v7;
  NSArray *shareProxies;
  NSString *v9;
  void *v10;
  NSArray *actionProxies;
  NSString *v12;
  void *v13;
  NSNumber *nearbyCountSlotID;
  NSString *v15;
  void *v16;
  NSNumber *nearbyCountBadge;
  NSString *v18;
  void *v19;
  _BOOL8 wantsAnimation;
  NSString *v21;
  void *v22;
  _BOOL8 reloadData;
  NSString *v24;
  void *v25;
  NSArray *peopleSuggestions;
  NSString *v27;
  void *v28;
  NSArray *restrictedActivityTypes;
  NSString *v30;
  void *v31;
  _BOOL8 shouldBlockPresentation;
  NSString *v33;
  id v34;

  peopleProxies = self->_peopleProxies;
  v5 = a3;
  v6 = NSStringFromSelector("peopleProxies");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "encodeObject:forKey:", peopleProxies, v7);

  shareProxies = self->_shareProxies;
  v9 = NSStringFromSelector("shareProxies");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v5, "encodeObject:forKey:", shareProxies, v10);

  actionProxies = self->_actionProxies;
  v12 = NSStringFromSelector("actionProxies");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v5, "encodeObject:forKey:", actionProxies, v13);

  nearbyCountSlotID = self->_nearbyCountSlotID;
  v15 = NSStringFromSelector("nearbyCountSlotID");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  objc_msgSend(v5, "encodeObject:forKey:", nearbyCountSlotID, v16);

  nearbyCountBadge = self->_nearbyCountBadge;
  v18 = NSStringFromSelector("nearbyCountBadge");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  objc_msgSend(v5, "encodeObject:forKey:", nearbyCountBadge, v19);

  wantsAnimation = self->_wantsAnimation;
  v21 = NSStringFromSelector("wantsAnimation");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  objc_msgSend(v5, "encodeBool:forKey:", wantsAnimation, v22);

  reloadData = self->_reloadData;
  v24 = NSStringFromSelector("reloadData");
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  objc_msgSend(v5, "encodeBool:forKey:", reloadData, v25);

  peopleSuggestions = self->_peopleSuggestions;
  v27 = NSStringFromSelector("peopleSuggestions");
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  objc_msgSend(v5, "encodeObject:forKey:", peopleSuggestions, v28);

  restrictedActivityTypes = self->_restrictedActivityTypes;
  v30 = NSStringFromSelector("restrictedActivityTypes");
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  objc_msgSend(v5, "encodeObject:forKey:", restrictedActivityTypes, v31);

  shouldBlockPresentation = self->_shouldBlockPresentation;
  v33 = NSStringFromSelector("shouldBlockPresentation");
  v34 = (id)objc_claimAutoreleasedReturnValue(v33);
  objc_msgSend(v5, "encodeBool:forKey:", shouldBlockPresentation, v34);

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
