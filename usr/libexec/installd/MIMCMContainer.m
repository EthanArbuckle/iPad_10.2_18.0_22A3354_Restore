@implementation MIMCMContainer

- (BOOL)_doInitWithContainer:(container_object_s *)a3 error:(id *)a4
{
  uint64_t identifier;
  uint64_t v8;
  NSString *v9;
  NSString *v10;
  uint64_t persona_unique_string;
  NSString *v12;
  NSString *personaUniqueString;
  unsigned int v14;
  id v15;
  uint64_t is_transient;
  BOOL v17;
  id v18;
  uint64_t v19;
  uint64_t error_description;
  uint64_t v21;
  const char *v22;
  id v23;
  uint64_t v24;
  uint64_t v26;
  id v27;
  BOOL v28;

  v28 = 0;
  self->_containerClass = container_get_class(a3, a2);
  identifier = container_get_identifier(a3);
  if (!identifier)
  {
    v18 = sub_100010E50((uint64_t)"-[MIMCMContainer _doInitWithContainer:error:]", 121, MIContainerManagerErrorDomain, 18, 0, 0, CFSTR("Failed to get identifier for the container"), v8, v26);
    v15 = (id)objc_claimAutoreleasedReturnValue(v18);
    goto LABEL_8;
  }
  v9 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", identifier));
  v10 = self->_identifier;
  self->_identifier = v9;

  self->_mcmContainer = (container_object_s *)container_copy_object(a3);
  persona_unique_string = container_get_persona_unique_string(a3);
  if (persona_unique_string)
  {
    v12 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", persona_unique_string));
    personaUniqueString = self->_personaUniqueString;
    self->_personaUniqueString = v12;

  }
  v27 = 0;
  v14 = -[MIMCMContainer _refreshContainerMetadataWithError:](self, "_refreshContainerMetadataWithError:", &v27);
  v15 = v27;
  if (!v14)
  {
LABEL_8:
    if (!a4)
    {
LABEL_13:
      v17 = 0;
      goto LABEL_14;
    }
LABEL_9:
    v15 = objc_retainAutorelease(v15);
    v17 = 0;
    *a4 = v15;
    goto LABEL_14;
  }
  self->_isNew = container_is_new(self->_mcmContainer);
  is_transient = container_is_transient(-[MIMCMContainer mcmContainer](self, "mcmContainer"), &v28);
  if (is_transient != 1)
  {
    v19 = is_transient;
    error_description = container_get_error_description();
    v22 = "(container_get_error_description returned NULL)";
    if (error_description)
      v22 = (const char *)error_description;
    v23 = sub_100010E24((uint64_t)"-[MIMCMContainer _doInitWithContainer:error:]", 141, MIContainerManagerErrorDomain, v19, 0, 0, CFSTR("%s"), v21, (uint64_t)v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);

    v15 = (id)v24;
    if (!a4)
      goto LABEL_13;
    goto LABEL_9;
  }
  self->_isTransient = v28;
  v17 = 1;
LABEL_14:

  return v17;
}

- (MIMCMContainer)initWithContainer:(container_object_s *)a3 error:(id *)a4
{
  MIMCMContainer *v6;
  MIMCMContainer *v7;
  MIMCMContainer *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MIMCMContainer;
  v6 = -[MIMCMContainer init](&v10, "init");
  v7 = v6;
  if (v6 && !-[MIMCMContainer _doInitWithContainer:error:](v6, "_doInitWithContainer:error:", a3, a4))
    v8 = 0;
  else
    v8 = v7;

  return v8;
}

