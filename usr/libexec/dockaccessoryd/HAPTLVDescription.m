@implementation HAPTLVDescription

- (HAPTLVDescription)descriptionWithIndent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indentationByLevels:", 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\n%@{"), v4));
  objc_msgSend(v6, "appendString:", v7);

  -[HAPTLVDescription description:indent:](self, "description:indent:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\n%@}"), v4));

  objc_msgSend(v6, "appendString:", v8);
  return (HAPTLVDescription *)v6;
}

- (id)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HMFStringIndentation indentation](HMFStringIndentation, "indentation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPTLVDescription descriptionWithIndent:](self, "descriptionWithIndent:", v3));

  return v4;
}

@end
