@implementation REMCKCloudState

- (ICCloudObject)cloudObject
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int (*v15)(uint64_t, const char *);
  uint64_t v16;
  uint64_t v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCKCloudState object](self, "object"));

  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[REMCKCloudState object](self, "object"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[REMCKCloudState list](self, "list"));

    if (v6)
    {
      v4 = objc_claimAutoreleasedReturnValue(-[REMCKCloudState list](self, "list"));
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[REMCKCloudState reminder](self, "reminder"));

      if (v7)
      {
        v4 = objc_claimAutoreleasedReturnValue(-[REMCKCloudState reminder](self, "reminder"));
      }
      else
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[REMCKCloudState template](self, "template"));

        if (v8)
        {
          v4 = objc_claimAutoreleasedReturnValue(-[REMCKCloudState template](self, "template"));
        }
        else
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[REMCKCloudState savedReminder](self, "savedReminder"));

          if (v9)
          {
            v4 = objc_claimAutoreleasedReturnValue(-[REMCKCloudState savedReminder](self, "savedReminder"));
          }
          else
          {
            v10 = (void *)objc_claimAutoreleasedReturnValue(-[REMCKCloudState savedAttachment](self, "savedAttachment"));

            if (v10)
            {
              v4 = objc_claimAutoreleasedReturnValue(-[REMCKCloudState savedAttachment](self, "savedAttachment"));
            }
            else
            {
              v11 = (void *)objc_claimAutoreleasedReturnValue(-[REMCKCloudState section](self, "section"));

              if (!v11)
              {
                v12 = 0;
                goto LABEL_20;
              }
              v4 = objc_claimAutoreleasedReturnValue(-[REMCKCloudState section](self, "section"));
            }
          }
        }
      }
    }
  }
  v12 = (id)v4;
  if (v4
    && (v13 = objc_opt_class(v4, v5), (objc_opt_respondsToSelector(v13, "conformsToICCloudObject") & 1) != 0)
    && (v15 = (unsigned int (*)(uint64_t, const char *))objc_msgSend((id)objc_opt_class(v12, v14), "methodForSelector:", "conformsToICCloudObject"), v17 = objc_opt_class(v12, v16), v15(v17, "conformsToICCloudObject")))
  {
    v12 = v12;
    v11 = v12;
  }
  else
  {
    v11 = 0;
  }
LABEL_20:

  return (ICCloudObject *)v11;
}

+ (id)defaultRelationshipKeyPathsForPrefetching
{
  if (qword_100852838 != -1)
    dispatch_once(&qword_100852838, &stru_1007D9E98);
  return (id)qword_100852840;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("REMCKCloudState"));
}

@end
