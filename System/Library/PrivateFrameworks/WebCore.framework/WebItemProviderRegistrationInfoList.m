@implementation WebItemProviderRegistrationInfoList

- (WebItemProviderRegistrationInfoList)init
{
  char *v2;
  id v3;
  const void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WebItemProviderRegistrationInfoList;
  v2 = -[WebItemProviderRegistrationInfoList init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = (const void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;
    if (v4)
      CFRelease(v4);
    *(_OWORD *)(v2 + 40) = *MEMORY[0x1E0C9D820];
    *((_QWORD *)v2 + 3) = 0;
  }
  return (WebItemProviderRegistrationInfoList *)v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WebItemProviderRegistrationInfoList;
  -[WebItemProviderRegistrationInfoList dealloc](&v3, sel_dealloc);
}

- (void)addData:(id)a3 forType:(id)a4
{
  WebItemProviderDataRegistrar *v5;

  v5 = -[WebItemProviderDataRegistrar initWithData:type:]([WebItemProviderDataRegistrar alloc], "initWithData:type:", a3, a4);
  objc_msgSend(self->_representations.m_ptr, "addObject:", v5);
  if (v5)
    CFRelease(v5);
}

- (void)addRepresentingObject:(id)a3
{
  WebItemProviderWritableObjectRegistrar *v4;

  v4 = -[WebItemProviderWritableObjectRegistrar initWithObject:]([WebItemProviderWritableObjectRegistrar alloc], "initWithObject:", a3);
  objc_msgSend(self->_representations.m_ptr, "addObject:", v4);
  if (v4)
    CFRelease(v4);
}

- (void)addPromisedType:(id)a3 fileCallback:(id)a4
{
  WebItemProviderPromisedFileRegistrar *v5;

  v5 = -[WebItemProviderPromisedFileRegistrar initWithType:callback:]([WebItemProviderPromisedFileRegistrar alloc], "initWithType:callback:", a3, a4);
  objc_msgSend(self->_representations.m_ptr, "addObject:", v5);
  if (v5)
    CFRelease(v5);
}

- (unint64_t)numberOfItems
{
  return objc_msgSend(self->_representations.m_ptr, "count");
}

- (id)itemAtIndex:(unint64_t)a3
{
  if (-[WebItemProviderRegistrationInfoList numberOfItems](self, "numberOfItems") <= a3)
    return 0;
  else
    return (id)objc_msgSend(self->_representations.m_ptr, "objectAtIndex:", a3);
}

- (void)enumerateItems:(id)a3
{
  unint64_t v5;

  if (-[WebItemProviderRegistrationInfoList numberOfItems](self, "numberOfItems"))
  {
    v5 = 0;
    do
    {
      (*((void (**)(id, id, unint64_t))a3 + 2))(a3, -[WebItemProviderRegistrationInfoList itemAtIndex:](self, "itemAtIndex:", v5), v5);
      ++v5;
    }
    while (v5 < -[WebItemProviderRegistrationInfoList numberOfItems](self, "numberOfItems"));
  }
}

- (NSItemProvider)itemProvider
{
  NSItemProvider *result;
  void *v4;
  void *m_ptr;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  int64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  result = -[WebItemProviderRegistrationInfoList numberOfItems](self, "numberOfItems");
  if (result)
  {
    v4 = (void *)objc_opt_new();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    m_ptr = self->_representations.m_ptr;
    v6 = objc_msgSend(m_ptr, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(m_ptr);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "registerItemProvider:", v4);
        }
        v6 = objc_msgSend(m_ptr, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }
    objc_msgSend(v4, "setSuggestedName:", -[WebItemProviderRegistrationInfoList suggestedName](self, "suggestedName"));
    -[WebItemProviderRegistrationInfoList preferredPresentationSize](self, "preferredPresentationSize");
    objc_msgSend(v4, "setPreferredPresentationSize:");
    v9 = -[WebItemProviderRegistrationInfoList preferredPresentationStyle](self, "preferredPresentationStyle");
    if (v9 == 2)
      v10 = 2;
    else
      v10 = v9 == 1;
    objc_msgSend(v4, "setPreferredPresentationStyle:", v10);
    objc_msgSend(v4, "setTeamData:", -[WebItemProviderRegistrationInfoList teamData](self, "teamData"));
    return (NSItemProvider *)(id)CFMakeCollectable(v4);
  }
  return result;
}

- (id)description
{
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  v11 = objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  objc_msgSend((id)v7[5], "appendFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__WebItemProviderRegistrationInfoList_description__block_invoke;
  v5[3] = &unk_1E3486490;
  v5[4] = &v6;
  -[WebItemProviderRegistrationInfoList enumerateItems:](self, "enumerateItems:", v5);
  objc_msgSend((id)v7[5], "appendString:", CFSTR(">"));
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__WebItemProviderRegistrationInfoList_description__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "appendString:", CFSTR(", "));
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "appendString:", objc_msgSend(a2, "description"));
}

- (CGSize)preferredPresentationSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredPresentationSize.width;
  height = self->_preferredPresentationSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredPresentationSize:(CGSize)a3
{
  self->_preferredPresentationSize = a3;
}

- (NSString)suggestedName
{
  return self->_suggestedName;
}

- (void)setSuggestedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)preferredPresentationStyle
{
  return self->_preferredPresentationStyle;
}

- (void)setPreferredPresentationStyle:(int64_t)a3
{
  self->_preferredPresentationStyle = a3;
}

- (NSData)teamData
{
  return self->_teamData;
}

- (void)setTeamData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_representations.m_ptr;
  self->_representations.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