- (MIMCMContainer)initWithSerializedContainer:(id)a3 matchingWithOptions:(unint64_t)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  MIMCMContainer *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t single_result;
  unsigned __int8 v16;
  id v17;
  __CFString *v18;
  void *v19;
  void *v20;
  uint64_t type;
  int posix_errno;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  id v26;
  void *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t error_description;
  uint64_t v39;
  const char *v40;
  id v41;
  id v42;
  void *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  id v49;
  id v50;
  void *v51;
  uint64_t v52;
  id v53;
  id v55;
  objc_super v56;
  uint64_t last_error;

  v8 = a3;
  v56.receiver = self;
  v56.super_class = (Class)MIMCMContainer;
  last_error = 0;
  v10 = -[MIMCMContainer init](&v56, "init");
  if (!v10)
  {
    v14 = 0;
    v13 = 0;
    v16 = 0;
    v17 = 0;
    goto LABEL_24;
  }
  v11 = objc_retainAutorelease(v8);
  v12 = container_serialize_copy_deserialized_reference(objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"), &last_error);
  if (!v12)
  {
    if (last_error)
    {
      v18 = sub_1000110E8();
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = (void *)MIContainerManagerErrorDomain;
      type = container_error_get_type(last_error);
      posix_errno = container_error_get_posix_errno(last_error);
      if (posix_errno)
      {
        v23 = posix_errno;
        v24 = strerror(posix_errno);
        v26 = sub_100010E24((uint64_t)"-[MIMCMContainer initWithSerializedContainer:matchingWithOptions:error:]", 187, NSPOSIXErrorDomain, v23, 0, 0, CFSTR("Underlying errno set by container manager is %s"), v25, (uint64_t)v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      }
      else
      {
        v27 = 0;
      }
      v42 = sub_1000035A8();
      v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
      v45 = sub_100010E24((uint64_t)"-[MIMCMContainer initWithSerializedContainer:matchingWithOptions:error:]", 187, v20, type, v27, v43, CFSTR("%@"), v44, (uint64_t)v19);
      v17 = (id)objc_claimAutoreleasedReturnValue(v45);

      container_error_free(last_error);
    }
    else
    {
      error_description = container_get_error_description(21);
      v40 = "(container_get_error_description returned NULL)";
      if (error_description)
        v40 = (const char *)error_description;
      v41 = sub_100010E24((uint64_t)"-[MIMCMContainer initWithSerializedContainer:matchingWithOptions:error:]", 190, MIContainerManagerErrorDomain, 21, 0, 0, CFSTR("%s"), v39, (uint64_t)v40);
      v17 = (id)objc_claimAutoreleasedReturnValue(v41);
    }
    v14 = 0;
    v13 = 0;
    goto LABEL_23;
  }
  v13 = v12;
  v14 = container_query_create_from_container();
  container_query_operation_set_flags(v14, a4 | 0x300000002);
  single_result = container_query_get_single_result(v14);
  if (!single_result)
  {
    last_error = container_query_get_last_error(v14);
    if (last_error)
    {
      v28 = sub_1000110E8();
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v30 = (void *)MIContainerManagerErrorDomain;
      v31 = container_error_get_type(last_error);
      v32 = container_error_get_posix_errno(last_error);
      if (v32)
      {
        v33 = v32;
        v34 = strerror(v32);
        v36 = sub_100010E24((uint64_t)"-[MIMCMContainer initWithSerializedContainer:matchingWithOptions:error:]", 204, NSPOSIXErrorDomain, v33, 0, 0, CFSTR("Underlying errno set by container manager is %s"), v35, (uint64_t)v34);
        v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      }
      else
      {
        v37 = 0;
      }
      v50 = sub_1000035A8();
      v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
      v53 = sub_100010E24((uint64_t)"-[MIMCMContainer initWithSerializedContainer:matchingWithOptions:error:]", 204, v30, v31, v37, v51, CFSTR("%@"), v52, (uint64_t)v29);
      v17 = (id)objc_claimAutoreleasedReturnValue(v53);

    }
    else
    {
      v46 = container_get_error_description(21);
      v48 = "(container_get_error_description returned NULL)";
      if (v46)
        v48 = (const char *)v46;
      v49 = sub_100010E24((uint64_t)"-[MIMCMContainer initWithSerializedContainer:matchingWithOptions:error:]", 206, MIContainerManagerErrorDomain, 21, 0, 0, CFSTR("%s"), v47, (uint64_t)v48);
      v17 = (id)objc_claimAutoreleasedReturnValue(v49);
    }
LABEL_23:
    v16 = 0;
    goto LABEL_24;
  }
  v55 = 0;
  v16 = -[MIMCMContainer _doInitWithContainer:error:](v10, "_doInitWithContainer:error:", single_result, &v55);
  v17 = v55;
LABEL_24:
  container_free_object(v13, v9);
  container_query_free(v14);
  if (a5 && (v16 & 1) == 0)
    *a5 = objc_retainAutorelease(v17);

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  container_free_object(self->_mcmContainer, a2);
  v3.receiver = self;
  v3.super_class = (Class)MIMCMContainer;
  -[MIMCMContainer dealloc](&v3, "dealloc");
}

- (id)serializedContainerRepresentation
{
  uint64_t v2;
  uint64_t v4;

  v4 = 0;
  v2 = container_serialize_copy_serialized_reference(-[MIMCMContainer mcmContainer](self, "mcmContainer"), &v4);
  return (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v2, v4, 1));
}

- (id)description
{
  uint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_opt_class(self);
  -[MIMCMContainer mcmContainer](self, "mcmContainer");
  v4 = sub_10000379C();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIMCMContainer personaUniqueString](self, "personaUniqueString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIMCMContainer containerURL](self, "containerURL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ container=%@ persona=%@ path=%@>"), v3, v5, v6, v8));

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  MIMCMContainer *v4;
  MIMCMContainer *v5;
  container_object_s *v6;
  container_object_s *v7;
  char is_equal;

  v4 = (MIMCMContainer *)a3;
  if (v4 == self)
  {
    is_equal = 1;
  }
  else
  {
    objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4) & 1) != 0)
    {
      v5 = v4;
      v6 = -[MIMCMContainer mcmContainer](self, "mcmContainer");
      v7 = -[MIMCMContainer mcmContainer](v5, "mcmContainer");

      is_equal = container_is_equal(v6, v7);
    }
    else
    {
      is_equal = 0;
    }
  }

  return is_equal;
}

