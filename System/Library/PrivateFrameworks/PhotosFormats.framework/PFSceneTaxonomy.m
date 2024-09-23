@implementation PFSceneTaxonomy

- (PFSceneTaxonomyNode)rootNode
{
  return -[PFSceneTaxonomyNode initWithNodeRef:taxonomy:]([PFSceneTaxonomyNode alloc], "initWithNodeRef:taxonomy:", -[PFSceneTaxonomy rootNodeRef](self, "rootNodeRef"), self);
}

- (id)nodeForSceneClassId:(unsigned int)a3
{
  return -[PFSceneTaxonomy nodeForExtendedSceneClassId:](self, "nodeForExtendedSceneClassId:", a3);
}

- (id)nodeForExtendedSceneClassId:(unint64_t)a3
{
  PFSceneTaxonomyNode *v4;

  v4 = -[PFSceneTaxonomy nodeRefForExtendedSceneClassId:](self, "nodeRefForExtendedSceneClassId:", a3);
  if (v4)
    v4 = -[PFSceneTaxonomyNode initWithNodeRef:taxonomy:]([PFSceneTaxonomyNode alloc], "initWithNodeRef:taxonomy:", v4, self);
  return v4;
}

- (id)nodeForName:(id)a3
{
  PFSceneTaxonomyNode *v4;

  v4 = -[PFSceneTaxonomy nodeRefForName:](self, "nodeRefForName:", a3);
  if (v4)
    v4 = -[PFSceneTaxonomyNode initWithNodeRef:taxonomy:]([PFSceneTaxonomyNode alloc], "initWithNodeRef:taxonomy:", v4, self);
  return v4;
}

+ (id)sharedTaxonomy
{
  if (sharedTaxonomy_onceToken[0] != -1)
    dispatch_once(sharedTaxonomy_onceToken, &__block_literal_global_6354);
  return (id)sharedTaxonomy_sharedTaxonomy;
}

void __48__PFSceneTaxonomy_Compatibility__sharedTaxonomy__block_invoke()
{
  PFSceneTaxonomy *v0;
  void *v1;
  uint8_t v2[16];

  v0 = objc_alloc_init(PFSceneTaxonomy);
  v1 = (void *)sharedTaxonomy_sharedTaxonomy;
  sharedTaxonomy_sharedTaxonomy = (uint64_t)v0;

  if (!sharedTaxonomy_sharedTaxonomy && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error creating PFSceneTaxonomy.sharedTaxonomy", v2, 2u);
  }
}

- (PFSceneTaxonomy)initWithLatestTaxonomy
{
  if (-[PFSceneTaxonomy initWithLatestTaxonomy]::onceToken[0] != -1)
    dispatch_once(-[PFSceneTaxonomy initWithLatestTaxonomy]::onceToken, &__block_literal_global_6482);
  return -[PFSceneTaxonomy initWithIdentifier:error:](self, "initWithIdentifier:error:", -[PFSceneTaxonomy initWithLatestTaxonomy]::identifier, 0);
}

- (PFSceneTaxonomy)initWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  PFSceneTaxonomy *v12;
  int v14;
  const __CFString *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    LOWORD(v14) = 0;
    _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not obtain the bundle containing the scene taxonomy", (uint8_t *)&v14, 2u);
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringForKey:", CFSTR("PFSceneTaxonomyData"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "fileExistsAtPath:", v9);

    if (!v11)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v14 = 138412546;
        v15 = CFSTR("PFSceneTaxonomyData");
        v16 = 2112;
        v17 = v9;
        _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "error locating custom scene taxonomy from user default %@: %@; fallbacking back to default taxonomy",
          (uint8_t *)&v14,
          0x16u);
      }

      v9 = 0;
      if (v7)
        goto LABEL_9;
LABEL_13:

      v12 = 0;
      goto LABEL_14;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v14 = 138412546;
      v15 = CFSTR("PFSceneTaxonomyData");
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "using custom scene taxonomy from user default %@: %@", (uint8_t *)&v14, 0x16u);
    }
  }
  if (!v7)
    goto LABEL_13;
LABEL_9:
  v12 = -[PFSceneTaxonomy initWithDataPath:identifier:localizationBundle:tableName:error:](self, "initWithDataPath:identifier:localizationBundle:tableName:error:", v9, v6, v7, CFSTR("scenetaxonomy"), a4);
