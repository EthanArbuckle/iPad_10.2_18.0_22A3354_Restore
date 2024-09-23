@implementation REMCRMutableAttributedString

- (REMCRMutableAttributedString)initWithBackingStore:(id)a3
{
  id v5;
  REMCRMutableAttributedString *v6;
  REMCRMutableAttributedString *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMCRMutableAttributedString;
  v6 = -[REMCRMutableAttributedString init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_backingStore, a3);

  return v7;
}

- (id)string
{
  void *v2;
  void *v3;

  -[REMCRMutableAttributedString backingStore](self, "backingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  void *v6;
  void *v7;

  -[REMCRMutableAttributedString backingStore](self, "backingStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributesAtIndex:effectiveRange:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSUInteger v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSUInteger v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSUInteger v43;
  void *v44;
  uint64_t k;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t m;
  uint64_t v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  id obj;
  uint64_t v66;
  uint64_t v67;
  NSRange v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  NSRange v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[6];
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  uint8_t v90[128];
  _BYTE buf[22];
  __int16 v92;
  void *v93;
  __int16 v94;
  void *v95;
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;
  NSRange v99;
  NSRange v100;

  length = a3.length;
  location = a3.location;
  v98 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v68.location = location;
  v68.length = length;
  if (length)
  {
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    objc_msgSend((id)objc_opt_class(), "nonEditableAttributes");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
    if (!v67)
    {
LABEL_21:

      goto LABEL_22;
    }
    v63 = v7;
    v66 = *(_QWORD *)v86;
    do
    {
      for (i = 0; i != v67; ++i)
      {
        if (*(_QWORD *)v86 != v66)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array", v63);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMCRMutableAttributedString backingStore](self, "backingStore");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v83[0] = MEMORY[0x1E0C809B0];
        v83[1] = 3221225472;
        v83[2] = __68__REMCRMutableAttributedString_replaceCharactersInRange_withString___block_invoke;
        v83[3] = &unk_1E67FA010;
        v83[4] = self;
        v83[5] = v9;
        v12 = v10;
        v84 = v12;
        objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v9, location, v68.length, 0, v83);

        v81 = 0u;
        v82 = 0u;
        v79 = 0u;
        v80 = 0u;
        v69 = v12;
        objc_msgSend(v12, "reverseObjectEnumerator");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v79, v96, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v80;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v80 != v16)
                objc_enumerationMutation(v13);
              v18 = objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * j), "rangeValue");
              v20 = v19;
              -[REMCRMutableAttributedString backingStore](self, "backingStore");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "removeAttribute:range:", v9, v18, v20);

              -[REMCRMutableAttributedString reportDidEdit:range:changeInLength:](self, "reportDidEdit:range:changeInLength:", 1, v18, v20, 0);
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v79, v96, 16);
          }
          while (v15);
        }

        location = v68.location;
        if (objc_msgSend(v69, "count"))
        {
          +[REMLog crdt](REMLog, "crdt");
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            NSStringFromRange(v68);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218754;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v9;
            v92 = 2112;
            v93 = v23;
            v94 = 2112;
            v95 = v69;
            _os_log_impl(&dword_1B4A39000, v22, OS_LOG_TYPE_INFO, "REMCRMutableAttributedString: Deleting portion of text within a non-editable attribute range. Removing the attribute {self: %p, key: %@, replacementRange: %@, ranges: %@}", buf, 0x2Au);

          }
        }

      }
      v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
    }
    while (v67);
