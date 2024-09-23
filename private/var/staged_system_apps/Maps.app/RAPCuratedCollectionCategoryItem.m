@implementation RAPCuratedCollectionCategoryItem

- (RAPCuratedCollectionCategoryItem)initWithType:(unint64_t)a3
{
  RAPCuratedCollectionCategoryItem *v4;
  RAPCuratedCollectionCategoryItem *v5;
  uint64_t v6;
  NSString *localizedName;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RAPCuratedCollectionCategoryItem;
  v4 = -[RAPCuratedCollectionCategoryItem init](&v9, "init");
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    v6 = objc_claimAutoreleasedReturnValue(-[RAPCuratedCollectionCategoryItem titleForQuestionType:](v4, "titleForQuestionType:", a3));
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v6;

  }
  return v5;
}

- (id)titleForQuestionType:(unint64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  __CFString *v6;

  switch(a3)
  {
    case 1uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("[RAP Curated Collection] Broken Link");
      goto LABEL_7;
    case 2uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("[RAP Curated Collection] Inaccurate Description");
      goto LABEL_7;
    case 3uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("[RAP Curated Collection]");
      goto LABEL_7;
    case 4uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("[RAP Curated Collection] Other");
LABEL_7:
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

      break;
    default:
      v6 = &stru_1011EB268;
      break;
  }
  return v6;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end
