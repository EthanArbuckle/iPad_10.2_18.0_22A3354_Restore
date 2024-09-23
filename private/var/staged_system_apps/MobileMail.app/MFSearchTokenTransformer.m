@implementation MFSearchTokenTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class(NSData);
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v11;
  _BYTE v12[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "representedObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "csToken"));
  v11 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v11));
  v6 = v11;
  if (!objc_msgSend(v5, "length"))
  {
    v7 = MFLogGeneral(0);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ef_publicDescription"));
      sub_100394B04(v9, (uint64_t)v12, v8);
    }

  }
  return v5;
}

- (id)reverseTransformedValue:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v16;
  _BYTE v17[24];

  v3 = a3;
  if (!objc_msgSend(v3, "length"))
    goto LABEL_8;
  v4 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v3, 0);
  v16 = 0;
  v5 = objc_msgSend(v4, "decodeTopLevelObjectOfClass:forKey:error:", objc_opt_class(_CSSuggestionToken), NSKeyedArchiveRootObjectKey, &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v16;
  v8 = objc_msgSend(objc_alloc((Class)MUISuggestionToken), "initWithCSToken:", v6);
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "image"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
    v12 = objc_claimAutoreleasedReturnValue(+[UISearchToken tokenWithIcon:text:](UISearchToken, "tokenWithIcon:text:", v10, v11));

    -[NSObject setRepresentedObject:](v12, "setRepresentedObject:", v9);
  }
  else
  {
    v13 = MFLogGeneral(0);
    v12 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ef_publicDescription"));
      sub_100394B4C(v14, (uint64_t)v17, v12);
    }

  }
  if (!v9)
LABEL_8:
    v12 = 0;

  return v12;
}

@end