LABEL_20:
    v7 = v63;
    goto LABEL_21;
  }
  if (objc_msgSend(v7, "length"))
  {
    if (location)
    {
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      objc_msgSend((id)objc_opt_class(), "nonEditableAttributes");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v90, 16);
      if (!v40)
        goto LABEL_21;
      v41 = v40;
      v63 = v7;
      v42 = *(_QWORD *)v76;
      v43 = location - 1;
      v44 = v64;
      do
      {
        for (k = 0; k != v41; ++k)
        {
          if (*(_QWORD *)v76 != v42)
            objc_enumerationMutation(obj);
          v46 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * k);
          v74.location = 0;
          v74.length = 0;
          -[REMCRMutableAttributedString backingStore](self, "backingStore", v63);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "attribute:atIndex:effectiveRange:", v46, v43, &v74);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          if (v48)
          {
            if (location == v74.length + v74.location)
            {
              objc_msgSend(v44, "addObject:", v46);
            }
            else
            {
              -[REMCRMutableAttributedString backingStore](self, "backingStore");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "removeAttribute:range:", v46, v74.location, v74.length);

              -[REMCRMutableAttributedString reportDidEdit:range:changeInLength:](self, "reportDidEdit:range:changeInLength:", 1, v74.location, v74.length, 0);
              +[REMLog crdt](REMLog, "crdt");
              v50 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
              {
                v100.location = location;
                v100.length = 0;
                NSStringFromRange(v100);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                NSStringFromRange(v74);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218754;
                *(_QWORD *)&buf[4] = self;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v46;
                v92 = 2112;
                v93 = v51;
                v94 = 2112;
                v95 = v52;
                _os_log_impl(&dword_1B4A39000, v50, OS_LOG_TYPE_INFO, "REMCRMutableAttributedString: Inserting text within a non-editable attribute range. Removing the attribute {self: %p, key: %@, replacementRange: %@, attrRange: %@}", buf, 0x2Au);

                location = v68.location;
                v44 = v64;
              }

            }
          }

        }
        v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v90, 16);
      }
      while (v41);
      goto LABEL_20;
    }
    -[REMCRMutableAttributedString backingStore](self, "backingStore");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "length");

    if (v54)
    {
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      objc_msgSend((id)objc_opt_class(), "nonEditableAttributes");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v89, 16);
      if (v55)
      {
        v56 = v55;
        v57 = v7;
        v58 = *(_QWORD *)v71;
        do
        {
          for (m = 0; m != v56; ++m)
          {
            if (*(_QWORD *)v71 != v58)
              objc_enumerationMutation(obj);
            v60 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * m);
            *(_QWORD *)&buf[8] = 0;
            *(_QWORD *)buf = 0;
            -[REMCRMutableAttributedString backingStore](self, "backingStore");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "attribute:atIndex:effectiveRange:", v60, 0, buf);
            v62 = (void *)objc_claimAutoreleasedReturnValue();

            if (v62)
              objc_msgSend(v64, "addObject:", v60);

          }
          v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v89, 16);
        }
        while (v56);
        v7 = v57;
        location = v68.location;
      }
      goto LABEL_21;
    }
  }
LABEL_22:
  -[REMCRMutableAttributedString backingStore](self, "backingStore");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "length");

  -[REMCRMutableAttributedString backingStore](self, "backingStore");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "replaceCharactersInRange:withString:", location, v68.length, v7);

  -[REMCRMutableAttributedString backingStore](self, "backingStore");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMCRMutableAttributedString reportDidEdit:range:changeInLength:](self, "reportDidEdit:range:changeInLength:", 2, location, v68.length, objc_msgSend(v27, "length") - v25);

  v28 = location;
  v29 = v64;
  if (objc_msgSend(v64, "count"))
  {
    -[REMCRMutableAttributedString backingStore](self, "backingStore");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "attributesAtIndex:effectiveRange:", v28, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = (void *)objc_msgSend(v31, "mutableCopy");
    objc_msgSend(v64, "allObjects");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "removeObjectsForKeys:", v33);

    v34 = v7;
    v35 = objc_msgSend(v7, "length");
    -[REMCRMutableAttributedString backingStore](self, "backingStore");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v32, "copy");
    objc_msgSend(v36, "setAttributes:range:", v37, v28, v35);

    -[REMCRMutableAttributedString reportDidEdit:range:changeInLength:](self, "reportDidEdit:range:changeInLength:", 1, v28, v35, 0);
    +[REMLog crdt](REMLog, "crdt");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      v99.location = v28;
      v99.length = v35;
      NSStringFromRange(v99);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v64;
      v92 = 2112;
      v93 = v39;
      _os_log_impl(&dword_1B4A39000, v38, OS_LOG_TYPE_INFO, "REMCRMutableAttributedString: Non-editable attributes were extended around the insertion point, now unapply the extension to the attributes {self: %p, keys: %@, range: %@}", buf, 0x20u);

    }
    v7 = v34;
    v29 = v64;
  }

}

