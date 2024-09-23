@implementation RCBuiltinRecordingsFolder

- (NSString)uuid
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_folderType);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (id)builtInFolderWithType:(int64_t)a3
{
  void *v4;
  void *v5;

  if ((unint64_t)a3 > 3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(a1, "allBuiltInFolders");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (NSArray)allBuiltInFolders
{
  if (allBuiltInFolders_onceToken != -1)
    dispatch_once(&allBuiltInFolders_onceToken, &__block_literal_global_17);
  return (NSArray *)(id)allBuiltInFolders_allBuiltInFolders;
}

- (int64_t)folderType
{
  return self->_folderType;
}

void __46__RCBuiltinRecordingsFolder_allBuiltInFolders__block_invoke()
{
  uint64_t v0;
  RCBuiltinRecordingsFolder *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v0 = 0;
  v9 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  do
  {
    v1 = [RCBuiltinRecordingsFolder alloc];
    v2 = -[RCBuiltinRecordingsFolder initWithType:](v1, "initWithType:", v0, v7, v8);
    v3 = (void *)*((_QWORD *)&v7 + v0);
    *((_QWORD *)&v7 + v0) = v2;

    ++v0;
  }
  while (v0 != 4);
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", &v7, 4);
  v5 = (void *)allBuiltInFolders_allBuiltInFolders;
  allBuiltInFolders_allBuiltInFolders = v4;

  for (i = 24; i != -8; i -= 8)
}

- (RCBuiltinRecordingsFolder)initWithType:(int64_t)a3
{
  RCBuiltinRecordingsFolder *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RCBuiltinRecordingsFolder;
  result = -[RCBuiltinRecordingsFolder init](&v5, sel_init);
  if (result)
    result->_folderType = a3;
  return result;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[RCBuiltinRecordingsFolder name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> name = %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (RCFolderIdentifier)folderControllerID
{
  return (RCFolderIdentifier *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_folderType);
}

- (NSString)name
{
  unint64_t folderType;

  folderType = self->_folderType;
  if (folderType > 3)
    return (NSString *)&stru_1E769F848;
  else
    return &off_1E769D5E8[folderType]->isa;
}

- (int64_t)rank
{
  return self->_folderType;
}

- (BOOL)containsRecording:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  v5 = v4;
  switch(self->_folderType)
  {
    case 1:
      v6 = objc_msgSend(v4, "favorite");
      goto LABEL_8;
    case 2:
      if ((objc_msgSend(v4, "recordedOnWatch") & 1) != 0)
        goto LABEL_6;
      v6 = objc_msgSend(v5, "watchOS");
LABEL_8:
      v8 = v6;
      break;
    case 3:
      objc_msgSend(v4, "deletionDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7 != 0;

      break;
    case 4:
      v8 = 0;
      break;
    default:
LABEL_6:
      v8 = 1;
      break;
  }

  return v8;
}

@end
