@implementation PKPaymentPreferenceContact

- (PKPaymentPreferenceContact)initWithTitle:(id)a3 preferences:(id)a4 selectedIndex:(unint64_t)a5 readOnly:(BOOL)a6
{
  PKPaymentPreferenceContact *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPaymentPreferenceContact;
  v6 = -[PKPaymentPreference initWithTitle:preferences:selectedIndex:readOnly:](&v9, sel_initWithTitle_preferences_selectedIndex_readOnly_, a3, a4, a5, a6);
  if (v6)
  {
    +[PKPaymentOptionsRecents defaultInstance](PKPaymentOptionsRecents, "defaultInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPreferenceContact setPaymentOptionsRecents:](v6, "setPaymentOptionsRecents:", v7);

  }
  return v6;
}

- (void)setContactKey:(id)a3
{
  id v4;
  NSOrderedSet *contactKeys;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSOrderedSet *v11;
  NSOrderedSet *v12;
  void *v13;
  NSOrderedSet *v14;
  id v15;

  v4 = a3;
  contactKeys = self->_contactKeys;
  v15 = v4;
  if (!contactKeys)
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObject:", v4);
    v12 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
    v10 = self->_contactKeys;
    self->_contactKeys = v12;
LABEL_8:

    goto LABEL_9;
  }
  v6 = -[NSOrderedSet indexOfObject:](contactKeys, "indexOfObject:", v4);
  if (v6)
  {
    v7 = v6;
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSOrderedSet array](self->_contactKeys, "array");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v10);
      v11 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = (void *)-[NSOrderedSet mutableCopy](self->_contactKeys, "mutableCopy");
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "moveObjectsAtIndexes:toIndex:", v13, 0);

      v11 = (NSOrderedSet *)objc_msgSend(v10, "copy");
    }
    v14 = self->_contactKeys;
    self->_contactKeys = v11;

    goto LABEL_8;
  }
LABEL_9:

}

- (NSString)contactKey
{
  return (NSString *)-[NSOrderedSet firstObject](self->_contactKeys, "firstObject");
}

- (id)_removeDuplicateContacts:(id)a3
{
  id v3;
  void *v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id obj;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  _QWORD v38[6];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v3;
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v37)
  {
    v34 = *MEMORY[0x1E0C967C0];
    v35 = *(_QWORD *)v40;
    v31 = *MEMORY[0x1E0C967F0];
    v32 = *MEMORY[0x1E0C966A8];
    v29 = *MEMORY[0x1E0C966D0];
    v30 = *MEMORY[0x1E0C966C0];
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v40 != v35)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __55__PKPaymentPreferenceContact__removeDuplicateContacts___block_invoke;
        v38[3] = &unk_1E2AC3380;
        v38[4] = self;
        v38[5] = v6;
        v7 = objc_msgSend(v4, "indexOfObjectPassingTest:", v38);
        -[PKPaymentPreferenceContact contactKeys](self, "contactKeys");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v8, "count"))
          goto LABEL_18;
        if (!objc_msgSend(v8, "containsObject:", v34))
          goto LABEL_31;
        objc_msgSend(v6, "phoneNumbers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "value");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "length");

        if (v13)
        {
LABEL_31:
          if (!objc_msgSend(v8, "containsObject:", v32))
            goto LABEL_32;
          objc_msgSend(v6, "emailAddresses");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "firstObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "value");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "length");

          if (v17)
          {
LABEL_32:
            if (!objc_msgSend(v8, "containsObject:", v31))
              goto LABEL_33;
            objc_msgSend(v6, "postalAddresses");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "firstObject");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "value");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
LABEL_33:
              if ((objc_msgSend(v8, "containsObject:", v30) & 1) != 0
                || objc_msgSend(v8, "containsObject:", v29))
              {
                objc_msgSend(v6, "familyName");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v21, "length"))
                {

                }
                else
                {
                  objc_msgSend(v6, "givenName");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v23 = objc_msgSend(v22, "length");

                  if (!v23)
                    goto LABEL_26;
                }
              }
LABEL_18:
              if (v7 == 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(v4, "addObject:", v6);
                goto LABEL_26;
              }
              objc_msgSend(v4, "objectAtIndex:", v7);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v24, "contactSource") == 3)
              {
                objc_msgSend(v4, "removeObjectAtIndex:", v7);
                objc_msgSend(v4, "addObject:", v6);
                +[PKPaymentOptionsRecents defaultInstance](PKPaymentOptionsRecents, "defaultInstance");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "recentContact");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "deleteRecent:", v26);

                goto LABEL_24;
              }
              if (objc_msgSend(v6, "contactSource") == 3)
              {
                objc_msgSend(v6, "recentContact");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "setRecentContact:", v25);
LABEL_24:

              }
            }
          }
        }
LABEL_26:

      }
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v37);
  }

  v27 = (void *)objc_msgSend(v4, "copy");
  return v27;
}

uint64_t __55__PKPaymentPreferenceContact__removeDuplicateContacts___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "preferenceObject:representsContact:", a2, *(_QWORD *)(a1 + 40));
}

- (BOOL)supportsDeletion
{
  return 1;
}

