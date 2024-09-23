@implementation STContainer

- (STContainer)initWithLibsystemContainer:(container_object_s *)a3
{
  STContainer *v3;
  uint64_t v4;
  NSString *identifier;
  uint64_t v6;
  NSURL *url;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STContainer;
  v3 = -[STContainer init](&v9, sel_init);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", container_get_identifier());
    v4 = objc_claimAutoreleasedReturnValue();
    identifier = v3->_identifier;
    v3->_identifier = (NSString *)v4;

    v3->_containerClass = container_get_class();
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", container_get_path(), 1, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    url = v3->_url;
    v3->_url = (NSURL *)v6;

    v3->_container = (container_object_s *)container_copy_object();
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  MEMORY[0x212BA7068](self->_container, a2);
  v3.receiver = self;
  v3.super_class = (Class)STContainer;
  -[STContainer dealloc](&v3, sel_dealloc);
}

- (unint64_t)diskUsageWithError:(id *)a3
{
  return container_disk_usage();
}

+ (id)containersWithClass:(unint64_t)a3 personaUniqueString:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  void *v12;

  v4 = (void *)MEMORY[0x24BDBCEB8];
  v5 = a4;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  container_query_create();
  container_query_set_class();
  container_query_set_include_other_owners();
  v7 = objc_retainAutorelease(v5);
  objc_msgSend(v7, "UTF8String");

  container_query_set_persona_unique_string();
  container_query_operation_set_flags();
  v11 = MEMORY[0x24BDAC760];
  v8 = v6;
  v12 = v8;
  if ((container_query_iterate_results_sync() & 1) == 0)
  {

    v8 = 0;
  }
  container_query_free();
  v9 = (void *)objc_msgSend(v8, "copy", v11, 3221225472, __55__STContainer_containersWithClass_personaUniqueString___block_invoke, &unk_24C760140);

  return v9;
}

uint64_t __55__STContainer_containersWithClass_personaUniqueString___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "initWithLibsystemContainer:", a2);
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return 1;
}

+ (STContainer)containerWithIdentifier:(id)a3 containerClass:(unint64_t)a4 personaUniqueString:(id)a5
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  xpc_object_t v11;
  id v12;
  uint64_t single_result;
  void *v14;

  v7 = a5;
  v8 = a3;
  container_query_create();
  v9 = objc_retainAutorelease(v8);
  v10 = (const char *)objc_msgSend(v9, "UTF8String");

  v11 = xpc_string_create(v10);
  container_query_set_identifiers();

  container_query_set_class();
  container_query_set_include_other_owners();
  v12 = objc_retainAutorelease(v7);
  objc_msgSend(v12, "UTF8String");

  container_query_set_persona_unique_string();
  container_query_operation_set_flags();
  single_result = container_query_get_single_result();
  if (single_result)
    v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLibsystemContainer:", single_result);
  else
    v14 = 0;
  container_query_free();
  return (STContainer *)v14;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
