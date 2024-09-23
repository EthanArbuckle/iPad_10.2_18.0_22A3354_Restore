@implementation RAPLookAroundCategoryItem

- (RAPLookAroundCategoryItem)initWithType:(unint64_t)a3
{
  RAPLookAroundCategoryItem *v4;
  RAPLookAroundCategoryItem *v5;
  uint64_t v6;
  NSString *localizedName;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RAPLookAroundCategoryItem;
  v4 = -[RAPLookAroundCategoryItem init](&v9, "init");
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    v6 = objc_claimAutoreleasedReturnValue(+[RAPLookAroundCategoryItem _titleForQuestionType:](RAPLookAroundCategoryItem, "_titleForQuestionType:", a3));
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v6;

  }
  return v5;
}

- (int)analyticAction
{
  unint64_t type;

  type = self->_type;
  if (type > 6)
    return 17099;
  else
    return dword_100E3CBF0[type];
}

+ (id)_titleForQuestionType:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  switch(a3)
  {
    case 0uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("[RAP LookAround] Image quality should be better");
      goto LABEL_9;
    case 1uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("[RAP LookAround] Street or other labels are incorrect");
      goto LABEL_9;
    case 2uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("[RAP LookAround] Store labels are incorrect");
      goto LABEL_9;
    case 3uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("[RAP LookAround] Privacy Concerns");
      goto LABEL_9;
    case 4uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("[RAP LookAround] Obscure personal information");
      goto LABEL_9;
    case 5uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("[RAP LookAround] Obscure imagery of my home");
      goto LABEL_9;
    case 6uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("[RAP LookAround] Something else needs fixing");
LABEL_9:
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));

      break;
    default:
      return v3;
  }
  return v3;
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
