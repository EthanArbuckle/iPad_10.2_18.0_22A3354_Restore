@implementation TFFeedbackEntryGroup

- (TFFeedbackEntryGroup)initWithIdentifier:(id)a3 entries:(id)a4 title:(id)a5 election:(unint64_t)a6 headerText:(id)a7 headerTextLinkMap:(id)a8 footerText:(id)a9 footerTextLinkMap:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  TFFeedbackEntryGroup *v23;
  uint64_t v24;
  NSString *identifier;
  uint64_t v26;
  NSArray *entries;
  uint64_t v28;
  NSString *title;
  uint64_t v30;
  NSString *headerText;
  uint64_t v32;
  NSDictionary *headerTextLinkMap;
  uint64_t v34;
  NSString *footerText;
  uint64_t v36;
  NSDictionary *footerTextLinkMap;
  unint64_t election;
  TFFeedbackEntryGroupToggle *v39;
  TFFeedbackEntry *groupToggleEntry;
  objc_super v42;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v42.receiver = self;
  v42.super_class = (Class)TFFeedbackEntryGroup;
  v23 = -[TFFeedbackEntryGroup init](&v42, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v16, "copy");
    identifier = v23->_identifier;
    v23->_identifier = (NSString *)v24;

    v26 = objc_msgSend(v17, "copy");
    entries = v23->_entries;
    v23->_entries = (NSArray *)v26;

    v28 = objc_msgSend(v18, "copy");
    title = v23->_title;
    v23->_title = (NSString *)v28;

    v23->_election = a6;
    v30 = objc_msgSend(v19, "copy");
    headerText = v23->_headerText;
    v23->_headerText = (NSString *)v30;

    if (v19)
    {
      v32 = objc_msgSend(v20, "copy");
      headerTextLinkMap = v23->_headerTextLinkMap;
      v23->_headerTextLinkMap = (NSDictionary *)v32;
    }
    else
    {
      headerTextLinkMap = v23->_headerTextLinkMap;
      v23->_headerTextLinkMap = 0;
    }

    v34 = objc_msgSend(v21, "copy");
    footerText = v23->_footerText;
    v23->_footerText = (NSString *)v34;

    if (v21)
    {
      v36 = objc_msgSend(v22, "copy");
      footerTextLinkMap = v23->_footerTextLinkMap;
      v23->_footerTextLinkMap = (NSDictionary *)v36;
    }
    else
    {
      footerTextLinkMap = v23->_footerTextLinkMap;
      v23->_footerTextLinkMap = 0;
    }

    election = v23->_election;
    v23->_toggleable = election != 0;
    if (election)
    {
      v39 = -[TFFeedbackEntryGroupToggle initWithGroupIdentifier:title:]([TFFeedbackEntryGroupToggle alloc], "initWithGroupIdentifier:title:", v16, v18);
      groupToggleEntry = v23->_groupToggleEntry;
      v23->_groupToggleEntry = &v39->super;
    }
    else
    {
      groupToggleEntry = v23->_groupToggleEntry;
      v23->_groupToggleEntry = 0;
    }

  }
  return v23;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)entries
{
  return self->_entries;
}

- (NSString)headerText
{
  return self->_headerText;
}

- (NSDictionary)headerTextLinkMap
{
  return self->_headerTextLinkMap;
}

- (NSString)footerText
{
  return self->_footerText;
}

- (NSDictionary)footerTextLinkMap
{
  return self->_footerTextLinkMap;
}

- (unint64_t)election
{
  return self->_election;
}

- (BOOL)isToggleable
{
  return self->_toggleable;
}

- (TFFeedbackEntry)groupToggleEntry
{
  return self->_groupToggleEntry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupToggleEntry, 0);
  objc_storeStrong((id *)&self->_footerTextLinkMap, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_headerTextLinkMap, 0);
  objc_storeStrong((id *)&self->_headerText, 0);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (unint64_t)numberOfVisibleItemsForIncludeState:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  void *v6;

  v3 = a3;
  v5 = -[TFFeedbackEntryGroup isToggleable](self, "isToggleable");
  if (!-[TFFeedbackEntryGroup isToggleable](self, "isToggleable") || v3)
  {
    -[TFFeedbackEntryGroup entries](self, "entries");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "count") + v5;

  }
  return v5;
}

- (id)visibleEntryForIndex:(unint64_t)a3
{
  _BOOL4 v5;
  void *v6;
  unint64_t v7;
  void *v8;

  v5 = -[TFFeedbackEntryGroup isToggleable](self, "isToggleable");
  if (a3 || !v5)
  {
    v7 = a3 - v5;
    -[TFFeedbackEntryGroup entries](self, "entries");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[TFFeedbackEntryGroup groupToggleEntry](self, "groupToggleEntry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

@end