- (BOOL)_refreshContainerMetadataWithError:(id *)a3
{
  uint64_t path;
  NSURL *v6;
  void *v7;
  id v8;
  void *v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSURL *containerURL;
  uint64_t is_transient;
  BOOL v17;
  uint64_t v18;
  uint64_t error_description;
  uint64_t v20;
  const char *v21;
  id v22;
  uint64_t v23;
  BOOL v25;

  -[MIMCMContainer mcmContainer](self, "mcmContainer");
  path = container_get_path();
  if (path)
  {
    v6 = (NSURL *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", path, 1, 0));
    v7 = 0;
    v8 = 0;
    if (v6)
      goto LABEL_6;
  }
  else
  {
    v9 = (void *)MIInstallerErrorDomain;
    v10 = sub_10000379C();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v13 = sub_100010E50((uint64_t)"_ContainerURL", 87, v9, 4, 0, 0, CFSTR("Failed to fetch container URL from %@"), v12, (uint64_t)v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v13);

  }
  v8 = objc_retainAutorelease(v7);

  v6 = 0;
LABEL_6:
  v14 = v8;
  containerURL = self->_containerURL;
  self->_containerURL = v6;

  if (self->_containerURL)
  {
    v25 = 0;
    is_transient = container_is_transient(-[MIMCMContainer mcmContainer](self, "mcmContainer"), &v25);
    if (is_transient == 1)
    {
      self->_isTransient = v25;
      v17 = 1;
      goto LABEL_15;
    }
    v18 = is_transient;
    error_description = container_get_error_description(is_transient);
    v21 = "(container_get_error_description returned NULL)";
    if (error_description)
      v21 = (const char *)error_description;
    v22 = sub_100010E24((uint64_t)"-[MIMCMContainer _refreshContainerMetadataWithError:]", 277, MIContainerManagerErrorDomain, v18, 0, 0, CFSTR("%s"), v20, (uint64_t)v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);

    v14 = (id)v23;
  }
  if (a3)
  {
    v14 = objc_retainAutorelease(v14);
    v17 = 0;
    *a3 = v14;
  }
  else
  {
    v17 = 0;
  }
LABEL_15:

  return v17;
}

- (BOOL)reclaimDiskSpaceWithError:(id *)a3
{
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t type;
  int posix_errno;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;

  v4 = container_operation_delete_reclaim_disk_space(self, a2);
  if (v4)
  {
    v5 = sub_1000110E8();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)MIContainerManagerErrorDomain;
    type = container_error_get_type(v4);
    posix_errno = container_error_get_posix_errno(v4);
    if (posix_errno)
    {
      v10 = posix_errno;
      v11 = strerror(posix_errno);
      v13 = sub_100010E24((uint64_t)"-[MIMCMContainer reclaimDiskSpaceWithError:]", 298, NSPOSIXErrorDomain, v10, 0, 0, CFSTR("Underlying errno set by container manager is %s"), v12, (uint64_t)v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    }
    else
    {
      v14 = 0;
    }
    v16 = sub_1000035A8();
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v19 = sub_100010E24((uint64_t)"-[MIMCMContainer reclaimDiskSpaceWithError:]", 298, v7, type, v14, v17, CFSTR("%@"), v18, (uint64_t)v6);
    v15 = (id)objc_claimAutoreleasedReturnValue(v19);

    container_error_free(v4);
    if (a3)
    {
      v15 = objc_retainAutorelease(v15);
      *a3 = v15;
    }
  }
  else
  {
    container_error_free(0);
    v15 = 0;
  }

  return v4 == 0;
}

- (BOOL)regenerateDirectoryUUIDWithError:(id *)a3
{
  uint64_t v5;
  BOOL v6;
  id v7;
  uint64_t v8;
  uint64_t error_description;
  uint64_t v10;
  const char *v11;
  id v12;
  id v14;

  v5 = container_regenerate_uuid(-[MIMCMContainer mcmContainer](self, "mcmContainer"));
  if (v5 == 1)
  {
    v14 = 0;
    v6 = -[MIMCMContainer _refreshContainerMetadataWithError:](self, "_refreshContainerMetadataWithError:", &v14);
    v7 = v14;
    if (!a3)
      goto LABEL_9;
    goto LABEL_7;
  }
  v8 = v5;
  error_description = container_get_error_description(v5);
  v11 = "(container_get_error_description returned NULL)";
  if (error_description)
    v11 = (const char *)error_description;
  v12 = sub_100010E24((uint64_t)"-[MIMCMContainer regenerateDirectoryUUIDWithError:]", 321, MIContainerManagerErrorDomain, v8, 0, 0, CFSTR("%s"), v10, (uint64_t)v11);
  v7 = (id)objc_claimAutoreleasedReturnValue(v12);
  v6 = 0;
  if (a3)
  {
LABEL_7:
    if (!v6)
      *a3 = objc_retainAutorelease(v7);
  }
LABEL_9:

  return v6;
}

- (unint64_t)diskUsage
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t error_description;
  uint64_t v7;
  const char *v8;
  id v9;
  void *v11;
  uint64_t v12;

  v12 = 1;
  v3 = container_disk_usage(-[MIMCMContainer mcmContainer](self, "mcmContainer"), &v12);
  if (v12 != 1)
  {
    v4 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIMCMContainer identifier](self, "identifier"));
      -[MIMCMContainer containerClass](self, "containerClass");
      error_description = container_get_error_description(v12);
      v8 = "(container_get_error_description returned NULL)";
      if (error_description)
        v8 = (const char *)error_description;
      v9 = sub_100010E24((uint64_t)"-[MIMCMContainer diskUsage]", 347, MIContainerManagerErrorDomain, v12, 0, 0, CFSTR("%s"), v7, (uint64_t)v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v9);
      MOLogWrite(v4, 3, "-[MIMCMContainer diskUsage]", CFSTR("Error getting disk usage for %@ (%ld): %@"));

    }
  }
  return v3;
}