LABEL_14:

  return v12;
}

- (PFSceneTaxonomy)initWithDataPath:(id)a3 localizationBundle:(id)a4 tableName:(id)a5
{
  return -[PFSceneTaxonomy initWithDataPath:identifier:localizationBundle:tableName:error:](self, "initWithDataPath:identifier:localizationBundle:tableName:error:", a3, 0, a4, a5, 0);
}

- (PFSceneTaxonomy)initWithDataPath:(id)a3 identifier:(id)a4 localizationBundle:(id)a5 tableName:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  PFSceneTaxonomy *v17;
  PFSceneTaxonomy *v18;
  void *v19;
  char v20;
  uint64_t v21;
  NSString *identifier;
  uint64_t v23;
  NSString *dataPath;
  uint64_t v25;
  NSString *tableName;
  void *v27;
  int v28;
  void *v30;
  objc_super v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!v13)
  {
LABEL_4:
    v31.receiver = self;
    v31.super_class = (Class)PFSceneTaxonomy;
    v17 = -[PFSceneTaxonomy init](&v31, sel_init);
    v18 = v17;
    if (v17)
    {
      +[PFSceneTaxonomy latestTaxonomyIdentifier](PFSceneTaxonomy, "latestTaxonomyIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v13, "isEqualToString:", v19);

      if ((v20 & 1) == 0)
      {
        v21 = objc_msgSend(v13, "copy");
        identifier = v17->_identifier;
        v17->_identifier = (NSString *)v21;

      }
      v23 = objc_msgSend(v12, "copy");
      dataPath = v17->_dataPath;
      v17->_dataPath = (NSString *)v23;

      objc_storeStrong((id *)&v17->_localizationBundle, a5);
      v25 = objc_msgSend(v15, "copy");
      tableName = v17->_tableName;
      v17->_tableName = (NSString *)v25;

      if (PFArchiveFileIsAppleInternal::onceToken[0] != -1)
        dispatch_once(PFArchiveFileIsAppleInternal::onceToken, &__block_literal_global_10545);
      if (PFArchiveFileIsAppleInternal::isAppleInternal)
      {
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "BOOLForKey:", CFSTR("PFDefaultSceneTaxonomyIsDenylistDisabled"));

        if (v28)
          v18->_forceIndexed = 1;
      }
    }
    goto LABEL_17;
  }
  +[PFSceneTaxonomy dataArchivePathForIdentifier:bundle:]((uint64_t)PFSceneTaxonomy, v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {

    goto LABEL_4;
  }
  if (a7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 260, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v14, "bundlePath");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v33 = v13;
    v34 = 2112;
    v35 = v30;
    _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "error reading scene taxonomy data archive with identifier %@ from %@", buf, 0x16u);

  }
  v18 = 0;
LABEL_17:

  return v18;
}

- (unint64_t)nodeCount
{
  if (-[PFSceneTaxonomy loadOrCreateIndex](self, "loadOrCreateIndex"))
    return *((_QWORD *)self->_nameMap + 4);
  else
    return 0;
}

- (NSString)digest
{
  NSString *v3;

  if (-[PFSceneTaxonomy loadOrCreateIndex](self, "loadOrCreateIndex"))
    v3 = self->_digest;
  else
    v3 = 0;
  return v3;
}

- (void)rootNodeRef
{
  return -[PFSceneTaxonomy nodeRefForName:](self, "nodeRefForName:", CFSTR("|_ROOT_|"));
}

- (void)nodeRefForSceneClassId:(unsigned int)a3
{
  return -[PFSceneTaxonomy nodeRefForExtendedSceneClassId:](self, "nodeRefForExtendedSceneClassId:", a3);
}

