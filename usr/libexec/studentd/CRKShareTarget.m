@implementation CRKShareTarget

+ (id)stu_shareTargetWithInstructor:(id)a3
{
  id v5;
  CRKShareTarget *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v5 = a3;
  if (!v5)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CRKShareTarget+StudentAdditions.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("instructor"));

  }
  v6 = objc_opt_new(CRKShareTarget);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sessionIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupIdentifier"));
  -[CRKShareTarget setCourseIdentifier:](v6, "setCourseIdentifier:", v8);

  -[CRKShareTarget setType:](v6, "setType:", CFSTR("instructor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sessionIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringValue"));
  -[CRKShareTarget setIdentifier:](v6, "setIdentifier:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayName"));
  -[CRKShareTarget setDisplayName:](v6, "setDisplayName:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "courseName"));
  -[CRKShareTarget setSecondaryName:](v6, "setSecondaryName:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageData"));
  -[CRKShareTarget setIconImageData:](v6, "setIconImageData:", v13);

  -[CRKShareTarget setGroup:](v6, "setGroup:", 0);
  -[CRKShareTarget setCourse:](v6, "setCourse:", 0);
  -[CRKShareTarget setInstructor:](v6, "setInstructor:", 1);
  -[CRKShareTarget setSupportsFileURLs:](v6, "setSupportsFileURLs:", 1);

  return v6;
}

@end
