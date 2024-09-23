@implementation PPLPeopleEntityMetadata

- (PPLPeopleEntityMetadata)initWithURL:(id)a3
{
  id v6;
  PPLPeopleEntityMetadata *v7;
  id *p_isa;
  PPLPeopleEntityMetadata *v9;
  NSObject *v10;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLPeopleEntityMetadata.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

  }
  v13.receiver = self;
  v13.super_class = (Class)PPLPeopleEntityMetadata;
  v7 = -[PPLPeopleEntityMetadata init](&v13, sel_init);
  p_isa = (id *)&v7->super.isa;
  if (!v7)
    goto LABEL_6;
  if (-[PPLPeopleEntityMetadata _isValidURL:](v7, "_isValidURL:", v6))
  {
    objc_storeStrong(p_isa + 1, a3);
LABEL_6:
    v9 = p_isa;
    goto LABEL_10;
  }
  PPLPeopleViewServiceLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[PPLPeopleEntityMetadata initWithURL:].cold.1((uint64_t)v6, v10);

  v9 = 0;
LABEL_10:

  return v9;
}

- (BOOL)_isValidURL:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  BOOL v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("people"));

  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v3, 0);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v6, "queryItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v18 = v6;
      v10 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v12, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "isEqualToString:", CFSTR("contactIdentifier")))
          {

          }
          else
          {
            objc_msgSend(v12, "name");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("priorities"));

            if (!v15)
            {
              v16 = 0;
              goto LABEL_15;
            }
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v9)
          continue;
        break;
      }
      v16 = 1;
LABEL_15:
      v6 = v18;
    }
    else
    {
      v16 = 1;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)initWithURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_216B10000, a2, OS_LOG_TYPE_ERROR, "this url is not supported: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