- (void)nodeRefForExtendedSceneClassId:(unint64_t)a3
{
  void *result;
  int64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v10;
  _BYTE *v11;
  _BYTE v12[8];
  unint64_t v13;
  uint64_t v14;

  v13 = a3;
  if (!-[PFSceneTaxonomy loadOrCreateIndex](self, "loadOrCreateIndex"))
    return 0;
  boost::unordered::detail::table<boost::unordered::detail::map<boost::interprocess::allocator<std::pair<unsigned long long const,boost::interprocess::offset_ptr<pf::SceneTaxonomyNode,long,unsigned long,0ul>>,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>,unsigned long long,boost::interprocess::offset_ptr<pf::SceneTaxonomyNode,long,unsigned long,0ul>,boost::hash<unsigned long long>,std::equal_to<unsigned long long>>>::find_node_impl<unsigned long long,std::equal_to<unsigned long long>>(&v14, (uint64_t)self->_sceneMap, a3, (uint64_t *)&v13);
  result = 0;
  v6 = (char *)&v14 - v12;
  if (v14 == 1)
    v6 = 0;
  v7 = v6 + v14;
  v8 = &v12[v7];
  if (v7 != 1 && v8 != 0)
  {
    v10 = *((_QWORD *)v8 + 1);
    v11 = &v8[v10 + 8];
    if (v10 == 1)
      return 0;
    else
      return v11;
  }
  return result;
}

