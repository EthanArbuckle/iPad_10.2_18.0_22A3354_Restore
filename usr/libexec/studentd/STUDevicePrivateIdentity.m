@implementation STUDevicePrivateIdentity

- (STUDevicePrivateIdentity)initWithIdentityPersistentId:(id)a3 stagedIdentityPersistentId:(id)a4 commonNamePrefix:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  STUDevicePrivateIdentity *v13;
  objc_super v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend((id)objc_opt_class(self), "prefixForCommonNamePrefix:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v15.receiver = self;
  v15.super_class = (Class)STUDevicePrivateIdentity;
  v13 = -[STUDevicePrivateIdentity initWithIdentityPersistentId:stagedIdentityPersistentId:commonNamePrefix:](&v15, "initWithIdentityPersistentId:stagedIdentityPersistentId:commonNamePrefix:", v10, v9, v12);

  return v13;
}

- (id)coursePrivateIdentityForCourseIdentifier:(id)a3 studentIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  STUCoursePrivateIdentity *v10;
  void *v11;
  void *v12;
  STUCoursePrivateIdentity *v13;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUDevicePrivateIdentity.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("courseIdentifier"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUDevicePrivateIdentity.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("studentIdentifier"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = [STUCoursePrivateIdentity alloc];
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevicePrivateIdentity identityPersistentId](self, "identityPersistentId"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevicePrivateIdentity stagedIdentityPersistentId](self, "stagedIdentityPersistentId"));
  v13 = -[STUCoursePrivateIdentity initWithIdentityPersistentId:stagedIdentityPersistentId:groupIdentifier:studentIdentifier:](v10, "initWithIdentityPersistentId:stagedIdentityPersistentId:groupIdentifier:studentIdentifier:", v11, v12, v7, v9);

  return v13;
}

+ (id)freshPrivateIdentityWithCommonNamePrefix:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(a1), "prefixForCommonNamePrefix:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___STUDevicePrivateIdentity;
  v7 = objc_msgSendSuper2(&v10, "freshPrivateIdentityWithCommonNamePrefix:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

+ (id)keychainGroup
{
  return CRKClassroomKeychainGroupIdentifier;
}

+ (id)prefixForCommonNamePrefix:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("member: %@"), a3);
}

@end
