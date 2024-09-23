@implementation MTShareUtilStringFactory

+ (id)subjectForShareEmailFromDataSource:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend(v3, "currentShareMode") == (id)2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sharePodcastTitle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shareEpisodeTitle"));

    v6 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@"), v4, v5));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SHARE_EMAIL_SHOW_SUBJECT_FORMAT"), &stru_1004C6D40, 0));

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sharePodcastTitle"));
    v6 = objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v4, CFSTR("%@"), 0, v5));
  }
  v8 = (void *)v6;

  return v8;
}

+ (id)bodyForShareEmailFromDataSource:(id)a3
{
  return _objc_msgSend(a1, "_bodyForShareEmailWithDataSource:", a3);
}

+ (id)textForShareToNotesFromDataSource:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("EPISODE_OR_PODCAST_SHARE_NOTES"), &stru_1004C6D40, 0));

  if (objc_msgSend(v3, "currentShareMode") == (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sharePodcastTitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shareProvider"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shareEpisodeTitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sharePodcastTitle"));
  }
  v8 = v7;
  if (objc_msgSend(v7, "length"))
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v5, CFSTR("%@ %@"), 0, v6, v8));
  else
    v9 = v6;
  v10 = v9;

  return v10;
}

+ (id)_titleHTMLForDataSource:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;

  v3 = a3;
  if (objc_msgSend(v3, "currentShareMode") == (id)1)
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sharePodcastTitle"));
  else
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shareEpisodeTitle"));
  v5 = (void *)v4;

  if (v5)
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<strong>%@</strong>"), v5));
  else
    v6 = &stru_1004C6D40;

  return v6;
}

+ (id)_subtitleHTMLForDataSource:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;

  v3 = a3;
  if (objc_msgSend(v3, "currentShareMode") == (id)1)
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shareProvider"));
  else
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sharePodcastTitle"));
  v5 = (void *)v4;

  if (v5)
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<br/>%@"), v5));
  else
    v6 = &stru_1004C6D40;

  return v6;
}

+ (id)_descriptionHTMLForDataSource:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shareDescription"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shareDescription"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<br/><br/>%@"), v5));

  }
  else
  {
    v6 = &stru_1004C6D40;
  }

  return v6;
}

+ (id)_footerHTMLForDataSource:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "shareURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "absoluteString"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<a href=\"%@\">%@</a>"), v4, v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SHARE_EMAIL_FOOTER_FORMAT"), &stru_1004C6D40, 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<p>%@</p>"), v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v8, CFSTR("%@"), 0, v5));

  return v9;
}

+ (id)_bodyForShareEmailWithDataSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("<html><body>")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_titleHTMLForDataSource:", v4));
  objc_msgSend(v5, "appendString:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_subtitleHTMLForDataSource:", v4));
  objc_msgSend(v5, "appendString:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_descriptionHTMLForDataSource:", v4));
  objc_msgSend(v5, "appendString:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_footerHTMLForDataSource:", v4));
  objc_msgSend(v5, "appendString:", v9);

  objc_msgSend(v5, "appendString:", CFSTR("</body></html>"));
  return v5;
}

@end