- (void)nodeRefForName:(id)a3
{
  id v4;
  BOOL v5;
  BOOL v6;
  const void *nameMap;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  char *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18[4];
  uint64_t v19;
  _BYTE v20[32];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PFSceneTaxonomy loadOrCreateIndex](self, "loadOrCreateIndex");
  if (v4)
    v6 = v5;
  else
    v6 = 0;
  if (v6)
  {
    if ((unint64_t)objc_msgSend(v4, "length") >= 0x201)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("name must be %ld characters or less: %@"), 512, v4);
    boost::interprocess::basic_managed_heap_memory<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>::basic_managed_heap_memory((uint64_t)v18);
    nameMap = self->_nameMap;
    v8 = (char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    if (v18[0])
      v9 = v18[0] - (_QWORD)&v16;
    else
      v9 = 1;
    v16 = v9;
    boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>::basic_string((uint64_t)v20, v8, &v16);
    v10 = boost::hash<boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>>::operator()((uint64_t)v20);
    v11 = 265 * ((~v10 + (v10 << 21)) ^ ((~v10 + (v10 << 21)) >> 24));
    boost::unordered::detail::table<boost::unordered::detail::map<boost::interprocess::allocator<std::pair<boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>> const,pf::SceneTaxonomyNode>,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>,boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>,pf::SceneTaxonomyNode,boost::hash<boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>>,std::equal_to<boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>>>>::find_node_impl<boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>,std::equal_to<boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>>>(&v19, (uint64_t)nameMap, 2147483649u * ((21 * (v11 ^ (v11 >> 14))) ^ ((21 * (v11 ^ (v11 >> 14))) >> 28)), (uint64_t)v20);
    v12 = (char *)&v19 - (char *)&v17;
    if (v19 == 1)
      v12 = 0;
    v17 = v12 + v19;
    boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>::~basic_string((uint64_t)v20);
    if (v17 == 1)
      v13 = 0;
    else
      v13 = (char *)&v18[-1] + v17;
    if (v13)
      v14 = v13 + 32;
    else
      v14 = 0;
    boost::interprocess::basic_managed_heap_memory<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>::~basic_managed_heap_memory(v18);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)extendedSceneClassIdForName:(id)a3
{
  _QWORD *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = -[PFSceneTaxonomy nodeRefForName:](self, "nodeRefForName:", a3);
  if (v3)
    return *v3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v5 = 136446210;
    v6 = "-[PFSceneTaxonomy extendedSceneClassIdForName:]";
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "PFSceneTaxonomyErrorReturn in %{public}s.", (uint8_t *)&v5, 0xCu);
  }
  return -1;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  NSString *tableName;
  const __CFString *dataPath;
  uint64_t v7;
  void *v8;
  void *v9;

  if (-[PFSceneTaxonomy loadOrCreateIndex](self, "loadOrCreateIndex"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = objc_opt_class();
    tableName = self->_tableName;
    if (self->_dataPath)
      dataPath = (const __CFString *)self->_dataPath;
    else
      dataPath = CFSTR("<default>");
    v7 = *((_QWORD *)self->_nameMap + 4);
    -[PFSceneTaxonomy digest](self, "digest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> data:%@ tableName:%@, count:%lu, digest:%@"), v4, self, dataPath, tableName, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return (NSString *)v9;
}

- (id)localizedStringForKey:(id)a3
{
  id v4;
  NSBundle *localizationBundle;
  void *v6;
  id v7;

  v4 = a3;
  if (v4 && (localizationBundle = self->_localizationBundle) != 0 && self->_tableName)
  {
    -[NSBundle localizedStringForKey:value:table:](localizationBundle, "localizedStringForKey:value:table:", v4, CFSTR("NO LOC"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(CFSTR("NO LOC"), "isEqualToString:", v6) & 1) != 0
      || (objc_msgSend(CFSTR("NULL"), "isEqualToString:", v6) & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      v7 = v6;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unique_ptr<pf::ArchiveLineParser,)archiveLineParserForIndexPath:(id)a3
{
  pf::SceneTaxonomyLineParser **v3;
  pf::SceneTaxonomyLineParser **v5;
  id v6;
  pf::SceneTaxonomyLineParser *v7;
  const char *v8;
  char *v9;
  size_t v10;
  unique_ptr<pf::ArchiveLineParser, std::default_delete<pf::ArchiveLineParser>> v11;
  id v12;

  v5 = v3;
  v6 = a3;
  v7 = (pf::SceneTaxonomyLineParser *)operator new();
  v12 = objc_retainAutorelease(v6);
  v8 = (const char *)objc_msgSend(v12, "fileSystemRepresentation");
  v9 = -[PFSceneTaxonomy magic](self);
  if (self)
    v10 = 36;
  else
    v10 = 0;
  pf::SceneTaxonomyLineParser::SceneTaxonomyLineParser(v7, v8, v9, v10, self->_forceIndexed);
  *v5 = v7;

  return v11;
}

- (const)indexLabel
{
  if (self->_dataPath)
    return "test scene taxonomy";
  else
    return "scene taxonomy";
}

- (id)indexName
{
  NSString *dataPath;
  void *v4;
  void *v5;
  uint64_t v6;

  dataPath = self->_dataPath;
  if (dataPath)
  {
    -[NSString lastPathComponent](dataPath, "lastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByDeletingPathExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[PFSceneTaxonomy indexNameForIdentifier:forArchivePath:]((uint64_t)PFSceneTaxonomy, self->_identifier, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (self->_forceIndexed)
  {
    objc_msgSend(v5, "stringByAppendingString:", CFSTR("-forced"));
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return v5;
}

- (id)dataArchivePath
{
  NSString *dataPath;
  NSString *v3;
  NSBundle *localizationBundle;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  dataPath = self->_dataPath;
  if (dataPath)
  {
    v3 = dataPath;
    return v3;
  }
  localizationBundle = self->_localizationBundle;
  if (!localizationBundle)
  {
    v9.receiver = self;
    v9.super_class = (Class)PFSceneTaxonomy;
    -[PFCachingArchiveIndex dataArchivePath](&v9, sel_dataArchivePath);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  +[PFSceneTaxonomy dataArchivePathForIdentifier:bundle:]((uint64_t)PFSceneTaxonomy, self->_identifier, localizationBundle);
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (v3)
    return v3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[PFSceneTaxonomy indexName](self, "indexName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSBundle bundlePath](self->_localizationBundle, "bundlePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v8;
    _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error finding %{public}@ data archive resource in bundle %{public}@.", buf, 0x16u);

  }
  return 0;
}

- (unint64_t)indexFileVersion
{
  return 6;
}

- (BOOL)loadIndexFile:(const char *)a3 fileSize:(int64_t)a4
{
  uint64_t *v7;
  uint64_t v8;
  unint64_t v9;
  NSObject *v10;
  const char *v11;
  uint32_t v12;
  char *v13;
  unsigned __int8 v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t *v19;
  int *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  const void *v26;
  uint64_t v27;
  const void *v28;
  int v29;
  uint64_t *value;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  _BYTE *v36;
  NSString *v37;
  NSString *digest;
  NSString *identifier;
  NSString *v40;
  char *v41;
  unint64_t v42;
  uint64_t *v43;
  _BYTE buf[24];
  unint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = (uint64_t *)operator new();
  boost::interprocess::basic_managed_mapped_file<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>::basic_managed_mapped_file(v7, a3);
  v43 = v7;
  v8 = *v7;
  v9 = *(_QWORD *)(*v7 + 48) + 8;
  if (v9 > a4)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
LABEL_38:
      v34 = 1;
      goto LABEL_39;
    }
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a4;
    v10 = MEMORY[0x1E0C81028];
    v11 = "PFSceneTaxonomy cache corruption/truncation: stored size %lld != actual file size %lld.";
    goto LABEL_4;
  }
  v41 = 0;
  v13 = -[PFSceneTaxonomy magic](self);
  if (!PFArchiveFileMagicFound((const char *)(v8 - 8), "PFSceneTaxonomy", v13, 0x400uLL, (const char **)&v41))
    goto LABEL_38;
  v14 = atomic_load(s_skipChecksumValidation);
  if ((v14 & 1) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "PFChecksum PFSceneTaxonomy SKIPPED", buf, 2u);
    }
  }
  else
  {
    if (self)
      v15 = 36;
    else
      v15 = 0;
    v16 = PFChecksumArchiveData((char *)(*v43 - 8), *(_QWORD *)(*v43 + 48) + 8, v41, v15);
    v17 = *(_QWORD *)&v41[v15];
    if (v16 != v17)
    {
      v18 = v16;
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_38;
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v18;
      v10 = MEMORY[0x1E0C81028];
      v11 = "PFSceneTaxonomy checksum fail, found %016llx expected %016llx";
LABEL_4:
      v12 = 22;
LABEL_5:
      _os_log_error_impl(&dword_1A16EE000, v10, OS_LOG_TYPE_ERROR, v11, buf, v12);
      goto LABEL_38;
    }
  }
  v19 = v43;
  v20 = (int *)boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>::priv_find_impl<int>(*v43, "version");
  v21 = *v19;
  *(_OWORD *)&buf[8] = xmmword_1A17B6C50;
  v45 = 0x80000001A17B7D41 & 0x7FFFFFFFFFFFFFFFLL;
  *(_QWORD *)buf = off_1E45A1130;
  v42 = 0;
  if ("digest" == (char *)-1)
    v22 = boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>::priv_generic_find<char>(v21, (char *)(0x80000001A17B7D41 & 0x7FFFFFFFFFFFFFFFLL), v21 + 88, (uint64_t)buf, &v42);
  else
    v22 = boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>::priv_generic_find<char>(v21, "digest", v21 + 56, (uint64_t)buf, &v42);
  v23 = v22;
  v24 = *v19;
  *(_OWORD *)&buf[8] = xmmword_1A17B6C60;
  v45 = 0x80000001A17B7558 & 0x7FFFFFFFFFFFFFFFLL;
  *(_QWORD *)buf = off_1E45A11F0;
  v42 = 0;
  if ("names" == (char *)-1)
    v25 = boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>::priv_generic_find<char>(v24, (char *)(0x80000001A17B7558 & 0x7FFFFFFFFFFFFFFFLL), v24 + 88, (uint64_t)buf, &v42);
  else
    v25 = boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>::priv_generic_find<char>(v24, "names", v24 + 56, (uint64_t)buf, &v42);
  v26 = (const void *)v25;
  v27 = *v19;
  *(_OWORD *)&buf[8] = xmmword_1A17B6C60;
  v45 = 0x80000001A17B790ALL & 0x7FFFFFFFFFFFFFFFLL;
  *(_QWORD *)buf = off_1E45A0A80;
  v42 = 0;
  if ("scenes" == (char *)-1)
    v28 = (const void *)boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>::priv_generic_find<char>(v27, (char *)(0x80000001A17B790ALL & 0x7FFFFFFFFFFFFFFFLL), v27 + 88, (uint64_t)buf, &v42);
  else
    v28 = (const void *)boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>::priv_generic_find<char>(v27, "scenes", v27 + 56, (uint64_t)buf, &v42);
  if (!v20 || !v23 || !v26 || !v28)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_38;
    *(_WORD *)buf = 0;
    v10 = MEMORY[0x1E0C81028];
    v11 = "SceneTaxonomy index missing one or more required regions.";
    v12 = 2;
    goto LABEL_5;
  }
  v29 = *v20;
  if (v29 != 6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v29;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unsupported SceneTaxonomy index version: %d.", buf, 8u);
    }
    goto LABEL_38;
  }
  value = (uint64_t *)self->_backingFile.__ptr_.__value_;
  self->_backingFile.__ptr_.__value_ = v19;
  v43 = value;
  self->_nameMap = v26;
  self->_sceneMap = v28;
  if ((*(_BYTE *)(v23 + 8) & 1) != 0)
  {
    v33 = v23 - (_QWORD)buf + 9;
  }
  else
  {
    v31 = *(_QWORD *)(v23 + 24);
    v32 = v23 + 24 - (_QWORD)buf;
    if (v31 == 1)
      v32 = 0;
    v33 = v32 + v31;
  }
  if (v33 == 1)
    v36 = 0;
  else
    v36 = &buf[v33];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v36, 8, 64);
  v37 = (NSString *)objc_claimAutoreleasedReturnValue();
  digest = self->_digest;
  self->_digest = v37;

  identifier = self->_identifier;
  if (identifier && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v40 = self->_digest;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v40;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = identifier;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "using SceneTaxonomy digest %@ for identifier: %@", buf, 0x16u);
  }
  v34 = 0;
LABEL_39:
  std::unique_ptr<boost::interprocess::basic_managed_mapped_file<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>::reset[abi:ne180100]((uint64_t *)&v43);
  return v34 == 0;
}

