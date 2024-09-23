@implementation STUCoursePrivateIdentity

- (STUCoursePrivateIdentity)initWithIdentityPersistentId:(id)a3 stagedIdentityPersistentId:(id)a4 groupIdentifier:(id)a5 studentIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  STUCoursePrivateIdentity *v17;
  NSString *v18;
  NSString *studentIdentifier;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v13)
      goto LABEL_3;
LABEL_8:
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUCoursePrivateIdentity.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("groupIdentifier"));

    if (v14)
      goto LABEL_4;
    goto LABEL_9;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUCoursePrivateIdentity.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identityPersistentId"));

  if (!v13)
    goto LABEL_8;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_9:
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUCoursePrivateIdentity.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("studentIdentifier"));

LABEL_4:
  v15 = objc_msgSend((id)objc_opt_class(self), "prefixForStudentIdentifier:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v24.receiver = self;
  v24.super_class = (Class)STUCoursePrivateIdentity;
  v17 = -[STUDevicePrivateIdentity initWithIdentityPersistentId:stagedIdentityPersistentId:commonNamePrefix:](&v24, "initWithIdentityPersistentId:stagedIdentityPersistentId:commonNamePrefix:", v11, v12, v16);

  if (v17)
  {
    objc_storeStrong((id *)&v17->_groupIdentifier, a5);
    v18 = (NSString *)objc_msgSend(v14, "copy");
    studentIdentifier = v17->_studentIdentifier;
    v17->_studentIdentifier = v18;

  }
  return v17;
}

- (STUCoursePrivateIdentity)initWithDictionary:(id)a3 groupIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  STUCoursePrivateIdentity *v11;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUCoursePrivateIdentity.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dictionary"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUCoursePrivateIdentity.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("groupIdentifier"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v7);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("GroupIdentifier"));
  v11 = -[STUCoursePrivateIdentity initWithDictionary:](self, "initWithDictionary:", v10);

  return v11;
}

- (void)setStudentIdentifier:(id)a3
{
  id v5;
  NSString *v6;
  NSString *studentIdentifier;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v11 = v5;
  if (!v5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUCoursePrivateIdentity.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("studentIdentifier"));

    v5 = 0;
  }
  if (!-[NSString isEqualToString:](self->_studentIdentifier, "isEqualToString:", v5))
  {
    v6 = (NSString *)objc_msgSend(v11, "copy");
    studentIdentifier = self->_studentIdentifier;
    self->_studentIdentifier = v6;

    v8 = objc_msgSend((id)objc_opt_class(self), "prefixForStudentIdentifier:", self->_studentIdentifier);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[STUCoursePrivateIdentity setCommonNamePrefix:](self, "setCommonNamePrefix:", v9);

  }
}

