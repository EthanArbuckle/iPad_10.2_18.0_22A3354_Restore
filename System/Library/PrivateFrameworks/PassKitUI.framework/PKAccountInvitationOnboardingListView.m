@implementation PKAccountInvitationOnboardingListView

- (PKAccountInvitationOnboardingListView)initWithConfigurations:(id)a3
{
  id v4;
  PKAccountInvitationOnboardingListView *v5;
  NSArray *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSArray *listContentViews;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKAccountInvitationOnboardingListView;
  v5 = -[PKAccountInvitationOnboardingListView init](&v21, sel_init);
  if (v5)
  {
    v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
          v13 = objc_alloc(MEMORY[0x1E0DC39B0]);
          v14 = (void *)objc_msgSend(v13, "initWithConfiguration:", v12, (_QWORD)v17);
          -[PKAccountInvitationOnboardingListView addSubview:](v5, "addSubview:", v14);
          -[NSArray addObject:](v6, "addObject:", v14);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v9);
    }

    listContentViews = v5->_listContentViews;
    v5->_listContentViews = v6;

  }
  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = self->_listContentViews;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "sizeThatFits:", width + -16.0, height, (_QWORD)v17);
        v10 = v10 + v13;
        -[NSArray firstObject](self->_listContentViews, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 != v14)
          v10 = v10 + 10.0;
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
  }

  v15 = width;
  v16 = v10;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)layoutSubviews
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  CGFloat v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CGRect slice;
  CGRect remainder;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;
  CGRect v20;

  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)PKAccountInvitationOnboardingListView;
  -[PKAccountInvitationOnboardingListView layoutSubviews](&v17, sel_layoutSubviews);
  -[PKAccountInvitationOnboardingListView bounds](self, "bounds");
  remainder = v20;
  memset(&slice, 0, sizeof(slice));
  CGRectDivide(v20, &slice, &remainder, 16.0, CGRectMinXEdge);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_listContentViews;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "sizeThatFits:", remainder.size.width, remainder.size.height, (_QWORD)v11);
        CGRectDivide(remainder, &slice, &remainder, v9, CGRectMinYEdge);
        objc_msgSend(v8, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
        -[NSArray lastObject](self->_listContentViews, "lastObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8 != v10)
          CGRectDivide(remainder, &slice, &remainder, 10.0, CGRectMinYEdge);
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v18, 16);
    }
    while (v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listContentViews, 0);
}

@end