- (BOOL)loadOrCreateIndex
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PFSceneTaxonomy;
  -[PFCachingArchiveIndex loadOrCreateIndex](&v4, sel_loadOrCreateIndex);
  return self->_nameMap && self->_sceneMap != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digest, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_localizationBundle, 0);
  objc_storeStrong((id *)&self->_dataPath, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  std::unique_ptr<boost::interprocess::basic_managed_mapped_file<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>::reset[abi:ne180100]((uint64_t *)&self->_backingFile);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (char)magic
{
  int v2;
  id v3;
  BOOL v4;
  int v5;
  int v6;
  char *v7;
  void *v9;
  int v10;
  int v11;
  stat v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = objc_msgSend(a1, "architectureHash");
  objc_msgSend(a1, "dataArchivePath");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if (stat((const char *)objc_msgSend(v3, "fileSystemRepresentation"), &v12))
    v4 = 0;
  else
    v4 = (v12.st_mode & 0x8000u) != 0;
  v5 = v4;

  if (v5)
  {
    v6 = ((unint64_t)(v12.st_mtimespec.tv_sec ^ v12.st_size) >> 32) ^ LODWORD(v12.st_mtimespec.tv_sec) ^ LODWORD(v12.st_size);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "dataArchivePath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *__error();
      *(_DWORD *)buf = 138543618;
      v14 = v9;
      v15 = 1024;
      v16 = v10;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to get file metadata from dataArchivePath %{public}@: %d.", buf, 0x12u);

    }
    v6 = 0;
  }
  v11 = v2;
  v7 = -[PFSceneTaxonomy magic]::buffer;
  snprintf(-[PFSceneTaxonomy magic]::buffer, 0x50uLL, "%s%s%02x%08x%08x", "PFSceneTaxonomy", "02", 6, v11, v6);
  return v7;
}

