@implementation PKMapContainer

- (PKMapContainer)init
{
  PKMapContainer *v2;
  PKMapContainer *v3;
  uint64_t v4;
  NSMutableDictionary *recipientMap;
  uint64_t v6;
  NSMutableDictionary *scoreMap;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKMapContainer;
  v2 = -[PKMapContainer init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_version = 1;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    recipientMap = v3->_recipientMap;
    v3->_recipientMap = (NSMutableDictionary *)v4;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    scoreMap = v3->_scoreMap;
    v3->_scoreMap = (NSMutableDictionary *)v6;

  }
  return v3;
}

- (PKMapContainer)initWithCoder:(id)a3
{
  id v4;
  PKMapContainer *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSMutableDictionary *recipientMap;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSMutableDictionary *scoreMap;
  uint64_t v19;
  uint64_t v20;
  NSMutableDictionary *v21;
  uint64_t v22;
  NSMutableDictionary *v23;
  objc_super v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKMapContainer;
  v5 = -[PKMapContainer init](&v25, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
    v5->_version = v6;
    if (v6 == 1)
    {
      v7 = (void *)MEMORY[0x1E0C99E60];
      v8 = objc_opt_class();
      v9 = objc_opt_class();
      objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("recipientMap"));
      v11 = objc_claimAutoreleasedReturnValue();
      recipientMap = v5->_recipientMap;
      v5->_recipientMap = (NSMutableDictionary *)v11;

      v13 = (void *)MEMORY[0x1E0C99E60];
      v14 = objc_opt_class();
      v15 = objc_opt_class();
      objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("scoreMap"));
      v17 = objc_claimAutoreleasedReturnValue();
      scoreMap = v5->_scoreMap;
      v5->_scoreMap = (NSMutableDictionary *)v17;

    }
    else
    {
      v19 = v6;
      PKLogFacilityTypeGetObject(0xBuLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v27 = v19;
        v28 = 2048;
        v29 = 1;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Archive version (%li) does not match current version (%li). Ignoring map values.", buf, 0x16u);
      }
    }

    if (!v5->_recipientMap)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v5->_recipientMap;
      v5->_recipientMap = (NSMutableDictionary *)v20;

    }
    if (!v5->_scoreMap)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v5->_scoreMap;
      v5->_scoreMap = (NSMutableDictionary *)v22;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", 1, CFSTR("version"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_recipientMap, CFSTR("recipientMap"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_scoreMap, CFSTR("scoreMap"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)updateWithContainer:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t m;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint8_t v62[128];
  uint8_t buf[4];
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "version") == 1)
  {
    objc_msgSend(v4, "recipientMap");
    v5 = objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    -[NSObject allKeys](v5, "allKeys");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
    v40 = v4;
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v56 != v10)
            objc_enumerationMutation(v6);
          v12 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
          -[NSObject objectForKey:](v5, "objectForKey:", v12, v40);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "hasExpired"))
          {
            -[NSObject removeObjectForKey:](v5, "removeObjectForKey:", v12);
          }
          else
          {
            -[NSMutableDictionary objectForKey:](self->_recipientMap, "objectForKey:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v14;
            if (v14 && objc_msgSend(v14, "isNewerThan:", v13))
              -[NSObject removeObjectForKey:](v5, "removeObjectForKey:", v12);
            else
              ++v9;

          }
        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
      }
      while (v8);

      v4 = v40;
      if (!v9)
      {
LABEL_27:
        objc_msgSend(v4, "scoreMap", v40);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        objc_msgSend(v23, "allKeys");
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = -[NSObject countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
        if (v25)
        {
          v26 = v25;
          v42 = 0;
          v27 = *(_QWORD *)v48;
          do
          {
            for (j = 0; j != v26; ++j)
            {
              if (*(_QWORD *)v48 != v27)
                objc_enumerationMutation(v24);
              v29 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j);
              objc_msgSend(v23, "objectForKey:", v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v30, "hasExpired"))
              {
                objc_msgSend(v23, "removeObjectForKey:", v29);
              }
              else
              {
                -[NSMutableDictionary objectForKey:](self->_scoreMap, "objectForKey:", v29);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = v31;
                if (v31 && objc_msgSend(v31, "isNewerThan:", v30))
                  objc_msgSend(v23, "removeObjectForKey:", v29);
                else
                  ++v42;

              }
            }
            v26 = -[NSObject countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
          }
          while (v26);

          v4 = v41;
          if (!v42)
            goto LABEL_52;
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          objc_msgSend(v23, "allKeys");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
          if (v34)
          {
            v35 = v34;
            v36 = *(_QWORD *)v44;
            do
            {
              for (k = 0; k != v35; ++k)
              {
                if (*(_QWORD *)v44 != v36)
                  objc_enumerationMutation(v33);
                v38 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * k);
                objc_msgSend(v23, "objectForKey:", v38);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary setObject:forKey:](self->_scoreMap, "setObject:forKey:", v39, v38);

              }
              v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
            }
            while (v35);
          }

          PKLogFacilityTypeGetObject(0xBuLL);
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v64 = v42;
            _os_log_impl(&dword_18FC92000, v24, OS_LOG_TYPE_DEFAULT, "Loaded %lu new cached score submission dates.", buf, 0xCu);
          }
        }

LABEL_52:
        goto LABEL_55;
      }
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      -[NSObject allKeys](v5, "allKeys");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v52;
        do
        {
          for (m = 0; m != v18; ++m)
          {
            if (*(_QWORD *)v52 != v19)
              objc_enumerationMutation(v16);
            v21 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * m);
            -[NSObject objectForKey:](v5, "objectForKey:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](self->_recipientMap, "setObject:forKey:", v22, v21);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
        }
        while (v18);
      }

      PKLogFacilityTypeGetObject(0xBuLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v64 = v9;
        _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Loaded %lu new cached recipients.", buf, 0xCu);
      }
    }

    goto LABEL_27;
  }
  PKLogFacilityTypeGetObject(0xBuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v64 = objc_msgSend(v4, "version");
    v65 = 2048;
    v66 = 1;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Refusing to update map container with container (version %li) that does not match current version (%li).", buf, 0x16u);
  }
LABEL_55:

}

- (void)removeAllObjects
{
  -[NSMutableDictionary removeAllObjects](self->_recipientMap, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_scoreMap, "removeAllObjects");
}

- (NSMutableDictionary)recipientMap
{
  return self->_recipientMap;
}

- (NSMutableDictionary)scoreMap
{
  return self->_scoreMap;
}

- (int64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreMap, 0);
  objc_storeStrong((id *)&self->_recipientMap, 0);
}

@end
