@implementation GEOSubPremise

- (NSString)localizedDescription
{
  void *v2;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  switch(-[GEOSubPremise type](self, "type"))
  {
    case 0u:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Unit %@");
      goto LABEL_6;
    case 1u:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Floor %@");
      goto LABEL_6;
    case 2u:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Postbox %@");
      goto LABEL_6;
    case 3u:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Mailstop %@");
LABEL_6:
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSubPremise name](self, "name"));
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8));

      break;
    default:
      return (NSString *)v2;
  }
  return (NSString *)v2;
}

@end
