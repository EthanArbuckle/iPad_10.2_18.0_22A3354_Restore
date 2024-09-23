@implementation OpenURLTarget

- (OpenURLTarget)init
{
  return -[OpenURLTarget initWithTargetIdentifier:](self, "initWithTargetIdentifier:", 0);
}

- (OpenURLTarget)initWithTargetIdentifier:(id)a3
{
  id v4;
  OpenURLTarget *v5;
  OpenURLTarget *v6;
  id v7;
  int64_t v8;
  __int128 *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OpenURLTarget;
  v5 = -[OpenURLTarget init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_applicationState = 0;
    v5->_targetIndex = 0x7FFFFFFFFFFFFFFFLL;
    v7 = objc_alloc_init(MEMORY[0x24BE08A08]);
    v8 = 0;
    v9 = &__OpenURLTargetData;
    do
    {
      if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)v9))
      {
        v6->_applicationState = objc_msgSend(v7, "applicationStateForApplication:", v4);
        *(_OWORD *)&v6->_targetData.clientIdentifier = *v9;
        v6->_targetData.secureScheme = (NSString *)*((_QWORD *)v9 + 2);
        v6->_targetIndex = v8;
        goto LABEL_8;
      }
      ++v8;
      v9 = (__int128 *)((char *)v9 + 24);
    }
    while (v8 != 9);
    if (v6->_targetIndex == 0x7FFFFFFFFFFFFFFFLL)
    {

      v6 = 0;
    }
LABEL_8:
    objc_msgSend(v7, "invalidate");

  }
  return v6;
}

- (int64_t)compare:(id)a3
{
  unsigned int applicationState;
  int v5;
  int v6;
  int v8;
  int64_t targetIndex;
  int64_t v11;
  BOOL v12;
  BOOL v13;
  int64_t v14;

  applicationState = self->_applicationState;
  v5 = applicationState == 8 || applicationState == 32;
  v6 = *((_DWORD *)a3 + 2);
  v8 = v6 == 8 || v6 == 32;
  if (v5 == v8)
  {
    targetIndex = self->_targetIndex;
    v11 = *((_QWORD *)a3 + 5);
    v12 = targetIndex == v11;
    v13 = targetIndex < v11;
    v14 = -1;
    if (!v13)
      v14 = 1;
    if (v12)
      return 0;
    else
      return v14;
  }
  else if (v5)
  {
    return -1;
  }
  else
  {
    return 1;
  }
}

- (id)copyURLForURL:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("http")) & 1) != 0)
  {
    v6 = 24;
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("https")))
    {
      v7 = 0;
LABEL_9:
      v11 = (void *)objc_msgSend(v4, "copy");
      goto LABEL_10;
    }
    v6 = 32;
  }
  v7 = *(id *)((char *)&self->super.isa + v6);
  if (!v7)
    goto LABEL_9;
  objc_msgSend(v4, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "substringFromIndex:", objc_msgSend(v5, "length"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v10);
  if (!v11)
    goto LABEL_9;
LABEL_10:

  return v11;
}

- (id)description
{
  unsigned int applicationState;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  applicationState = self->_applicationState;
  v4 = CFSTR("Unknown");
  switch(applicationState)
  {
    case 1u:
      v4 = CFSTR("Terminated");
      break;
    case 2u:
      v4 = CFSTR("Background Task Suspended");
      break;
    case 3u:
    case 5u:
    case 6u:
    case 7u:
      break;
    case 4u:
      v4 = CFSTR("Background Running");
      break;
    case 8u:
      v4 = CFSTR("Foreground Running");
      break;
    default:
      v5 = CFSTR("Foreground Running Obscured");
      if (applicationState != 32)
        v5 = CFSTR("Unknown");
      if (applicationState == 16)
        v4 = CFSTR("Process Server");
      else
        v4 = v5;
      break;
  }
  v6 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)OpenURLTarget;
  -[OpenURLTarget description](&v10, sel_description);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: (%@, %@)"), v7, self->_targetData.clientIdentifier, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
