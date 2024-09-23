@implementation HOImportTriggerItemManager

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[2];
  void *v18;

  v4 = a3;
  v5 = objc_alloc((Class)HUInstructionsItem);
  v6 = HULocalizedString(CFSTR("HUImportTriggersInstructionsDescription"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v5, "initWithStyle:title:description:", 5, 0, v7);
  -[HOImportTriggerItemManager setInstructionsItem:](self, "setInstructionsItem:", v8);

  v9 = objc_alloc((Class)HFStaticItemProvider);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOImportTriggerItemManager instructionsItem](self, "instructionsItem"));
  v18 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v11));
  v13 = objc_msgSend(v9, "initWithItems:", v12);

  v14 = objc_msgSend(objc_alloc((Class)HUTriggerItemProvider), "initWithHome:", v4);
  v17[0] = v13;
  v17[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 2));

  return v15;
}

- (unint64_t)_numberOfSections
{
  return 2;
}

- (id)_titleForSectionWithIdentifier:(id)a3
{
  uint64_t v3;
  void *v4;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("HUImportTriggerSectionIdentifierTriggers")))
  {
    v3 = HULocalizedString(CFSTR("HUImportTriggersSectionTitle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_identifierForSection:(unint64_t)a3
{
  void *v7;

  if (!a3)
    return CFSTR("HUFImportTriggerSectionIdentifierInstructions");
  if (a3 == 1)
    return CFSTR("HUImportTriggerSectionIdentifierTriggers");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HOImportTriggerItemManager.m"), 64, CFSTR("Couldn't find an identifier for section: %lu"), a3);

  return 0;
}

- (id)_sectionIdentifierForItem:(id)a3
{
  id v5;
  void *v6;
  unsigned __int8 v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOImportTriggerItemManager instructionsItem](self, "instructionsItem"));
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = CFSTR("HUFImportTriggerSectionIdentifierInstructions");
  }
  else
  {
    v9 = objc_opt_class(HFTriggerItem);
    if ((objc_opt_isKindOfClass(v5, v9) & 1) != 0)
    {
      v8 = CFSTR("HUImportTriggerSectionIdentifierTriggers");
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HOImportTriggerItemManager.m"), 74, CFSTR("Couldn't find a section for item: %@"), v5);

      v8 = 0;
    }
  }

  return (id)v8;
}

- (HFStaticItem)instructionsItem
{
  return self->_instructionsItem;
}

- (void)setInstructionsItem:(id)a3
{
  objc_storeStrong((id *)&self->_instructionsItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructionsItem, 0);
}

@end
