@implementation MUISearchSuggestionCategory

+ (id)contactCategory
{
  if (qword_1005AA098 != -1)
    dispatch_once(&qword_1005AA098, &stru_1005209B8);
  return (id)qword_1005AA090;
}

+ (id)genericCategory
{
  if (qword_1005AA150 != -1)
    dispatch_once(&qword_1005AA150, &stru_1005211A8);
  return (id)qword_1005AA148;
}

+ (id)dateCategory
{
  if (qword_1005AA3E8 != -1)
    dispatch_once(&qword_1005AA3E8, &stru_100522B80);
  return (id)qword_1005AA3E0;
}

+ (id)otherCategory
{
  if (qword_1005AA3F8 != -1)
    dispatch_once(&qword_1005AA3F8, &stru_100522BE0);
  return (id)qword_1005AA3F0;
}

+ (id)cannedCategory
{
  if (qword_1005AA408 != -1)
    dispatch_once(&qword_1005AA408, &stru_100522C00);
  return (id)qword_1005AA400;
}

- (BOOL)isLegacy
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MUISearchSuggestionCategory mailboxCategory](MUISearchSuggestionCategory, "mailboxCategory"));
  if ((-[MUISearchSuggestionCategory isGroupedInCategory:](self, "isGroupedInCategory:", v3) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MUISearchSuggestionCategory otherCategory](MUISearchSuggestionCategory, "otherCategory"));
    if ((-[MUISearchSuggestionCategory isGroupedInCategory:](self, "isGroupedInCategory:", v5) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[MUISearchSuggestionCategory cannedCategory](MUISearchSuggestionCategory, "cannedCategory"));
      v4 = -[MUISearchSuggestionCategory isGroupedInCategory:](self, "isGroupedInCategory:", v6);

    }
  }

  return v4;
}

+ (id)mailboxCategory
{
  if (qword_1005AA528 != -1)
    dispatch_once(&qword_1005AA528, &stru_100523690);
  return (id)qword_1005AA520;
}

@end
