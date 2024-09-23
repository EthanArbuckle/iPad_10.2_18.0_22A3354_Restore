@implementation PKDiscoveryArticleLayout

- (PKDiscoveryArticleLayout)initWithDictionary:(id)a3
{
  id v4;
  PKDiscoveryArticleLayout *v5;
  PKDiscoveryCard *v6;
  PKDiscoveryCard *card;
  void *v8;
  PKMiniDiscoveryCard *v9;
  PKMiniDiscoveryCard *miniCard;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSArray *shelves;
  void *v22;
  PKDiscoveryCallToAction *v23;
  PKDiscoveryCallToAction *footerLockup;
  PKDiscoveryArticleLayout *v25;
  NSObject *v26;
  void *v28;
  uint8_t buf[16];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PKDiscoveryArticleLayout;
  v5 = -[PKDiscoveryArticleLayout init](&v34, sel_init);
  if (v5)
  {
    v5->_version = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("version"));
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("card"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PKDiscoveryCard initWithDictionary:]([PKDiscoveryCard alloc], "initWithDictionary:", v28);
    card = v5->_card;
    v5->_card = v6;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("miniCard"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PKMiniDiscoveryCard initWithDictionary:]([PKMiniDiscoveryCard alloc], "initWithDictionary:", v8);
    miniCard = v5->_miniCard;
    v5->_miniCard = v9;

    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("shelves"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v31;
      while (2)
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v31 != v16)
            objc_enumerationMutation(v13);
          +[PKDiscoveryShelf shelfWithDictionary:](PKDiscoveryShelf, "shelfWithDictionary:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v17));
          v18 = objc_claimAutoreleasedReturnValue();
          if (!v18)
          {
            PKLogFacilityTypeGetObject(0x10uLL);
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18FC92000, v26, OS_LOG_TYPE_DEFAULT, "Received malformed Discovery Article Layout Bundle: failed to initialize discovery shelf", buf, 2u);
            }

            v25 = 0;
            goto LABEL_15;
          }
          v19 = (void *)v18;
          objc_msgSend(v12, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (v15)
          continue;
        break;
      }
    }

    v20 = objc_msgSend(v12, "copy");
    shelves = v5->_shelves;
    v5->_shelves = (NSArray *)v20;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("footerLockup"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[PKDiscoveryCallToAction initWithDictionary:]([PKDiscoveryCallToAction alloc], "initWithDictionary:", v22);
    footerLockup = v5->_footerLockup;
    v5->_footerLockup = v23;

    v5->_priority = 500;
  }
  v25 = v5;
LABEL_15:

  return v25;
}

- (void)localizeWithBundle:(id)a3
{
  id v4;
  NSArray *shelves;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[PKDiscoveryCard localizeWithBundle:](self->_card, "localizeWithBundle:", v4);
  -[PKDiscoveryCard localizeWithBundle:](self->_miniCard, "localizeWithBundle:", v4);
  shelves = self->_shelves;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__PKDiscoveryArticleLayout_localizeWithBundle___block_invoke;
  v7[3] = &unk_1E2AC3AF8;
  v8 = v4;
  v6 = v4;
  -[NSArray enumerateObjectsUsingBlock:](shelves, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __47__PKDiscoveryArticleLayout_localizeWithBundle___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizeWithBundle:", *(_QWORD *)(a1 + 32));
}

- (void)localizeWithBundle:(id)a3 table:(id)a4
{
  id v6;
  id v7;
  NSArray *shelves;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[PKDiscoveryCard localizeWithBundle:table:](self->_card, "localizeWithBundle:table:", v6, v7);
  -[PKDiscoveryCard localizeWithBundle:table:](self->_miniCard, "localizeWithBundle:table:", v6, v7);
  shelves = self->_shelves;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__PKDiscoveryArticleLayout_localizeWithBundle_table___block_invoke;
  v11[3] = &unk_1E2AC3B20;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[NSArray enumerateObjectsUsingBlock:](shelves, "enumerateObjectsUsingBlock:", v11);

}

uint64_t __53__PKDiscoveryArticleLayout_localizeWithBundle_table___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizeWithBundle:table:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)setItem:(id)a3
{
  id v5;
  NSString *v6;
  NSString *itemIdentifier;
  char v8;
  PKDiscoveryCard *card;
  PKDiscoveryCallToAction *footerLockup;
  void *v11;

  v5 = a3;
  if (v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_item, a3);
    objc_msgSend(v11, "identifier");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    itemIdentifier = self->_itemIdentifier;
    self->_itemIdentifier = v6;

    if (objc_msgSend(v11, "viewCount"))
      v8 = 0;
    else
      v8 = objc_msgSend(v11, "shouldBadge");
    self->_requestedBadge = v8;
    self->_priority = objc_msgSend(v11, "priority");
    self->_entitledToForceLargeCard = objc_msgSend(v11, "entitledToForceLargeCard");
    self->_hitMaxLargeViewCount = objc_msgSend(v11, "hasHitMaxLargeViewCount");
    card = self->_card;
    if (card)
      -[PKDiscoveryCard setItem:](card, "setItem:", v11);
    footerLockup = self->_footerLockup;
    v5 = v11;
    if (footerLockup)
    {
      -[PKDiscoveryCallToAction setItem:](footerLockup, "setItem:", v11);
      v5 = v11;
    }
  }

}