- (BOOL)purgeContentWithError:(id *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = container_delete_all_container_content(-[MIMCMContainer mcmContainer](self, "mcmContainer"));
  if (v5 == 1)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)MIContainerManagerErrorDomain;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIMCMContainer identifier](self, "identifier"));
    v10 = sub_100010E50((uint64_t)"-[MIMCMContainer purgeContentWithError:]", 361, v7, v5, 0, 0, CFSTR("Failed to wipe container for identifier %@"), v9, (uint64_t)v8);
    v6 = (id)objc_claimAutoreleasedReturnValue(v10);

    if (a3)
    {
      v6 = objc_retainAutorelease(v6);
      *a3 = v6;
    }
  }

  return v5 == 1;
}

- (BOOL)replaceExistingContainer:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  id v12;
  uint64_t v13;
  uint64_t error_description;
  uint64_t v15;
  const char *v16;
  id v17;
  void *v19;
  id v20;

  v6 = a3;
  if ((id)-[MIMCMContainer containerClass](self, "containerClass") == (id)1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MITestManager sharedInstance](MITestManager, "sharedInstance"));
    if ((objc_msgSend(v7, "testFlagsAreSet:", 64) & 1) != 0)
    {
      v8 = -[MIMCMContainer isTransient](self, "isTransient");

      if (v8)
      {
        v9 = qword_10009E048;
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[MIMCMContainer identifier](self, "identifier"));
          MOLogWrite(v9, 3, "-[MIMCMContainer replaceExistingContainer:error:]", CFSTR("Exiting before replacing transient bundle container: %@"));

        }
        exit(1);
      }
    }
    else
    {

    }
  }
  v10 = container_replace(objc_msgSend(v6, "mcmContainer"), -[MIMCMContainer mcmContainer](self, "mcmContainer"), 0);
  if (v10 == 1)
  {
    -[MIMCMContainer setIsTransient:](self, "setIsTransient:", 0);
    v20 = 0;
    v11 = -[MIMCMContainer _refreshContainerMetadataWithError:](self, "_refreshContainerMetadataWithError:", &v20);
    v12 = v20;
    if (!a4)
      goto LABEL_17;
    goto LABEL_15;
  }
  v13 = v10;
  error_description = container_get_error_description(v10);
  v16 = "(container_get_error_description returned NULL)";
  if (error_description)
    v16 = (const char *)error_description;
  v17 = sub_100010E24((uint64_t)"-[MIMCMContainer replaceExistingContainer:error:]", 390, MIContainerManagerErrorDomain, v13, 0, 0, CFSTR("%s"), v15, (uint64_t)v16);
  v12 = (id)objc_claimAutoreleasedReturnValue(v17);
  v11 = 0;
  if (a4)
  {
LABEL_15:
    if (!v11)
      *a4 = objc_retainAutorelease(v12);
  }
LABEL_17:

  return v11;
}

- (BOOL)setInfoValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  container_object_s *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t error_description;
  uint64_t v17;
  const char *v18;
  id v19;

  v8 = a4;
  v9 = a3;
  v10 = -[MIMCMContainer mcmContainer](self, "mcmContainer");
  v11 = objc_retainAutorelease(v8);
  v12 = objc_msgSend(v11, "UTF8String");

  v13 = (void *)_CFXPCCreateXPCObjectFromCFObject(v9);
  v14 = container_set_info_value(v10, v12, v13);

  if (v14 == 1)
  {
    v15 = 0;
  }
  else
  {
    error_description = container_get_error_description(v14);
    v18 = "(container_get_error_description returned NULL)";
    if (error_description)
      v18 = (const char *)error_description;
    v19 = sub_100010E24((uint64_t)"-[MIMCMContainer setInfoValue:forKey:error:]", 420, MIContainerManagerErrorDomain, v14, 0, 0, CFSTR("%s"), v17, (uint64_t)v18);
    v15 = (id)objc_claimAutoreleasedReturnValue(v19);
    if (a5)
    {
      v15 = objc_retainAutorelease(v15);
      *a5 = v15;
    }
  }

  return v14 == 1;
}