+ (id)dataArchivePathForIdentifier:(void *)a3 bundle:
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_opt_self();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  +[PFSceneTaxonomy indexNameForIdentifier:forArchivePath:](v6, v4, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathForResource:ofType:", v7, CFSTR("bz2"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (__CFString)indexNameForIdentifier:(int)a3 forArchivePath:
{
  id v4;
  void *v5;
  __CFString *v6;

  v4 = a2;
  objc_opt_self();
  if (!v4 && a3)
  {
    +[PFSceneTaxonomy latestTaxonomyIdentifier](PFSceneTaxonomy, "latestTaxonomyIdentifier");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v4)
  {
    objc_msgSend(CFSTR("PFSceneTaxonomyData"), "stringByAppendingString:", CFSTR("_"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", v4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = CFSTR("PFSceneTaxonomyData");
  }

  return v6;
}

void __41__PFSceneTaxonomy_initWithLatestTaxonomy__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", CFSTR("PFSceneTaxonomyIdentifierOverride"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_storeStrong((id *)&-[PFSceneTaxonomy initWithLatestTaxonomy]::identifier, v1);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v4 = 138412290;
      v5 = v1;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "using scene taxonomy identifier override: %@", (uint8_t *)&v4, 0xCu);
    }
  }
  else
  {
    +[PFSceneTaxonomy latestTaxonomyIdentifier](PFSceneTaxonomy, "latestTaxonomyIdentifier");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)-[PFSceneTaxonomy initWithLatestTaxonomy]::identifier;
    -[PFSceneTaxonomy initWithLatestTaxonomy]::identifier = v2;

  }
}

+ (NSString)latestTaxonomyIdentifier
{
  return (NSString *)CFSTR("99");
}

@end
