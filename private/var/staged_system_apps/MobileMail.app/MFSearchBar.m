@implementation MFSearchBar

- (MFSearchBar)initWithFrame:(CGRect)a3
{
  MFSearchBar *v3;
  MFSearchBar *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFSearchBar;
  v3 = -[MFSearchBar initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    sub_100044D1C(v3);
  return v4;
}

- (MFSearchBar)initWithCoder:(id)a3
{
  id v4;
  MFSearchBar *v5;
  MFSearchBar *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MFSearchBar;
  v5 = -[MFSearchBar initWithCoder:](&v8, "initWithCoder:", v4);
  v6 = v5;
  if (v5)
    sub_100044D1C(v5);

  return v6;
}

- (NSArray)representedObjects
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchBar searchTextField](self, "searchTextField"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tokens"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchBar searchTextField](self, "searchTextField"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tokens"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ef_map:", &stru_100522710));
    objc_msgSend(v3, "addObjectsFromArray:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchBar text](self, "text"));
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchBar text](self, "text"));
    objc_msgSend(v3, "addObject:", v12);

  }
  v13 = objc_msgSend(v3, "copy");

  return (NSArray *)v13;
}

- (int64_t)_dataOwnerForPaste
{
  return 3;
}

- (int64_t)_dataOwnerForCopy
{
  return 3;
}

- (void)setRepresentedObjects:(id)a3
{
  void *v4;
  char *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v17 = a3;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchBar searchTextField](self, "searchTextField"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "tokens"));
  v5 = (char *)objc_msgSend(v4, "count");

  while ((uint64_t)v5 > 0)
    objc_msgSend(v18, "removeTokenAtIndex:", --v5);
  -[MFSearchBar setText:](self, "setText:", 0);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "reverseObjectEnumerator"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v9);
        v11 = objc_opt_class(MUISuggestionToken);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
        {
          v12 = v10;
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "image"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "title"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[UISearchToken tokenWithIcon:text:](UISearchToken, "tokenWithIcon:text:", v13, v14));

          objc_msgSend(v15, "setRepresentedObject:", v12);
          objc_msgSend(v18, "insertToken:atIndex:", v15, 0);

        }
        else
        {
          v16 = objc_opt_class(NSString);
          if ((objc_opt_isKindOfClass(v10, v16) & 1) == 0)
            goto LABEL_14;
          -[MFSearchBar setText:](self, "setText:", v10);
          v12 = (id)objc_claimAutoreleasedReturnValue(-[MFSearchBar delegate](self, "delegate"));
          objc_msgSend(v12, "searchBar:textDidChange:", self, v10);
        }

LABEL_14:
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

}

- (NSArray)selectedRepresentedObjects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchBar searchTextField](self, "searchTextField"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchBar searchTextField](self, "searchTextField"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectedTextRange"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tokensInRange:", v6));

  if (objc_msgSend(v7, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ef_map:", &stru_100522730));
    objc_msgSend(v3, "addObjectsFromArray:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchBar searchTextField](self, "searchTextField"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectedTextRange"));
  v11 = objc_msgSend(v10, "isEmpty");

  if ((v11 & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchBar searchTextField](self, "searchTextField"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchBar searchTextField](self, "searchTextField"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "selectedTextRange"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "textInRange:", v14));
    objc_msgSend(v3, "addObject:", v15);

  }
  v16 = objc_msgSend(v3, "copy");

  return (NSArray *)v16;
}

- (NSArray)representedSuggestionTokens
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchBar representedObjects](self, "representedObjects"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ef_filter:", &stru_100522750));

  return (NSArray *)v3;
}

- (void)replaceSearchBarWithTokens:(id)a3 userQueryString:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchBar searchTextField](self, "searchTextField"));
  objc_msgSend(v7, "setText:", &stru_100531B00);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ef_map:", &stru_100522790));
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v7, "setText:", v6);
  objc_msgSend(v7, "setTokens:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tokens"));
  v10 = (char *)objc_msgSend(v9, "count");

  if (v10 && !objc_msgSend(v6, "length"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "positionOfTokenAtIndex:", v10 - 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endOfDocument"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textRangeFromPosition:toPosition:", v11, v12));
    objc_msgSend(v7, "setSelectedTextRange:", v13);

  }
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (BOOL)showsProgress
{
  return self->_showsProgress;
}

- (void)setShowsProgress:(BOOL)a3
{
  self->_showsProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
}

@end
