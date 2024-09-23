@implementation WebUIAlert

- (WebUIAlert)initWithType:(int)a3 title:(id)a4 bodyText:(id)a5 defaultAction:(int)a6 otherAction:(int)a7 tableAction:(int)a8
{
  id v14;
  id v15;
  WebUIAlert *v16;
  WebUIAlert *v17;
  uint64_t v18;
  NSString *title;
  uint64_t v20;
  NSString *bodyText;
  objc_super v23;

  v14 = a4;
  v15 = a5;
  v23.receiver = self;
  v23.super_class = (Class)WebUIAlert;
  v16 = -[WebUIAlert init](&v23, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_type = a3;
    v18 = objc_msgSend(v14, "copy");
    title = v17->_title;
    v17->_title = (NSString *)v18;

    v20 = objc_msgSend(v15, "copy");
    bodyText = v17->_bodyText;
    v17->_bodyText = (NSString *)v20;

    v17->_otherAction = a7;
    v17->_defaultAction = a6;
    v17->_tableAction = a8;
    v17->_hideAction = a6;
  }

  return v17;
}

- (WebUIAlert)initWithType:(int)a3 title:(id)a4 defaultAction:(int)a5 otherAction:(int)a6 tableAction:(int)a7
{
  return -[WebUIAlert initWithType:title:bodyText:defaultAction:otherAction:tableAction:](self, "initWithType:title:bodyText:defaultAction:otherAction:tableAction:", *(_QWORD *)&a3, a4, 0, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
}

- (WebUIAlert)initWithType:(int)a3 title:(id)a4 bodyText:(id)a5 defaultAction:(int)a6 otherAction:(int)a7
{
  return -[WebUIAlert initWithType:title:bodyText:defaultAction:otherAction:tableAction:](self, "initWithType:title:bodyText:defaultAction:otherAction:tableAction:", *(_QWORD *)&a3, a4, a5, *(_QWORD *)&a6, *(_QWORD *)&a7, 0);
}

- (WebUIAlert)initWithType:(int)a3 title:(id)a4 defaultAction:(int)a5 otherAction:(int)a6
{
  return -[WebUIAlert initWithType:title:bodyText:defaultAction:otherAction:tableAction:](self, "initWithType:title:bodyText:defaultAction:otherAction:tableAction:", *(_QWORD *)&a3, a4, 0, *(_QWORD *)&a5, *(_QWORD *)&a6, 0);
}

- (id)_buttonTitleForAction:(int)a3
{
  void *v3;

  switch(a3)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
      _WBSLocalizedString();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

- (NSArray)buttonTitles
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (self->_otherAction)
  {
    -[WebUIAlert _buttonTitleForAction:](self, "_buttonTitleForAction:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  if (self->_defaultAction)
  {
    -[WebUIAlert _buttonTitleForAction:](self, "_buttonTitleForAction:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  return (NSArray *)v3;
}

- (int)actionForButtonTag:(int64_t)a3
{
  int otherAction;

  if (a3 == 1)
    return self->_defaultAction;
  if (a3)
    return 0;
  otherAction = self->_otherAction;
  if (!otherAction)
    return self->_defaultAction;
  return otherAction;
}

- (void)setIdentities:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *identities;
  NSArray *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __SecIdentity *v13;
  CFStringRef v14;
  __CFString *v15;
  NSArray *titles;
  SecCertificateRef certificateRef;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (NSArray *)objc_msgSend(v4, "copy");
  identities = self->_identities;
  self->_identities = v5;

  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    v7 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(__SecIdentity **)(*((_QWORD *)&v18 + 1) + 8 * v12);
          certificateRef = 0;
          if (!SecIdentityCopyCertificate(v13, &certificateRef))
          {
            v14 = SecCertificateCopySubjectSummary(certificateRef);
            if (v14)
            {
              v15 = (__CFString *)v14;
              -[NSArray addObject:](v7, "addObject:", v14);

            }
            CFRelease(certificateRef);
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    titles = self->_titles;
    self->_titles = v7;

  }
}

- (void)setSelectedTableItemIndex:(int64_t)a3
{
  self->_indexOfSelectedIdentity = a3;
}

- (id)selectedIdentity
{
  void *v3;
  unint64_t indexOfSelectedIdentity;

  if (-[NSArray count](self->_identities, "count") == 1)
  {
    -[NSArray firstObject](self->_identities, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    indexOfSelectedIdentity = self->_indexOfSelectedIdentity;
    if ((indexOfSelectedIdentity & 0x8000000000000000) != 0
      || indexOfSelectedIdentity >= -[NSArray count](self->_identities, "count"))
    {
      v3 = 0;
    }
    else
    {
      -[NSArray objectAtIndexedSubscript:](self->_identities, "objectAtIndexedSubscript:", self->_indexOfSelectedIdentity);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int)type
{
  return self->_type;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (int)defaultAction
{
  return self->_defaultAction;
}

- (int)tableAction
{
  return self->_tableAction;
}

- (int)hideAction
{
  return self->_hideAction;
}

- (void)setHideAction:(int)a3
{
  self->_hideAction = a3;
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong(&self->_context, a3);
}

- (NSArray)identities
{
  return self->_identities;
}

- (NSArray)titles
{
  return self->_titles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_identities, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_actionHandler, 0);
}

@end