+ (id)freshPrivateIdentityForGroupIdentifier:(id)a3 studentIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend((id)objc_opt_class(a1), "prefixForStudentIdentifier:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___STUCoursePrivateIdentity;
  v10 = objc_msgSendSuper2(&v14, "freshPrivateIdentityWithCommonNamePrefix:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "coursePrivateIdentityForCourseIdentifier:studentIdentifier:", v7, v6));
  return v12;
}

+ (id)prefixForStudentIdentifier:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("member: %@"), a3);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  STUCoursePrivateIdentity *v8;
  STUCoursePrivateIdentity *v9;
  id v10;
  BOOL v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  id v17;
  STUCoursePrivateIdentity *v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  id v23;
  id v24;
  objc_super v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)STUCoursePrivateIdentity;
  if (-[STUCoursePrivateIdentity isEqual:](&v25, "isEqual:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("groupIdentifier, studentIdentifier"), "componentsSeparatedByString:", CFSTR(",")));
    v6 = objc_msgSend(v5, "mutableCopy");

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10001B67C;
    v30[3] = &unk_1000C9E08;
    v7 = v6;
    v31 = v7;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v30);

    v8 = self;
    v9 = (STUCoursePrivateIdentity *)v4;
    v10 = v7;
    v11 = v8 == v9;
    if (v8 == v9
      || !-[STUCoursePrivateIdentity isMemberOfClass:](v9, "isMemberOfClass:", objc_opt_class(v8)))
    {

    }
    else
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v12 = v10;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v13)
      {
        v14 = v13;
        v23 = v10;
        v24 = v4;
        v15 = *(_QWORD *)v27;
        while (2)
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v27 != v15)
              objc_enumerationMutation(v12);
            v17 = *(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
            v18 = v9;
            v19 = objc_claimAutoreleasedReturnValue(-[STUCoursePrivateIdentity valueForKey:](v8, "valueForKey:", v17));
            v20 = objc_claimAutoreleasedReturnValue(-[STUCoursePrivateIdentity valueForKey:](v18, "valueForKey:", v17));

            if (v19 | v20)
            {
              v21 = objc_msgSend((id)v19, "isEqual:", v20);

              if (!v21)
              {
                v11 = 0;
                goto LABEL_17;
              }
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          if (v14)
            continue;
          break;
        }
        v11 = 1;
LABEL_17:
        v10 = v23;
        v4 = v24;
      }
      else
      {
        v11 = 1;
      }

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  STUCoursePrivateIdentity *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  STUCoursePrivateIdentity *v9;

  v4 = +[STUCoursePrivateIdentity allocWithZone:](STUCoursePrivateIdentity, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUCoursePrivateIdentity identityPersistentId](self, "identityPersistentId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUCoursePrivateIdentity stagedIdentityPersistentId](self, "stagedIdentityPersistentId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUCoursePrivateIdentity groupIdentifier](self, "groupIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUCoursePrivateIdentity studentIdentifier](self, "studentIdentifier"));
  v9 = -[STUCoursePrivateIdentity initWithIdentityPersistentId:stagedIdentityPersistentId:groupIdentifier:studentIdentifier:](v4, "initWithIdentityPersistentId:stagedIdentityPersistentId:groupIdentifier:studentIdentifier:", v5, v6, v7, v8);

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v5 = a3;
  if (!v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUCoursePrivateIdentity.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("aCoder"));

  }
  v9.receiver = self;
  v9.super_class = (Class)STUCoursePrivateIdentity;
  -[STUCoursePrivateIdentity encodeWithCoder:](&v9, "encodeWithCoder:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUCoursePrivateIdentity groupIdentifier](self, "groupIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("groupIdentifier"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUCoursePrivateIdentity studentIdentifier](self, "studentIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("studentIdentifier"));

}

- (STUCoursePrivateIdentity)initWithCoder:(id)a3
{
  id v5;
  STUCoursePrivateIdentity *v6;
  NSSet *v7;
  void *v8;
  uint64_t v9;
  DMFControlGroupIdentifier *groupIdentifier;
  NSSet *v11;
  void *v12;
  uint64_t v13;
  NSString *studentIdentifier;
  void *v15;
  uint64_t v16;
  NSString *v17;
  void *v19;
  objc_super v20;

  v5 = a3;
  if (!v5)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUCoursePrivateIdentity.m"), 121, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("aDecoder"));

  }
  v20.receiver = self;
  v20.super_class = (Class)STUCoursePrivateIdentity;
  v6 = -[STUCoursePrivateIdentity initWithCoder:](&v20, "initWithCoder:", v5);
  if (v6)
  {
    v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(DMFControlGroupIdentifier), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("groupIdentifier")));
    groupIdentifier = v6->_groupIdentifier;
    v6->_groupIdentifier = (DMFControlGroupIdentifier *)v9;

    v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSString), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v12, CFSTR("studentIdentifier")));
    studentIdentifier = v6->_studentIdentifier;
    v6->_studentIdentifier = (NSString *)v13;

    if (!v6->_studentIdentifier)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));
      v17 = v6->_studentIdentifier;
      v6->_studentIdentifier = (NSString *)v16;

    }
  }

  return v6;
}

- (STUCoursePrivateIdentity)initWithDictionary:(id)a3
{
  id v5;
  STUCoursePrivateIdentity *v6;
  void *v7;
  id v8;
  void *v9;
  DMFControlGroupIdentifier *v10;
  DMFControlGroupIdentifier *groupIdentifier;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  objc_super v17;

  v5 = a3;
  if (!v5)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUCoursePrivateIdentity.m"), 139, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dictionary"));

  }
  v17.receiver = self;
  v17.super_class = (Class)STUCoursePrivateIdentity;
  v6 = -[STUCoursePrivateIdentity initWithDictionary:](&v17, "initWithDictionary:", v5);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("GroupIdentifier")));

    if (!v7)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("STUCoursePrivateIdentity.m"), 145, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dictionary[kSTUCoursePrivateIdentityGroupIdentifierKey]"));

    }
    v8 = objc_alloc((Class)DMFControlGroupIdentifier);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("GroupIdentifier")));
    v10 = (DMFControlGroupIdentifier *)objc_msgSend(v8, "initWithString:", v9);
    groupIdentifier = v6->_groupIdentifier;
    v6->_groupIdentifier = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("StudentIdentifier")));
    v13 = v12;
    if (!v12)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
    }
    objc_storeStrong((id *)&v6->_studentIdentifier, v13);
    if (!v12)
    {

    }
  }

  return v6;
}

- (id)dictionaryValue
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)STUCoursePrivateIdentity;
  v3 = -[STUCoursePrivateIdentity dictionaryValue](&v11, "dictionaryValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUCoursePrivateIdentity studentIdentifier](self, "studentIdentifier"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("StudentIdentifier"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUCoursePrivateIdentity groupIdentifier](self, "groupIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("GroupIdentifier"));

  v9 = objc_msgSend(v5, "copy");
  return v9;
}

- (DMFControlGroupIdentifier)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupIdentifier, a3);
}

- (NSString)studentIdentifier
{
  return self->_studentIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_studentIdentifier, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
}

@end
