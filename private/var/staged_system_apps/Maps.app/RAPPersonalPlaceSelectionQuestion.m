@implementation RAPPersonalPlaceSelectionQuestion

- (RAPPersonalPlaceSelectionQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 shortcut:(id)a5
{
  id v9;
  RAPPersonalPlaceSelectionQuestion *v10;
  RAPPersonalPlaceSelectionQuestion *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)RAPPersonalPlaceSelectionQuestion;
  v10 = -[RAPQuestion initWithReport:parentQuestion:](&v13, "initWithReport:parentQuestion:", a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_shortcut, a5);

  return v11;
}

- (int64_t)questionCategory
{
  return 0;
}

- (int)userAction
{
  return 0;
}

- (UIImage)image
{
  return (UIImage *)sub_10050DEB8((uint64_t)-[MapsSuggestionsShortcut type](self->_shortcut, "type"));
}

- (NSString)localizedTitle
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsShortcut geoMapItem](self->_shortcut, "geoMapItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "addressObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));

  return (NSString *)v4;
}

- (NSString)localizedDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsShortcut geoMapItem](self->_shortcut, "geoMapItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "addressObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shortAddress"));

  return (NSString *)v4;
}

- (MapsSuggestionsShortcut)shortcut
{
  return self->_shortcut;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcut, 0);
}

@end