- (id)infoValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  container_object_s *v7;
  id v8;
  uint64_t info_value_for_key;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t error_description;
  uint64_t v17;
  const char *v18;
  id v19;
  void *v20;
  id v21;

  v6 = a3;
  v7 = -[MIMCMContainer mcmContainer](self, "mcmContainer");
  v8 = objc_retainAutorelease(v6);
  info_value_for_key = container_get_info_value_for_key(v7, objc_msgSend(v8, "UTF8String"));
  v10 = objc_claimAutoreleasedReturnValue(info_value_for_key);
  v11 = (void *)v10;
  if (v10)
  {
    v12 = _CFXPCCreateCFObjectFromXPCObject(v10);
    if (v12)
    {
      v14 = (void *)v12;
      v15 = 0;
      goto LABEL_11;
    }
    v21 = sub_100010E50((uint64_t)"-[MIMCMContainer infoValueForKey:error:]", 446, MIInstallerErrorDomain, 4, 0, 0, CFSTR("Failed to retrieve value for key %@ from the underlying xpc object"), v13, (uint64_t)v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v21);
  }
  else
  {
    error_description = container_get_error_description(24);
    v18 = "(container_get_error_description returned NULL)";
    if (error_description)
      v18 = (const char *)error_description;
    v19 = sub_100010E24((uint64_t)"-[MIMCMContainer infoValueForKey:error:]", 440, MIContainerManagerErrorDomain, 24, 0, 0, CFSTR("%s"), v17, (uint64_t)v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  }
  v15 = v20;
  if (a4)
  {
    v15 = objc_retainAutorelease(v20);
    v14 = 0;
    *a4 = v15;
  }
  else
  {
    v14 = 0;
  }
LABEL_11:

  return v14;
}

- (BOOL)recreateDefaultStructureWithError:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t error_description;
  uint64_t v8;
  const char *v9;
  id v10;

  v4 = container_recreate_structure(-[MIMCMContainer mcmContainer](self, "mcmContainer"));
  v5 = v4;
  if (v4 == 1)
  {
    v6 = 0;
  }
  else
  {
    error_description = container_get_error_description(v4);
    v9 = "(container_get_error_description returned NULL)";
    if (error_description)
      v9 = (const char *)error_description;
    v10 = sub_100010E24((uint64_t)"-[MIMCMContainer recreateDefaultStructureWithError:]", 465, MIContainerManagerErrorDomain, v5, 0, 0, CFSTR("%s"), v8, (uint64_t)v9);
    v6 = (id)objc_claimAutoreleasedReturnValue(v10);
    if (a3)
    {
      v6 = objc_retainAutorelease(v6);
      *a3 = v6;
    }
  }

  return v5 == 1;
}

+ (id)_enumeratorWithContainerClass:(unint64_t)a3 forPersona:(id)a4 isTransient:(BOOL)a5 identifiers:(id)a6 groupIdentifiers:(id)a7 create:(BOOL)a8 usingBlock:(id)a9
{
  _BOOL4 v9;
  _BOOL8 v12;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  xpc_object_t v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  xpc_object_t v26;
  xpc_object_t v27;
  id v28;
  id v29;
  uint64_t v30;
  void *j;
  xpc_object_t v32;
  char iterate_results_sync;
  char v34;
  uint64_t last_error;
  __CFString *v36;
  void *v37;
  uint64_t type;
  int posix_errno;
  int v40;
  char *v41;
  uint64_t v42;
  id v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  id v53;
  id v56;
  _QWORD v57[4];
  id v58;
  uint64_t *v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  _BYTE v75[128];
  _BYTE v76[128];

  v9 = a8;
  v12 = a5;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v56 = a9;
  v69 = 0;
  v70 = &v69;
  v71 = 0x3032000000;
  v72 = sub_10000481C;
  v73 = sub_10000482C;
  v74 = 0;
  v17 = container_query_create();
  v19 = v17;
  if (!v17)
  {
    v45 = sub_100010E50((uint64_t)"+[MIMCMContainer _enumeratorWithContainerClass:forPersona:isTransient:identifiers:groupIdentifiers:create:usingBlock:]", 487, MIContainerManagerErrorDomain, 110, 0, 0, CFSTR("Failed to create container query for querying containers for identifier: %@ groupIdentifiers: %@ containerType: %llu"), v18, (uint64_t)v15);
    v46 = objc_claimAutoreleasedReturnValue(v45);
    v47 = (void *)v70[5];
    v70[5] = v46;
LABEL_35:

    goto LABEL_36;
  }
  if (v9)
    v20 = 0x300000001;
  else
    v20 = 0x300000000;
  container_query_operation_set_flags(v17, v20);
  container_query_set_transient(v19, v12);
  container_query_set_class(v19, a3);
  container_query_set_include_other_owners(v19, 1);
  if (v16)
  {
    v21 = xpc_array_create(0, 0);
    v67 = 0u;
    v68 = 0u;
    v66 = 0u;
    v65 = 0u;
    v22 = v16;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(_QWORD *)v66 != v24)
            objc_enumerationMutation(v22);
          v26 = xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i)), "UTF8String"));
          xpc_array_append_value(v21, v26);

        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
      }
      while (v23);
    }

    container_query_set_group_identifiers(v19, v21);
  }
  if (v15)
  {
    v27 = xpc_array_create(0, 0);
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v28 = v15;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v62;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(_QWORD *)v62 != v30)
            objc_enumerationMutation(v28);
          v32 = xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)j)), "UTF8String"));
          xpc_array_append_value(v27, v32);

        }
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
      }
      while (v29);
    }

    container_query_set_identifiers(v19, v27);
  }
  if (v14)
    container_query_set_persona_unique_string(v19, objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_100004834;
  v57[3] = &unk_100084D38;
  v60 = a1;
  v58 = v56;
  v59 = &v69;
  iterate_results_sync = container_query_iterate_results_sync(v19, v57);

  if (v70[5])
    v34 = 1;
  else
    v34 = iterate_results_sync;
  if ((v34 & 1) == 0)
  {
    last_error = container_query_get_last_error(v19);
    if (last_error)
    {
      v36 = sub_1000110E8();
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      type = container_error_get_type(last_error);
      posix_errno = container_error_get_posix_errno(last_error);
      v40 = posix_errno;
      if (posix_errno)
      {
        v41 = strerror(posix_errno);
        v43 = sub_100010E24((uint64_t)"+[MIMCMContainer _enumeratorWithContainerClass:forPersona:isTransient:identifiers:groupIdentifiers:create:usingBlock:]", 549, NSPOSIXErrorDomain, v40, 0, 0, CFSTR("Underlying errno set by container manager is %s"), v42, (uint64_t)v41);
        v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
      }
      else
      {
        v44 = 0;
      }
      v48 = sub_1000035A8();
      v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
      v51 = sub_100010E24((uint64_t)"+[MIMCMContainer _enumeratorWithContainerClass:forPersona:isTransient:identifiers:groupIdentifiers:create:usingBlock:]", 549, MIContainerManagerErrorDomain, type, v44, v49, CFSTR("%@"), v50, (uint64_t)v37);
      v52 = objc_claimAutoreleasedReturnValue(v51);

      v47 = (void *)v70[5];
      v70[5] = v52;
      goto LABEL_35;
    }
  }
LABEL_36:
  container_query_free(v19);
  v53 = (id)v70[5];
  _Block_object_dispose(&v69, 8);

  return v53;
}

