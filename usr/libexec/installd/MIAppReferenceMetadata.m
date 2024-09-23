@implementation MIAppReferenceMetadata

- (MIAppReferenceMetadata)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MIAppReferenceMetadata;
  return -[MIAppReferenceMetadata init](&v3, "init");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MIAppReferenceMetadata)initWithCoder:(id)a3
{
  id v4;
  MIAppReferenceMetadata *v5;
  uint64_t v6;
  NSSet *v7;
  void *v8;
  uint64_t v9;
  NSArray *personas;

  v4 = a3;
  v5 = -[MIAppReferenceMetadata init](self, "init");
  if (v5)
  {
    v6 = objc_opt_class(NSArray);
    v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(NSString), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("personas")));
    personas = v5->_personas;
    v5->_personas = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MIAppReferenceMetadata personas](self, "personas"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("personas"));

}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIAppReferenceMetadata personas](self, "personas"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  MIAppReferenceMetadata *v4;
  MIAppReferenceMetadata *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = (MIAppReferenceMetadata *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4) & 1) != 0)
    {
      v5 = v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIAppReferenceMetadata personas](self, "personas"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIAppReferenceMetadata personas](v5, "personas"));

      v8 = sub_1000116CC(v6, v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)serializeToURL:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v18;

  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
  objc_msgSend(v7, "encodeObject:forKey:", self, NSKeyedArchiveRootObjectKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "encodedData"));

  v18 = 0;
  v9 = objc_msgSend(v8, "writeToURL:options:error:", v6, 268435457, &v18);
  v10 = v18;
  if ((v9 & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    v12 = (void *)MIInstallerErrorDomain;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
    v15 = sub_100010E50((uint64_t)"-[MIAppReferenceMetadata serializeToURL:error:]", 96, v12, 4, v10, 0, CFSTR("Failed to write serialized MIAppReferences to %@"), v14, (uint64_t)v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    v10 = v16;
    if (a4)
    {
      v10 = objc_retainAutorelease(v16);
      v11 = 0;
      *a4 = v10;
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

+ (id)referenceMetadataFromURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id v31;
  id v33;
  id v34;

  v6 = a3;
  v34 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v6, 3, &v34));
  v8 = v34;
  v9 = v8;
  if (!v7)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
    if (objc_msgSend(v20, "isEqualToString:", NSCocoaErrorDomain))
    {
      v21 = objc_msgSend(v9, "code");

      if (v21 == (id)260)
        goto LABEL_11;
    }
    else
    {

    }
    v26 = (void *)MIInstallerErrorDomain;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
    v29 = sub_100010E50((uint64_t)"+[MIAppReferenceMetadata referenceMetadataFromURL:error:]", 119, v26, 130, v9, 0, CFSTR("Failed to read reference metadata from %@"), v28, (uint64_t)v27);
    v30 = objc_claimAutoreleasedReturnValue(v29);

    v10 = 0;
    v13 = 0;
    v9 = (void *)v30;
    if (!a4)
      goto LABEL_17;
    goto LABEL_15;
  }
  v33 = v8;
  v10 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v7, &v33);
  v11 = v33;

  if (!v10)
  {
    v22 = (void *)MIInstallerErrorDomain;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
    v25 = sub_100010E50((uint64_t)"+[MIAppReferenceMetadata referenceMetadataFromURL:error:]", 126, v22, 130, v11, 0, CFSTR("Failed to read reference metadata from %@"), v24, (uint64_t)v23);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v25);

LABEL_11:
    v10 = 0;
    v13 = 0;
    if (!a4)
      goto LABEL_17;
    goto LABEL_15;
  }
  v12 = objc_msgSend(v10, "decodeObjectOfClass:forKey:", objc_opt_class(a1), NSKeyedArchiveRootObjectKey);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if (!v13)
  {
    v14 = (void *)MIInstallerErrorDomain;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
    v18 = sub_100010E50((uint64_t)"+[MIAppReferenceMetadata referenceMetadataFromURL:error:]", 132, v14, 130, v15, 0, CFSTR("Failed to decode reference metadata from %@"), v17, (uint64_t)v16);
    v19 = objc_claimAutoreleasedReturnValue(v18);

    v11 = (id)v19;
  }
  objc_msgSend(v10, "finishDecoding");
  v9 = v11;
  if (a4)
  {
LABEL_15:
    if (!v13)
      *a4 = objc_retainAutorelease(v9);
  }
LABEL_17:
  v31 = v13;

  return v31;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIAppReferenceMetadata personas](self, "personas"));
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setPersonas:", v7);

  return v5;
}

- (NSArray)personas
{
  return self->_personas;
}

- (void)setPersonas:(id)a3
{
  objc_storeStrong((id *)&self->_personas, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personas, 0);
}

@end