- (BOOL)isEqualForUI:(id)a3
{
  _QWORD *v4;
  NSString *itemIdentifier;
  NSString *v6;
  PKDiscoveryCard *card;
  PKDiscoveryCard *v8;
  NSArray *shelves;
  NSArray *v10;
  PKDiscoveryCallToAction *footerLockup;
  PKDiscoveryCallToAction *v12;
  PKMiniDiscoveryCard *miniCard;
  PKMiniDiscoveryCard *v14;
  BOOL v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_29;
  itemIdentifier = self->_itemIdentifier;
  v6 = (NSString *)v4[2];
  if (itemIdentifier && v6)
  {
    if ((-[NSString isEqual:](itemIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_29;
  }
  else if (itemIdentifier != v6)
  {
    goto LABEL_29;
  }
  if (self->_version != v4[3]
    || self->_variant != v4[4]
    || self->_priority != v4[9]
    || self->_entitledToForceLargeCard != *((unsigned __int8 *)v4 + 8)
    || self->_hitMaxLargeViewCount != *((unsigned __int8 *)v4 + 9))
  {
    goto LABEL_29;
  }
  card = self->_card;
  v8 = (PKDiscoveryCard *)v4[5];
  if (card && v8)
  {
    if (!-[PKDiscoveryCard isEqual:](card, "isEqual:"))
      goto LABEL_29;
  }
  else if (card != v8)
  {
    goto LABEL_29;
  }
  shelves = self->_shelves;
  v10 = (NSArray *)v4[7];
  if (shelves && v10)
  {
    if ((-[NSArray isEqual:](shelves, "isEqual:") & 1) == 0)
      goto LABEL_29;
  }
  else if (shelves != v10)
  {
    goto LABEL_29;
  }
  footerLockup = self->_footerLockup;
  v12 = (PKDiscoveryCallToAction *)v4[8];
  if (!footerLockup || !v12)
  {
    if (footerLockup == v12)
      goto LABEL_25;
LABEL_29:
    v15 = 0;
    goto LABEL_30;
  }
  if (!-[PKDiscoveryCallToAction isEqual:](footerLockup, "isEqual:"))
    goto LABEL_29;
LABEL_25:
  miniCard = self->_miniCard;
  v14 = (PKMiniDiscoveryCard *)v4[6];
  if (miniCard && v14)
    v15 = -[PKMiniDiscoveryCard isEqual:](miniCard, "isEqual:");
  else
    v15 = miniCard == v14;
LABEL_30:

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  BOOL v5;

  v4 = a3;
  if (-[PKDiscoveryArticleLayout isEqualForUI:](self, "isEqualForUI:", v4))
    v5 = self->_requestedBadge ^ (v4[10] == 0);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  unint64_t v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_itemIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_card);
  objc_msgSend(v3, "safelyAddObject:", self->_shelves);
  objc_msgSend(v3, "safelyAddObject:", self->_footerLockup);
  objc_msgSend(v3, "safelyAddObject:", self->_miniCard);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_version - v4 + 32 * v4;
  v6 = self->_variant - v5 + 32 * v5;
  v7 = self->_requestedBadge - v6 + 32 * v6;
  v8 = self->_priority - v7 + 32 * v7;
  v9 = self->_entitledToForceLargeCard - v8 + 32 * v8;
  v10 = self->_hitMaxLargeViewCount - v9 + 32 * v9;

  return v10;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("identifier"), self->_itemIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%ld'; "), CFSTR("version"), self->_version);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%ld'; "), CFSTR("variant"), self->_variant);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("card"), self->_card);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("shelves"), self->_shelves);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("footerLockup"), self->_footerLockup);
  if (self->_requestedBadge)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("requestedBadge"), v4);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%ld'; "), CFSTR("priority"), self->_priority);
  if (self->_entitledToForceLargeCard)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("entitledToForceLargeCard"), v5);
  if (self->_hitMaxLargeViewCount)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("hitMaxLargeViewCount"), v6);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("miniCard"), self->_miniCard);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *itemIdentifier;
  id v5;

  itemIdentifier = self->_itemIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", itemIdentifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_item, CFSTR("item"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_version, CFSTR("version"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_variant, CFSTR("variant"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_card, CFSTR("card"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shelves, CFSTR("shelves"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_footerLockup, CFSTR("footerLockup"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_requestedBadge, CFSTR("requestedBadge"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_priority, CFSTR("priority"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_entitledToForceLargeCard, CFSTR("entitledToForceLargeCard"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hitMaxLargeViewCount, CFSTR("hitMaxLargeViewCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_miniCard, CFSTR("miniCard"));

}

