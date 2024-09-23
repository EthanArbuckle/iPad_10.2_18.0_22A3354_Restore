@implementation NSObject

- (id)ic_loggingDescription
{
  id v3;
  void *v4;

  if ((objc_opt_respondsToSelector(self, "ic_loggingValues") & 1) != 0
    && (objc_opt_respondsToSelector(self, "ic_loggingIdentifier") & 1) != 0)
  {
    v3 = objc_msgSend((id)objc_opt_class(self), "ic_loggingDescriptionFromLoggable:isPretty:", self, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject description](self, "description"));
  }
  return v4;
}

- (id)ic_prettyLoggingDescription
{
  id v3;
  void *v4;

  if ((objc_opt_respondsToSelector(self, "ic_loggingValues") & 1) != 0
    && (objc_opt_respondsToSelector(self, "ic_loggingIdentifier") & 1) != 0)
  {
    v3 = objc_msgSend((id)objc_opt_class(self), "ic_loggingDescriptionFromLoggable:isPretty:", self, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject description](self, "description"));
  }
  return v4;
}

- (id)ic_loggingIdentifier
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), self);
}

+ (id)ic_loggingDescriptionFromLoggable:(id)a3 isPretty:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  __CFString *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  const __CFString *v19;
  BOOL v20;

  v4 = a4;
  v5 = a3;
  v6 = (objc_class *)objc_opt_class(v5);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<%@ "), v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ic_loggingIdentifier"));
  if (!v10)
  {
    objc_msgSend(v9, "appendFormat:", CFSTR("UNKNOWN_IDENTIFIER"));
    if (v4)
      goto LABEL_3;
LABEL_5:
    v11 = CFSTR(" %@=%@");
    goto LABEL_6;
  }
  objc_msgSend(v9, "appendString:", v10);
  if (!v4)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v9, "appendString:", CFSTR("\n"));
  v11 = CFSTR("\t%@ = %@\n");
LABEL_6:
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ic_loggingValues"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000722B4;
  v17[3] = &unk_1007DA0D0;
  v20 = v4;
  v13 = v9;
  v18 = v13;
  v19 = v11;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v17);
  objc_msgSend(v13, "appendString:", CFSTR(">"));
  v14 = (__CFString *)v19;
  v15 = v13;

  return v15;
}

- (id)jsonify
{
  NSObject *v2;
  id result;
  id v4;

  v2 = self;
  result = -[NSObject description](v2, "description");
  if (result)
  {
    v4 = result;

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

@end