+ (id)enumerateContainersWithClass:(unint64_t)a3 forPersona:(id)a4 isTransient:(BOOL)a5 identifiers:(id)a6 groupIdentifiers:(id)a7 usingBlock:(id)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v10 = a5;
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a4;
  v18 = objc_msgSend((id)objc_opt_class(a1), "_enumeratorWithContainerClass:forPersona:isTransient:identifiers:groupIdentifiers:create:usingBlock:", a3, v17, v10, v16, v15, 0, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  return v19;
}

+ (id)_allContainersForIdentifiers:(id)a3 groupIdentifiers:(id)a4 contentClass:(unint64_t)a5 forPersona:(id)a6 transient:(BOOL)a7 create:(BOOL)a8 error:(id *)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  NSMutableArray *v29;

  v9 = a8;
  v10 = a7;
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_10000481C;
  v28 = sub_10000482C;
  v29 = objc_opt_new(NSMutableArray);
  v23[1] = 3221225472;
  v23[2] = sub_100004B74;
  v23[3] = &unk_100084D60;
  v23[4] = &v24;
  v23[0] = _NSConcreteStackBlock;
  v18 = objc_msgSend((id)objc_opt_class(a1), "_enumeratorWithContainerClass:forPersona:isTransient:identifiers:groupIdentifiers:create:usingBlock:", a5, v17, v10, v15, v16, v9, v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  if (v19)
  {
    v20 = (void *)v25[5];
    v25[5] = 0;

    if (a9)
      *a9 = objc_retainAutorelease(v19);
  }
  v21 = objc_msgSend((id)v25[5], "copy");

  _Block_object_dispose(&v24, 8);
  return v21;
}