void __68__REMCRMutableAttributedString_replaceCharactersInRange_withString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  if (a2)
  {
    v9 = 0;
    v10 = 0;
    objc_msgSend(*(id *)(a1 + 32), "backingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "attribute:atIndex:effectiveRange:", *(_QWORD *)(a1 + 40), a3, &v9);

    v7 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v9, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
}

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  -[REMCRMutableAttributedString backingStore](self, "backingStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAttributes:range:", v7, location, length);

  -[REMCRMutableAttributedString reportDidEdit:range:changeInLength:](self, "reportDidEdit:range:changeInLength:", 1, location, length, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  REMCRMutableAttributedString *v6;

  -[REMCRMutableAttributedString backingStore](self, "backingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopyWithZone:", a3);

  v6 = -[REMCRMutableAttributedString initWithBackingStore:](+[REMCRMutableAttributedString allocWithZone:](REMCRMutableAttributedString, "allocWithZone:", a3), "initWithBackingStore:", v5);
  return v6;
}

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMCRMutableAttributedString backingStore](self, "backingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("backingStore"));

}

- (REMCRMutableAttributedString)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  REMCRMutableAttributedString *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[REMCRMutableAttributedString initWithBackingStore:](self, "initWithBackingStore:", v5);
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMCRMutableAttributedString backingStore](self, "backingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  REMCRMutableAttributedString *v4;
  REMCRMutableAttributedString *v5;
  REMCRMutableAttributedString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (REMCRMutableAttributedString *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMCRMutableAttributedString backingStore](self, "backingStore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMCRMutableAttributedString backingStore](v6, "backingStore");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {
        v12 = 1;
        v9 = v7;
      }
      else
      {
        v9 = (void *)v8;
        -[REMCRMutableAttributedString backingStore](self, "backingStore");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMCRMutableAttributedString backingStore](v6, "backingStore");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

      }
    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMCRMutableAttributedString backingStore](self, "backingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p backingStore: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (NSArray)nonEditableAttributes
{
  if (nonEditableAttributes_onceToken != -1)
    dispatch_once(&nonEditableAttributes_onceToken, &__block_literal_global_22);
  return (NSArray *)(id)nonEditableAttributes_nonEditableList;
}

void __53__REMCRMutableAttributedString_nonEditableAttributes__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  +[REMTTHashtag attributeName](REMTTHashtag, "attributeName");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)nonEditableAttributes_nonEditableList;
  nonEditableAttributes_nonEditableList = v1;

}

+ (NSSet)allowedAttributesForModel
{
  return (NSSet *)+[TTMergeableAttributedString allowlistedAttributesForModel](TTMergeableAttributedString, "allowlistedAttributesForModel");
}

- (void)reportDidEdit:(int64_t)a3 range:(_NSRange)a4 changeInLength:(int64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  id v10;

  length = a4.length;
  location = a4.location;
  -[REMCRMutableAttributedString editObserver](self, "editObserver");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mutableAttributedString:didEdit:range:changeInLength:", self, a3, location, length, a5);

}

- (REMCRMutableAttributedStringEditObserver)editObserver
{
  return (REMCRMutableAttributedStringEditObserver *)objc_loadWeakRetained((id *)&self->_editObserver);
}

- (void)setEditObserver:(id)a3
{
  objc_storeWeak((id *)&self->_editObserver, a3);
}

- (NSMutableAttributedString)backingStore
{
  return self->_backingStore;
}

- (void)setBackingStore:(id)a3
{
  objc_storeStrong((id *)&self->_backingStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingStore, 0);
  objc_destroyWeak((id *)&self->_editObserver);
}

@end