- (void)mergeRecentsAndMeCard
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (!-[PKPaymentPreference isReadOnly](self, "isReadOnly"))
  {
    -[PKPaymentPreference preferences](self, "preferences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v3, "mutableCopy");

    -[PKPaymentPreferenceContact paymentOptionsRecents](self, "paymentOptionsRecents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recentsForPreference:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v5);

    -[PKPaymentPreferenceContact paymentOptionsRecents](self, "paymentOptionsRecents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "meCardEntriesForPreference:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v7);

    -[PKPaymentPreferenceContact _mergeContacts:](self, "_mergeContacts:", v8);
  }
}

- (void)_mergeContacts:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[PKPaymentPreference isReadOnly](self, "isReadOnly"))
  {
    -[PKPaymentPreference preferences](self, "preferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    objc_msgSend(v5, "addObjectsFromArray:", v7);
    objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_24);
    -[PKPaymentPreferenceContact _removeDuplicateContacts:](self, "_removeDuplicateContacts:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentPreference setPreferences:](self, "setPreferences:", v6);
    -[PKPaymentPreferenceContact _updateSelectedIndex](self, "_updateSelectedIndex");

  }
}

uint64_t __45__PKPaymentPreferenceContact__mergeContacts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  int v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "recentFromContactInformation");
  v6 = objc_msgSend(v4, "recentFromContactInformation");

  if (v5)
    return v5 & (v6 ^ 1);
  else
    return v6 << 63 >> 63;
}

- (void)_updateSelectedIndex
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;

  -[PKPaymentPreference preferences](self, "preferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (!v4)
    goto LABEL_5;
  if (-[PKPaymentPreference selectedIndex](self, "selectedIndex") == 0x7FFFFFFFFFFFFFFFLL
    || (v6 = -[PKPaymentPreference selectedIndex](self, "selectedIndex"),
        -[PKPaymentPreference preferences](self, "preferences"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v6 >= v8))
  {
    v5 = 0;
LABEL_5:
    -[PKPaymentPreference setSelectedIndex:](self, "setSelectedIndex:", v5);
  }
}

- (int64_t)indexOfContact:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[PKPaymentPreference preferences](self, "preferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__PKPaymentPreferenceContact_indexOfContact___block_invoke;
  v9[3] = &unk_1E2AC3380;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v9);

  return v7;
}

uint64_t __45__PKPaymentPreferenceContact_indexOfContact___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "preferenceObject:representsContact:", a2, *(_QWORD *)(a1 + 40));
}

- (void)setErrors:(id)a3 forPreference:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  -[PKPaymentPreference errors](self, "errors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__PKPaymentPreferenceContact_setErrors_forPreference___block_invoke;
  v15[3] = &unk_1E2AC3358;
  v14 = v6;
  v16 = v14;
  objc_msgSend(v8, "keysOfEntriesPassingTest:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "anyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentPreference errors](self, "errors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
    v13 = v10;
  else
    v13 = v14;
  objc_msgSend(v11, "setObject:forKey:", v7, v13);

}

uint64_t __54__PKPaymentPreferenceContact_setErrors_forPreference___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEqualIgnoringIdentifiers:", a2);
}

- (id)errorsForPreference:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[PKPaymentPreference errors](self, "errors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__PKPaymentPreferenceContact_errorsForPreference___block_invoke;
  v12[3] = &unk_1E2AC3358;
  v13 = v4;
  v6 = v4;
  objc_msgSend(v5, "keysOfEntriesPassingTest:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PKPaymentPreference errors](self, "errors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __50__PKPaymentPreferenceContact_errorsForPreference___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEqualIgnoringIdentifiers:", a2);
}

- (BOOL)preferenceObject:(id)a3 representsContact:(id)a4
{
  id v6;
  id v7;
  NSOrderedSet *contactKeys;
  id v9;
  void *v10;
  char v11;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    contactKeys = self->_contactKeys;
    v9 = v6;
    -[NSOrderedSet array](contactKeys, "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "representsContact:forContactKeys:", v7, v10);

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (void)setPaymentOptionsRecents:(id)a3
{
  objc_setAssociatedObject(self, sel_paymentOptionsRecents, a3, (void *)1);
}

- (PKPaymentOptionsRecents)paymentOptionsRecents
{
  return (PKPaymentOptionsRecents *)objc_getAssociatedObject(self, sel_paymentOptionsRecents);
}

- (void)addHideMyEmailPreference:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v3 = a3;
  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C97360]);
  v6 = (void *)MEMORY[0x1E0C97338];
  v7 = *MEMORY[0x1E0C96FF8];
  PKLocalizedHideMyEmailString(CFSTR("HME_SETTINGS_ROW_TITLE"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "labeledValueWithLabel:value:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEmailAddresses:", v10);

  objc_msgSend(v5, "setIsHideMyEmail:", 1);
  -[PKPaymentPreference preferences](self, "preferences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayByAddingObject:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPreference setPreferences:](self, "setPreferences:", v12);

  if (v3)
  {
    -[PKPaymentPreference preferences](self, "preferences");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPreference setSelectedIndex:](self, "setSelectedIndex:", objc_msgSend(v13, "count") - 1);

  }
}

- (NSOrderedSet)contactKeys
{
  return self->_contactKeys;
}

- (void)setContactKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)addNewTitle
{
  return self->_addNewTitle;
}

- (void)setAddNewTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)addExistingTitle
{
  return self->_addExistingTitle;
}

- (void)setAddExistingTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)editExistingTitle
{
  return self->_editExistingTitle;
}

- (void)setEditExistingTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)showPhoneticName
{
  return self->_showPhoneticName;
}

- (void)setShowPhoneticName:(BOOL)a3
{
  self->_showPhoneticName = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editExistingTitle, 0);
  objc_storeStrong((id *)&self->_addExistingTitle, 0);
  objc_storeStrong((id *)&self->_addNewTitle, 0);
  objc_storeStrong((id *)&self->_contactKeys, 0);
}

@end