+ (id)_containerForIdentifier:(id)a3 contentClass:(unint64_t)a4 forPersona:(id)a5 transient:(BOOL)a6 create:(BOOL)a7 error:(id *)a8
{
  _BOOL4 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  xpc_object_t v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t single_result;
  id v28;
  uint64_t last_error;
  uint64_t v30;
  __CFString *v31;
  void *v32;
  void *v33;
  uint64_t type;
  int posix_errno;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  id v44;
  uint64_t error_description;
  uint64_t v47;
  const char *v48;
  id v49;
  id v50;

  v9 = a7;
  v10 = a6;
  v14 = a3;
  v15 = a5;
  v18 = v15;
  if (!v15)
  {
    v15 = (id)qword_10009E048;
    if (qword_10009E048)
    {
      if (*(int *)(qword_10009E048 + 44) >= 7)
        v15 = (id)MOLogWrite(qword_10009E048, 7, "+[MIMCMContainer _containerForIdentifier:contentClass:forPersona:transient:create:error:]", CFSTR("Container query for %@ create: %d transient: %d with nil persona"));
    }
  }
  v19 = container_query_create(v15, v16, v17);
  v21 = v19;
  if (!v19)
  {
    v24 = sub_100010E50((uint64_t)"+[MIMCMContainer _containerForIdentifier:contentClass:forPersona:transient:create:error:]", 594, MIContainerManagerErrorDomain, 110, 0, 0, CFSTR("Failed to create container query for querying containers for identifier %@"), v20, (uint64_t)v14);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    goto LABEL_12;
  }
  if (v9)
    v22 = 0x300000001;
  else
    v22 = 0x300000000;
  container_query_operation_set_flags(v19, v22);
  container_query_set_class(v21, a4);
  container_query_set_transient(v21, v10);
  container_query_set_include_other_owners(v21, 1);
  v23 = xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
  if (a4 == 7)
    container_query_set_group_identifiers(v21, v23);
  else
    container_query_set_identifiers(v21, v23);

  if (v18)
    container_query_set_persona_unique_string(v21, objc_msgSend(objc_retainAutorelease(v18), "UTF8String"));
  single_result = container_query_get_single_result(v21);
  if (!single_result)
  {
    last_error = container_query_get_last_error(v21);
    if (last_error)
    {
      v30 = last_error;
      v31 = sub_1000110E8();
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      v33 = (void *)MIContainerManagerErrorDomain;
      type = container_error_get_type(v30);
      posix_errno = container_error_get_posix_errno(v30);
      if (posix_errno)
      {
        v36 = posix_errno;
        v37 = strerror(posix_errno);
        v39 = sub_100010E24((uint64_t)"+[MIMCMContainer _containerForIdentifier:contentClass:forPersona:transient:create:error:]", 621, NSPOSIXErrorDomain, v36, 0, 0, CFSTR("Underlying errno set by container manager is %s"), v38, (uint64_t)v37);
        v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      }
      else
      {
        v40 = 0;
      }
      v41 = sub_1000035A8();
      v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
      v44 = sub_100010E24((uint64_t)"+[MIMCMContainer _containerForIdentifier:contentClass:forPersona:transient:create:error:]", 621, v33, type, v40, v42, CFSTR("%@"), v43, (uint64_t)v32);
      v26 = (id)objc_claimAutoreleasedReturnValue(v44);

      goto LABEL_25;
    }
    if (v9)
    {
      v28 = 0;
      v26 = 0;
      goto LABEL_26;
    }
    error_description = container_get_error_description(21);
    v48 = "(container_get_error_description returned NULL)";
    if (error_description)
      v48 = (const char *)error_description;
    v49 = sub_100010E24((uint64_t)"+[MIMCMContainer _containerForIdentifier:contentClass:forPersona:transient:create:error:]", 623, MIContainerManagerErrorDomain, 21, 0, 0, CFSTR("%s"), v47, (uint64_t)v48);
    v25 = objc_claimAutoreleasedReturnValue(v49);
LABEL_12:
    v26 = (id)v25;
LABEL_25:
    v28 = 0;
    goto LABEL_26;
  }
  v50 = 0;
  v28 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithContainer:error:", single_result, &v50);
  v26 = v50;
LABEL_26:
  if (a8 && !v28)
    *a8 = objc_retainAutorelease(v26);
  container_query_free(v21);

  return v28;
}

+ (id)containersForContentClass:(unint64_t)a3 forPersona:(id)a4 fetchTransient:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;

  v7 = a5;
  v10 = a4;
  v11 = objc_msgSend((id)objc_opt_class(a1), "_allContainersForIdentifiers:groupIdentifiers:contentClass:forPersona:transient:create:error:", 0, 0, a3, v10, v7, 0, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  return v12;
}

+ (id)containersForGroupIdentifier:(id)a3 forPersona:(id)a4 create:(BOOL)a5 fetchTransient:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;

  v8 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_class(a1);
  v17 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_allContainersForIdentifiers:groupIdentifiers:contentClass:forPersona:transient:create:error:", 0, v14, 7, v11, 0, v8, a7));
  return v15;
}

+ (id)containersForBundleIdentifier:(id)a3 contentClass:(unint64_t)a4 forPersona:(id)a5 create:(BOOL)a6 fetchTransient:(BOOL)a7 error:(id *)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;

  v9 = a7;
  v10 = a6;
  v14 = a5;
  v15 = a3;
  v16 = (void *)objc_opt_class(a1);
  v20 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_allContainersForIdentifiers:groupIdentifiers:contentClass:forPersona:transient:create:error:", v17, 0, a4, v14, v9, v10, a8));
  return v18;
}

+ (id)containerForIdentifier:(id)a3 contentClass:(unint64_t)a4 forPersona:(id)a5 create:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;

  v8 = a6;
  v12 = a5;
  v13 = a3;
  v14 = objc_msgSend((id)objc_opt_class(a1), "_containerForIdentifier:contentClass:forPersona:transient:create:error:", v13, a4, v12, 0, v8, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  return v15;
}

+ (id)transientContainerForIdentifier:(id)a3 contentClass:(unint64_t)a4 forPersona:(id)a5 create:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;

  v8 = a6;
  v12 = a5;
  v13 = a3;
  v14 = objc_msgSend((id)objc_opt_class(a1), "_containerForIdentifier:contentClass:forPersona:transient:create:error:", v13, a4, v12, 1, v8, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  return v15;
}

