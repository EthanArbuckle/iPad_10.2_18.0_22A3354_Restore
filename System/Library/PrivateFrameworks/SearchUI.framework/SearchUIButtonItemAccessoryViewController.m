@implementation SearchUIButtonItemAccessoryViewController

+ (BOOL)supportsRowModel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;

  v3 = a3;
  objc_msgSend(v3, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buttonItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") && (objc_msgSend(v3, "buttonItemsAreTrailing") & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v4, "contactIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v4, "phoneNumber");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v6 = 1;
      }
      else
      {
        objc_msgSend(v4, "email");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v6 = 1;
        }
        else
        {
          objc_msgSend(v4, "mapsData");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            v6 = 1;
          }
          else
          {
            objc_msgSend(v4, "location");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (v11)
            {
              v6 = 1;
            }
            else
            {
              objc_msgSend(v4, "customDirectionsPunchout");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (v12)
              {
                v6 = 1;
              }
              else
              {
                objc_msgSend(v4, "messageURL");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                if (v13)
                {
                  v6 = 1;
                }
                else
                {
                  objc_msgSend(v4, "label");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v16, "length"))
                  {
                    objc_msgSend(v4, "storeIdentifiers");
                    v15 = (void *)objc_claimAutoreleasedReturnValue();
                    v6 = objc_msgSend(v15, "count") == 0;

                  }
                  else
                  {
                    v6 = 0;
                  }

                  v13 = 0;
                }

              }
            }

          }
        }

      }
    }

  }
  return v6;
}

- (id)setupView
{
  return (id)objc_opt_new();
}

- (void)updateWithRowModel:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char **v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  SearchUIButtonItemAccessoryViewController *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v31 = self;
  v40 = *MEMORY[0x1E0C80C00];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v32 = a3;
  objc_msgSend(v32, "buttonItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (!v4)
    goto LABEL_26;
  v5 = v4;
  v6 = *(_QWORD *)v36;
  v7 = &selRef_setText_;
  v8 = 0x1E0D8C000uLL;
  v33 = 1;
  do
  {
    v9 = 0;
    v10 = v7[456];
    v34 = v5;
    do
    {
      if (*(_QWORD *)v36 != v6)
        objc_enumerationMutation(v3);
      v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v9);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "image");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12 != 0;

        objc_msgSend(v11, "title");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "length") != 0;

      }
      else
      {
        v15 = 0;
        v13 = 0;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v11, "performSelector:", v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v13)
        {
          v13 = 1;
          if (!v15)
            goto LABEL_12;
LABEL_20:
          v15 = 1;
        }
        else
        {
          objc_msgSend(v16, "toggledImage");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v13 = 1;
          }
          else
          {
            objc_msgSend(v17, "untoggledImage");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v24 != 0;

          }
          if (v15)
            goto LABEL_20;
LABEL_12:
          objc_msgSend(v17, "toggledTitle", v31);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "length"))
          {
            v15 = 1;
          }
          else
          {
            objc_msgSend(v17, "untoggledTitle");
            v20 = v6;
            v21 = v3;
            v22 = v8;
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v23, "length") != 0;

            v8 = v22;
            v3 = v21;
            v6 = v20;
            v5 = v34;
          }

        }
      }
      if (!v15 || v13)
        goto LABEL_27;
      ++v9;
    }
    while (v5 != v9);
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    v7 = &selRef_setText_;
  }
  while (v5);
LABEL_26:
  v33 = 3;
LABEL_27:

  v25 = objc_msgSend(v32, "useCompactVersionOfUI");
  -[SearchUIAccessoryViewController view](v31, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setIsCompact:", v25);

  -[SearchUIAccessoryViewController view](v31, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "buttonItems");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS"))
    v29 = 4;
  else
    v29 = 3;
  -[SearchUIAccessoryViewController feedbackDelegate](v31, "feedbackDelegate", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "updateWithButtonItems:maxButtonItems:buttonItemViewType:rowModel:feedbackDelegate:", v28, v29, v33, v32, v30);

}

- (unint64_t)type
{
  return 9;
}

- (id)buttonTypes
{
  void *v2;
  void *v3;

  -[SearchUIAccessoryViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buttonTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