- (PKDiscoveryArticleLayout)initWithCoder:(id)a3
{
  id v4;
  PKDiscoveryArticleLayout *v5;
  uint64_t v6;
  NSString *itemIdentifier;
  uint64_t v8;
  PKDiscoveryItem *item;
  uint64_t v10;
  PKDiscoveryCard *card;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *shelves;
  uint64_t v17;
  PKDiscoveryCallToAction *footerLockup;
  uint64_t v19;
  PKMiniDiscoveryCard *miniCard;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKDiscoveryArticleLayout;
  v5 = -[PKDiscoveryArticleLayout init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("item"));
    v8 = objc_claimAutoreleasedReturnValue();
    item = v5->_item;
    v5->_item = (PKDiscoveryItem *)v8;

    v5->_version = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
    v5->_variant = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("variant"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("card"));
    v10 = objc_claimAutoreleasedReturnValue();
    card = v5->_card;
    v5->_card = (PKDiscoveryCard *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("shelves"));
    v15 = objc_claimAutoreleasedReturnValue();
    shelves = v5->_shelves;
    v5->_shelves = (NSArray *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("footerLockup"));
    v17 = objc_claimAutoreleasedReturnValue();
    footerLockup = v5->_footerLockup;
    v5->_footerLockup = (PKDiscoveryCallToAction *)v17;

    v5->_requestedBadge = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requestedBadge"));
    v5->_priority = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("priority"));
    v5->_entitledToForceLargeCard = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("entitledToForceLargeCard"));
    v5->_hitMaxLargeViewCount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hitMaxLargeViewCount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("miniCard"));
    v19 = objc_claimAutoreleasedReturnValue();
    miniCard = v5->_miniCard;
    v5->_miniCard = (PKMiniDiscoveryCard *)v19;

  }
  return v5;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_itemIdentifier, a3);
}

- (BOOL)entitledToForceLargeCard
{
  return self->_entitledToForceLargeCard;
}

- (BOOL)hasHitMaxLargeViewCount
{
  return self->_hitMaxLargeViewCount;
}

- (int64_t)version
{
  return self->_version;
}

- (int64_t)variant
{
  return self->_variant;
}

- (PKDiscoveryCard)card
{
  return self->_card;
}

- (PKMiniDiscoveryCard)miniCard
{
  return self->_miniCard;
}

- (NSArray)shelves
{
  return self->_shelves;
}

- (PKDiscoveryCallToAction)footerLockup
{
  return self->_footerLockup;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (id)actionOnDismiss
{
  return self->_actionOnDismiss;
}

- (void)setActionOnDismiss:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)hasRequestedBadge
{
  return self->_requestedBadge;
}

- (PKDiscoveryItem)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong(&self->_actionOnDismiss, 0);
  objc_storeStrong((id *)&self->_footerLockup, 0);
  objc_storeStrong((id *)&self->_shelves, 0);
  objc_storeStrong((id *)&self->_miniCard, 0);
  objc_storeStrong((id *)&self->_card, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end
