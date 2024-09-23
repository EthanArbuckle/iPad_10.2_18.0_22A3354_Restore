@implementation HomeListPhotoSuggestionCellModel

- (HomeListPhotoSuggestionCellModel)initWithEntry:(id)a3
{
  id v5;
  HomeListPhotoSuggestionCellModel *v6;
  HomeListPhotoSuggestionCellModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HomeListPhotoSuggestionCellModel;
  v6 = -[HomeListPhotoSuggestionCellModel init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_entry, a3);

  return v7;
}

- (NSString)title
{
  return (NSString *)-[MapsSuggestionsEntry title](self->_entry, "title");
}

- (NSString)subtitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[Maps Home] Add photos you took here"), CFSTR("localized string not found"), 0));

  return (NSString *)v3;
}

- (unint64_t)hash
{
  return (unint64_t)-[MapsSuggestionsEntry hash](self->_entry, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HomeListPhotoSuggestionCellModel *v4;
  HomeListPhotoSuggestionCellModel *v5;
  uint64_t v6;
  MapsSuggestionsEntry *entry;
  MapsSuggestionsEntry *v8;
  unsigned __int8 v9;

  v4 = (HomeListPhotoSuggestionCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    entry = self->_entry;
    v8 = (MapsSuggestionsEntry *)objc_claimAutoreleasedReturnValue(-[HomeListPhotoSuggestionCellModel entry](v5, "entry"));
    if (entry == v8)
      v9 = 1;
    else
      v9 = -[MapsSuggestionsEntry isEqual:](entry, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  return (NSString *)-[MapsSuggestionsEntry description](self->_entry, "description");
}

- (id)homeActionObject
{
  return self->_entry;
}

- (id)homeDragAndDropObject
{
  return 0;
}

- (NSString)_maps_diffableDataSourceIdentifier
{
  return -[MapsSuggestionsEntry _maps_diffableDataSourceIdentifier](self->_entry, "_maps_diffableDataSourceIdentifier");
}

- (BOOL)needsReloadFromPreviousViewModel:(id)a3
{
  return !-[HomeListPhotoSuggestionCellModel isEqual:](self, "isEqual:", a3);
}

- (MapsSuggestionsEntry)entry
{
  return self->_entry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entry, 0);
}

@end