+ (BOOL)deleteContainers:(id)a3 waitForDeletion:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  uint64_t v18;
  id v19;
  BOOL v20;
  id v21;
  __CFString *v22;
  void *v23;
  void *v24;
  uint64_t type;
  int posix_errno;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE v45[128];

  v6 = a4;
  v7 = a3;
  v43 = 0;
  v44 = 0;
  v8 = objc_msgSend(v7, "count");
  v10 = malloc_type_calloc((size_t)v8, 8uLL, 0x2004093837F09uLL);
  if (!v10)
  {
    v21 = sub_100010E50((uint64_t)"+[MIMCMContainer deleteContainers:waitForDeletion:error:]", 677, MIInstallerErrorDomain, 4, 0, 0, CFSTR("Failed to allocate memory for deleting containers"), v9, v38);
    v19 = (id)objc_claimAutoreleasedReturnValue(v21);
    if (!a5)
      goto LABEL_17;
    goto LABEL_20;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v40 != v15)
          objc_enumerationMutation(v11);
        v10[v14 + (_QWORD)i] = objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i), "mcmContainer");
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      v14 += (uint64_t)i;
    }
    while (v13);
  }

  v17 = container_operation_delete_array(v10, v8, v6, &v44, &v43);
  if (!v17)
  {
    if (v43)
    {
      v22 = sub_1000110E8();
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v24 = (void *)MIContainerManagerErrorDomain;
      type = container_error_get_type(v43);
      posix_errno = container_error_get_posix_errno(v43);
      if (posix_errno)
      {
        v27 = posix_errno;
        v28 = strerror(posix_errno);
        v30 = sub_100010E24((uint64_t)"+[MIMCMContainer deleteContainers:waitForDeletion:error:]", 693, NSPOSIXErrorDomain, v27, 0, 0, CFSTR("Underlying errno set by container manager is %s"), v29, (uint64_t)v28);
        v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      }
      else
      {
        v31 = 0;
      }
      v33 = sub_1000035A8();
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      v36 = sub_100010E24((uint64_t)"+[MIMCMContainer deleteContainers:waitForDeletion:error:]", 693, v24, type, v31, v34, CFSTR("%@"), v35, (uint64_t)v23);
      v19 = (id)objc_claimAutoreleasedReturnValue(v36);

      container_error_free(v43);
      if (a5)
        goto LABEL_20;
LABEL_17:
      v20 = 0;
      goto LABEL_21;
    }
    v32 = sub_100010E50((uint64_t)"+[MIMCMContainer deleteContainers:waitForDeletion:error:]", 696, MIContainerManagerErrorDomain, 38, 0, 0, CFSTR("container_operation_delete_array returned NULL but did not set an error"), v18, v38);
    v19 = (id)objc_claimAutoreleasedReturnValue(v32);
    if (!a5)
      goto LABEL_17;
LABEL_20:
    v19 = objc_retainAutorelease(v19);
    v20 = 0;
    *a5 = v19;
    goto LABEL_21;
  }
  container_free_array_of_containers(v17, v44);
  v19 = 0;
  v20 = 1;
LABEL_21:
  free(v10);

  return v20;
}

+ (id)defaultDirectoriesForContainerType:(unint64_t)a3 error:(id *)a4
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t error_description;
  uint64_t v13;
  const char *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v19;

  v19 = 1;
  v6 = container_subdirectories_for_class(a3, &v19);
  v7 = (void *)v6;
  if (!v6)
  {
    error_description = container_get_error_description(v19);
    v14 = "(container_get_error_description returned NULL)";
    if (error_description)
      v14 = (const char *)error_description;
    v15 = sub_100010E24((uint64_t)"+[MIMCMContainer defaultDirectoriesForContainerType:error:]", 722, MIContainerManagerErrorDomain, v19, 0, 0, CFSTR("%s"), v13, (uint64_t)v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v9 = 0;
LABEL_9:
    v10 = 0;
    if (!a4)
      goto LABEL_12;
    goto LABEL_10;
  }
  v9 = (void *)_CFXPCCreateCFObjectFromXPCObject(v6);
  if (!v9)
  {
    v16 = sub_100010E50((uint64_t)"+[MIMCMContainer defaultDirectoriesForContainerType:error:]", 728, MIInstallerErrorDomain, 4, 0, 0, CFSTR("Failed to retrieve container subdirectories for class %llu"), v8, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v16);
    goto LABEL_9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v9));
  v11 = 0;
  if (!a4)
    goto LABEL_12;
LABEL_10:
  if (!v10)
    *a4 = objc_retainAutorelease(v11);
LABEL_12:
  v17 = v10;

  return v17;
}

- (NSURL)containerURL
{
  return self->_containerURL;
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (BOOL)isTransient
{
  return self->_isTransient;
}

- (void)setIsTransient:(BOOL)a3
{
  self->_isTransient = a3;
}

- (BOOL)isNew
{
  return self->_isNew;
}

- (container_object_s)mcmContainer
{
  return self->_mcmContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_containerURL, 0);
}

@end
